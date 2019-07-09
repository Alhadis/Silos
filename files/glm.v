// vector/matrix structs
// Copyright (c) 2019 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.

module vex

import math


struct Vec2 {
mut:
	x f32
	y f32
}

struct Vec3 {
mut:
	x f32
	y f32
	z f32
}

struct Vec4 {
mut:
	x f32
	y f32
	z f32
	w f32
}

struct Mat4 {
pub:
	data *f32
}

fn f32_calloc(n int) *f32 { return *f32(calloc(n * sizeof(f32))) }

pub fn vec2(x, y f32) Vec2 { return Vec2 { x, y } }

pub fn vec3(x, y, z f32) Vec3 { return Vec3 { x, y, z } }

pub fn vec4(x, y, z, w f32) Vec4 { return Vec4 { x, y, z, w } }

pub fn mat4(f *f32) Mat4 { return Mat4 { data: f } }

pub fn (v Vec2) str() string {
	return 'Vec3{ $v.x, $v.y }'
}

pub fn (v Vec3) str() string {
	return 'Vec3{ $v.x, $v.y, $v.z }'
}

pub fn (v Vec4) str() string {
	return 'Vec4{ $v.x, $v.y, $v.z, $v.w }'
}

pub fn (m Mat4) str() string {
	mut s := '[ '
	for i := 0; i < 4; i++ {
		if i != 0 {
			s += '  '
		}
		for j := 0; j < 4; j++ {
			val := m.data[i * 4 + j]
			s += '${val:.2f} '
		}
		if i != 3 {
			s += '\n'
		}
	}
	s += ']'
	return s
}


pub fn (a Vec3) add(b Vec3) Vec3 {
	res := Vec3 {
		x: a.x + b.x,
		y: a.y + b.y,
		z: a.z + b.z,
	}
	return res
}

pub fn (a Vec3) sub(b Vec3) Vec3 {
	res := Vec3 {
		x: a.x - b.x,
		y: a.y - b.y,
		z: a.z - b.z,
	}
	return res
}

pub fn (a Vec3) mult(b Vec3) Vec3 {
	return vec3(a.x * b.x, a.y * b.y, a.z * b.z)
}

pub fn (a Vec3) mult_scalar(b f32) Vec3 {
	res := Vec3 {
		x: a.x * b,
		y: a.y * b,
		z: a.z * b,
	}
	return res
}


/**
 * glm style functions
 *
 * copyright 2019 darkoverlordofdata 
 * MIT license
 */
 
 /**
  * return a null matrix
  */
 pub fn glm_zero() Mat4 {
	mut res := f32_calloc(sizeof(f32) * 16)
	return mat4(res)
}

/**
 * return an identity matrix:
 * 		1 0 0 0
 * 		0 1 0 0
 * 		0 0 1 0
 * 		0 0 0 1
 */
pub fn glm_identity() Mat4 {
	mut res := f32_calloc(sizeof(f32) * 16)
	res[0] = 1
	res[5] = 1
	res[10] = 1
	res[15] = 1
	return mat4(res)
}


/** 
 * translate transform matrix by v vector
 *
 * @param  m  affine transfrom
 * @param  v  translate vector [x, y, z]
 * @returns translated matrix
 * 
 */
pub fn glm_translate(m Mat4, v Vec3) Mat4 {
	mut a := m.data
    a[12] = m.data[12] + m.data[0] * v.x + m.data[4] * v.y + m.data[8] * v.z
    a[13] = m.data[13] + m.data[1] * v.x + m.data[5] * v.y + m.data[9] * v.z
    a[14] = m.data[14] + m.data[2] * v.x + m.data[6] * v.y + m.data[10] * v.z
    a[15] = m.data[15] + m.data[3] * v.x + m.data[7] * v.y + m.data[11] * v.z
    return mat4(a)
}

/**
 * length - return scalar Euclidean length of a vector
 * 
 * @param v vector
 * @returns norm * norm
 * 
 */
pub fn glm_length(v Vec3) f32 {
    return math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z)
}

/**
 * vector dot product
 *
 * @param a vector1
 * @param b vector2
 * @returns dot product
 * 
 */
pub fn glm_dot(a Vec3, b Vec3) f32 {
    return a.x * b.x + a.y * b.y + a.z * b.z
}

/**
 * norm * norm (magnitude) of vector
 *
 * @param v vector
 * @returns norm * norm
 * 
 */
pub fn glm_norm2(v Vec3) f32 {
  return glm_dot(v, v)
}

/**
 * norm (magnitude) of vec3
 *
 * @param vec vector
 * @returns norm
 */
pub fn glm_norm(v Vec3) f32 {
  return math.sqrt(glm_norm2(v))
}



/**
 * normalize vector and store result in same vec
 *
 * @param v vector
 * @returns normalized vector
 * 
 */
pub fn glm_normalize(v Vec3) Vec3
{
    n := glm_norm(v)
    if n == 0.0 {
        v.x = 0.0
		v.y = 0.0
		v.z = 0.0
        return v
    }
	v.x = v.x * 1.0 / n
	v.y = v.y * 1.0 / n
	v.z = v.z * 1.0 / n
    return v
}

/**
 * scales existing transform matrix by v vector
 * and stores result in same matrix
 *
 * @param  m  affine transfrom
 * @param  v  scale vector [x, y, z]
 * @returns scaled Vec3
 */
pub fn glm_scale(m Mat4, v Vec3) Mat4 
{
    m.data[0] = m.data[0] * v.x
    m.data[1] = m.data[1] * v.x
    m.data[2] = m.data[2] * v.x
    m.data[3] = m.data[3] * v.x
    m.data[4] = m.data[4] * v.y
    m.data[5] = m.data[5] * v.y
    m.data[6] = m.data[6] * v.y
    m.data[7] = m.data[7] * v.y
    m.data[8] = m.data[8] * v.z
    m.data[8] = m.data[9] * v.z
    m.data[10] = m.data[10] * v.z
    m.data[11] = m.data[11] * v.z
    return m
}

/**
 * set up orthographic projection matrix
 *
 * @param  left    left and right vertical clipping planes
 * @param  right   left and right vertical clipping planes
 * @param  bottom  bottom and top horizontal clipping planes
 * @param  top     bottom and top horizontal clipping planes
 * @param  nearVal nearer and farther depth clipping planes
 * @param  farVal  nearer and farther depth clipping planes
 * @returns projection matrix
 */
pub fn glm_ortho(left f32,
                    right f32,
                    bottom f32,
                    top f32,
                    nearVal f32,
                    farVal f32) Mat4

{
    mut proj := glm_identity()

    proj.data[0] = 2.0 / (right - left)
    proj.data[5] = 2.0 / (top - bottom)
    proj.data[10] = -1.0
    proj.data[12] = - (right + left) / (right - left)
    proj.data[13] = - (top + bottom) / (top - bottom)
    proj.data[15] =  - nearVal / (farVal - nearVal)
    return proj
}

pub fn glm_perspective(fov f32, aspect f32, zNear f32, zFar f32) Mat4
{
	mut proj := f32_calloc(sizeof(f32) * 16)

	proj[5] = math.cos(fov / 2.0) / math.sin(fov / 2.0) 
	proj[0] = proj[5] / aspect
	proj[10] = (zFar + zNear) / (zNear - zFar) 
	proj[11] = -1.0
	proj[14] = 2.0 * zNear * zFar / (zNear - zFar) 
	proj[15] = 1.0

	return mat4(proj)

}

/**
 * rotate existing transform matrix around given axis by angle
 *
 * @param  m      affine transfrom
 * @param  angle  angle (radians)
 * @param  axis   axis
 */
pub fn glm_rotate(m Mat4, angle f32, v Vec3) Mat4
{
    a := angle
    c := math.cos(a)
    s := math.sin(a)
    
    axis := glm_normalize(v)
	temp := vec3((1.0-c) * axis.x, (1.0-c) * axis.y,(1.0-c) * axis.z)

	mut rotate := f32_calloc(sizeof(f32) * 16)

    rotate[0] = c + temp.x * axis.x
    rotate[1] = temp.x * axis.y + s * axis.z
    rotate[2] = temp.x * axis.z - s * axis.y

    rotate[4] = temp.x * axis.x - s * axis.z
    rotate[5] = c + temp.x * axis.y
    rotate[6] = temp.x * axis.z + s * axis.x

    rotate[8] = temp.z * axis.x + s * axis.y
    rotate[9] = temp.z * axis.y - s * axis.x
    rotate[10] = c + temp.z * axis.z

	mut result := f32_calloc(sizeof(f32) * 16)
    result[0] = m.data[0] * rotate[0] + m.data[4] * rotate[1] + m.data[8] * rotate[2]
    result[1] = m.data[1] * rotate[0] + m.data[5] * rotate[1] + m.data[9] * rotate[2]
    result[2] = m.data[2] * rotate[0] + m.data[6] * rotate[1] + m.data[10] * rotate[2]
    result[3] = m.data[3] * rotate[0] + m.data[7] * rotate[1] + m.data[11] * rotate[2]

    result[4] = m.data[0] * rotate[4] + m.data[4] * rotate[5] + m.data[8] * rotate[6]
    result[5] = m.data[1] * rotate[4] + m.data[5] * rotate[5] + m.data[9] * rotate[6]
    result[6] = m.data[2] * rotate[4] + m.data[6] * rotate[5] + m.data[10] * rotate[6]
    result[7] = m.data[3] * rotate[4] + m.data[7] * rotate[5] + m.data[11] * rotate[6]

    result[8] = m.data[0] * rotate[8] + m.data[4] * rotate[9] + m.data[8] * rotate[10]
    result[9] = m.data[1] * rotate[8] + m.data[5] * rotate[9] + m.data[9] * rotate[10]
    result[10] = m.data[2] * rotate[8] + m.data[6] * rotate[9] + m.data[10] * rotate[10]
    result[11] = m.data[3] * rotate[8] + m.data[7] * rotate[9] + m.data[11] * rotate[10]

    result[12] = m.data[12]
    result[13] = m.data[13]
    result[14] = m.data[14]
    result[15] = m.data[15]

    return mat4(result)
}
