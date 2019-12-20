package main

import "core:fmt"
import "core:strings"
import "core:strconv"

clone_dynamic_array :: proc(x: $T/[dynamic]$E) -> T {
	res := make(T, len(x));
	copy(res[:], x[:]);
	return res;
}

run_program :: proc(program: [dynamic]int, noun, verb: int) -> (res: int, ok: bool) {
	prg := clone_dynamic_array(program);
	defer delete(prg);

	prg[1] = noun;
	prg[2] = verb;

	// NOTE: assuming well-formed program.
	loop: for i := 0; i < len(prg); i += 4 {
		switch prg[i] {
			case 1: // opcode add
				arg1, arg2 := prg[i+1], prg[i+2];
				dst := prg[i+3];
				prg[dst] = prg[arg1] + prg[arg2];
			case 2: // opcode mul
				arg1, arg2 := prg[i+1], prg[i+2];
				dst := prg[i+3];
				prg[dst] = prg[arg1] * prg[arg2];
			case 99: // opcode halt
				ok = true;
				res = prg[0];
				break loop;
			case: // invalid opcode
				break loop;
		}
	}

	return;
}

part1 :: proc(program: [dynamic]int) -> (answer: int) {
	res, ok := run_program(program, 12, 2);
	if !ok do panic("invalid opcode");
	return res;
}

part2 :: proc(program: [dynamic]int) -> (answer: int) {
	for noun in 0..99 {
		for verb in 0..99 {
			res, ok := run_program(program, noun, verb);
			if !ok do panic("invalid opcode");

			if res == 19690720 {
				answer = 100 * noun + verb;
				return;
			}
		}
	}

	panic("failed to find answer");
	return;
}

main :: proc() {
	input := #load("../input/day02");

	program := make([dynamic]int);
	defer delete(program);

	numbers := strings.split(cast(string)input, ",");
	for v in numbers {
		append(&program, strconv.parse_int(v));
	}

	answer1 := part1(program);
	answer2 := part2(program);

	fmt.println("day02", answer1, answer2);
}
