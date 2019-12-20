/*
 *  @Name:     debug_windows
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 10-05-2017 21:11:30
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 05-02-2018 00:20:29 UTC+1
 *  
 *  @Description:
 *      Contains all the drawing code for debug windows.
 */
import       "core:fmt.odin";
import win32 "core:sys/windows.odin";

import       "shared:odin-xinput/xinput.odin"; 
import gl    "shared:libbrew/gl.odin";
import wgl   "shared:libbrew/win/opengl_wgl.odin";
import imgui "shared:libbrew/brew_imgui.odin";
import console "shared:libbrew/imgui_console.odin";

import        "time.odin";
import        "catalog.odin";
import        "debug_info.odin";
import shower "window_shower.odin";
import ja     "asset.odin";
import jinput "input.odin";

STD_WINDOW :: imgui.Window_Flags.NoCollapse;

_chosen_catalog : i32;
_PreviewSize := imgui.Vec2{20, 20};
_ShowID : gl.Texture = 1;

/*show_struct_info :: proc(name : string, show : ^bool, data : any) {
    imgui.begin(name, show, STD_WINDOW);
    {
        imgui.columns(2, "nil", true);
        info := type_info_base(data.type_info).(^Type_Info.Struct);
        for n, i in info.names {
            imgui.text("%s", n);
            imgui.next_column();
            switch t in info.types[i] {
                case TypeInfo.Pointer : {
                    if t.elem == nil {
                        imgui.text("RAWPTR");
                    } else {
                        buf : [128]byte;
                        s := fmt.bprintf(buf[..], "%s##%s", "Show Value", n);
                        if imgui.collapsing_header(s, 0) {
                            ptr := ^byte(data.data) + info.offsets[i];
                            value := ^rawptr(ptr)^;
                            v := any{rawptr(value), t.elem};
                            show_struct_info(n, nil, v);
                        }
                    }
                }

                case TypeInfo.Boolean : {
                    value := ^byte(data.data) + info.offsets[i];
                    col := bool(value^) ? imgui.Vec4{0, 1, 0, 1} : imgui.Vec4{1, 0, 0, 1};
                    v := any{rawptr(value), type_info_base(info.types[i])};
                    imgui.text_colored(col, "%t", v);
                }                

                case : {
                    value := ^byte(data.data) + info.offsets[i];
                    v := any{rawptr(value), info.types[i]};
                    imgui.text_wrapped("%v", v);
                } 
            }
            imgui.separator();
            imgui.next_column();
        }
    }
    imgui.end();
}*/

stat_overlay :: proc(show : ^bool) {
    imgui.set_next_window_pos(imgui.Vec2{5, 25}, 0);
    imgui.push_style_color(imgui.Color.WindowBg, imgui.Vec4{0.23, 0.23, 0.23, 0.4});
    imgui.begin("Stat Overlay", show, imgui.Window_Flags.NoMove | imgui.Window_Flags.NoTitleBar | imgui.Window_Flags.NoResize | imgui.Window_Flags.NoSavedSettings); 
    {
        io := imgui.get_io();
        imgui.text("Framerate:"); imgui.same_line();
        ms := 1000.0 / io.framerate;
        pop := false;
        if ms > 17 {
            pop = true;
            if ms > 33.555 {
                imgui.push_style_color(imgui.Color.Text, imgui.Vec4{1, 0, 0, 1});
            } else {
                imgui.push_style_color(imgui.Color.Text, imgui.Vec4{0.96, 0.86, 0.26, 1});
            }
        }
        imgui.text("%.0ffps (%.2fms)", io.framerate, ms);
        if pop do imgui.pop_style_color();
        imgui.separator();
    }   
    imgui.end();
    imgui.pop_style_color(1);
}

opengl_extensions :: proc(name : string, extensions : [dynamic]string, show : ^bool) {
    imgui.begin(name, show, STD_WINDOW); 
    {
        for ext in extensions {
            imgui.text(ext);
        }
    }   
    imgui.end();
}

show_gl_texture_overview :: proc(show : ^bool) {
    _CalculateMaxcolumns :: proc(w : f32, csize : f32, max : i32) -> i32 {
        columns := i32(w / csize);
        if columns > max {
            columns = max;
        }

        if columns <= 0 {
            columns = 1;
        }
        return columns;
    }

    imgui.begin("Loaded Textures", show, STD_WINDOW);
    {
        imgui.columns(count = 2, border = false);
        {
            imgui.drag_float("Preview Size:", &_PreviewSize.x, 0.2, 20, 100, "%.0f", 1);
            imgui.separator();
            _PreviewSize.y = _PreviewSize.x;
            size := imgui.get_window_size();
            columns := _CalculateMaxcolumns(size.x, _PreviewSize.x + 12, i32(len(debug_info.ogl.textures)));
            imgui.begin_child("", imgui.Vec2{0, 0}, false, 0);
            {
                imgui.columns(columns, "nil", false);
                for id in debug_info.ogl.textures {
                    color := id == _ShowID ? imgui.Vec4{1, 1, 1, 1} : imgui.Vec4{0.91, 0.4, 0.23, 1};
                    imgui.image(user_texture_id = imgui.TextureID(uintptr(id)), 
                                size = _PreviewSize, 
                                border_col = color);
                    if imgui.is_item_hovered() {
                        imgui.begin_tooltip();
                        {
                            imgui.text("ID: %d", id);
                        }
                        imgui.end_tooltip();
                    }
                    if imgui.is_item_clicked(0) {
                        _ShowID = id;
                    }
                    imgui.next_column();
                }
                imgui.columns_reset();
            }
            imgui.end_child();
        }
        imgui.next_column();
        size := imgui.get_window_size();
        imgui.image(user_texture_id = imgui.TextureID(uintptr(_ShowID)), 
                    size = imgui.Vec2{size.x, size.y - 60}, 
                    border_col = imgui.Vec4{0.91, 0.4, 0.23, 0});
        imgui.next_column();
    }
    imgui.end();
}

opengl_info :: proc(vars : ^gl.Opengl_Vars, show : ^bool) {
    imgui.begin("OpenGL Info", show, STD_WINDOW);
    {
        imgui.text("Versions:");
        imgui.indent();
            imgui.text("Highest: NOT_WORKING");
            imgui.text("Current: %s", vars.version_string);
            imgui.text("GLSL:    %s", vars.glsl_version_string);
        imgui.unindent();
        imgui.text("Lib Address 0x%x", debug_info.ogl.lib_address);
        imgui.separator();
            imgui.text("Vendor:   %s", vars.vendor_string);
            imgui.text("Render:   %s", vars.renderer_string);
        imgui.separator();
            imgui.text("Number of extensions:       %d", vars.num_extensions); imgui.same_line(0, -1);
            if imgui.small_button("View##Ext") {
                shower.set_window_state("OpenGLShowExtensions", true);
            }
            imgui.text("Number of WGL extensions:   %d", vars.num_wgl_extensions);imgui.same_line(0, -1);
            if imgui.small_button("View##WGL") {
                shower.set_window_state("OpenGLShowWGLExtensions", true);
            }
            imgui.text("Number of loaded Textures: %d", len(debug_info.ogl.textures)); imgui.same_line(0, -1);
            if imgui.small_button("View##texture") {
                shower.set_window_state("texture_overview", true);
            }
            imgui.text("Number of functions loaded: %d/%d", debug_info.ogl.number_of_functions_loaded_successed, debug_info.ogl.number_of_functions_loaded); 
        imgui.separator();
        if imgui.collapsing_header("Loaded Functions") {
            imgui.begin_child(str_id = "Functions###FuncLoad", border = true);
            imgui.columns(count = 3, border = false);
            suc : string;
            for status in debug_info.ogl.statuses {
                imgui.set_column_width(width = 250);
                imgui.text(status.name);
                imgui.next_column();
                imgui.set_column_width(width = 100);
                c : imgui.Vec4;
                if status.success { 
                    c = imgui.Vec4{0,0.78,0,1};
                    suc = "true";
                } else {
                    c = imgui.Vec4{1,0,0,1};
                    suc = "false";
                }
                imgui.text_colored(c, "Loaded: %s", suc);
                imgui.next_column();
                imgui.text("@ 0x%X", status.address);
                imgui.next_column();
            }
            imgui.columns_reset();
            imgui.end_child();
        }
    }
    imgui.end();

    if shower.get_window_state("OpenGLShowExtensions") {
        b := shower.get_window_state("OpenGLShowExtensions");
        opengl_extensions("Extensions##Ext", vars.extensions, &b);
        shower.set_window_state("OpenGLShowExtensions", b);
    }

    if shower.get_window_state("OpenGLShowWGLExtensions") {
        b := shower.get_window_state("OpenGLShowWGLExtensions");
        opengl_extensions("WGL Extensions", vars.wgl_extensions, &b);
        shower.set_window_state("OpenGLShowWGLExtensions", b);
    }

    //try_show_window("ShowGLtextureOverview", opengl_texture_overview);
}

_print_gamepad_name :: proc(user : xinput.User, err : xinput.Error) {
    imgui.text("Gamepad %d(", int(user)+1);
    b := err == xinput.Success;
    c : imgui.Vec4;
    if b {
        c = imgui.Vec4{0,0.78,0,1};
    } else {
        c = imgui.Vec4{1,0,0,1};
    }
    imgui.same_line(0, 0);
    imgui.text_colored(c, "%s", b ? "Connected" : "Not Connected");
    imgui.same_line(0, 0);
    imgui.text("):");
}

show_xinput_info_window :: proc(show : ^bool) {
    imgui.begin("XInput Info", show, STD_WINDOW);
    {
        imgui.text("Version: %s", xinput.Version);
        imgui.text("Lib Address: 0x%x", 0/*int(debug_info.xinput.LibAddress)*/);
        imgui.text("Number of functions loaded: %d/%d", debug_info.xinput.number_of_functions_loaded_successed, debug_info.xinput.number_of_functions_loaded); 
        if imgui.collapsing_header("Loaded Functions") {
            imgui.begin_child("Functions###FuncLoad", imgui.Vec2{0, 150}, true);
            imgui.columns(3, "nil", false);
            suc : string;
            for status in debug_info.xinput.statuses {
                imgui.text(status.name);
                imgui.next_column();
                c : imgui.Vec4;
                if status.success { 
                    c = imgui.Vec4{0,0.78,0,1};
                    suc = "true";
                } else {
                    c = imgui.Vec4{1,0,0,1};
                    suc = "false";
                }
                imgui.text_colored(c, "Loaded: %s", suc);
                imgui.next_column();
                imgui.text("@ 0x%X", status.address);
                imgui.next_column();


            }
            imgui.columns_reset();
            imgui.end_child();
        }

        imgui.columns(2, "nil", true);
        for user in xinput.User {
            cap, err := xinput.GetCapabilities(user);
            _print_gamepad_name(user, err);
            if err == xinput.Success {
                imgui.text("Capabilites:");
                imgui.indent(20.0);
                    imgui.text("Subtype %s", cap.sub_type);
                    imgui.text("Flags:");
                    imgui.indent(10.0);
                        CheckCapability :: proc(cap : xinput.Capabilities, c : xinput.CapabilitiesFlags) -> bool {
                            return cap.flags & c == c;
                        }

                        imgui.text("Voice:         %t", CheckCapability(cap, xinput.CapabilitiesFlags.Voice)        );
                        imgui.text("FFB:           %t", CheckCapability(cap, xinput.CapabilitiesFlags.FFB)          );
                        imgui.text("Wireless:      %t", CheckCapability(cap, xinput.CapabilitiesFlags.Wireless)     );
                        imgui.text("PMD:           %t", CheckCapability(cap, xinput.CapabilitiesFlags.PMD)          );
                        imgui.text("NoNavigations: %t", CheckCapability(cap, xinput.CapabilitiesFlags.NoNavigations));
                    imgui.unindent(10.0);    
                imgui.unindent(20.0);
                imgui.text("Battery Information:");
                imgui.indent(20.0);
                    imgui.text("Battery Type:  %s", "N/A");
                    imgui.text("Battery Level: %s", "N/A");
                imgui.unindent(20.0);
            }

            imgui.next_column();
            if int(user)%2 == 0 {
                imgui.separator();
            }
        }
        imgui.columns_reset();
    }
    imgui.end();
}

show_xinput_state_window :: proc(show : ^bool) {
    imgui.begin("XInput State", show, STD_WINDOW);
    {
        imgui.columns(2, "nil", true);
        for user in xinput.User {
            state, err := xinput.GetState(user);
            _print_gamepad_name(user, err);
            if err == xinput.Success {
                imgui.indent(10.0);
                {
                    imgui.text("button States:");
                    imgui.indent(10.0);
                    {
                        IsButtonPressed :: proc(state : xinput.State, b : xinput.Buttons) -> bool {
                            return state.gamepad.buttons & u16(b) == u16(b);
                        }

                        imgui.text("DpadUp:        %t", IsButtonPressed(state, xinput.Buttons.DpadUp)       );
                        imgui.text("DpadDown:      %t", IsButtonPressed(state, xinput.Buttons.DpadDown)     );
                        imgui.text("DpadLeft:      %t", IsButtonPressed(state, xinput.Buttons.DpadLeft)     );
                        imgui.text("DpadRight:     %t", IsButtonPressed(state, xinput.Buttons.DpadRight)    );
                        imgui.text("Start:         %t", IsButtonPressed(state, xinput.Buttons.Start)        );
                        imgui.text("Back:          %t", IsButtonPressed(state, xinput.Buttons.Back)         );
                        imgui.text("LeftThumb:     %t", IsButtonPressed(state, xinput.Buttons.LeftThumb)    );
                        imgui.text("RightThumb:    %t", IsButtonPressed(state, xinput.Buttons.RightThumb)   );
                        imgui.text("LeftShoulder:  %t", IsButtonPressed(state, xinput.Buttons.LeftShoulder) );
                        imgui.text("RightShoulder: %t", IsButtonPressed(state, xinput.Buttons.RightShoulder));
                        imgui.text("A:             %t", IsButtonPressed(state, xinput.Buttons.A)            );
                        imgui.text("B:             %t", IsButtonPressed(state, xinput.Buttons.B)            );
                        imgui.text("X:             %t", IsButtonPressed(state, xinput.Buttons.X)            );
                        imgui.text("Y:             %t", IsButtonPressed(state, xinput.Buttons.Y)            );
                    }
                    imgui.unindent(10.0);
                    imgui.text("Trigger States:");
                    imgui.indent(10.0);
                    {
                        imgui.text("Left Trigger:  %d(%.1f%%)", state.gamepad.left_trigger,  (f32(state.gamepad.left_trigger)/255.0)*100.0);
                        imgui.text("Right Trigger: %d(%.1f%%)", state.gamepad.right_trigger, (f32(state.gamepad.right_trigger)/255.0)*100.0);
                    }
                    imgui.unindent(10.0);
                    imgui.text("Stick States:");
                    imgui.indent(10.0);
                    {
                        imgui.text("Left Stick:  <%d, %d>", state.gamepad.lx, state.gamepad.ly);
                        imgui.text("Right Stick: <%d, %d>", state.gamepad.rx, state.gamepad.ry);
                    }
                    imgui.unindent(10.0);
                }
                imgui.unindent(10.0);
            }
            
            imgui.next_column();
            if int(user)%2 == 0 {
                imgui.separator();
            }
        }
        imgui.columns_reset();
    }
    imgui.end();
}

show_catalog_window :: proc(catalogs : []^catalog.Catalog, show : ^bool) {
    if imgui.begin("Catalog Window", show, STD_WINDOW) {
        defer imgui.end();
        names : [dynamic]string;
        for c, i in catalogs {
            append(&names, c.name);
        }
        imgui.combo("Chosen", &_chosen_catalog, names[..]);
        imgui.separator();
        catalog := catalogs[_chosen_catalog];
        imgui.columns(2, "info", false);
        imgui.set_column_width(-1, 45);
        {
            imgui.text("Path:"); imgui.next_column(); imgui.text("%s", catalog.path); imgui.next_column();
        }
        imgui.columns_reset();

        imgui.text("Asset Kinds:");        
        imgui.indent(20);
        {
            imgui.columns(2, "kinds", false);
            imgui.set_column_width(-1, 35);
            for k, v in catalog.items_kind {
                imgui.text("%v", v); imgui.next_column(); imgui.text("%v%s", k, v > 1 ? "s" : ""); imgui.next_column();
            }
            imgui.columns_reset();
        }
        imgui.unindent(20);
        if imgui.begin_child(str_id = "Items", size = imgui.Vec2{0, -18}) {
            defer imgui.end_child();
            imgui.columns(count = 2, border = false);
            for _, a in catalog.items {
                imgui.selectable(label = a.file_name, flags = imgui.Selectable_Flags.SpanAllColumns);
                if imgui.is_item_hovered() {
                    imgui.begin_tooltip();
                    defer imgui.end_tooltip();

                    imgui.text("Path: %v", a.path);
                    imgui.text("Size: %d byts", a.size);
                    imgui.text("Address: %p", a);

                    switch b in a.derived {
                        case ^ja.Texture: {
                            imgui.text("Width: %v", b.width);
                            imgui.text("Height: %v", b.height);
                            imgui.text("Comp: %v", b.comp);
                            imgui.text("OpenGL ID: %v", b.gl_id);
                        }

                        case ^ja.Shader: {
                            imgui.text("OpenGL ID:  %v", b.gl_id);
                            imgui.text("Type: %v", b.type_);
                            imgui.text("Length: %v", len(b.source));
                        }

                        case ^ja.Model_3d: {
                           /* imgui.text("Vertices: %d", b.vert_num);
                            imgui.text("Normals: %d",  b.norm_num);
                            imgui.text("UVs: %d",      b.uv_num); 

                            imgui.text("Vert Ind: %d", b.vert_ind_num);
                            imgui.text("Norm Ind: %d", b.norm_ind_num);
                            imgui.text("Uv Ind: %d", b.uv_ind_num);*/
                        }
                    }
                }
                imgui.next_column();
                col := imgui.Vec4{};
                if a.loaded {
                    col = imgui.Vec4{0, 0.7, 0, 1};
                } else {
                    col = imgui.Vec4{1, 0, 0, 1};
                }
                imgui.text_colored(col, a.loaded ? "Loaded" : "Not Loaded");
                imgui.next_column();
            }
            imgui.columns_reset();
        }
        imgui.separator();
        imgui.text_colored(imgui.Vec4{1, 1, 1, 0.4}, 
                           "Files: %d | Current Size: %d | Max Size: %d", catalog.files_in_catalog, 
                                                                          catalog.current_size, 
                                                                          catalog.max_size);
    }
}

show_input_window :: proc(input : ^jinput.Input, show : ^bool) {
    imgui.begin("Input##JazeInput", show, STD_WINDOW);
    {
    imgui.columns(4);
        imgui.text("ID");
        imgui.next_column();
        imgui.text("Key");
        imgui.next_column();
        imgui.text("Xinput button");
        imgui.next_column();
        imgui.text("State");
        imgui.separator();
        imgui.next_column();

        if len(input.bindings) > 0 {
            for _, v in input.bindings {
                imgui.text("%v", v.id);
                imgui.next_column();
                imgui.text("%v", v.key);
                imgui.next_column();
                imgui.text("%v", v.x_button);
                imgui.next_column();
                imgui.text("%v", jinput.get_button_state(input, v.id));
                imgui.next_column();
            }
        } else {
            imgui.text("No bindings found!");
            imgui.next_column();
            imgui.text("N/A");
            imgui.next_column();
            imgui.text("N/A");
            imgui.next_column();
            imgui.text("N/A");
            imgui.next_column();
        }

        imgui.columns_reset();

        PrintDownHeld :: proc(keyStates : []jinput.ButtonStates) {
            imgui.columns(2);
            imgui.text("Key");
            imgui.next_column();
            imgui.text("State");
            imgui.separator();
            imgui.next_column();
            for k in win32.Key_Code {
                if keyStates[k] == jinput.ButtonStates.Down || 
                   keyStates[k] == jinput.ButtonStates.Held {
                    imgui.text("%v", k);
                    imgui.next_column();
                    imgui.text("%v", keyStates[k]);
                    imgui.next_column();
                }      
            }
        }

        PrintUpNeutral :: proc(keyStates : []jinput.ButtonStates) {
            imgui.columns(2);
            imgui.text("Key");
            imgui.next_column();
            imgui.text("State");
            imgui.separator();
            imgui.next_column();
            for k in win32.Key_Code {
                if keyStates[k] == jinput.ButtonStates.Up || 
                   keyStates[k] == jinput.ButtonStates.Neutral {
                    imgui.text("%v", k);
                    imgui.next_column();
                    imgui.text("%v", keyStates[k]);
                    imgui.next_column();
                }      
            }
        }

        imgui.separator();
        if imgui.collapsing_header("Key states") {
            imgui.columns(2);
            imgui.begin_child("Down Held", imgui.Vec2{0, 0}, true);
            PrintDownHeld(input.key_states[..]);
            imgui.end_child();
            imgui.next_column();
            imgui.begin_child("Up Neutral", imgui.Vec2{0, 0}, true);
            PrintUpNeutral(input.key_states[..]);
            imgui.end_child();
            imgui.next_column();
        }
    }
    imgui.end();
}