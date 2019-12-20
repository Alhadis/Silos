package main

import "core:fmt"
import "core:math/bits"
import "core:strings"
import "core:strconv"
import "core:time"

input := #load("../input/day03");
//input := "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83\n";
//input := "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7\n";

wire_path: [2]Path;

Coord :: distinct [2]int;

Direction :: enum {
	Left,
	Right,
	Up,
	Down,
};

Instruction :: struct {
	start, end: Coord,
	dir: Direction,
	num: int,
};

Path :: struct {
	vertical: [dynamic]Instruction,
	horizontal: [dynamic]Instruction,
	combined: [dynamic]Instruction,
};

central_port := Coord{1,1};

PROFILING :: false;

parse_path :: proc(path_str: string) -> (path: Path) {
	pos := central_port;
	strings := strings.split(path_str, ",");
	for str in strings {
		num := strconv.parse_int(str[1:]);
		inst: Instruction = ---;
		inst.start = pos;
		switch str[0:1] {
			case "L": pos.x -= num; inst.end = pos; inst.num = num; inst.dir = .Left; append(&path.horizontal, inst);
			case "R": pos.x += num; inst.end = pos; inst.num = num; inst.dir = .Right; append(&path.horizontal, inst);
			case "U": pos.y += num; inst.end = pos; inst.num = num; inst.dir = .Up; append(&path.vertical, inst);
			case "D": pos.y -= num; inst.end = pos; inst.num = num; inst.dir = .Down; append(&path.vertical, inst);
			case: panic("invalid direction");
		}
		append(&path.combined, inst);
	}
	return;
}

main :: proc() {
	lines := strings.split(cast(string)input, "\n");
	assert(len(lines) >= 2);
	wire_path[0] = parse_path(lines[0]);
	wire_path[1] = parse_path(lines[1]);

	intersects :: inline proc(h, v: Instruction) -> (point: Coord, cond: bool) {
		assert(h.start.y == h.end.y);
		assert(v.start.x == v.end.x);
		hy := h.start.y;
		vx := v.start.x;
		point = Coord{vx, hy};
		cond = ((vx >= h.start.x && vx <= h.end.x) || (vx >= h.end.x && vx <= h.start.x)) &&
		       ((hy <= v.start.y && hy >= v.end.y) || (hy <= v.end.y && hy >= v.start.y));
		return;
	}

	check_intersects :: inline proc(h, v: Instruction, distance: uint, intersections: ^[dynamic]Coord) -> uint {
		min_distance := distance;
		if p, ok := intersects(h, v); ok {
			// manhattan distance
			md := cast(uint)(abs(p.x - central_port.x) + abs(p.y - central_port.y));
			if md < min_distance do min_distance = md;

			append(intersections, p);
		}
		return min_distance;
	}

	intersections: [dynamic]Coord;

	// --- Part 1 ---
	min_distance: uint = bits.U32_MAX;
	{
		when PROFILING do SCOPED_TIME("part1");

		for h in wire_path[1].horizontal {
			for v in wire_path[0].vertical {
				min_distance = check_intersects(h, v, min_distance, &intersections);
			}
		}

		for h in wire_path[0].horizontal {
			for v in wire_path[1].vertical {
				min_distance = check_intersects(h, v, min_distance, &intersections);
			}
		}
	}
	fmt.println("day03 part1", min_distance);

	// --- Part 2 ---
	min_steps: uint = bits.U32_MAX;
	{
		when PROFILING do SCOPED_TIME("part2");

		count_steps :: inline proc(path: []Instruction, cross: Coord) -> (steps: uint) {
			loop: for inst in path {
				point := inst.start;
				for i := 0; i < inst.num; i += 1 {
					switch inst.dir {
						case .Left:   point.x -= 1;
						case .Right:  point.x += 1;
						case .Up:     point.y += 1;
						case .Down:   point.y -= 1;
					}
					steps += 1;
					if point == cross {
						break loop;
					}
				}
			}
			return;
		}

		for cross in intersections {
			steps: uint = 0;
			steps += count_steps(wire_path[0].combined[:], cross);
			steps += count_steps(wire_path[1].combined[:], cross);
			if steps < min_steps do min_steps = steps;
		}
	}
	fmt.println("day03 part2", min_steps);
}

when PROFILING {
	begin_time :: proc(desc: string) -> (string, time.Time) {
		return desc, time.now();
	}

	end_time :: proc(desc: string, start_time: time.Time) {
		time_diff := time.diff(start_time, time.now());
		microseconds := time.duration_nanoseconds(time_diff) / 1000;
		fmt.printf("%s: elapsed=%vus\n", desc, microseconds);
	}

	@(deferred_out=end_time)
	SCOPED_TIME :: proc(desc: string) -> (string, time.Time) {
		return begin_time(desc);
	}
}
