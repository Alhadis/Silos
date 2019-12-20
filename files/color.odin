package sgl

Color :: struct {
    r, g, b, a: f64
}

Pixel :: struct {
    r, g, b, a: u8
}

color_to_pixel :: inline proc(color: Color) -> (r: Pixel) {
    r.r = u8(color.r * 255 + 0.5);
    r.g = u8(color.g * 255 + 0.5);
    r.b = u8(color.b * 255 + 0.5);
    r.a = u8(color.a * 255 + 0.5);
    return;
}

add_color :: proc(a, b: Color) -> (r: Color) {
    r.r = a.r + b.r;
    r.g = a.g + b.g;
    r.b = a.b + b.b;
    r.a = a.a + b.a;
    return;
}

sub_color :: proc(a, b: Color) -> (r: Color) {
    r.r = a.r - b.r;
    r.g = a.g - b.g;
    r.b = a.b - b.b;
    r.a = a.a - b.a;
    return;
}

mul_color :: proc(c: Color, s: f64) -> (r: Color) {
    r.r = c.r * s;
    r.g = c.g * s;
    r.b = c.b * s;
    r.a = c.a * s;
    return;
}

div_color :: proc(c: Color, s: f64) -> (r: Color) {
    r.r = c.r / s;
    r.g = c.g / s;
    r.b = c.b / s;
    r.a = c.a / s;
    return;
}