package bitmap_font

import "core:fmt"
import "core:strings"

import sdl "shared:odin-sdl2"
import sdl_ttf "shared:odin-sdl2/ttf"

Bitmap_Font :: struct {
    texture: ^sdl.Texture,
    width: i32,
    height: i32,
    character_width: i32,
    character_height: i32,
    characters: map[rune]int
}

make_bitmap_font :: proc(_texture: ^sdl.Texture, _character_width: i32, _character_height: i32, _characters: string) -> ^Bitmap_Font {
    w, h: i32;
    if sdl.query_texture(_texture, nil, nil, &w, &h) != 0 do return nil;

    using f := new(Bitmap_Font);
    
    texture = _texture;
    width = w;
    height = h;
    character_width = _character_width;
    character_height = _character_height;
    characters = make(map[rune]int);

    i := 0;
    for c in _characters {
        characters[c] = i;
        i += 1;
    }

    return f;
}

destroy_bitmap_font :: proc(using f: ^Bitmap_Font) {
    delete(characters);
    sdl.destroy_texture(texture);
    free(f);
}

get_string_width :: proc(using f: ^Bitmap_Font, str: string) -> i32 {
    return i32(len(str)) * character_width;
}

draw_string :: proc(using f: ^Bitmap_Font, r: ^sdl.Renderer, str: string, x, y: i32) -> i32 {
    n := i32(0);
    for c in str {
        i, ok := characters[c];
        if !ok {
            n += 1;
            continue;
        }        

        per_line := int(width) / int(character_width);
        k := i32(i % per_line);
        l := i32(i / per_line);

        src := sdl.Rect{
            k * character_width,
            l * character_height, 
            character_width,
            character_height
        };

        dst := sdl.Rect{
            x + n * character_width,
            y,
            character_width,
            character_height
        };

        if r := sdl.render_copy(r, texture, &src, &dst); r != 0 do return r;

        n += 1;
    }

    return 0;
}