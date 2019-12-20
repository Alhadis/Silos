/******************************************************************************
  GrooveStomp's Advent of Code
  Copyright (c) 2019 Aaron Oman (GrooveStomp)

  File: main.odin
  Created: 2019-12-08
  Updated: 2019-12-10
  Author: Aaron Oman (GrooveStomp)

  Notice: CC BY 4.0 License

  This program comes with ABSOLUTELY NO WARRANTY.
  This is free software, and you are welcome to redistribute it under certain
  conditions; See https://creativecommons.org/licenses/by/4.0/ for details.
 ******************************************************************************/
package main

import "core:fmt"
import "core:os"
import "core:sort"

collision :: proc(s1, s2: Segment) -> (Point, bool) {
    if is_vertical(s1) && is_vertical(s2) {
        return Point{}, false;
    }

    if is_horizontal(s1) && is_horizontal(s2) {
        return Point{}, false;
    }

    hz: Segment;
    vt: Segment;

    if is_vertical(s1) {
        vt = s1;
        hz = s2;
    } else {
        vt = s2;
        hz = s1;
    }

    min_x := min(hz.points[0].x, hz.points[1].x);
    max_x := max(hz.points[0].x, hz.points[1].x);
    min_y := min(vt.points[0].y, vt.points[1].y);
    max_y := max(vt.points[0].y, vt.points[1].y);

    if vt.points[0].x < min_x || vt.points[0].x > max_x ||
        hz.points[0].y < min_y || hz.points[0].y > max_y {
            return Point{}, false;
        }

    collision := Point{vt.points[0].x, hz.points[0].y};

    if equal_point(collision, hz.points[0]) ||
        equal_point(collision, hz.points[1]) ||
        equal_point(collision, vt.points[0]) ||
        equal_point(collision, vt.points[1]) {
            return Point{}, false;
        }

    return collision, true;
}

find_collisions :: proc(g1, g2: Grid) -> [dynamic]Point {
    collisions: [dynamic]Point;

    for s1 in g1.segments {
        for s2 in g2.segments {
            collision, happened := collision(s1, s2);

            if happened {
                append(&collisions, collision);
            }
        }
    }

    return collisions;
}

read_grids :: proc(f: os.Handle) -> [dynamic]^Grid {
    grids: [dynamic]^Grid;

    for {
        grid := new_grid(f);
        if len(grid.segments) == 0 {
            break;
        }

        append(&grids, grid);
    }

    return grids;
}

sort_collisions :: proc(p1, p2: Point) -> int {
    return manhattan_distance(p1) - manhattan_distance(p2);
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

    grids := read_grids(f);
    collisions := find_collisions(grids[0]^, grids[1]^);

    // NOTE: There is a bug in the LLVM IR right now that prevents compiling the
    // sort func.
    my_min := 999;
    for point in collisions {
        dist := manhattan_distance(point);
        if dist < my_min {
            my_min = dist;
        }
    }

    fmt.printf("%v\n", my_min);

    /* sort.quick_sort_proc(collisions[:], sort_collisions); */
    /* fmt.printf("%+v\n", manhattan_distance(collisions[0])); */

    for g in grids {
        free(g);
    }

    os.exit(0);
}
