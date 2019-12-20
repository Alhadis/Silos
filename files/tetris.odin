package tetris;

import "core:mem"; //mem.set
import "core:fmt"; //fmt.println
import "core:os"; //os.exit
import "core:math/rand"; //for rand piece generation
import "sdl";

// window dimensions
W :: 270*2;
H :: 352*2;
// tetrominoes tile size
TSZ :: 32;

//board width and height
BW :: 10;
BH :: 22;

// sdl stuff
window : ^sdl.Window;
renderer : ^sdl.Renderer;

// in this array we store the keyboard state of each key (indexed by scancode) such that the (first) least significant bit
// marks whether or not the key is down at the current frame and
// the second bit marks whether the key was down the previous frame
keyboard_state : [512] u8;
is_key_held :: proc(scancode: sdl.Scancode) -> bool {
	//key is held if it is down this frame
	return keyboard_state[cast(i32)scancode] & 0b01 != 0;
}
is_key_pressed :: proc(scancode: sdl.Scancode) -> bool {
	//key is pressed if it is down this frame but not the previous one
	return keyboard_state[cast(i32)scancode] == 0b01;
}
is_key_released :: proc(scancode: sdl.Scancode) -> bool {
	//key is released if it is down the previous frame but not the current one
	return keyboard_state[cast(i32)scancode] == 0b10;
}

rand_state : rand.Rand;

// whether the game is running or not
running : bool;

// struct used for the tetrominoes, the game pieces (i use Piece and not Tetromino to decrease verbosity)
Piece :: struct {
	w, h: u8,
	p: [4][4]u8 //for the tetrominoes that are actually 3x3, the right and bottom column and row will be left empty
};

base_pieces := []Piece {
	Piece { /* long boy */
		4, 4, {{0,0,0,0},
		       {1,1,1,1},
		       {0,0,0,0},
		       {0,0,0,0}}
	}, Piece { /* L */
		3, 3, {{1,0,0,0},
		       {1,1,1,0},
		       {0,0,0,0},
		       {0,0,0,0}}
	}, Piece { /* L 2 */
		3, 3, {{0,0,1,0},
		       {1,1,1,0},
		       {0,0,0,0},
		       {0,0,0,0}}
	}, Piece { /* block boy */
		2, 2, {{1,1,0,0},
		       {1,1,0,0},
		       {0,0,0,0},
	         {0,0,0,0}}
	}, Piece { /* z */
		3, 3, {{1,1,0,0},
		       {0,1,1,0},
		       {0,0,0,0},
		       {0,0,0,0}}
	}, Piece { /* z 2 */
		3, 3, {{0,1,1,0},
		       {1,1,0,0},
		       {0,0,0,0},
		       {0,0,0,0}}
	}, Piece { /* middle finger */
		3, 3, {{0,1,0,0},
		       {1,1,1,0},
		       {0,0,0,0},
		       {0,0,0,0}}
	}
};

piece_queue : [3]Piece;

Color :: struct {
	r,g,b : u8
}
palette := []Color {
	Color {0,0,0}, //dummy, no block will use this color as 0 means empty
	Color {255,255,255},
	Color {230,0,10},
	Color {10,180,255},
	Color {255,255,0},
	Color {80,30,240},
	Color {255,30,210}
};

// x and y coordinates of the "cursor": the place of the current tetris piece in the screen
cursor_x, cursor_y : u32;

board : [BW][BH]u8;

State :: enum {
	Game,
	Over
};

state := State.Game;

gen_piece :: proc() -> Piece {
	piece : Piece;
	idx := rand.uint32(&rand_state) % cast(u32)len(base_pieces);
	piece = base_pieces[idx];
	
	//give it a random color
	color_idx := cast(u8)(rand.uint32(&rand_state) % cast(u32)(len(palette)-1) + 1);
	for x in 0 .. piece.w-1 {
		for y in 0 .. piece.h-1 {
			if piece.p[x][y] != 0 {
				piece.p[x][y] = color_idx;
			}
		}
	}
	if rand.uint32(&rand_state) % 2 == 0 {
		piece = piece_rotate_ccw(piece);
	}
	return piece;
}

draw_piece :: proc(piece: Piece, x: i32, y: i32) {
	////sdl.set_render_draw_color(255, 0, 0);
	for tx in 0 .. piece.w-1 {
		for ty in 0 .. piece.h-1 {
			if piece.p[tx][ty] != 0 {
				color := palette[piece.p[tx][ty]];
				sdl.set_render_draw_color(renderer, color.r,color.g,color.b, 255);
				rect := sdl.Rect {x + cast(i32)tx*TSZ, y + cast(i32)ty*TSZ, TSZ, TSZ};
				sdl.render_fill_rect(renderer, &rect);
			}
		}
	}
}

piece_fits :: proc(piece: Piece, cx: u8, cy: u8) -> bool {
	for x : u8 = 0; x < piece.w; x += 1 {
		for y : u8 = 0; y < piece.h; y += 1 {
			bx := x+cx;
			by := y+cy;
			//fmt.println(cy, by, BH);
			if piece.p[x][y] != 0 && ((by >= BH || bx < 0 || bx >= BW) || board[bx][by] != 0) {
				//collision
				return false;
			}
		}
	}
	return true;
}

piece_rotate_ccw :: proc(piece: Piece) -> Piece {
	new := Piece {w = piece.h, h = piece.w};
	for x : u8 = 0; x < piece.w; x += 1 {
		for y : u8 = 0; y < piece.h; y += 1 {
			new.p[x][y] = piece.p[(piece.h-y-1)][x];
		}
	}
	return new;
}

piece_rotate_cw :: proc(piece: Piece) -> Piece {
	new : Piece;
	for i in 1..3 {
		new = piece_rotate_ccw(piece);
	}

	return new;
}

remove_line :: proc(line_y: u8) {
	for x in 0..BW-1 {
		board[x][line_y] = 0;
	}
	
	//now make the above pieces drop
	for y := line_y; y > 0; y -= 1 {
		for x in 0..BW-1 {
			board[x][y] = board[x][y-1];
		}
	}
}

reset_cursor :: proc() {
	cursor_x = rand.uint32(&rand_state)%cast(u32)(BW - piece_queue[0].w) * TSZ;
	cursor_y = 0;
}

tetris_reset :: proc() {
	for _,idx in piece_queue {
		piece_queue[idx] = gen_piece();
	}
	mem.set(&board, 0, BW*BH);
	state = .Game;
	reset_cursor();
}

tetris_main :: proc() -> int {
	if sdl.init(sdl.Init_Flags.Video) != 0 {
		fmt.println("failure initializing sdl: ", sdl.get_error());
		return 1;
	}
	defer sdl.quit();

	rand_state = rand.create(transmute(u64)os.clock_gettime(0).tv_sec);

	window = sdl.create_window("tetris", cast(i32)sdl.Window_Pos.Undefined, cast(i32)sdl.Window_Pos.Undefined, W, H, sdl.Window_Flags.Shown);
	if window == nil {
		fmt.println("failure creating window: ", sdl.get_error());
		return 1;
	}
	defer sdl.destroy_window(window);

	renderer = sdl.create_renderer(window, -1, sdl.Renderer_Flags.Present_VSync);
	if renderer == nil {
		fmt.println("failure creating renderer: ", sdl.get_error());
		return 1;
	}
	sdl.set_render_draw_blend_mode(renderer, sdl.Blend_Mode.Blend);
	defer sdl.destroy_renderer(renderer);

	running = true;
	
	//this timer is used for moving the piece quickly when a button is held long enough
	das_timer := 0;

	tetris_reset();
	
	for running {
		// update the keyboard state
		for st, i in keyboard_state {
			// we shift it to the left to make the previous frame bit be in the second bit, leaving the first bit as is to remain like that or be modified during event handling
			keyboard_state[i] = (st << 1) & 0b11;
			keyboard_state[i] |= st & 0b1; // this is to make the current frame have the same bit as the previous one. this way if a key was pressed the previous frame and not released this one, it remains in the held state
		}

		ev : sdl.Event = ---;
		for sdl.poll_event(&ev) != 0 {
			switch ev.type {
				case .Quit:
					running = false;
				case .Key_Down:
					//set first bit
					keyboard_state[ev.key.keysym.scancode] |= 0b01;
				case .Key_Up:
					//clear first bit
					keyboard_state[ev.key.keysym.scancode] &= 0b10;
			}
		}

		// clear screen
		sdl.set_render_draw_color(renderer, 0,0,21, 255);
		sdl.render_clear(renderer);

		if is_key_pressed(sdl.Scancode.R) {
			tetris_reset();
		}

		// draw grid and board
		for x : i32 = 0; x < BW; x += 1 {
			for y : i32 = 0; y < BH; y += 1 {
				if board[x][y] != 0 {
					color := palette[board[x][y]];
					sdl.set_render_draw_color(renderer, color.r,color.g,color.b, 255);
				} else {
					sdl.set_render_draw_color(renderer, 255,255,255, 64);
				}
				rect := sdl.Rect {x*TSZ, y*TSZ, TSZ, TSZ};
				sdl.render_fill_rect(renderer, &rect);
			}
		}

		switch state {
			case .Game:
				// handle piece movement
				
				if is_key_pressed(sdl.Scancode.Up) {
					rotated := piece_rotate_ccw(piece_queue[0]);
					if piece_fits(rotated, cast(u8)(cursor_x/TSZ), cast(u8)(cursor_y/TSZ)) {
						piece_queue[0] = rotated;
					}
				}

				new_x := cursor_x;
				if is_key_pressed(sdl.Scancode.Left) || is_key_pressed(sdl.Scancode.Right) || is_key_released(sdl.Scancode.Left) || is_key_released(sdl.Scancode.Right) {
					das_timer = 0;
				}
				if is_key_held(sdl.Scancode.Right) {
					das_timer += 1;
					if is_key_pressed(sdl.Scancode.Right) {
						new_x += TSZ;
					} else if das_timer > 10 {
						new_x += TSZ/3;
					}
				}
				if is_key_held(sdl.Scancode.Left) {
					das_timer += 1;
					if is_key_pressed(sdl.Scancode.Left) {
						new_x -= TSZ;
					} else if das_timer > 10 {
						new_x -= TSZ/3;
					}
				}
				
				new_y := cursor_y;
				if is_key_held(sdl.Scancode.Space) { 
					new_y += TSZ;
				} else {
					new_y += TSZ/16;
				};
				
				
				// handle piece collision
				
				cx := cast(u8)(cursor_x/TSZ);
				cy := cast(u8)(cursor_y/TSZ);
				new_cx := cast(u8)(new_x/TSZ);
				new_cy := cast(u8)(new_y/TSZ);

				//fmt.println(cursor_x, cursor_y, new_x, new_y);
				p := piece_queue[0];
				if !piece_fits(p, new_cx, new_cy) {
					//doesnt fit in intended position
					
					if !piece_fits(p, cx, new_cy) {
						//fits horizontally but not vertically: snap to board
						for px : u8 = 0; px < p.w; px += 1 {
							for py : u8 = 0; py < p.h; py += 1 {
								if p.p[px][py] != 0 {
									board[cx+px][cy+py] = p.p[px][py];
								}
							}
						}

						//check for filled lines
						max_y : u8 = BH;
						if cy+p.h < max_y { max_y = cy+p.h; }
						for line_y := cy; line_y < max_y; line_y += 1 {
							filled := true;
							for x in 0..BW-1 {
								if board[x][line_y] == 0 {
									filled = false;
									break;
								}
							}
							
							if filled {
								remove_line(line_y);
							}
						}

						//move queue around
						for i in 0..len(piece_queue)-2 {
							piece_queue[i] = piece_queue[i+1];
						}
						piece_queue[len(piece_queue)-1] = gen_piece();
						reset_cursor();
						if !piece_fits(piece_queue[0], cast(u8)(cursor_x/TSZ), cast(u8)(cursor_y/TSZ)) {
							// game over
							state = State.Over;
							fmt.println("game over");
						}

					} else if piece_fits(p, cx, new_cy) {
						// fits vertically but not horizontally, move down
						cursor_y = new_y;
					}
				} else {
					cursor_x = new_x;
					cursor_y = new_y;
				}
			case .Over:
				;
		}

		// draw pieces
		draw_piece(piece_queue[0], cast(i32)cursor_x/TSZ*TSZ, cast(i32)cursor_y/TSZ*TSZ);

		// draw queue
		qx : i32 = BW*TSZ+TSZ*2;
		qy : i32 = TSZ*2;
		for p in piece_queue {
			draw_piece(p, qx, qy);
			qy += cast(i32)p.h*TSZ+TSZ*2;
		}

		sdl.render_present(renderer);
	}	
	
	fmt.println("goodbye!");
	return 0;
}

main :: proc() {
	os.exit(tetris_main());
}
