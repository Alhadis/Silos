package sgl

import "core:fmt"
import "core:strings"
import "core:strconv"

OBJ_Index :: struct {
    vertex_index: int,
    tex_coord_index: int,
    normal_index: int
}

OBJ_Model :: struct {
    positions:  []V4,
    tex_coords: []V2,
    normals:    []V4,
    indices:    []OBJ_Index,
    has_tex_coords: bool,
    has_normals: bool
}

load_obj_model :: proc(s: string) -> ^OBJ_Model {
    parse_obj_index :: proc(s: string) -> (i: OBJ_Index) {
        values := strings.split(s, "/");
        defer delete(values);

        i.vertex_index = strconv.parse_int(values[0]) - 1;

        if len(values) > 1 {
            if len(values[1]) > 0 {
                i.tex_coord_index = strconv.parse_int(values[1]) - 1;
            }

            if len(values) > 2 {
                i.normal_index = strconv.parse_int(values[2]) - 1;
            }
        }
        return;
    }

    positions := make([dynamic]V4);
    tex_coords := make([dynamic]V2);
    normals := make([dynamic]V4);
    indices := make([dynamic]OBJ_Index);

    lines := strings.split(s, "\n");
    defer delete(lines);

    for line in lines {
        tokens := strings.split(line, " ");
        defer delete(tokens);

        if len(tokens) == 0 || tokens[0] == "#" do continue;

        switch tokens[0] {
            case "v":
                append(&positions, V4{
                    strconv.parse_f64(tokens[1]),
                    strconv.parse_f64(tokens[2]),
                    strconv.parse_f64(tokens[3]),
                    1
                });
            case "vt":
                append(&tex_coords, V2{
                    strconv.parse_f64(tokens[1]),
                    1 - strconv.parse_f64(tokens[2])
                });
            case "vn":
                append(&normals, V4{
                    strconv.parse_f64(tokens[1]),
                    strconv.parse_f64(tokens[2]),
                    strconv.parse_f64(tokens[3]),
                    0
                });
            case "f":
                for i in 0..<len(tokens)-3 {
                    append(&indices, parse_obj_index(tokens[1]));
                    append(&indices, parse_obj_index(tokens[2 + i]));
                    append(&indices, parse_obj_index(tokens[3 + i]));
                }
        }
    }

    m := new(OBJ_Model);
    m.positions = positions[:];
    m.tex_coords = tex_coords[:];
    m.normals = normals[:];
    m.indices = indices[:];
    m.has_tex_coords = len(tex_coords) > 0;
    m.has_normals = len(normals) > 0;
    return m;
}

delete_obj_model :: proc(using m: ^OBJ_Model) {
    delete(positions);
    delete(tex_coords);
    delete(normals);
    delete(indices);
    free(m);
}