/*
 *  @Name:     main
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hoej@northworldprod.com
 *  @Creation: 31-05-2017 21:57:56
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 05-02-2018 02:49:20 UTC+1
 *  
 *  @Description:
 *      Entry point of Jaze
 */
import "core:fmt.odin";
import "core:os.odin";
import "core:strings.odin";
import "core:mem.odin";

import       "shared:libbrew/win/window.odin";
import       "shared:libbrew/win/msg.odin";
import       "shared:libbrew/win/file.odin";
import misc  "shared:libbrew/win/misc.odin";
import input "shared:libbrew/win/keys.odin";
import wgl   "shared:libbrew/win/opengl.odin";

import         "shared:libbrew/gl.odin";
import imgui   "shared:libbrew/brew_imgui.odin";
import         "shared:libbrew/string_util.odin";
import console "shared:libbrew/imgui_console.odin";
import leak    "shared:libbrew/leakcheck.odin";

import       "shared:odin-xinput/xinput.odin"; 
import curl  "shared:ocurl/ocurl_easy.odin";

import         "debug_info.odin";
import         "gl_util.odin";
import         "engine.odin";
import         "catalog.odin";
import         "renderer.odin";
import obj     "obj_parser.odin";
import shower  "window_shower.odin";
import dbg_win "debug_windows.odin";
import jinput  "input.odin";
import ja      "asset.odin";
import kvs     "key_value_store.odin";

opengl_debug_callback :: proc "cdecl" (source : gl.DebugSource, type_ : gl.DebugType, id : i32, severity : gl.DebugSeverity, length : i32, message : ^u8, userParam : rawptr) {
    console.logf_error("[%v | %v | %v] %s \n", source, type_, severity, strings.to_odin_string(message));
}

console_error_callback :: proc() {
    b := shower.get_window_state("console");
    if !b {
        shower.toggle_window_state("console");
    }
}

set_proc_gl :: proc(lib_ : rawptr, p: rawptr, name: string) {
    set_proc(lib_, p, name, &debug_info.ogl);
}

set_proc_xinput :: proc(lib_ : rawptr, p: rawptr, name: string) {
    set_proc(lib_, p, name, &debug_info.xinput);
}

set_proc :: inline proc(lib_ : rawptr, p: rawptr, name: string, info : ^debug_info.Info) {
    lib := misc.LibHandle(lib_);
    res := wgl.get_proc_address(name);
    if res == nil {
        res = misc.get_proc_address(lib, name);
    }   
    if res == nil {
        fmt.println("Couldn't load:", name);
    }

    (^rawptr)(p)^ = rawptr(res);

    status := debug_info.Function_Load_Status{};
    status.name = name;
    status.address = int(uintptr(rawptr(res)));
    status.success = false;
    info.number_of_functions_loaded += 1;

    if status.address != 0 {
        status.success = true;
        info.number_of_functions_loaded_successed += 1;
    }
    append(&info.statuses, status);

}

load_lib :: proc(str : string) -> rawptr {
    return rawptr(misc.load_library(str));
}

free_lib :: proc(lib : rawptr) {
    misc.free_library(misc.LibHandle(lib));
}

jaze_style :: proc() {
    style := imgui.get_style();

    style.window_padding        = imgui.Vec2{6, 6};
    style.window_rounding       = 0;
    style.child_rounding        = 2;
    style.frame_padding         = imgui.Vec2{4 ,2};
    style.frame_rounding        = 2;
    style.frame_border_size     = 1;
    style.item_spacing          = imgui.Vec2{8, 4};
    style.item_inner_spacing    = imgui.Vec2{4, 4};
    style.touch_extra_padding   = imgui.Vec2{0, 0};
    style.indent_spacing        = 20;
    style.scrollbar_size        = 12;
    style.scrollbar_rounding    = 9;
    style.grab_min_size         = 9;
    style.grab_rounding         = 1;
    style.window_title_align    = imgui.Vec2{0.48, 0.5};
    style.button_text_align     = imgui.Vec2{0.5, 0.5};

    style.colors[imgui.Color.Text]                  = imgui.Vec4{1.00, 1.00, 1.00, 1.00};
    style.colors[imgui.Color.TextDisabled]          = imgui.Vec4{0.63, 0.63, 0.63, 1.00};
    style.colors[imgui.Color.WindowBg]              = imgui.Vec4{0.23, 0.23, 0.23, 0.98};
    style.colors[imgui.Color.ChildBg]               = imgui.Vec4{0.20, 0.20, 0.20, 1.00};
    style.colors[imgui.Color.PopupBg]               = imgui.Vec4{0.25, 0.25, 0.25, 0.96};
    style.colors[imgui.Color.Border]                = imgui.Vec4{0.18, 0.18, 0.18, 0.98};
    style.colors[imgui.Color.BorderShadow]          = imgui.Vec4{0.00, 0.00, 0.00, 0.04};
    style.colors[imgui.Color.FrameBg]               = imgui.Vec4{0.00, 0.00, 0.00, 0.29};
    style.colors[imgui.Color.TitleBg]               = imgui.Vec4{32.0/255.00, 32.0/255.00, 32.0/255.00, 1};
    style.colors[imgui.Color.TitleBgCollapsed]      = imgui.Vec4{0.12, 0.12, 0.12, 0.49};
    style.colors[imgui.Color.TitleBgActive]         = imgui.Vec4{32.0/255.00, 32.0/255.00, 32.0/255.00, 1};
    style.colors[imgui.Color.MenuBarBg]             = imgui.Vec4{0.11, 0.11, 0.11, 0.42};
    style.colors[imgui.Color.ScrollbarBg]           = imgui.Vec4{0.00, 0.00, 0.00, 0.08};
    style.colors[imgui.Color.ScrollbarGrab]         = imgui.Vec4{0.27, 0.27, 0.27, 1.00};
    style.colors[imgui.Color.ScrollbarGrabHovered]  = imgui.Vec4{0.78, 0.78, 0.78, 0.40};
    style.colors[imgui.Color.CheckMark]             = imgui.Vec4{0.78, 0.78, 0.78, 0.94};
    style.colors[imgui.Color.SliderGrab]            = imgui.Vec4{0.78, 0.78, 0.78, 0.94};
    style.colors[imgui.Color.Button]                = imgui.Vec4{0.42, 0.42, 0.42, 0.60};
    style.colors[imgui.Color.ButtonHovered]         = imgui.Vec4{0.78, 0.78, 0.78, 0.40};
    style.colors[imgui.Color.Header]                = imgui.Vec4{0.31, 0.31, 0.31, 0.98};
    style.colors[imgui.Color.HeaderHovered]         = imgui.Vec4{0.78, 0.78, 0.78, 0.40};
    style.colors[imgui.Color.HeaderActive]          = imgui.Vec4{0.80, 0.50, 0.50, 1.00};
    style.colors[imgui.Color.TextSelectedBg]        = imgui.Vec4{0.65, 0.35, 0.35, 0.26};
    style.colors[imgui.Color.ModalWindowDarkening]  = imgui.Vec4{0.20, 0.20, 0.20, 0.35};
}


main :: proc() {    
    console.set_error_callback(console_error_callback);
    console.add_default_commands();
    console.log("Program Start...");
    app_handle := misc.get_app_handle();
    width, height := 1280, 720;
    console.log("Creating Window...");
    wnd_handle := window.create_window(app_handle, "Jaze", width, height);
    console.log("Creating GL Context...");
    glCtx      := wgl.create_gl_context(wnd_handle, 4, 5);
    console.log("Load GL Functions...");
    gl.load_functions(set_proc_gl, load_lib, free_lib);

    dear_state := new(imgui.State);
    console.log("Initialize Dear ImGui...");
    imgui.init(dear_state, wnd_handle, jaze_style, true);

    wgl.swap_interval(-1);
    gl.clear_color(41/255.0, 57/255.0, 84/255.0, 1);

    message               : msg.Msg;
    show_imgui            : bool = true;
    mpos_x                : int;
    mpos_y                : int;
    prev_lm_down          : bool;
    lm_down               : bool;
    rm_down               : bool;
    scale_by_max          : bool = false;
    adaptive_vsync        : bool = true;

    time_data             := misc.create_time_data();
    acc_time              := 0.0;
    i                     := 0;
    shift_down            := false;
    new_frame_state       := imgui.FrameState{};
    show_test             := false;
    show_gl_info          := false;
    show_shower_state    := false;
    gl_vars               := gl.Opengl_Vars{};
    
    console.log("Setting up catalogs...");
    catalog.add_default_extensions();
    catalog.setup_mutex();
    test_catalog    := catalog.create("test", "data\\test");
    texture_catalog := catalog.create("texture", "data\\textures");
    shader_catalog  := catalog.create("shader", "data\\shaders");
    sound_catalog   := catalog.create("sound", "data\\sounds");
    font_catalog    := catalog.create("font", "data\\fonts");
    model_catalog   := catalog.create("model", "data\\models");

    shower.set_window_state("console", true);
    
    console.log("Creating engine context");
    EngineContext := engine.create_default_context();

    console.log("Setting up OpenGL");
    gl.debug_message_callback(opengl_debug_callback, nil);
    gl.enable(gl.Capabilities.DebugOutputSynchronous);
    gl.debug_message_control(gl.DebugSource.DontCare, gl.DebugType.DontCare, gl.DebugSeverity.Notification, 0, nil, false);
    gl.get_info(&gl_vars);

    xinput.init(set_proc_xinput, load_lib, true);

    renderer.init(shader_catalog, model_catalog, width, height);

    console.log("Entering Main Loop...");
main_loop: 
    for {
        prev_lm_down = lm_down ? true : false;
        new_frame_state.mouse_wheel = 0;
        for msg.poll_message(&message) {
            switch msg in message {
                case msg.MsgQuitMessage : {
                    break main_loop;
                }

                case msg.MsgChar : {
                    imgui.gui_io_add_input_character(u16(msg.char));
                    jinput.add_char_to_queue(EngineContext.input, msg.char);
                }

                case msg.MsgKey : {
                    switch msg.key {
                        case input.VirtualKey.Escape : {
                            if msg.down == true && shift_down {
                                break main_loop;
                            }
                        }

                        case input.VirtualKey.Tab : {
                            if msg.down {
                                show_imgui = !show_imgui;
                            }
                        }

                        case input.VirtualKey.Lshift : {
                            shift_down = msg.down;
                        }
                    }
                }

                case msg.MsgMouseButton : {
                    switch msg.key {
                        case input.VirtualKey.LMouse : {
                            lm_down = msg.down;
                        }

                        case input.VirtualKey.RMouse : {
                            rm_down = msg.down;
                        }
                    }
                }

                case msg.MsgWindowFocus : {
                    new_frame_state.window_focus = msg.enter_focus;
                    jinput.set_input_neutral(EngineContext.input);
                }

                case msg.MsgMouseMove : {
                    mpos_x = msg.x;
                    mpos_y = msg.y;
                }

                case msg.MsgSizeChange : {
                    width = msg.width;
                    height = msg.height;
                    gl.viewport(0, 0, i32(width), i32(height));
                    gl.scissor (0, 0, i32(width), i32(height));
                }

                case msg.MsgMouseWheel : {
                    new_frame_state.mouse_wheel = msg.distance;
                }
            }
        }
        dt := misc.time(&time_data);
        acc_time += dt;
        //mpos_x, mpos_y = window.get_mouse_pos(wnd_handle);
        new_frame_state.deltatime = f32(dt);
        new_frame_state.mouse_x = mpos_x;
        new_frame_state.mouse_y = mpos_y;
        new_frame_state.window_width = width;
        new_frame_state.window_height = height;
        new_frame_state.left_mouse = lm_down;
        new_frame_state.right_mouse = rm_down;

        catalog.handle_changes();

        gl.clear(gl.ClearFlags.COLOR_BUFFER | gl.ClearFlags.DEPTH_BUFFER);

        renderer.render(acc_time, width, height);

        if new_frame_state.window_focus {
            jinput.update(EngineContext.input);
        }
        imgui.begin_new_frame(&new_frame_state);
        if imgui.begin_main_menu_bar() {
            defer imgui.end_main_menu_bar();
            
            if imgui.begin_menu("Misc") {
                defer imgui.end_menu();
                if imgui.checkbox("Adpative Vsync", &adaptive_vsync) {
                    wgl.swap_interval(adaptive_vsync ? -1 : 0);
                }

                if imgui.menu_item("Show Test Window") {
                    shower.toggle_window_state("test_window");
                }
                
                imgui.menu_item(label = "LibBrew Info", enabled = false);
                
                if imgui.menu_item("OpenGL Info") {
                    shower.toggle_window_state("opengl_info");
                }
                
                if imgui.begin_menu("xInput") {
                    defer imgui.end_menu();
                    if imgui.menu_item("Info") {
                        shower.toggle_window_state("xinput_info");
                    }
                    if imgui.menu_item("State") {
                        shower.toggle_window_state("xinput_state");
                    }
                }
                
                if imgui.menu_item("Debug Windows Info") {
                    shower.toggle_window_state("debug_state");
                }
                
                if imgui.menu_item("Console") {
                    shower.toggle_window_state("console");
                }
                
                if imgui.menu_item("Catalog") {
                    shower.toggle_window_state("catalog_window");
                }
                
                if imgui.menu_item("Input") {
                    shower.toggle_window_state("input_window");
                }
                
                imgui.separator();
                imgui.menu_item("Toggle Fullscreen", "Alt+Enter", false);
                
                if imgui.menu_item("Exit", "LShift + Esc") {
                    break main_loop;
                }
            }
        }

        if shower.get_window_state("test_window") {
            b := shower.get_window_state("test_window");
            imgui.show_demo_window(&b);
            shower.set_window_state("test_window", b);
        }

        if shower.get_window_state("opengl_info") {
            b := shower.get_window_state("opengl_info");
            dbg_win.opengl_info(&gl_vars, &b);
            shower.set_window_state("opengl_info", b);
        }

        if shower.get_window_state("input_window") {
            b := shower.get_window_state("input_window");
            dbg_win.show_input_window(EngineContext.input, &b);
            shower.set_window_state("input_window", b);
        }
        if shower.get_window_state("catalog_window") {
            b := shower.get_window_state("catalog_window");
            dbg_win.show_catalog_window(catalog.created_catalogs[..], &b);
            shower.set_window_state("catalog_window", b);
        }

        {
            c := shower.get_window_state("console");
            cl := shower.get_window_state("console_log");
            ch := shower.get_window_state("console_history");
            if c {
                console.draw_console(&c, &cl, &ch);
            }

            if cl {
                console.draw_log(&cl);
            }

            if ch {
                console.draw_history(&ch);
            }

            shower.set_window_state("console", c);
            shower.set_window_state("console_log", cl);
            shower.set_window_state("console_history", ch);
        }

        if imgui.begin("Camer Controls") {
            defer imgui.end();
            imgui.push_button_repeat(true);
            if imgui.button("-##posx") do renderer.camera.pos.x -= 1;
            imgui.same_line();
            imgui.text("x: %v", renderer.camera.pos.x);
            imgui.same_line();
            if imgui.button("+##posx") do renderer.camera.pos.x += 1;

            if imgui.button("-##posy") do renderer.camera.pos.y -= 1;
            imgui.same_line();
            imgui.text("y: %v", renderer.camera.pos.y);
            imgui.same_line();
            if imgui.button("+##posy") do renderer.camera.pos.y += 1;

            if imgui.button("-##posz") do renderer.camera.pos.z -= 1;
            imgui.same_line();
            imgui.text("z: %v", renderer.camera.pos.z);
            imgui.same_line();
            if imgui.button("+##posz") do renderer.camera.pos.z += 1;
            imgui.pop_button_repeat();
        }
     
        shower.try_show_window("texture_overview", dbg_win.show_gl_texture_overview);
        shower.try_show_window("debug_state",      shower.show_debug_windows_states);
        shower.try_show_window("xinput_info",      dbg_win.show_xinput_info_window);
        shower.try_show_window("xinput_state",     dbg_win.show_xinput_state_window);

        dbg_win.stat_overlay(nil);

        jinput.clear_char_queue(EngineContext.input);
        imgui.render_proc(dear_state, show_imgui, width, height);
        window.swap_buffers(wnd_handle);
    }

    console.log("Ending Application...");
    imgui.shutdown();
}