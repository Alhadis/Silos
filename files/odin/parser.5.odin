package badscript

import "core:os"
import "core:fmt"

Parser :: struct
{
	lexer: ^Lexer,
	current_token: Token,
	offset: int,
}

make_parser :: proc(path: string) -> ^Parser
{
	parser := new(Parser);

	parser.lexer = make_lexer_from_file(path);
	lex(parser.lexer);
	parser.offset = 0;
	parser.current_token = parser.lexer.tokens[parser.offset];

	return parser;
}

next_token :: proc(using p: ^Parser) -> Token
{
	p.offset += 1;
	p.current_token = p.lexer.tokens[p.offset];
	return p.current_token;
}

is_token :: proc[
	is_token_slice,
	is_token_single,
];

is_token_slice :: proc(using p: ^Parser, kinds: []TokenKind) -> bool
{
	for k in kinds
	{
		if p.current_token.kind == k do return true;
	}
	return false;
}

is_token_single :: proc(using p: ^Parser, kind: TokenKind) -> bool
{
	if p.current_token.kind == kind
	{
		return true;
	}
	return false;
}

match_token :: proc(using p: ^Parser, kind: TokenKind) -> bool
{
	if p.current_token.kind == kind
	{
		next_token(p);
		return true;
	}
	return false;
}

expect :: proc(using p: ^Parser, kind: TokenKind)
{
	if match_token(p, kind)
	{
		return;
	}
	parser_error(p, "Expected '%v' got '%v'", kind, p.current_token.kind);
}

find_rune_from_right :: proc(s: []rune, offset: int, r: rune) -> int
{
	for offset >= 0 && offset < len(s) && s[offset] != r
	{
		offset -= 1;
	}
	return offset;
}

find_rune_from_left :: proc(s: []rune, offset: int, r: rune) -> int
{
	for offset < len(s) && s[offset] != r
	{
		offset += 1;
	}
	return offset;
}

parser_error :: proc(using parser: ^Parser, fmt_str: string, args: ...any)
{
	fmt.printf("%s(%d:%d) Parser error: ", parser.lexer.filename, parser.current_token.loc.line, parser.current_token.loc.char);	
	fmt.printf(fmt_str, ...args);
	fmt.printf("\n\n");
	
	start := find_rune_from_right(parser.lexer.data[..], parser.current_token.loc.fileoffset, '\n');
	end := find_rune_from_left(parser.lexer.data[..], parser.current_token.loc.fileoffset, '\n');
	if lexer.data[start] == '\n' do start += 1;	
	if lexer.data[end] == '\n' do end -= 1;
	output := parser.lexer.data[start..end+1];
	for r in output
	{
		fmt.printf("%r", r);
	}
	fmt.printf("\n");
	
	for i := start; i < parser.current_token.loc.fileoffset; i += 1
	{
		if lexer.data[i] == '\t'
		{
			fmt.printf("\t");
		}
		else
		{
			fmt.printf(" ");
		}
	}
	fmt.printf("^\n");
	
	os.exit(1);
}

parse_expr_operand :: proc(using p: ^Parser) -> ^Node
{
	t := p.current_token;

	if match_token(p, TokenKind.NUMBER)
	{
		return make_number(p, t, t.lexeme);
	}
	else if match_token(p, TokenKind.TRUE)
	{
		return make_true(p, t);
	}
	else if match_token(p, TokenKind.FALSE)
	{
		return make_false(p, t);
	}
	else if match_token(p, TokenKind.IDENT)
	{
		return make_name(p, t, t.lexeme);
	}
	else if match_token(p, TokenKind.STRING)
	{
		return make_string(p, t, t.lexeme);
	}
	else if match_token(p, TokenKind.NULL)
	{
		return make_null(p, t);
	}
	else if match_token(p, TokenKind.LPAR)
	{
		expr := parse_expr(p);
		expect(p, TokenKind.RPAR);
		return expr;
	}
	else if match_token(p, TokenKind.FUNC)
	{
		if !match_token(p, TokenKind.LPAR)
		{
			parser_error(p, "Expected '(' after 'func' while parsing anonymous function");
			return nil;
		}
		
		args: [dynamic][]rune;
		
		if !is_token(p, TokenKind.RPAR)
		{
			first := true;
			for first || match_token(p, TokenKind.COMMA)
			{
				if first do first = false;
				
				if is_token(p, TokenKind.IDENT)
				{
					append(&args, p.current_token.lexeme);
					next_token(p);
				}
				else
				{
					parser_error(p, "Expected identifier while parsing argument list got '%v'", p.current_token.kind);
				}
			}
		}
		expect(p, TokenKind.RPAR);
		
		block := parse_block(p);
		return make_anonfunc(p, t, args[..], block);
	}
	else if match_token(p, TokenKind.LBRACE)
	{
		entries: [dynamic]TableEntry;
		
		if match_token(p, TokenKind.RBRACE)
		{
			return make_table(p, t, entries[..]);
		}
		
		first := true;
		for first || (!is_token(p, TokenKind.RBRACE) && match_token(p, TokenKind.COMMA))
		{
			if first do first = false;
			
			if is_token(p, TokenKind.RBRACE)
			{
				// We allow one trailing comma
				break;
			}
			
			if match_token(p, TokenKind.LBRACKET)
			{
				index := parse_expr(p);
				expect(p, TokenKind.RBRACKET);
				
				expect(p, TokenKind.EQUAL);
				
				value := parse_expr(p);
				append(&entries, TableEntry{kind = TableEntryKind.Index, key = index, expr = value});
			}
			else
			{
				expr := parse_expr(p);
				
				if match_token(p, TokenKind.EQUAL)
				{
					value := parse_expr(p);
					append(&entries, TableEntry{kind = TableEntryKind.Key, key = expr, expr = value});
				}
				else
				{
					append(&entries, TableEntry{kind = TableEntryKind.Normal, expr = expr});
				}
			}
		}
		
		if !match_token(p, TokenKind.RBRACE)
		{
			parser_error(p, "Expected ',' or '}' but got '%v'!", p.current_token.kind);
			return nil;
		}
		
		return make_table(p, t, entries[..]);
	}
	else
	{
		parser_error(p, "Unexpected token: %v", t.kind);
		return nil;
	}
	
	return nil;
}

parse_expr_base :: proc(using p: ^Parser) -> ^Node
{	
	expr := parse_expr_operand(p);

	for is_token(p, []TokenKind{TokenKind.LPAR, TokenKind.LBRACKET, TokenKind.DOT, TokenKind.COLON, TokenKind.INCREMENT, TokenKind.DECREMENT})
	{
		op := p.current_token;

		if match_token(p, TokenKind.LBRACKET)
		{
			// expr[
			index_expr := parse_expr(p);
			expect(p, TokenKind.RBRACKET);
			expr = make_index(p, op, expr, index_expr);
		}
		else if match_token(p, TokenKind.LPAR)
		{
			// expr(
			args: [dynamic]^Node;
			if match_token(p, TokenKind.RPAR)
			{
				// expr()
				expr = make_call(p, op, expr, args[..]);
			}
			else
			{
				// expr(...
				first := true;
				for first || match_token(p, TokenKind.COMMA)
				{
					if first do first = false;
					arg_expr := parse_expr(p);
					append(&args, arg_expr);
				}
				expect(p, TokenKind.RPAR);
				
				expr = make_call(p, op, expr, args[..]);
			}
		}
		else if match_token(p, TokenKind.DOT)
		{
			// expr.t
			t := p.current_token;
			expect(p, TokenKind.IDENT);
			expr = make_field(p, op, t, expr);
		}
		else if match_token(p, TokenKind.COLON)
		{
			// expr:t(
			t := p.current_token;
			expect(p, TokenKind.IDENT);
			
			if match_token(p, TokenKind.LPAR)
			{
				args: [dynamic]^Node;
				
				if match_token(p, TokenKind.RPAR)
				{
					// expr:t()
					expr = make_methodcall(p, op, expr, t, args[..]);
				}
				else
				{
					// expr:t(...
					first := true;
					for first || match_token(p, TokenKind.COMMA)
					{
						if first do first = false;
						arg_expr := parse_expr(p);
						append(&args, arg_expr);
					}
					expect(p, TokenKind.RPAR);
					
					expr = make_methodcall(p, op, expr, t, args[..]);
				}
			}
			else
			{
				parser_error(p, "Expected arguemnt list after ':' operator");
			}
		}
		else if match_token(p, TokenKind.INCREMENT)
		{
			expr = make_incdec(p, op, expr, true);
		}
		else if match_token(p, TokenKind.DECREMENT)
		{
			expr = make_incdec(p, op, expr, true);
		}
		else
		{
			assert(false, "Bad code path!");
		}
	}
	
	return expr;
}

parse_unary :: proc(using p: ^Parser) -> ^Node
{
	is_unary := false;
	op := p.current_token;
	if is_token(p, []TokenKind{TokenKind.ADD, TokenKind.SUB, TokenKind.NOT, TokenKind.INCREMENT, TokenKind.DECREMENT})
	{
		is_unary = true;
		next_token(p);
	}
	
	rhs := parse_expr_base(p);
	if is_unary
	{
		if op.kind == TokenKind.INCREMENT || op.kind == TokenKind.DECREMENT
		{
			rhs = make_incdec(p, op, rhs, false);
		}
		else
		{
			rhs = make_unary(p, op, rhs);
		}
	}
	
	return rhs;
}

parse_expr_mul :: proc(using p: ^Parser) -> ^Node
{
	lhs := parse_unary(p);
	
	for is_token(p, []TokenKind{TokenKind.MUL, TokenKind.DIV, TokenKind.MOD})
	{
		op := p.current_token;
		next_token(p);
		rhs := parse_unary(p);
		
		lhs = make_binary(p, op, lhs, rhs);
	}
	
	return lhs;
}

parse_expr_add :: proc(using p: ^Parser) -> ^Node
{
	lhs := parse_expr_mul(p);
	
	for is_token(p, []TokenKind{TokenKind.ADD, TokenKind.SUB})
	{
		op := p.current_token;
		next_token(p);
		rhs := parse_expr_mul(p);
		
		lhs = make_binary(p, op, lhs, rhs);
	}
	
	return lhs;
}

parse_expr_equality :: proc(using p: ^Parser) -> ^Node
{
	lhs := parse_expr_add(p);
	
	for is_token(p, []TokenKind{TokenKind.EQUALS, TokenKind.NEQUALS, TokenKind.GT, TokenKind.LT, TokenKind.GTE, TokenKind.LTE})
	{
		op := p.current_token;
		next_token(p);
		rhs := parse_expr_add(p);
		
		lhs = make_binary(p, op, lhs, rhs);
	}
	
	return lhs;
}

parse_expr_land :: proc(using p: ^Parser) -> ^Node
{
	lhs := parse_expr_equality(p);
	
	for is_token(p, TokenKind.LAND)
	{
		op := p.current_token;
		next_token(p);
		rhs := parse_expr_equality(p);
		
		lhs = make_binary(p, op, lhs, rhs);
	}
	
	return lhs;
}

parse_expr_lor :: proc(using p: ^Parser) -> ^Node
{
	lhs := parse_expr_land(p);
	
	for is_token(p, TokenKind.LOR)
	{
		op := p.current_token;
		next_token(p);
		rhs := parse_expr_land(p);
		
		lhs = make_binary(p, op, lhs, rhs);
	}
	
	return lhs;
}

parse_expr :: proc(using p: ^Parser) -> ^Node
{
	return parse_expr_lor(p);
}

parse_var :: proc(using p: ^Parser) -> ^Node
{
	t := p.current_token;
	if match_token(p, TokenKind.VAR)
	{
		name := p.current_token;
		expect(p, TokenKind.IDENT);
		
		expr: ^Node = nil;
		if match_token(p, TokenKind.EQUAL)
		{
			expr = parse_expr(p);
		}
		expect(p, TokenKind.SEMICOLON);
		
		return make_var(p, t, name, expr);
	}
	else
	{
		assert(false, "Oops");
		return nil;
	}
}

parse_func :: proc(using p: ^Parser) -> ^Node
{
	func := p.current_token;
	if match_token(p, TokenKind.FUNC)
	{
		name := p.current_token.lexeme;
		if !match_token(p, TokenKind.IDENT)
		{
			parser_error(p, "Expected identifier after 'func'");
		}
		
		expect(p, TokenKind.LPAR);
		args: [dynamic][]rune;
		
		if !is_token(p, TokenKind.RPAR)
		{
			first := true;
			for first || match_token(p, TokenKind.COMMA)
			{
				if first do first = false;
				
				if is_token(p, TokenKind.IDENT)
				{
					append(&args, p.current_token.lexeme);
					next_token(p);
				}
				else
				{
					parser_error(p, "Expected identifier while parsing argument list got %v", p.current_token.kind);
				}
			}
		}
		expect(p, TokenKind.RPAR);
		
		block := parse_block(p);
		
		return make_func(p, func, name, args[..], block);
	}
	else
	{
		assert(false, "whoopsie!");
		return nil;
	}
}

parse_return :: proc(using p: ^Parser) -> ^Node
{
	ret := p.current_token;
	if match_token(p, TokenKind.RETURN)
	{
		expr: ^Node = nil;
		if !is_token(p, TokenKind.SEMICOLON)
		{
			expr = parse_expr(p);
		}
		expect(p, TokenKind.SEMICOLON);
		
		return make_return(p, ret, expr);
	}
	else
	{
		assert(false, "whoopsie");
		return nil;
	}
}

parse_continue :: proc(using p: ^Parser) -> ^Node
{
	con := p.current_token;
	if match_token(p, TokenKind.CONTINUE)
	{
		expect(p, TokenKind.SEMICOLON);
		
		return make_continue(p, con);
	}
	else
	{
		assert(false, "whoopsie");
		return nil;
	}
}

parse_break :: proc(using p: ^Parser) -> ^Node
{
	brea := p.current_token;
	if match_token(p, TokenKind.BREAK)
	{
		expect(p, TokenKind.SEMICOLON);
		
		return make_break(p, brea);
	}
	else
	{
		assert(false, "whoopsie");
		return nil;
	}
}

parse_if :: proc(using p: ^Parser) -> ^Node
{
	_if := p.current_token;
	if match_token(p, TokenKind.IF)
	{
		cond := parse_expr(p);
		block := parse_block(p);
		else_block: ^Node = nil;
		
		if match_token(p, TokenKind.ELSE)
		{
			if is_token(p, TokenKind.LBRACE)
			{
				else_block = parse_block(p);
			}
			else if is_token(p, TokenKind.IF)
			{
				else_block = parse_if(p);
			}
			else
			{
				parser_error(p, "Expected if or block after else");
			}
		}
		
		return make_if(p, _if, cond, block, else_block);
	}
	else
	{
		assert(false, "whoopsie");
		return nil;
	}
}

parse_while :: proc(using p: ^Parser) -> ^Node
{
	_while := p.current_token;
	if match_token(p, TokenKind.WHILE)
	{
		cond := parse_expr(p);
		block := parse_block(p);
		return make_while(p, _while, cond, block);
	}
	else
	{
		assert(false, "whoopsie");
		return nil;
	}
}

parse_block :: proc(using p: ^Parser) -> ^Node
{
	lbrace := p.current_token;
	if match_token(p, TokenKind.LBRACE)
	{
		stmts: [dynamic]^Node;
		for !is_token(p, TokenKind.RBRACE)
		{
			stmt: ^Node = nil;
			
			if is_token(p, TokenKind.IF)
			{
				stmt = parse_if(p);
			}
			else if is_token(p, TokenKind.VAR)
			{
				stmt = parse_var(p);
			}
			else if is_token(p, TokenKind.LBRACE)
			{
				stmt = parse_block(p);
			}
			else if is_token(p, TokenKind.RETURN)
			{
				stmt = parse_return(p);
			}
			else if is_token(p, TokenKind.CONTINUE)
			{
				stmt = parse_continue(p);
			}
			else if is_token(p, TokenKind.BREAK)
			{
				stmt = parse_break(p);
			}
			else if is_token(p, TokenKind.WHILE)
			{
				stmt = parse_while(p);
			}
			else if match_token(p, TokenKind.SEMICOLON)
			{
				continue;
			}
			else
			{
				expr := parse_expr(p);
				
				op := p.current_token;
				if match_token(p, TokenKind.EQUAL)
				{
					value := parse_expr(p);
					expect(p, TokenKind.SEMICOLON);
					stmt = make_assign(p, op, expr, value);
				}
				else
				{
					if expr.kind == NodeKind.CALL || expr.kind == NodeKind.METHODCALL || expr.kind == NodeKind.INCDEC
					{
						expect(p, TokenKind.SEMICOLON);
						stmt = expr;
					}
					else
					{
						parser_error(p, "Unexpected expression in block!");
					}
				}
			}
			
			append(&stmts, stmt);
		}
		expect(p, TokenKind.RBRACE);
		
		return make_block(p, lbrace, stmts[..]);
	}
	else
	{
		parser_error(p, "Expected %v got %v\n", TokenKind.LBRACE, lbrace.kind);
		return nil;
	}
}

parse :: proc(using p: ^Parser) -> []^Node
{
	nodes: [dynamic]^Node;

	for !is_token(p, TokenKind.EOF)
	{
		stmt: ^Node;
		
		if is_token(p, TokenKind.VAR)
		{
			stmt = parse_var(p);
		}
		else if is_token(p, TokenKind.FUNC)
		{
			stmt = parse_func(p);
		}
		else if is_token(p, TokenKind.SEMICOLON)
		{
			continue;
		}
		else
		{
			parser_error(p, "Unexpected token '%s'\n", p.current_token.kind);
		}
		
		append(&nodes, stmt);		
	}

	return nodes[..];
}