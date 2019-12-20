package main

import	"shared:odin-glfw";
import	"shared:odin-gl";
import font_gl "shared:odin-gl_font";


import "core:fmt"

append_to_log :: proc(log: ^[dynamic]string, fmt_string: string, vals: ...any) {
	a := fmt.aprintf(fmt_string, ...vals);
	append(log, a);
}
temp_log: [dynamic]string;


mousewheel_delta := 0.0;
mousewheel_callback :: proc"c"(window: glfw.Window_Handle, dx, dy: f64) {
	mousewheel_delta = dy;
}

foreign export {
    NvOptimusEnablement: u32 = 1;
}

main :: proc() {
	//
	window_size := [2]int{900, 900};
	window := glfw.init_helper(window_size[0], window_size[1], "odin mobius", 4, 3, 0, true);
	defer glfw.Terminate();

	//
	glfw.SetScrollCallback(window, mousewheel_callback);


	//
	gl.load_up_to(4, 3, proc(p: rawptr, name: cstring) { (cast(^rawptr)p)^ = glfw.GetProcAddress(name); });

	//
	sizes := [?]int{72, 68, 64, 60, 56, 52, 48, 44, 40, 36, 32, 28, 24, 20, 16, 12};
	codepoints: [95]rune;
	for i in 0..95 do codepoints[i] = rune(32+i);
	
	font, success_font := font_gl.init_from_ttf_gl("consola.ttf", "Consola", false, sizes[...], codepoints[...]);
	if !success_font {
		return;
	}
	defer font_gl.destroy_gl(font);

	//
	font_gl.colors[0] = font_gl.Vec4{0, 0, 0, 1}; // black
	font_gl.colors[1] = font_gl.Vec4{1, 1, 1, 1}; // white
	font_gl.colors[2] = font_gl.Vec4{1, 0, 0, 1}; // blue/function names
	font_gl.colors[3] = font_gl.Vec4{0, 1, 0, 1}; // purple/numbers
	font_gl.colors[4] = font_gl.Vec4{0, 0, 1, 1}; // yellow/strings
	font_gl.update_colors(0, 5);

	// 
	program, shader_success := gl.load_shaders("vertex_shader.glsl", "fragment_shader.glsl");
	defer gl.DeleteProgram(program);

	//
	uniforms := gl.get_uniforms_from_program(program);
	defer for name, uniform in uniforms do delete(uniform.name);
	fmt.println(uniforms, uniforms["num_edges"].location);


	//
	vao: u32;
	gl.GenVertexArrays(1, &vao);

	//
	t1 := glfw.GetTime();
	num_edges := 3;
	num_subdivisions := 32;
	num_twists := 1;
	shade_mode := 0;
	space_last := false;

	rot_x, rot_y := 0.0, 0.0;

	mouse_x, mouse_y := glfw.GetCursorPos(window);
	mouse_x_prev, mouse_y_prev := glfw.GetCursorPos(window);


	//
	gl.ClearColor(1.0, 1.0, 1.0, 1.0);
	for !glfw.WindowShouldClose(window) {
		//
		for _, i in temp_log do delete(temp_log[i]);
		clear(&temp_log);

		//
		t2 := glfw.GetTime();
		dt := t2 - t1;
		t1 = t2;

		append_to_log(&temp_log, "frame time = %.3f ms", 1000*dt);

		//
		mousewheel_delta = 0.0;

		glfw.PollEvents();
		if glfw.GetKey(window, glfw.KEY_ESCAPE) do glfw.SetWindowShouldClose(window, true);

		// 
		if glfw.GetKey(window, glfw.KEY_LEFT_CONTROL) || glfw.GetKey(window, glfw.KEY_RIGHT_CONTROL) {
			num_edges = max(2, num_edges + cast(int)mousewheel_delta);
		} else if glfw.GetKey(window, glfw.KEY_LEFT_SHIFT) || glfw.GetKey(window, glfw.KEY_RIGHT_SHIFT) {
			num_twists = num_twists + cast(int)mousewheel_delta;
		} else {
			num_subdivisions = max(3, num_subdivisions + cast(int)mousewheel_delta);
		}

		if glfw.GetKey(window, glfw.KEY_SPACE) && !space_last {
			shade_mode = (shade_mode + 1) % 2;
		}
		space_last = glfw.GetKey(window, glfw.KEY_SPACE);

		mouse_x, mouse_y = glfw.GetCursorPos(window);
		if glfw.GetMouseButton(window, 0) == glfw.PRESS {
			rot_x = rot_x + (mouse_y - mouse_y_prev);
			rot_y = rot_y + (mouse_x - mouse_x_prev);
		}
		mouse_x_prev, mouse_y_prev = mouse_x, mouse_y;



		append_to_log(&temp_log, "subdivisions (SCROLL) = %d", num_subdivisions);
		append_to_log(&temp_log, "edges (CTRL+SCROLL)   = %d", num_edges);
		append_to_log(&temp_log, "twists (SHIFT+SCROLL) = %d", num_twists);
		append_to_log(&temp_log, "shade mode (SPACE)    = %s", shade_mode == 0 ? "per triangle all" : "per triangle per track");
		append_to_log(&temp_log, "");
		append_to_log(&temp_log, "rot X = %f", rot_x);
		append_to_log(&temp_log, "rot Y = %f", rot_y);

		//
		gl.Enable(gl.DEPTH_TEST);
		gl.Enable(gl.CULL_FACE);
		gl.Clear(gl.COLOR_BUFFER_BIT|gl.DEPTH_BUFFER_BIT);
		gl.CullFace(gl.BACK);

		gl.UseProgram(program);
		gl.Uniform1i(uniforms["num_edges"].location, cast(i32)num_edges);
		gl.Uniform1i(uniforms["num_subdivisions"].location, cast(i32)num_subdivisions);
		gl.Uniform1i(uniforms["num_twists"].location, cast(i32)num_twists);
		gl.Uniform1i(uniforms["shade_mode"].location, cast(i32)shade_mode);
		gl.Uniform1f(uniforms["rot_x"].location, 3.1416/180.0*cast(f32)rot_x);
		gl.Uniform1f(uniforms["rot_y"].location, 3.1416/180.0*cast(f32)rot_y);
		gl.Uniform1f(uniforms["time"].location, cast(f32)glfw.GetTime());
		gl.Uniform2f(uniforms["res"].location, cast(f32)window_size[0], cast(f32)window_size[1]);

		gl.BindVertexArray(vao);
		gl.DrawArraysInstanced(gl.TRIANGLE_STRIP, 0, 2*i32(num_subdivisions+1), i32(num_edges));

		//
		font_gl.set_state();
		at := [2]f32{0.0, 1.0};
		for s in temp_log {
			num, dx, dy := font_gl.draw_string(&font, 16, at, 0, s);
			at.y += (s == "" ? 10.0 : dy);
		}

		//
		glfw.SwapBuffers(window);


	}
}