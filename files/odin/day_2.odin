package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"

OPCODE_ADD  :: 1;
OPCODE_MUL  :: 2;
OPCODE_HALT :: 99;

day_2 :: proc() {
    fmt.println("==== Day 2 ====");

    data, _ := os.read_entire_file("day_2_puzzle_1.txt");
    values := strings.split(string(data), ",");

    code := make([]int, len(values));
    for x, i in values {
        code[i] = strconv.parse_int(x);
    }

    code[1] = 12;
    code[2] = 2;

    Intcode_run(code);

    fmt.printf("Puzzle 1: %v\n", code[0]);

    DESIRED_OUTPUT :: 19690720;

    verb : int;
    noun : int;

    loop: for {
        for i in 0..99 {
            for j in 0..99 {
                for x, i in values {
                    code[i] = strconv.parse_int(x);
                }

                code[1], noun = i, i;
                code[2], verb = j, j;

                Intcode_run(code);

                if code[0] == DESIRED_OUTPUT do break loop;
            }
        }
    }

    fmt.printf("Puzzle 2: %v\n", 100 * noun + verb);

    fmt.println("---- Day 2 Done ----");
}

Intcode_run :: proc(code : []int) {
    index := 0;
    opcode := -1;

    for opcode != OPCODE_HALT {
        opcode = code[index];
        switch opcode {
            case OPCODE_ADD:
                addr1 := code[index+1];
                addr2 := code[index+2];
                output := code[index+3];

                val1 := code[addr1];
                val2 := code[addr2];

                code[output] = val1 + val2;

            case OPCODE_MUL:
                addr1 := code[index+1];
                addr2 := code[index+2];
                output := code[index+3];

                val1 := code[addr1];
                val2 := code[addr2];

                code[output] = val1 * val2;

            case OPCODE_HALT: break;
            case: fmt.println("ERROR", opcode, index);
        }
        index += 4;
    }
}