/******************************************************************************
  GrooveStomp's Advent of Code
  Copyright (c) 2019 Aaron Oman (GrooveStomp)

  File: main.odin
  Created: 2019-12-05
  Updated: 2019-12-05
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

read_int :: proc(f: os.Handle) -> (uint, bool) {
    str_buf: strings.Builder;
    ch_buf: [1]u8;

    for {
        n, err := os.read(f, ch_buf[:]);
        if err != os.ERROR_NONE {
            break;
        }

        if n == 0 { // eof
            break;
        }

        if ch_buf[0] == ',' {
            break;
        }

        strings.write_rune(&str_buf, rune(ch_buf[0]));
    }

    str := strings.to_string(str_buf);
    result := strconv.parse_uint(str, 10);
    if result == 0 && (len(str) == 0 || str[0] != u8('0')) {
        return 0, false;
    }

    return result, true;
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

    program: [dynamic]uint;

    // Construct the program.
    for {
        code, success := read_int(f);
        if !success {
            break;
        }
        append(&program, code);
    }

    program[1] = 12;
    program[2] = 2;

    // Execute the program.
    for i := 0; i < len(program) -3; i+=4 {
        op := program[i];
        arg1 := program[i+1];
        arg2 := program[i+2];
        dest := program[i+3];

        switch (op) {
        case 1:
            program[dest] = program[arg1] + program[arg2];
        case 2:
            program[dest] = program[arg1] * program[arg2];
        case 99:
            break;
        case :
            // Normally this is an error condition, but for this program we
            // get the result here.
            fmt.printf("%v\n", program[0]);
            os.exit(1);
        }
    }

    fmt.printf("%v\n", program[0]);
    os.exit(0);
}
