package json_bug

import "core:fmt"
import "core:encoding/json"

State :: struct {
    num_frames : int,
}

main :: proc() {
    state : State;

    // throws "odin\core\strings\builder.odin(73:35) Invalid slice indices: 1:1:1"
    state_bytes, err := json.marshal(state);

    if err != .None {
        fmt.println(len(state_bytes), "bytes marshalled successfully");
    }
}
