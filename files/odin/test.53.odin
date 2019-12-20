package libjit

import "core:fmt"

using import "shared:odin-libjit"

main :: proc() {
    init();
    
    ctx := context_create();
    defer context_destroy(ctx);

    context_build_start(ctx);

    params := []Type{jit_type_int, jit_type_int};
    signature := type_create_signature(.Cdecl, jit_type_int, &params[0], 2, 1);
    defer type_free(signature);
    fn := function_create(ctx, signature);

    a := value_get_param(fn, 0);
    b := value_get_param(fn, 1);
    c := insn_add(fn, a, b);
    insn_return(fn, c);

    function_compile(fn);
    context_build_end(ctx);

    add := transmute(proc(a, b: i32) -> i32) function_to_closure(fn);

    fmt.println(add(4, 2));
}