package maze

import "core:strings"
import "core:strconv"

// Takes in a string, cleaning it
clean :: proc(input: string) -> string {
    output := cast(strings.Builder)strings.make_builder();

    for i in 0..< len(input) {
        char := cast(rune)input[i];

        if (strings.contains_rune("\r\n \t(", char) == -1) {
            strings.write_rune(&output, char);
        }
    }

    str_output := strings.to_string(output);
    return str_output;
}

// Converts a dynamic string array to a points array
to_point :: proc(str_arr: []string) -> []Point {
    points := make([]Point, len(str_arr));

    for i in 0..<len(str_arr) {
        temp_str := str_arr[i];
        split_str := strings.split(temp_str, ",");

        x := cast(u32)strconv.parse_int(split_str[0]);
        y := cast(u32)strconv.parse_int(split_str[1]);

        points[i] = Point{x, y};
    }

    return points[:];
}