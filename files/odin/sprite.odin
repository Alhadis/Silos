package renderer

import "core:strings"

using import "shared:odin-gl"

using import "../math"

sprite :: struct {
	//Game Position
	transform: transform,
	//OpenGL stuff
	id: VAO,
	ibo: IBO,
	texture: Texture,
}

init_sprite :: inline proc(pos, dim: v2, path: string) -> sprite{
	result: sprite;
	result.transform = transform{pos, dim};
	
	//VAO
	result.id = gen_vao();
	bind_vao(result.id);
	//VBO
	vertex_data := [8]f32 {
		-dim.x / 2.0, -dim.y / 2.0,
		-dim.x / 2.0, dim.y / 2.0,
		dim.x / 2.0, dim.y / 2.0,
		dim.x / 2.0, -dim.y / 2.0,
	};

	vbo := gen_buffer();

	bind_buffer(vbo);
	BufferData(ARRAY_BUFFER, size_of(vertex_data), &vertex_data[0], STATIC_DRAW);
	EnableVertexAttribArray(0);
	VertexAttribPointer(0, 2, FLOAT, FALSE, 0, nil);

	//IBO
	indices := [6]u8 {
		0, 1, 2,
		2, 3, 0
	};
	result.ibo = gen_ibo();
	bind_ibo(result.ibo);
	BufferData(ELEMENT_ARRAY_BUFFER, size_of(indices), &indices[0], STATIC_DRAW);

	result.texture = gen_texture(path);

	//TODO: Sprite Sheets
	tcs := [8]f32 {
		0,1,
		0,0,
		1,0,
		1,1,
	};

	texcoords := gen_buffer();

	bind_buffer(texcoords);
	BufferData(ARRAY_BUFFER, size_of(tcs), &tcs[0], STATIC_DRAW);
	EnableVertexAttribArray(1);
	VertexAttribPointer(1, 2, FLOAT, FALSE, 0, nil);

	return result;
}

draw_sprite :: proc(sprite: ^sprite){
	bind_vao(sprite.id);
	bind_ibo(sprite.ibo);

	bind_texture(sprite.texture);

	DrawElements(TRIANGLES, 6, UNSIGNED_BYTE, nil);
}
