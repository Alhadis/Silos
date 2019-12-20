package main

import "core:fmt"

Clear_Depth_Stencil_Value :: struct {
    depth: f32,
}

Clear_Value :: struct #raw_union {
    color: [4]f32,
    depth_stencil: f32,
}

main :: proc() {
    v : [2]Clear_Value;

    v[0].color = {0, 0, 0, 1};
    v[1].depth_stencil = 1;

    fmt.println("size_of(Clear_Value)", size_of(Clear_Value));

    fmt.println(v[0].color); // prints [0.000, 1.000, 0.000, 1.000] !!!
}
