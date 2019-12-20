package gui

import sdl "shared:odin-sdl2"
import sdl_image "shared:odin-sdl2/image"

import ft "../freetype"
import hb "../harfbuzz"

import "core:fmt"
import "core:mem"
import "core:strings"
import "core:unicode/utf8"

FontSet :: struct {
    ft_fonts: [dynamic]ft.Face,
    hb_fonts: [dynamic]hb.Font,
}

LoadFont :: proc(lib: ft.Library, s: ^FontSet, path: cstring, face_index: int = 0) {
    assert(len(s.ft_fonts) == len(s.hb_fonts));
    ftfont: ft.Face;
    ft.New_Face(lib, path, i64(face_index), &ftfont);
    hbfont := hb.FontCreate(ftfont);
    append(&s.ft_fonts, ftfont);
    append(&s.hb_fonts, hbfont);
}

ft_render_text_run_to_texture :: proc(renderer: ^sdl.Renderer, fonts: ^FontSet, text: string, st: Text_Style) -> ^sdl.Texture {
    surface := ft_render_text_run(fonts, text, st);
    if surface == nil {
        return nil;
    }
    defer sdl.free_surface(surface);
    return sdl.create_texture_from_surface(renderer, surface);
}

Text_Style :: struct {
    color: sdl.Color,
    size: int, // in pixels!!
}

// kind of internal function - should be considered a building block or something
ft_render_text_run :: proc(fonts: ^FontSet, text: string, st: Text_Style) -> ^sdl.Surface {
    for face in fonts.ft_fonts {
        ft.Set_Pixel_Sizes(face, 0, u32(st.size));
    }

    // first we should segment the text into several segments based on language and font availability
    // but for now we'll just use the first matching font for testing

    first_matching_font_index := 0;
    match_loop:
    for c in text {
        for face, font_index in fonts.ft_fonts {
            glyph_index := ft.Get_Char_Index(face, u64(c));
            if glyph_index == 0 {
                continue; // next font!
            }
            first_matching_font_index = font_index;
            break match_loop;
        }
    }
    // assume a matching font was found and default to first font
    hb_font := fonts.hb_fonts[first_matching_font_index];
    ft_font := fonts.ft_fonts[first_matching_font_index];

    // shape the text!
    buffer := hb.BufferCreate();
    hb.BufferAddText(buffer, text);
    hb.BufferGuessProperties(buffer);
    hb_infos, hb_positions := hb.Shape(hb_font, buffer);

    // pass: determine display width
    width := i32(0);
    measure_loop:
    for pos in hb_positions {
        width += pos.x_advance / 64;
    }
    width *= 2; // HACK!
    height := i32(st.size);

    surface := sdl.create_rgb_surface(0, width, height * 2, 32,
        0x000000ff,
        0x0000ff00,
        0x00ff0000,
        0xff000000,
    );

    x, y: i64;
    y = i64(st.size);

    for info, index in hb_infos {
        pos := &hb_positions[index];
        // glyph_index := ft.Get_Char_Index(ft_font, u64(info.codepoint));
        // if glyph_index == 0 {
        //     // not found!
        //     continue;
        // }
        glyph_index := info.codepoint;
        fmt.println("glyph index:", glyph_index);
        err := ft.Load_Glyph(ft_font, glyph_index, .LOAD_DEFAULT);
        if err != 0 {
            fmt.println("error loading glyph");
            continue;
        }
        err = ft.Render_Glyph(ft_font.glyph, .RENDER_MODE_NORMAL);
        if err != 0 {
            fmt.println("error rendering glyph");
            continue;
        }

        fmt.println("position:", pos);

        bitmap := ft_font.glyph.bitmap;
        buffer := bitmap.buffer;
        target := cast(^u8)surface.pixels;
        for j in 0..< bitmap.rows {
            row := int(j);
            srcRow := mem.ptr_offset(buffer, row * int(bitmap.pitch));
            targetRow := mem.ptr_offset(target, (int(y) + row - int(ft_font.glyph.bitmap_top)) * int(surface.pitch));
            for i in 0..< bitmap.width {
                v := mem.ptr_offset(srcRow, int(i))^;
                if v == 0 do continue;
                pixelColor := st.color;
                pixelColor.a = v;
                px := mem.ptr_offset(targetRow, int((u32(x) + i + u32(ft_font.glyph.bitmap_left)) * 4));
                mem.copy(px, &pixelColor, 4);
            }
        }
        x += i64(pos.x_advance) / 64;
    }
    return surface;
}

main :: proc() {
    bg_color := hsla(0, 0, 99.5);
    txt_color := hsla(0, 0, 30);
    ime_color := hsla(0, 0, 60);

    fmt.println(bg_color, txt_color, ime_color);

    sdl.init(sdl.Init_Flags.Everything);
    window := sdl.create_window("Test window", i32(sdl.Window_Pos.Undefined), i32(sdl.Window_Pos.Undefined), 1024, 900, sdl.Window_Flags(0));
    renderer := sdl.create_renderer(window, -1, sdl.Renderer_Flags(0));
    sdl_image.init(sdl_image.Init_Flags.PNG);

    ftlib: ft.Library;
    if ft.Init_FreeType(&ftlib) != 0 {
        fmt.println("ft init failed!!");
        return;
    }

    fonts: FontSet;
    LoadFont(ftlib, &fonts, "fonts/NotoSans-Medium.ttf");
    LoadFont(ftlib, &fonts, "fonts/DroidNaskh-Regular.ttf");
    LoadFont(ftlib, &fonts, "fonts/ackaisyo.ttf");

    txt_style := Text_Style{txt_color, 70};
    ime_style := Text_Style{ime_color, 70};

    // ft_surface := ft_render_text_run(fonts, "hello 世界 هلة", txt_style);
    // ft_texture := sdl.create_texture_from_surface(renderer, ft_surface);
    // sdl.free_surface(ft_surface);

    texture := sdl_image.load_texture(renderer, "images/img1.png");

    text_surface0 := ft_render_text_run(&fonts, "HarfBuzz!!", txt_style);
    text_texture0 := sdl.create_texture_from_surface(renderer, text_surface0);
    sdl.free_surface(text_surface0);

    text_surface1 := ft_render_text_run(&fonts, "كتابة عَرَبيةٌ أهلاً وَ سهلا", txt_style);
    text_texture1 := sdl.create_texture_from_surface(renderer, text_surface1);
    sdl.free_surface(text_surface1);

    text_surface2 := ft_render_text_run(&fonts, "日本語でも！", txt_style);
    text_texture2 := sdl.create_texture_from_surface(renderer, text_surface2);
    sdl.free_surface(text_surface2);

    Input_State :: struct {
        data: [dynamic]byte,
        ime_data: [dynamic]byte,
        cursor: int,
        ui_pos: sdl.Rect,
        rendered_input: ^sdl.Texture,
        rendered_ime: ^sdl.Texture,
    };

    input_state: Input_State;
    input_state.data = make([dynamic]byte, 0, 32);
    input_state.ime_data = make([dynamic]byte, 0, 32);
    input_state.ui_pos = sdl.Rect{x = 100, y = 1200, w = 0, h = 0};

    sdl.start_text_input();
    sdl.set_text_input_rect(&input_state.ui_pos);

    running := true;
    for running {
        e: sdl.Event;
        for sdl.poll_event(&e) != 0 {
            switch e.type {
                case .Quit:
                    running = false;
                case .Text_Input:
                    input_string := as_string(e.text.text[:]);
                    fmt.println("text input event", input_string);
                    input_bytes := cast([]byte)input_string;
                    append(&input_state.data, ..input_bytes);
                    resize(&input_state.ime_data, 0);
                    if input_state.rendered_input != nil {
                        sdl.destroy_texture(input_state.rendered_input);
                        input_state.rendered_input = nil;
                    }
                    if input_state.rendered_ime != nil {
                        sdl.destroy_texture(input_state.rendered_ime);
                        input_state.rendered_ime = nil;
                    }
                    input_state.rendered_input = ft_render_text_run_to_texture(renderer, &fonts, string(input_state.data[:]), txt_style);
                case .Text_Editing:
                    input_string := as_string(e.text.text[:]);
                    fmt.println("text editing event", input_string);
                    resize(&input_state.ime_data, len(input_string));
                    copy(input_state.ime_data[:], cast([]byte)input_string);
                    if input_state.rendered_ime != nil {
                        sdl.destroy_texture(input_state.rendered_ime);
                        input_state.rendered_ime = nil;
                    }
                    input_state.rendered_ime = ft_render_text_run_to_texture(renderer, &fonts, string(input_state.ime_data[:]), ime_style);
            }
        }
        sdl.set_render_draw_color(renderer, bg_color.r, bg_color.g, bg_color.b, bg_color.a);
        sdl.render_clear(renderer);

        pos := sdl.Rect{20, 20, 800, 400};
        sdl.render_copy(renderer, texture, nil, &pos);

        pos.y = 460;
        pos.x = 100;

        // sdl.query_texture(ft_texture, nil, nil, &pos.w, &pos.h);
        // sdl.render_copy(renderer, ft_texture, nil, &pos);

        pos.y += pos.h + 20;
        sdl.query_texture(text_texture0, nil, nil, &pos.w, &pos.h);
        sdl.render_copy(renderer, text_texture0, nil, &pos);

        pos.y += pos.h + 20;
        sdl.query_texture(text_texture1, nil, nil, &pos.w, &pos.h);
        sdl.render_copy(renderer, text_texture1, nil, &pos);

        pos.y += pos.h + 20;
        sdl.query_texture(text_texture2, nil, nil, &pos.w, &pos.h);
        sdl.render_copy(renderer, text_texture2, nil, &pos);

        if input_state.rendered_input != nil {
            sdl.query_texture(input_state.rendered_input, nil, nil, &input_state.ui_pos.w, &input_state.ui_pos.h);
            sdl.render_copy(renderer, input_state.rendered_input, nil, &input_state.ui_pos);
        }
        if input_state.rendered_ime != nil {
            pos = input_state.ui_pos;
            pos.x += pos.w + 4;
            sdl.query_texture(input_state.rendered_ime, nil, nil, &pos.w, &pos.h);
            sdl.render_copy(renderer, input_state.rendered_ime, nil, &pos);
        }

        sdl.render_present(renderer);

        sdl.delay(100);
    }

    sdl.quit();
}

// does not allocate. Just slices the data up to the null terminator
as_string :: proc(data: []u8) -> string {
    // find the zero term
    z := 0;
    for b, i in data {
        if b == 0 {
            z = i;
            break;
        }
    }
    return string(data[:z]);
}

hsla :: proc(h, s, l: f64, a: f64 = 1) -> sdl.Color {
    r, g, b := float_hsl_to_rgb(h / 255.0, s / 100.0, l / 100.0);
    fmt.printf("hsl(%v, %v, %v) -> rgb(%v, %v, %v)\n", h, s, l, r, g, b);
    return sdl.Color {
        r = u8(int(r * 255)),
        g = u8(int(g * 255)),
        b = u8(int(b * 255)),
        a = u8(int(a * 255)),
    };
}

// taken from https://github.com/alessani/ColorConverter/blob/master/ColorSpaceUtilities.h
float_hsl_to_rgb :: proc(h: f64, s: f64, l: f64) -> (r: f64, g: f64, b: f64) {
    // Check for saturation. If there isn't any just return the luminance value for each, which results in gray.
    if s == 0.0 {
        return l, l, l;
    }

    temp2: f64;
    // Test for luminance and compute temporary values based on luminance and saturation
    if(l < 0.5) {
        temp2 = l * (1.0 + s);
    } else {
        temp2 = l + s - l * s;
    }
    temp1 := 2.0 * l - temp2;

    // Compute intermediate values based on hue
    temp := []f64{
        h + 1.0 / 3.0,
        h,
        h - 1.0 / 3.0,
    };

    for i in 0..<3 {
        // Adjust the range
        if(temp[i] < 0.0) {
            temp[i] += 1.0;
        }
        if(temp[i] > 1.0) {
            temp[i] -= 1.0;
        }

        if(6.0 * temp[i] < 1.0) {
            temp[i] = temp1 + (temp2 - temp1) * 6.0 * temp[i];
        } else {
            if(2.0 * temp[i] < 1.0) {
                temp[i] = temp2;
            } else {
                if(3.0 * temp[i] < 2.0) {
                    temp[i] = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - temp[i]) * 6.0;
                } else {
                    temp[i] = temp1;
                }
            }
        }
    }

    return temp[0], temp[1], temp[2];
}
