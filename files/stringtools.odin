package stringtools

import s "core:strings"
import "core:unicode/utf8"

u8_array_to_string :: proc(ascii: []u8) -> string {
    length := 0;
    for {
        if ascii[length] == 0 {
            break;
        }

        length += 1;
    }

    return string(ascii[0:length]);
}
