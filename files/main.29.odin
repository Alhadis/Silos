package main

import "core:fmt"
import "core:strings"
import "core:mem"
import "core:math"
using import "mylib"
//import brew "shared:libbrew"
import gl "shared:odin-gl"
//import sdl "shared:odin-sdl2"
//import sdlttf "shared:odin-sdl2/ttf"
using import "graphics"
import gfx "shared:workbench/glfw"
using import "core:runtime" // for type info

EntityType :: union {
	Door,
	Monster
}

Entity :: struct {
	x, y: int,
	name: string,
	derived: EntityType
}

Door :: struct {
	using entity: ^Entity,
	are_opened:   bool
}

Monster :: struct {
	using entity: ^Entity,
	hp:           int
}

new_entity :: proc(T: type) -> ^Entity {
	t := new(Entity);
	t.derived = T{ entity = t };
	return t;
}

Vertex_Format :: struct {
	position: math.Vec3,
	color:    math.Vec3,
	//normal:   math.Vec3
}

Vertex_Attrib_Info :: struct {
	locationIndex: u32,
    elements_per_vertex: i32, // size
    element_type: u32, // todo (u32?)  // type      // TODO parametrize this gl.FLOAT
    normalize: u8, //gl.FALSE,       // normalize // TODO parametrize this
    stride: i32, //attrib["stride"],        // size of all elements?
    offset: ^rawptr                    // offset
}

Manager :: struct {
	vao: u32,
	vbo: u32,
	vertex_buffer_size:   u32,
	ibo:  u32,
	vertex_buffer_data_size:    i32,

	vertex_data:  [dynamic]Vertex_Format, // todo
	index_data:   [dynamic]u32,
	//texture_data: [dynamic]Texture_Data,
	//sampler_data: [dynamic]Sampler_Data,
	//shader_data:  [dynamic]Shader_Data,
}

// current_frame_draw_buffer[];

Mesh :: struct {
		
}

Buffered_Vertex :: struct {
	count: u32;

}

set_vertex_format :: proc(m: ^Manager, vertex_type: type) {
	using math;
	ti := type_info_base(type_info_of(vertex_type)).variant.(Type_Info_Struct);
	
	for name, _i in ti.names {
		i := cast(u32)_i;
		offset := ti.offsets[i];
		offset_in_struct := u32(offset);
		num_elements: i32;
		type_of_elements: u32;

		a: any;
		a.typeid = typeid_of(ti.types[i]);
		switch kind in a {
			case Vec2: {
				num_elements = 2;
				type_of_elements = gl.FLOAT;
			}
			case Vec3: {
				num_elements = 3;
				type_of_elements = gl.FLOAT;
			}
			case Vec4: { // ,Colorf
				num_elements = 4;
				type_of_elements = gl.FLOAT;
			}
			//case Colori: {
			//	num_elements = 4;
			//	type_of_elements = gl.UNSIGNED_BYTE;
			//}
			case f64: {
				num_elements = 1;
				type_of_elements = gl.DOUBLE;
			}
			case f32: {
				num_elements = 1;
				type_of_elements = gl.FLOAT;
			}
			case i32: {
				num_elements = 1;
				type_of_elements = gl.INT;
			}
			case u32: {
				num_elements = 1;
				type_of_elements = gl.UNSIGNED_INT;
			}
			case i16: {
				num_elements = 1;
				type_of_elements = gl.SHORT;
			}
			case u16: {
				num_elements = 1;
				type_of_elements = gl.UNSIGNED_SHORT;
			}
			case i8: {
				num_elements = 1;
				type_of_elements = gl.BYTE;
			}
			case u8: {
				num_elements = 1;
				type_of_elements = gl.UNSIGNED_BYTE;
			}
			case: {
				fmt.printf("UNSUPPORTED TYPE IN VERTEX FORMAT - %s: %s\n", name, kind);
			}
		}

		gl.EnableVertexArrayAttrib(m.vao, i);
		//gl.VertexAttribPointer(i, num_elements, type_of_elements, gl.FALSE, size_of(vertex_type), offset_in_struct); //type_of_elements instead of 3
		gl.VertexArrayAttribFormat(m.vao, i, num_elements, type_of_elements, gl.FALSE, offset_in_struct); //type_of_elements instead of 3
		gl.VertexArrayAttribBinding(m.vao, i, 0); // TODO 0 (binding index)?
	}
}

make_vertex_buffer_object :: proc(vbo: u32) { // TODO flag for static etc
	gl.CreateBuffers(1, &vbo);
}

set_vertex_buffer_data :: proc(m: ^Manager, bufferHandle: u32, data: ^$T) {
	//gl.BindBuffer(gl.ARRAY_BUFFER, bufferHandle);
	//gl.BufferData(gl.ARRAY_BUFFER, len(data^)*size_of(type_of(data[0])), mem.raw_data(data^), gl.STATIC_DRAW);
	//gl.BindBuffer(gl.ARRAY_BUFFER, 0); // unbind

	//gl.NamedBufferStorage(m.vbo, len(data^)*size_of(type_of(data[0])), mem.raw_data(data^), gl.DYNAMIC_STORAGE_BIT);
	gl.NamedBufferData(m.vbo, len(data^)*size_of(type_of(data[0])), mem.raw_data(data^), gl.STATIC_DRAW);
}

add_mesh :: proc(m: ^Manager, vertices: $T, indices: $X) {
	using math;

	
	append(&m.vertex_data, ..vertices);
	
	
	/*
	append(&m.vertex_data,
		Vertex_Format{
			position = Vec3 {-0.8, -0.8, 0.0  },
			color    = Vec3 { 0.0,  1.0,  1.0 }
		},
		Vertex_Format{
			position = Vec3 { 0.5, -0.8, 0.0 },
			color    = Vec3 { 1.0,  0.0,  1.0 }
		},
		Vertex_Format{
			position = Vec3 { 0.5,  0.5, 0.0  },
			color    = Vec3 { 1.0,  1.0,  0.0 }
		}
	);
	*/
	

	append(&m.index_data, 3, 4, 5);

	// vertices
	set_vertex_buffer_data(m, m.vbo, &m.vertex_data);
	m.vertex_buffer_data_size = i32(len(m.vertex_data)*size_of(m.vertex_data[0]));

	// indices
	gl.NamedBufferData(m.ibo, len(m.index_data)*size_of(type_of(m.index_data[0])), mem.raw_data(m.index_data), gl.STATIC_DRAW);
}

init_manager :: proc(m: ^Manager) { // index_buffer_size: u32

	gl.CreateBuffers(1, &m.vbo);
	//m.vbo = make_vertex_buffer_object();

	using math;
	m.vertex_data = [dynamic]Vertex_Format { // dynamic

       Vertex_Format {
			position = Vec3 {-1.0, -1.0, 0.0  },
			color    = Vec3 { 1.0, 0.0, 0.0 }
		},

		Vertex_Format {
			position = Vec3 { 1.0, -1.0, 0.0 },
			color    = Vec3 { 0.0, 1.0, 0.0 }
		},

		Vertex_Format {
			position = Vec3 { 0.0, 1.0, 0.0 },
			color    = Vec3 { 0.0, 0.0, 1.0 }
		}
	};
	set_vertex_buffer_data(m, m.vbo, &m.vertex_data);
	m.vertex_buffer_data_size = i32(len(m.vertex_data)*size_of(m.vertex_data[0]));

	m.index_data = [dynamic]u32 {
		 0, 1, 2
	};
	gl.CreateBuffers(1, &m.ibo);
	gl.NamedBufferData(m.ibo, len(m.index_data)*size_of(type_of(m.index_data[0])), mem.raw_data(m.index_data), gl.STATIC_DRAW);
	//gl.NamedBufferStorage(m.ibo, size_of(indices), &indices[0], gl.DYNAMIC_STORAGE_BIT);

	gl.CreateVertexArrays(1, &m.vao);
	gl.VertexArrayVertexBuffer(m.vao, 0, m.vbo, 0, size_of(Vertex_Format));
	gl.VertexArrayElementBuffer(m.vao, m.ibo);

	gl.BindVertexArray(m.vao);
}

Shader :: struct {
	name:       string
	program_id: u32,
	uniforms:   gl.Uniforms
}

load_shaders :: proc(name: string, vs_src, fs_src: ^$T) -> (vs, fs: Shader) {

	vs.name       = name;
	vs.program_id = gl.CreateShaderProgramv(gl.VERTEX_SHADER,   1, cast(^u8)vs_src);
	vs.uniforms   = gl.get_uniforms_from_program(vs.program_id);

	fs.name       = name;
	fs.program_id = gl.CreateShaderProgramv(gl.FRAGMENT_SHADER, 1, cast(^u8)fs_src);
	fs.uniforms   = gl.get_uniforms_from_program(fs.program_id);

	return;
}

set_uniform :: proc(shader: ^Shader, uniform_name: string, value: $T, normalize: bool = false) {

	u := shader.uniforms[uniform_name];

	using gl.Uniform_Type;
	switch u.kind {
		case FLOAT_MAT4: {
			gl.ProgramUniformMatrix4fv(shader.program_id, u.location, 1, gl.FALSE, value);
		}

		case FLOAT_VEC2: {
			gl.ProgramUniform2fv(shader.program_id, u.location, 1, value);
		}

		case FLOAT: {
			gl.ProgramUniform1f(shader.program_id, u.location, value^);
		}
	}
}

main :: proc() {
	width:  int = 1280;
	height: int = 720;
	//fmt.println(size_of(Vertex_Data));
	gfx.init_glfw("title", width, height, 4, 5);
	wnd := gfx.main_window;

	gl.load_up_to(4, 5, gfx.set_proc_address);

    gl.Disable(gl.DEPTH_TEST);
    gl.Disable(gl.CULL_FACE);

    //sdl.get_window_size(wnd, &w, &h);
    gl.Viewport(0, 0, i32(width), i32(height));
    gl.ClearColor(0.0, 0.5, 1.0, 0.0);

	//entity := new_entity(Monster);
	//println(entity^);

	//switch e in entity.derived {
	//	case Door:
	//		println(e.are_opened);
	//	case Monster:
	//		if e.hp <= 0 do println("monster is dead");
	//}

	vert_shader_src := `#version 400 core
	layout(location = 0) in vec3 v_pos;
	layout(location = 1) in vec3 v_color;

	uniform mat4 mvp;

	out vec3 fragColor;
	//out mat4 gl_Position;

	void main(void) {
		gl_Position = mvp * vec4(v_pos, 1.0);
		fragColor = v_color;
	}
	`;

	frag_shader_src := `#version 400 core
	in vec3 fragColor;
	//in vec2 gl_PointCoord
	in vec4 gl_FragCoord;
	uniform vec2 resolution;
	uniform float time;
	out vec4 o_color;

	float map(vec3 p) {
		vec3 q = fract(p) * 2.0 - 1.0;
		return length(q) - 0.15;
	}

	float trace(vec3 o, vec3 r) {
		float t = 0.0;
		for (int i = 0; i < 32; ++i) {
			vec3 p = o + r * t;
			float d = map(p);
			t += d * 0.5;
		}

		return t;
	}

	void main() {

		vec2 uv = gl_FragCoord.xy / resolution.xy; // < 0;1 >
		uv = uv*2.0 - 1.0; // < -1;1 >
		uv.x *= resolution.x / resolution.y;

		vec3 r = normalize(vec3(uv, 1.0));
		float the = time*5.0;
		r.xz *= mat2(cos(the), -sin(the), sin(the), cos(the));
		vec3 o = vec3(0.0, 0.0, -3.0+time*15.0);
		float t = trace(o, r);
		float fog = 1.0 / (1.0 + t * t * 0.1);
		vec3 fc = vec3(fog+0.2*uv.x, fog, fog-0.1*t);

		//o_color = vec4(uv.x, uv.y, 0.0, 1.0);
		o_color = vec4(fc, 1.0);
		//o_color = vec4(fragColor.x, fragColor.y, fragColor.z, 1.0);
	}
	`;

	// shaders
	vs, fs := load_shaders("basic", &vert_shader_src, &frag_shader_src);

	//vs_program := gl.CreateShaderProgramv(gl.VERTEX_SHADER,   1, cast(^u8)&vert_shader_src);
	fs_program := gl.CreateShaderProgramv(gl.FRAGMENT_SHADER, 1, cast(^u8)&frag_shader_src);

	// pipeline
	pipeline_program_id: u32;
	gl.CreateProgramPipelines(1, &pipeline_program_id);
	gl.UseProgramStages(pipeline_program_id, gl.VERTEX_SHADER_BIT,   vs.program_id);
	gl.UseProgramStages(pipeline_program_id, gl.FRAGMENT_SHADER_BIT, fs.program_id);

	gl.BindProgramPipeline(pipeline_program_id);

	vertexLoc := cast(u32)gl.GetAttribLocation(vs.program_id, cast(^u8)strings.new_cstring("v_pos"));
	colorLoc  := cast(u32)gl.GetAttribLocation(vs.program_id, cast(^u8)strings.new_cstring("v_color"));

	// textures
	main_framebuffer_texture_id: u32;
	gl.CreateTextures(gl.TEXTURE_2D, 1, &main_framebuffer_texture_id);

	gl.TextureParameteri(main_framebuffer_texture_id, gl.TEXTURE_MIN_FILTER, gl.LINEAR); // NEAREST?
	gl.TextureParameteri(main_framebuffer_texture_id, gl.TEXTURE_MAG_FILTER, gl.LINEAR);

	gl.TextureStorage2D(main_framebuffer_texture_id, 1, gl.RGBA8, i32(width), i32(height));
	//gl.TextureSubImage2D(main_framebuffer_texture_id, 0, 0, 0, width, height, gl.RGBA, gl.UNSIGNED_BYTE, pixels); // wat is dat

	// framebuffers
	main_framebuffer_id: u32;
	gl.CreateFramebuffers(1, &main_framebuffer_id);
	gl.BindFramebuffer(gl.FRAMEBUFFER, main_framebuffer_id);

	gl.NamedFramebufferTexture(main_framebuffer_id, gl.COLOR_ATTACHMENT0, main_framebuffer_texture_id, 0);
	//gl.NamedFramebufferTexture(main_framebuffer_id, gl.DEPTH_ATTACHMENT, depthTex, 0);

	if gl.CheckNamedFramebufferStatus(main_framebuffer_id, gl.FRAMEBUFFER) != gl.FRAMEBUFFER_COMPLETE do fmt.println("framebuffer error");

	// manager
	manager: Manager;
	init_manager(&manager);

	indices := [?]f32 {
       3, 4, 5
	};

	vertices: []Vertex_Format = {
		Vertex_Format{
			position = math.Vec3 {-0.8, -0.8, 0.0  },
			color    = math.Vec3 { 0.0,  1.0,  1.0 }
		},
		Vertex_Format{
			position = math.Vec3 {0.5, -0.8, 0.0 },
			color    = math.Vec3 { 1.0,  0.0,  1.0 }
		},
		Vertex_Format{
			position = math.Vec3 {0.5,  0.5, 0.0  },
			color    = math.Vec3 { 1.0,  1.0,  0.0 }
		}
	};
	add_mesh(&manager, vertices, indices);

	projection := math.perspective(math.to_radians(45.0), 16.0/10.0, 0.1, 100.0);

	view := math.look_at(
    	math.Vec3{0.1, 1.0, 1.0}, // Camera is at (4,3,3), in World Space
    	math.Vec3{0.0, 0.0, 0.0}, // and looks at the origin
    	math.Vec3{0.0, 1.0, 0.0}  // Head is up (set to 0,-1,0 to look upside-down)
    );

    model := math.identity(math.Mat4);
    mvp := math.mul(math.mul(projection, view), model);
    
    set_uniform(&vs, "mvp", &mvp[0][0]);
    res: math.Vec2 = math.Vec2{f32(width), f32(height)};
    set_uniform(&fs, "resolution", cast(^f32)&res[0]);

    set_vertex_format(&manager, Vertex_Format); // type_of(manager.vertex_data[0])
  
  	fmt.println(cstring(gl.GetString(gl.VERSION)));
  	//current_program: type_of(shader.program) = 255; // TODO
  	time: f32 = 0.0;
    for {
        //if brew.process_events() do break;
        gfx.PollEvents();
        if gfx.window_should_close(wnd) do break;

        //glViewport(0, 0, viewport_width, viewport_height);
        gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
    	gl.ClearColor(0.2431, 0.5255, 0.97645, 0.97647);
    	// gl.ClearDepth(d); ?

    	time += 0.001;
    	set_uniform(&fs, "time", &time);

    	// render
    	for vertex_info in buffered_vertices {
    		append(queued_for_drawing,
    			VertexFormat {
    				pos, uv, color
    			};
    		)
    	}

        {
        	//if (shader.program != current_program || (current_program == 255)) {
        		//set_vertex_format(&manager, Vertex_Format); // type_of(manager.vertex_data[0])
        	//}

        	gl.BindFramebuffer(gl.FRAMEBUFFER, main_framebuffer_id);
        	gl.DrawElements(gl.TRIANGLES, 6, gl.UNSIGNED_INT, nil); // i32(len(manager.vertex_data))

        	//gl.DisableVertexAttribArray(0);
        	//gl.DisableVertexAttribArray(1);
        }

        /* scale raster */
		gl.Viewport(0, 0, i32(width), i32(height));
        gl.BindFramebuffer(gl.FRAMEBUFFER, 0);
        gl.BlitNamedFramebuffer(main_framebuffer_id, 0, 0, 0, i32(width), i32(height), 0, 0, i32(width), i32(height), gl.COLOR_BUFFER_BIT, gl.NEAREST);

        gfx.SwapBuffers(wnd);
    }
}