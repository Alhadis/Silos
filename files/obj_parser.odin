/*
 *  @Name:     obj_parser
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hoej@northwolfprod.com
 *  @Creation: 23-11-2017 00:26:57
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 05-02-2018 05:05:49 UTC+1
 *  
 *  @Description:
 *      A (bad) Wavefront OBJ parser.
 */

import "core:fmt.odin";
import "core:math.odin";
import "core:os.odin";
import "core:strconv.odin";
import "core:strings.odin";

import "shared:libbrew/string_util.odin";
import console "shared:libbrew/imgui_console.odin";

import ja "asset.odin";

Mtl :: struct {
    name : string,
    ambient : math.Vec3,
    diffuse : math.Vec3,
    specular : math.Vec3,
}

Mtl_Lib :: struct {
    materials : map[string]Mtl,
}

parse :: proc(text : string, path : string) -> ja.Model_3d {
    result := ja.Model_3d{};

    mtl_lib       := Mtl_Lib{
        {
            "wood" = {name = "wood", diffuse = math.Vec3{1, 0, 0}},
            "wall" = {name = "wall", diffuse = math.Vec3{0, 1, 0}},
            "roof" = {name = "roof", diffuse = math.Vec3{0, 0, 1}},
            "cotton" = {name = "cotton", diffuse = math.Vec3{1, 1, 0}},
        }
    };

    mtl_lib_found := false;
    current_mtl   := Mtl{diffuse = math.Vec3{1, 0, 1}};
    
    vpos    : [dynamic]math.Vec3;
    normals : [dynamic]math.Vec3;
    uvs     : [dynamic]math.Vec2;

    line, rem := string_util.get_line_and_remainder(text);
    loop: for {
        line_header := get_line_header(line);
        switch(line_header) {
            case "v" : 
                append(&vpos, parse_vec3_line(line[len("v")+1..]));

            case "vn" :
                append(&normals, parse_vec3_line(line[len("vn")+1..]));

            case "vt" :
                append(&uvs, parse_vec2_line(line[len("vt")+1..]));

            case "f" : 
                append(&result.vertices, ...parse_indices_line(line[len("f")+1..], vpos[..], normals[..], uvs[..], current_mtl));
            
            case "mtllib" : {
                mtl_lib = parse_mtllib(line[len("mtllib")+1..], path);
                mtl_lib_found = true;
            }

            case "usemtl" : {
                if mtl_lib_found {
                    name := line[len("usemtl")+1..len(line)-1];
                    mtl, ok := mtl_lib.materials[name];
                    if !ok {
                        console.logf_error("Could not find material %s in the mtllib", name);
                        break;
                    }
                    
                    current_mtl = mtl;
                } else {
                    console.logf_error("Trying to use material but no mtllib is loaded");
                }
            }
        }

        line, rem = string_util.get_line_and_remainder(rem);
        if line == "" && rem == "" {
            break loop;
        }
    }



/*    for i in 0..len(vert_indices) {
        vi  := vert_indices[i];
        uvi := uv_indices[i];
        ni  := norm_indices[i];
        pos := vpos[vi];
        pos.y = -pos.y;
        uv := uvs[uvi];
        norm := normals[ni];

        mtl, ok := material_line[vi];
        if ok {
            current_mtl = mtl;
        }

        append(&result.vertices, ja.Vertex{pos, uv, norm, current_mtl.diffuse});
    }*/

    return result;
}

get_line_header :: proc(line : string) -> string {
    for r, idx in line {
        if r == ' ' || r == '\n' {
            return line[..idx];
        }
    }
    return "INVALID";
}

parse_vec3_line :: proc(line : string) -> math.Vec3 {
    values := string_util.split_by(line[..len(line)-1], ' ');
    if len(values) != 3 {
        console.logf_error("Error parsing model, expected 3 elements got %d", len(values));
        return math.Vec3{};
    }
    v := math.Vec3{f32(strconv.parse_f64(values[0])), 
                   f32(strconv.parse_f64(values[1])), 
                   f32(strconv.parse_f64(values[2]))};
    return v;
}

parse_vec2_line :: proc(line : string) -> math.Vec2 {
    values := string_util.split_by(line[..len(line)-1], ' ');
    if len(values) != 2 {
        console.logf_error("Error parsing model, expected 2 elements got %d", len(values));
        return math.Vec2{};
    }
    v := math.Vec2{f32(strconv.parse_f64(values[0])), 
                   f32(strconv.parse_f64(values[1]))};
    return v; 
}

parse_indices_line :: proc(line : string, vpos, norms : []math.Vec3, uvs : []math.Vec2, mtl : Mtl) -> []ja.Vertex {
    result : [dynamic]ja.Vertex;
    start := 0;

    indices := string_util.split_by(line[..len(line)-1], ' '); defer free(indices);
    for ind in indices {
        values := string_util.split_by(ind, '/'); defer free(values);
        vtx := ja.Vertex{};
        vtx.color = mtl.diffuse;

        vcount := len(values);
        if vcount == 1 {
            vi := u32(strconv.parse_uint(values[0], 0))-1;
            vtx.pos = vpos[vi];
            vtx.pos.y = -vtx.pos.y; // Flip y
        } else if vcount == 2 {
            vi := u32(strconv.parse_uint(values[0], 0))-1;
            ui := u32(strconv.parse_uint(values[1], 0))-1;
            
            vtx.pos = vpos[vi];
            vtx.pos.y = -vtx.pos.y; // Flip y
            vtx.uv = uvs[ui];
        } else if vcount == 3 {
            vi := u32(strconv.parse_uint(values[0], 0))-1;
            ui := u32(strconv.parse_uint(values[1], 0))-1;
            ni := u32(strconv.parse_uint(values[2], 0))-1;
            vtx.pos = vpos[vi];
            vtx.pos.y = -vtx.pos.y; // Flip y
            vtx.uv = uvs[ui];
            vtx.norm = norms[ni];
        }

        append(&result, vtx);
    }

    return result[..];
}

parse_mtllib :: proc(lib_name : string, path : string) -> Mtl_Lib {
    result := Mtl_Lib{};

    pbuf : [300]byte;
    pstr := fmt.bprintf(pbuf[..], "%s\\%s", path, lib_name[..len(lib_name)-1]);
    text, ok := os.read_entire_file(pstr); defer free(text);
    if !ok {
        console.logf_error("Could not find material library %s", pstr);
        return Mtl_Lib{};
    }

    current_mtl := "NaN";
    line, rem := string_util.get_line_and_remainder(string(text));
    loop: for {
        line_header := get_line_header(line);
        switch(line_header) {
            case "newmtl" : {
                name := strings.new_string(line[len("newmtl")+1..len(line)-1]);
                result.materials[name] = Mtl{name = name};
                current_mtl = name;
            }

            case "Kd" : {
                mtl, ok := result.materials[current_mtl]; 
                if ok {
                    mtl.diffuse = parse_vec3_line(line[len("Kd")+1..]);
                    result.materials[current_mtl] = mtl;
                } 
            } 
            
            case "Ka" : {
                mtl, ok := result.materials[current_mtl]; 
                if ok {
                    mtl.ambient = parse_vec3_line(line[len("Kd")+1..]);
                    result.materials[current_mtl] = mtl;
                } 
            } 

            case "Ks" : {
                mtl, ok := result.materials[current_mtl]; 
                if ok {
                    mtl.specular = parse_vec3_line(line[len("Kd")+1..]);
                    result.materials[current_mtl] = mtl;
                } 
            } 

        }

        line, rem = string_util.get_line_and_remainder(rem);
        if line == "" && rem == "" {
            break loop;
        }
    }

    return result;
}