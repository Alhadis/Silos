package sgl

import "core:os"
import "core:strings"
import "core:fmt"
import "core:runtime"
import "core:reflect"

using import "shared:odin-libjit"

foreign import libc "system:c"
        
foreign libc {
    stdout: rawptr;
}

/*

generate struct that contains shader edge and gradient data,
extracted from `VO`

actually, just generate an edge struct that can be used alongside the
`Edge` structs we have in `fill_triangle`

also generate code to initialize all of this data (calculate the
gradients themselves, basically)

and generate code to step these edges

then use these edges alongside the normal ones in the renderer
to interpolate user shader data

then call shader functions with this data

...

theoretically this means we need to generate our own Gradients structure as well?
and use it the same way we use the regular one
or can we just do that dynamically during compilation? that may be better....

*/

Init_Gradients_Proc     :: #type proc "c" (rawptr, rawptr, rawptr, rawptr);
Init_Edge_Proc          :: #type proc "c" (rawptr, rawptr, f64, f64, f64, f64, i32);
Step_Proc               :: #type proc "c" (rawptr);
Init_Current_Proc       :: #type proc "c" (rawptr, rawptr, rawptr);
Shade_Vertex_Proc       :: #type proc "c" (rawptr, rawptr);

Shader_Program :: struct(VI, VO: typeid) {
    rc: ^Render_Context,
    
    v2_type: Type,
    v3_type: Type,
    v4_type: Type,
    color_type: Type,
    base_vertex_type: Type,

    vertex_type: Type,
    vertex_type_ptr: Type,
    vertex_output_type: Type,
    vertex_output_type_ptr: Type,

    edge_type: Type,
    edge_type_ptr: Type,
    gradients_type: Type,
    gradients_type_ptr: Type,
    
    init_edge_proc_signature: Type,
    init_edge_proc: Function,
    init_gradients_proc_signature: Type,
    init_gradients_proc: Function,
    step_proc_signature: Type,
    step_proc: Function,
    init_current_proc_type: Type,
    init_current_proc: Function,
    shade_vertex_proc_type: Type,
    shade_vertex_proc: Function,

    vertex_shader: proc "c" (VI) -> VO,
    fragment_shader: proc "c" (VO) -> Color,

    init_edge_proc_closure: Init_Edge_Proc,
    init_gradients_proc_closure: Init_Gradients_Proc,
    init_current_proc_closure: Init_Current_Proc,
    step_proc_closure: Step_Proc,
    shade_vertex_proc_closure: Shade_Vertex_Proc,
    vertex_shader_closure: proc "c" (VI) -> VO,
    fragment_shader_closure: proc "c" (VO) -> Color,

    storage: []u8,
    _gradients: rawptr,
    _min_to_max: rawptr,
    _min_to_mid: rawptr,
    _mid_to_max: rawptr,
    _left: rawptr,
    _right: rawptr,
    _current: rawptr
}

make_shader_program :: proc(_rc: ^Render_Context, _vertex_shader: proc "c" ($VI) -> $VO, _fragment_shader: proc "c" (VO) -> Color) -> ^Shader_Program(VI, VO) {
    using p := new(Shader_Program(VI, VO));

    rc = _rc;
    vertex_shader = _vertex_shader;
    fragment_shader = _fragment_shader;

    vi_info := type_info_of(VI);
    vo_info := type_info_of(VO);
    assert(reflect.is_struct(vi_info));
    assert(reflect.is_struct(vo_info));

    vi_types := reflect.struct_field_types(VI);
    assert(vi_types[0] == type_info_of(Vertex));

    vo_types := reflect.struct_field_types(VO);

    init_base_types :: inline proc(using p: ^Shader_Program($VI, $VO)) {
        /*
            v2:                 (f64, f64)
            v3:                 (f64, f64, f64)
            v4:                 (f64, f64, f64,f64)
            color:              (f64, f64, f64, f64)
            base_vertex_type:   (v4)
            vertex_type:        (base_vertex_type, VI\*)
        */

        v2_fields := [2]Type{jit_type_float64, jit_type_float64};
        v2_type = type_create_struct(&v2_fields[0], 2, 1);
        v3_fields := [3]Type{jit_type_float64, jit_type_float64, jit_type_float64};
        v3_type = type_create_struct(&v3_fields[0], 3, 1);
        v4_fields := [4]Type{jit_type_float64, jit_type_float64, jit_type_float64, jit_type_float64};
        v4_type = type_create_struct(&v4_fields[0], 4, 1);
        color_fields := [4]Type{jit_type_float64, jit_type_float64, jit_type_float64, jit_type_float64};
        color_type = type_create_struct(&color_fields[0], 4, 1);
        base_vertex_fields := [1]Type{v4_type};
        base_vertex_type = type_create_struct(&base_vertex_fields[0], 1, 1);
    }

    init_vertex_type :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        fields := make([]Type, len(types) + 1, context.temp_allocator);

        fields[0] = type_copy(base_vertex_type);

        for i in 0..<len(types) {
            fields[i + 1] = get_base_type(p, types[i]);
        }

        vertex_type = type_create_struct(&fields[0], u32(len(fields)), 1);
        vertex_type_ptr = type_create_pointer(vertex_type, 1);
    }

    init_vertex_output_type :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        fields := make([]Type, len(types), context.temp_allocator);

        for i in 0..<len(types) {
            fields[i] = get_base_type(p, types[i]);
        }

        vertex_output_type = type_create_struct(&fields[0], u32(len(fields)), 1);
        vertex_output_type_ptr = type_create_pointer(vertex_output_type, 1);
    }

    get_base_type :: inline proc(using p: ^Shader_Program($VI, $VO), type: ^runtime.Type_Info) -> Type {
        switch type {
            case type_info_of(V2):      return v2_type;
            case type_info_of(V3):      return v3_type;
            case type_info_of(V4):      return v4_type;
            case type_info_of(Color):   return color_type;
            case type_info_of(f64):     return jit_type_float64;
            case:                       assert(false);
        }
        unreachable();
        return nil;
    }

    init_edge_type :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        /*
            Edge {
                (value,step)*
            }
        */
        
        fields := make([]Type, len(types)*2, context.temp_allocator);

        for i in 0..<len(types) {
            j := i * 2;
            inline for k in 0..1 do fields[j + k] = get_base_type(p, types[i]);
        }

        edge_type = type_create_struct(&fields[0], u32(len(fields)), 1);
        edge_type_ptr = type_create_pointer(edge_type, 1);
    }

    init_gradients_type :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        /*
            Gradients {
                (min, mid, max, x_step, y_step)*
            }
        */
        fields := make([]Type, len(types)*5, context.temp_allocator);

        for i in 0..<len(types) {
            j := i * 2;
            inline for k in 0..4 do fields[j + k] = get_base_type(p, types[i]);
        }

        gradients_type = type_create_struct(&fields[0], u32(len(fields)), 1);
        gradients_type_ptr = type_create_pointer(gradients_type, 1);
    }

    init_init_edge_proc :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        params := [7]Type{edge_type_ptr, gradients_type_ptr, jit_type_float64, jit_type_float64, jit_type_float64, jit_type_float64, jit_type_int};
        init_edge_proc_signature = type_create_signature(.Cdecl, jit_type_void, &params[0], len(params), 1);
    
        j := rc.jit_ctx;
        f := function_create(j, init_edge_proc_signature);

        edge := value_get_param(f, 0);
        gradients := value_get_param(f, 1);
        start_x := value_get_param(f, 2);
        start_y := value_get_param(f, 3);
        end_x := value_get_param(f, 4);
        end_y := value_get_param(f, 5);
        start_index := value_get_param(f, 6);

        y_start := insn_convert(f, insn_ceil(f, start_y), jit_type_int, 0);
        y_end := insn_convert(f, insn_ceil(f, end_y), jit_type_int, 0);

        x_dist := insn_sub(f, end_x, start_x);
        y_dist := insn_sub(f, end_y, start_y);
        y_prestep := insn_sub(f, insn_convert(f, y_start, jit_type_float64, 0), start_y);
            
        x_step := insn_div(f, x_dist, y_dist);
        x := insn_add(f, start_x, insn_mul(f, y_prestep, x_step));

        x_prestep := insn_sub(f, x, start_x);

        offset := i64(0);
        gradients_offset := i64(0);
        for i in 0..<len(types) {
            c_type := get_base_type(p, types[i]);
            c_type_size := i64(type_get_size(c_type));

            base_addr := insn_add_relative(f, gradients, gradients_offset);

            start := insn_load_elem_address(f, base_addr, start_index, color_type);
            x_step := insn_load_elem_address(f, base_addr, value_create_nint_constant(f, jit_type_int, 3), color_type);
            y_step := insn_load_elem_address(f, base_addr, value_create_nint_constant(f, jit_type_int, 4), color_type);

            n_floats := c_type_size / size_of(f64);
            for i in 0..<n_floats {
                j := i * size_of(f64);

                _start := insn_load_relative(f, start, j, jit_type_float64);
                _x_step := insn_load_relative(f, x_step, j, jit_type_float64);
                _y_step := insn_load_relative(f, y_step, j, jit_type_float64);

                value := insn_add(f,
                    _start,
                    insn_add(f,
                        insn_mul(f, _x_step, x_prestep),
                        insn_mul(f, _y_step, y_prestep)    
                    )
                );
                step := insn_add(f,
                    insn_mul(f, _x_step, x_step),

                    _y_step
                );

                insn_store_relative(f, edge, offset + j, value);
                insn_store_relative(f, edge, offset + c_type_size + j, step);
            }
 

            offset += c_type_size * 2;
            gradients_offset += c_type_size * 5;
        }

        insn_return(f, nil);

        function_compile(f);
        init_edge_proc = f;
        init_edge_proc_closure = transmute(Init_Edge_Proc) function_to_closure(init_edge_proc);
    }

    init_init_gradients_proc :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        params := [4]Type{gradients_type_ptr, vertex_type_ptr, vertex_type_ptr, vertex_type_ptr};
        init_gradients_proc_signature = type_create_signature(.Cdecl, jit_type_void, &params[0], len(params), 1);

        j := rc.jit_ctx;
        f := function_create(j, init_gradients_proc_signature);

        gradients := value_get_param(f, 0);
        min_a := value_get_param(f, 1);
        mid_a := value_get_param(f, 2);
        max_a := value_get_param(f, 3);

        min_x := insn_load_relative(f, min_a, 0, jit_type_float64);
        mid_x := insn_load_relative(f, mid_a, 0, jit_type_float64);
        max_x := insn_load_relative(f, max_a, 0, jit_type_float64);
        min_y := insn_load_relative(f, min_a, i64(size_of(f64)), jit_type_float64);
        mid_y := insn_load_relative(f, mid_a, i64(size_of(f64)), jit_type_float64);
        max_y := insn_load_relative(f, max_a, i64(size_of(f64)), jit_type_float64);

        one := value_create_float64_constant(f, jit_type_float64, 1);
        one_over_dx := insn_div(f, 
            one,
            insn_sub(f,
                insn_mul(f, 
                    insn_sub(f, mid_x, max_x),
                    insn_sub(f, min_y, max_y)
                ),
                insn_mul(f,
                    insn_sub(f, min_x, max_x),
                    insn_sub(f, mid_y, max_y)
                )
            )
        );
        one_over_dy := insn_neg(f, one_over_dx);

        calc_x_step :: inline proc(f: Function, values: [3]Value, min, mid, max: Value, one_over_dx: Value) -> Value {
            return insn_mul(f,
                insn_sub(f,
                    insn_mul(f,
                        insn_sub(f, values[1], values[2]),
                        insn_sub(f, min, max)
                    ),
                    insn_mul(f,
                        insn_sub(f, values[0], values[2]),
                        insn_sub(f, mid, max)
                    )
                ),
                one_over_dx
            );
        }

        calc_y_step :: inline proc(f: Function, values: [3]Value, min, mid, max: Value, one_over_dy: Value) -> Value {
            return insn_mul(f,
                insn_sub(f,
                    insn_mul(f,
                        insn_sub(f, values[1], values[2]),
                        insn_sub(f, min, max)
                    ),
                    insn_mul(f,
                        insn_sub(f, values[0], values[2]),
                        insn_sub(f, mid, max)
                    )
                ),
                one_over_dy
            );
        } 

        offset := i64(size_of(Vertex));
        gradients_offset := i64(0);
        for i in 0..<len(types) {
            c_type := get_base_type(p, types[i]);
            c_type_size := i64(type_get_size(c_type));
            
            min_value := insn_load_relative(f, min_a, offset, c_type);
            mid_value := insn_load_relative(f, mid_a, offset, c_type);
            max_value := insn_load_relative(f, max_a, offset, c_type);
            
            insn_store_relative(f, gradients, gradients_offset, min_value);
            insn_store_relative(f, gradients, gradients_offset + c_type_size, mid_value);
            insn_store_relative(f, gradients, gradients_offset + c_type_size * 2, max_value);

            n_floats := c_type_size / size_of(f64);
            for i in 0..<n_floats {
                j := i * size_of(f64);

                a := insn_load_relative(f, min_value, j, jit_type_float64);
                b := insn_load_relative(f, mid_value, j, jit_type_float64);
                c := insn_load_relative(f, max_value, j, jit_type_float64);

                x_step := calc_x_step(f, [3]Value{a, b, c}, min_y, mid_y, max_y, one_over_dx);
                y_step := calc_y_step(f, [3]Value{a, b, c}, min_x, mid_x, max_x, one_over_dy);

                insn_store_relative(f, gradients, gradients_offset + c_type_size * 3 + j, x_step);
                insn_store_relative(f, gradients, gradients_offset + c_type_size * 4 + j, y_step);
            }

            offset += c_type_size;
            gradients_offset += c_type_size * 5;
        }

        insn_return(f, nil);
        
        function_compile(f);
        init_gradients_proc = f;
        init_gradients_proc_closure = transmute(Init_Gradients_Proc) function_to_closure(init_gradients_proc);
    }

    init_step_proc :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        params := [1]Type{edge_type_ptr};
        step_proc_signature = type_create_signature(.Cdecl, jit_type_void, &params[0], len(params), 1);
    
        j := rc.jit_ctx;
        f := function_create(j, init_gradients_proc_signature);

        edge := value_get_param(f, 0);

        offset := i64(0);
        for i in 0..<len(types) {
            c_type := get_base_type(p, types[i]);
            c_type_size := i64(type_get_size(c_type));
            
            n_floats := c_type_size / size_of(f64);
            for i in 0..<n_floats {
                j := offset + i * size_of(f64);
                a := insn_load_relative(f, edge, j, jit_type_float64);
                b := insn_load_relative(f, edge, j + c_type_size, jit_type_float64);
                c := insn_add(f, a, b);    
                insn_store_relative(f, edge, j, c);
            }

            offset += c_type_size * 2;
        } 

        insn_return(f, nil);

        function_compile(f);
        step_proc = f;
        step_proc_closure = transmute(Step_Proc) function_to_closure(step_proc);
    }

    init_shade_vertex_proc :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        params := [2]Type{edge_type_ptr, vertex_output_type_ptr};
        shade_vertex_proc_type = type_create_signature(.Cdecl, jit_type_void, &params[0], len(params), 1);

        j := rc.jit_ctx;
        f := function_create(j, shade_vertex_proc_type);

        current := value_get_param(f, 0);
        output := value_get_param(f, 1);

        offset := i64(0);
        output_offset := i64(0);
        for i in 0..<len(types) {
            c_type := get_base_type(p, types[i]);
            c_type_size := i64(type_get_size(c_type));

            size := value_create_nint_constant(f, jit_type_int, c_type_size);
            dest := insn_add_relative(f, output, output_offset);
            src := insn_add_relative(f, current, offset);

            insn_memcpy(f, dest, src, size);

            offset += c_type_size * 2;
            output_offset += c_type_size;
        }

        insn_return(f, nil);

        function_compile(f);
        shade_vertex_proc = f;
        shade_vertex_proc_closure = transmute(Shade_Vertex_Proc) function_to_closure(shade_vertex_proc);
    }

    init_init_current_proc :: inline proc(using p: ^Shader_Program($VI, $VO), types: []^runtime.Type_Info) {
        params := [3]Type{edge_type_ptr, edge_type_ptr, edge_type_ptr};
        init_current_proc_type = type_create_signature(.Cdecl, jit_type_void, &params[0], len(params), 1);
        
        j := rc.jit_ctx;
        f := function_create(j, init_current_proc_type);

        current := value_get_param(f, 0);
        left := value_get_param(f, 1);
        right := value_get_param(f, 2);

        start_x := insn_load_relative(f, left, 0, jit_type_float64);
        start_y := insn_load_relative(f, left, size_of(f64), jit_type_float64);
        end_x := insn_load_relative(f, right, 0, jit_type_float64);
        end_y := insn_load_relative(f, right, size_of(f64), jit_type_float64);

        x_start := insn_convert(f, insn_ceil(f, start_x), jit_type_int, 0);
        x_end := insn_convert(f, insn_ceil(f, end_x), jit_type_int, 0);

        x_dist := insn_sub(f, end_x, start_x);
        x_prestep := insn_sub(f, insn_convert(f, x_start, jit_type_float64, 0), start_x);

        offset := i64(0);
        for i in 0..<len(types) {
            c_type := get_base_type(p, types[i]);
            c_type_size := i64(type_get_size(c_type));

            n_floats := c_type_size / size_of(f64);
            for i in 0..<n_floats {
                j := offset + i * size_of(f64);
                
                left := insn_load_relative(f, left, j, jit_type_float64);
                right := insn_load_relative(f, right, j, jit_type_float64);
                
                x_step := insn_div(f, insn_sub(f, right, left), x_dist);
                value := insn_add(f, left, insn_mul(f, x_step, x_prestep));
                
                insn_store_relative(f, current, j, value);
                insn_store_relative(f, current, j + c_type_size, x_step);
            }

            offset += c_type_size * 2;
        }

        insn_return(f, nil);

        function_compile(f);
        init_current_proc = f;
        init_current_proc_closure = transmute(Init_Current_Proc) function_to_closure(init_current_proc);
    }

    j := rc.jit_ctx;

    context_build_start(j);
    defer context_build_end(j);

    init_base_types(p);    
    init_vertex_type(p, vi_types[1:]);
    init_vertex_output_type(p, vo_types);
    init_edge_type(p, vo_types);
    init_gradients_type(p, vo_types);
    init_init_edge_proc(p, vo_types);
    init_init_gradients_proc(p, vo_types);
    init_shade_vertex_proc(p, vo_types);
    init_step_proc(p, vo_types);
    init_init_current_proc(p, vo_types);

    storage = make([]u8, type_get_size(gradients_type) + 4 * type_get_size(edge_type));
    _gradients = &storage[0];
    _min_to_max = &storage[type_get_size(gradients_type)];
    _min_to_mid = &storage[type_get_size(gradients_type) + type_get_size(edge_type)];
    _mid_to_max = &storage[type_get_size(gradients_type) + type_get_size(edge_type) * 2];
    _current = &storage[type_get_size(gradients_type) + type_get_size(edge_type) * 3];

    return p;
}

delete_shader_program :: proc(using p: ^Shader_Program($VI, $VO)) {
    type_free(v2_type);
    type_free(v3_type);
    type_free(v4_type);
    type_free(color_type);
    type_free(base_vertex_type);

    type_free(vertex_type);

    type_free(edge_type);
    type_free(edge_type_ptr);

    type_free(gradients_type);
    type_free(gradients_type_ptr);

    type_free(init_edge_proc_signature);
    type_free(init_gradients_proc_signature);

    delete(storage);
}

begin_shading :: proc(using p: ^Shader_Program($VI, $VO), min, mid, max: VI) {
    a, b, c := min, mid, max;
    
    init_gradients_proc_closure(_gradients, &a, &b, &c);
    init_edge_proc_closure(_min_to_max, _gradients, min.pos.x, min.pos.y, max.pos.x, max.pos.y, 0);
    init_edge_proc_closure(_min_to_mid, _gradients, min.pos.x, min.pos.y, mid.pos.x, mid.pos.y, 0);
    init_edge_proc_closure(_mid_to_max, _gradients, mid.pos.x, mid.pos.y, max.pos.x, max.pos.y, 1);
}

begin_shading_edges :: proc(using p: ^Shader_Program($VI, $VO), mid_to_max: bool, handedness: bool) {
    left := _min_to_max;
    
    right: rawptr;
    if mid_to_max   do right = _mid_to_max;
    else            do right = _min_to_mid;

    if handedness do swap(&left, &right);

    _left = left;
    _right = right;
}

step_shading :: proc(using p: ^Shader_Program($VI, $VO)) {
    step_proc_closure(_left);
    step_proc_closure(_right);
}

begin_shading_scan_line :: proc(using p: ^Shader_Program($VI, $VO)) {
    init_current_proc_closure(_current, _left, _right);
}

step_scan_line_shading :: proc(using p: ^Shader_Program($VI, $VO)) {
    step_proc_closure(_current);
}

shade_vertex :: proc(using p: ^Shader_Program($VI, $VO)) -> VO {
    result: VO;
    shade_vertex_proc_closure(_current, &result);
    return result;
}