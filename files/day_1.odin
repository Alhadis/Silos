package main;

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"

day_1 :: proc() {
    fmt.println("==== Day 1 ====");

    cal_fuel :: proc(module : int) -> int {
        x := module/3;
        x -= 2;
        return x > 0 ? x : 0;
    }

    data, _ := os.read_entire_file("day_1_puzzle_1.txt");
    values := strings.split(string(data), "\n");

    accum := 0;
    for v, i in values {
        accum += cal_fuel(strconv.atoi(v));
    }

    fmt.printf("Puzzle 1: %v\n", accum);

    accum = 0;
    for v, i in values {
        y := cal_fuel(strconv.atoi(v));
        for y > 0 {
            accum += y;
            y = cal_fuel(y);
        }
    }

    fmt.printf("Puzzle 2: %v\n", accum);


    fmt.println("---- Day 1 Done ----");
}