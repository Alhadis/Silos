/**
 * emscripten bridge
 * 
 * Copyright (c) 2019 darkoverlordofdata MIT license
 */


module emscripten

#flag linux  -I @VROOT/thirdparty/emscripten

#include <emscripten-shim.h>

pub fn set_main_loop_arg(func voidptr, arg voidptr, fps int, sim int) {
    C.emscripten_set_main_loop_arg(func, arg, fps, sim)
}

pub fn is_enabled() bool 
{
    mut res := true
$if windows {
    res = false
}  
$if linux {
    res = false
} 
$if mac {
    res = false
}
    return res
}
