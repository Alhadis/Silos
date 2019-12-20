package main

      import "core:strings"
      import "core:math/rand"

      import wb "shared:workbench"
      import    "shared:workbench/platform"
using import    "shared:workbench/math"
      import    "shared:workbench/gpu"
      import    "shared:workbench/external/imgui"
using import    "shared:workbench/logging"
using import    "shared:workbench/types"
using import    "shared:workbench/external/gl"

Clouds :: struct {
    base: Entity_Base,
}

Cloud_Config :: struct {
    worley_cell_count: int,
    invert: bool,
    cloud_density_threshold: f32 `imgui_range="0":"1"`,
    cloud_density_multiplier: f32,
    cloud_scale: f32,
    visualizer_z: f32 `imgui_range="0":"1"`,
}

cloud_texture: wb.Texture;
cloud_config: Cloud_Config;

init_clouds :: proc() {
    cloud_config.worley_cell_count = 5;
    cloud_config.invert = true;
    cloud_config.cloud_scale = 0.01;
    cloud_config.cloud_density_multiplier = 0.005;
    cloud_config.cloud_density_threshold = 0.5;

    TEX_DIM :: 128;
    cloud_texture = wb.create_texture_3d(TEX_DIM, TEX_DIM, TEX_DIM, .RGBA, .RGBA, .Unsigned_Int, nil);
    asset_catalog.textures[strings.clone("clouds")] = cloud_texture;

    // generate_3d_worley_noise(&cloud_texture, cloud_config.worley_cell_count, cloud_config.worley_cell_count, cloud_config.worley_cell_count, cloud_config.invert);
}

update_clouds :: proc() {
    if imgui.begin("Cloud Config") {
        if imgui.button("Regenerate") {
            generate_3d_worley_noise(&cloud_texture, cloud_config.worley_cell_count, cloud_config.worley_cell_count, cloud_config.worley_cell_count, cloud_config.invert);
        }
        wb.imgui_struct(&cloud_config, "Cloud Config");
    }
    imgui.end();
}

draw_clouds :: proc() {
    // shader := wb.get_shader(&wb.wb_catalog, "default_3d_texture");
    // gpu.use_program(shader);
    // gpu.uniform_float(shader, "slice_z", cloud_config.visualizer_z);
    // wb.draw_texture(cloud_texture, {0, 0}, {256, 256} / platform.current_window_size);
}

generate_3d_worley_noise :: proc(texture3d: ^wb.Texture, num_cells_x, num_cells_y, num_cells_z: int, invert: bool) {
    assert(texture3d.target == .Texture3D);

    rng: rand.Rand;
    rand.init(&rng, cast(u64)wb.time);

    // setup a point in each worley cell of the texture
    points := make([]Vec3, num_cells_x * num_cells_y * num_cells_z);
    defer delete(points);

    x_cell_size := 1 / cast(f32)num_cells_x;
    y_cell_size := 1 / cast(f32)num_cells_y;
    z_cell_size := 1 / cast(f32)num_cells_z;

    for x in 0..<num_cells_x {
        for y in 0..<num_cells_y {
            for z in 0..<num_cells_z {
                cell_min := Vec3{cast(f32)x * x_cell_size, cast(f32)y * y_cell_size, cast(f32)z * z_cell_size};
                cell_max := cell_min + Vec3{x_cell_size, y_cell_size, z_cell_size};
                rnd_pos := lerp(cell_min, cell_max, Vec3{rand.float32(&rng), rand.float32(&rng), rand.float32(&rng)});
                points[x+(num_cells_x*y)+(num_cells_x*num_cells_y*z)] = rnd_pos;
            }
        }
    }

    worley_shader := wb.get_shader(&asset_catalog, "worley");

    gpu.use_program(worley_shader);
    gpu.active_texture0();
    gl.BindImageTexture(0, cast(u32)texture3d.gpu_id, 0, gl.TRUE, 0, gl.WRITE_ONLY, gl.RGBA8);
    gpu.uniform_int(worley_shader, "image", 0);
    gpu.uniform_int(worley_shader, "invert", cast(i32)invert);
    gpu.uniform_float(worley_shader, "num_cells_x", cast(f32)num_cells_x);
    gpu.uniform_float(worley_shader, "num_cells_y", cast(f32)num_cells_y);
    gpu.uniform_float(worley_shader, "num_cells_z", cast(f32)num_cells_z);
    gpu.uniform_vec3_array(worley_shader, "points", points[:]);
    gpu.uniform_int(worley_shader, "num_points", cast(i32)len(points));
    gpu.uniform_float(worley_shader, "time", wb.time);
    gl.DispatchCompute(cast(u32)texture3d.width, cast(u32)texture3d.height, cast(u32)texture3d.depth);

    gl.MemoryBarrier(gl.SHADER_IMAGE_ACCESS_BARRIER_BIT);
}
