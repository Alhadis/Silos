package regex

import "core:fmt"
import "core:strings"
import "core:unicode/utf8"

Bytecode :: enum u8 {
	End,
	Char,
	Any,
	Star,
	Plus,
	AnyOf,
	Or,
	Start_Capture,
	End_Capture,
}

Node :: struct {
	variant: union {
		NodeEOL,
		NodeBOL,
		NodeChar,
		NodeStar,
		NodePlus,
		NodeCapture,
		NodeAnyOf,
		NodeAny,
		NodeOr,
		NodeSequence,
	}
}

NodeEOL :: struct {
	using base: ^Node,
}
NodeBOL :: struct {
	using base: ^Node,
}
NodeAny :: struct {
	using base: ^Node,
}

NodeChar :: struct {
	using base: ^Node,
	r: rune,
}

NodeSequence :: struct {
	using base: ^Node,
	prev: ^Node,
	next: ^Node,
}

NodeString :: struct {
	using base: ^Node,
	str: string,
}

NodeStar :: struct {
	using base: ^Node,
	greedy: bool,
	match: ^Node,
}

NodePlus :: struct {
	using base: ^Node,
	greedy: bool,
	match: ^Node,
}

NodeCapture :: struct {
	using base: ^Node,
	nodes: []^Node,
}

Range :: struct {
	start: rune,
	end: rune,
}

NodeAnyOf :: struct {
	using base: ^Node,
	chars: []rune,
	ranges: []Range,
}

NodeOr :: struct {
	using base: ^Node,
	left: ^Node,
	right: ^Node,
}

new_node :: proc($T: typeid) -> ^T {
	n := new(Node);
	n.variant = T{base = n};
	return &n.variant.(T);
}

Parser :: struct {
	pattern: string,
	current_rune_offset: int,
	offset: int,
	current_rune: rune,
	nodes: [dynamic]^Node,
	character_buffer: [dynamic]u8,
}

next_rune :: proc(parser: ^Parser) -> rune {
	r, length := utf8.decode_rune(transmute([]u8) parser.pattern[parser.offset:]);
	parser.offset += length;
	parser.current_rune = r;

	return r;
}

/*
add_to_character_buffer :: proc(parser: ^Parser, r: rune) {
	b, _ := utf8.encode_rune(r);
	for v in b {
		append(&parser.character_buffer, v);
	}
}

flush_character_buffer :: proc(using parser: ^Parser) {
	if len(character_buffer) == 0 do return;
	defer clear(&character_buffer);

	if len(character_buffer) > 1 {
		n := new_node(NodeString);
		n.str = strings.new_string(string(character_buffer[:]));
		return n;
	} else {
		n := new_node(NodeChar);
		r, _ := utf8.decode_rune(character_buffer);
		n.r = r;
		return n;
	}
}
*/

/*
parse_basic :: proc(parser: ^Parser) -> ^Node {
	for {
		switch paser.current_rune {
		case '\\':
			next_rune(parser);
			//TODO: Switch to see if we have some special escape chars like '\n' etc.
			add_to_character_buffer(parser);
			next_rune(parser);
		case '[':
			if n := flush_character_buffer(); n != nil {
				return n;
			}
			next_rune(parser);

			chars: [dynamic]rune;
			ranges: [dynamic]Range;
			for parser.current_rune != ']' {
				//TODO: ^ not any
				first := parser.current_rune;
				next_rune(parser);

				if parser.current_rune == '-' {
					//TODO: Make sure this is safe
					next_rune(parser); // eat '-'

					//TODO: If the next character is ']' just add the '-', also check for eol perhaps?

					append(&ranges, Range{first, parser.current_rune});
					next_rune(parser); // eat end
				} else {
					append(&chars, first);
				}
			}
			next_rune(parser); // eat ']'

			n := new_node(NodeAnyOf);
			n.chars = chars[:];
			n.ranges = ranges[:];
			return n;
		case '.':
			if n := flush_character_buffer(); n != nil {
				return n;
			}
			next_rune(parser);
			return new_node(NodeAny);
		case '(':
			if n := flush_character_buffer(); n != nil {
				return n;
			}
			next_rune(parser);
			
			cap_nodes: [dynamic]^Node;
			for parser.current_rune != ')' {
				append(&cap_nodes, parse_node(parser));

				if parser.current_rune == utf8.RUNE_ERROR {
					panic("unexpcted eol");
				}
			}
			next_rune(parser); // Eat ')'

			n := new_node(NodeCapture);
			n.nodes = cap_nodes[:];
			return n;
		case '+', '*':
			n := flush_character_buffer(parser);
			//TODO: Error
			assert(n != nil);
			return n;
		case:
			//n := new_node(NodeChar);
			//n.r = parser.current_rune;
			add_to_character_buffer(parser);
			next_rune(parser);
		}
	}
}*/

parse_basic :: proc(parser: ^Parser) -> ^Node {
	switch parser.current_rune {
	case '\\':
		//TODO: Switch to see if we have some special escape chars like '\n' etc.
		next_rune(parser);
		n := new_node(NodeChar);
		n.r = parser.current_rune;
		next_rune(parser);
		return n;
	case '[':
		next_rune(parser);

		chars: [dynamic]rune;
		ranges: [dynamic]Range;
		for parser.current_rune != ']' {
			//TODO: '^' not any
			first := parser.current_rune;
			next_rune(parser);

			if parser.current_rune == '-' {
				//TODO: Make sure this is safe
				next_rune(parser); // eat '-'

				//TODO: If the next character is ']' just add the '-', also check for eol perhaps?

				append(&ranges, Range{first, parser.current_rune});
				next_rune(parser); // eat end
			} else {
				append(&chars, first);
			}
		}
		next_rune(parser); // eat ']'

		n := new_node(NodeAnyOf);
		n.chars = chars[:];
		n.ranges = ranges[:];
		return n;
	case '.':
		next_rune(parser);
		return new_node(NodeAny);
	case '(':
		next_rune(parser);
		
		cap_nodes: [dynamic]^Node;
		for parser.current_rune != ')' {
			append(&cap_nodes, parse_node(parser));

			if parser.current_rune == utf8.RUNE_ERROR {
				panic("unexpcted eol");
			}
		}
		next_rune(parser); // Eat ')'

		n := new_node(NodeCapture);
		n.nodes = cap_nodes[:];
		return n;
	case:
		n := new_node(NodeChar);
		n.r = parser.current_rune;
		next_rune(parser);
		return n;
	}
}

parse_star :: proc(parser: ^Parser) -> ^Node {
	lhs := parse_basic(parser);

	op := parser.current_rune;
	if op == '*' || op == '+' {
		//TODO: Handle '?' for non-greedy version
		next_rune(parser);

		switch op {
		case '+':
			n := new_node(NodePlus);
			n.greedy = false;
			n.match = lhs;
			lhs = n;
		case '*':
			n := new_node(NodeStar);
			n.greedy = false;
			n.match = lhs;
			lhs = n;
		case: panic("Invalid");	
		}
	}

	return lhs;
}

parse_sequence :: proc(parser: ^Parser) -> ^Node {
	lhs: ^Node = nil;

	for parser.current_rune != utf8.RUNE_ERROR && parser.current_rune != ')' && parser.current_rune != '|' {
		st := parse_star(parser);
		seq := new_node(NodeSequence);
		seq.prev = lhs;
		seq.next = st;
		lhs = seq;
	}


	assert(lhs != nil);
	return lhs;
}

parse_or :: proc(parser: ^Parser) -> ^Node {
	lhs := parse_sequence(parser);

	if parser.current_rune == '|' {
		next_rune(parser);

		rhs := parse_node(parser);
		n := new_node(NodeOr);
		n.left = lhs;
		n.right = rhs;
		lhs = n;
	}

	return lhs;
}

parse_node :: proc(parser: ^Parser) -> ^Node {
	return parse_or(parser);
}

parse_pattern :: proc(pattern: string) -> []^Node {
	nodes: [dynamic]^Node;
	parser: Parser;
	parser.pattern = pattern;
	next_rune(&parser);

	for parser.current_rune != utf8.RUNE_ERROR {
		append(&nodes, parse_node(&parser));
	}

	return nodes[:];
}

gen_node :: proc(regex: ^Regex, node: ^Node) {
	using Bytecode;
	switch n in node.variant {
	case NodeChar:
		append(&regex.code, Char);
		b1 := byte((n.r >> 24) & 0xFF);
		b2 := byte((n.r >> 16) & 0xFF);
		b3 := byte((n.r >>  8) & 0xFF);
		b4 := byte((n.r      ) & 0xFF);
		append(&regex.code, Bytecode(b1));
		append(&regex.code, Bytecode(b2));
		append(&regex.code, Bytecode(b3));
		append(&regex.code, Bytecode(b4));

	case NodeStar:
		//TODO: Handle greediness
		append(&regex.code, Star);
		end_jmp := len(regex.code);
		append(&regex.code, End);
		gen_node(regex, n.match);
		append(&regex.code, End);

		end_jmp_loc := len(regex.code);
		regex.code[end_jmp] = Bytecode(end_jmp_loc - end_jmp - 1);
	case NodePlus:
		//TODO: Handle greediness
		append(&regex.code, Plus);
		end_jmp := len(regex.code);
		append(&regex.code, End);
		gen_node(regex, n.match);
		append(&regex.code, End);

		end_jmp_loc := len(regex.code);
		regex.code[end_jmp] = Bytecode(end_jmp_loc - end_jmp - 1);
	case NodeOr:
		append(&regex.code, Or);

		end_jmp := len(regex.code);
		append(&regex.code, End);

		right_jmp := len(regex.code);
		append(&regex.code, End);

		gen_node(regex, n.left);
		append(&regex.code, End);

		right_jmp_loc := len(regex.code);
		regex.code[right_jmp] = Bytecode(right_jmp_loc - right_jmp - 1);

		gen_node(regex, n.right);
		append(&regex.code, End);

		end_jmp_loc := len(regex.code);
		regex.code[end_jmp] = Bytecode(end_jmp_loc - end_jmp - 1);
	case NodeAny:
		append(&regex.code, Any);
	case NodeCapture:
		id := regex.captures;
		regex.captures += 1;
		append(&regex.code, Start_Capture);
		append(&regex.code, Bytecode(id));
		for n in n.nodes {
			gen_node(regex, n);
		}
		append(&regex.code, End_Capture);
		append(&regex.code, Bytecode(id));
	case NodeAnyOf:
		append(&regex.code, AnyOf);
		append(&regex.code, Bytecode(len(n.chars)));
		for r in n.chars {
			buf, len := utf8.encode_rune(r);
			for i in 0..len-1 {
				append(&regex.code, Bytecode(buf[i]));
			}
		}
		append(&regex.code, Bytecode(len(n.ranges)));
		for r in n.ranges {
			b1 := byte((r.start >> 24) & 0xFF);
			b2 := byte((r.start >> 16) & 0xFF);
			b3 := byte((r.start >>  8) & 0xFF);
			b4 := byte((r.start      ) & 0xFF);
			append(&regex.code, Bytecode(b1));
			append(&regex.code, Bytecode(b2));
			append(&regex.code, Bytecode(b3));
			append(&regex.code, Bytecode(b4));

			b1 = byte((r.end >> 24) & 0xFF);
			b2 = byte((r.end >> 16) & 0xFF);
			b3 = byte((r.end >>  8) & 0xFF);
			b4 = byte((r.end      ) & 0xFF);
			append(&regex.code, Bytecode(b1));
			append(&regex.code, Bytecode(b2));
			append(&regex.code, Bytecode(b3));
			append(&regex.code, Bytecode(b4));
		}
	case NodeSequence:
		if n.prev != nil do gen_node(regex, n.prev);
		if n.next != nil do gen_node(regex, n.next);
	case: panic("TODO");
	}
}


match_vm :: proc(regex: ^Regex, pc: int, input: string, captures: ^[]string) -> (string, bool) {
	using Bytecode;
	pc := pc;
	input := input;

	for {
		op := regex.code[pc];
		pc += 1;

		// fmt.printf("op: %v, input: %#v\n", op, input);

		matched := false;

		if input == "" {
			// fmt.printf("empty input\n");
			// break;
		}

		switch op {
		case AnyOf:
			n := int(regex.code[pc]); pc += 1;

			input_r, l := utf8.decode_rune_in_string(input);
			str_chars := transmute(string) (regex.code[pc:pc+n]);
			pc += n;

			nranges := int(regex.code[pc]); pc += 1;
			ranges_left := nranges;
			for i := 0; i < nranges; i += 1 {
				b1 := int(regex.code[pc]); pc += 1;
				b2 := int(regex.code[pc]); pc += 1;
				b3 := int(regex.code[pc]); pc += 1;
				b4 := int(regex.code[pc]); pc += 1;
				start := rune(b1 << 24 | b2 << 16 | b3 << 8 | b4);

				b1 = int(regex.code[pc]); pc += 1;
				b2 = int(regex.code[pc]); pc += 1;
				b3 = int(regex.code[pc]); pc += 1;
				b4 = int(regex.code[pc]); pc += 1;
				end := rune(b1 << 24 | b2 << 16 | b3 << 8 | b4);

				ranges_left -= 1;

				if input_r >= start && input_r <= end {
					matched = true;
					input = input[l:];
					break;
				}
			}
			pc += ranges_left * 8;


			if !matched && strings.contains_rune(str_chars, input_r) != -1 {
				matched = true;
				input = input[l:];
			}
		case Start_Capture:
			id := int(regex.code[pc]); pc += 1;
			captures[id] = input[:];
			matched = true;
		case End_Capture:
			id := int(regex.code[pc]); pc += 1;
			length := len(captures[id]) - len(input);
			captures[id] = captures[id][:length];
			matched = true;
		case Star:
			end := regex.code[pc]; pc += 1;
			for {
				out, ok := match_vm(regex, pc, input, captures);
				input = out;
				if !ok do break;
			}
			pc += int(end);
			matched = true;
		case Plus:
			end := regex.code[pc]; pc += 1;

			out, ok := match_vm(regex, pc, input, captures);
			if ok {
				for {
					out, ok = match_vm(regex, pc, input, captures);
					input = out;
					if !ok do break;
				}
				matched = true;
			}

			pc += int(end);
		case Or:
			end := regex.code[pc]; pc += 1;
			epc := pc;

			rjmp := regex.code[pc]; pc += 1;
			rpc := pc;

			out, ok := match_vm(regex, pc, input, captures);
			if ok {
				input = out;
				matched = true;
			} else {
				out, ok = match_vm(regex, rpc+int(rjmp), input, captures);
				if ok {
					input = out;
					matched = true;
				}
			}

			pc = epc + int(end);
		case Char:
			b1 := int(regex.code[pc]); pc += 1;
			b2 := int(regex.code[pc]); pc += 1;
			b3 := int(regex.code[pc]); pc += 1;
			b4 := int(regex.code[pc]); pc += 1;
			r := rune(b1 << 24 | b2 << 16 | b3 << 8 | b4);

			input_r, l := utf8.decode_rune_in_string(input);

			// fmt.printf("r: %v, input_r: %v\n", r, input_r);

			if r == input_r {
				matched = true;
				input = input[l:];
			}
		case Any:
			if input != "" {
				input = input[1:];
				matched = true;
			}
		case End:
			return input, true;
		case:
			fmt.panicf("Invalid bytecode: %d", op);
		}

		if !matched {
			// fmt.printf("Match failed!\n");
			break;
		}
	}

	// fmt.printf("code: %#v\n", regex.code);

	return input, false;
}