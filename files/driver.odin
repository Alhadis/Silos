package main

import "core:fmt"
import "core:mem"
import "core:strings"
import "shared:sgl"

import glfw "shared:odin-glfw/bindings"
import gl "shared:odin-gl"

WIDTH :: 800;
HEIGHT :: 600;

GL_MAJOR :: 4;
GL_MINOR :: 4;

get_uniform_location :: proc(program: u32, str: string) -> i32 {
    return gl.GetUniformLocation(program, strings.unsafe_string_to_cstring(str));
}

error_callback :: proc "c" (error: i32, desc: cstring) {
    fmt.printf("Error code %d:\n    %s\n", error, desc);
}

main :: proc() {
    glfw.SetErrorCallback(error_callback);

    if glfw.Init() == 0 do return;
    defer glfw.Terminate();

    glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, GL_MAJOR);
    glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, GL_MINOR);
    glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);
    glfw.WindowHint(glfw.RESIZABLE, glfw.FALSE);

    window := glfw.CreateWindow(WIDTH, HEIGHT, "Software Rendering", nil, nil);
    if window == nil do return;

    glfw.MakeContextCurrent(window);
    glfw.SwapInterval(0);

    set_proc_address :: proc(p: rawptr, name: cstring) { 
        (cast(^rawptr)p)^ = rawptr(glfw.GetProcAddress(name));
    }
    gl.load_up_to(GL_MAJOR, GL_MINOR, set_proc_address);

    program, shader_success := gl.load_shaders("shaders/shader_passthrough.vs", "shaders/shader_passthrough.fs");
    if !shader_success do return;
    defer gl.DeleteProgram(program);

    gl.UseProgram(program);
    gl.Uniform2f(get_uniform_location(program, "tex_size\x00"), WIDTH, HEIGHT);

    vao: u32;
    gl.GenVertexArrays(1, &vao);
    defer gl.DeleteVertexArrays(1, &vao);

    gl.BindVertexArray(vao);

    vertex_data := [?]f32{
        -1.0,  1.0,
        -1.0, -1.0, 
         1.0,  1.0, 
         1.0, -1.0
    };

    vbo: u32;
    gl.GenBuffers(1, &vbo);
    defer gl.DeleteBuffers(1, &vbo);

    gl.BindBuffer(gl.ARRAY_BUFFER, vbo);
    gl.BufferData(gl.ARRAY_BUFFER, size_of(vertex_data), &vertex_data[0], gl.STATIC_DRAW);

    gl.EnableVertexAttribArray(0);
    gl.VertexAttribFormat(0, 2, gl.FLOAT, gl.FALSE, 0);
    gl.VertexAttribBinding(0, 0);
    gl.BindVertexBuffer(0, vbo, 0, 8);

    tex: u32;
    gl.GenTextures(1, &tex);
    defer gl.DeleteTextures(1, &tex);

    gl.ActiveTexture(gl.TEXTURE0);
    gl.BindTexture(gl.TEXTURE_2D, tex);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);

    pbos : [2]u32;
    gl.GenBuffers(2, &pbos[0]);
    defer gl.DeleteBuffers(2, &pbos[0]);
    
    frames := 0;
    ticks := 0;

    index := 0;
    next_index : type_of(index);

    init();

    timer := glfw.GetTime();
    last := timer;

    for glfw.WindowShouldClose(window) == glfw.FALSE {
        glfw.PollEvents();

        {
            index = (index + 1) % 2;
            next_index = (index + 1) % 2;

            gl.BindTexture(gl.TEXTURE_2D, tex);

            gl.BindBuffer(gl.PIXEL_UNPACK_BUFFER, pbos[index]);
            gl.TexImage2D(gl.TEXTURE_2D, 0, gl.RGBA, WIDTH, HEIGHT, 0, gl.RGBA, gl.UNSIGNED_BYTE, nil);

            gl.BindBuffer(gl.PIXEL_UNPACK_BUFFER, pbos[next_index]);
            gl.BufferData(gl.PIXEL_UNPACK_BUFFER, WIDTH*HEIGHT*4, nil, gl.STREAM_DRAW);

            ptr := gl.MapBuffer(gl.PIXEL_UNPACK_BUFFER, gl.WRITE_ONLY);
            if ptr != nil {
                pixel_data := mem.slice_ptr(cast(^u8)ptr, WIDTH * HEIGHT * 4);
                buffer := sgl.Buffer{pixel_data};
                fb := sgl.Bitmap{&buffer, WIDTH, HEIGHT};
        
                now := glfw.GetTime();
                diff := now - last;
                last = now;

                tick(diff);
                render(&fb);
        
                frames += 1;

                gl.UnmapBuffer(gl.PIXEL_UNPACK_BUFFER);
            }
            
            gl.BindBuffer(gl.PIXEL_UNPACK_BUFFER, 0);
        }        

        gl.BindVertexArray(vao);
        gl.DrawArrays(gl.TRIANGLE_STRIP, 0, 4);
        
        glfw.SwapBuffers(window);

        if glfw.GetTime() - timer >= 1 {
            fmt.println("FPS:", frames);

            timer += 1;
            frames = 0;
            ticks = 0;
        }
    }
}