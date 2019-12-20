package mythic

import "core:fmt"
import "core:strings"
import "shared:odin-gl"
import "shared:odin-glfw"
import "renderer"

using import "math"

keys: [348]bool;


Window_Dim :: struct
{
    x: i32,
    y: i32,
}

main :: proc()
{
    error_callback :: proc"c"(error: i32, desc: cstring) {
        fmt.printf("Error code %d:\n    %s\n", error, desc);
    }
	glfw.SetErrorCallback(error_callback);

	if glfw.Init() == 0 do return;
	defer glfw.Terminate();

	dim := Window_Dim{1280, 720};
	window := glfw.CreateWindow(dim.x, dim.y, "Mythic Engine writen in Odin!", nil, nil);
	if window == nil do return;
    glfw.SetWindowAspectRatio(window, 16, 9);

    key_callback :: proc"c"(window: glfw.Window_Handle, key, scancode, action, mods: i32){
        keys[key] = action != glfw.RELEASE;
    }
    glfw.SetKeyCallback(window, key_callback);

    glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 3);
    glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 3);
	glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);

	glfw.MakeContextCurrent(window);
	glfw.SwapInterval(0);

	 // setup opengl
    set_proc_address :: proc(p: rawptr, name: cstring) { 
        (cast(^rawptr)p)^ = rawptr(glfw.GetProcAddress(name));
    }
    gl.load_up_to(3, 3, set_proc_address);
    gl.Enable(gl.DEPTH_TEST);

    program, err := gl.load_shaders("shaders/shader.vs", "shaders/shader.fs");

    if err == false do return;

    pr_matrix := create_ortho_mat4(0, 16, 0, 9, -1, 1);

    sprite := renderer.init_sprite(v2{1, 0}, v2{1, 1}, "art/test_player.png");

    renderer.use_program(program);
    maxFPS := 60.0;
    maxPeriod := 1.0 / maxFPS;
    lastTime := 0.0;
    for !glfw.WindowShouldClose(window){
        time := glfw.GetTime();
        delta := cast(f32)(time - lastTime);
    	gl.ClearColor(0.0, 0.0, 1.0, 1.0);
    	
    	glfw.PollEvents();

    	gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

        renderer.set_uniforms(sprite.transform, pr_matrix, program);
        renderer.draw_sprite(&sprite);
        if keys[glfw.KEY_W] {
            sprite.transform.pos.y += 0.1 * delta;
        }
        if keys[glfw.KEY_S] {
            sprite.transform.pos.y += -0.1 * delta;
        }
    	glfw.SwapBuffers(window);

        //Limit fps
        if cast(f64)delta >= maxPeriod {
            lastTime = time;
        }
	}
}
