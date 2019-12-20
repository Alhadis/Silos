using import "shared:odin-sdl2/sdl.odin"
using import "core:math.odin"
import "shared:odin-sdl2/sdl_ttf.odin"
import "shared:odin-sdl2/sdl_image.odin"
import "core:fmt.odin"

using import "render.odin"
using import "basic.odin"
using import "input.odin"
using import "entity.odin"
using import "physics.odin"
using import "animator.odin"
using import "collision.odin"

GAME_STATE : Game_State = Game_State.Menu;

// Entities
bulletTextures := make([dynamic]^Texture, 0, 2);
defaultEnemyTextures  := make([dynamic]^Texture, 0, 1);

playerEntity : ^GameObject;

explosionEntiy : ^GameObject;
pausedText : ^GameObject;
start_button : ^GameObject;

i : int = 0;

// Bullet data
BULLET_COOLDOWN :: 250;
BULLET_ALIVE_TIME :: 800;
timePassed := 0;

//Enemy Spawning
ENEMY_BASE_SPAWN_RATE :: 5000;
timeSinceSpawn := 0;

// Player Death 
DEAD_SCREEN_TIME :: 1600;

// Entities to remove
remove := make([dynamic]int, 0, 10);

game_init :: proc() {	
	playerEntity = create_player();

	playerEntity.id = i; i += 1;
	playerEntity.transform = Transform{Vec2{cast(f32)render.screenWidth/2, cast(f32)render.screenHeight/2}, Vec2{50,40}, 0};
	playerEntity.animator = create_animator(load_directory("art/player/player"),cast(u64)100);
	playerEntity.layer = 1;
	playerEntity.enabled = false;

	bgPos := Vec2{0,0};

	backgroundEntity := create_game_object();
	backgroundEntity.id = i; i += 1;
	backgroundEntity.transform = Transform{bgPos,Vec2{cast(f32)render.screenWidth*2, cast(f32)render.screenHeight*2}, 0};
	backgroundEntity.animator = create_animator(sdl_image.load_texture(renderer, "art/bg.png"));
	backgroundEntity.layer = 0;
	backgroundEntity.collide = false;

	append(&bulletTextures, sdl_image.load_texture(renderer, "art/player/bullet1.png"));
	append(&bulletTextures, sdl_image.load_texture(renderer, "art/player/bullet1-2.png"));

	append(&defaultEnemyTextures, sdl_image.load_texture(renderer, "art/default_enemy/spacestation.png"));	

	explosionEntiy = create_game_object();
	explosionEntiy.id = i; i += 1;
	explosionEntiy.animator = create_animator(load_directory("art/player/death"), cast(u64)50);
	explosionEntiy.animator.repeat = false;
	explosionEntiy.transform = Transform{Vec2{0,0}, Vec2{100,100}, 0};
	explosionEntiy.layer = 1;
	explosionEntiy.collide = false;
	explosionEntiy.enabled = false;

	// UI

	pausedText = create_game_object();
	pausedText.id = i; i += 1;
	pausedText.transform = Transform{Vec2{cast(f32)(screenWidth/2), 200}, Vec2{240, 60}, 0};
	pausedText.animator = create_animator(sdl_image.load_texture(renderer, "art/menu/paused.png"));
	pausedText.layer = 10;
	pausedText.collide = false;
	pausedText.enabled = false;

	start_button = create_button();
	start_button.id = i; i += 1;
	start_button.transform = Transform{Vec2{cast(f32)(screenWidth/2), 200}, Vec2{240, 60}, 0};
	start_button.animator = create_animator(sdl_image.load_texture(renderer, "art/menu/start_button.png"));
	start_button.collide = false;
	start_button.layer = 10;

	/*
	box := create_game_object();
	box.id = i; i += 1;
	box.transform = Transform{Vec2{500, 500},Vec2{100, 100}, 0};
	box.animator = create_animator(sdl_image.load_texture(renderer, "art/square.png"));
	box.layer = 0;*/
}

update_game :: proc() -> bool {

	switch GAME_STATE {
		case Game_State.Menu: {
			return menu_update();
		}
		case Game_State.Playing: {
			return update();
		}
		case Game_State.Score_Screen: {
			return update_score_screen();
		}
		case Game_State.Paused: {
			return paused_update();
		}
	}
	return false;
}

menu_update :: proc() -> bool {
	if is_pressed(Key_Code.ENTER) do GAME_STATE = Game_State.Playing;


	for j in 0..len(gameObjects) {
		entity := &gameObjects[j];
		switch der in &entity.derived {
			case Player: {
				rot := to_radians(entity.transform.rotation - 90);
				normal := Vec2{cos(rot), sin(rot)};
				entity.transform.rotation = ((atan2_approximation(input.state.MOUSE.y - entity.transform.position.y - (entity.transform.size.y/2), input.state.MOUSE.x - entity.transform.position.x - (entity.transform.size.x/2)) * 180) / PI) + 90;
			}
			case Button: {
				if is_inside(input.state.MOUSE, get_bounding_box(entity^)) && is_pressed(Key_Code.LEFT_CLICK)
				{
					GAME_STATE = Game_State.Playing;
					entity.enabled = false;
					playerEntity.enabled = true;
				}
			}
		}
	}

	return true;
}

update :: proc() -> bool {

	if is_pressed(Key_Code.ESCAPE) {
		GAME_STATE = Game_State.Paused;
		pausedText.enabled = true;
		return true;
	}

   	for j in 0..len(gameObjects) {
   		go := &gameObjects[j];
		switch der in &go.derived {

			case Bullet: {
				using der;

				timeLived += physics.deltaTime;
				if timeLived >= BULLET_ALIVE_TIME {
					remove_entity(go.id);
					continue;
				}

				go.transform.position.x += velocity.x;
				go.transform.position.y += velocity.y;
			}
			case Player: {
				using der;

				rot := to_radians(go.transform.rotation - 90);
				normal := Vec2{cos(rot), sin(rot)};

				newPos := go.transform.position + (normal * 10);
				if !test_move(go^, newPos, 2)  && !isDying {
					go.transform.position = newPos;
				}
				else
				{
					isDying = true;
					go.enabled = false;

					explosionEntiy.transform.position = Vec2{go.transform.position.x, go.transform.position.y};
					explosionEntiy.enabled = true;

					if timeDead >= DEAD_SCREEN_TIME
					{
						present_score_screen();
					}

					timeDead += physics.deltaTime;
				}
				

				if is_pressed(Key_Code.LEFT_CLICK) && !isDying
				{
					if timePassed >= BULLET_COOLDOWN
					{
						bullet := create_bullet(normal * Vec2{25, 25});

						bullet.id = i;
						
						bullet.transform = Transform{
							Vec2 {
								go.transform.position.x + normal.x, 
								go.transform.position.y + normal.y
							}, 
							Vec2 {5, 5},
							go.transform.rotation
						};

						bullet.animator = create_animator(bulletTextures, cast(u64)100);

						bullet.layer = 2;
						i += 1;

						timePassed = 0;
					}
				}
				
				go.transform.rotation = ((atan2_approximation(input.state.MOUSE.y - go.transform.position.y - (go.transform.size.y/2), input.state.MOUSE.x - go.transform.position.x - (go.transform.size.x/2)) * 180) / PI) + 90;

				render.camera.x = go.transform.position.x - cast(f32)render.screenWidth / 2;
				render.camera.y = go.transform.position.y - cast(f32)render.screenHeight / 2;
			}
			case Enemy: {
				update_enemy(go, der);
			}
		}
   	}

   	if timeSinceSpawn >= ENEMY_BASE_SPAWN_RATE
   	{
   		//enemy := create_default_enemy(20);


   		timeSinceSpawn = 0;
   	}

   	timePassed += physics.deltaTime;
   	timeSinceSpawn += physics.deltaTime;

	return true;
}

update_enemy :: inline proc(go : ^GameObject, enemy : ^Enemy) {
	switch derEnemy in &enemy.derived {
		case Default_Enemy: {

		}
	}
}

paused_update :: proc() -> bool {

	if is_pressed(Key_Code.ESCAPE) {
		GAME_STATE = Game_State.Playing;
		pausedText.enabled = false;
		return true;
	}

	return true;
}

present_score_screen :: proc() {
	GAME_STATE = Game_State.Score_Screen;
}

update_score_screen :: proc() -> bool {
	restart_game();
	return true;
}

restart_game :: proc() {
	GAME_STATE = Game_State.Menu;

	playerEntity.transform = Transform{Vec2{cast(f32)render.screenWidth/2, cast(f32)render.screenHeight/2}, Vec2{50,40}, 0};
	playerEntity.enabled = false;
	playerEntity.derived.(Player).isDying = false;
	playerEntity.derived.(Player).timeDead = 0;

	render.camera.x = playerEntity.transform.position.x - cast(f32)render.screenWidth / 2;
	render.camera.y = playerEntity.transform.position.y - cast(f32)render.screenHeight / 2;

	start_button.enabled = true;

	explosionEntiy.animator.index = 0;
	explosionEntiy.enabled = false;
}

Game_State :: enum {
	Menu,
	Playing,
	Paused,
	Score_Screen,
}
