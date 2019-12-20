package renderer

import "core:fmt"
import "core:strings"
import "core:os"
using import "shared:odin-gl"
import "shared:odin-stb/stbi"
import "../math"

VAO 			:: distinct u32;
VBO 			:: distinct u32;
IBO				:: distinct u32;
Texture 		:: distinct u32;

//VAO and Buffer shit bindings
gen_vao :: inline proc() -> VAO {
	vao: u32;
	GenVertexArrays(1, &vao);
	return cast(VAO)vao;
}

bind_vao :: inline proc(vao: VAO) {
	BindVertexArray(cast(u32)vao);
}

delete_vao :: inline proc(vao: VAO) {
	DeleteVertexArrays(1, cast(^u32)&vao);
}

gen_buffer :: inline proc() -> VBO {
	vbo: u32;
	GenBuffers(1, &vbo);
	return cast(VBO)vbo;
}

bind_buffer :: inline proc(vbo: VBO) {
	BindBuffer(ARRAY_BUFFER, cast(u32)vbo);
}

delete_vbo :: inline proc(vbo: VBO) {
	DeleteBuffers(1, cast(^u32)&vbo);
}

gen_ibo :: inline proc() -> IBO {
	ibo: u32;
	GenBuffers(1, &ibo);
	return cast(IBO)ibo;
}

bind_ibo :: inline proc(ibo: IBO) {
	BindBuffer(ELEMENT_ARRAY_BUFFER, cast(u32)ibo);
}

//Texture both OpenGL abstraction and stb_image stuff here
gen_texture :: inline proc(filePath: string) -> Texture {
	width, height, numComponenets: i32;
	data := stbi.load(cast(^u8)strings.new_cstring(filePath), &width, &height, &numComponenets, 4);

	if data == nil {
		fmt.print_err("Texture not found\n");
	}
	texture: u32;
	GenBuffers(1, &texture);
	BindTexture(TEXTURE_2D, texture);

	TexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER, NEAREST);
	TexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER, NEAREST);

	TexImage2D(TEXTURE_2D, 0, RGBA, width, height, 0, RGBA, UNSIGNED_BYTE, data);

	stbi.image_free(data);

	return cast(Texture)texture;
}

bind_texture :: inline proc(texture: Texture) {
	ActiveTexture(TEXTURE0);
	BindTexture(TEXTURE_2D, cast(u32)texture);
}

//Shader stuff
use_program :: inline proc(program: u32) {
	UseProgram(program);
}

get_uniform_location :: inline proc(program: u32, str: string) -> i32 {
    return GetUniformLocation(program, &str[0]);
}

set_uniform_mat4 :: proc(location: i32, mat: math.mat4){
	UniformMatrix4fv(location, 1, FALSE, &mat.elements[0]);
}

set_uniform_1i :: proc(location: i32, i: i32){
	Uniform1i(location, i);
}