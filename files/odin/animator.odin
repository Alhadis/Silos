using import "core:math.odin"
import "core:os.odin"
import "core:fmt.odin"

using import "shared:odin-sdl2/sdl.odin"
import "shared:odin-sdl2/sdl_image.odin"

using import "basic.odin"

Animator :: struct {
	sprites : [dynamic]^Texture,
	index : int,
	rate : u64,
	last_update : u64,
	repeat : bool = true
}

get_current :: proc(animator : ^Animator) -> ^Texture {
	using animator;
	now := cast(u64)get_ticks();

	if now >= last_update + rate {
		index += 1;
		last_update = now;
	}

	if repeat {
		index = index % len(&sprites);
		return sprites[index];
	} else if index < len(&sprites) {
		return sprites[index];
	} else {
		return nil;
	}
}

create_animator_d :: proc(sprites : [dynamic]^Texture, rate : u64) -> ^Animator {
	anim := new(Animator);
	anim.sprites = sprites;
	anim.rate = rate;
	anim.index = 0;
	anim.last_update = 0;
	return anim;
}

create_animator_s :: proc(sprite : ^Texture) -> ^Animator {
	sprites := make([dynamic]^Texture,0, 1);
	append(&sprites, sprite);
	anim := new(Animator);
	anim.sprites = sprites;
	anim.index = 0;
	anim.rate = 0;
	anim.last_update = 0;
	return anim;
}

create_animator :: proc [
	create_animator_s,create_animator_d,
];

destroy_animator :: proc(animator : ^Animator) {
	/*for i in 0..len(&animator.sprites-1) {
		destroy_texture(animator.sprites[i]);
	}*/
}