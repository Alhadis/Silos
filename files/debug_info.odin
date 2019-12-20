/*
 *  @Name:     debug_info
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hoej@northwolfprod.com
 *  @Creation: 27-10-2017 23:21:47
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 25-01-2018 00:04:19 UTC+1
 *  
 *  @Description:
 *  
 */

import "shared:libbrew/gl.odin";

Function_Load_Status :: struct {
    name    : string,
    address : int,
    success : bool,
}

Info :: struct {
    lib_address : int,
    number_of_functions_loaded : i32,
    number_of_functions_loaded_successed : i32,
    statuses : [dynamic]Function_Load_Status,
}

Ogl_Info :: struct {
    using _ : Info,
    textures : [dynamic]gl.Texture
}

ogl : Ogl_Info;
xinput : Info;