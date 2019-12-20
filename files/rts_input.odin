package main

/*

      import wb "shared:workbench"
using import "shared:workbench/math"
      import "shared:workbench/gpu"
      import coll "shared:workbench/collision"
      import "shared:workbench/ecs"

      import "shared:workbench/platform"
using import "shared:workbench/basic"
using import "shared:workbench/logging"
using import "shared:workbench/types"

Input_State :: enum {
	Default,
	Selecting_Attack_Target,
}

input_state: Input_State;
mouse_pos_on_click: Vec2;
is_box_selecting: bool;
selected_units: [dynamic]ecs.Entity;
highlighted_units: [dynamic]ecs.Entity;
mouse_direction: Vec3;

update_input :: proc(dt: f32) {
	wb.wb_camera.position.y = game_config.game_camera_height;

	mouse_direction = gpu.get_mouse_direction_from_camera(&wb.wb_camera, platform.mouse_unit_position);

	clear(&highlighted_units);
	unit_under_mouse: ^Unit_Component;

	// compute unit_under_mouse and highlighted_units
	{
		units := ecs.get_component_storage(Unit_Component);
		for _, i in units {
			unit := &units[i];
			if unit.e == 0 do continue;
			if !unit.enabled do continue;

			unit_tf, foundtf := ecs.get_component(unit.e, ecs.Transform);
			assert(foundtf);
			if mouse_is_over_unit(unit, unit_tf) {
				unit_under_mouse = unit;
			}

			if mouse_selection_highlights_unit(unit, unit_tf) {
				append(&highlighted_units, unit.e);
			}
		}
	}

	do_queue_command := platform.get_input(.Left_Shift);

	#complete
	switch input_state {
		case .Default: {
			// select units
			{
				if platform.get_input_down(.Mouse_Left) {
					is_box_selecting = true;
					mouse_pos_on_click = platform.mouse_screen_position;
					clear(&selected_units);
					if unit_under_mouse != nil {
						append(&selected_units, unit_under_mouse.e);
					}
				}

				if is_box_selecting && platform.get_input(.Mouse_Left) == false {
					is_box_selecting = false;
					clear(&selected_units);
					for e in highlighted_units {
						append(&selected_units, e);
					}
					clear(&highlighted_units);
				}
			}

			// maybe issue move commands
			{
				if platform.get_input_down(.Mouse_Right) {
					hit, ok := coll.cast_line_box(wb.wb_camera.position, mouse_direction * 1000, Vec3{}, Vec3{9999, 0.00001, 9999});
					if ok {
						for e in selected_units {
							unit, found := ecs.get_component(e, Unit_Component);
							if !found do continue;
							unit_move_command(unit, hit.point0, do_queue_command);
						}
					}
				}
			}

			// maybe transition to Selecting_Attack_Target
			{
				if platform.get_input_down(.Grave_Accent) {
					input_state = .Selecting_Attack_Target;
				}
			}
		}
		case .Selecting_Attack_Target: {
			if platform.get_input_down(.Mouse_Right) {
				input_state = .Default;
			}

			if platform.get_input_down(.Mouse_Left) {
				if unit_under_mouse != nil {
					for e in selected_units {
						selected_unit, ok := ecs.get_component(e, Unit_Component);
						unit_attack_command(selected_unit, unit_under_mouse.e, do_queue_command);
					}
					input_state = .Default;
				}
			}
		}
		case: {
			panic(tprint(input_state));
		}
	}

	if input_state != .Default && platform.get_input_down(.Mouse_Right) {
		input_state = .Default;
	}

	// pan camera
	{
		if platform.get_input(.Mouse_Middle) {
			mouse_delta := platform.mouse_screen_position_delta * game_config.game_camera_scroll_speed * dt;
			wb.wb_camera.position += Vec3{-mouse_delta.x, 0, mouse_delta.y};
		}

		if      platform.get_input(.W) do wb.wb_camera.position.z -= game_config.gameplay_camera_speed * dt;
		else if platform.get_input(.S) do wb.wb_camera.position.z += game_config.gameplay_camera_speed * dt;

		if      platform.get_input(.A) do wb.wb_camera.position.x -= game_config.gameplay_camera_speed * dt;
		else if platform.get_input(.D) do wb.wb_camera.position.x += game_config.gameplay_camera_speed * dt;
	}
}

render_input :: proc() {
	if is_box_selecting {
		SELECTION_INSIDE_COLOR  := Colorf{0, 1, 0, 0.75};
		SELECTION_OUTSIDE_COLOR := Colorf{0, 1, 0, 1};

		x1 := min(mouse_pos_on_click.x, platform.mouse_screen_position.x);
		y1 := min(mouse_pos_on_click.y, platform.mouse_screen_position.y);
		x2 := max(mouse_pos_on_click.x, platform.mouse_screen_position.x);
		y2 := max(mouse_pos_on_click.y, platform.mouse_screen_position.y);
		wb.im_quad(gpu.rendermode_pixel, wb.shader_rgba_2d, Vec2{x1, y1}, Vec2{x2, y2}, SELECTION_INSIDE_COLOR, {});

		wb.im_quad(gpu.rendermode_pixel, wb.shader_rgba_2d, Vec2{x1, y1}, Vec2{x2, y1+1}, SELECTION_OUTSIDE_COLOR, {});
		wb.im_quad(gpu.rendermode_pixel, wb.shader_rgba_2d, Vec2{x1, y1}, Vec2{x1+1, y2}, SELECTION_OUTSIDE_COLOR, {});
		wb.im_quad(gpu.rendermode_pixel, wb.shader_rgba_2d, Vec2{x1, y2}, Vec2{x2, y2-1}, SELECTION_OUTSIDE_COLOR, {});
		wb.im_quad(gpu.rendermode_pixel, wb.shader_rgba_2d, Vec2{x2, y2}, Vec2{x2-1, y1}, SELECTION_OUTSIDE_COLOR, {});
	}

	when true {
		// draw unit selection colliders
		units := ecs.get_component_storage(Unit_Component);
		for unit in units {
			tf, found := ecs.get_component(unit.e, ecs.Transform);
			if !found do continue;
			wb.im_quad(gpu.rendermode_pixel, wb.shader_rgba_2d, unit_selection_minmax(tf), Colorf{0, 1, 0, 0.7}, {});
		}
	}
}

mouse_is_over_unit :: proc(unit: ^Unit_Component, unit_tf: ^ecs.Transform) -> bool {
	unit_min, unit_max := unit_selection_minmax(unit_tf);
	// todo(josh): make the unit colliders be world space instead of screen space
	mp := platform.mouse_screen_position;
	if mp.x > unit_min.x && mp.x < unit_max.x && mp.y > unit_min.y && mp.y < unit_max.y {
		return true;
	}
	return false;
}

unit_selection_minmax :: proc(tf: ^ecs.Transform) -> (min: Vec2, max: Vec2) {
	screen_pos := to_vec2(gpu.world_to_pixel(tf.position + Vec3{0, 0.5, 0}, &wb.wb_camera, platform.current_window_width, platform.current_window_height));
	return screen_pos - Vec2{75, 75}, screen_pos + Vec2{75, 75};
}

mouse_selection_highlights_unit :: proc(unit: ^Unit_Component, unit_tf: ^ecs.Transform) -> bool {
	if !is_box_selecting do return false;
	unit_min, unit_max := unit_selection_minmax(unit_tf);
	selection_min: Vec2;
	selection_max: Vec2;
	mouse_pos := platform.mouse_screen_position;
	selection_min.x = min(mouse_pos_on_click.x, platform.mouse_screen_position.x);
	selection_min.y = min(mouse_pos_on_click.y, platform.mouse_screen_position.y);
	selection_max.x = max(mouse_pos_on_click.x, platform.mouse_screen_position.x);
	selection_max.y = max(mouse_pos_on_click.y, platform.mouse_screen_position.y);

	if coll.overlap_box_box_2d(selection_min, selection_max, unit_min, unit_max) {
		return true;
	}
	return false;
}

*/