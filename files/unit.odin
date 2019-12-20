package main

      import wb     "shared:workbench"
using import        "shared:workbench/math"
      import        "shared:workbench/platform"
      import imgui  "shared:workbench/external/imgui"
      // import "shared:workbench/ecs"

using import "shared:workbench/logging"
using import "shared:workbench/types"
using import "shared:workbench/basic"

/*

Unit_Component :: struct {
	using base: ecs.Component_Base,

	health: int,
	move_speed: f32,
	attack_cooldown: f32,

	move_speed_t: f32,
	rotation_t: f32,

	attack_range: f32,
	damage: int,
	current_attack_cooldown: f32,

	command_list: [dynamic]Unit_Command "wbml_noserialize,ecs_nocopyonclone",
}

UNIT_ACCELERATION :: 10;
UNIT_DECLERATION_BUFFER :: 0.5;
UNIT_ROTATE_SPEED :: 20;

command_list_pool: [dynamic][dynamic]Unit_Command;

Unit_Command :: union {
	Move_Command,
	Attack_Command,
	Attack_Move_Command,
}

Move_Command :: struct {
	target_position: Vec3,
}

Attack_Command :: struct {
	target: ecs.Entity,
}

Attack_Move_Command :: struct {
	target_position: Vec3,
}

init_unit :: proc(using unit: ^Unit_Component) {
	if len(command_list_pool) > 0 {
		command_list = pop(&command_list_pool);
	}
	else {
		command_list = make([dynamic]Unit_Command, 0, 10);
	}
}

deinit_unit :: proc(using unit: ^Unit_Component) {
	append(&command_list_pool, command_list);
}

update_unit :: proc(using unit: ^Unit_Component, dt: f32) {
	tf, found := ecs.get_component(e, ecs.Transform);
	assert(found);

	if current_attack_cooldown > 0 {
		current_attack_cooldown -= dt;
	}

	if len(command_list) > 0 {
		command := command_list[0];
		done := false;
		#complete
		switch kind in command {
			case Move_Command: {
				done = unit_move(unit, tf, kind.target_position, dt);
			}
			case Attack_Command: {
				target_unit, ok := ecs.get_component(kind.target, Unit_Component);
				if !ok {
					done = true;
					break;
				}

				target_unit_tf, ok2 := ecs.get_component(kind.target, ecs.Transform);
				assert(ok2);

				if length(target_unit_tf.position - tf.position) > attack_range {
					unit_move(unit, tf, target_unit_tf.position, dt);
				}
				else {
					if current_attack_cooldown <= 0 {
						target_unit.health -= damage;
						current_attack_cooldown += attack_cooldown;
					}

					if target_unit.health <= 0 {
						done = true;
						break;
					}
				}
			}
			case Attack_Move_Command: {
				unimplemented();
			}
			case: panic(tprint(kind));
		}

		if done {
			logln("done command: ", command);
			ordered_remove(&command_list, 0);
		}
	}

	if health <= 0 {
		ecs.destroy_entity(e);
	}

	// current_attack_cooldown = max(current_attack_cooldown - dt, 0);
	// if attack_target != 0 {
	// 	target_tf, ok := em_get_component(attack_target, Transform);
	// 	if ok {
	// 		if length(target_tf.position - tf.position) <= attack_range { // todo(josh): use sqr distance
	// 			target_position = tf.position;
	// 			if current_attack_cooldown <= 0 {
	// 				other_unit, ok := em_get_component(attack_target, Unit_Component);
	// 				assert(ok);
	// 				other_unit.health -= damage;
	// 				current_attack_cooldown = 1;
	// 			}
	// 		}
	// 		else {
	// 			target_position = target_tf.position;
	// 		}
	// 	}
	// 	else {
	// 		attack_target = 0;
	// 		target_position = tf.position;
	// 	}
	// }


}

unit_move :: proc(using unit: ^Unit_Component, tf: ^ecs.Transform, pos: Vec3, dt: f32) -> bool {
	reached_target := false;

	dist_to_target := length(tf.position - pos);
	if dist_to_target > 0.001 {
		if dist_to_target > UNIT_DECLERATION_BUFFER {
			move_speed_t = min(1, move_speed_t + UNIT_ACCELERATION * dt);
		}
		else {
			if len(command_list) == 1 {
				move_speed_t = dist_to_target / UNIT_DECLERATION_BUFFER;
			}
		}

		tf.position = wbm.move_towards(tf.position, pos, move_speed * move_speed_t * dt);
	}
	else {
		reached_target = true;
		if len(command_list) == 1 {
			move_speed_t = 0;
		}
		rotation_t = 0;
	}

	dir := norm(pos - tf.position);
	if length(dir) > 0 {
		rotation_t = min(1, rotation_t + UNIT_ROTATE_SPEED * dt);
		target_rot := wbm.direction_to_quaternion(dir);
		tf.rotation = wbm.slerp(tf.rotation, target_rot, UNIT_ROTATE_SPEED * dt);
	}

	return reached_target;
}

unit_move_command :: proc(using unit: ^Unit_Component, pos: Vec3, queue: bool) {
	if !queue do clear(&command_list);
	cmd := Move_Command{pos};
	append(&command_list, cmd);
	logln("issued command: ", cmd);
}

unit_attack_command :: proc(using unit: ^Unit_Component, target: ecs.Entity, queue: bool) {
	if !queue do clear(&command_list);
	cmd := Attack_Command{target};
	append(&command_list, cmd);
	logln("issued command: ", cmd);
}

*/