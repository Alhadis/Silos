using import "shared:odin-sdl2/sdl.odin"
using import "core:math.odin"
import "core:fmt.odin"
import "render.odin"

state := Input_State{Key_State.UP, Key_State.UP, Key_State.UP, Key_State.UP, Key_State.UP, Key_State.UP, Key_State.UP, Key_State.UP, Vec2{0, 0}, Vec2{0, 0}};

update_input :: proc() -> bool {
	event : Event;
	for poll_event(&event) != 0 {
		eventType := cast(Event_Type) event.event_type;

		switch eventType {
			case Event_Type.Quit: {
				return false;
			}
			case Event_Type.Key_Down: {
				sc := event.key.keysym.scancode;
				if sc == Scancode.A { 
					if state.A == Key_State.UP {
						state.A = Key_State.DOWN;
					} else {
						state.A = Key_State.HELD;
					} 
				}
				if sc == Scancode.D { 
					if state.D == Key_State.UP {
						state.D = Key_State.DOWN;
					} else {
						state.D = Key_State.HELD;
					} 
				}
				if sc == Scancode.W { 
					if state.W == Key_State.UP {
						state.W = Key_State.DOWN;
					} else {
						state.W = Key_State.HELD;
					} 
				}
				if sc == Scancode.S { 
					if state.S == Key_State.UP {
						state.S = Key_State.DOWN;
					} else {
						state.S = Key_State.HELD;
					} 
				}
				if sc == Scancode.Return {
					if state.ENTER == Key_State.UP {
						state.ENTER = Key_State.DOWN;
					} else {
						state.ENTER = Key_State.HELD;
					} 
				}
				if sc == Scancode.Escape {
					if state.ESCAPE == Key_State.UP {
						state.ESCAPE = Key_State.DOWN;
					} else {
						state.ESCAPE = Key_State.HELD;
					} 
				}
			}
			case Event_Type.Key_Up: {
				sc := event.key.keysym.scancode;
				if sc == Scancode.A {
					state.A = Key_State.UP;
				}
				if sc == Scancode.D {
					state.D = Key_State.UP;
				}
				if sc == Scancode.W {
					state.W = Key_State.UP;
				}
				if sc == Scancode.S {
					state.S = Key_State.UP;
				}
				if sc == Scancode.Return {
					state.ENTER = Key_State.UP;
				}
				if sc == Scancode.Escape {
					state.ESCAPE = Key_State.UP;
				}
			}
			case Event_Type.Mouse_Button_Down: {
				mouseEvent := event.button;
				if cast(Mousecode)mouseEvent.button == Mousecode.Left {
					if state.LEFT_CLICK == Key_State.UP {
						state.LEFT_CLICK = Key_State.DOWN;
					} else {
						state.LEFT_CLICK = Key_State.HELD;
					} 
				}
				if mouseEvent.button == 3 {
					if state.ESCAPE == Key_State.UP {
						state.RIGHT_CLICK = Key_State.DOWN;
					} else {
						state.RIGHT_CLICK = Key_State.HELD;
					} 
				}
			}
			case Event_Type.Mouse_Button_Up: {
				mouseEvent := event.button;
				if cast(Mousecode)mouseEvent.button == Mousecode.Left { 
					state.LEFT_CLICK = Key_State.UP; 
				}
				if mouseEvent.button == 3 { 
					state.RIGHT_CLICK = Key_State.UP;
				}
			}
		}
	}
	x : i32;
	y : i32;
	get_mouse_state(&x, &y);
	state.MOUSE_SCREEN.x = cast(f32) x;
	state.MOUSE_SCREEN.y = cast(f32) y;
	state.MOUSE = state.MOUSE_SCREEN + render.camera;
	
	return true;
}

is_pressed :: proc(code : Key_Code) -> bool {
	using Key_Code;
	using Key_State;
	switch code {
		case W: return state.W == DOWN || state.W == HELD;
		case A: return state.A == DOWN || state.A == HELD;
		case S: return state.S == DOWN || state.S == HELD;
		case D: return state.D == DOWN || state.D == HELD;
		case LEFT_CLICK: return state.LEFT_CLICK == DOWN || state.LEFT_CLICK == HELD;
		case RIGHT_CLICK: return state.RIGHT_CLICK == DOWN || state.RIGHT_CLICK == HELD;
		case ENTER: return state.ENTER == DOWN || state.ENTER == HELD;
		case ESCAPE: return state.ESCAPE == DOWN || state.ESCAPE == HELD;
		case: return false;
	}
}

Key_State :: enum {
	UP,
	DOWN,
	HELD,
}

Key_Code :: enum i32 {
	W = 1,
	A = 2,
	S = 3,
	D = 4,
	LEFT_CLICK = 5,
	RIGHT_CLICK = 6,
	ENTER = 7,
	ESCAPE = 8,
}


Input_State :: struct {
	W, A, S, D, LEFT_CLICK, RIGHT_CLICK, ENTER, ESCAPE : Key_State,
	MOUSE, MOUSE_SCREEN : Vec2
}