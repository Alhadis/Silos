package main

import "core:mem"
import "core:math"
import "core:fmt"
import "core:math/rand"
import "pl"




Material :: struct {
	color: math.Vec3,
	reflective_index: f32
}


Camera :: struct {
	pos: math.Vec3,
	dir: math.Vec3
}

Sphere :: struct {
	center: math.Vec3,
	radius: f32,
	mat: Material
}


Plane :: struct {
	p: math.Vec3,
	n: math.Vec3
}	


World :: struct {
	spheres: [dynamic]Sphere,
	plane: Plane,
	camera: Camera
}




v3_to_u32 :: proc(v: math.Vec3) -> u32 {
	pixel: u32 = (u32(v.x * 255) << 16) |
				 (u32(v.y * 255) << 8) |
				 (u32(v.z * 255));
	return pixel;
}


rand_v3 :: proc() -> math.Vec3 {
	return math.Vec3{rand.float32_range(0, 1),
				     rand.float32_range(0, 1),
				     rand.float32_range(0, 1)};
				     

}




generate_spheres :: proc (spheres: ^[dynamic]Sphere, range: f32, count: int){
	for i := 0; i < count; i += 1 {
		s : Sphere = {
			math.Vec3{
				rand.float32_range(-range, range),
				rand.float32_range(-range, range),
				rand.float32_range(-range, range)
			}, 1, Material{rand_v3(), 0.5}};
		append(spheres, s);
	}
}





initialize_world :: proc (world: ^World) {


	generate_spheres(&world.spheres, 7, 20);

	// s0: Sphere;
	// s0.mat = {color={1,0,0}, reflective_index=0.8};
	// s0.center = {-3,4,0};
	// s0.radius = 3;

	// s1: Sphere;
	// s1.mat = {color={0,1,0}, reflective_index=0.2};
	// s1.center = {3,4,0};
	// s1.radius = 3;

	// append(&world.spheres, s0);
	// append(&world.spheres, s1);

	world.plane = {p={0, -1, 0}, n={0,1,0}};

	world.camera.pos = math.Vec3{0.0, 0.0, 20.0};
	world.camera.dir = math.Vec3{0.0, 0.0, -1.0};
}

intersect_plane :: proc(p: Plane, rayorig: math.Vec3, raydir: math.Vec3, t: ^f32) -> bool {
	denom := math.dot(p.n, raydir);
	if(denom > 0.00000001 || -denom > 0.00000001) {
		t^ = math.dot(p.p - rayorig, p.n) / denom;
		point := (t^ * raydir) + rayorig;
		return t^ > 0;
	}
	return false;
}

/*
bool IntersectPlane(plane Plane, v3 l0, v3 l, float *t)
{
    // assuming vectors are all normalized
    v3 p0 = {};
    p0.x = Plane.N.x * Plane.d;
    p0.y = Plane.N.y * Plane.d;
    p0.z = Plane.N.z * Plane.d;
    
    float denom = dotProduct(Plane.N, l);
    if (denom > 1e-6 || -denom > 1e-6) {
        v3 p0l0 = p0 - l0;
        *t = (Plane.d - dotProduct(p0l0, Plane.N)) / denom;
        return (t >= 0);
    }
    return false;
}
*/



intersect_sphere :: proc (s: Sphere, rayorig: math.Vec3, raydir: math.Vec3, t0: ^f32, t1: ^f32) -> bool {
	l: math.Vec3 = s.center - rayorig;
	tca: f32 = math.dot(l, raydir);
	if (tca < 0) do return false;
	d2: f32 = math.dot(l, l) - tca * tca;
	if (d2 > s.radius * s.radius) do return false;
	thc: f32 = math.sqrt((s.radius * s.radius) - d2);
	t0^ = tca - thc;
	t1^ = tca + thc;

	return true;
}

buffer_coords_to_film_point :: proc(buffer: ^pl.Image_Buffer, camera: ^Camera, x: int, y: int) -> math.Vec3 {
	origin := camera.pos;
	camera_z := math.norm(camera.dir) * -1;
	camera_x : math.Vec3 = math.norm(math.cross(camera_z, math.Vec3{0, -1, 0}));
	camera_y := math.norm(math.cross(camera_z, camera_x));

	film_dist: f32 = 1.0;
	film_w: f32 = f32(buffer.width) / f32(buffer.height);
	film_h: f32 = 1.0;
	half_film_w := film_w * 0.5;
	half_film_h := film_h * 0.5;
	film_center := origin - camera_z * film_dist;

	film_x := 2.0 * (f32(x) / f32(buffer.width)) - 1.0;
	film_y := 2.0 * (f32(y) / f32(buffer.height)) - 1.0;
	film_p := film_center + (camera_y * film_y * half_film_h) + (film_x * half_film_w * camera_x);
	return film_p;
}


ray_cast :: proc (origin: math.Vec3, dir: math.Vec3, world: ^World, depth: int) -> math.Vec3 {
	t0: f32 = math.F32_MAX;
	t1: f32 = math.F32_MAX;
	hit_distance: f32 = math.F32_MAX;
	hit_color: math.Vec3;
	//cast against spheres
	for i := 0; i < len(world.spheres); i += 1 {
		s := world.spheres[i];
		if(intersect_sphere(s, origin, dir, &t0, &t1)) {
			//first hit does not merge with black
			
			if(t0 < 0) do t0 = t1;
			if(t0 < hit_distance) {
				if(s.mat.reflective_index > 0 && depth > 0) {
					//cast reflective ray;
					hit_point := origin + (dir * t0);
					l := math.norm(-dir);
					normal := math.norm(hit_point - s.center);
					b := math.dot(l, normal) * normal;

					r := 2*(b - l) + l;
					bias : f32 = 0.0000001;
					hit_color = s.mat.color * (1 - s.mat.reflective_index) +
								s.mat.reflective_index * ray_cast(hit_point + normal * bias, math.norm(r), world, depth - 1);
				} else {
					hit_color = s.mat.color;
				}
				hit_distance = t0;
			}
		}
	}
	//cast against planes
	p := world.plane;
	t: f32;
	if (intersect_plane(p, origin, dir, &t)) {
		if t < hit_distance {
			hit_color = {0.5, 0.5, 0.5};
		}
	}
	return hit_color;
}


draw_rect :: proc(buffer: ^pl.Image_Buffer, x: int, y: int, width: int, height: int) {
	for yy := y ; yy < y + height; yy += 1 {
		for xx := x; xx < x + width; xx += 1 {
			row: ^u32 = cast(^u32)(mem.ptr_offset(buffer.data, yy * int(buffer.pitch)));
			pixel: ^u32 = cast(^u32)(mem.ptr_offset(row, xx));
			pixel^ = 0x0000ffff;
		}
	}
}



update :: proc (world: ^World, pl_ctx: ^pl.PL) {
	if(pl_ctx.mouse.left.isDown) {
		dist: f32 = math.length(main_world.camera.pos);
		horiz_theta: f32 = 0.005 * f32(pl_ctx.mouse.delta_x);
		vert_theta:  f32 = 0.005 * f32(pl_ctx.mouse.delta_y);

		{
			x := main_world.camera.pos.x;
			z := main_world.camera.pos.z;
			newx := x * math.cos(horiz_theta) - z * math.sin(horiz_theta);
			newz := z * math.cos(horiz_theta) + x * math.sin(horiz_theta);

			main_world.camera.pos.x = newx;
			main_world.camera.pos.z = newz;
			main_world.camera.dir.x = -newx / dist;
			main_world.camera.dir.z = -newz / dist;
		}

		when true {
			x := main_world.camera.pos.x;
			y := main_world.camera.pos.y;
			newx := x * math.cos(vert_theta) - y * math.sin(vert_theta);
			newy := y * math.cos(vert_theta) + x * math.sin(vert_theta);

			main_world.camera.pos.x = newx;
			main_world.camera.pos.y = newy;
			main_world.camera.dir.x = -newx / dist;
			main_world.camera.dir.y = -newy / dist;
		}
	}

	if(pl_ctx.keys[0].isDown && !pl_ctx.keys[0].wasDown) {
		generate_spheres(&world.spheres, 7, 1);
	}
}







render :: proc (world: ^World, buffer: ^pl.Image_Buffer) {

	origin := world.camera.pos;
	camera_z := math.norm(world.camera.dir) * -1;
	camera_x : math.Vec3 = math.norm(math.cross(camera_z, math.Vec3{0, -1, 0}));
	camera_y := math.norm(math.cross(camera_z, camera_x));

	film_dist: f32 = 1.0;
	film_w: f32 = f32(buffer.width) / f32(buffer.height);
	film_h: f32 = 1.0;
	half_film_w := film_w * 0.5;
	half_film_h := film_h * 0.5;
	film_center := origin - camera_z * film_dist;
	pixel_width := film_w / f32(buffer.width);
	pixel_height := film_h / f32(buffer.height);



	base_ptr: ^u32 = cast(^u32)buffer.data;
	for y: i32 = 0; y < buffer.height; y += 1 {
		film_y := 2.0 * (f32(y) / f32(buffer.height)) - 1.0;
		for x: i32 = 0; x < buffer.width; x += 1 {

			pixel: ^u32 = mem.ptr_offset(base_ptr, int(x + y * buffer.width));


			film_x := 2.0 * (f32(x) / f32(buffer.width)) - 1.0;
			film_p := film_center + (camera_y * film_y * half_film_h) + (film_x * half_film_w * camera_x);
			ray_dir: math.Vec3 = math.norm(film_p - origin);

			pixel^ = v3_to_u32(ray_cast(origin, ray_dir, world, 3));
		}
	}
}
