package jam

import "core:fmt"
import "core:strings"
import "shared:odin-gl"
import "shared:odin-glfw"

import "core:math/rand"

import "set"

import "renderer"
import "input"
import "audio"
using import "math"

keys: [348]bool;


Window_Dim :: struct
{
    x: i32,
    y: i32,
}

Game_State :: enum {
    MENU,
    GAME,
    LOSE,
}

main :: proc()
{
    error_callback :: proc"c"(error: i32, desc: cstring) {
        fmt.printf("Error code %d:\n    %s\n", error, desc);
    }
    glfw.SetErrorCallback(error_callback);
    
    if glfw.Init() == 0 do return;
    defer glfw.Terminate();
    
    dim := Window_Dim{1600, 900};
    window := glfw.CreateWindow(dim.x, dim.y, "Ludum Dare 42!", nil, nil);
    if window == nil do return;
    
    key_callback :: proc"c"(window: glfw.Window_Handle, key, scancode, action, mods: i32){
        keys[key] = action != glfw.RELEASE;
    }
    glfw.SetKeyCallback(window, key_callback);
    
    cursor_position_callback :: proc"c"(window: glfw.Window_Handle, xpos, ypos: f64) {
    }
    glfw.SetCursorPosCallback(window, cursor_position_callback);

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
    
    pr_matrix := create_ortho_mat4(0, 16, 0, 9, -1, 1);
    
    random : rand.Rand;
    rand.init(&random, cast(u64)glfw.GetTime());
    
    player := set.create_player(v2{15, 2}, v2{0.75, 0.75});
    
    b_slice := make([]set.bounce_set, 50);
    max :i32= 6;
    for i in 0..max {
        b_slice[i] = set.create_bounce(&random);
    }
    add_timer :f32= 200.0;
    
    power_ups := make([]set.power_up_set, 50);
    p_index :i32 = 0;
    power_up_now := false;
    power_timer :f32 = 100.0;// * rand.float32(random);
    max_power_timer :f32 = 100.0;
    for i in 0..50 {
        power_ups[i] = set.create_power_up(&random);
    }

    background := renderer.init_sprite(math.v2{16.0/2.0, 9.0/2.0}, math.v2{4, 3}, "art/background.png");
    
    coin := set.create_coin(&random);
    coins := set.create_coin_ui(math.v2{1, 8.5});
    
    hearts := set.create_heart(v2{13, 8.5});
    
    power_up := set.create_power_up(&random);

    maxFPS := 60.0;
    maxPeriod := 1.0 / maxFPS;
    lastTime := 0.0;
    
    game_input: input.game_input;
    
    state := Game_State.MENU;
    play_button := set.create_button(math.v2{16.0/2.0, 6.5}, set.button_type.PLAY);
    quit_button := set.create_button(math.v2{16.0/2.0, 4}, set.button_type.QUIT);

    for !glfw.WindowShouldClose(window){
        time := glfw.GetTime();
        delta := cast(f32)(time - lastTime);
        gl.ClearColor(0.0, 0.0, 1.0, 1.0);
        
        glfw.PollEvents();
        input.update(&game_input, window, keys);

        gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
        
        if state == Game_State.MENU {
            max = 6;
            player.score = 0;
            set.draw_button(&play_button, program, pr_matrix);
            set.draw_button(&quit_button, program, pr_matrix);
            play := set.update_button(&play_button, &game_input);
            quit := set.update_button(&quit_button, &game_input);
            fmt.println(play, quit);
            if play {
                state = Game_State.GAME;
            }else if quit {
                glfw.SetWindowShouldClose(window, true);
            }
        }

        if state == Game_State.GAME{
            set.draw_player(&player, program, pr_matrix);
            set.update_player(&player, game_input, &b_slice, max, delta);
            
            set.draw_coin(&coin, program, pr_matrix);
            set.update_coin(&coin, &player, &random);

            if power_up_now{
                set.draw_power_up(&power_ups[p_index], program, pr_matrix);
                u, i := set.update_power_up(&power_ups[p_index], &player, &random, p_index);
                if u {
                    max = 5;
                }
                if i != p_index {
                    power_up_now = false;
                }
                p_index = i;
            } else {
                power_timer -= delta;
                if power_timer <= 0.0 {
                    power_up_now = true;
                    power_timer = max_power_timer;
                }
            }
            set.draw_coin_ui(&coins, player, program, pr_matrix);
            
            set.draw_hearts(&hearts, player, program, pr_matrix);
            
            for i in 0..max {
                set.draw_bounce(&b_slice[i], program, pr_matrix);
                set.update_bounce(&b_slice[i], delta);
            }
            
            if add_timer > 0.0 {
                add_timer -= delta;
            } else {
                if max > 50 {
                    fmt.println("Max");
                }else{
                    b_slice[max] = set.create_bounce(&random);
                    max += 1;
                    add_timer = 200.0;
                }
            }
            if player.health <= 0 {
                state = Game_State.LOSE;
            }
        }
        if state == Game_State.LOSE {
            fmt.println("You died your final score was ", player.score);
            glfw.SetWindowShouldClose(window, true);
        }
        draw_background(&background, program, pr_matrix);
        
        glfw.SwapBuffers(window);
        
        //Limit fps
        if cast(f64)delta >= maxPeriod {
            lastTime = time;
        }
    }
}

draw_background :: proc(sprite: ^renderer.sprite, program: u32, pr_matrix: math.mat4) {
    renderer.use_program(program);
    renderer.set_uniforms(sprite.transform, pr_matrix, program);
    renderer.draw_sprite(sprite);
}
