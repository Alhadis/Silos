package input

import "shared:odin-glfw"

import "../math"

game_input :: struct {
	keys: [348]bool,

	up, down, left, right: bool,

	mouse_pos: math.v2,
}

update :: proc(input: ^game_input, window: glfw.Window_Handle, keys: [348]bool) {
	if keys[glfw.KEY_W] {
		input.up = true;
	} else {
		input.up = false;
	}
	if keys[glfw.KEY_S] {
		input.down = true;
	} else {
		input.down = false;
	}
	if keys[glfw.KEY_A] {
		input.left = true;
	} else {
		input.left = false;
	}
	if keys[glfw.KEY_D] {
		input.right = true;
	} else {
		input.right = false;
	}

	tempx, tempy := glfw.GetCursorPos(window);
	input.mouse_pos.x = cast(f32)tempx/100;
	input.mouse_pos.y = cast(f32)tempy/100;
}