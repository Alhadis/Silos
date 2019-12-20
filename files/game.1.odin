package main

using import "core:fmt"
      import "core:math/rand"
      import "core:mem"
      import "core:os"

      import wb     "shared:workbench"
using import        "shared:workbench/math"
      import        "shared:workbench/gpu"
      import        "shared:workbench/platform"
      import        "shared:workbench/wbml"
      import coll   "shared:workbench/collision"
      import wbmath "shared:workbench/math"
      import imgui  "shared:workbench/external/imgui"

using import "shared:workbench/logging"
using import "shared:workbench/types"
using import "shared:workbench/basic"

asset_catalog: wb.Asset_Catalog;

game_config: Game_Config;

update_game :: proc(dt: f32) {
	wb.check_for_file_updates(&asset_catalog);

	entity_update(dt);

	update_clouds();

	#complete switch scene_mode {
		case .Edit: {

		}

		case .Play: {
			for tile in get_entity_storage(Tile_Entity) {
				e := entity_base(tile);
				e.position = lerp(e.position, tile.target_position, 20 * dt);
				if tile.is_player {
					if platform.get_input_down(.Up) {
						move_character(tile, Vec3{0, 0, -1});
					}
					if platform.get_input_down(.Left) {
						move_character(tile, Vec3{-1, 0, 0});
					}
					if platform.get_input_down(.Down) {
						move_character(tile, Vec3{0, 0, 1});
					}
					if platform.get_input_down(.Right) {
						move_character(tile, Vec3{1, 0, 0});
					}
				}
			}
		}

		case: unreachable();
	}
}

end_game :: proc() {
	// ecs.deinit();
	wb.delete_asset_catalog(asset_catalog);

	config_wbml := wbml.serialize(&game_config);
	ok := os.write_entire_file("resources/game_config.txt", transmute([]u8)config_wbml);
	assert(ok);
}

move_character :: proc(tile: ^Tile_Entity, direction: Vec3) -> bool {
	assert(length(direction) == 1);

	target_position := tile.target_position + direction;

	can_move := true;
	for other in get_entity_storage(Tile_Entity) {
		if other == tile do continue;
		if sqr_distance(target_position, other.target_position) < 0.25 {
			if tile.can_push_on_move && other.can_be_pushed {
				// push it
				can_move = move_character(other, direction);
				break;
			}
			else {
				can_move = false;
				break;
			}
		}
	}
	if can_move {
		tile.target_position = target_position;
		return true;
	}
	return false;
}



Game_Config :: struct {
	default_material: wb.Material,

	game_camera_height: f32,
	game_camera_scroll_speed: f32,

	camera_freecam_speed: f32,
	camera_freecam_speed_fast: f32,
	camera_freecam_speed_slow: f32,

	camera_fov: f32,
	camera_position: Vec3,
	camera_rotation: Quat,
	gameplay_camera_speed: f32,
}

init_game :: proc() {
	// assets
	{
		wb.load_asset_folder("resources", &asset_catalog, "material", "txt");

		config_text, ok := asset_catalog.text_files["game_config.txt"];
		assert(ok);
		game_config = wbml.deserialize(Game_Config, transmute([]u8)config_text);

		assert("cube" notin asset_catalog.models);
		asset_catalog.models[aprint("cube")] = wb.create_cube_model();
		assert("quad" notin asset_catalog.models);
		asset_catalog.models[aprint("quad")] = wb.create_quad_model();

		init_rendering();
	}

	// camera
	{
		wb.wb_camera.is_perspective = true;
		wb.wb_camera.size = game_config.camera_fov;
		wb.wb_camera.position = game_config.camera_position;
		wb.wb_camera.rotation = game_config.camera_rotation;
	}

	// entities
	{
		entity_init();

		// add_entity_type(Tile_Entity);
		// add_entity_type(Box);
		// add_entity_type(Light);

		load_scene("main");
	}

	init_clouds();

	wb.register_debug_program("Tech", tech_program, nil);
}

tech_program :: proc(_: rawptr) {
	if imgui.begin("Tech") {
		if imgui.button("Save camera transform") {
			logln("saving ", wb.wb_camera.position);
			game_config.camera_position = wb.wb_camera.position;
			game_config.camera_rotation = wb.wb_camera.rotation;
		}
	}
	imgui.end();
}



Tile_Entity :: struct {
	base: Entity_Base,
	is_player: bool,
	can_push_on_move: bool,
	can_be_pushed: bool,
	target_position: Vec3,
}


Box :: struct {
	base: Entity_Base,
}


Light :: struct {
	base: Entity_Base,
	kind: union {
		Point_Light,
		Directional_Light,
	},
}
Point_Light :: struct {
	color: Colorf,
	intensity: f32,
}
Directional_Light :: struct {
	color: Colorf,
	intensity: f32,
}