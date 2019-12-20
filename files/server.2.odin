import "librg.odin";
when ODIN_OS == "windows" do import win32 "core:sys/windows.odin";
import "core:fmt.odin";

main :: proc() {
	ctx := librg.Ctx{};

	ctx.tick_delay = 32;
	ctx.mode       = librg.MODE_SERVER;
	ctx.world_size = librg.Vector3{5000, 5000, 0};
	ctx.max_entities = 15000;
	ctx.max_connections = 1000;

	librg.init(&ctx);

	defer librg.free(&ctx);

	librg.event_add(&ctx, librg.Event_Types.Connection_Accept, proc(event: ^librg.Event) {
		fmt.println("spawning player...");
	});

	librg.network_start(&ctx, librg.make_address("localhost\x00", 27010));

	for i in 0..10000 {
		enemy := librg.entity_create(&ctx, 0);

		foo := new(i32);
		foo^ = 42;

		enemy.user_data = cast(rawptr)foo;
		enemy.position.x = 42*cast(f32)i;
		enemy.position.y = 80*cast(f32)i;
	}

	for {
		librg.tick(&ctx);
		win32.sleep(1);
	}
}