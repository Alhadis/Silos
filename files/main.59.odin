import	"core:fmt.odin";
import	"core:math.odin";
import	"core:strings.odin";
import	"core:os.odin";

import	"shared:odin-glfw/glfw.odin";
import	"shared:odin-gl/gl.odin";
import font_gl "shared:odin-gl_font/font_opengl.odin";





main :: proc() {
	//
	window_size = [2]int{900, 900};
	window := glfw.init_helper(window_size[0], window_size[1], "odin-template", 4, 3, 0, true);
	defer glfw.Terminate();

	//
	glfw.SetWindowSizeCallback(window, windowsize_callback);
	glfw.SetCharCallback(window, char_callback);
	glfw.SetKeyCallback(window, key_callback);
	glfw.SetMouseButtonCallback(window, button_callback);
	glfw.SetCursorPosCallback(window, mouse_callback);
	glfw.SetScrollCallback(window, mousewheel_callback);

	// 
	gl.load_up_to(4, 3, proc(p: rawptr, name: cstring) do (cast(^rawptr)p)^ = glfw.GetProcAddress(name); );

	//
	sizes := [?]int{72, 68, 64, 60, 56, 52, 48, 44, 40, 36, 32, 28, 24, 20, 16, 12};
	codepoints: [95]rune;
	for i in 0..95 do codepoints[i] = rune(32+i);
	
	//font, success_font := font_gl.init_from_ttf_gl("C:/windows/fonts/consola.ttf", "Consola", false, sizes[...], codepoints[...]);
	font, success_font := font_gl.init_from_ttf_gl("consola.ttf", "Consola", false, sizes[...], codepoints[...]);
	if !success_font {
		return;
	}
	defer font_gl.destroy_gl(font);

	// 
	program, shader_success := gl.load_shaders("shaders/shader_main.vs", "shaders/shader_main.fs");
	defer gl.DeleteProgram(program);
	gl.UseProgram(program);

	//
	uniforms := gl.get_uniforms_from_program(program);
	defer for name, uniform in uniforms do free(uniform.name);


	font_gl.colors[0] = font_gl.Vec4{0, 0, 0, 1}; // black
	font_gl.colors[1] = font_gl.Vec4{1, 1, 1, 1}; // white
	font_gl.colors[2] = font_gl.Vec4{1, 0, 0, 1}; // blue/function names
	font_gl.colors[3] = font_gl.Vec4{0, 1, 0, 1}; // purple/numbers
	font_gl.colors[4] = font_gl.Vec4{0, 0, 1, 1}; // yellow/strings
	font_gl.update_colors(0, 5);

	when ODIN_OS == "windows" {
		last_vertex_time := os.last_write_time_by_name("shaders/shader_main.vs");
        last_fragment_time := os.last_write_time_by_name("shaders/shader_main.fs");
	}

	t1 := glfw.GetTime();

	// geometry
	height_walls :: 3.0;
	height_door :: 2.0;
	width_door :: 2.0;
	width_floor :: 8.0;
	length_floor :: 8.0;
	height_roof :: 4.0;
	chimney_height :: 2.0;
	chimney_x :: 3.0;
	chimney_y :: 3.0;
	chimney_z :: 6.0;

	projection_mode := 1;

	Vec3 :: [3]f32;

	vertices_strips := [9+9+10]Vec3 {
		// back wall
		Vec3{0, 0, 0},
		Vec3{(width_floor - width_door)/2, 0, 0},
		Vec3{0, 0, height_walls},
		Vec3{(width_floor - width_door)/2, 0, height_door},
		Vec3{width_floor/2, 0, height_walls + height_roof},
		Vec3{width_floor - (width_floor - width_door)/2, 0, height_door},
		Vec3{width_floor, 0, height_walls},
		Vec3{width_floor - (width_floor - width_door)/2, 0, 0},
		Vec3{width_floor, 0, 0},

		// front wall
		Vec3{width_floor, length_floor, 0},
		Vec3{width_floor - (width_floor - width_door)/2, length_floor, 0},
		Vec3{width_floor, length_floor, height_walls},
		Vec3{width_floor - (width_floor - width_door)/2, length_floor, height_door},
		Vec3{width_floor/2, length_floor, height_walls + height_roof},
		Vec3{(width_floor - width_door)/2, length_floor, height_door},
		Vec3{0, length_floor, height_walls},
		Vec3{(width_floor - width_door)/2, length_floor, 0},
		Vec3{0, length_floor, 0},

		// walls and ceiling
		Vec3{0, length_floor, 0},
		Vec3{0, 0, 0},
		Vec3{0, length_floor, height_walls},
		Vec3{0, 0, height_walls},
		Vec3{width_floor/2, length_floor, height_walls+height_roof},
		Vec3{width_floor/2, 0, height_walls+height_roof},
		Vec3{width_floor, length_floor, height_walls},
		Vec3{width_floor, 0, height_walls},
		Vec3{width_floor, length_floor, 0},
		Vec3{width_floor, 0, 0},
	};
	parts := [3]int{
		0, 9, 18
	};

	num_faces :: (9-2) + (9-2) + (10-2);
	num_vertices :: 3*num_faces;

	Vertex :: struct {
		position: Vec3,
		normal: Vec3,
	};

	vertices: [num_vertices]Vertex;

	copy_strip :: proc(vertices: []Vertex, vertices_strip: []Vec3) {
		for i in 2..len(vertices_strip) {
			vertices[3*(i-2)+0].position = vertices_strip[i-2];
			vertices[3*(i-2)+1].position = i % 2 == 1 ? vertices_strip[i-0] : vertices_strip[i-1];
			vertices[3*(i-2)+2].position = i % 2 == 1 ? vertices_strip[i-1] : vertices_strip[i-0];

			n := math.norm0(math.cross(vertices[3*(i-2)+1].position - vertices[3*(i-2)+0].position, vertices[3*(i-2)+2].position - vertices[3*(i-2)+0].position));

			vertices[3*(i-2)+0].normal = n;
			vertices[3*(i-2)+1].normal = n;
			vertices[3*(i-2)+2].normal = n;
		}
	}

	copy_strip(vertices[0..(9-2)*3], vertices_strips[0..9]);
	copy_strip(vertices[(9-2)*3..(9-2)*3+(9-2)*3], vertices_strips[9..18]);
	copy_strip(vertices[(9-2)*3+(9-2)*3..], vertices_strips[18..]);
	
	for vertex in vertices {
		fmt.println(vertex);
	}

	// 
	vao: u32;
	gl.GenVertexArrays(1, &vao);
	defer gl.DeleteVertexArrays(1, &vao);
	gl.BindVertexArray(vao);

    vbo: u32;
    gl.GenBuffers(1, &vbo);
    defer gl.DeleteBuffers(1, &vbo);

    gl.BindBuffer(gl.ARRAY_BUFFER, vbo);
    gl.BufferData(gl.ARRAY_BUFFER, size_of(vertices), &vertices[0], gl.STATIC_DRAW);

    gl.EnableVertexAttribArray(0);
    gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, size_of(Vertex), rawptr(uintptr(0)));
    gl.EnableVertexAttribArray(1);
    gl.VertexAttribPointer(1, 3, gl.FLOAT, gl.FALSE, size_of(Vertex), rawptr(uintptr(size_of(Vec3))));
	
	

    //
    Number :: enum {
    	zero,
    	half,
    	isqrt3,
    	isqrt2,
    	one,
    	sqrt2,
    	sqrt3,
    	two,
    	num
    };

    numbers_value := [8]f32 {
    	0.0,
    	0.5,
    	1.0/math.SQRT_THREE,
    	1.0/math.SQRT_TWO,
    	1.0,
    	math.SQRT_TWO,
    	math.SQRT_THREE,
    	2.0,
    };


    dir := [3]Number{Number.one, Number.one, Number.one};



	//
	gl.ClearColor(1.0, 0.7, 0.4, 1.0);
	for !glfw.WindowShouldClose(window) {
		// 
		for _, i in temp_log do free(temp_log[i]);
		clear(&temp_log);

		//
		t2 := glfw.GetTime();
		dt := t2 - t1;
		t1 = t2;
		append_to_log(&temp_log, "frame time = %f ms", dt*1000.0);


		//
		glfw.PollEvents();
		if is_key_pressed(input.keys[glfw.KEY_ESCAPE]) do glfw.SetWindowShouldClose(window, true);


		//
		when false && ODIN_OS == "windows" {
			updated: bool;
			program, last_vertex_time, last_fragment_time, updated = gl.update_shader_if_changed("shaders/shader_main.vs", "shaders/shader_main.fs", program, last_vertex_time, last_fragment_time);
		} else {
			if is_key_pressed(input.keys[glfw.KEY_F5]) {
				new_program, success := gl.load_shaders("shaders/shader_main.vs", "shaders/shader_main.fs");
				if success {
					fmt.println("Reloaded shaders.");
					gl.DeleteProgram(program);
					program = new_program;
				} else {
					fmt.println("Failed to reload shaders.");
				}
			}
		}

		for i in 0...9 {
			if is_key_pressed(input.keys[glfw.KEY_0 + i]) {
				projection_mode = i;				
			}
		}
		append_to_log(&temp_log, "projection mode = %d", projection_mode);
		append_to_log(&temp_log, "cam pos = {%s, %s, %s}", dir.x, dir.y, dir.z);



		//
		//gl.Disable(gl.DEPTH_TEST);
		gl.Enable(gl.DEPTH_TEST);
	    gl.Enable(gl.BLEND);
	    gl.BlendEquation(gl.FUNC_ADD);
	    gl.BlendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);

		gl.Clear(gl.COLOR_BUFFER_BIT|gl.DEPTH_BUFFER_BIT);
		gl.Viewport(0, 0, cast(i32)window_size[0], cast(i32)window_size[1]);

		//
		gl.UseProgram(program);

		if is_key_pressed(input.keys[glfw.KEY_Q]) {
			dir.x = (dir.x + 1) % Number.num;
		}

		if is_key_pressed(input.keys[glfw.KEY_W]) {
			dir.y = (dir.y + 1) % Number.num;
		}

		if is_key_pressed(input.keys[glfw.KEY_E]) {
			dir.z = (dir.z + 1) % Number.num;
		}

		d := math.Vec3{numbers_value[dir.x], numbers_value[dir.y], numbers_value[dir.z]};
		V := math.look_at(math.norm0(d), math.Vec3{0, 0, 0}, math.Vec3{0, 0, 1});
		P := math.ortho3d(-8.0, 8.0, -8.0, 8.0, -200.0, 200.0);
		//P := math.perspective(30*math.PI/180.0, f32(window_size[0])/f32(window_size[1]), 0.01, 100.0);
		MVP := math.mul(P, V);
		gl.UniformMatrix4fv(uniforms["MVP"].location, 1, gl.FALSE, &MVP[0][0]);

		gl.BindVertexArray(vao);

		gl.Uniform1i(uniforms["draw_mode"].location, 1);
		gl.DrawArrays(gl.TRIANGLE_STRIP, 0, 4);

		gl.Uniform1i(uniforms["draw_mode"].location, 0);
		gl.Enable(gl.CULL_FACE);
		gl.CullFace(gl.FRONT);
		gl.DrawArrays(gl.TRIANGLES, 0, num_vertices);
		gl.CullFace(gl.BACK);
		gl.DrawArrays(gl.TRIANGLES, 0, num_vertices);
		gl.Disable(gl.CULL_FACE);

		//
		font_gl.set_state();
		at := [2]f32{0.0, 1.0};
		for s in temp_log {
			num, dx, dy := font_gl.draw_string(&font, 16, at, 0, s);
			at.y += (s == "" ? 10.0 : dy);
		}

		//
		glfw.SwapBuffers(window);

		//
		input.mousewheel_delta = 0.0;
		input.mouse_position_delta = Vec2{};

		for _, i in input.buttons {
			input.buttons[i] = Input_State(input.buttons[i] & 1);
		}

		for _, i in input.keys {
			input.keys[i] = Input_State(input.keys[i] & 1);
		}
	}
}


// log
append_to_log :: proc(log: ^[dynamic]string, fmt_string: string, vals: ...any) {
	a := fmt.aprintf(fmt_string, ...vals);
	append(log, a);
}
temp_log: [dynamic]string;


// Input

Vec2 :: [2]f32;
Vec4 :: [4]f32;


// helpers, and some alias for good measure
is_state_pressed :: inline proc(state: Input_State) -> bool {
	return state & Input_State.PRESS == Input_State.PRESS;
}
is_key_pressed :: is_state_pressed;    // keyboard *key*
is_button_pressed :: is_state_pressed; // mouse *button*

is_state_down :: inline proc(state: Input_State) -> bool {
	return state & Input_State.DOWN == Input_State.DOWN;
}
is_key_down :: is_state_down;
is_button_down :: is_state_down;


Input_State :: enum u8 {
	UP          = 0b000,
	DOWN        = 0b001,
	RELEASE     = 0b010,
	PRESS       = 0b011,
	DOUBLEPRESS = 0b111,
}

input: struct {
	buttons:                  [5]Input_State,
	buttons_clicked_time:     [5]f32,

	keys:                     [512]Input_State,	
	input_runes:              [dynamic]rune,
	keys_clicked_time:        [512]f32,

	mouse_position:           Vec2,
	mouse_position_prev:      Vec2,
	mouse_position_delta:     Vec2,
	mouse_position_click:     [5]Vec2,

	mousewheel:               f32,
	mousewheel_prev:          f32,
	mousewheel_delta:         f32,
};


double_click_time := f32(0.5);
double_click_deadzone := f32(5.0);

window_size: [2]int;

// callbacks
windowsize_callback :: proc"c"(window: glfw.Window_Handle, width, height: i32) {
	fmt.println(width, height);
	window_size = [2]int{int(width), int(height)};
}

char_callback :: proc"c"(window: glfw.Window_Handle, c: u32) {
	append(&input.input_runes, rune(c));
}

key_callback :: proc"c"(window: glfw.Window_Handle, key, scancode, action, mods: i32) {
	if key < 0 || key >= 512 do return;
	if action == glfw.REPEAT do return;
	using input;
	using Input_State;
	
	// calc new state based on old state
	old_state := Input_State(keys[key] & DOWN);
	new_state := Input_State(action);
	keys[key] = new_state | ( (old_state != new_state ? 1 : 0) << 1 );

	// double tap
	current_time := f32(glfw.GetTime());
	last_time := keys_clicked_time[key];
	if ((keys[key] & 3) == 3 && current_time - last_time < double_click_time) {
		keys[key] |= Input_State(4);
		keys_clicked_time[key] = -100000.0;
	} else {
		keys[key] &= ~Input_State(4);
	}

	if (keys[key] == PRESS) {
		keys_clicked_time[key] = current_time;
	}
	//fmt.printf("key = %d = %v\n", key, keys[key]);
}

button_callback :: proc"c"(window: glfw.Window_Handle, button_, action, mods: i32) {
	using input;
	using Input_State;

	old_state := Input_State(buttons[button_] & 1);
	new_state := Input_State(action & 1);
	buttons[button_] = new_state | ( (old_state != new_state ? 1 : 0) << 1 );

	// double tap
	current_time := f32(glfw.GetTime());
	last_time := buttons_clicked_time[button_];
	if ((buttons[button_] & 3) == 3 && current_time - last_time < double_click_time && math.length(mouse_position - mouse_position_click[button_]) < double_click_deadzone) {
		buttons[button_] |= Input_State(4);
		buttons_clicked_time[button_] = -100000.0;
	} else {
		buttons[button_] &= ~Input_State(4);
	}

	if (buttons[button_] == PRESS) {
		buttons_clicked_time[button_] = current_time;

		mouse_position_click[button_] = mouse_position;
	}

	//fmt.printf("button = %d = %v,  %v %v\n", button_, buttons[button_], old_state, new_state);
}

mouse_callback :: proc"c"(window: glfw.Window_Handle, xpos, ypos: f64) {
	using input;
	mouse_position_prev = mouse_position;
	mouse_position = Vec2{f32(xpos), f32(ypos)};
	mouse_position_delta = mouse_position - mouse_position_prev;
}

mousewheel_callback :: proc"c"(window: glfw.Window_Handle, dx, dy: f64) {
	using input;
	mousewheel_prev = mousewheel;
	mousewheel += f32(dy);
	mousewheel_delta = f32(dy);
}
