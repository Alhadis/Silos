package math

v2 :: struct {
	x: f32,
	y: f32,
}

mat4 :: struct {
	elements: [16]f32,
}

create_mat4 :: proc() -> mat4 {
	result : mat4;
	for n in 0..15{
		result.elements[n] = 0.0;
	}
	
	result.elements[0] = 1.0;
	result.elements[1 + 1 * 4] = 1.0;
	result.elements[2 + 2 * 4] = 1.0;
	result.elements[3 + 3 * 4] = 1.0;
	
	return result;
}

create_ortho_mat4 :: proc(left, right, bottom, top, near, far: f32) -> mat4{

	result: mat4 = create_mat4();
	
	result.elements[0] = 2.0 / (right - left);
	result.elements[1 + 1 * 4] = 2.0 / (top - bottom);
	result.elements[2 + 2 * 4] = 2.0 / (near -  far);
	
	
	result.elements[0 + 3 * 4] = (left + right) / (left - right);
	result.elements[1 + 3 * 4] = (bottom + top) / (bottom - top);
	result.elements[2 + 3 * 4] = (far + near) / (far - near);
	
	return result;
}

translate_mat4 :: proc(v: v2) -> mat4{
	result: mat4 = create_mat4();
	result.elements[0 + 3 * 4] = v.x;
	result.elements[1 + 3 * 4] = v.y;

	return result;
}

scale_mat4 :: proc(v: v2) -> mat4 {
	result := create_mat4();
	result.elements[0] 			= v.x;
	result.elements[1 + 1 * 4] 	= v.y;
	return result;
}

//This is broken for some reason
//IDK
multiply_mat4 :: proc(a, b: mat4) -> mat4{
	result := create_mat4();
	for i in 0..4 {
		for j in 0..4 {
			sum:f32 = 0.0;
			for k in 0..3 {
				sum += b.elements[i + k * 4] * a.elements[k + j * 4];
			}
			result.elements[i + j * 4] = sum;
		}
	}

	return result;
}