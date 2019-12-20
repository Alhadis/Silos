package main

import "core:os"
import "core:fmt"
import "core:builtin"

part1 :: proc(input: []byte) -> (answer: int) {
	required_fuel_for_module :: inline proc(module_mass: int) -> int {
		fuel := builtin.max(0, module_mass/3 - 2);
		return fuel;
	}

	n := 0;
	for c in input {
		switch c {
		case '0'..'9':
			n *= 10;
			n += int(c - '0');
		case '\n':
			answer += required_fuel_for_module(n);
			n = 0;
		}
	}
	return;
}

part2 :: proc(input: []byte) -> (answer: int) {
	required_fuel_for_module :: inline proc(module_mass: int) -> int {
		total_fuel := 0;
		mass := module_mass;
		for {
			fuel := builtin.max(0, mass/3 - 2);
			if fuel == 0 do break;
			total_fuel += fuel;
			mass = fuel;
		}
		return total_fuel;
	}

	n := 0;
	for c in input {
		switch c {
		case '0'..'9':
			n *= 10;
			n += int(c - '0');
		case '\n':
			answer += required_fuel_for_module(n);
			n = 0;
		}
	}
	return;
}

main :: proc() {
	path :: "input/day01";

	input, ok := os.read_entire_file(path);
	defer delete(input);
	if !ok {
		fmt.println("error reading", path);
		return;
	}

	answer1 := part1(input);
	answer2 := part2(input);

	fmt.println("day01", answer1, answer2);
}
