package day10

import "core:fmt"
import "core:mem"
import "core:math"
import linalg "core:math/linalg"

when ODIN_OS == "windows" do foreign import libc "system:libcmt.lib";
else do foreign import libc "system:c";

foreign libc {
    atan2 :: proc"c"(y, x: f64) -> f64 ---;
}

part1 :: proc(input: string) {
    parse_input :: proc(input: string) -> ([]bool, int, int) {
        width := 0;
        w_in := input;
        for w_in[0] != '\n' {
            width += 1;
            w_in = w_in[1:];
        }

        result: [dynamic]bool;
        input := input;
        y := 0;
        for input != "" {
            for x in 0..<width {
                append(&result, input[0] == '#' ? true : false);
                input = input[1:];
            }
            if input != "" do input = input[1:];
            y += 1;
        }

        return result[:], width, y;
    };

    m, w, h := parse_input(input);

    best_visible_asteroids := -1;
    best_pos := [2]int{0, 0};

    totals := make([]int, w*h);
    angles: map[f64]f64;

    for y in 0..<h {
        for x in 0..<w {
            if m[x+y*w] == false do continue;

            xx := f64(x);
            yy := f64(y);

            for j in 0..<h {
                for i in 0..<w {
                    if m[i+j*w] == false do continue;
                    if i == x && j == y do continue;

                    ii := f64(i);
                    jj := f64(j);

                    dx := xx - ii;
                    dy := yy - jj;
                    ang := atan2(dy, dx);

                    ang = math.ceil(ang*10000.0) / 10000.0;

                    dist := math.sqrt(dx*dx+dy*dy);
                    if _, ok := angles[ang]; !ok {
                        angles[ang] = dist;
                    } else {
                        if angles[ang] > dist {
                            angles[ang] = dist;
                        }
                    }
                }
            }

            if len(angles) > best_visible_asteroids {
                best_visible_asteroids = len(angles);
                best_pos = {x, y};
            }

            totals[x+y*w] = len(angles);

            clear(&angles);
        }
    }

    if false do for y in 0..<h {
        for x in 0..<w {
            if totals[x+y*w] == 0 do fmt.printf(".");
            else do fmt.printf("%v", totals[x+y*w]);
        }
        fmt.println();
    }

    // (30, 34), 344

    if best_visible_asteroids != -1 {
        fmt.printf("part1: asteroid at (%v, %v) is best suited with %v observable asteroids\n", best_pos.x, best_pos.y, best_visible_asteroids);
    } else {
        fmt.println("part1: didnt find any suitable asteroid wtf?");
    }
}

part2 :: proc(input: string) {

}

main :: proc() {
    part1(input);
    //part2(input);
}

input := `....#.....#.#...##..........#.......#......
.....#...####..##...#......#.........#.....
.#.#...#..........#.....#.##.......#...#..#
.#..#...........#..#..#.#.......####.....#.
##..#.................#...#..........##.##.
#..##.#...#.....##.#..#...#..#..#....#....#
##...#.............#.#..........#...#.....#
#.#..##.#.#..#.#...#.....#.#.............#.
...#..##....#........#.....................
##....###..#.#.......#...#..........#..#..#
....#.#....##...###......#......#...#......
.........#.#.....#..#........#..#..##..#...
....##...#..##...#.....##.#..#....#........
............#....######......##......#...#.
#...........##...#.#......#....#....#......
......#.....#.#....#...##.###.....#...#.#..
..#.....##..........#..........#...........
..#.#..#......#......#.....#...##.......##.
.#..#....##......#.............#...........
..##.#.....#.........#....###.........#..#.
...#....#...#.#.......#...#.#.....#........
...####........#...#....#....#........##..#
.#...........#.................#...#...#..#
#................#......#..#...........#..#
..#.#.......#...........#.#......#.........
....#............#.............#.####.#.#..
.....##....#..#...........###........#...#.
.#.....#...#.#...#..#..........#..#.#......
.#.##...#........#..#...##...#...#...#.#.#.
#.......#...#...###..#....#..#...#.........
.....#...##...#.###.#...##..........##.###.
..#.....#.##..#.....#..#.....#....#....#..#
.....#.....#..............####.#.........#.
..#..#.#..#.....#..........#..#....#....#..
#.....#.#......##.....#...#...#.......#.#..
..##.##...........#..........#.............
...#..##....#...##..##......#........#....#
.....#..........##.#.##..#....##..#........
.#...#...#......#..#.##.....#...#.....##...
...##.#....#...........####.#....#.#....#..
...#....#.#..#.........#.......#..#...##...
...##..............#......#................
........................#....##..#........#`;
