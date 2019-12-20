package koi

import "core:os"
import "core:fmt"
import "core:strings"

FileParseError :: enum {
	Ok,
	FileNotFound,
}

Parser :: struct {
	filepath: string,
	data: []u8,
	offset: int,
	current_line: int,
	current_character: int,
	current_rune: rune,
	current_rune_offset: int,
	current_token: Token,

	allocated_strings: [dynamic]string,
}

init_parser :: proc(parser: ^Parser, filepath: string) -> FileParseError {
	parser.filepath = filepath;
	ok: bool;
	parser.data, ok = os.read_entire_file(filepath);
	if !ok do return FileParseError.FileNotFound; // Not very specific
	
	parser.current_line = 1;
	parser.current_character = 1;

	next_rune(parser);
	next_token(parser);

	return FileParseError.Ok;
}

parse_file :: proc(filepath: string) -> ([]^Node, FileParseError) {
	parser: Parser;
	if err := init_parser(&parser, filepath); err != FileParseError.Ok {
		return nil, err;
	}

	nodes: [dynamic]^Node;
	for {
		n := parse_top_level(&parser);
		if n == nil do break;
		append(&nodes, n);
	}

	return nodes[:], FileParseError.Ok; 
}

next_token :: proc(using parser: ^Parser) -> Token {
	t := read_token(parser);
	current_token = t;
	return t;
}

parser_error_at :: proc(using parser: ^Parser, loc: Location, fmt_string: string, args: ..any) -> ! {
	print_location(loc);
	fmt.printf("\e[91m parser error: \e[0m");
	fmt.printf(fmt_string, ..args);
	fmt.printf("\n");

	//TODO: Print the line, with the line above and below as well
	//      try using an arrow as well
	//      Easiest solution would be to tag tokens with the start offset

	os.exit(1);
}

parser_error_current :: proc(using parser: ^Parser, fmt_string: string, args: ..any) -> ! {
	parser_error_at(parser, current_token.loc, fmt_string, ..args);
}

parser_error :: proc{
	parser_error_at,
	parser_error_current,
};

parse_operand :: proc(using parser: ^Parser) -> ^Node {
	t := current_token;
	loc := current_token; // jadajada

	using TokenType;
	switch t.kind {
		case Number:
			next_token(parser);
			return make_number(parser, t);
		case Ident:
			next_token(parser);
			return make_ident(parser, t);
		case True:
			next_token(parser);
			return make_true(parser, t);
		case False:
			next_token(parser);
			return make_false(parser, t);
		case Nil:
			next_token(parser);
			return make_null(parser, t);
		case String:
			next_token(parser);
			return make_string(parser, t);
		case Fn:
			next_token(parser);

			args: [dynamic]string;
			is_vararg := false;
			t := current_token;
			if t.kind != TokenType.LeftPar {
				parser_error(parser, "Expected '(' after 'fn', got '%s'", t.lexeme);
			}
			next_token(parser);

			for {
				t := current_token;

				if t.kind == TokenType.RightPar {
					break;
				}
				else if t.kind == TokenType.Vararg {
					if is_vararg {
						parser_error(parser, "There can only be one vararg agrument.");
					} else {
						is_vararg = true;
					}
					next_token(parser);

					t = current_token;
					if t.kind != TokenType.Ident {
						parser_error(parser, "Expected identifier after '..'");
					}
					next_token(parser);

					append(&args, strings.new_string(t.lexeme));

					t = current_token;
					if t.kind == TokenType.RightPar {
						break;
					}
				}
				else if t.kind == TokenType.Ident {
					if is_vararg {
						parser_error(parser, "You cannot supply more arguments after '..'");
					}

					append(&args, strings.new_string(t.lexeme));
					next_token(parser);

					t = current_token;
					if t.kind == TokenType.RightPar {
						break;
					}
				}
				else {
					parser_error(parser, "Expected argument, got '%s'", t.lexeme);
				}

				t = current_token;
				if t.kind != TokenType.Comma {
					parser_error(parser, "Expected ',' after argument, got '%s'", t.lexeme);
				}
				next_token(parser);

				t = current_token;
				if t.kind == TokenType.RightPar {
					parser_error(parser, "Trailing ',' is not allowed in argument lists.");
				}
			}
			t = current_token;
			if t.kind != TokenType.RightPar {
				parser_error(parser, "Expected ')' after argument list, got '%s'", t.lexeme);
			}
			next_token(parser);

			block := parse_block(parser);

			return make_fn_expr(parser, loc, args, is_vararg, block);
		case Len:
			next_token(parser);
			
			if current_token.kind != LeftPar {
				parser_error(parser, "Expected '(' after 'len', got '%s'", current_token.lexeme);
			}
			next_token(parser);

			expr := parse_expr(parser);

			if current_token.kind != RightPar {
				parser_error(parser, "Expected ')', got '%s'", current_token.lexeme);
			}
			next_token(parser);

			return make_len(parser, t, expr);
		case LeftPar:
			next_token(parser);
			expr := parse_expr(parser);
			t = current_token;
			if(t.kind != RightPar) {
				//TODO: Error
				parser_error(parser, "Expected ')', got '%s'", t.lexeme);
			}
			next_token(parser);
			return expr;
		case LeftBracket:
			next_token(parser);
			
			entries: [dynamic]^Node;
			for {
				if current_token.kind == RightBracket do break;

				expr := parse_expr(parser);
				append(&entries, expr);

				if current_token.kind == Comma {
					next_token(parser);
					if current_token.kind == RightPar {
						parser_error(parser, "expected another expression after ',', got '%s'", current_token.lexeme);
					}
				}
			}

			if current_token.kind != RightBracket {
				panic("Invalid parser state!");
			}
			next_token(parser);

			return make_array_literal(parser, t, entries);
		case LeftBrace:
			next_token(parser);
			entries: [dynamic]NodeTableLiteralEntry;
			for {
				if current_token.kind == RightBrace do break;

				name_loc := current_token;
				name := parse_expr(parser);
				switch n in name.kind {
				case NodeIdent:
					newname := make_string_from_string(parser, name_loc, n.name);
					free(name);
					name = newname;
				case NodeString: // Do nothing
				case:
					parser_error(parser, name_loc.loc, "invalid table key");
				}

				if current_token.kind != Equal {
					parser_error(parser, "expected '=', got '%s'", current_token.lexeme);;
				}
				next_token(parser);

				expr := parse_expr(parser);

				if current_token.kind == Comma {
					next_token(parser);
					if current_token.kind == RightPar {
						parser_error(parser, "expected another entry after ',', got '%s'", current_token.lexeme);
					}
					append(&entries, NodeTableLiteralEntry{name, expr});
				} else {
					append(&entries, NodeTableLiteralEntry{name, expr});
				}
			}
			if current_token.kind != RightBrace {
				panic("Invalid parser state!");
			}
			next_token(parser);

			return make_table_literal(parser, t, entries);
		case:
			parser_error(parser, t.loc, "Expected expression, got '%s'", current_token.lexeme);
	}

	return nil;
}

parse_base :: proc(using parser: ^Parser) -> ^Node {
	expr := parse_operand(parser);

	using TokenType;
	for (current_token.kind in TokenTypes{LeftPar, LeftBracket, Dot, Colon}) {
		op := current_token;
		next_token(parser);

		switch op.kind {
		case LeftBracket:
			index_expr := parse_expr(parser);
			if current_token.kind != TokenType.RightBracket {
				parser_error(parser, "Expected ']'¨, got '%s'", current_token.lexeme);
			}
			next_token(parser);
			expr = make_index(parser, op, expr, index_expr);
		case Dot:
			ident := current_token;
			if current_token.kind != TokenType.Ident {
				parser_error(parser, "Expected identifier after '.', got '%s'", current_token.lexeme);
			}
			next_token(parser);
			expr = make_field(parser, op, expr, ident);
		case Colon:
			ident := current_token;
			if current_token.kind != TokenType.Ident {
				parser_error(parser, "Expected identifier after ':', got '%s'", current_token.lexeme);
			}
			next_token(parser);

			if current_token.kind != TokenType.LeftPar {
				parser_error(parser, "Expected '(' while parsing self call, got '%s'", current_token.lexeme);
			}
			next_token(parser);

			field := make_field(parser, op, expr, ident);

			args: [dynamic]^Node;
			for {
				if current_token.kind == RightPar do break;

				if current_token.kind == Comma {
					next_token(parser);
					if current_token.kind == RightPar {
						parser_error(parser, "Expected another argument after ',', got '%s'", current_token.lexeme);
					}
					append(&args, parse_expr(parser));
				} else {
					append(&args, parse_expr(parser));
				}
			}
			if current_token.kind != RightPar {
				panic("Invalid parser state!");
			}
			next_token(parser);

			expr = make_selfcall(parser, op, field, args);
		case LeftPar:
			args: [dynamic]^Node;
			for {
				if current_token.kind == RightPar do break;

				if current_token.kind == Comma {
					next_token(parser);
					if current_token.kind == RightPar {
						parser_error(parser, "Expected another argument after ',', got '%s'", current_token.lexeme);
					}
					append(&args, parse_expr(parser));
				} else {
					append(&args, parse_expr(parser));
				}
			}
			if current_token.kind != RightPar {
				panic("Invalid parser state!");
			}
			next_token(parser);

			expr = make_call(parser, op, expr, args);
		case:
			panic("Unsynced for and switch!");
		}
	}

	return expr;
}

parse_unary :: proc(using parser: ^Parser) -> ^Node {
	is_unary := false;
	op := current_token;

	using TokenType;
	if (op.kind in TokenTypes{Plus,Minus,LogicalNot}) {
		is_unary = true;
		next_token(parser);
	}

	expr := parse_base(parser);

	if is_unary {
		expr = make_unary(parser, op, expr);
	}

	return expr;
}

parse_mul :: proc(using parser: ^Parser) -> ^Node {
	lhs := parse_unary(parser);
	
	using TokenType;
	for (current_token.kind in TokenTypes{Asterisk,Slash,Mod}) {
		op := current_token;
		next_token(parser);

		rhs := parse_unary(parser);

		lhs = make_binary(parser, op, lhs, rhs);
	}

	return lhs;
}

parse_plus :: proc(using parser: ^Parser) -> ^Node {
	lhs := parse_mul(parser);

	using TokenType;
	for (current_token.kind in TokenTypes{Plus, Minus}) {
		op := current_token;
		next_token(parser);

		rhs := parse_mul(parser);

		lhs = make_binary(parser, op, lhs, rhs);
	}

	return lhs;
}

parse_equality :: proc(using parser: ^Parser) -> ^Node {
	lhs := parse_plus(parser);

	using TokenType;
	for (current_token.kind in TokenTypes{
		Equals, NotEqual,
		GreaterThan, GreaterThanOrEqual,
		LessThan, LessThanOrEqual
	}) {
		op := current_token;
		next_token(parser);

		rhs := parse_plus(parser);

		lhs = make_binary(parser, op, lhs, rhs);
	}

	return lhs;
}

parse_land :: proc(using parser: ^Parser) -> ^Node {
	lhs := parse_equality(parser);

	using TokenType;
	for (current_token.kind in TokenTypes{LogicalAnd}) {
		op := current_token;
		next_token(parser);

		rhs := parse_equality(parser);

		lhs = make_binary(parser, op, lhs, rhs);
	}

	return lhs;
}

parse_lor :: proc(using parser: ^Parser) -> ^Node {
	lhs := parse_land(parser);

	using TokenType;
	for (current_token.kind in TokenTypes{LogicalOr}) {
		op := current_token;
		next_token(parser);

		rhs := parse_land(parser);

		lhs = make_binary(parser, op, lhs, rhs);
	}

	return lhs;
}

// GO-like precedence : https://kuree.gitbooks.io/the-go-programming-language-report/content/31/text.html
parse_expr :: proc(using parser: ^Parser) -> ^Node {
	return parse_lor(parser);
}

parse_var :: proc(using parser: ^Parser) -> ^Node {
	var := current_token;
	assert(var.kind == TokenType.Var);
	next_token(parser);

	name := current_token;
	if name.kind != TokenType.Ident {
		parser_error(parser, "Expected identifier after 'var', got '%s'", name.lexeme);
	}
	next_token(parser);

	expr: ^Node = nil;
	if current_token.kind == TokenType.Equal {
		next_token(parser);
		expr = parse_expr(parser);
	}
	if current_token.kind != TokenType.SemiColon {
		parser_error(parser, "Expected ';' after declaration, got '%s'", current_token.lexeme);
	}
	next_token(parser);

	return make_variable_decl(parser, name, expr);
}

parse_fn :: proc(using parser: ^Parser) -> ^Node {
	fn := current_token;
	assert(fn.kind == TokenType.Fn);
	next_token(parser);

	name := current_token;
	if name.kind != TokenType.Ident {
		parser_error(parser, "Expected identifier after 'fn', got '%s'", name.lexeme);
	}
	next_token(parser);

	args: [dynamic]string;
	is_vararg := false;
	t := current_token;
	if t.kind != TokenType.LeftPar {
		parser_error(parser, "Expected '(', got '%s'", t.lexeme);
	}
	next_token(parser);

	for {
		t := current_token;

		if t.kind == TokenType.RightPar {
			break;
		}
		else if t.kind == TokenType.Vararg {
			if is_vararg {
				parser_error(parser, "There can only be one vararg agrument.");
			} else {
				is_vararg = true;
			}
			next_token(parser);

			t = current_token;
			if t.kind != TokenType.Ident {
				parser_error(parser, "Expected identifier after '..'");
			}
			next_token(parser);

			append(&args, strings.new_string(t.lexeme));

			t = current_token;
			if t.kind == TokenType.RightPar {
				break;
			}
		}
		else if t.kind == TokenType.Ident {
			if is_vararg {
				parser_error(parser, "You cannot supply more arguments after '..'");
			}

			append(&args, strings.new_string(t.lexeme));
			next_token(parser);

			t = current_token;
			if t.kind == TokenType.RightPar {
				break;
			}
		}
		else {
			parser_error(parser, "Expected argument, got '%s'", t.lexeme);
		}

		t = current_token;
		if t.kind != TokenType.Comma {
			parser_error(parser, "Expected ',' after argument, got '%s'", t.lexeme);
		}
		next_token(parser);

		t = current_token;
		if t.kind == TokenType.RightPar {
			parser_error(parser, "Trailing ',' is not allowed in argument lists.");
		}
	}
	t = current_token;
	if t.kind != TokenType.RightPar {
		parser_error(parser, "Expected ')' after argument list, got '%s'", t.lexeme);
	}
	next_token(parser);

	block := parse_block(parser);

	return make_fn(parser, fn, name, args, is_vararg, block);
}

parse_if :: proc(using parser: ^Parser) -> ^Node {
	loc := current_token;
	assert(loc.kind == TokenType.If);
	next_token(parser);

	cond := parse_expr(parser);
	block := parse_block(parser);
	else_: ^Node = nil;

	if current_token.kind == TokenType.Else {
		next_token(parser);

		if current_token.kind == TokenType.If {
			else_ = parse_if(parser);
		} else {
			else_ = parse_block(parser);
		}
	}

	return make_if(parser, loc, cond, block, else_);
}

parse_return :: proc(using parser: ^Parser) -> ^Node {
	t := current_token;
	assert(t.kind == TokenType.Return);
	next_token(parser);

	expr: ^Node = nil;

	if current_token.kind != TokenType.SemiColon {
		expr = parse_expr(parser);
	}

	if current_token.kind != TokenType.SemiColon {
		parser_error(parser, "Expected ';', got '%s'", current_token.lexeme);
	}
	next_token(parser);

	return make_return(parser, t, expr);
}

parse_for :: proc(using parser: ^Parser) -> ^Node {
	loc := current_token;
	assert(loc.kind == TokenType.For);
	next_token(parser);

	if current_token.kind == TokenType.LeftBrace || current_token.kind == TokenType.Do {
		block := parse_block(parser);
		return make_for_infinite(parser, loc, block);
	}

	expr := parse_expr(parser);

	if current_token.kind == TokenType.LeftBrace || current_token.kind == TokenType.Do {
		block := parse_block(parser);
		return make_for_expr(parser, loc, expr, block);
	}

	if current_token.kind != TokenType.In {
		parser_error(parser, "expected 'in', got '%s'", current_token.lexeme);
	}
	next_token(parser);

	if current_token.kind == TokenType.LeftBrace || current_token.kind == TokenType.Do {
		//Kind of hack to provide better errors
		parser_error(parser, "expected expression, got '%s'", current_token.lexeme);
	}

	inexpr := parse_expr(parser);
	block := parse_block(parser);

	return make_for_inexpr(parser, loc, expr, inexpr, block);
}

parse_print :: proc(using parser: ^Parser) -> ^Node {
	loc := current_token;
	assert(loc.kind == TokenType.Print);
	next_token(parser);

	args: [dynamic]^Node;
	expr := parse_expr(parser);
	append(&args, expr);

	using TokenType;
	if current_token.kind == Comma {
		next_token(parser);
		
		for {
			if current_token.kind == SemiColon do break;

			if current_token.kind == Comma {
				next_token(parser);
				if current_token.kind == RightPar {
					parser_error(parser, "Expected another argument after ',', got '%s'", current_token.lexeme);
				}
				append(&args, parse_expr(parser));
			} else {
				append(&args, parse_expr(parser));
			}
		}
	}

	if current_token.kind != SemiColon {
		parser_error(parser, "Expected ';', got '%s'", current_token.lexeme);
	}
	next_token(parser);

	return make_print(parser, loc, args);
}

parse_stmt :: proc(using parser: ^Parser) -> ^Node {
	t := current_token;

	using TokenType;
	switch t.kind {
	case Var:
		return parse_var(parser);
	case LeftBrace:
		return parse_block(parser);
	case If:
		return parse_if(parser);
	case Return:
		return parse_return(parser);
	case For:
		return parse_for(parser);
	case Print:
		return parse_print(parser);
	case: {
		loc := current_token;
		expr := parse_expr(parser);

		if current_token.kind == TokenType.Becomes {
			op := current_token;
			next_token(parser);

			name, ok := expr.kind.(NodeIdent); 
			if !ok {
				parser_error(parser, loc.loc, "Variable name is not an identifier.");
			}

			rhs := parse_expr(parser);

			if current_token.kind != TokenType.SemiColon {
				parser_error(parser, "Expected ';' after declaration, got '%s'", current_token.lexeme);
			}
			next_token(parser);

			// Free expr?
			return make_variable_decl_named(parser, loc, name.name, rhs);
		}
		else if (current_token.kind in TokenTypes{Equal, PlusEqual, MinusEqual, AsteriskEqual, SlashEqual, ModEqual}) {
			op := current_token;
			next_token(parser);

			rhs := parse_expr(parser);

			assign := make_assignment(parser, op, expr, rhs);
			if current_token.kind != TokenType.SemiColon {
				parser_error(parser, "Expected ';' after statement, got '%s'", current_token.lexeme);
			}
			next_token(parser);

			return assign;
		}

		switch n in expr.kind {
			case NodeCall, NodeSelfCall:
				if current_token.kind != TokenType.SemiColon {
					parser_error(parser, "Expected ';' after statement, got '%s'", current_token.lexeme);
				}
				next_token(parser);
				return expr;
		}

		//parser_error(parser, loc, "Expression is not allowed at statement level.");
		parser_error(parser, loc.loc, "Expected statement, got '%s'", loc.lexeme);
		return nil;
	}
	}
}

parse_block :: proc(using parser: ^Parser) -> ^Node {
	loc := current_token;

	stmts: [dynamic]^Node;;
	if current_token.kind == TokenType.Do {
		next_token(parser);
		stmt := parse_stmt(parser);
		append(&stmts, stmt);
	}
	else if current_token.kind == TokenType.LeftBrace {
		next_token(parser);

		for {
			t := current_token;
			if t.kind == TokenType.RightBrace {
				break;
			}

			stmt := parse_stmt(parser);
			append(&stmts, stmt);
		}

		t := current_token;
		if t.kind != TokenType.RightBrace {
			parser_error(parser, "Expected '}', got '%s'", t.lexeme);
		}
		next_token(parser);
	}
	else {
		parser_error(parser, "Expected '{' or 'do', got '%s'", current_token.lexeme);
	}

	return make_block(parser, loc, stmts);
}

parse_import :: proc(using parser: ^Parser) -> ^Node {
	loc := current_token;
	assert(loc.kind == TokenType.Import);
	next_token(parser);

	name := current_token;
	if name.kind != TokenType.String {
		parser_error(parser, "Expected string after 'import', got '%s'", name.lexeme);
	}
	next_token(parser);

	return make_import(parser, loc, name);
}

parse_top_level :: proc(using parser: ^Parser) -> ^Node {
	using TokenType;
	switch current_token.kind {
	case Import:
		return parse_import(parser);
	case Var:
		return parse_var(parser);
	case Fn:
		return parse_fn(parser);
	case Eof:
		return nil;
	case:
		parser_error(parser, "Expected 'import', fn' or 'var', got '%s'", current_token.lexeme);
		return nil;
	}
}