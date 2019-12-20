/*
 *  @Name:     renderer
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 13-05-2017 23:48:58
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 05-02-2018 04:56:15 UTC+1
 *  
 *  @Description:
 *      Functions and data related to the renderer. 
 */
import "core:fmt.odin";
import "core:math.odin";

import gl "shared:libbrew/gl.odin";
import console "shared:libbrew/imgui_console.odin";
import    "catalog.odin";
import    "gl_util.odin";
import ja "asset.odin";

Camera :: struct {
    pos  : math.Vec3,
    near_clipplane : f32,
    far_clipplane  : f32,

    fov            : int,

    pixel_width    : int,
    pixel_height   : int,
}

camera : Camera;
test_program : gl.Program;
test_vao : gl.VAO;
test_vbo : gl.VBO;
test_normals : gl.VBO;
test_ebo : gl.EBO;
entity := Entity{};

Entity :: struct {
    position : math.Vec3,
    rotation : math.Vec3,
    scale    : math.Vec3,

    model    : ^ja.Model_3d,
}

init :: proc(s_cat : ^catalog.Catalog, m_cat : ^catalog.Catalog, width, height : int) {
    camera = Camera{};
    camera.pos = math.Vec3{-7, 11, -170};
    camera.near_clipplane = 0.1;
    camera.far_clipplane = 1000;
    camera.pixel_width = width;
    camera.pixel_height = height;
    camera.fov = 60;

    console.log("Model test setup");
    vertex  := catalog.find(s_cat, "basic_vert", ja.Shader);
    frag    := catalog.find(s_cat, "basic_frag", ja.Shader);
    test_program = gl_util.create_program(vertex, frag);
    test_vao = gl.gen_vertex_array();
    gl.bind_vertex_array(test_vao);
    test_vbo = gl.gen_vbo();
    test_normals = gl.gen_vbo();
    test_ebo = gl.gen_ebo();
    model := catalog.find(m_cat, "siegeRam", ja.Model_3d);
    if model != nil {
        gl.bind_buffer(test_vbo);
        gl.enable_vertex_attrib_array(test_program.attributes["vert_pos"]);
        gl.enable_vertex_attrib_array(test_program.attributes["vert_uv"]);
        gl.enable_vertex_attrib_array(test_program.attributes["vert_norm"]);
        gl.enable_vertex_attrib_array(test_program.attributes["vert_color"]);
        //gl.vertex_attrib_pointer(test_program.attributes["vert_uv"],   2, gl.VertexAttribDataType.Float, false, size_of(ja.Vertex), offset_of(ja.Vertex, uv));
        gl.vertex_attrib_pointer(test_program.attributes["vert_pos"],  3, gl.VertexAttribDataType.Float, false, size_of(ja.Vertex), offset_of(ja.Vertex, pos));
        //gl.vertex_attrib_pointer(test_program.attributes["vert_norm"], 3, gl.VertexAttribDataType.Float, false, size_of(ja.Vertex), offset_of(ja.Vertex, norm));
        gl.vertex_attrib_pointer(test_program.attributes["vert_color"], 3, gl.VertexAttribDataType.Float, false, size_of(ja.Vertex), offset_of(ja.Vertex, color));
        gl.buffer_data(gl.BufferTargets.Array, i32(len(model.vertices[..])) * size_of(model.vertices[0]), rawptr(&model.vertices[0]), gl.BufferDataUsage.StaticDraw);
    } else {
        console.log_error("Could not load monkey");       
    }

    entity.model = model;
}

calculate_proj :: proc(camera : Camera) -> math.Mat4 {
    aspect := f32(camera.pixel_width) / f32(camera.pixel_height);
    result := math.perspective(f32(camera.fov) * aspect, aspect, camera.near_clipplane, camera.far_clipplane);
    return result;
}

create_view_from_camera :: proc(camera : Camera) -> math.Mat4 {
    return math.mul(math.identity(math.Mat4), math.mat4_translate(camera.pos));
}

create_model_from_entity :: proc(entity : Entity) -> math.Mat4 {
    return math.mat4_rotate(math.Vec3{0, 1, 0}, math.to_radians(entity.rotation.y));
}

render :: proc(acc_time : f64, width, height : int) {
    entity.rotation.y = f32(acc_time) * 15;
    proj := calculate_proj(camera);
    view := create_view_from_camera(camera);
    model := create_model_from_entity(entity);

    gl.bind_vertex_array(test_vao);
    gl.use_program(test_program);
    gl.uniform(test_program.uniforms["proj"], proj);
    gl.uniform(test_program.uniforms["view"], view);
    gl.uniform(test_program.uniforms["model"], model);
    //gl.uniform(test_program.uniforms["color"], 1.0, 0.0, 0.0, 1.0);
    gl.enable(gl.Capabilities.DepthTest);
    gl.bind_buffer(test_vbo);
/*    gl.polygon_mode(gl.PolygonFace.Front, gl.PolygonModes.Line);
    gl.polygon_mode(gl.PolygonFace.Back, gl.PolygonModes.Line);*/
    gl.draw_arrays(gl.DrawModes.Triangles, 0, len(entity.model.vertices));
    /*gl.polygon_mode(gl.PolygonFace.Front, gl.PolygonModes.Fill);
    gl.polygon_mode(gl.PolygonFace.Back, gl.PolygonModes.Fill);
    gl.draw_arrays(gl.DrawModes.Triangles, 0, len(entity.model.vertices));*/
}