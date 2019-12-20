package harfbuzz

import "core:c"
import "core:mem"

// TODO: import from shared or something else
// or maybe, separate harfbuzz and harfbuzz-freetype into separate pacakges
import ft "../freetype"


// TODO: linkage for windows and linux
when ODIN_OS == "darwin" do foreign import hblib "system:harfbuzz";


Font :: distinct rawptr;
Buffer :: distinct rawptr;

Feature :: struct {
    tag: u32,
    value: u32,
    start: u32,
    end: u32,
}

Glyph_Position :: struct {
    x_advance: i32,
    y_advance: i32,
    x_offset: i32,
    y_offset: i32,

    // private:
    _var: u32,
}

Glyph_Info :: struct {
    codepoint: u32,
    mask: u32,
    cluster: u32,

    // private:
    _var1: u32,
    _var2: u32,
}

Callback :: proc "c" (data: rawptr);

@(default_calling_convention="c", link_prefix="hb")
foreign hblib {
    _ft_font_create :: proc(face: ft.Face, destroy: Callback) -> Font ---;
    _buffer_create :: proc() -> Buffer ---;
    _buffer_add_utf8 :: proc(buffer: Buffer, text: ^u8, length: c.int, item_offset: c.uint, item_length: c.int) ---;
    _buffer_guess_segment_properties :: proc(buffer: Buffer) ---;
    _shape :: proc(font: Font, buffer: Buffer, feature: ^Feature, num_features: c.uint) ---;
    _buffer_get_length :: proc(buffer: Buffer) -> c.uint ---;
    _buffer_get_glyph_infos :: proc(buffer: Buffer, length: ^c.uint) -> ^Glyph_Info ---;
    _buffer_get_glyph_positions :: proc(buffer: Buffer, length: ^c.uint) -> ^Glyph_Position ---;
}

FontCreate :: proc(face: ft.Face, destroy: Callback = nil) -> Font {
    return _ft_font_create(face, destroy);
}

BufferCreate :: _buffer_create;

BufferAddText :: proc(buffer: Buffer, text: string, start: uint = 0, length: int = -1) {
    _buffer_add_utf8(buffer, &text[0], i32(len(text)), u32(start), i32(length));
}

BufferGuessProperties :: _buffer_guess_segment_properties;

Shape :: proc(font: Font, buffer: Buffer, features: []Feature = nil) -> ([]Glyph_Info, []Glyph_Position) {
    _shape(font, buffer, mem.raw_data(features), u32(len(features)));
    length := int(_buffer_get_length(buffer));
    infos_ptr := _buffer_get_glyph_infos(buffer, nil);
    positions_ptr := _buffer_get_glyph_positions(buffer, nil);

    infos := AsSlice(infos_ptr, length);
    positions := AsSlice(positions_ptr, length);
    return infos, positions;
}

AsSlice :: proc(ptr: ^$T, length: int) -> []T {
    return transmute([]T)mem.Raw_Slice{cast(rawptr)ptr, length};
}
