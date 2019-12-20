/*
 *  @Name:     input
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 03-05-2017 17:54:46
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 25-01-2018 00:07:21 UTC+1
 *  
 *  @Description:
 *      Contains constructs related to Input.
 *      A windows key can be bound to a binding which is identified by a string.
 *      Also contains mouse coordinate in window space.
 */
import win32 "core:sys/windows.odin";
import "core:math.odin";

import "shared:libbrew/win/window.odin";

import "shared:odin-xinput/xinput.odin";

ButtonStates :: enum u8 {
    Up,
    Held,
    Down,
    Neutral,
}

Binding :: struct {
    id       : string,
    key      : win32.Key_Code,
    x_button : xinput.Buttons, 
}

Input :: struct {
    any_key_pressed : bool,
    mouse_pos       : math.Vec2,

    bindings        : map[string]Binding,
    key_states      : [256]ButtonStates,
    _old_key_states : [256]ButtonStates,
    x_state         : [4]xinput.GamepadState,
    _old_x_state    : [4]xinput.GamepadState,
    char_queue      : [dynamic]rune,
}

update :: proc(input : ^Input) {
    input.any_key_pressed = false;
    clear_char_queue(input);
    update_keyboard(input);
    update_xinput(input);
}

update_mouse_position :: proc(input : ^Input, handle : window.WndHandle) {
    x, y := window.get_mouse_pos(handle);
    input.mouse_pos[0] = f32(x);
    input.mouse_pos[1] = f32(y); 
}

update_keyboard :: proc(input : ^Input) {
    for k in win32.Key_Code {
        if win32.get_key_state(i32(k)) < 0 {
            if input._old_key_states[k] == ButtonStates.Down || 
               input._old_key_states[k] == ButtonStates.Held {
                input.key_states[k] = ButtonStates.Held;
            } else {
                input.key_states[k] = ButtonStates.Down;
            }

            input.any_key_pressed = true;
        } else {
            if input._old_key_states[k] == ButtonStates.Down || 
               input._old_key_states[k] == ButtonStates.Held {

                input.key_states[k] = ButtonStates.Up;
            } else {
                input.key_states[k] = ButtonStates.Neutral;
            }
        }
    }

    input._old_key_states = input.key_states;
}

update_xinput :: proc(input : ^Input) {
    IsButtonPressed :: proc(state : xinput.State, b : xinput.Buttons) -> bool {
        return state.gamepad.buttons & u16(b) == u16(b);
    }
}

set_input_neutral :: proc(input : ^Input) {
    for k in win32.Key_Code { //@TODO(Hoej): should probably do a memset here instead;
       input.key_states[k] = ButtonStates.Neutral;
       input._old_key_states[k] = ButtonStates.Neutral;
    }
}

add_binding :: proc[add_binding_keybord, add_binding_gamepad];

add_binding_keybord :: proc(input : ^Input, name : string, key : win32.Key_Code) {
    _, ok := input.bindings[name];
    if ok {
        input.bindings[name].key = key;
    } else {
        new : Binding;
        new.id = name;
        new.key = key;
        new.x_button = xinput.Buttons.Invalid;
        input.bindings[name] = new;
    }
}

add_binding_gamepad :: proc(input : ^Input, name : string, xKey : xinput.Buttons) {
        _, ok := input.bindings[name];
    if ok {
        input.bindings[name].x_button = xKey;
    } else {
        new : Binding;
        new.id = name;
        new.key = win32.Key_Code.Noname;
        new.x_button = xKey;
        input.bindings[name] = new;
    }
}

is_button_down :: proc(input : ^Input, name : string) -> bool {
    return get_button_state(input, name) == ButtonStates.Down;
}

is_button_up :: proc(input : ^Input, name : string) -> bool {
    return get_button_state(input, name) == ButtonStates.Up;
}

is_button_held :: proc(input : ^Input, name : string) -> bool {
    return get_button_state(input, name) == ButtonStates.Held;
}

get_button_state :: proc(input : ^Input, name : string) -> ButtonStates {
    if key, ok := input.bindings[name]; ok {
        return input.key_states[i32(key.key)];
    }

    return ButtonStates.Neutral;
}

add_char_to_queue :: proc(input : ^Input, char : rune) {
    append(&input.char_queue, char);
}

clear_char_queue :: proc(input : ^Input) {
    clear(&input.char_queue);
}