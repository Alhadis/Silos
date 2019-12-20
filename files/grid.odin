/******************************************************************************
  GrooveStomp's Advent of Code
  Copyright (c) 2019 Aaron Oman (GrooveStomp)

  File: grid.odin
  Created: 2019-12-09
  Updated: 2019-12-09
  Author: Aaron Oman (GrooveStomp)

  Notice: CC BY 4.0 License

  This program comes with ABSOLUTELY NO WARRANTY.
  This is free software, and you are welcome to redistribute it under certain
  conditions; See https://creativecommons.org/licenses/by/4.0/ for details.
 ******************************************************************************/
package main

import "core:os"
import "core:strings"
import "core:fmt"

Grid :: struct {
    segments: [dynamic]Segment,
}

new_grid :: proc(f: os.Handle) -> ^Grid {
    cursor := Point{};
    grid := new(Grid);

    str: strings.Builder;
    ch_buf: [1]u8;

    for {
        n, err := os.read(f, ch_buf[:]);

        if err != os.ERROR_NONE || n == 0 || ch_buf[0] == '\n' || ch_buf[0] == ',' {
            segment, succeeded := new_segment(cursor, strings.to_string(str));
            if !succeeded {
                break;
            }

            cursor = segment.points[1];
            append(&grid.segments, segment^);
            free(segment);
            strings.reset_builder(&str);

            if ch_buf[0] == ',' {
                continue;
            }

            break;
        }

        strings.write_rune(&str, rune(ch_buf[0]));
    }

    return grid;
}
