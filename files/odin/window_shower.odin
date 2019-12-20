/*
 *  @Name:     window_shower
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hoej@northwolfprod.com
 *  @Creation: 15-11-2017 18:23:51
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 02-02-2018 22:37:46 UTC+1
 *  
 *  @Description:
 *  
 */

import imgui "shared:libbrew/brew_imgui.odin";

global_debug_wnd_bools : map[string]bool;

get_window_state :: proc(str : string) -> bool {
    b, ok := global_debug_wnd_bools[str];
    if ok {
        return b;
    } else {
        global_debug_wnd_bools[str] = false;
        return false;
    }
}

set_window_state :: proc(str : string, state : bool) {
    global_debug_wnd_bools[str] = state;
}

toggle_window_state :: proc(str : string) {
    global_debug_wnd_bools[str] = !global_debug_wnd_bools[str];
}

try_show_window :: proc(id : string, p : proc(b : ^bool)) {
    if get_window_state(id) {
        b := get_window_state(id);
        p(&b);
        set_window_state(id, b);
    }
}

show_debug_windows_states :: proc(show : ^bool) {
    imgui.begin("Debug Window States", show, imgui.Window_Flags.NoCollapse);
    {
        imgui.begin_child("Window States");
        imgui.columns(2, "nil", true);
        for id, val in global_debug_wnd_bools {
            imgui.text("%s", id);
            imgui.next_column();
            imgui.text("%t", val);
            imgui.next_column();
            imgui.separator();
        }
        imgui.columns_reset();
        imgui.end_child();
    }
    imgui.end();
}
