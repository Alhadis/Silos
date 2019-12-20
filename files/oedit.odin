import "core:fmt.odin"
import "core:os.odin"
import "core:strings.odin"

import "shared:odin-glfw/glfw.odin"
import "shared:odin-gl/gl.odin"

using import "buffer.odin"
using import "font.odin"

HEIGHT :int = 540;
WIDTH  :int = HEIGHT / 3 * 4;

the_window : glfw.Window_Handle;
running    : bool;

buff: ^Buffer;

test_font: ^Font;
scroll   :f32 = 0.0;

init_glfw_and_opengl :: proc(width, height: int) {
    if glfw.Init() == 0 {
        fmt.printf("Failed to init glfw!\n");
        os.exit(1);
    }
    
    glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 3);
    glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 3);
    glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);
    
    the_window = glfw.CreateWindow(i32(width), i32(height), "oedit\x00", nil, nil);
    if the_window == nil {
        fmt.printf("Failed to create glfw window!\n");
        glfw.Terminate();
        os.exit(1);
    }
    
    glfw.MakeContextCurrent(the_window);
    glfw.SwapInterval(0);
    
    c := new(Context);
    c^ = context;
    glfw.SetWindowUserPointer(the_window, c);
    
    get_proc_address :: proc(p: rawptr, name: string) {
        (cast(^rawptr)p)^ = glfw.GetProcAddress(&name[0]);
    }
    gl.load_up_to(3, 3, get_proc_address);
    
    close_callback :: proc(window: glfw.Window_Handle) do running = false;
    glfw.SetWindowCloseCallback(the_window, glfw.Window_Close_Proc(close_callback));
    
    resize_callback :: proc(window: glfw.Window_Handle, w, h: i32) {
        WIDTH = int(w);
        HEIGHT = int(h);
        gl.Viewport(0, 0, w, h);
    }
    glfw.SetWindowSizeCallback(the_window, glfw.Window_Size_Proc(resize_callback));
    
    key_callback :: proc(window: glfw.Window_Handle, key, scancode, action, mods: i32) {
        c: Context = (cast(^Context)glfw.GetWindowUserPointer(window))^;
        context <- c {
            
            if action == glfw.PRESS && key == glfw.KEY_ESCAPE {
                running = false;
            }
            
            if action == glfw.PRESS || action == glfw.REPEAT {
                if key == glfw.KEY_ENTER {
                    buffer_insert(buff, '\n');
                }
                
                if key == glfw.KEY_BACKSPACE {
                    buffer_remove(buff);
                }
                
                if key == glfw.KEY_LEFT {
                    buffer_move_left(buff);
                }
                
                if key == glfw.KEY_RIGHT {
                    buffer_move_right(buff);
                }
            }
        }
    }
    glfw.SetKeyCallback(the_window, glfw.Key_Proc(key_callback));
    
    scroll_callback :: proc(window: glfw.Window_Handle, dx, dy: f64) {
        scroll += f32(dy)*test_font.line_advance;
    }
    glfw.SetScrollCallback(the_window, glfw.Scroll_Proc(scroll_callback));
    
    text_callback :: proc(window: glfw.Window_Handle, cp: u32) {
        c: Context = (cast(^Context)glfw.GetWindowUserPointer(window))^;
        context <- c {
            r := rune(cp);
            buffer_insert(buff, r);
        }
    }
    glfw.SetCharCallback(the_window, glfw.Char_Proc(text_callback));
    
    cvendor   := gl.GetString(gl.VENDOR);
    crenderer := gl.GetString(gl.RENDERER);
    cversion  := gl.GetString(gl.VERSION);
    fmt.printf("GL_VENDOR: %s\n", strings.to_odin_string(cvendor));
    fmt.printf("GL_RENDERER: %s\n", strings.to_odin_string(crenderer));
    fmt.printf("GL_VERSION: %s\n", strings.to_odin_string(cversion));
}


main :: proc() {
    init_glfw_and_opengl(WIDTH, HEIGHT);
    running = true;
    
    init_font_shader();
    
    buff = make_empty_buffer("test-buffer");
    buffer_insert(buff, "Hello, world!");
    buffer_seek(buff, -6);
    buffer_insert(buff, "Odin!");
    buffer_insert(buff, "A very very very long string!");
    
    file_buffer := load_buffer_from_file("oedit.odin");
    fmt.printf("Loaded file\n");
    //os.write_entire_file("test.txt", cast([]u8)buffer_to_utf8_string(file_buffer)[..]);
    //fmt.printf("Wrote buffer\n");
    
    test_font = load_font_at_size("fonts/consola.ttf", 18);
    
    //test_font = load_font_at_size("fonts/consola.ttf", 64);
    //test_font = load_font_at_size("fonts/arial.ttf", 8, true);
    //test_font = load_font_at_size("fonts/Karmina Regular.otf", 16);
    
    fg := Color{f32(0x83/255.0), f32(0x94/255.0), f32(0x96/255.0), 1};
    bg := Color{0, 0.17, 0.21, 1};
    gl.ClearColor(0, 0.17, 0.21, 1);
    
    //fg := Color{1, 1, 1, 1};
    //bg := Color{0, 0, 0, 1};
    //gl.ClearColor(0, 0, 0, 1);
    for running {
        gl.Clear(gl.COLOR_BUFFER_BIT);
        
        //draw_text(test_font, buffer_to_utf8_string(file_buffer), 0, scroll, fg, bg, WIDTH, HEIGHT);
        draw_text(test_font, buffer_to_utf8_string(buff), 0, scroll, fg, bg, WIDTH, HEIGHT);
        //draw_text(test_font, "WaTa :: struct {\n  x: f32,\n}", 0, 0, Color{f32(0x83/255.0), f32(0x94/255.0), f32(0x96/255.0), 1}, Color{0, 0.17, 0.21, 1}, WIDTH, HEIGHT);
        
        //draw_text(test_font, "This a beautiful font!", 0, 250, Color{f32(0x83/255.0), f32(0x94/255.0), f32(0x96/255.0), 1}, Color{0, 0.17, 0.21, 1}, WIDTH, HEIGHT);
        
        glfw.SwapBuffers(the_window);
        glfw.WaitEvents();
    }
}