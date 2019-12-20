package main

import "core:fmt"
import "core:os"
import "core:mem"
import "core:strings"
import "core:strconv"

main :: proc() {
  defer free_all();

  test();

  data, ok := os.read_entire_file("./input.txt");
  assert(ok);

  min_pt, min_dist := find_min_pt(string(data));
  fmt.println("min distance: ", min_dist, min_pt);
}

test :: proc() {
  pt1, d1 := find_min_pt("R8,U5,L5,D3\nU7,R6,D4,L4");
  fmt.println("want 30: ", d1, pt1);
  assert(d1 == 30);

  pt2, d2 := find_min_pt("R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83");
  fmt.println("want 610: ", d2, pt2);
  assert(d2 == 610);

  pt3, d3 := find_min_pt("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7");
  fmt.println("want 410: ", d3, pt3);
  assert(d3 == 410);
}

Line :: struct {
  pts: [2]Point,
  steps: int,
}

Point :: struct {
  x: int,
  y: int,
}

/*
manhattan_distance :: proc(pt: Point) -> int {
  return abs(pt.x) + abs(pt.y);
}
*/

find_min_pt :: proc(data: string) -> (Point, int) {
  lines := strings.split(string(data), "\n");
  line_lines: [2][dynamic]Line;
  for line, i in lines {
    if len(line) == 0 do continue;
    if i >= len(line_lines) do break;

    pt := Point{0, 0};
    total_steps := 0;
    ops := strings.split(line, ",");
    for op in ops {
      start := pt;
      new_pt, steps := compute_coord(pt, op);
      total_steps += steps;
      pt = new_pt;
      append(&line_lines[i], Line{pts = {start, pt}, steps = total_steps});
    }
  }

  //min_dist: int;
  min_steps: int;
  min_pt: Point;
  for l1 in line_lines[0] {
    for l2 in line_lines[1] {
      steps := 0;
      pt, ok := lines_intersect(l1, l2);
      if ok {
        ok1, diff1 := point_on_segment(l1, pt);
        ok2, diff2 := point_on_segment(l2, pt);
        ok = ok1 && ok2;
        if ok {
          //fmt.println("intersect: ", l1, l2, pt, diff1, diff2);
          steps = l1.steps + l2.steps - diff1 - diff2;
        }
      }

      if ok && (steps < min_steps || min_steps == 0) {
        min_steps = steps;
        min_pt = pt;
        fmt.println(min_steps, pt);
      }
    }
  }
  return min_pt, min_steps;
}

// returns the new Point coordinate along with the steps added by this op.
compute_coord :: proc(pt: Point, op: string) -> (Point, int) {
  assert(len(op) > 1);

  pt := pt;
  delta := strconv.parse_int(op[1:]);
  switch op[0] {
    case 'U':
      pt.y += delta;
    case 'D':
      pt.y -= delta;
    case 'R':
      pt.x += delta;
    case 'L': 
      pt.x -= delta;
    case: 
      panic(op);
  }
  return pt, delta;
}

lines_intersect :: proc(l1, l2: Line) -> (Point, bool) {
  a1 := l1.pts[1].y - l1.pts[0].y;
  b1 := l1.pts[0].x - l1.pts[1].x;
  c1 := (a1 * l1.pts[0].x) + (b1 * l1.pts[0].y);

  a2 := l2.pts[1].y - l2.pts[0].y;
  b2 := l2.pts[0].x - l2.pts[1].x;
  c2 := (a2 * l2.pts[0].x) + (b2 * l2.pts[0].y);
  delta := (a1 * b2) - (a2 * b1);

  if delta == 0 do return Point{}, false;

  pt := Point{
    x = ((b2 * c1) - (b1 * c2)) / delta,
    y = ((a1 * c2) - (a2 * c1)) / delta,
  };

  // ignore origin point 
  if pt.x == 0 && pt.y == 0 do return Point{}, false;

  return pt, true;
}

point_on_segment :: proc(l: Line, pt: Point) -> (bool, int) {
  dxl := l.pts[1].x - l.pts[0].x;
  dyl := l.pts[1].y - l.pts[0].y;

  if abs(dxl) >= abs(dyl) {
    if dxl > 0 {
      return l.pts[0].x <= pt.x && pt.x <= l.pts[1].x, l.pts[1].x - pt.x;
    } else {
      return l.pts[1].x <= pt.x && pt.x <= l.pts[0].x, abs(l.pts[1].x - pt.x);
    }
  } else {
    if dyl > 0 {
      return l.pts[0].y <= pt.y && pt.y <= l.pts[1].y, l.pts[1].y - pt.y;
    } else {
      return l.pts[1].y <= pt.y && pt.y <= l.pts[0].y, abs(l.pts[1].y - pt.y);
    }
  }
}
