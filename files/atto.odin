import "fmt.odin";
import . "termbox.odin";
import . "buffer.odin";
import "utf8.odin";
import "os.odin";

Atto :: struct {
    terminal_height, height: int;
    width: int;
    status_bar_height: int;
    
    tab_width: int = 4;
    show_whitespace: bool = false;
    
    running: bool = true;
    
    active_buffer: ^Buffer;
    
    draw_string_buffer: fmt.StringBuffer;
}

init_termbox :: proc(atto: ^Atto) {
    tb_init();
    atto.width = cast(int)tb_width();
    atto.terminal_height = cast(int)tb_height();
    atto.height = atto.terminal_height - atto.status_bar_height;
    atto.status_bar_height = 1;
}

foreign_system_library (
clib "c";
)

foreign clib {
    c_snprintf :: proc(s: ^u8, n: uint, format: ^u8, #c_vararg args: ...any) -> i32 #link_name "snprintf" #cc_c ---;
}

draw_string :: proc(x, y: i32, fg, bg: u16, fmts: string, args: ...any) {
    str := fmt.aprintf(fmts, ...args); // Calling this in a loop? Seriously??
    defer free(str);
    
    /*
    buffer: [2048]u8;
    len := c_snprintf(&buffer[0], 2048, &fmts[0], args);
    if len < 0 {
        assert(false);
    }*/
    
    for r in str {
        tb_change_cell(x, y, cast(u32)r, fg, bg);
        x += 1;
    }
}

// returns the width of the bar
draw_line_numbers :: proc(using buffer: ^Buffer, atto: ^Atto) -> int {
    lines := buffer_get_linecount(buffer);
    ll:= lines;
    width := 0;
    for ll > 0 {
        ll /= 10;
        width += 1;
    }
    total_width := width + 1;
    
    x := 0;
    y := atto.status_bar_height;
    for i in 0..lines {
        draw_string(cast(i32)x, cast(i32)y, TB_GREEN, TB_DEFAULT, "%d%c", i+1, '|');
        y += 1;
    }
    
    // If lines is less than height, fill in the rest of the bar
    
    return total_width;
}

draw_status_bar :: proc(using buffer: ^Buffer, atto: ^Atto) {
    for i in 0..atto.width {
        tb_change_cell(cast(i32)i, 0, ' ', TB_REVERSE, TB_REVERSE);
    }
    draw_string(0, 0, TB_REVERSE, TB_REVERSE, "%s - ", atto.active_buffer.name^);
}

draw_buffer :: proc(using buffer: ^Buffer, atto: ^Atto) {
    tb_set_clear_attributes(TB_DEFAULT, TB_DEFAULT);
    tb_clear();
    
    line_width := cast(i32)draw_line_numbers(buffer, atto);
    x : i32 = line_width;
    y : i32 = cast(i32)atto.status_bar_height;
    
    str_data := buffer_to_utf32_array(buffer);
    //os.write_entire_file("out.log", str_data);
    for r, index in str_data {
        if index == cast(int)pre {
            tb_set_cursor(x, y);
        }
        
        if r == '\n' {
            if atto.show_whitespace do tb_change_cell(x, y, '@', TB_RED, TB_DEFAULT);
            x = line_width;
            y += 1;
        } else if r == '\t' {
            if atto.show_whitespace {
                tb_change_cell(x, y, '#', TB_MAGENTA, TB_DEFAULT);
                x += 1;
                for i in 1..atto.tab_width {
                    tb_change_cell(x, y, '#', TB_MAGENTA, TB_DEFAULT);
                    x += 1;
                }
            } else {
                x += cast(i32)atto.tab_width;
            }
        } else {
            tb_change_cell(x, y, cast(u32)r, TB_DEFAULT, TB_DEFAULT);
            x += 1;
        }
    }
    
    draw_status_bar(buffer, atto);
    
    tb_present();
}

open_buffer_from_file :: proc(atto: ^Atto, path: string) {
    buffer := new(Buffer);
    buffer_init(buffer, 2);
    data, ok := os.read_entire_file(path);
    if !ok {
        assert(false);
    }
    buffer_insert(buffer, cast(string)data);
    buffer_move(buffer, 0);
    buffer.name = new_clone(path);
    
    buffer.next = atto.active_buffer.next;
    buffer.prev = atto.active_buffer;
    atto.active_buffer.next = buffer;
    
    atto.active_buffer = buffer;
}

open_empty_buffer :: proc() {
    
}

open_new_buffer :: proc() {
    
}

main :: proc() {
    atto: Atto;
    init_termbox(&atto);
    
    buffer: Buffer;
    buffer_init(&buffer, 2);
    buffer_insert(&buffer, "The\nquick\nbrown\nfox\njumps \nover\nthe\nlazy\ndog");
    
    atto.active_buffer = &buffer;
    atto.active_buffer.next = atto.active_buffer;
    atto.active_buffer.prev = atto.active_buffer;
    atto.active_buffer.name = new_clone("internal buffer");
    
    open_buffer_from_file(&atto, "atto.odin");
    
    draw_buffer(atto.active_buffer, &atto);
    
    tb_select_input_mode(TB_INPUT_ALT);
    for atto.running {
        event: tb_event;
        tb_poll_event(&event);
        
        match event.kind {
            case TB_EVENT_KEY: {
                if event.ch != 0 {
                    buffer_insert(atto.active_buffer, cast(rune)event.ch);
                } else {
                    match event.key {
                        case TB_KEY_ESC: {
                            
                        }
                        case TB_KEY_HOME: {
                            buffer_seek_home(atto.active_buffer);
                        }
                        case TB_KEY_END: {
                            buffer_seek_end(atto.active_buffer);
                        }
                        case TB_KEY_CTRL_A: {
                            buffer_seek_char_left(atto.active_buffer, ' ');
                        }
                        case TB_KEY_CTRL_D: {
                            buffer_seek_char_right(atto.active_buffer, ' ');
                        }
                        case TB_KEY_CTRL_Q: {
                            atto.running = false;
                        }
                        case TB_KEY_CTRL_W: {
                            atto.show_whitespace = !atto.show_whitespace;
                        }
                        case TB_KEY_ARROW_UP: {
                            buffer_seek_up(atto.active_buffer);
                        }
                        case TB_KEY_ARROW_DOWN: {
                            buffer_seek_down(atto.active_buffer);
                        }
                        case TB_KEY_ARROW_RIGHT: {
                            buffer_move_right(atto.active_buffer);
                        }
                        case TB_KEY_ARROW_LEFT: {
                            buffer_move_left(atto.active_buffer);
                        }
                        case TB_KEY_ENTER: {
                            buffer_insert(atto.active_buffer, '\n');
                        }
                        case TB_KEY_SPACE: {
                            buffer_insert(atto.active_buffer, ' ');
                        }
                        case TB_KEY_BACKSPACE: fallthrough;
                        case TB_KEY_BACKSPACE2: {
                            buffer_backspace(atto.active_buffer);
                        }
                        case TB_KEY_DELETE: {
                            buffer_delete(atto.active_buffer);
                        }
                        case TB_KEY_TAB: {
                            buffer_insert(atto.active_buffer, '\t');
                        }
                    }
                }
            }
        }
        
        draw_buffer(atto.active_buffer, &atto);
    }
    
    tb_shutdown();
}