package lipid_math

using import "core:math"

_zerof32: f32 = 0;
_zerof64: f64 = 0;
inf32 := f32(1) / _zerof32;
inf64 := f64(1) / _zerof64;

// Approximate atan2
// https://www.dsprelated.com/showarticle/1052.php

approxAtan_f32 :: proc(z: f32) -> f32{
    return (0.97239411 + -0.19194795 * z * z) * z;
}

approxAtan_f64 :: proc(z: f64) -> f64{
    n1 := 0.97239411;
    n2 := -0.19194795;
    return (n1 + n2 * z * z) * z;
}

approxAtan2_f32 :: proc(y, x: f32) -> f32 {
    ay, ax := abs(y), abs(x);
    invert := ay > ax;
    z := invert ? ax/ay : ay/ax;
    th := approxAtan(z);
    if invert do th = PI / 2 - th;
    if x < 0 do th = PI - th;
    if y < 0 do th = -abs(th) else do th = abs(th);
    return th;
}

approxAtan2_f64 :: proc(y, x: f64) -> f64 {
    ay, ax := abs(y), abs(x);
    invert := ay > ax;
    z := invert ? ax/ay : ay/ax;
    th := approxAtan(z);
    if invert do th = PI / 2 - th;
    if x < 0 do th = PI - th;
    if y < 0 do th = -abs(th) else do th = abs(th);
    return th;
}

approxAtan :: proc{approxAtan_f32, approxAtan_f64};
approxAtan2 :: proc{approxAtan2_f32, approxAtan2_f64};

damp :: proc(a, b: $T, lambda, dt: f32) -> T {
    return lerp(a, b, 1 - pow(E, -lambda * dt));
}

wrap :: proc(n, m: int) -> int do return (n % m + m) % m;
// clamp :: proc(x, lower, upper: $T) -> T do return min(max(x, lower), upper);
nonDescending :: proc(a, b, c: $T) -> bool do return a <= b && b <= c;
ascending :: proc(a, b, c: $T) -> bool do return a < b && b < c;

ceilSqrt :: proc(n: int) -> int {
    if n == 0 do return n;

    i := 1; result := 1;
    for result < n {
        i += 1;
        result = i*i;
    }

    return i;
}

perp :: proc(v: Vec2) -> Vec2 do return Vec2{-v.y, v.x};
perpdot :: proc{cross2};

distance :: proc(a, b: Vec2) -> f32 do return length(a - b);

aff :: proc{affVec2, affVec3};
aff0 :: proc{aff0Vec2, aff0Vec3};

affVec2 :: proc(v: Vec2, m: Mat3) -> Vec2 {
    affine_result := vec3_mul_mat3(m, Vec3{v.x, v.y, 1});
    return Vec2{affine_result.x, affine_result.y} / affine_result.z;
}

aff0Vec2 :: proc(v: Vec2, m: Mat3) -> Vec2 {
    affine_result := vec3_mul_mat3(m, Vec3{v.x, v.y, 0});
    return Vec2{affine_result.x, affine_result.y};
}

affVec3 :: proc(v: Vec3, m: Mat4) -> Vec3 {
    affine_result := vec4_mul_mat4(m, Vec4{v.x, v.y, v.z, 1});
    return Vec3{affine_result.x, affine_result.y, affine_result.z} / affine_result.w;
}

aff0Vec3 :: proc(v: Vec3, m: Mat4) -> Vec3 {
    affine_result := vec4_mul_mat4(m, Vec4{v.x, v.y, v.z, 0});
    return Vec3{affine_result.x, affine_result.y, affine_result.z};
}

mat3_mul_many :: proc(ms: ..Mat3) -> Mat3 {
    c := identity(Mat3);
    for m in ms do c = mul(c, m);
	return c;
}

mat4_mul_many :: proc(ms: ..Mat4) -> Mat4 {
    c := identity(Mat4);
    for m in ms do c = mul(c, m);
	return c;
}

mul_many :: proc{mat3_mul_many, mat4_mul_many};

mat2_mul_vec2 :: proc(m: Mat2, v: Vec2) -> Vec2 {
    return Vec2{
        m[0][0] * v[0] + m[1][0] * v[1],
        m[0][1] * v[0] + m[1][1] * v[1]
    };
}

vec2_mul_mat2 :: proc(v: Vec2, m: Mat2) -> Vec2 {
	return Vec2{
		v[0]*m[0][0] + v[1]*m[0][1],
		v[0]*m[1][0] + v[1]*m[1][1],
	};
}

vec3_mul_mat3 :: proc(m: Mat3, v: Vec3) -> Vec3 {
	return Vec3{
		v[0]*m[0][0] + v[1]*m[0][1] + v[2]*m[0][2],
		v[0]*m[1][0] + v[1]*m[1][1] + v[2]*m[1][2],
		v[0]*m[2][0] + v[1]*m[2][1] + v[2]*m[2][2],
	};
}

vec4_mul_mat4 :: proc(m: Mat4, v: Vec4) -> Vec4 {
	return Vec4{
		v[0]*m[0][0] + v[1]*m[0][1] + v[2]*m[0][2] + v[3]*m[0][3],
		v[0]*m[1][0] + v[1]*m[1][1] + v[2]*m[1][2] + v[3]*m[1][3],
		v[0]*m[2][0] + v[1]*m[2][1] + v[2]*m[2][2] + v[3]*m[2][3],
		v[0]*m[3][0] + v[1]*m[3][1] + v[2]*m[3][2] + v[3]*m[3][3],
	};
}

mul_post :: proc{vec2_mul_mat2, vec3_mul_mat3, vec4_mul_mat4};

mat2_rotate_post :: proc(angle_radians: f32) -> Mat2 {
	c := cos(angle_radians);
	s := sin(angle_radians);
	return Mat2{{c, -s}, {s, c}};
}

mat2_clockwise_post :: proc(angle_radians: f32) -> Mat2 {
	c := cos(angle_radians);
	s := sin(angle_radians);
	return Mat2{{c, s}, {-s, c}};
}

mat3_translate_post_aff :: proc(v: Vec2) -> Mat3 {
	m := identity(Mat3);
	m[0][2] = v[0];
	m[1][2] = v[1];
	return m;
}

mat3_scale_aff :: proc(s: Vec2) -> Mat3 {
    m: Mat3;
    m[0][0] = s.x;
    m[1][1] = s.y;
    m[2][2] = 1;
    return m;
}

// TODO: Doesn't work now, but it used to:
// mat3_scale_post_aff :: mat3_scale_aff;
// ...instead, COPIED☠️ :
mat3_scale_post_aff :: proc(s: Vec2) -> Mat3 {
    m: Mat3;
    m[0][0] = s.x;
    m[1][1] = s.y;
    m[2][2] = 1;
    return m;
}

mat3_clockwise_post_aff :: proc(angle_radians: f32) -> (result: Mat3) {
    result = identity(Mat3);

	c := cos(angle_radians);
	s := sin(angle_radians);

    result[0][0] = c;
    result[0][1] = s;
    result[1][0] = -s;
    result[1][1] = c;

	return;
}

// Computes the inverse treating the matrix as row-major as opposed to other functions in this file,
// but that's fine, because that means it computes the inverse of transpose of m and transposes it
// again. inv(trans(A)) == trans(inv(A))
mat3_inverse :: proc(m: Mat3) -> Mat3 {
    o: Mat3;

    det := m[0][0] * (m[1][1] * m[2][2] - m[2][1] * m[1][2]) -
    m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0]) +
    m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);

    invdet := 1 / det;

    o[0][0] = (m[1][1] * m[2][2] - m[2][1] * m[1][2]) * invdet;
    o[0][1] = (m[0][2] * m[2][1] - m[0][1] * m[2][2]) * invdet;
    o[0][2] = (m[0][1] * m[1][2] - m[0][2] * m[1][1]) * invdet;
    o[1][0] = (m[1][2] * m[2][0] - m[1][0] * m[2][2]) * invdet;
    o[1][1] = (m[0][0] * m[2][2] - m[0][2] * m[2][0]) * invdet;
    o[1][2] = (m[1][0] * m[0][2] - m[0][0] * m[1][2]) * invdet;
    o[2][0] = (m[1][0] * m[2][1] - m[2][0] * m[1][1]) * invdet;
    o[2][1] = (m[2][0] * m[0][1] - m[0][0] * m[2][1]) * invdet;
    o[2][2] = (m[0][0] * m[1][1] - m[1][0] * m[0][1]) * invdet;

    return o;
}

mat4_rotate_post_aff :: proc(v: Vec3, angle_radians: f32) -> Mat4 {
	c := cos(angle_radians);
	s := sin(angle_radians);

	a := norm(v);
	t := a * (1-c);

	rot := identity(Mat4);

	rot[0][0] = c + t[0]*a[0];
	rot[1][0] = 0 + t[0]*a[1] + s*a[2];
	rot[2][0] = 0 + t[0]*a[2] - s*a[1];

	rot[0][1] = 0 + t[1]*a[0] - s*a[2];
	rot[1][1] = c + t[1]*a[1];
	rot[2][1] = 0 + t[1]*a[2] + s*a[0];

	rot[0][2] = 0 + t[2]*a[0] + s*a[1];
	rot[1][2] = 0 + t[2]*a[1] - s*a[0];
	rot[2][2] = c + t[2]*a[2];

	return rot;
}

