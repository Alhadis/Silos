/******************************************************************************
  GrooveStomp's Advent of Code
  Copyright (c) 2019 Aaron Oman (GrooveStomp)

  File: main.odin
  Created: 2019-12-03
  Updated: 2019-12-04
  Author: Aaron Oman (GrooveStomp)

  Notice: CC BY 4.0 License

  This program comes with ABSOLUTELY NO WARRANTY.
  This is free software, and you are welcome to redistribute it under certain
  conditions; See https://creativecommons.org/licenses/by/4.0/ for details.
 ******************************************************************************/
package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"
import "core:math"

read_string :: proc(f: os.Handle) -> (string, bool) {
    str: strings.Builder;
    buf: [1]u8;

    for {
        bytes_read, err := os.read(f, buf[:]);
        if err != os.ERROR_NONE {
            return strings.to_string(str), false;
        }

        if bytes_read == 0 {
            return strings.to_string(str), false;
        }

        if buf[0] == ' ' || buf[0] == '\n' {
            return strings.to_string(str), true;
        }

        strings.write_rune(&str, rune(buf[0]));
    }

    return strings.to_string(str), true;
}

main :: proc() {
    if len(os.args) != 2 {
        fmt.println("Wrong number of arguments");
        os.exit(1);
    }

    f, err := os.open(os.args[1]);
    if err != 0 {
        fmt.printf("Couldn't open %v\n", os.args[1]);
        os.exit(1);
    }
    defer os.close(f);

    sum: u64 = 0;

    for {
        str, success := read_string(f);
        if !success {
            break;
        }

        mass := strconv.parse_f32(str);
        sum += u64(math.floor_f32(mass / 3.0)) - 2;
    }

    fmt.println(sum);
    os.exit(0);
}
