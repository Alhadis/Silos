#import "fmt.odin";
#import "os.odin";
#import "utf8.odin";
#load "opcodes.odin";

/*

Rewrite using a tokenizer
Have newline be a token and report if this is found unexpectedly

*/

Lexer :: struct {
	offset: int,
	file: []byte,
}

Parser :: struct {
	using lexer: Lexer,
	lines: [dynamic]Line,
}

Line :: union {
	Label {
		name: string,
	},
	Directive {
		type: DirectiveType,
		operands: [dynamic]Operand,
	},
	Op {
		type: int,
		operands: []Operand,
	},
}

DirectiveType :: enum {
	Offset,
}

OperandType :: enum {
	Reg,        // r[0-f]
	DoubleReg,  // r[0-f]:r[0-f]
	Constant8,  // 0x00   - 0xFF   | 0-255   | -128 - 127
	Constant16, // 0x0000 - 0xFFFF | 0-65536 | -32768 - 32767
	Label,      // 
}

Operand :: struct {
	value: i64,
	type: OperandType,
}

Opcode :: struct {
	type: int,
	str: string,
	operands: []OperandType,
}

opcodes := []Opcode{
	{NOP, "NOP", nil},
	{LDRC, "LDRC", []OperandType{OperandType.Reg, OperandType.Constant8}},
	{LDRR, "LDRR", []OperandType{OperandType.Reg, OperandType.Reg}},
	{ADDRC, "ADDRC", []OperandType{OperandType.Reg, OperandType.Constant8}},
	{ADDRR, "ADDRR", []OperandType{OperandType.Reg, OperandType.Reg}},
	{SUBRC, "SUBRC", []OperandType{OperandType.Reg, OperandType.Constant8}},
	{SUBRR, "SUBRR", []OperandType{OperandType.Reg, OperandType.Reg}},
	{LDSPCC, "LDSPCC", []OperandType{OperandType.Constant16}},
	{LDSPRR, "LDSPRR", []OperandType{OperandType.DoubleReg}},
	{LDSBC, "LDSBC", nil},
	{LDSBR, "LDSBR", nil},
	{HLT, "HLT", nil},
	{PUSHR, "PUSHR", nil},
	{PUSHC, "PUSHC", nil},
	{POPR, "POPR", nil},
	{POP, "POP", nil},
};

init_lexer :: proc(using lexer: ^Lexer, path: string) {
	offset = 0;

	ok: bool;
	file, ok = os.read_entire_file(path);
	if !ok {
		fmt.printf("Failed to open file '%s'!\n", path);
		os.exit(1);
	}
}

get_rune :: proc(using lexer: ^Lexer) -> rune {
	r, d := utf8.decode_rune(file[offset..]);
	offset += d;
	return r;
}

get_line :: proc(using lexer: ^Lexer) -> string {
	start := offset;

	r := get_rune(lexer);
	for r != utf8.RUNE_ERROR && r != '\n' {
		r = get_rune(lexer);
	}

	return string(file[start..offset-1]);
}

is_whitespace :: proc(r: rune) -> bool {
	return (r == ' ') || (r == '\t') || (r == '\n');
}

// NOTE(thebirk): Matches on bytes, therefore the return value is in bytes not characters
starts_with :: proc(str, cmp: string) -> (bool, int) {
	strb := []byte(str);
	cmpb := []byte(cmp);

	result := true;
	i := 0;

	for ; i < len(cmpb); i++ {
		if i >= len(strb) {
			result = false;
			break;
		}
		if strb[i] != cmpb[i] {
			result = false;
			break;
		}
	}

	return result, i;
}

get_word :: proc(using parser: ^Parser) -> string {
	start := offset;
	r := get_rune(parser);

	for is_whitespace(r) {
		r = get_rune(parser);
	}

	for r != utf8.RUNE_ERROR && !is_whitespace(r) {
		r = get_rune(parser);
	}

	word := string(file[start..offset-1]);
	return word;
}

error :: proc(using parser: ^Parser, format: string, args: ..any) {
	// TODO(thebirk): Add linenumber and offset
	fmt.printf(format, args);
	fmt.println();
	os.exit(1);
}

parse_label :: proc(using parser: ^Parser, word: string) {
	fmt.printf("found label %s\n", word[1..]);
}

parse_directive :: proc(using parser: ^Parser, word: string) {
	name := word[1..len(word)-2];

	if name == "offset" {
		offs := get_word(parser);
		fmt.printf("found directive offset: %s\n", offs);
	} else {
		fmt.println("Unknown directive:", name);
	}
}

parse_operand :: proc(using parser: ^Parser) -> Operand {
	word := get_word(parser);

	if b, i := starts_with(word, "r"); b {
		// register
		if utf8.rune_count(word) != 2 {
			error(parser, "Unknown register %s!", word);
		}

		r := get_rune(parser);
	} else {
		// constant
		// figure out the type
	}

	return Operand{};
}

parse_ld :: proc(using parser: ^Parser, word: string) {
	op := parse_operand(parser);
}

parse_line :: proc(using parser: ^Parser) {
	word := get_word(parser);

	if b, i := starts_with(word, ":"); b {
		parse_label(parser, word);
		return;
	}

	if b, i := starts_with(word, "."); b {
		parse_directive(parser, word);
		return;
	}

	if b, i := starts_with(word, "LD"); b {
		parse_ld(parser, word);
	}
	fmt.println("parse_line, word:", word);
}

main :: proc() {
	parser := new(Parser);
	init_lexer(parser, "test.asm");

	// append(parser.lines, Line.Label{"test"});

	parse_line(parser);
	parse_line(parser);
}