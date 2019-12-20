package lipid_gl

using import "core:fmt"

import "core:os"
import "core:strings"
import "core:strconv"
using import "core:math"

using import "shared:lipid"
using import "shared:lipid/lipid_math"

import gl "shared:odin-gl"
import "shared:odin-stb/stbi"

rect0011: ArrayModel;
rect0011UV: ArrayModel;
fill_color_3d_program: u32;
fill_color_3d_program_with_cam: u32;
fill_color_2d_program: u32;
fill_color_2d_program_with_cam: u32;

initLipidGL :: proc() {
    rect0011 = make2dRect(Vec2{0, 0}, Vec2{1, 1});
    rect0011UV = make2dRectUV(Vec2{0, 0}, Vec2{1, 1}, Vec2{0, 0}, Vec2{1, 1});

    fill_color_3d_program_source := `
#VERTEX
#version 430 core

layout (location = 0) in vec3 position;

void main() {
    gl_Position = vec4(position, 1);
}

#FRAGMENT
#version 430 core

out vec4 fragment_color;

uniform vec4 color;

void main() {
    fragment_color = color;
}
`;

    result, err, bad_shader := makeProgram(fill_color_3d_program_source);
    checkAndPrintShaderError(err, bad_shader, result);
    fill_color_3d_program = result;

    fill_color_3d_program_with_cam_source := `
#VERTEX
#version 430 core

layout (location = 0) in vec3 position;

uniform mat4 camera;

void main() {
    gl_Position = vec4(position, 1) * camera;
}

#FRAGMENT
#version 430 core

out vec4 fragment_color;

uniform vec4 color;

void main() {
    fragment_color = color;
}
`;

    result, err, bad_shader = makeProgram(fill_color_3d_program_with_cam_source);
    checkAndPrintShaderError(err, bad_shader, result);
    fill_color_3d_program_with_cam = result;

    fill_color_2d_program_source := `
#VERTEX
#version 430 core

layout (location = 0) in vec2 position;

void main() {
    gl_Position = vec4(position, 0, 1);
}

#FRAGMENT
#version 430 core

out vec4 fragment_color;

uniform vec4 color;

void main() {
    fragment_color = color;
}
`;

    result, err, bad_shader = makeProgram(fill_color_2d_program_source);
    checkAndPrintShaderError(err, bad_shader, result);
    fill_color_2d_program = result;

    fill_color_2d_program_with_cam_source := `
#VERTEX
#version 430 core

uniform mat3 camera;

layout (location = 0) in vec2 position;

void main() {
    vec3 affine_position = vec3(position, 1) * camera;
    gl_Position = vec4(affine_position.xy, 0, affine_position.z);
}

#FRAGMENT
#version 430 core

out vec4 fragment_color;

uniform vec4 color;

void main() {
    fragment_color = color;
}
`;

    result, err, bad_shader = makeProgram(fill_color_2d_program_with_cam_source);
    checkAndPrintShaderError(err, bad_shader, result);
    fill_color_2d_program_with_cam = result;

	stbi.set_flip_vertically_on_load(1);
}

cleanupOpenGLUtilities :: proc() {
    AM_cleanup(&rect0011);
    AM_cleanup(&rect0011UV);
    gl.DeleteProgram(fill_color_3d_program);
    gl.DeleteProgram(fill_color_2d_program);
    gl.DeleteProgram(fill_color_2d_program_with_cam);
}

drawPointV2 :: proc(p: Vec2, color := Vec4{1, 1, 1, 1}) {
    points := []Vec2{p};
    drawPointsV2(points, color);
}

drawPointsV2 :: proc(points: []Vec2, color := Vec4{1, 1, 1, 1}) {
    model := makeArrayModelV2(points, gl.POINTS, gl.STREAM_DRAW);
    gl.UseProgram(fill_color_2d_program);
    setUniform(fill_color_2d_program, "color", color);
    AM_draw(&model);
    AM_cleanup(&model);
}

drawPointV3 :: proc(p: Vec3, color := Vec4{1, 1, 1, 1}) {
    points := []Vec3{p};
    drawPointsV3(points, color);
}

drawPointsV3 :: proc(points: []Vec3, color := Vec4{1, 1, 1, 1}) {
    model := makeArrayModelV3(points, gl.POINTS, gl.STREAM_DRAW);
    gl.UseProgram(fill_color_3d_program);
    setUniform(fill_color_3d_program, "color", color);
    AM_draw(&model);
    AM_cleanup(&model);
}

drawPoint :: proc{drawPointV2, drawPointV3};
drawPoints :: proc{drawPointsV2, drawPointsV3};

drawLineV2NoCam :: proc(a, b: Vec2, color := Vec4{1, 1, 1, 1}) {
    points := []Vec2{a, b};
    drawPolylineV2NoCam(points, color);
}
 
drawPolylineV2NoCam :: proc(points: []Vec2, color := Vec4{1, 1, 1, 1}, loop := false) {
    if len(points) > 0 {
        model := makeArrayModelV2(points, loop ? gl.LINE_LOOP : gl.LINE_STRIP, gl.STREAM_DRAW);
        gl.UseProgram(fill_color_2d_program);
        setUniform(fill_color_2d_program, "color", color);
        AM_draw(&model);
        AM_cleanup(&model);
    }
}

drawLineV2WithCam :: proc(a, b: Vec2, camera: Mat3, color := Vec4{1, 1, 1, 1}) {
    points := []Vec2{a, b};
    drawPolylineV2WithCam(points, camera, color);
}

drawPolylineV2WithCam :: proc(
    points: []Vec2, camera: Mat3, color := Vec4{1, 1, 1, 1}, loop := false,
) {
    if len(points) > 1 {
        model := makeArrayModelV2(points, loop ? gl.LINE_LOOP : gl.LINE_STRIP, gl.STREAM_DRAW);
        gl.UseProgram(fill_color_2d_program_with_cam);
        setUniform(fill_color_2d_program_with_cam, "camera", &camera);
        setUniform(fill_color_2d_program_with_cam, "color", color);
        AM_draw(&model);
        AM_cleanup(&model);
    }
}

drawPolylineV2WithCamAndProgram :: proc(
    points: []Vec2, camera: Mat3, program: u32, color := Vec4{1, 1, 1, 1}, loop := false,
) {
    if len(points) > 0 {
        model := makeArrayModelV2(points, loop ? gl.LINE_LOOP : gl.LINE_STRIP, gl.STREAM_DRAW);
        gl.UseProgram(program);
        setUniform(program, "camera", &camera);
        setUniform(program, "color", color);
        AM_draw(&model);
        AM_cleanup(&model);
    }
}

drawLineV3 :: proc(a, b: Vec3, camera: Mat4, color := Vec4{1, 1, 1, 1}) {
    points := []Vec3{a, b};
    drawPolylineV3(points, camera, color);
}

drawPolylineV3 :: proc(points: []Vec3, camera: Mat4, color := Vec4{1, 1, 1, 1}, loop := false) {
    if len(points) > 1 {
        model := makeArrayModelV3(points, loop ? gl.LINE_LOOP : gl.LINE_STRIP, gl.STREAM_DRAW);
        gl.UseProgram(fill_color_3d_program_with_cam);
        setUniform(fill_color_3d_program_with_cam, "camera", &camera);
        setUniform(fill_color_3d_program_with_cam, "color", color);
        AM_draw(&model);
        AM_cleanup(&model);
    }
}

drawLine :: proc{drawLineV2NoCam, drawLineV2WithCam, drawLineV3};
drawPolyline :: proc{
    drawPolylineV2NoCam, drawPolylineV2WithCam,
    drawPolylineV2WithCamAndProgram, drawPolylineV3
};

drawCircle :: proc(
    center: Vec2, r: f32, camera: Mat3, color := Vec4{1, 1, 1, 1}, num_vertices := 10,
) {
    points := make([]Vec2, num_vertices); defer delete(points);

    offset := Vec2{0, r};
    rotation := mat2_rotate_post(TAU / f32(num_vertices));

    for _, i in points {
        points[i] = center + offset;
        offset = vec2_mul_mat2(offset, rotation);
    }

    drawPolylineV2WithCam(points, camera, color, true);
}

drawRect :: proc(bottom_left, top_right: Vec2, color := Vec4{1, 1, 1, 1}) {
    rect := make2dRect(bottom_left, top_right);
    gl.UseProgram(fill_color_2d_program);
    setUniform(fill_color_2d_program, "color", color);
    drawModel(&rect);
    cleanupModel(&rect);
}

lookAt :: proc(camera, target: Vec3, world_up := Vec3{0, 0, 1}) -> (result: Mat4) {
    forward := norm(target - camera);
    right := norm(cross(forward, world_up));
    up := cross(right, forward);

    result[0][0] = right.x;
    result[0][1] = right.y;
    result[0][2] = right.z;
    result[1][0] = up.x;
    result[1][1] = up.y;
    result[1][2] = up.z;
    result[2][0] = -forward.x;
    result[2][1] = -forward.y;
    result[2][2] = -forward.z;
    result[0][3] = -dot(right, camera);
    result[1][3] = -dot(up, camera);
    result[2][3] = dot(forward, camera);
    result[3][3] = 1;

    return;
}

perspectivePost :: proc(fov, aspect_ratio: f32, n: f32 = 0.1, f: f32 = 200) -> (result: Mat4) {
    t := tan(fov / 2) * n;
    r := aspect_ratio * t;

    result = Mat4{
        {n / r, 0,     0,                  0             },
        {0,     n / t, 0,                  0             },
        {0,     0,     -(f + n) / (f - n), -2*f*n/(f - n)},
        {0,     0,     -1,                 0             },
    };

    return;
}

Texture :: struct {
    id: u32,
    width, height, num_channels: int
}

loadTextureFromFile :: proc(
    file_path: string, num_channels_wanted: int
) -> (
    result: Texture, err: bool
) {
    c_path := strings.clone_to_cstring(file_path); defer delete(c_path);

    width, height, num_channels: i32;
    image_data := stbi.load(cast(^u8) c_path, &width, &height, &num_channels, i32(num_channels_wanted));
    defer stbi.image_free(image_data);
    if image_data == nil do return Texture{}, false;

    if num_channels != i32(num_channels_wanted) do return Texture{}, false;

    result.width, result.height, result.num_channels = int(width), int(height), int(num_channels);

    gl.GenTextures(1, &result.id);
    gl.BindTexture(gl.TEXTURE_2D, result.id);

    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_LINEAR);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);

    if width % 4 != 0 {
        previous_alignment: i32;
        gl.GetIntegerv(gl.UNPACK_ALIGNMENT, &previous_alignment);
        gl.PixelStorei(gl.UNPACK_ALIGNMENT, 1);

        gl.TexImage2D(
            gl.TEXTURE_2D, 0, gl.RGBA, width, height, 0,
            num_channels == 4 ? gl.RGBA : gl.RGB, gl.UNSIGNED_BYTE, image_data
        );

        gl.PixelStorei(gl.UNPACK_ALIGNMENT, previous_alignment);
    } else {
        gl.TexImage2D(
            gl.TEXTURE_2D, 0, gl.RGBA, width, height, 0,
            num_channels == 4 ? gl.RGBA : gl.RGB, gl.UNSIGNED_BYTE, image_data
        );
    }

    gl.GenerateMipmap(gl.TEXTURE_2D);

    return result, true;
}

loadOBJFromFile :: proc(file_path: string) -> (IndexModel, bool) {
    file_data, ok := os.read_entire_file(file_path);
    defer delete(file_data);
    if !ok do return IndexModel{}, false;

    return loadOBJFromString(string(file_data)), true;
}

// Assumes one model in file.
loadOBJFromString :: proc(s: string) -> IndexModel {
    positions: [dynamic]Vec3;   defer delete(positions);
    normals: [dynamic]Vec3;     defer delete(normals);
    uvs: [dynamic]Vec2;         defer delete(uvs);

    VertexAttributes :: struct {
        position, normal: Vec3,
        uv: Vec2,
    }

    vertex_buffer: [dynamic]VertexAttributes;   defer delete(vertex_buffer);
    index_buffer: [dynamic]u32;                 defer delete(index_buffer);

    vertex_indices: map[string]u32; defer delete(vertex_indices);

    lines := getLines(s); defer delete(lines);
    for line in lines {
        line_words := split(line); defer delete(line_words);
        if len(line_words) == 0 do continue;

        switch line_words[0] {
        case "v":
            assert(len(line_words) == 4);
            x := strconv.parse_f32(line_words[1]);
            y := strconv.parse_f32(line_words[2]);
            z := strconv.parse_f32(line_words[3]);
            append(&positions, Vec3{x, y, z});
        case "vt":
            assert(len(line_words) == 3);
            u, v := strconv.parse_f32(line_words[1]), strconv.parse_f32(line_words[2]);
            append(&uvs, Vec2{u, v});
        case "vn":
            assert(len(line_words) == 4);
            x := strconv.parse_f32(line_words[1]);
            y := strconv.parse_f32(line_words[2]);
            z := strconv.parse_f32(line_words[3]);
            append(&normals, Vec3{x, y, z});
        case "f":
            assert(len(line_words) == 4);
            for word, i in line_words[1:] {
                index_strings := split(word, '/'); defer delete(index_strings);
                assert(len(index_strings) == 3);

                index_triple := [3]u32{
                    cast(u32) strconv.parse_uint(index_strings[0], 10),
                    cast(u32) strconv.parse_uint(index_strings[1], 10),
                    cast(u32) strconv.parse_uint(index_strings[2], 10)
                } - 1;

                vertex_index, found := vertex_indices[word];
                if !found {
                    vertex_index = u32(len(vertex_buffer));
                    vertex_indices[word] = vertex_index;

                    new_vertex := VertexAttributes{
                        positions[index_triple[0]],
                        // Order of attribute arrays is (position, uv, normal) in .obj
                        normals[index_triple[2]],
                        uvs[index_triple[1]],
                    };

                    append(&vertex_buffer, new_vertex);
                }

                append(&index_buffer, vertex_index);
            }
        }

    }

    return makeIndexModelV3V3V2(vertex_buffer[:], index_buffer[:]);
}

drawModel       :: proc{AM_draw,            IM_draw         };
drawWireframe   :: proc{AM_drawWireframe,   IM_drawWireframe};
cleanupModel    :: proc{AM_cleanup,         IM_cleanup      };

IndexModel :: struct {
    VAO, VBO, EBO: u32,
    num_indices: i32,
    drawing_mode: u32,
}

IM_draw :: proc(using model: ^IndexModel) {
    gl.BindVertexArray(VAO);
    gl.DrawElements(drawing_mode, num_indices, gl.UNSIGNED_INT, nil);
    gl.BindVertexArray(0);
}

IM_drawWireframe :: proc(using model: ^IndexModel) {
    gl.PolygonMode(gl.FRONT_AND_BACK, gl.LINE);
    IM_draw(model);
    gl.PolygonMode(gl.FRONT_AND_BACK, gl.FILL);
}

IM_setup :: proc(using model: ^IndexModel, mode: u32 = gl.TRIANGLES) {
    gl.GenVertexArrays(1, &VAO);
    gl.GenBuffers(1, &VBO);
    gl.GenBuffers(1, &EBO);
    drawing_mode = mode;
}

IM_cleanup :: proc(using model: ^IndexModel) {
    gl.DeleteVertexArrays(1, &VAO);
    gl.DeleteBuffers(1, &VBO);
    gl.DeleteBuffers(1, &EBO);
    model^ = IndexModel{};
}

makeIndexModel :: proc() -> (result: IndexModel) {
    IM_setup(&result);
    return;
}

makeIndexModelV2 :: proc(
    vertices: []$T, indices: []u32, mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) -> (
    result: IndexModel
) {
    IM_setup(&result);
    IM_uploadV2(&result, vertices, indices, mode, usage);
    return;
}

IM_uploadV2 :: proc(
    using model: ^IndexModel, vertices: []$T, indices: []u32,
    mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) {
    #assert(T == Vec2 || T == [2]f32 || T == f32 || T == byte);
    drawing_mode = mode;
    num_indices = i32(len(indices));

    gl.BindVertexArray(VAO);

    gl.BindBuffer(gl.ARRAY_BUFFER, VBO);

    stride: i32 = 2 * size_of(f32);

    gl.VertexAttribPointer(0, 2, gl.FLOAT, gl.FALSE, stride, intToRawptr(0 * size_of(f32)));
    gl.EnableVertexAttribArray(0);

    gl.BufferData(gl.ARRAY_BUFFER, sizeOfSlice(vertices), cast(rawptr)&vertices[0], usage);

    gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, EBO);
    gl.BufferData(gl.ELEMENT_ARRAY_BUFFER, sizeOfSlice(indices), cast(rawptr)&indices[0], usage);
}

makeIndexModelV3 :: proc(
    vertices: []$T, indices: []u32, mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) -> (
    result: IndexModel
) {
    IM_setup(&result);
    IM_uploadV3(&result, vertices, indices, mode, usage);
    return;
}

IM_uploadV3 :: proc(
    using model: ^IndexModel, vertices: []$T, indices: []u32,
    mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) {
    #assert(T == Vec3 || T == [3]f32 || T == f32 || T == byte);
    drawing_mode = mode;
    num_indices = i32(len(indices));

    gl.BindVertexArray(VAO);

    gl.BindBuffer(gl.ARRAY_BUFFER, VBO);

    stride: i32 = 3 * size_of(f32);

    gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, stride, intToRawptr(0 * size_of(f32)));
    gl.EnableVertexAttribArray(0);

    gl.BufferData(gl.ARRAY_BUFFER, sizeOfSlice(vertices), cast(rawptr)&vertices[0], usage);

    gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, EBO);
    gl.BufferData(gl.ELEMENT_ARRAY_BUFFER, sizeOfSlice(indices), cast(rawptr)&indices[0], usage);
}

makeIndexModelV3V3V2 :: proc(
    vertices: []$T, indices: []u32, mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) -> (
    result: IndexModel
) {
    IM_setup(&result);
    IM_uploadV3V3V2(&result, vertices, indices, mode, usage);
    return;
}

IM_uploadV3V3V2 :: proc(
    using model: ^IndexModel, vertices: []$T, indices: []u32,
    mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) {
    drawing_mode = mode;
    num_indices = i32(len(indices));

    gl.BindVertexArray(VAO);

    gl.BindBuffer(gl.ARRAY_BUFFER, VBO);

    stride: i32 = 8 * size_of(f32);

    gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, stride, intToRawptr(0 * size_of(f32)));
    gl.EnableVertexAttribArray(0);

    gl.VertexAttribPointer(1, 3, gl.FLOAT, gl.FALSE, stride, intToRawptr(3 * size_of(f32)));
    gl.EnableVertexAttribArray(1);

    gl.VertexAttribPointer(2, 2, gl.FLOAT, gl.FALSE, stride, intToRawptr(6 * size_of(f32)));
    gl.EnableVertexAttribArray(2);

    gl.BufferData(gl.ARRAY_BUFFER, size_of(T) * len(vertices), cast(rawptr)&vertices[0], usage);

    gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, EBO);
    gl.BufferData(gl.ELEMENT_ARRAY_BUFFER, sizeOfSlice(indices), cast(rawptr)&indices[0], usage);
}

ArrayModel :: struct {
    VAO, VBO: u32,
    num_vertices: i32,
    drawing_mode: u32,
}

AM_draw :: proc(using model: ^ArrayModel) {
    gl.BindVertexArray(VAO);
    gl.DrawArrays(drawing_mode, 0, num_vertices);
    gl.BindVertexArray(0);
}

AM_drawWireframe :: proc(using model: ^ArrayModel) {
    gl.PolygonMode(gl.FRONT_AND_BACK, gl.LINE);
    AM_draw(model);
    gl.PolygonMode(gl.FRONT_AND_BACK, gl.FILL);
}

AM_setup :: proc(using model: ^ArrayModel, mode: u32 = gl.TRIANGLES) {
    gl.GenVertexArrays(1, &VAO);
    gl.GenBuffers(1, &VBO);
    drawing_mode = mode;
}

AM_cleanup :: proc(using model: ^ArrayModel) {
    gl.DeleteVertexArrays(1, &VAO);
    gl.DeleteBuffers(1, &VBO);
    model^ = ArrayModel{};
}

makeArrayModel :: proc() -> (result: ArrayModel) {
    AM_setup(&result);
    return;
}

AM_uploadV2 :: proc(
    using model: ^ArrayModel, vertices: []$T,
    mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) {
    #assert(T == Vec2 || T == [2]f32 || T == f32 || T == byte);

    size := size_of(T) * len(vertices);
    drawing_mode = mode;
    num_vertices = cast(i32) size / (2 * size_of(f32));
    assert(i32(size) % num_vertices == 0);

    gl.BindVertexArray(VAO);
    gl.BindBuffer(gl.ARRAY_BUFFER, VBO);

    stride: i32 = 2 * size_of(f32);

    gl.VertexAttribPointer(0, 2, gl.FLOAT, gl.FALSE, stride, intToRawptr(0 * size_of(f32)));
    gl.EnableVertexAttribArray(0);

    gl.BufferData(gl.ARRAY_BUFFER, size, cast(rawptr)&vertices[0], usage);
}

makeArrayModelV2 :: proc(
    vertices: []$T, mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) -> (
    result: ArrayModel
) {
    AM_setup(&result);
    AM_uploadV2(&result, vertices, mode, usage);
    return;
}

AM_uploadV3 :: proc(
    using model: ^ArrayModel, vertices: []$T,
    mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) {
    #assert(T == Vec3 || T == [3]f32 || T == f32 || T == byte);

    size := size_of(T) * len(vertices);
    drawing_mode = mode;
    num_vertices = cast(i32) size / (3 * size_of(f32));
    assert(i32(size) % num_vertices == 0);

    gl.BindVertexArray(VAO);
    gl.BindBuffer(gl.ARRAY_BUFFER, VBO);

    stride: i32 = 3 * size_of(f32);

    gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, stride, intToRawptr(0 * size_of(f32)));
    gl.EnableVertexAttribArray(0);

    gl.BufferData(gl.ARRAY_BUFFER, size, cast(rawptr)&vertices[0], usage);
}

makeArrayModelV3 :: proc(
    vertices: []$T, mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) -> (
    result: ArrayModel
) {
    AM_setup(&result);
    AM_uploadV3(&result, vertices, mode, usage);
    return;
}

AM_uploadV2V2 :: proc(
    using model: ^ArrayModel, vertices: []$T,
    mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) {
    #assert(T == [2]Vec2 || T == [2][2]f32 || T == [4]f32 || T == f32 || T == byte);

    size := size_of(T) * len(vertices);
    drawing_mode = mode;
    num_vertices = cast(i32) size / (4 * size_of(f32));
    assert(i32(size) % num_vertices == 0);

    gl.BindVertexArray(VAO);
    gl.BindBuffer(gl.ARRAY_BUFFER, VBO);

    stride: i32 = 4 * size_of(f32);

    gl.VertexAttribPointer(0, 2, gl.FLOAT, gl.FALSE, stride, intToRawptr(0 * size_of(f32)));
    gl.EnableVertexAttribArray(0);

    gl.VertexAttribPointer(1, 2, gl.FLOAT, gl.FALSE, stride, intToRawptr(2 * size_of(f32)));
    gl.EnableVertexAttribArray(1);

    gl.BufferData(gl.ARRAY_BUFFER, size, cast(rawptr)&vertices[0], usage);
}

makeArrayModelV2V2 :: proc(
    vertices: []$T, mode: u32 = gl.TRIANGLES, usage: u32 = gl.STATIC_DRAW
) -> (
    result: ArrayModel
) {
    AM_setup(&result);
    AM_uploadV2V2(&result, vertices, mode, usage);
    return;
}

make2dRectUV :: proc(
    bottom_left := Vec2{0, 0}, top_right := Vec2{1, 1},
    uv_bottom_left := Vec2{0, 0}, uv_top_right := Vec2{1, 1},
    usage: u32 = gl.STATIC_DRAW,
) -> ArrayModel {
    data := [?]f32{
        bottom_left.x, bottom_left.y, uv_bottom_left.x, uv_bottom_left.y,
        top_right.x, bottom_left.y, uv_top_right.x, uv_bottom_left.y,
        top_right.x, top_right.y, uv_top_right.x, uv_top_right.y,
        bottom_left.x, bottom_left.y, uv_bottom_left.x, uv_bottom_left.y,
        top_right.x, top_right.y, uv_top_right.x, uv_top_right.y,
        bottom_left.x, top_right.y, uv_bottom_left.x, uv_top_right.y,
    };

    return makeArrayModelV2V2(data[:], gl.TRIANGLES, usage);
}

make2dRect :: proc(
    bottom_left := Vec2{0, 0}, top_right := Vec2{1, 1}, usage: u32 = gl.STATIC_DRAW,
) -> ArrayModel {
    data := [?]f32{
        bottom_left.x, bottom_left.y,
        top_right.x, bottom_left.y,
        top_right.x, top_right.y,
        bottom_left.x, bottom_left.y,
        top_right.x, top_right.y,
        bottom_left.x, top_right.y,
    };

    return makeArrayModelV2(data[:], gl.TRIANGLES, usage);
}

LiveProgram :: struct {
    id: u32,
    file_path: string,
    last_mod: os.File_Time,
}

LP_setupAndLoad :: proc(using lp: ^LiveProgram, new_file_path: string) {
    LP_cleanup(lp);
    file_path = new_file_path;
    LP_updateIfModified(lp);
}

LP_updateIfModified :: proc(using lp: ^LiveProgram) {
    new_last_mod, errno := os.last_write_time_by_name(file_path);
    if errno != os.ERROR_NONE {
        println("Could not open shader file for live load:", file_path);
        return;
    }

    if new_last_mod > last_mod {
        last_mod = new_last_mod;

        new_program, loaded := loadAndCheckProgram(file_path);
        if loaded {
            gl.DeleteProgram(id);
            id = new_program;
        }
        else do println("Could not load shader file for live load:", file_path);
    }
}

LP_cleanup :: proc(using lp: ^LiveProgram) {
    gl.DeleteProgram(id);
    delete(file_path);
    lp^ = LiveProgram{};
}

tag_to_shader_type := map[string]gl.Shader_Type{
    "#VERTEX" = gl.Shader_Type.VERTEX_SHADER,
    "#FRAGMENT" = gl.Shader_Type.FRAGMENT_SHADER,
    "#GEOMETRY" = gl.Shader_Type.GEOMETRY_SHADER,
    "#TESS_CONTROL" = gl.Shader_Type.TESS_CONTROL_SHADER,
    "#TESS_EVALUATION" = gl.Shader_Type.TESS_EVALUATION_SHADER,
    "#COMPUTE" = gl.Shader_Type.COMPUTE_SHADER,
};

// Load program with shaders separated by markers from file, compile and return the ID.
// Error codes:
// 0 - OK
// 1 - Error while reading file
// 2 - Error while compiling shader
// 3 - Error while linking program
// Important: in case of err == 2, must delete bad_shader!
loadProgram :: proc(path: string) -> (program: u32, err: int = 0, bad_shader: u32) {
    program_bytes, ok := os.read_entire_file(path);
    defer delete(program_bytes);

    if !ok do return 0, 1, 0;

    return makeProgram(string(program_bytes));
}

makeProgram :: proc(program_string: string) -> (program: u32, err: int = 0, bad_shader: u32) {
    lines := getLineIndices(program_string);

    ShaderCode :: struct {
        start, end: int,
        shader_type: gl.Shader_Type,
    }
    shader_codes := make([dynamic]ShaderCode, 0, len(tag_to_shader_type));
    defer delete(shader_codes);

    current_shader_start := -1;
    current_shader_type: gl.Shader_Type;
    for line_indices, i in lines {
        line := program_string[line_indices[0]:line_indices[1]];

        if shader_type, found := tag_to_shader_type[line]; found {
            if current_shader_start != -1 {
                append(&shader_codes, ShaderCode{
                    current_shader_start, i - 1, current_shader_type
                });
            }
            current_shader_start = i + 1;
            current_shader_type = shader_type;
        }
    }
    append(&shader_codes, ShaderCode{current_shader_start, len(lines) - 1, current_shader_type});

    compiled_shaders := make([]u32, len(shader_codes));
    defer delete(compiled_shaders);

    for c, i in shader_codes {
        start := lines[c.start][0];

        compiled_shaders[i] = gl.CreateShader(u32(c.shader_type));
        faux_array_of_strings := &program_string[start];
        faux_array_of_lengths := lines[c.end][1] - 1 - start;
        gl.ShaderSource(
            compiled_shaders[i], 1,
            cast(^^byte)&faux_array_of_strings, cast(^i32)&faux_array_of_lengths
        );
        gl.CompileShader(compiled_shaders[i]);

        shader_compilation_success: i32;
        gl.GetShaderiv(compiled_shaders[i], gl.COMPILE_STATUS, &shader_compilation_success);
        if shader_compilation_success == gl.FALSE {
            for j := 0; j < i; j += 1 {
                gl.DeleteShader(compiled_shaders[j]);
            }

            return 0, 2, compiled_shaders[i];
        }
    }

    program = gl.CreateProgram();
    for shader in compiled_shaders do gl.AttachShader(program, shader);

    gl.LinkProgram(program);

    for shader in compiled_shaders {
        gl.DetachShader(program, shader);
        gl.DeleteShader(shader);
    }

    link_success: i32;
    gl.GetProgramiv(program, gl.LINK_STATUS, &link_success);
    if link_success == gl.FALSE do return program, 3, 0;

    return program, 0, 0;
}

// Returns true if there was an error during loadShader(),
// prints error info and frees resources if one occured
checkAndPrintShaderError :: proc(
    err: int, bad_shader, bad_program: u32, path := "<no path provided>"
) -> bool {
    log := string(make([]byte, 512));
    defer delete(log);

    if err == 0 do return false;
    else {
        if err == 1 do println("Shader file loading error for", path);
        else if err == 2 {
            println("Shader compilation error for", path);

            printed_length: i32;
            gl.GetShaderInfoLog(bad_shader, i32(len(log)), &printed_length, cast(^byte)&log[0]);

            print(log);
            if i32(len(log)) == printed_length + 1 do print("(...)\n");
            else do print("\n");

            gl.DeleteShader(bad_shader);
        }
        else if (err == 3) {
            println("Program linking error for", path);

            printed_length: i32;
            gl.GetProgramInfoLog(bad_program, i32(len(log)), &printed_length, cast(^byte)&log[0]);

            print(log);
            if i32(len(log)) == printed_length + 1 do print("(...)\n");
            else do print("\n");

            gl.DeleteProgram(bad_program);
        }
        else {
            println("Unknown or invalid error for", path);
        }

        return true;
    }
}

getUniformLocationOdinString :: inline proc(program: u32, name: string) -> i32 {
    cname := strings.clone_to_cstring(name); defer delete(cname);
    return gl.get_uniform_location(program, cname);
}

loadAndCheckProgram :: proc(path: string) -> (u32, bool) {
    result, err, bad_shader := loadProgram(path);
    return result, !checkAndPrintShaderError(err, bad_shader, result, path);
}

setUniformf32 :: proc(program: u32, name: string, value: f32) {
    gl.Uniform1f(getUniformLocationOdinString(program, name), value);
}

setUniformV2 :: proc(program: u32, name: string, value: Vec2) {
    gl.Uniform2fv(
        getUniformLocationOdinString(program, name),
        1, cast(^f32)&value
    );
}

setUniformV3 :: proc(program: u32, name: string, value: Vec3) {
    gl.Uniform3fv(
        getUniformLocationOdinString(program, name),
        1, cast(^f32)&value
    );
}

setUniformV4 :: proc(program: u32, name: string, value: Vec4) {
    gl.Uniform4fv(
        getUniformLocationOdinString(program, name),
        1, cast(^f32)&value
    );
}

setUniformM2 :: proc(program: u32, name: string, value: ^Mat2, transpose := false) {
    gl.UniformMatrix2fv(
        getUniformLocationOdinString(program, name),
        1, transpose ? gl.TRUE : gl.FALSE, cast(^f32)value
    );
}

setUniformM3 :: proc(program: u32, name: string, value: ^Mat3, transpose := false) {
    gl.UniformMatrix3fv(
        getUniformLocationOdinString(program, name),
        1, transpose ? gl.TRUE : gl.FALSE, cast(^f32)value
    );
}

setUniformM4 :: proc(program: u32, name: string, value: ^Mat4, transpose := false) {
    gl.UniformMatrix4fv(
        getUniformLocationOdinString(program, name),
        1, transpose ? gl.TRUE : gl.FALSE, cast(^f32)value
    );
}

setUniform :: proc{
    setUniformf32,
    setUniformV4, setUniformV3, setUniformV2,
    setUniformM2, setUniformM3, setUniformM4
};

panicIfGLError :: proc(loc := #caller_location) {
    if ifGLErrorPrintCode() do panic("OpenGL Error", loc);
}

gl_error_to_string := map[u32]string {
    0      = "GL_NO_ERROR",
    0x0500 = "GL_INVALID_ENUM",
    0x0501 = "GL_INVALID_VALUE",
    0x0502 = "GL_INVALID_OPERATION",
    0x0503 = "GL_STACK_OVERFLOW",
    0x0504 = "GL_STACK_UNDERFLOW",
    0x0505 = "GL_OUT_OF_MEMORY",
    0x0506 = "GL_INVALID_FRAMEBUFFER_OPERATION",
    0x0507 = "GL_CONTEXT_LOST",
    0x8031 = "GL_TABLE_TOO_LARGE",
};

ifGLErrorPrintCode :: proc() -> bool {
    gl_error := gl.GetError();
    if (gl_error != gl.NO_ERROR) {
        printf("OpenGL Error: %s\n", gl_error_to_string[gl_error]);
        return true;
    }
    return false;
}
