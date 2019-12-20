import "librg.odin";
when ODIN_OS == "windows" do import win32 "core:sys/windows.odin";
import "core:fmt.odin";

FOO :: librg.FIRST_FREE_COMPONENT;

Foo :: struct #ordered {
	bar: u32,
}

main :: proc() {
	ctx := librg.Ctx{};

	ctx.tick_delay = 32;
	ctx.mode       = librg.MODE_SERVER;
	ctx.world_size = librg.Vector3{5000, 5000, 0};
	ctx.max_entities = 15000;
	ctx.max_connections = 1000;

	librg.init(&ctx, proc(ctx: ^librg.Ctx) {
		librg.component_register(ctx, FOO, size_of(Foo));
	});

	defer librg.free(&ctx);

	librg.event_add(&ctx, librg.Event_Types.Connection_Accept, proc(event: ^librg.Event) {
		fmt.println("spawning player...");
	});

	librg.network_start(&ctx, librg.make_address("localhost", 27010));

	foo := Foo{ 32 };

	for i in 0..10000 {
		enemy := librg.entity_create(&ctx, 0);
		librg.component_attach(&ctx, FOO, enemy, &foo);

		transform := cast(^librg.Transform)librg.component_fetch(&ctx, librg.Component_Types.Transform, enemy);
		transform.position.x = 0;
		transform.position.y = 0;
	}

	for {
		librg.tick(&ctx);
		fmt.println(ctx.last_update);
		win32.sleep(1);
	}
}