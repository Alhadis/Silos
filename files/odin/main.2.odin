using import "shared:odin-sdl2/sdl.odin"
using import "core:math.odin"
import "shared:odin-sdl2/sdl_ttf.odin"
import "shared:odin-sdl2/sdl_image.odin"
import "core:fmt.odin"

using import "render.odin"
using import "basic.odin"
using import "input.odin"
using import "game.odin"
using import "entity.odin"
using import "physics.odin"
using import "collision.odin"

main :: proc() {

	renderer_init();
	game_init();
	basic_init();

	game_loop: for true
	{
		if !update_physics() do break;

		if !update_input() do break;

		if !update_game() do break;

		if !update_entities() do break;

		if !update_collision() do break;

		if !update_render() do break;
	}

	render.cleanup();
}

