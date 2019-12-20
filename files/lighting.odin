package main

using import "core:fmt"

      import wb "shared:workbench"
using import "shared:workbench/math"
using import "shared:workbench/logging"
using import "shared:workbench/types"
      import "shared:workbench/gpu"
      // import "shared:workbench/ecs"

/*

Light_Component :: struct {
	using base: ecs.Component_Base,
	rotate_speed: f32,
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

init_light :: proc(using light: ^Light_Component) {
	rotate_speed = 1;
	light.kind = Point_Light{
		color = {1, 1, 1, 1},
		intensity = 10,
	};
}

update_light :: proc(using light: ^Light_Component, dt: f32) {
	if move_lights {
		tf, found := ecs.get_component(e, ecs.Transform);
		assert(found);
		tf.position = Vec3{sin(wb.time * rotate_speed) * 2, 3, cos((wb.time * rotate_speed) + PI) * 2};

		switch kind in &light.kind {
			case Directional_Light: {
				tf.rotation = wbm.degrees_to_quaternion(Vec3{-60, wb.time * 20, 0});
			}
		}
	}
}

render_light :: proc(using light: ^Light_Component) {
	if true do return;

	tf, ok := ecs.get_component(light.e, ecs.Transform);
	assert(ok);
	gpu.use_program(wb.shader_rgba_3d);
	gpu.rendermode_world();
	#complete
	switch light_kind in light.kind {
		case Point_Light: {
			gpu.draw_model(asset_catalog.models["cube"], tf.position, Vec3{1, 1, 1} * .1, Quat{0, 0, 0, 1}, {}, light_kind.color, true);
		}
		case Directional_Light: {
			gpu.draw_model(asset_catalog.models["cube"], tf.position, Vec3{1, 1, 1} * .1, Quat{0, 0, 0, 1}, {}, light_kind.color, true);
		}
		case: panic(tprint(light_kind));
	}
}

*/