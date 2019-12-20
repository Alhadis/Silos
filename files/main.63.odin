import "core:fmt.odin";
import "core:strings.odin";
import "shared:odin-glfw/glfw.odin";
import "shared:odin-gl/gl.odin";


main :: proc() {
	//
	error_callback :: proc(error: i32, desc: ^u8) #cc_c {
		fmt.printf("Error code %d:\n    %s\n", error, strings.to_odin_string(desc));
	}

    get_uniform_location :: proc(program: u32, str: string) -> i32 {
		return gl.GetUniformLocation(program, &str[0]);;
	}

	set_proc_address :: proc(p: rawptr, name: string) { 
		(cast(^rawptr)p)^ = rawptr(glfw.GetProcAddress(&name[0]));
	}

	//
	glfw.SetErrorCallback(error_callback);

	//
	if glfw.Init() == 0 do return;
	defer glfw.Terminate();

	//
	glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 3);
	glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 3);
	glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);

	//
	resx, resy := i32(640), i32(480);
	window := glfw.CreateWindow(resx, resy, "test ", nil, nil);
	if window == nil do return;

	//
	glfw.MakeContextCurrent(window);
	glfw.SwapInterval(0);

	//

	gl.load_up_to(3, 3, set_proc_address);

	//
	program, shader_success := gl.load_shaders("vertex_shader.vs", "fragment_shader.fs");
	defer gl.DeleteProgram(program);

	//
	vertex_array_object: u32;
    gl.GenVertexArrays(1, &vertex_array_object); // @NOTE: should destroy this at exit
    gl.BindVertexArray(vertex_array_object);
    defer gl.DeleteVertexArrays(1, &vertex_array_object);

    texture_width := i32(4);
    texture_height := i32(4);
    texture_data := [...]u8 {
        255, 152,   0, // orange
        156,  39, 176, // purple
          3, 169, 244, // light blue
        139, 195,  74, // light green

        255,  87,  34, // deep orange
        103,  58, 183, // deep purple
          0, 188, 212, // cyan
        205, 220,  57, // lime

        244,  67,  54, // red
         63,  81, 181, // indigo
          0, 150, 137, // teal
        255, 235,  59, // yellow
        
        233,  30,  99, // pink
         33, 150, 243, // blue
         76, 175,  80, // green
        255, 193,   7, // amber
    };

    //
    texture: u32;
    gl.GenTextures(1, &texture);
    gl.ActiveTexture(gl.TEXTURE0);
    gl.BindTexture(gl.TEXTURE_2D, texture);
    defer gl.DeleteTextures(1, &texture);

    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.REPEAT);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.REPEAT);
    gl.TexImage2D(gl.TEXTURE_2D, 0, gl.RGB, texture_width, texture_height, 0, gl.RGB, gl.UNSIGNED_BYTE, &texture_data[0]);

    //
    gl.UseProgram(program);
    gl.Uniform1i(get_uniform_location(program, "texture_sampler\x00"), 0);


    space_state_prev := i32(0);

    //
    gl.ClearColor(3.0/255, 72/255.0, 133/255.0, 1.0);
    for glfw.WindowShouldClose(window) == glfw.FALSE {
        //
        //calculate_frame_timings(window);

        //
        glfw.PollEvents();

        //
        if (glfw.GetKey(window, glfw.KEY_SPACE) == glfw.PRESS && space_state_prev == glfw.RELEASE) {
            for c, i in texture_data do texture_data[i] = 255 - c;
            
            gl.BindTexture(gl.TEXTURE_2D, texture);
            gl.TexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, texture_width, texture_height, gl.RGB, gl.UNSIGNED_BYTE, &texture_data[0]);
            
            fmt.println("Inverted texture colors");
        }
        space_state_prev = glfw.GetKey(window, glfw.KEY_SPACE);

        //
        gl.Clear(gl.COLOR_BUFFER_BIT);
    
        //
        gl.UseProgram(program);
        gl.BindVertexArray(vertex_array_object);
        gl.BindTexture(gl.TEXTURE_2D, texture);

        //
        gl.DrawArrays(gl.TRIANGLE_STRIP, 0, 4);

        //
        glfw.SwapBuffers(window);
    }
}