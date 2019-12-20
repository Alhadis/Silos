/******************************************************************************
  GrooveStomp's Advent of Code
  Copyright (c) 2019 Aaron Oman (GrooveStomp)

  File: segment.odin
  Created: 2019-12-09
  Updated: 2019-12-09
  Author: Aaron Oman (GrooveStomp)

  Notice: CC BY 4.0 License

  This program comes with ABSOLUTELY NO WARRANTY.
  This is free software, and you are welcome to redistribute it under certain
  conditions; See https://creativecommons.org/licenses/by/4.0/ for details.
 ******************************************************************************/
package main

import "core:strconv"
import "core:fmt"

Segment :: struct {
    points: [2]Point,
}

new_segment :: proc(p: Point, str: string) -> (^Segment, bool) {
    if str == "" {
        return nil, false;
    }

    magnitude := strconv.parse_int(str[1:]);
    if magnitude == 0 && (len(str) == 0 || str[0] != u8('0')) {
        fmt.eprintf("magnitude is unparsable\n");
        return nil, false;
    }

    segment := new(Segment);
    segment.points[0] = p;

    switch str[0] {
	  case 'U':
		    segment.points[1] = Point{p.x, p.y + magnitude};
	  case 'D':
		    segment.points[1] = Point{p.x, p.y - magnitude};
	  case 'L':
		    segment.points[1] = Point{p.x - magnitude, p.y};
	  case 'R':
		    segment.points[1] = Point{p.x + magnitude, p.y};
	  case :
        fmt.eprintf("unknown direction\n");
		    return nil, false;
    }

    return segment, true;
}

is_vertical :: proc(using s: Segment) -> bool {
    return points[0].x == points[1].x;
}

is_horizontal :: proc(using s: Segment) -> bool {
    return points[0].y == points[1].y;
}
