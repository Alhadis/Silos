package badscript

import "core:os"
import "core:fmt"
import "core:mem"

TokenKind :: enum
{
	EOF,
	COMMA,
	COMMENT,
	DOT,
	SEMICOLON,
	COLON,
	IDENT,
	NUMBER,
	STRING,
	VAR,
	FUNC,
	RETURN,
	CONTINUE,
	BREAK,
	IF,
	ELSE,
	WHILE,
	FOR,
	TRUE,
	FALSE,
	NULL,
	INCREMENT,
	DECREMENT,
	ADD,
	SUB,
	MUL,
	DIV,
	MOD,
	EQUAL,
	EQUALS,
	NEQUALS,
	LT,
	GT,
	LTE,
	GTE,
	LOR,
	LAND,
	NOT,
	LPAR,     // (
	RPAR,     // )
	LBRACE,   // {
	RBRACE,   // }
	LBRACKET, // [
	RBRACKET, // ]
}

func_runes     := []rune {'f', 'u', 'n', 'c'};
var_runes      := []rune {'v', 'a', 'r'};
return_runes   := []rune {'r', 'e', 't', 'u', 'r', 'n'};
if_runes       := []rune {'i', 'f'};
else_runes     := []rune {'e', 'l', 's', 'e'};
while_runes    := []rune {'w', 'h', 'i', 'l', 'e'};
continue_runes := []rune {'c', 'o', 'n', 't', 'i', 'n', 'u', 'e'};
break_runes    := []rune {'b', 'r', 'e', 'a', 'k'};
true_runes     := []rune {'t', 'r', 'u', 'e'};
false_runes    := []rune {'f', 'a', 'l', 's', 'e'};
null_runes     := []rune {'n', 'u', 'l', 'l'};

SourceLoc :: struct
{
	filename: string,
	filepath: string,
	line, char: int,
	fileoffset: int,
	length: int,
}

Token :: struct
{
	kind: TokenKind,
	loc: SourceLoc,
	lexeme: []rune,
}

Lexer :: struct
{
	data: [dynamic]rune,
	offset: int,
	filepath: string,
	filename: string,
	line, char: int,
	tokens: [dynamic]Token,

	tabstop: int,
}

read_file :: proc(using lexer: ^Lexer) -> (result := true)
{
	file, ok := os.read_entire_file(filepath);
	if !ok
	{
		return false;
	}
	defer free(file);

	reserve(&data, len(file)/2);
	file_string := string(file[..]);
	for r in file_string
	{
		append(&data, r);
	}
	append(&data, 0);

	//fmt.printf("reserved: %v, cap: %v, len: %v\n", len(file)/2, cap(data), len(data));

	return;
}

make_sourceloc :: proc(using lexer: ^Lexer, _line: int, _char: int, i: int, _length: int) -> SourceLoc
{
	return SourceLoc{filename = lexer.filename, filepath = lexer.filepath, line = _line, char = _char, fileoffset = i, length = _length};
}

make_lexer_from_file :: proc(path: string) -> ^Lexer
{
	lexer := new(Lexer);

	lexer.filepath = path;
	if !read_file(lexer)
	{
		return nil;
	}
	lexer.filename = lexer.filepath; //TODO: Get the actual filename

	lexer.line = 1;
	lexer.char = 1;
	lexer.offset = 0;
	lexer.tabstop = 4;

	return lexer;
}

_is_alpha :: proc(r: rune) -> bool
{
	return ((r >= 'a') && (r <= 'z')) || ((r >= 'A') && (r <= 'Z'));
}

_is_num :: proc(r: rune) -> bool
{
	return (r >= '0') && (r <= '9');
}

_is_whitespace :: proc(r: rune) -> bool
{
	return (r == ' ') || (r == '\r') || (r == '\t');
}

lexer_error :: proc(using lexer: ^Lexer, fmt_str: string, args: ...any)
{
	fmt.printf("%s(%d:%d) Lexer error: ", lexer.filename, lexer.line, lexer.char);
	fmt.printf(fmt_str, ...args);
	fmt.printf("\n");
	os.exit(1);
}

_compare_slices :: proc(a: $E/[]$T, b: E) -> bool
{
	if len(a) != len(b) do return false;
	for i := 0; i < len(a); i += 1
	{
		if a[i] != b[i] do return false;
	}
	return true;
}

lex :: proc(using lexer: ^Lexer)
{
	for i := 0; i < len(data) && data[i] != 0; i += 1
	{
		r := data[i];

		if r == '\n'
		{
			line += 1;
			char = 1;
			continue;
		}

		if r == '/' && data[i+1] == '/'
		{
			i += 2;
			for data[i] != 0 && data[i] != '\n'
			{
				i += 1;
			}
			// Do we want to record comments? ¯\_(ツ)_/¯
			line += 1;
			char = 1;
			continue;
		}

		if _is_whitespace(r)
		{
			if r == '\t'
			{
				offset_from_tabstop := line % tabstop;
				char += offset_from_tabstop;
			}
			else 
			{
				char += 1;
			}

			continue;
		}

		add_double_token :: proc(using lexer: ^Lexer, kind: TokenKind, i: ^int)
		{
			append(&lexer.tokens, Token{kind = kind, lexeme = data[i^..i^+2], loc = make_sourceloc(lexer, line, char, i^, 2)});
			i^ += 1;
			char += 1;
		}
		if r == '=' && data[i+1] == '=' { add_double_token(lexer, TokenKind.EQUALS, &i); continue; }
		if r == '!' && data[i+1] == '=' { add_double_token(lexer, TokenKind.NEQUALS, &i); continue; }
		if r == '<' && data[i+1] == '=' { add_double_token(lexer, TokenKind.LTE, &i); continue; }
		if r == '>' && data[i+1] == '=' { add_double_token(lexer, TokenKind.GTE, &i); continue; }
		if r == '+' && data[i+1] == '+' { add_double_token(lexer, TokenKind.INCREMENT, &i); continue; }
		if r == '-' && data[i+1] == '-' { add_double_token(lexer, TokenKind.DECREMENT, &i); continue; }
		if r == '|' && data[i+1] == '|' { add_double_token(lexer, TokenKind.LOR, &i); continue; }
		if r == '&' && data[i+1] == '&' { add_double_token(lexer, TokenKind.LAND, &i); continue; }

		add_basic_token :: proc(using lexer: ^Lexer, kind: TokenKind, i: int)
		{
			append(&lexer.tokens, Token{kind = kind, lexeme = data[i..i+1], loc = make_sourceloc(lexer, line, char, i+1, 1)});
			char += 1;
		}
		switch r
		{
			case ';': add_basic_token(lexer, TokenKind.SEMICOLON, i); continue;
			case '!': add_basic_token(lexer, TokenKind.NOT,       i); continue;
			case ':': add_basic_token(lexer, TokenKind.COLON,     i); continue;
			case '.': add_basic_token(lexer, TokenKind.DOT,       i); continue;
			case ',': add_basic_token(lexer, TokenKind.COMMA,     i); continue;
			case '=': add_basic_token(lexer, TokenKind.EQUAL,     i); continue;
			case '+': add_basic_token(lexer, TokenKind.ADD,       i); continue;
			case '-': add_basic_token(lexer, TokenKind.SUB,       i); continue;
			case '/': add_basic_token(lexer, TokenKind.DIV,       i); continue;
			case '*': add_basic_token(lexer, TokenKind.MUL,       i); continue;
			case '%': add_basic_token(lexer, TokenKind.MOD,       i); continue;
			case '<': add_basic_token(lexer, TokenKind.LT,        i); continue;
			case '>': add_basic_token(lexer, TokenKind.GT,        i); continue;
			case '(': add_basic_token(lexer, TokenKind.LPAR,      i); continue;
			case ')': add_basic_token(lexer, TokenKind.RPAR,      i); continue;
			case '[': add_basic_token(lexer, TokenKind.LBRACKET,  i); continue;
			case ']': add_basic_token(lexer, TokenKind.RBRACKET,  i); continue;
			case '{': add_basic_token(lexer, TokenKind.LBRACE,    i); continue;
			case '}': add_basic_token(lexer, TokenKind.RBRACE,    i); continue;
		}

		if r == '"'
		{
			i += 1;
			start := i;
			for data[i] != 0 && data[i] != '"'
			{
				i += 1;
			}
			if data[i] == 0
			{
				lexer_error(lexer, "Unexpected end of file while lexing string!");	
			}
			lexeme := data[start..i];
			append(&lexer.tokens, Token{kind = TokenKind.STRING, lexeme = lexeme, loc = make_sourceloc(lexer, line, char, start+1, len(lexeme))});
			char += i - start;

			continue;
		}

		if _is_num(r)
		{
			start := i;
			for data[i] != 0 && (_is_num(data[i]) || data[i] == '.')
			{
				i += 1;
			}
			lexeme := data[start..i];
			append(&lexer.tokens, Token{kind = TokenKind.NUMBER, lexeme = lexeme, loc = make_sourceloc(lexer, line, char, start+1, len(lexeme))});
			char += i - start;
			i -= 1;

			continue;
		}

		if _is_alpha(r) || r == '_'
		{
			start := i;
			for data[i] != 0 && (_is_alpha(data[i]) || _is_num(data[i]) || data[i] == '_')
			{
				i += 1;
			}
			lexeme := data[start..i];
			append(&lexer.tokens, Token{kind = TokenKind.IDENT, lexeme = lexeme, loc = make_sourceloc(lexer, line, char, start+1, len(lexeme))});
			char += i - start;
			i -= 1;
			
			continue;
		}

		lexer_error(lexer, "Unexpected character! '%r'/0x%02X", r, r);
		char += 1;
	}
	
	append(&lexer.tokens, Token{kind = TokenKind.EOF, loc = make_sourceloc(lexer, line, char, len(data), 0)});
	
	for i := 0; i < len(lexer.tokens); i += 1
	{
		t := &lexer.tokens[i];
		if t.kind == TokenKind.IDENT
		{
			if _compare_slices(t.lexeme, func_runes)
			{
				t.kind = TokenKind.FUNC;
			}
			else if _compare_slices(t.lexeme, var_runes)
			{
				t.kind = TokenKind.VAR;
			}
			else if _compare_slices(t.lexeme, return_runes)
			{
				t.kind = TokenKind.RETURN;
			}
			else if _compare_slices(t.lexeme, if_runes)
			{
				t.kind = TokenKind.IF;
			}
			else if _compare_slices(t.lexeme, continue_runes)
			{
				t.kind = TokenKind.CONTINUE;
			}
			else if _compare_slices(t.lexeme, break_runes)
			{
				t.kind = TokenKind.BREAK;
			}
			else if _compare_slices(t.lexeme, true_runes)
			{
				t.kind = TokenKind.TRUE;
			}
			else if _compare_slices(t.lexeme, false_runes)
			{
				t.kind = TokenKind.FALSE;
			}
			else if _compare_slices(t.lexeme, null_runes)
			{
				t.kind = TokenKind.NULL;
			}
			else if _compare_slices(t.lexeme, else_runes)
			{
				t.kind = TokenKind.ELSE;
			}
			else if _compare_slices(t.lexeme, while_runes)
			{
				t.kind = TokenKind.WHILE;
			}
		}
	}
}