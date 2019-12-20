package main

import "core:fmt";
import "core:strings";
import "core:math";
import "core:mem";
import "core:os";

import "shared:odin-glfw";
import "shared:odin-gl";
import font_gl "shared:odin-gl_font";

append_to_log :: proc(log: ^[dynamic]string, fmt_string: string, vals: ...any) {
    a := fmt.aprintf(fmt_string, ...vals);
    append(log, a);
}
temp_log: [dynamic]string;

cube_vertices := [?][3]f32 {
    {0.0, 0.0, 0.0}, {1.0, 0.0, 0.0}, {1.0, 0.0, 1.0}, {0.0, 0.0, 1.0},
    {0.0, 0.0, 0.0}, {0.0, 0.0, 1.0}, {0.0, 1.0, 1.0}, {0.0, 1.0, 0.0},
    {0.0, 0.0, 1.0}, {1.0, 0.0, 1.0}, {1.0, 1.0, 1.0}, {0.0, 1.0, 1.0},
    {0.0, 1.0, 0.0}, {0.0, 1.0, 1.0}, {1.0, 1.0, 1.0}, {1.0, 1.0, 0.0},
    {1.0, 0.0, 0.0}, {1.0, 1.0, 0.0}, {1.0, 1.0, 1.0}, {1.0, 0.0, 1.0},
    {0.0, 0.0, 0.0}, {0.0, 1.0, 0.0}, {1.0, 1.0, 0.0}, {1.0, 0.0, 0.0},
};

cube_normals := [?][3]f32 {
    { 0.0, -1.0,  0.0}, { 0.0, -1.0,  0.0}, { 0.0, -1.0,  0.0}, { 0.0, -1.0,  0.0},
    {-1.0,  0.0,  0.0}, {-1.0,  0.0,  0.0}, {-1.0,  0.0,  0.0}, {-1.0,  0.0,  0.0},
    { 0.0,  0.0,  1.0}, { 0.0,  0.0,  1.0}, { 0.0,  0.0,  1.0}, { 0.0,  0.0,  1.0},
    { 0.0,  1.0,  0.0}, { 0.0,  1.0,  0.0}, { 0.0,  1.0,  0.0}, { 0.0,  1.0,  0.0},
    { 1.0,  0.0,  0.0}, { 1.0,  0.0,  0.0}, { 1.0,  0.0,  0.0}, { 1.0,  0.0,  0.0},
    { 0.0,  0.0, -1.0}, { 0.0,  0.0, -1.0}, { 0.0,  0.0, -1.0}, { 0.0,  0.0, -1.0},
};

cube_elements := [?]u32 {
     0,  1,  2,   0,  2,  3,
     4,  5,  6,   4,  6,  7,
     8,  9, 10,   8, 10, 11,
    12, 13, 14,  12, 14, 15,
    16, 17, 18,  16, 18, 19,
    20, 21, 22,  20, 22, 23,
};

foreign import "system:lib/model_loader.lib"

Triangle :: struct {
    v1: [3]f32,
    nx: f32,
    v2: [3]f32,
    ny: f32,
    v3: [3]f32,
    nz: f32,
};

load_mesh :: proc(filename: cstring) -> []Triangle {
    foreign model_loader { load_mesh :: proc"c"(filename: cstring, num_triangles: ^int) -> ^Triangle ---; }
    
    num_triangles: int;
    triangles := load_mesh(filename, &num_triangles);
    
    if triangles == nil {
        return nil;
    }

    return mem.slice_ptr(triangles, num_triangles);
}

foreign model_loader {
    free_mesh :: proc"c"(triangles: ^Triangle) ---;
}

main :: proc() {
    // glfw
    resx, resy := 1600.0, 900.0;
    window := glfw.init_helper(int(resx), int(resy), "template 3D", 4, 4, 0, false);
    if window == nil {
        glfw.Terminate();
        return;
    }
    defer glfw.Terminate();

    // opengl/glad
    gl.load_up_to(4, 4, glfw.set_proc_address);
    
    // fonts
    sizes := [16]int{72, 68, 64, 60, 56, 52, 48, 44, 40, 36, 32, 28, 24, 20, 16, 12};
    codepoints: [96]rune;
    for i in 0..95 do codepoints[i] = rune(32+i);
    codepoints[95] = 'θ';
    
    font, success_font := font_gl.init_from_ttf_gl("consola.ttf", "Consola", false, sizes[...], codepoints[...]);
    if !success_font do return;
    defer font_gl.destroy_gl(font);

    //
    font_gl.colors[0] = font_gl.Vec4{0, 0, 0, 1}; // black
    font_gl.update_colors(0, 1);

    // shaders
    program, shader_success := gl.load_shaders("shaders/vertex_shader_3D.glsl", "shaders/fragment_shader_3D.glsl");
    defer gl.DeleteProgram(program);
    t1_ := glfw.GetTime();
    compute_program, compute_shader_success := gl.load_compute_file("shaders/compute_shader_3D.glsl");
    t2_ := glfw.GetTime();
    defer gl.DeleteProgram(compute_program);

    fmt.println(program, shader_success, compute_program, compute_shader_success);
    
    // camera, note: +Z up, physics spherical coordinates
    p := [3]f32{-50.0, -50.0, 5.0};
    theta, phi := 3.0*f32(math.π)/4.0, -3*f32(math.π/4.0);
    sp, cp, st, ct := math.sin(phi), math.cos(phi), math.sin(theta), math.cos(theta);
    f, r, u := [3]f32{cp*st, sp*st, ct}, [3]f32{sp, -cp, 0.0}, [3]f32{-cp*ct, -sp*ct, st};

    // input
    mx_prev, my_prev := glfw.GetCursorPos(window);

    // timings
    t_prev := glfw.GetTime();
    frame := 0;

    // gl state
    vao: u32;
    gl.GenVertexArrays(1, &vao);
    gl.ClearColor(1.0, 1.0, 1.0, 1.0);

    // load mesh
    create_buffer :: proc(data: $E/[]$T) -> u32 {
        buf: u32;
        gl.GenBuffers(1, &buf);
        gl.BindBuffer(gl.SHADER_STORAGE_BUFFER, buf);
        gl.BufferData(gl.SHADER_STORAGE_BUFFER, size_of(T)*len(data), &data[0], gl.STATIC_DRAW);
        return buf;
    }

    Mesh :: struct {
        triangles: []Triangle,
        filename: string,
        model_min, model_max: [3]f32,
        ssbo: u32,
    };

    files := [?]string{
        "models/brawler_armoured.FBX",
        "models/Deer.FBX",
        "models/Dragon.FBX",
        "models/elephant_asie_sketchfab.obj",
        "models/elephant_asie_sketchfab_fixed.obj",
        "models/HandAndGun.FBX",
        "models/moon.FBX",
        "models/pig.FBX",
        "models/seychelles_giant_tortoise_sketchfab.obj",
        "models/skyhome.obj",
        "models/skyhome_fixed.obj",
        "models/Snow covered CottageFBX.fbx",
        "models/tigre_sumatra_sketchfab.obj",
        "models/tram_1011.obj",
        "models/tram_11924.obj",
        "models/tram_11924_fixed.obj",
        "models/tram_6005.obj",
        "models/USSEnterprise.fbx",
    };
    meshes := make([]Mesh, len(files));
    for file, i in files {
        using mesh := &meshes[i];
        triangles = load_mesh(cstring(&files[i][0]));
        filename = file;
        if meshes[i].triangles == nil {
            fmt.println("Error loading model from file", file);
            continue;
        }
        
        model_min, model_max = [3]f32{1.0e9, 1.0e9, 1.0e9}, [3]f32{-1.0e9, -1.0e9, -1.0e9};
        for _, j in triangles {
            using t := &triangles[j];

            v1.x, v1.y, v1.z = v1.x, -v1.z, v1.y;
            v2.x, v2.y, v2.z = v2.x, -v2.z, v2.y;
            v3.x, v3.y, v3.z = v3.x, -v3.z, v3.y;
        }

        model_min, model_max = [3]f32{1.0e9, 1.0e9, 1.0e9}, -1.0*[3]f32{1.0e9, 1.0e9, 1.0e9};
        for _, j in triangles {
            using t := &triangles[j];

            model_min.x, model_min.y, model_min.z = min(model_min.x, v1.x), min(model_min.y, v1.y), min(model_min.z, v1.z);
            model_max.x, model_max.y, model_max.z = max(model_max.x, v1.x), max(model_max.y, v1.y), max(model_max.z, v1.z);

            model_min.x, model_min.y, model_min.z = min(model_min.x, v2.x), min(model_min.y, v2.y), min(model_min.z, v2.z);
            model_max.x, model_max.y, model_max.z = max(model_max.x, v2.x), max(model_max.y, v2.y), max(model_max.z, v2.z);

            model_min.x, model_min.y, model_min.z = min(model_min.x, v3.x), min(model_min.y, v3.y), min(model_min.z, v3.z);
            model_max.x, model_max.y, model_max.z = max(model_max.x, v3.x), max(model_max.y, v3.y), max(model_max.z, v3.z);
        } 

        max_value := max( max( max(abs(model_max.x), abs(model_min.x)), max(abs(model_max.y), abs(model_min.y)) ), max(abs(model_max.z), abs(model_min.z)) );


        for _, j in triangles {
            using t := &triangles[j];
            v1, v2, v3 = v1/max_value, v2/max_value, v3/max_value;
            n := math.norm0(math.cross(v2 - v1, v3 - v1));
            nx, ny, nz = n.x, n.y, n.z;
        }
        model_min, model_max = model_min / max_value, model_max / max_value;

        ssbo = create_buffer(triangles);
    }

    current_model := 0;

    cube_triangles := make([]Triangle, 12);
    for i in 0..12 {
        using t := &cube_triangles[i];
        v1 = cube_vertices[cube_elements[3*i+0]];
        v2 = cube_vertices[cube_elements[3*i+1]];
        v3 = cube_vertices[cube_elements[3*i+2]];

        n := cube_normals[cube_elements[3*i+0]];
        nx, ny, nz = n.x, n.y, n.z;
    }
    ssbo_cube := create_buffer(cube_triangles);

    show_boxes := false;
    b_last := false;
    left_last, right_last := false, false;

    gl.Enable(gl.DEPTH_TEST);
    gl.Enable (gl.BLEND); 
    gl.BlendFunc (gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);

    diag := math.length(meshes[current_model].model_max - meshes[current_model].model_min);
    p = (meshes[current_model].model_max + meshes[current_model].model_min)/2.0 + [3]f32{diag, diag, diag};

    for !glfw.WindowShouldClose(window) {
        // log
        for _, i in temp_log do free(temp_log[i]);
        clear(&temp_log);

        // frame timings
        t_now := glfw.GetTime();
        dt := f32(t_now - t_prev);
        t_prev = t_now;

        append_to_log(&temp_log, "frame time = %f ms, fps = %f", 1000*dt, 1.0/dt);
        

        // input
        glfw.PollEvents();

        if glfw.GetKey(window, glfw.KEY_ESCAPE) do glfw.SetWindowShouldClose(window, true);

        if !left_last && glfw.GetKey(window, glfw.KEY_LEFT) {
            current_model = (current_model - 1 + len(meshes)) % len(meshes);
            diag := math.length(meshes[current_model].model_max - meshes[current_model].model_min);
            p = (meshes[current_model].model_max + meshes[current_model].model_min)/2.0 + [3]f32{diag, diag, diag};
            theta, phi = 3.0*f32(math.π)/4.0, -3*f32(math.π/4.0);
        }
        left_last = glfw.GetKey(window, glfw.KEY_LEFT);

        if !right_last && glfw.GetKey(window, glfw.KEY_RIGHT) {
            current_model = (current_model + 1 + len(meshes)) % len(meshes);
            diag := math.length(meshes[current_model].model_max - meshes[current_model].model_min);
            p = (meshes[current_model].model_max + meshes[current_model].model_min)/2.0 + [3]f32{diag, diag, diag};
            theta, phi = 3.0*f32(math.π)/4.0, -3*f32(math.π/4.0);
        }
        right_last = glfw.GetKey(window, glfw.KEY_RIGHT);

        gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

        if meshes[current_model].triangles != nil {
            // get current mouse position
            mx, my := glfw.GetCursorPos(window);

            // update camera direction
            if glfw.GetMouseButton(window, glfw.MOUSE_BUTTON_1) == glfw.PRESS {
                radiansPerPixel := f32(0.1 * math.π / 180.0);
                phi = phi - f32(mx - mx_prev) * radiansPerPixel;
                theta = clamp(theta + f32(my - my_prev) * radiansPerPixel, 1.0*math.π/180.0, 179.0*math.π/180.0);
            }

            mx_prev, my_prev = mx, my;

            // cam movement
            sp, cp, st, ct = math.sin(phi), math.cos(phi), math.sin(theta), math.cos(theta);
            f, r, u = [3]f32{cp*st, sp*st, ct}, [3]f32{sp, -cp, 0.0}, [3]f32{-cp*ct, -sp*ct, st};

            //dt /= math.length(model_max - model_min);
            if glfw.GetKey(window, glfw.KEY_LEFT_CONTROL) {
                dt *= 10.0;
            }
            if glfw.GetKey(window, glfw.KEY_LEFT_SHIFT) {
                dt *= 10.0;
            }
            if glfw.GetKey(window, glfw.KEY_LEFT_ALT) {
                dt /= 10.0;
            }


            //p = [3]f32{diag, diag, diag};
            speed := math.length(meshes[current_model].model_max - meshes[current_model].model_min);

            // update camera position:
            // W: forward, S: back, A: left, D: right, E: up, Q: down
            p += speed*f*f32(int(glfw.GetKey(window, glfw.KEY_W)) - int(glfw.GetKey(window, glfw.KEY_S)))*dt;
            p += speed*r*f32(int(glfw.GetKey(window, glfw.KEY_D)) - int(glfw.GetKey(window, glfw.KEY_A)))*dt;
            p += speed*u*f32(int(glfw.GetKey(window, glfw.KEY_E)) - int(glfw.GetKey(window, glfw.KEY_Q)))*dt;
            
            append_to_log(&temp_log, "cam_pos = %v", p);
            append_to_log(&temp_log, "theta = %v, phi = %v", 180.0/math.PI*theta, 180.0/math.PI*phi);
            append_to_log(&temp_log, "");
            append_to_log(&temp_log, "mesh filename = '%s'", meshes[current_model].filename);
            append_to_log(&temp_log, "num triangles = %v", len(meshes[current_model].triangles));
            append_to_log(&temp_log, "");
            append_to_log(&temp_log, "model_min = %v", meshes[current_model].model_min);
            append_to_log(&temp_log, "model_max = %v", meshes[current_model].model_max);
            append_to_log(&temp_log, "");


            if !b_last && glfw.GetKey(window, glfw.KEY_B) {
                show_boxes = !show_boxes;
            }
            b_last = glfw.GetKey(window, glfw.KEY_B);

            // Main drawing part
            

            // state
            gl.Enable(gl.DEPTH_TEST);
            gl.Enable (gl.BLEND); 
            gl.BlendFunc (gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);

            V := view(r, u, f, p);
            P := math.perspective(45.0*math.PI/180.0, f32(resx/resy), 0.01, speed*10.0);
                    
            //
            gl.BindVertexArray(vao);
            gl.UseProgram(program);

            gl.Uniform1f(gl.get_uniform_location(program, "time"), f32(glfw.GetTime()));

            //
            M := math.identity(math.Mat4);
            MVP := math.mul(P, math.mul(V, M));

            gl.UniformMatrix4fv(gl.get_uniform_location(program, "MVP\x00"), 1, gl.FALSE, &MVP[0][0]);
            gl.Uniform1f(gl.get_uniform_location(program, "opacity"), 1.0);
            
            gl.BindBufferBase(gl.SHADER_STORAGE_BUFFER, 0, meshes[current_model].ssbo);
            gl.DrawArraysInstanced(gl.TRIANGLES, 0, 3, cast(i32)len(meshes[current_model].triangles));

            if show_boxes {
                M := math.scale_vec3(math.identity(math.Mat4), math.Vec3(meshes[current_model].model_max-meshes[current_model].model_min));
                M = math.mul(math.mat4_translate(math.Vec3(meshes[current_model].model_min)), M);
                MVP := math.mul(P, math.mul(V, M));

                gl.UniformMatrix4fv(gl.get_uniform_location(program, "MVP\x00"), 1, gl.FALSE, &MVP[0][0]);
                gl.Uniform1f(gl.get_uniform_location(program, "opacity"), 0.5);
                
                gl.BindBufferBase(gl.SHADER_STORAGE_BUFFER, 0, ssbo_cube);

                gl.DepthMask(gl.FALSE);
                gl.Enable(gl.CULL_FACE);

                gl.CullFace(gl.FRONT);       
                gl.DrawArraysInstanced(gl.TRIANGLES, 0, 3, cast(i32)len(cube_triangles));
                gl.CullFace(gl.BACK);
                gl.DrawArraysInstanced(gl.TRIANGLES, 0, 3, cast(i32)len(cube_triangles));
                
                gl.Disable(gl.CULL_FACE);
                gl.DepthMask(gl.TRUE);
            }
        } else {
            append_to_log(&temp_log, "mesh '%s' invalid", meshes[current_model].filename);
        }

        // draw log
        font_gl.set_state();
        at := [2]f32{0.0, 1.0};
        for s in temp_log {
            num, dx, dy := font_gl.draw_string(&font, 16, at, 0, s);
            at.y += (s == "" ? 10.0 : dy);
        }

        glfw.SwapBuffers(window);
    }
}

//
view :: proc(r, u, f, p: [3]f32) -> math.Mat4 { 
    return math.Mat4 {
        {+r[0], +u[0], -f[0], 0.0},
        {+r[1], +u[1], -f[1], 0.0},
        {+r[2], +u[2], -f[2], 0.0},
        {-math.dot(r,p), -math.dot(u,p), math.dot(f,p), 1.0},
    };
}

