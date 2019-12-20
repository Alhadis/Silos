package regex

import "core:fmt"
import "core:strings"
import "core:unicode/utf8"

//TODO
/*
- To support Or properly do the characater buffer and flush thing we did earlier
  Flush on Star, etc.
- BUGS:
	{
		// Here the last match get clobbered because we edit the captures buffer
		// while testing for one final match. Use a temp buffer or something to
		// avoid this
		re := compile("([abc])+");
		fmt.printf("\ncap: %#v\nmatched: %v\n", match(re, "abca"));
	}
	{
		// This provides some weird results
		re := compile("(test|lol)+");
		fmt.printf("\ncap: %#v\nmatched: %v\n", match_all(re, "This is a test to see if low key this captures, lol."));
	}
- Compile errors, enum error propagating from the parser up to compile()
- Better instruction format, we dont need 256 different bytecodes, and can use some of that data
- Improve string matching
    boyer-moore string matching - https://www.cs.utexas.edu/users/moore/publications/fstrpos.pdf
    https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm
*/


/*

64 different bytecodes, takes up 6 bits
Which leaves us with 26 bits

1. 13 + 13 bits, 8192 values
2. 8 + 8 + 8

*/

Regex :: struct {
	pattern: string,
	code: [dynamic]Bytecode,
	captures: int,
}

free_regex :: proc(r: ^Regex) {
	delete(r.pattern);
	delete(r.code);
	free(r);
}

compile :: proc(pattern: string) -> ^Regex {
	if pattern == "" do return nil;

	nodes := parse_pattern(pattern);
	for n in nodes {
		fmt.printf("%#v\n", n.variant);
		switch t in n.variant {
		case NodeStar:
			fmt.printf("match: %#v\n", t.match^);
		}
	}

	regex := new(Regex);
	regex.pattern = strings.clone(pattern); // We grab a copy here
	regex.captures = 1; // The first capture is always the full match

	append(&regex.code, Bytecode.Start_Capture);
	append(&regex.code, Bytecode(0));
	for n in nodes {
		gen_node(regex, n);
	}
	append(&regex.code, Bytecode.End_Capture);
	append(&regex.code, Bytecode.End);
	append(&regex.code, Bytecode(0));

	fmt.printf("%#v\n", regex.code);

	return regex;
}

match :: proc(regex: ^Regex, input: string) -> ([]string, bool) {
	captures := make([]string, regex.captures);
	out, ok := match_vm(regex, 0, input, &captures);
	return captures[:], ok;
}

match_all :: proc(regex: ^Regex, input: string) -> ([][]string, bool) {
	results: [dynamic][]string;
    input := input;

	for {
		captures := make([]string, regex.captures);
		out, ok := match_vm(regex, 0, input, &captures);
		if !ok {
			if input == "" do break;
			_, l := utf8.decode_rune_in_string(input);
			input = input[l:];
			continue;
		}
		input = out;
		append(&results, captures);
	}

	if len(results) > 0 {
		return results[:], true;
	} else {
		return results[:], false;
	}
}

import "core:time"
import "core:timer"
main :: proc() {
	//re := compile("(c|aa)*b");
	//fmt.printf("\ncap: %#v\nmatched: %v\n", match(re, "aacaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"));

    if true {
        re := compile("<x=([0-9-][0-9]*),[ ]*y=([0-9-][0-9]*),[ ]*z=([0-9-][0-9]*)>");
        fmt.printf("\ncap: %#v\nmatched: %v\n", match_all(re, `<x=-1, y=0, z=2>
<x=2, y=-10, z=-7>
<x=4, y=-8, z=8>
<x=3, y=5, z=-1>`));
    }

	if false {
		re := compile("(test|lol)+");
		fmt.printf("\ncap: %#v\nmatched: %v\n", match_all(re, "This is a test to see if low key this captures, lol."));
	}

	if false {
		re := compile("#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)");
		fmt.printf("\ncap: %#v\nmatched: %v\n", match(re, "#1 @ 1,3: 4x4"));
		fmt.printf("\ncap: %#v\nmatched: %v\n", match(re, "#1 @ 1:3: 4x4"));
		fmt.printf("\ncap: %#v\nmatched: %v\n", match(re, "#1 @ 1-3: 4x4"));
	}

	if false {
		t1 := time.now();
		re := compile("#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)");
		input := "#1 @ 1,3: 4x4 #2 @ 3,1: 4x4 #3 @ 5,5: 2x2";

		fmt.printf("\nMatching: '%s'\n", input);
		cap, ok := match_all(re, input);
		//fmt.printf("cap: %#v\nmatched: %v\n", cap, ok);
		for c in cap {
			fmt.printf("Entry %v: x: %v, y: %v, w: %v, h: %v\n", c[1], c[2], c[3], c[4], c[5]);
		}
		t2 := time.now();
		fmt.printf("took: %vs\n", time.duration_seconds(time.diff(t1, t2)));
	}
}