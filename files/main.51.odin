package benchmark

import "core:os"
import "core:mem"
import "core:fmt"
import "core:time"

import regex ".."

benchmark :: proc() {
	input, _ := os.read_entire_file("input-text.txt");
	//re := compile("[a-zA-Z]+");
	re := regex.compile("([.a-zA-Z0-9]+)@[a-zA-Z0-9]+\\.([.a-zA-Z0-9]+)");

	//arena: mem.Arena;
	//mem.init_arena_from_context(&arena, 1024*1024*1024);
	//context.allocator = mem.arena_allocator(&arena);

	t1 := time.now();
	cap, ok := regex.match_all(re, cast(string) input);
	t2 := time.now();
	fmt.printf("Match took: %v\n", time.duration_seconds(time.diff(t1, t2)));

	fmt.printf("\ncap(%v): %#v\nmatched: %v\n", len(cap), cap, ok);
	if ok {
		fmt.printf("\nlast capture: %v\n", cap[len(cap)-1]);
	}

	sum_length := 0;
	for c in cap {
		for s in c {
			sum_length += len(s);
			//fmt.printf("%v\n", s);
		}
	}
	fmt.printf("total characters: %v\n", sum_length);
}

syntax_benchmark :: proc() {
	input, _ := os.read_entire_file("regex.odin");
	keywords := regex.compile("(proc|int)");
	// procnt <- Well this aint right

	t1 := time.now();
	cap, ok := regex.match_all(keywords, cast(string) input);
	t2 := time.now();

	fmt.printf("Match took: %v\n", time.duration_seconds(time.diff(t1, t2)));
	fmt.printf("\ncap(%v): %#v\nmatched: %v\n", len(cap), cap, ok);
}

main :: proc() {
	benchmark();
	// syntax_benchmark();
}