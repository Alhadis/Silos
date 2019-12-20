import "librg.odin";
when ODIN_OS == "windows" do import win32 "core:sys/windows.odin";
import "core:fmt.odin";

on_connect_accepted :: proc(event: ^librg.Event) {
	fmt.println("spawning player...");
}

main :: proc() {
	ctx := librg.Ctx{};

	ctx.tick_delay = 32;
	ctx.mode       = librg.MODE_CLIENT;
	ctx.world_size = librg.Vector3{5000, 5000, 0};
	ctx.max_entities = 15000;
	ctx.max_connections = 16;

	librg.init(&ctx);

	defer librg.free(&ctx);

	librg.event_add(&ctx, librg.Event_Types.Connection_Accept, on_connect_accepted);

	librg.network_start(&ctx, librg.make_address("localhost", 27010));

	for {
		librg.tick(&ctx);
		win32.sleep(1);
	}
}