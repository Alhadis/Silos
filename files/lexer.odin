#import "fmt.odin";
#import "os.odin";
#import "utf8.odin";
#import "strconv.odin";

Lexer :: struct {
	file: []byte,
	offset: int,

	line, char: int,

	last_rune_size: int,

	token_offset: int,
	tokens: [dynamic]Token,
}

TokenType :: enum {
	Comma,
	Colon,
	SemiColon,
	Dot,
	Equal,
	Plus,
	Minus,
	Slash,
	Asterisk,

	LeftPar,
	RightPar,
	LeftBrace,
	RightBrace,
	LeftBracket,
	RightBracket,

	Ident,
	Number,
	String,
	True,
	False,

	Func,
	Struct,
	Return,

	EOF,
	Unknown,
}

NumberType :: enum {
	Integer,
	Float,
}

Token :: union {
	type: TokenType,
	lexeme: string,
	line, char: int,

	Number {
		ntype: NumberType,
		ui: u64,
		si: i64,
		float: f64,
	},
}

current_token :: proc(using lexer: ^Lexer) -> Token {
	if token_offset >= len(tokens) {
		return Token{TokenType.EOF, "(EOF from current_token)", line, char};
	}
	return tokens[token_offset];
}

peek_token :: proc(using lexer: ^Lexer) -> Token {
	if token_offset+1 >= len(tokens) {
		return Token{TokenType.EOF, "(EOF from peek_token)", line, char};	
	}
	return tokens[token_offset+1];
}

eat_token :: proc(using lexer: ^Lexer) -> Token {
	token_offset++;
	if token_offset >= len(tokens) {
		return Token{TokenType.EOF, "(EOF from eat_token)", line, char};
	}
	return tokens[token_offset];
}

lex_entire_file :: proc(using lexer: ^Lexer) {
	t := get_token(lexer);
	for t.type != TokenType.EOF {
		append(tokens, t);
		t = get_token(lexer);
	}

	token_offset = 0;
}

init_lexer :: proc(using lexer: ^Lexer, path: string) {
	offset = 0;
	line = 1;
	char = 1;

	ok: bool;
	file, ok = os.read_entire_file(path);
	if !ok {
		fmt.printf("Failed to open file '%s'\n", path);
		os.exit(1);
	}
}

is_whitespace :: proc(r: rune) -> bool {
	return (r == ' ') || (r == '\t') || (r == '\r') || (r == '\n');
}

eat_whitespace :: proc(using lexer: ^Lexer) {
	// TODO(thebirk): Handle linenumbers and chars
	r := get_rune(lexer);
	char++;
	for r != utf8.RUNE_ERROR && is_whitespace(r) {
		if r == '\n' {
			line++;
			char = 1;
		}
		r = get_rune(lexer);
		char++;
	}
	if r != utf8.RUNE_ERROR {
		back(lexer);
		char--;
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
	return is_num(r) || (r >= 'a' && r <= 'f') || (r >= 'A' && r <= 'F');
}

is_binary :: proc(r: rune) -> bool {
	return (r == '0' || r == '1');
}

get_token :: proc(using lexer: ^Lexer) -> Token {
	eat_whitespace(lexer);
	r := get_rune(lexer);
	char++;
	if r == utf8.RUNE_ERROR {
		return Token{TokenType.EOF, "(EOF)", line, char};
	}

	match r {
		case ',': {
			return Token{TokenType.Comma, ",", line, char};
		}
		case ':': {
			return Token{TokenType.Colon, ":", line, char};
		}
		case ';': {
			return Token{TokenType.SemiColon, ";", line, char};
		}
		case '.': {
			return Token{TokenType.Dot, ".", line, char};
		}
		case '=': {
			return Token{TokenType.Equal, "=", line, char};
		}
		case '+': {
			return Token{TokenType.Plus, "+", line, char};
		}
		case '-': {
			return Token{TokenType.Minus, "-", line, char};
		}
		case '*': {
			return Token{TokenType.Asterisk, "*", line, char};
		}
		case '(': {
			return Token{TokenType.LeftPar, "(", line, char};
		}
		case ')': {
			return Token{TokenType.RightPar, ")", line, char};
		}
		case '{': {
			return Token{TokenType.LeftBrace, "{", line, char};
		}
		case '}': {
			return Token{TokenType.RightBrace, "}", line, char};
		}
		case '[': {
			return Token{TokenType.LeftBracket, "[", line, char};
		}
		case ']': {
			return Token{TokenType.RightBracket, "]", line, char};
		}
		case '"': {
			start := offset;
			r = get_rune(lexer);
			char++;
			for r != utf8.RUNE_ERROR && r != '"' {
				r = get_rune(lexer);
				char++;
			}

			str := string(file[start..offset-2]);
			return Token{TokenType.String, str, line, char};
		}
		case '/': {
			r = get_rune(lexer);
			char++;

			if r != '/' {
				back(lexer);
				char--;
				return Token{TokenType.Slash, "/", line, char};
			} else {
				for r != utf8.RUNE_ERROR && r != '\n' {
					r = get_rune(lexer);
					char++;
				}
				back(lexer);
				char--;
				return get_token(lexer);
			}
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
					char++;
					for r != utf8.RUNE_ERROR && is_hex(r) {
						r = get_rune(lexer);
						char++;
					}
					back(lexer);
					char--;

					num := string(file[start..offset-1]);
					val := i64(strconv.parse_int(num, 16));
					return Token.Number{
						type = TokenType.Number,
						lexeme = num,
						line = line,
						char = char,
						ntype = NumberType.Integer,
						si = val,
					};
				}
				case 'b': {
					start = offset;
					r = get_rune(lexer);
					char++;
					for r != utf8.RUNE_ERROR && is_binary(r) {
						r = get_rune(lexer);
						char++;
					}
					back(lexer);
					char--;

					num := string(file[start..offset-1]);
					val := i64(strconv.parse_int(num, 2));
					return Token.Number{
						type = TokenType.Number,
						lexeme = num,
						line = line,
						char = char,
						ntype = NumberType.Integer,
						si = val,
					};
				}
			}
		}

		// normal integer
		for r != utf8.RUNE_ERROR && is_num(r) {
			r = get_rune(lexer);
			char++;
		}
		back(lexer);
		char--;

		num := string(file[start..offset-1]);
		val := i64(strconv.parse_int(num, 10));
		
		return Token.Number{
			type = TokenType.Number,
			lexeme = num,
			line = line,
			char = char,
			ntype = NumberType.Integer,
			si = val,
		};
	}

	if is_alpha(r) {
		start := offset-1;

		r = get_rune(lexer);
		char++;
		for r != utf8.RUNE_ERROR && (is_alnum(r) || r == '_') {
			r = get_rune(lexer);
			char++;
		}
		back(lexer);
		char--;

		ident := string(file[start.. offset-1]);

		match ident {
			case "true": {
				return Token{TokenType.True, ident, line, char};
			}
			case "false": {
				return Token{TokenType.False, ident, line, char};
			}
			case "func": {
				return Token{TokenType.Func, ident, line, char};
			}
			case "struct": {
				return Token{TokenType.Struct, ident, line, char};
			}
			case "return": {
				return Token{TokenType.Return, ident, line, char};
			}
		}

		return Token{TokenType.Ident, ident, line, char};
	}

	return Token{TokenType.Unknown, "(Unknown)", line, char};
	//return Token{TokenType.Unknown, string(file[offset..]), line, char};
}