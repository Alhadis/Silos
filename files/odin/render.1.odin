package main

      import wb     "shared:workbench"
      import        "shared:workbench/gpu"
using import        "shared:workbench/math"
      import        "shared:workbench/platform"
using import        "shared:workbench/basic"
using import        "shared:workbench/logging"
using import        "shared:workbench/types"

DEFAULT_MATERIAL := wb.Material{{.1, .1, .1, 1}, {.25, .25, .25, 1}, {.25, .25, .25, 1}, 32};

init_rendering :: proc() {

}

draw_game :: proc(dt: f32) {
	if active_scene != nil {
		// push lights
		for l in get_entity_storage(Light) {
			le := entity_base(l);

			#complete
			switch kind in l.kind {
				case Point_Light: {
					if selected_entity == le {
						wb.submit_model(wb.wb_cube_model, wb.get_shader(&wb.wb_catalog, "default"), {}, {kind.color, {}, {}, {}}, le.position, Vec3{0.25, 0.25, 0.25}, Quat{0, 0, 0, 1}, {1*kind.intensity, 1*kind.intensity, 1*kind.intensity, 1*kind.intensity}, {}, le);
					}
					wb.push_point_light(le.position, kind.color, kind.intensity);
				}
				case Directional_Light: {
					wb.set_sun_data(le.rotation, kind.color, kind.intensity);
				}
			}
		}

		// push models
		for _, entity_idx in active_scene.all_entities {
			e := &active_scene.all_entities[entity_idx];
			if info, ok := getval(e.model_info); ok {
				using info;

				if shader_id == "" do continue;

				model, ok := wb.try_get_model(&asset_catalog, model_id);
				if !ok do continue;

				texture, tok := wb.try_get_texture(&asset_catalog, texture_id);
				if !tok do texture = {};

				shader := wb.get_shader(&asset_catalog, shader_id);

				wb.submit_model(model, shader, texture, DEFAULT_MATERIAL, e.position + offset, e.scale * scale, e.rotation, {1, 1, 1, 1}, {}, e);
			}
		}
	}



	// todo(josh): I think text is broken? :(
	// gpu.use_program(wb.shader_text);
	// wb.push_text(gpu.rendermode_unit, wb.default_font, "Henlo", {}, {1, 1, 1, 1}, 0.1, 0);

	{
		@static ui_camera: wb.Camera;
		@static ui_camera_initted: bool;
		if !ui_camera_initted {
			ui_camera_initted = true;
			wb.init_camera(&ui_camera, false, 10, 1920, 1080, wb.create_color_framebuffer(1920, 1080));
			ui_camera.clear_color = {0, 0, 0, 1};
			ui_camera.auto_resize_framebuffer = true;
		}

		{
			// wb.IM_PUSH_CAMERA(&ui_camera);
			// wb.im_quad(wb.rendermode_pixel, wb.get_shader(&wb.wb_catalog, "default"), {300, 300}, {500, 500}, {0, 1, 0, .82}, {});
		}

		// gpu.use_program(wb.get_shader(&wb.wb_catalog, "default"));
		// wb.draw_texture(ui_camera.framebuffer.textures[0], {0, 0}, {1, 1});
	}
}

on_post_render :: proc() {
	draw_clouds();
	entity_post_render();
}

on_render_object :: proc(e: ^Entity) {
	if e == nil do return;

	switch kind in e.derived {
		case Clouds: {
			cloud_shader := wb.get_shader(&asset_catalog, "cloud");
			if gpu.get_current_shader() == cloud_shader {
				gpu.uniform_float(cloud_shader, "cloud_density_threshold", cloud_config.cloud_density_threshold);
				gpu.uniform_float(cloud_shader, "cloud_density_multiplier", cloud_config.cloud_density_multiplier);
				gpu.uniform_float(cloud_shader, "cloud_scale", cloud_config.cloud_scale);
			}
		}
	}
}