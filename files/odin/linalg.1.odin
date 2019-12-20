package sgl

import "core:math"
import "core:math/linalg"

V2 :: distinct [2]f64;
V3 :: distinct [3]f64;
V4 :: distinct [4]f64;

M4 :: distinct [4][4]f64;

triangle_area_times_two :: proc(a, b, c: V2) -> f64 {
    x1 := b.x - a.x;
    y1 := b.y - a.y;

    x2 := c.x - a.x;
    y2 := c.y - a.y;

    return (x1 * y2 - x2 * y1);
}

make_identity :: inline proc() -> M4 {
    return M4{
        {1, 0, 0, 0},
        {0, 1, 0, 0},
        {0, 0, 1, 0},
        {0, 0, 0, 1},
    };
}

make_screen_space_transform :: inline proc(width, height: f64) -> M4 {
    i := width / 2;
    j := height / 2;
    k := -j;
    return M4{
        {i, 0, 0, i - 0.5},
        {0, k, 0, j - 0.5},
        {0, 0, 1, 0},
        {0, 0, 0, 1},
    };
}

make_translation :: inline proc(v: V3) -> M4 {
    return M4{
        {1, 0, 0, v.x},
        {0, 1, 0, v.y},
        {0, 0, 1, v.z},
        {0, 0, 0, 1}
    };
}

make_rotation :: inline proc(v: V3, a: f64) -> M4 {
    c := math.cos(a);
    s := math.sin(a);

    a := linalg.normalize(v);
    t := a * (1 - c);

    rot := make_identity();

    rot[0][0] = c + t[0] * a[0];
    rot[0][1] = 0 + t[0] * a[1] + s * a[2];
    rot[0][2] = 0 + t[0] * a[2] - s * a[1];
    rot[0][3] = 0;

    rot[1][0] = 0 + t[1] * a[0] - s * a[2];
    rot[1][1] = c + t[1] * a[1];
    rot[1][2] = 0 + t[1] * a[2] + s * a[0];
    rot[1][3] = 0;

    rot[2][0] = 0 + t[2] * a[0] + s * a[1];
    rot[2][1] = 0 + t[2] * a[1] - s * a[0];
    rot[2][2] = c + t[2] * a[2];
    rot[2][3] = 0;

    return rot;
}

make_perspective :: inline proc(fovy, aspect, near, far: f64) -> M4 {
    tan_half_fovy := math.tan(0.5 * math.to_radians(fovy));
    z_range := near - far;
    return M4{
        {1 / (aspect * tan_half_fovy), 0, 0, 0},
        {0, 1 / tan_half_fovy, 0, 0},
        {0, 0, (-near - far) / z_range, 2 * far * near / z_range},
        {0, 0, 1, 0}
    };
}

mul_matrix :: inline proc(a, b: M4) -> M4 {
    c: M4;
    for i in 0..<4 {
        for j in 0..<4 {
            inline for k in 0..<4 do c[i][j] += a[i][k] * b[k][j];
        }
    }
    return c;
}

mul_matrix_vector :: inline proc(v: V4, m: M4) -> V4 {
    return V4{
        m[0][0] * v.x + m[0][1] * v.y + m[0][2] * v.z + m[0][3] * v.w,
        m[1][0] * v.x + m[1][1] * v.y + m[1][2] * v.z + m[1][3] * v.w,
        m[2][0] * v.x + m[2][1] * v.y + m[2][2] * v.z + m[2][3] * v.w,
        m[3][0] * v.x + m[3][1] * v.y + m[3][2] * v.z + m[3][3] * v.w,
    };
}

mul :: proc{mul_matrix, mul_matrix_vector};