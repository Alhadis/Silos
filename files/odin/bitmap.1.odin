package sgl

import "core:runtime"

Bitmap :: struct {
    using buffer: ^Buffer,
    width, height: int,
}

make_bitmap :: proc(_width, _height: int) -> ^Bitmap {
    using b := new(Bitmap);
    buffer = make_buffer(size_of(Pixel) * _width * _height);
    width = _width;
    height = _height;
    return b;
}

delete_bitmap :: proc(using b: ^Bitmap) {
    destroy(buffer);
    free(b);
}

draw_pixel :: inline proc(using b: ^Bitmap, x, y: int, color: Color) {
    write_buffer_element(buffer, x + y * width, color_to_pixel(color));
}

clear_bitmap :: inline proc(using b: ^Bitmap, color: Color) {
    for i in 0..<width*height do write_buffer_element(buffer, i, color_to_pixel(color));
}