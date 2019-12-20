package day4

import "core:fmt"

part1 :: proc(start, end: int) {
    is_valid_password :: proc(pass: string) -> bool {
        if len(pass) != 6 do return false;

        digit_value :: proc(r: rune) -> int {
            return int(r - '0');
        }

        found_double := false;
        prev := rune(0);
        for i in 0..<6 { // avoid `for r in pass` as that does utf8 decoding
            r := rune(pass[i]);
            if !found_double && prev == r do found_double = true;

            if prev != 0 && digit_value(prev) > digit_value(r) do return false;

            prev = r;
        }

        return found_double;
    }

    valids := 0;
    for i in start..end {
        pass := fmt.tprintf("%d", i);

        if is_valid_password(pass) do valids += 1;
    }

    fmt.printf("part1: found %d valid passwords in the range %d-%d\n", valids, start, end);
}

part2 :: proc(start, end: int) {
    is_valid_password :: proc(pass: string) -> bool {
        if len(pass) != 6 do return false;

        digit_value :: proc(r: rune) -> int {
            return int(r - '0');
        }

        found_double := 0;
        double_length := 0;
        prev := rune(0);
        for r in pass {
            if prev == r {
                double_length += 1;
            } else {
                if double_length == 1 do found_double += 1;
                double_length = 0;
            }

            if prev != 0 && digit_value(prev) > digit_value(r) do return false;

            prev = r;
        }

        if double_length == 1 do found_double += 1;

        return found_double > 0;
    }

    valids := 0;
    for i in start..end {
        pass := fmt.tprintf("%d", i);

        if is_valid_password(pass) do valids += 1;
    }

    fmt.printf("part2: found %d valid passwords in the range %d-%d\n", valids, start, end);
}

main :: proc() {
    part1(130254, 678275);
    part2(130254, 678275);
}
