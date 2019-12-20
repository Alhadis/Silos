/*
 *  @Name:     debug
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 10-05-2017 21:11:30
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 24-09-2017 22:00:49
 *  
 *  @Description:
 *      Contains all the debug menu stuff related to the Menu bar.
 *      Also contains the function to try and render debug windows.
 */
import win32 "core:sys/windows.odin";
import "jwin32.odin";
import debug_wnd "debug_windows.odin";
import "imgui.odin";
import "main.odin";
import "console.odin";
import "engine.odin";
import "game.odin";
import wgl "jwgl.odin";

render_debug_ui :: proc(ctx : ^engine.Context, gameCtx : ^game.Context) {
   make_menu_bar(ctx);
   try_to_render_windows(ctx, gameCtx);
}

make_menu_bar :: proc(ctx : ^engine.Context) {
     make_menu_item :: proc(title : string, id : string) {
        make_menu_item(title, "", id);
    }

    make_menu_item :: proc(title : string, shortcut : string, id : string) {
        if imgui.menu_item(title, shortcut, false, true) {
            debug_wnd.toggle_window_state(id);
        }
    }

    imgui.push_style_color(imgui.GuiCol.MenuBarBg, imgui.Vec4{0.35, 0.35, 0.35, 0.78});
    imgui.begin_main_menu_bar();

    if imgui.begin_menu("Game", true) {
        make_menu_item("Entity List", "ShowEntityList");
        make_menu_item("Game Info", "ShowGameInfo");
        imgui.end_menu();
    }
   
    if imgui.begin_menu("Data", true) {
        make_menu_item("OpenGL Info", "ShowOpenGLInfo");
        make_menu_item("Win32Var Info", "ShowWin32VarInfo");
        make_menu_item("Time Data", "ShowTimeData");
        make_menu_item("Engine Info", "ShowEngineInfo");
        imgui.end_menu();
    }

    if imgui.begin_menu("Input", true) {
        make_menu_item("Keyboard & Mouse", "ShowInputWindow");
        if imgui.begin_menu("XInput", true) {
            make_menu_item("Info", "ShowXinputInfo");
            make_menu_item("State", "ShowXinputState");
            imgui.end_menu();
        }
        imgui.end_menu();
    }

    if imgui.begin_menu("Asset", true) {
        make_menu_item("Catalogs", "ShowCatalogWindow");
        imgui.end_menu();
    }

    if imgui.begin_menu("Visual", true) {
        if imgui.checkbox("Adaptive VSync", &ctx.adaptive_vsync) {
            if ctx.adaptive_vsync {
                wgl.SwapIntervalEXT(-1);
            } else {
                wgl.SwapIntervalEXT(0);
            }
        }
        {
            b := debug_wnd.get_window_state("ShowStatOverlay");
            if imgui.checkbox("Stat Overlay", &b) {
                debug_wnd.set_window_state("ShowStatOverlay", b);
            }
        }

        if imgui.checkbox("Hardware Cursor", &ctx.settings.show_cursor) {
            win32.show_cursor(win32.Bool(ctx.settings.show_cursor));
        }
        
        imgui.end_menu();
    }

    if imgui.begin_menu("Misc", true) {
        make_menu_item("Console", "Alt+C", "ShowConsoleWindow");
        make_menu_item("Debug Window States", "ShowDebugWindowStates");
        make_menu_item("Show Test Window", "ShowTestWindow");

        imgui.separator();
        imgui.menu_item("Toggle Fullscreen", "Alt+Enter", false, false);

        
        if imgui.menu_item("Exit", "Escape", false, true) {
            ctx.settings.program_running = false;
        }
        imgui.end_menu();
    }
    imgui.end_main_menu_bar();
    imgui.pop_style_color(1);
}

try_to_render_windows :: proc(ctx : ^engine.Context, gameCtx : ^game.Context) {
    if debug_wnd.get_window_state("ShowOpenGLInfo") {
        b := debug_wnd.get_window_state("ShowOpenGLInfo");
        debug_wnd.opengl_info(&ctx.win32.Ogl, &b);
        debug_wnd.set_window_state("ShowOpenGLInfo", b);
    }

    if debug_wnd.get_window_state("ShowInputWindow") {
        b := debug_wnd.get_window_state("ShowInputWindow");
        debug_wnd.show_input_window(ctx.input, &b);
        debug_wnd.set_window_state("ShowInputWindow", b);
    }

    if debug_wnd.get_window_state("ShowWin32VarInfo") {
        b := debug_wnd.get_window_state("ShowWin32VarInfo");
        debug_wnd.show_struct_info("Win32 Info", &b, ctx.win32^);;
        debug_wnd.set_window_state("ShowWin32VarInfo", b);
    }

    if debug_wnd.get_window_state("ShowEntityList") {
        b := debug_wnd.get_window_state("ShowEntityList");
        debug_wnd.show_entity_list(gameCtx, &b);
        debug_wnd.set_window_state("ShowEntityList", b);
    }

        if debug_wnd.get_window_state("ShowGameInfo") {
        b := debug_wnd.get_window_state("ShowGameInfo");
        debug_wnd.show_struct_info("Game Info", &b, gameCtx^);
        debug_wnd.set_window_state("ShowGameInfo", b);
    }

    if debug_wnd.get_window_state("ShowTimeData") {
        b := debug_wnd.get_window_state("ShowTimeData");
        debug_wnd.show_struct_info("Time", &b, ctx.time^);
        debug_wnd.set_window_state("ShowTimeData", b);
    }

    if debug_wnd.get_window_state("ShowEngineInfo") {
        b := debug_wnd.get_window_state("ShowEngineInfo");
        debug_wnd.show_struct_info("Engine Info", &b, ctx^);
        debug_wnd.set_window_state("ShowEngineInfo", b);
    }


    debug_wnd.try_show_window("ShowXinputInfo",        debug_wnd.show_xinput_info_window);
    debug_wnd.try_show_window("ShowXinputState",       debug_wnd.show_xinput_state_window);
    debug_wnd.try_show_window("ShowCatalogWindow",     debug_wnd.show_catalog_window);
    debug_wnd.try_show_window("ShowDebugWindowStates", debug_wnd.show_debug_windows_states);
    debug_wnd.try_show_window("ShowStatOverlay",       debug_wnd.stat_overlay);
    debug_wnd.try_show_window("ShowConsoleWindow",     console.draw_console);
    debug_wnd.try_show_window("ShowLogWindow",         console.draw_log);

    if debug_wnd.get_window_state("ShowTestWindow") {
        b := debug_wnd.get_window_state("ShowTestWindow");
        imgui.show_test_window(&b);
        debug_wnd.set_window_state("ShowTestWindow", b);
    }
}