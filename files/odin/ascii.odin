import "core:fmt.odin"
import "core:os.odin"
import "core:strings.odin"
import "core:math.odin"

import "shared:odin-glfw/glfw.odin"
import "shared:odin-gl/gl.odin"

import "shared:odin-al/al.odin";
import "shared:odin-al/alc.odin";

export "events.odin"

/*
TODO:
	- Implement the ability to have padding in the font texture so that we dont
	  get scaling artifacts.

	- On resize reallocate the cells and snap the window size to 
	  fit the cell grid. Call it responsive mode, add procs to get width and height.
	  Probably add a responsive mode resize event.
	  	Then implement a text editor, because why not, you already have the buffer dick nugget


	- Implement the ability to set a scale value, use float, prefer integer

	- Add more events

*/

Color :: struct #packed {
	r, g, b: f32,
}

BLACK      := Color{0.0, 0.0, 0.0};
WHITE      := Color{1.0, 1.0, 1.0};
LIGHT_GRAY := Color{0.5, 0.5, 0.5};
RED        := Color{1.0, 0.0, 0.0};
GREEN      := Color{0.0, 1.0, 0.0};

Glyph :: struct #packed {
	char: u32 = ' ',
	fg: Color = Color{0.5, 0.5, 0.5},
	bg: Color = Color{0.0, 0.0, 0.0},
}

Font :: struct {
	cell_w: int,
	cell_h: int,
	texture_width: i32,
	texture_height: i32,
	texture: u32,
}

Sound :: struct {
	source: u32,
	buffer: u32,
	data: ^i16,
}

when ODIN_OS == "windows" {
	foreign import "force_optimus.lib";

	foreign force_optimus {
		please_link_me :: proc() #cc_c ---;
	}
}

init :: proc(title: string, window_width, window_height: int, width, height: int, font: string, cell_w, cell_h: int, vsync: bool = true, resizable: bool = false, maximized: bool = false) -> bool {
	if glfw.Init() == 0 {
		fmt.printf("Failed to init GLFW!");
		return false;
	}

	when ODIN_OS == "windows" do please_link_me();

	ascii_state.width = width;
	ascii_state.height = height;

	glfw.WindowHint(glfw.RESIZABLE, resizable ? glfw.TRUE : glfw.FALSE);
	//glfw.WindowHint(glfw.MAXIMIZED, maximized ? glfw.TRUE : glfw.FALSE);
	glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 3);
	glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 3);

	title_p := strings.new_c_string(title);
	defer free(title_p);
	// ascii_state.window = glfw.CreateWindow(cast(i32) (width*cell_w), cast(i32) (height*cell_h), title_p, nil, nil);
	ascii_state.window = glfw.CreateWindow(cast(i32) (window_width), cast(i32) (window_height), title_p, nil, nil);
	if ascii_state.window == nil {
		fmt.printf("Failed to create glfw window!");
		return false;
	}

	glfw.MakeContextCurrent(ascii_state.window);
	set_proc_address :: proc(p: rawptr, name: string) {
		(cast(^rawptr)p)^ = rawptr(glfw.GetProcAddress(&name[0]));
	}
	gl.load_up_to(3, 3, set_proc_address);

	glfw.SwapInterval(vsync ? 1 : 0);

	_init_callbacks();

	if maximized do glfw.MaximizeWindow(ascii_state.window);

	_print_gl_info();

	ascii_state.glyphs = make([]Glyph, width*height);
	for i := 0; i < len(ascii_state.glyphs); i += 1 {
		ascii_state.glyphs[i] = Glyph{};
	}

	ascii_state.font_shader = _load_shader("font.vert", "font.frag");

	ascii_state.uniforms = gl.get_uniforms_from_program(ascii_state.font_shader);

	gl.ClearColor(1, 0, 1, 1);

	gl.GenBuffers(1, &ascii_state.vbo);
	gl.GenBuffers(1, &ascii_state.cbo);
	gl.GenBuffers(1, &ascii_state.ibo);
	gl.GenVertexArrays(1, &ascii_state.vao);	

	set_font(font, cell_w, cell_h);

	_update_gl();

	_setup_sound();

	return true;
}

set_font :: proc(path: string, cell_w, cell_h: int) {
	font := _load_font(path, cell_w, cell_h);

	// changed because resons
	//glfw.SetWindowSize(ascii_state.window, cast(i32)(ascii_state.width*cell_w), cast(i32)(ascii_state.height*cell_h));	

	ascii_state.font = font;
}

set_glyph :: proc(x, y: int, glyph: Glyph) {
	if x < 0 || x >= ascii_state.width || y < 0 || y >= ascii_state.height do return;
	ascii_state.glyphs[x + y * ascii_state.width] = glyph;
}

set_glyph :: proc(x, y: int, char: u32, fg, bg: Color) {
	if x < 0 || x >= ascii_state.width || y < 0 || y >= ascii_state.height do return;
	ascii_state.glyphs[x + y * ascii_state.width].char = char;
	ascii_state.glyphs[x + y * ascii_state.width].fg = fg;
	ascii_state.glyphs[x + y * ascii_state.width].bg = bg;
}

update_and_render :: proc() {
	gl.UseProgram(ascii_state.font_shader);

	// Save the uniform location and don't look them up every
	// god damn frame like a jackass
	//gl.UniformMatrix4fv(ascii_state.uniforms["projection"].location, 1, gl.FALSE, &ascii_state.projection[0][0]);
	proj := "projection\x00";
	gl.UniformMatrix4fv(gl.GetUniformLocation(ascii_state.font_shader, &proj[0]), 1, gl.FALSE, &ascii_state.projection[0][0]);

	cells_w := "cells_w\x00";
	cells_h := "cells_h\x00";
	gl.Uniform1ui(gl.GetUniformLocation(ascii_state.font_shader, &cells_w[0]), cast(u32)ascii_state.font.cell_w);
	gl.Uniform1ui(gl.GetUniformLocation(ascii_state.font_shader, &cells_h[0]), cast(u32)ascii_state.font.cell_h);

	font_w := "font_width\x00";
	font_h := "font_height\x00";
	gl.Uniform1ui(gl.GetUniformLocation(ascii_state.font_shader, &font_w[0]), cast(u32)ascii_state.font.texture_width);
	gl.Uniform1ui(gl.GetUniformLocation(ascii_state.font_shader, &font_h[0]), cast(u32)ascii_state.font.texture_height);

	sampler := "tex\x00";
	gl.Uniform1i(gl.GetUniformLocation(ascii_state.font_shader, &sampler[0]), 0);

	gl.BindVertexArray(ascii_state.vao);

	// Need to have a glyph for every vertex, not every character
	// aka every glyph needs a second copy
	gl.BindBuffer(gl.ARRAY_BUFFER, ascii_state.cbo);
	glyphs: [dynamic]Glyph;
	for i := 0; i < len(ascii_state.glyphs); i += 1 {
		append(&glyphs, ascii_state.glyphs[i]);
		append(&glyphs, ascii_state.glyphs[i]);
		append(&glyphs, ascii_state.glyphs[i]);
		append(&glyphs, ascii_state.glyphs[i]);
	}
	defer free(glyphs);
	gl.BufferSubData(gl.ARRAY_BUFFER, 0, len(glyphs)*28, &glyphs[0]);

	gl.ActiveTexture(0);
	gl.BindTexture(gl.TEXTURE_2D, ascii_state.font.texture);

	gl.DrawElements(gl.TRIANGLES, ascii_state.indices_count, gl.UNSIGNED_INT, nil);

	_update();
	_swap_buffers();
}

get_time :: proc() -> f64 {
	return glfw.GetTime();
}

get_event :: proc() -> Event {
	return queue_unqueue(&ascii_state.event_queue);
}

draw_rect :: proc(x, y: int, w, h: int, char: u32, fg, bg: Color) {
	for xx := x; xx < x + w; xx += 1 {
		set_glyph(xx, y + h, char, fg, bg);
		set_glyph(xx, y, char, fg, bg);
	}
	for yy := y; yy < y + h; yy += 1 {
		set_glyph(x, yy , char, fg, bg);
		set_glyph(x+w, yy, char, fg, bg);
	}
	set_glyph(x+w, y+h, char, fg, bg);
}

draw_string :: proc(x, y: int, str: string, fg, bg: Color) {
	for c in str {
		char := cast(u32)c;
		if char > 255 do char = 255;
		set_glyph(x, y, char, fg, bg);
		x += 1;
	}
}

draw_centered_string :: proc(x, y: int, str: string, fg, bg: Color) {
	x -= len(str) / 2;
	draw_string(x, y, str, fg, bg);
}

draw_fancy_rect :: proc(x, y: int, w, h: int, top_border: u32, bottom_border: u32, left_border: u32, right_border: u32, top_left: u32, top_right: u32, bottom_left: u32, bottom_right: u32, fg, bg: Color) {
	for xx := x; xx < x + w; xx += 1 {
		set_glyph(xx, y + h, bottom_border, fg, bg);
		set_glyph(xx, y, top_border, fg, bg);
	}
	for yy := y; yy < y + h; yy += 1 {
		set_glyph(x, yy , left_border, fg, bg);
		set_glyph(x+w, yy, right_border, fg, bg);
	}

	set_glyph(x, y, top_left, fg, bg);
	set_glyph(x+w, y, top_right, fg, bg);
	set_glyph(x, y+h, bottom_left, fg, bg);
	set_glyph(x+w, y+h, bottom_right, fg, bg);
}

when ODIN_OS == "windows" {
	foreign import "dr_wav.lib";
} else {
	_ := compile_assert(false);
}

foreign dr_wav {
	drwav_open_and_read_file_s16 :: proc(filename: ^u8, channels: ^u32, sampleRate: ^u32, totalSampleCount: ^u64) -> ^i16 #cc_c ---;
	drwav_free :: proc(pDataReturnedByOpenAndRead: ^u8) #cc_c ---;
}

load_sound :: proc(filename: string) -> Sound {
	result: Sound;

	c_filename := strings.new_c_string(filename);
	defer free(c_filename);
	channels : u32;
	sample_rate : u32;
	sample_count : u64;
	result.data = drwav_open_and_read_file_s16(c_filename, &channels, &sample_rate, &sample_count);
	if result.data == nil {
		fmt.println("Failed to open sound", filename);
		os.exit(1);
	}

	al.GenBuffers(1, &result.buffer);
	al.BufferData(result.buffer, channels > 1 ? al.FORMAT_STEREO16 : al.FORMAT_MONO16, cast(^u8)result.data, cast(i32)(sample_count*2), cast(i32)sample_rate);

	al.GenSources(1, &result.source);
	al.Source3f(result.source, al.POSITION, 0, 0, 0);
	al.Source3f(result.source, al.VELOCITY, 0, 0, 0);
	al.Sourcei(result.source, al.BUFFER, cast(i32)result.buffer);

	return result;
}

play_sound :: proc(sound: Sound, loop: bool = false, gain: f32 = 1, pitch: f32 = 1) {
	al.Sourcef(sound.source, al.PITCH, pitch);
	al.Sourcef(sound.source, al.GAIN, gain);
	al.Sourcei(sound.source, al.LOOPING, loop ? al.TRUE : al.FALSE);
	al.SourcePlay(sound.source);
}

stop_sound :: proc(sound: Sound) {
	al.SourceRewind(sound.source);
}

ascii_state: struct {
	window: ^glfw.window,
	width, height: int,
	font: Font,
	glyphs: []Glyph,
	font_shader: u32,
	vbo, cbo, ibo: u32,
	vao: u32,
	uniforms: map[string]gl.Uniform_Info,
	projection: math.Mat4,
	close_window: bool,
	indices_count: i32,
	event_queue: Event_Queue,
};

_swap_buffers :: proc() {
	glfw.SwapBuffers(ascii_state.window);
	gl.Clear(gl.COLOR_BUFFER_BIT);
}

_setup_sound :: proc() {
	device := alc.OpenDevice(nil);
	if device == nil {
		fmt.println("Failed to open default audio device!");
		return;
	}

	device_name := strings.to_odin_string(alc.GetString(device, alc.DEVICE_SPECIFIER));
	fmt.println(device_name);

	audio_context := alc.CreateContext(device, nil);
	if alc.MakeContextCurrent(audio_context) == al.FALSE {
		fmt.println("Failed to make audio context current!");
		return;
	}

	al.Listener3f(al.POSITION, 0, 0, 0);
	al.Listener3f(al.VELOCITY, 0, 0, 0);
	orient := []f32 {
		0, 0, 1,
		0, 1, 0,
	};
	al.Listenerfv(al.ORIENTATION, &orient[0]);
}

_print_gl_info :: proc() {
	get_string :: proc(name: u32) -> string {
		cstr := gl.GetString(name);
		return strings.to_odin_string(cstr);
	}

	fmt.println("GL_RENDERER:", get_string(gl.RENDERER));

	fmt.println();
}

_update_gl :: proc() {

	vertices: [dynamic][2]f32;
	for y := 0; y < ascii_state.height; y += 1 {
		for x := 0; x < ascii_state.width; x += 1 {
			append(&vertices, [2]f32{cast(f32)(x+0), cast(f32)(y+0)});
			append(&vertices, [2]f32{cast(f32)(0), cast(f32)(0)});

			append(&vertices, [2]f32{cast(f32)(x+1), cast(f32)(y+0)});
			append(&vertices, [2]f32{cast(f32)(1), cast(f32)(0)});
			
			append(&vertices, [2]f32{cast(f32)(x+1), cast(f32)(y+1)});
			append(&vertices, [2]f32{cast(f32)(1), cast(f32)(1)});
			
			append(&vertices, [2]f32{cast(f32)(x+0), cast(f32)(y+1)});
			append(&vertices, [2]f32{cast(f32)(0), cast(f32)(1)});
		}
	}	

	indices: [dynamic]u32;
	offset := 0;
	for i := 0; i < ascii_state.width*ascii_state.height; i += 1 {
		append(&indices, cast(u32)(offset + 0));
		append(&indices, cast(u32)(offset + 1));
		append(&indices, cast(u32)(offset + 2));
		
		append(&indices, cast(u32)(offset + 2));
		append(&indices, cast(u32)(offset + 3));
		append(&indices, cast(u32)(offset + 0));

		offset += 4;
	}
	ascii_state.indices_count = cast(i32)len(indices);

	gl.BindVertexArray(ascii_state.vao);

	gl.EnableVertexAttribArray(0);
	gl.EnableVertexAttribArray(1);
	gl.EnableVertexAttribArray(2);
	gl.EnableVertexAttribArray(3);
	gl.EnableVertexAttribArray(4);

	gl.BindBuffer(gl.ARRAY_BUFFER, ascii_state.vbo);
	gl.BufferData(gl.ARRAY_BUFFER, 4*2*len(vertices), &vertices[0], gl.STATIC_DRAW);
	stride: i32 = 8 + 8;
	gl.VertexAttribPointer(0, 2, gl.FLOAT, gl.FALSE, stride, nil);
	ptr := 2*4;
	gl.VertexAttribPointer(1, 2, gl.FLOAT, gl.FALSE, stride, (cast(^rawptr) &ptr)^);

	gl.BindBuffer(gl.ARRAY_BUFFER, ascii_state.cbo);
	gl.BufferData(gl.ARRAY_BUFFER, len(ascii_state.glyphs)*28*4, nil, gl.DYNAMIC_DRAW);
	stride = 4 + 12 + 12;
	gl.VertexAttribIPointer(2, 1, gl.UNSIGNED_INT, stride, nil);
	ptr = 4;
	gl.VertexAttribPointer(3, 3, gl.FLOAT, gl.FALSE, stride, (cast(^rawptr) &ptr)^);
	ptr = 16;
	gl.VertexAttribPointer(4, 3, gl.FLOAT, gl.FALSE, stride, (cast(^rawptr) &ptr)^);

	gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, ascii_state.ibo);
	gl.BufferData(gl.ELEMENT_ARRAY_BUFFER, len(indices)*4, &indices[0], gl.STATIC_DRAW);

	gl.BindBuffer(gl.ARRAY_BUFFER, 0);

	free(vertices);
	free(indices);

	_update_projection_matrix();	
}

_update_projection_matrix :: proc() {
	ascii_state.projection = math.ortho3d(0, cast(f32)ascii_state.width, cast(f32)ascii_state.height, 0, -1, 1);
/*	ascii_state.projection[0][0] = 2.0 / cast(f32)(ascii_state.width-0);
	ascii_state.projection[1][1] = 2.0 / cast(f32)(ascii_state.height-0);
	ascii_state.projection[2][2] = -2.0 / cast(f32)(1.0 - -0.1);
	ascii_state.projection[3][3] = 1;

	ascii_state.projection[3][0] = -(cast(f32)(ascii_state.width+0)/cast(f32)(ascii_state.width-0));
	ascii_state.projection[3][0] = -(cast(f32)(ascii_state.height+0)/cast(f32)(ascii_state.height-0));
	ascii_state.projection[3][0] = -(cast(f32)(1+-1)/cast(f32)(1-(-1)));*/
	//ascii_state.projection = math.mat4_identity();
}

_init_callbacks :: proc() {
	ascii_state.event_queue = queue_new();

	glfw.SetWindowCloseCallback(ascii_state.window, proc(window: ^glfw.window) #cc_c {
		queue_enqueue(&ascii_state.event_queue, QuitEvent{});
	});

	glfw.SetKeyCallback(ascii_state.window, proc(window: ^glfw.window, key: i32, scancode: i32, action: i32, mods: i32) #cc_c {
		queue_enqueue(&ascii_state.event_queue, KeyEvent{
			down = (action == glfw.PRESS || action == glfw.REPEAT) ? true : false,
			repeat = action == glfw.REPEAT ? true : false,
			key = cast(Key)key,
			mods = int(mods),
			scancode = int(scancode),
		});
	});

	glfw.SetFramebufferSizeCallback(ascii_state.window, proc(window: ^glfw.window, width, height: i32) #cc_c {
		gl.Viewport(0, 0, width, height);
	});
}

_update :: proc() {
	glfw.PollEvents();
}

_load_shader :: proc(vert, frag: string) -> u32 {
	result := gl.CreateProgram();

	add_shader :: proc(program: u32, kind: u32, path: string) {
		data, ok := os.read_entire_file(path);
		if !ok {
			fmt.printf("Failed to read shader '%s'", path);
			os.exit(1);
		}

		shader := gl.CreateShader(kind);
		length := cast(i32)len(data);
		c_data := &data[0];
		gl.ShaderSource(shader, 1, &c_data, &length);
		gl.CompileShader(shader);

		glerr: i32;
		gl.GetShaderiv(shader, gl.COMPILE_STATUS, &glerr);
		if glerr != gl.TRUE {
			fmt.printf("Failed to compile shader '%s'!\n", path);
			buffer: [4096]u8;
			gl.GetShaderInfoLog(shader, 4096, nil, &buffer[0]);
			fmt.printf("GL_ERROR:\n%s\n", strings.to_odin_string(&buffer[0]));
			os.exit(2);
		}

		gl.AttachShader(program, shader);
	}

	add_shader(result, gl.VERTEX_SHADER, vert);
	add_shader(result, gl.FRAGMENT_SHADER, frag);

	gl.LinkProgram(result);
	err: i32;
	gl.GetProgramiv(result, gl.LINK_STATUS, &err);
	if err != gl.TRUE {
		fmt.printf("Failed to link program with vertex shader '%s' and fragment shader '%s'!\n", vert, frag);
		os.exit(3);
	}

	gl.ValidateProgram(result);
	gl.GetProgramiv(result, gl.VALIDATE_STATUS, &err);
	if err != gl.TRUE {
		fmt.printf("Failed to validate program with vertex shader '%s' and fragment shader '%s'!\n", vert, frag);
		os.exit(4);
	}

	return result;
}

// Replace the current font and recalculate window size, cell sizes, etc.
// _update_projection_matrix
//update_font :: proc()
when ODIN_OS == "windows" do foreign import "stb_image.lib";

foreign stb_image {
	stbi_load       :: proc(file: ^u8, x: ^i32, y: ^i32, n: ^i32, req_comp: i32) -> ^u8 #cc_c ---;
	stbi_image_free :: proc(data: ^u8) #cc_c ---;
}

when ODIN_OS == "windows" {
	foreign import "system:OpenGL32.lib";
	foreign OpenGL32 {
		glGenTextures   :: proc(n: i32, dest: ^u32) #cc_c ---;
		glBindTexture   :: proc(target: u32, texture: u32) #cc_c ---;
		glTexImage2D    :: proc(target: u32, level: i32, internalformat: i32, width: i32, height: i32, border: i32, format: u32, type_: u32, pixels: rawptr) #cc_c ---;
		glTexParameteri :: proc(target: u32, pname: u32, param: i32) #cc_c ---;
	}
} else {
	// This will most likely not work, based on the
	// fact that the gl functions will not have been loaded
	// when they are assigned...
	glGenTextures   := gl.glGenTextures;
	glBindTexture   := gl.BindTexture;
	glTexImage2D    := gl.TexImage2D;
	glTexParameteri := gl.glTexParameteri;
}

_load_font :: proc(path: string, cell_w: int, cell_h: int) -> Font {
	result: Font;

	result.cell_w = cell_w;
	result.cell_h = cell_h;

	w, h, c: i32;
	cpath := strings.new_c_string(path);
	defer free(cpath);
	data := stbi_load(cpath, &w, &h, &c, 4);
	defer stbi_image_free(data);

	result.texture_width = w;
	result.texture_height = h;

	glGenTextures(1, &result.texture);
	glBindTexture(gl.TEXTURE_2D, result.texture);

	glTexImage2D(gl.TEXTURE_2D, 0, gl.RGBA8, w, h, 0, c == 4 ? gl.RGBA : gl.RGB, gl.UNSIGNED_BYTE, data);
	glTexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
	glTexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);

	return result;
}