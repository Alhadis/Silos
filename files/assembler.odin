#import "fmt.odin";
#import "os.odin";
#import "utf8.odin";
#import "strconv.odin";
#load "opcodes.odin";

Lexer :: struct {
	file: []byte,
	offset: int,

	last_rune_size: int,
}

Parser :: struct {
	using lexer: Lexer,
}


OperandType :: enum {
	Reg,        // r[0-f]
	RegSP,      // sp
	RegSB,      // sb
	DoubleReg,  // r[0-f]:r[0-f]
	Constant8,  // 0x00   - 0xFF   | 0-255   | -128 - 127
	Constant16, // 0x0000 - 0xFFFF | 0-65536 | -32768 - 32767
	Label,      // 
}

Opcode :: struct {
	name: string,
	opcode: byte,
	operands: []OperandType,
}

opcodes := []Opcode{
	{"NOP",  NOP,    nil},
	{"LD",   LDRC,   []OperandType{OperandType.Reg, OperandType.Constant8}},
	{"LD",   LDRR,   []OperandType{OperandType.Reg, OperandType.Reg}},
	{"LD",   LDSPCC, []OperandType{OperandType.RegSP, OperandType.Constant16}},
	{"LD",   LDSPRR, []OperandType{OperandType.RegSP, OperandType.DoubleReg}},
	{"LD",   LDSBCC, []OperandType{OperandType.RegSB, OperandType.Constant16}},
	{"LD",   LDSBRR, []OperandType{OperandType.RegSB, OperandType.DoubleReg}},
	{"ADD",  ADDRC,  []OperandType{OperandType.Reg, OperandType.Constant8}},
	{"ADD",  ADDRR,  []OperandType{OperandType.Reg, OperandType.Reg}},
	{"SUB",  SUBRC,  []OperandType{OperandType.Reg, OperandType.Constant8}},
	{"SUB",  SUBRR,  []OperandType{OperandType.Reg, OperandType.Reg}},
	{"HLT",  HLT,    nil},
	{"PUSH", PUSHR,  []OperandType{OperandType.Reg}},
	{"PUSH", PUSHC,  []OperandType{OperandType.Constant8}},
	{"POP",  POPR,   []OperandType{OperandType.Reg}},
	{"POP",  POP,    nil},
};

/*

- Are []OperandType{} constants allowed and zero length?,
  if so use them for ops without operands
- Combine Constant8 and Constan16 and combine them?

Match opcode and operands with the opcodes array,
if there is a fit, emit the opcode and the operand,
if there is no fit, emit an error telling you that there is no opcode matching the input
probably print the possible operand combinations

*/

TokenType :: enum {
	Comma,
	Colon,
	Dot,
	Ident,
	Number,
	String,
	Newline,
	Register,
	EOF,
	Unknown,
}

Token :: struct {
	type: TokenType,
	lexeme: string,
}

init_lexer :: proc(using lexer: ^Lexer, path: string) {
	offset = 0;

	ok: bool;
	file, ok = os.read_entire_file(path);
	if !ok {
		fmt.printf("Failed to open file '%s'\n", path);
		os.exit(1);
	}
}

is_whitespace :: proc(r: rune) -> bool {
	return (r == ' ') || (r == '\t') || (r == '\r');
}

eat_whitespace :: proc(using lexer: ^Lexer) {
	r := get_rune(lexer);
	for r != utf8.RUNE_ERROR && is_whitespace(r) {
		r = get_rune(lexer);
	}
	if r != utf8.RUNE_ERROR {
		back(lexer);
	}
}

back :: proc(using lexer: ^Lexer) {
	//assert(last_rune_size != 0);
	offset -= last_rune_size;
	last_rune_size = 0;
}

get_rune :: proc(using lexer: ^Lexer) -> rune {
	r, i := utf8.decode_rune(file[offset..]);
	offset += i;
	last_rune_size = i;
	return r;
}

is_alpha :: proc(r: rune) -> bool {
	return (r >= 'a' && r <= 'z') || (r >= 'A' && r <= 'Z');
}

is_num :: proc(r: rune) -> bool {
	return (r >= '0' && r <= '9');
}

is_alnum :: proc(r: rune) -> bool {
	return is_alpha(r) || is_num(r);
}

is_hex :: proc(r: rune) -> bool {
	return is_num(r) || (r >= 'a' && r <= 'f');
}

is_binary :: proc(r: rune) -> bool {
	return (r == '0' || r == '1');
}

get_token :: proc(using lexer: ^Lexer) -> Token {
	eat_whitespace(lexer);
	r := get_rune(lexer);
	if r == utf8.RUNE_ERROR {
		return Token{TokenType.EOF, "(EOF)"};
	}

	match r {
		case '.': {
			return Token{TokenType.Dot, "."};
		}
		case ':': {
			return Token{TokenType.Colon, ":"};
		}
		case ',': {
			return Token{TokenType.Comma, ","};
		}
		case '\n': {
			return Token{TokenType.Newline, "(newline)"};
		}
		case '"': {
			start := offset;
			r = get_rune(lexer);
			for r != utf8.RUNE_ERROR && r != '"' {
				r = get_rune(lexer);
			}

			str := string(file[start..offset-2]);
			return Token{TokenType.String, str};
		}
	}

	if is_num(r) {
		start := offset-1;

		old_r := r;
		r  = get_rune(lexer);

		// hexadecimal or binary
		if old_r == '0' {
			match r {
				case 'x': {
					start = offset;
					r = get_rune(lexer);
					for r != utf8.RUNE_ERROR && is_hex(r) {
						r = get_rune(lexer);
					}
					back(lexer);

					num := string(file[start..offset-1]);
					fmt.printf("Found hex number: '%s'\n", num);
					fmt.printf("'%s' = %d\n", num, strconv.parse_int(num, 16));
					return Token{TokenType.Number, num};
				}
				case 'b': {
					start = offset;
					r = get_rune(lexer);
					for r != utf8.RUNE_ERROR && is_binary(r) {
						r = get_rune(lexer);
					}
					back(lexer);

					num := string(file[start..offset-1]);
					fmt.printf("Found binary number: '%s'\n", num);
					fmt.printf("'%s' = %d\n", num, strconv.parse_int(num, 2));
				}
			}
		}

		// normal integer
		for r != utf8.RUNE_ERROR && is_num(r) {
			r = get_rune(lexer);
		}
		back(lexer);

		num := string(file[start..offset-1]);
		
	}

	if is_alpha(r) {
		start := offset-1;

		r = get_rune(lexer);
		for r != utf8.RUNE_ERROR && (is_alnum(r) || r == '_') {
			r = get_rune(lexer);
		}
		back(lexer);

		ident := string(file[start.. offset-1]);
		return Token{TokenType.Ident, ident};
	}

	return Token{TokenType.Unknown, "(Unknown)"};
}

main :: proc() {
	parser := new(Parser);
	init_lexer(parser, "test.asm");

	tok := get_token(parser);
	for tok.type != TokenType.EOF {
		fmt.println(tok);
		tok = get_token(parser);
	}
}