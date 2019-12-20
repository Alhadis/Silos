package main

using import "core:fmt"
      import "core:mem"
      import "core:os"

      import wb    "shared:workbench"
      import coll  "shared:workbench/collision"
      import       "shared:workbench/platform"
using import       "shared:workbench/math"
      import imgui "shared:workbench/external/imgui"

using import "shared:workbench/logging"
using import "shared:workbench/basic"
using import "shared:workbench/types"

DEVELOPER :: true;

// todo(josh): figure out why the frame_allocator wasn't working
// frame_arena: mem.Arena;
// frame_allocator: mem.Allocator;

main_init :: proc() {
	// frame_allocator_memory := make([]u8, 2 * 1024 * 1024);
	// mem.init_arena(&frame_arena, frame_allocator_memory);
	// frame_allocator = mem.arena_allocator(&frame_arena);
	init_game();
	wb.post_render_proc = on_post_render;
	wb.on_render_object = auto_cast on_render_object;
}

main_update :: proc(dt: f32) {
	// mem.free_all(frame_allocator);

	if platform.get_input_down(.Escape) do wb.exit();

	update_game(dt);

	// assert(frame_arena.peak_used < len(frame_arena.data) / 2);
}

main_render :: proc(dt: f32) {
	draw_game(dt);
}

main_end :: proc() {
	end_game();
}



main :: proc() {
	// todo(josh): figure out why the leak check allocator wasn't working
	// leak_check_allocator: wb.Leak_Check_Allocator;
	// context.allocator = wb.leak_check_allocator(&leak_check_allocator);

	wb.make_simple_window(
		1920, 1080,
		120,
		wb.Workspace{"Tech", main_init, main_update, main_render, main_end});

	// logln(len(leak_check_allocator.mapping), " leaked allocations");
	// for ptr, loc in leak_check_allocator.mapping {
	// 	logln("--- ", loc);
	// }
}
