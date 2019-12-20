/*
 *  @Name:     gl_util
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 21-04-2017 03:04:34
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 05-02-2018 01:09:46 UTC+1
 *  
 *  @Description:
 *      Contains random GL utility functions.
 */

import "core:fmt.odin";
import "core:strings.odin";
import "shared:libbrew/gl.odin";
import console "shared:libbrew/imgui_console.odin";
import ja "asset.odin";

create_and_compile_shader :: proc(shader : ^ja.Shader) -> bool {
    shader.gl_id = gl.create_shader(shader.type_);
    if shader.gl_id == 0 {
        console.log_error("Could not create a new shader");
        return false;
    }

    return compile_shader(shader);
}

compile_shader :: proc(shader : ^ja.Shader) -> bool {
    gl.shader_source(shader.gl_id, shader.source);
    gl.compile_shader(shader.gl_id);

    success := gl.get_shader_value(shader.gl_id, gl.GetShaderNames.CompileStatus);
    if success == 0 {
        console.logf_error("====== Shader Error( %s | %v ) ======", shader.info.file_name, shader.type_);
        console.log_error(gl.get_shader_info_log(shader.gl_id)); 
        console.log_error("=====================================");
        return false;
    }

    return true;
}

create_program :: proc(vertex, frag : ^ja.Shader) -> gl.Program {
    result := gl.create_program();
    if result.id == 0 {
        console.log_error("Could not create a new program");
        return result;
    }
    
    gl.attach_shader(result, vertex.gl_id);
    gl.attach_shader(result, frag.gl_id);

    result.vertex = vertex.gl_id;
    result.fragment = frag.gl_id;

    vertex.program = result;
    frag.program = result;

    gl.link_program(result);

    get_all_attribs_from_program(&result);
    get_all_uniforms_from_program(&result);

    return result;
}

get_all_uniforms_from_program :: proc(program : ^gl.Program) {
    count := gl.get_program_value(program^, gl.GetProgramNames.ActiveUniforms);
    for i in 0..count {
        uni := gl.get_active_uniform(program^, uint(i));
        program.uniforms[uni.name] = uni;
    }
}

get_all_attribs_from_program :: proc(program : ^gl.Program) {
    count := gl.get_program_value(program^, gl.GetProgramNames.ActiveAttributes);
    for i in 0..count {
        attrib := gl.get_active_attrib(program^, uint(i));
        program.attributes[attrib.name] = attrib;
    }
}