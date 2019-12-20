#import . "lexer.odin";
#import . "ast.odin";
#import "fmt.odin";
#import "os.odin";

Parser :: struct {
	using lexer: Lexer,
}

init_parser :: proc(parser: ^Parser, file: string) {
	init_lexer(parser, file);
	lex_entire_file(parser);
}

compiler_crash :: proc(msg: string) {
	fmt.print("COMPILER CRASH: ", msg, "\n");
}

is_token_unary :: proc(t: Token) -> bool {
	using TokenType;
	return t.type == Plus || t.type == Minus;
}

unary_token_to_op :: proc(t: Token) -> UnaryOpType {
	using TokenType;
	match t.type {
		case Plus: {return UnaryOpType.Plus;}
		case Minus: {return UnaryOpType.Minus;}
	}
	compiler_crash("Passed non unary token to unary_token_to_op!");
	return UnaryOpType.Plus;
}

is_term_token :: proc(t: Token) -> bool {
	using TokenType;
	return t.type == Asterisk || t.type == Slash;
}

term_token_to_op :: proc(t: Token) -> BinaryOpType {
	using TokenType;
	match t.type {
		case Asterisk: {return BinaryOpType.Multiply;}
		case Slash: {return BinaryOpType.Divide;}
	}
	compiler_crash("Passed non term token to term_token_to_op!");
	return BinaryOpType.Multiply;
}

is_expression_token :: proc(t: Token) -> bool {
	using TokenType;
	return t.type == Plus || t.type == Minus;
}

expression_token_to_op :: proc(t: Token) -> BinaryOpType {
	using TokenType;
	match t.type {
		case Plus: {return BinaryOpType.Add;}
		case Minus: {return BinaryOpType.Sub;}
	}
	compiler_crash("Passed non expression token to expression_token_to_op!");
	return BinaryOpType.Add;
}

report_error :: proc(using parser: ^Parser, format: string, args: ..any) {
	// Make this into a stack
	fmt.printf("ERROR: ");
	fmt.printf(format, ..args);
	fmt.println();
	os.exit(1);
}

accept :: proc(using parser: ^Parser, type: TokenType) -> bool {
	t := current_token(parser);
	if t.type == type {
		eat_token(parser);
		return true;
	}
	return false;
}

expect :: proc(using parser: ^Parser, type: TokenType) -> bool {
	t := current_token(parser);
	if(accept(parser, type)) {
		return true;
	}
	report_error(parser, "Expected %s got %s!\nCurrent token: %s", type, t.type, t);
	return false;
}

parse_factor :: proc(using parser: ^Parser) -> ^Node {
	t := current_token(parser);

	if accept(parser, TokenType.Ident) {
		return make_ident_literal(t);
	} else if accept(parser, TokenType.Number) {
		return make_number_literal(t);
	} else if accept(parser, TokenType.LeftPar) {
		expr := parse_expression(parser);
		expect(parser, TokenType.RightPar);
		return expr;
	} else if accept(parser, TokenType.String) {
		return make_string_literal(t);
	} else {
		report_error(parser, "Expected ident, number or '('! Got %s", t);
		eat_token(parser);
		return nil;
	}
}

parse_term :: proc(using parser: ^Parser) -> ^Node {
	lhs := parse_factor(parser);

	t := current_token(parser);
	for is_term_token(t) {
		old_t := t;
		t = eat_token(parser);

		op := make_binop();
		op.op = term_token_to_op(old_t);
		op.lhs = lhs;
		op.rhs = parse_factor(parser);
		set_location_from_token(op, old_t);

		lhs = op;
		t = current_token(parser);
	}

	return lhs;
}

parse_expression :: proc(using parser: ^Parser) -> ^Node {
	t := current_token(parser);

	unary := false;
	unary_token := t;
	if is_token_unary(t) {
		unary = true;
		t = eat_token(parser);
	}
	// FIX!
	// NOTE(thebirk): Should unary work on the term below or the enitre expression at the end
	//                The single below probably

	lhs := parse_term(parser);

	t = current_token(parser);
	for is_expression_token(t) {
		old_t := t;
		t = eat_token(parser);

		op := make_binop();
		op.op = expression_token_to_op(old_t);
		op.lhs = lhs;
		op.rhs = parse_term(parser);
		set_location_from_token(op, old_t);

		lhs = op;
		t = current_token(parser);
	}

	if unary {
		t = eat_token(parser);

		op := make_unaryop();
		op.op = unary_token_to_op(unary_token);
		op.rhs = lhs;
		set_location_from_token(op, unary_token);

		lhs = op;
	}

	return lhs;
}

parse_try_type :: proc(using parser: ^Parser) -> ^Node {
	return nil;
}

parse_statement :: proc(using parser: ^Parser) -> ^Node {
	t := current_token(parser);
	start_token := t;

	lhs := parse_expression(parser);

	t = current_token(parser);
	if accept(parser, TokenType.SemiColon) {
		// Function call or non meaningful expression
		set_location_from_token(lhs, t);
		return lhs;
	} else if accept(parser, TokenType.Colon) {
		type := parse_try_type(parser); // Tries to parse a type if there is one there, returns nil otherwise

		if accept(parser, TokenType.Equal) {
			expr := parse_expression(parser);
			expect(parser, TokenType.SemiColon);
			fmt.println("made decl node!");
			decl := make_declaration_node(lhs, type, expr);
			set_location_from_token(decl, start_token);
			return decl;
		} else if accept(parser, TokenType.SemiColon) {
			decl := make_declaration_node(lhs, type, nil);
			set_location_from_token(decl, start_token);
			return decl;
		} else {
			report_error(parser, "Expected '=' or ';' while parsing declaration! Got %s", current_token(parser));
			return nil;
		}

	}

	return nil;
}

parse_block :: proc(using parser: ^Parser) -> ^Node {
	return nil;
}

parse_top_level :: proc(using parser: ^Parser) -> ^Node {
	t := current_token(parser);

	if accept(parser, TokenType.Func) {
		name := parse_expression(parer);
		if name != nil && name.type != NodeType.Ident {
			report_error(parser, "Expected an identifier after 'func'!");
			return nil;
		}

		expect(parser, TokenType.LeftPar);
		t = current_token(parser);
		for t.type != TokenType.RightPar {
			if t.type == TokenType.EOF {
				report_error(parser, "Unexpected end of file!");
			}

			type := parse_try_type(parser);
			if type != nil {
				expect(parser, TokenType.Colon);
			}
			// TODO(thebirk): Figure out logic for argument type inhertance!!
		}
	} else if accept(parser, TokenType.Struct) {

	} else {
		// Parse a single statement, make sure thats a declaration
		decl := parse_statement(parser);
		if decl != nil && decl.type != NodeType.Declaration {
			report_error("Only func, struct and declarations are allowed at a top level!");
			return nil;
		}
	}
}

parse :: proc(using parser: ^Parser) {

}