package main

import "core:fmt"
import "core:os"
import "core:math"
import "core:mem"

import "shared:sgl"

VtxIn :: struct {
    using base: sgl.Vertex,
    color: sgl.Color
}

VtxOut :: struct {
    color: sgl.Color
}

rc: ^sgl.Render_Context;
program: ^sgl.Shader_Program(VtxIn, VtxOut);

t := 0.0;
projection: sgl.M4;

model_vbo: ^sgl.Buffer;
model_ibo: ^sgl.Buffer;

plane_vbo: ^sgl.Buffer;
plane_ibo: ^sgl.Buffer;

init :: proc() {
    rc = sgl.make_render_context(WIDTH, HEIGHT);
    program = sgl.make_shader_program(rc, vertex_shader_impl, fragment_shader_impl);

    projection = sgl.make_perspective(70, f64(WIDTH)/f64(HEIGHT), 0.1, 1000);

    data, ok := os.read_entire_file("models/icosphere.obj");
    if !ok do panic("Could not read model file");
    // defer delete(data); 

    model := sgl.load_obj_model(string(data));
    defer sgl.destroy(model);

    model_vbo = sgl.make_buffer(size_of(VtxIn) * len(model.positions));
    model_ibo = sgl.make_buffer(size_of(int) * len(model.indices));

    for i in 0..<len(model.positions) do sgl.write_buffer_element(model_vbo, i, VtxIn{sgl.Vertex{model.positions[i]}, sgl.Color{1, 1, 1, 1}});
    for i in 0..<len(model.indices) do   sgl.write_buffer_element(model_ibo, i, model.indices[i].vertex_index);

    plane_vbo = sgl.make_buffer(size_of(VtxIn) * 4);
    plane_ibo = sgl.make_buffer(size_of(int) * 6);

    sgl.write_buffer_element(plane_vbo, 0, VtxIn{sgl.Vertex{sgl.V4{-1, -1, 0, 1}}, sgl.Color{0, 1, 0, 1}});
    sgl.write_buffer_element(plane_vbo, 1, VtxIn{sgl.Vertex{sgl.V4{-1,  1, 0, 1}}, sgl.Color{0, 1, 0, 1}});
    sgl.write_buffer_element(plane_vbo, 2, VtxIn{sgl.Vertex{sgl.V4{ 1, -1, 0, 1}}, sgl.Color{0, 1, 0, 1}});
    sgl.write_buffer_element(plane_vbo, 3, VtxIn{sgl.Vertex{sgl.V4{ 1,  1, 0, 1}}, sgl.Color{0, 1, 0, 1}});
    sgl.write_buffer_element(plane_ibo, 0, 0);
    sgl.write_buffer_element(plane_ibo, 1, 1);
    sgl.write_buffer_element(plane_ibo, 2, 3);
    sgl.write_buffer_element(plane_ibo, 3, 0);
    sgl.write_buffer_element(plane_ibo, 4, 2);
    sgl.write_buffer_element(plane_ibo, 5, 3);
}

shutdown :: proc() {
    sgl.destroy(model_vbo);
    sgl.destroy(model_ibo);

    sgl.destroy(plane_vbo);
    sgl.destroy(plane_ibo);
    
    sgl.destroy(program);
    sgl.destroy(rc);
}

tick :: proc(dt: f64) {
    t += 1 * dt;
}

render :: proc(fb: ^sgl.Bitmap) {
    sgl.clear(rc, sgl.Color{0, 0, 0, 1});

    {
        translation := sgl.make_translation(sgl.V3{0, 0, 3 + math.sin(t)});
        rotation := sgl.make_rotation(sgl.V3{0, 0, 1}, t);

        m := sgl.mul(projection, sgl.mul(translation, rotation));

        sgl.draw_indexed(rc, model_vbo, model_ibo, m, program);
    }

    {
        translation := sgl.make_translation(sgl.V3{0, 0, 3});

        m := sgl.mul(projection, translation);

        // sgl.draw_indexed(rc, plane_vbo, plane_ibo, m, program);
    }

    mem.copy(&fb.buffer.data[0], &rc.target.buffer.data[0], len(fb.buffer.data));
}

vertex_shader_impl :: proc "c" (v: VtxIn) -> VtxOut {
    return VtxOut{v.color};
}

fragment_shader_impl :: proc "c" (v: VtxOut) -> sgl.Color {
    // fmt.println(v);
    return v.color;
}