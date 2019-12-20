using import "core:math.odin"
import "core:fmt.odin"

using import "shared:odin-sdl2/sdl.odin"
import "shared:odin-sdl2/sdl_ttf.odin"
import "shared:odin-sdl2/sdl_image.odin"
import "shared:libbrew/string_util.odin"
import "shared:libbrew/win/file.odin"

using import "basic.odin"
using import "entity.odin"
import "animator.odin"

screenWidth : i32 = 1280;
screenHeight : i32 = 720;

renderer : ^Renderer;
window : ^Window;
camera : Vec2;

layers := []int{0,1,2,3,4,5,6,7,8,9,10};

lines := make([dynamic]Tuple, 0, 60);
boxes := make([dynamic]Tuple, 0, 60);

// FPS
displayCounter := true;
font : ^sdl_ttf.Font;
color := Color{125,125,125,0};
msgRect := Rect{20,0,100,50};

frameCount := 0;
time := 0;
fps := 0;
fps_surface : ^Surface;
fps_texture : ^Texture;

renderer_init :: proc() {
	sdl.init(sdl.Init_Flags.Everything);
	sdl_image.init(sdl_image.Init_Flags.PNG);
	sdl_ttf.init();

	font = sdl_ttf.open_font("text/arial.ttf", 15);

	// setup window and renderer
	window = sdl.create_window("Mira", cast(i32)sdl.Window_Pos.Undefined, cast(i32)sdl.Window_Pos.Undefined, screenWidth, screenHeight, sdl.Window_Flags.Open_GL);
	renderer = create_renderer(window, -1, (Renderer_Flags.Accelerated | Renderer_Flags.Present_VSync));

	fps_surface = sdl_ttf.render_text_solid(font, fmt.aprint("FPS: ", fps), color);
	fps_texture = create_texture_from_surface(renderer, fps_surface);

	camera = Vec2{0,0};
}

update_render :: proc() -> bool {
	
	set_render_draw_color(renderer, 0, 0, 0, 0);
	render_clear(renderer);

	for i, layer in layers {
		for go in gameObjects {
			if go.layer == layer do render_gameobject(go);
		}
	}

	set_render_draw_color(renderer, 0, 255, 0, 0);
	set_render_draw_blend_mode(renderer, Blend_Mode.None);
	for line in lines {
		render_draw_line(renderer, 
			cast(i32)line.min.x - cast(i32)camera.x, 
			cast(i32)line.min.y - cast(i32)camera.y, 
			cast(i32)line.max.x - cast(i32)camera.x, 
			cast(i32)line.max.y - cast(i32)camera.y);
	}

	clear(&lines);

	set_render_draw_color(renderer, 100, 0, 0, 200);
	set_render_draw_blend_mode(renderer, Blend_Mode.Blend);
	for box in boxes {
		rect := Rect{cast(i32)box.min.x - cast(i32)camera.x, cast(i32)box.min.y - cast(i32)camera.y, cast(i32)box.max.x, cast(i32)box.max.y};
		render_fill_rect(renderer, &rect);
	}

	clear(&boxes);


	// FPS Counter
	{
		timePassed := cast(int)get_ticks() - time;
		if (timePassed > 1000)
		{
			fps = frameCount;
			frameCount = 0;
			time = cast(int)get_ticks();

			fps_surface = sdl_ttf.render_text_solid(font, fmt.aprint("FPS: ", fps), color);
			fps_texture = create_texture_from_surface(renderer, fps_surface);
			if !displayCounter do fmt.println("FPS: ", fps);
		}

		frameCount += 1;

		set_render_draw_color(renderer, 0, 200, 50, 100);
		set_render_draw_blend_mode(renderer, Blend_Mode.Blend);

		if displayCounter do render_copy(renderer, fps_texture, nil, &msgRect);
	}
	

	render_present(renderer);

	return true;
}

render_gameobject :: proc(go : GameObject)
{
	if !go.enabled do return;

	texture := animator.get_current(go.animator);
	if texture == nil || !validate_texture(texture) do return;

	rect : Rect; 
	if go.layer != 10 do
		rect = Rect{cast(i32)(go.transform.position.x - camera.x - go.transform.size.x/2), cast(i32)(go.transform.position.y - camera.y - go.transform.size.y/2), cast(i32)go.transform.size.x, cast(i32)go.transform.size.y};
	else do
		rect = Rect{cast(i32)(go.transform.position.x - go.transform.size.x/2), cast(i32)(go.transform.position.y - go.transform.size.y/2), cast(i32)go.transform.size.x, cast(i32)go.transform.size.y};
	render_copy_ex(renderer, texture, nil, &rect, cast(f64)go.transform.rotation, nil, Renderer_Flip.None);
	check_errors();
}

cleanup :: proc() {
	destroy_window(window);
	destroy_renderer(renderer);
}

validate_texture :: proc(texture : ^Texture) -> bool {
	return query_texture(texture, nil, nil, nil, nil) >= 0;
}

get_image_size :: proc(texture : ^Texture) -> (int, int) {

	width : i32;
	height : i32;

	query_texture(texture, nil, nil, &width, &height);

	return cast(int)width, cast(int)height;
}

draw_line :: proc(min, max : Vec2) {
	append(&lines, Tuple{min,max});
}

draw_box :: proc(min, max : Vec2) {
	append(&boxes, Tuple{min,max});
}

load_directory :: proc(path : string) -> [dynamic]^Texture {
	files := file.get_all_entries_in_directory(path);
	count := len(&files);
	textures := make([dynamic]^Texture, 0, count);

	for i in 0..count {
		fName := files[i];
		extenstion := string_util.get_last_extension(fName);

		if extenstion != ".png" do continue;

		fullPath := fmt.aprint(path, "/", fName);
		append(&textures, sdl_image.load_texture(renderer, fullPath));
	}

	return textures;
}

Tuple :: struct {
	min,max : Vec2
}