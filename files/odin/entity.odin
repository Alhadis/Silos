using import "shared:odin-sdl2/sdl.odin"
using import "core:math.odin"
import "shared:odin-sdl2/sdl_ttf.odin"
import "shared:odin-sdl2/sdl_image.odin"
import "core:fmt.odin"

using import "basic.odin"
using import "animator.odin"

gameObjects := make([dynamic]GameObject, 0, 10);
toRemove := make([dynamic]int, 0, 10);

// TODO a GameObject probably shouldn't have an animator, or collision by default. 
// Or maybe consider changing back to entity and handle UI as a seperate thing
GameObject :: struct {
	id : int = -1,

	transform : Transform,
	animator : ^Animator, 
	layer : int,		  

	enabled : bool = true,
	collide : bool = true,

	derived : union {
		Player,
		Bullet,
		Enemy,

		Button,
	},
}

Transform :: struct {
	position : Vec2,
	size : Vec2,
	rotation : f32,
}

Player :: struct {
	timeDead : int = 0,
	isDying : bool = false,
}

Bullet :: struct {
	velocity : Vec2,
	timeLived : int,
	damage : int = 10,
}

Enemy :: struct {
	health : int,

	derived : union {
		Default_Enemy,
	}
}

Default_Enemy :: struct {
	shootSpeed : u64 = 1000,
	lastShot : u64 = 0,
}

Button :: struct {} // TODO Buttons aren't really an entity

create_game_object :: proc() -> ^GameObject {
	go := inst(&gameObjects, GameObject{});
	return go;
}

create_player :: proc() -> ^GameObject {
	go := inst(&gameObjects, GameObject{});
	go.derived = Player{};
	return go;
}

create_bullet :: proc(velocity : Vec2) -> ^GameObject {
	go := inst(&gameObjects, GameObject{});
	go.derived = Bullet{velocity, 0};
	return go;
}

create_default_enemy :: proc(health : int) -> ^GameObject {
	go := inst(&gameObjects, GameObject{});
	go.derived = Enemy{health, Default_Enemy{}};
	return go;
}

create_button :: proc() -> ^GameObject {
	go := inst(&gameObjects, GameObject{});
	go.derived = Button{};
	return go;
}

get_entity :: proc(id : int) -> ^GameObject {
	
	for i in 0..len(gameObjects) {
		e := gameObjects[i];
		if e.id == id do return &gameObjects[i];
	}

	return nil;
}

update_entities :: proc() -> bool {

	for rm in toRemove {
		for i in 0..len(&gameObjects) {
			if gameObjects[i].id == rm {
				destroy_animator(gameObjects[i].animator);
				remove_by_index(&gameObjects, i);
			}
		}
	}

	return true;
}

remove_entity :: proc(id : int) {
	append(&toRemove, id);
}