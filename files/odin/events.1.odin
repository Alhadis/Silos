Text_Event   :: struct { codepoint: rune }
Scroll_Event :: struct { dx, dy: f64     }

Key_Event :: struct {
    key, scancode, action, mods: i32,
}

Event :: union {
    Text_Event,
    Scroll_Event,
    Key_Event,
}

