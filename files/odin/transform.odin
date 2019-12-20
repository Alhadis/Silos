package renderer

using import "../math"

transform :: struct
{
	pos: v2,
	scale: v2,
}

set_uniforms :: inline proc(transform: transform, pr_matrix: mat4, program: u32) {
    set_uniform_mat4(get_uniform_location(program, "transform"), translate_mat4(transform.pos));
    set_uniform_mat4(get_uniform_location(program, "scale"), scale_mat4(transform.scale));
    set_uniform_mat4(get_uniform_location(program, "pr"), pr_matrix);

}