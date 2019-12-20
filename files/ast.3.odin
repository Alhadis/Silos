package badscript

import "core:fmt"

NodeKind :: enum
{
	NUMBER,
	NAME,
	STRING,
	BINARY,
	TRUE,
	FALSE,
	NULL,
	UNARY,
	INCDEC,
	INDEX,
	VAR,
	FUNC,
	BLOCK,
	RETURN,
	CONTINUE,
	BREAK,
	IF,
	WHILE,
	ASSIGN,
	CALL,
	METHODCALL,
	FIELD,
	ANONFUNC,
	TABLE,
}

TableEntryKind :: enum
{
	Normal,
	Key,
	Index,
}

TableEntry :: struct
{
	kind: TableEntryKind,
	expr: ^Node,
	key: ^Node,
}

Node :: struct
{
	kind: NodeKind,
	loc:  SourceLoc,
	using _ : struct #raw_union {
		number: struct {
			value: f64,
		},
		name: struct {
			name: []rune,
		},
		str: struct {
			str: []rune,
		},
		binary: struct {
			op: TokenKind,
			lhs: ^Node,
			rhs: ^Node,
		},
		unary: struct {
			op: TokenKind,
			expr: ^Node,
		},
		incdec: struct {
			op: TokenKind,
			post: bool,
			expr: ^Node,	
		},
		index: struct {
			expr: ^Node,
			index_expr: ^Node,	
		},
		_var: struct {
			name: []rune,
			expr: ^Node,
		},
		block: struct {
			stmts: []^Node,	
		},
		func: struct {
			name: []rune,
			args: [][]rune,
			block: ^Node,	
		},
		ret: struct {
			expr: ^Node,
		},
		_if: struct {
			cond: ^Node,
			block: ^Node,
			else_block: ^Node,
		},
		_while: struct {
			cond: ^Node,
			block: ^Node,	
		},
		assign: struct {
			lhs: ^Node,
			rhs: ^Node,	
		},
		call: struct {
			expr: ^Node,
			args: []^Node,
		},
		field: struct {
			expr: ^Node,
			name: []rune,
		},
		methodcall: struct {
			expr: ^Node,
			name: []rune,
			args: []^Node,
		},
		anonfunc: struct {
			args: [][]rune,
			block: ^Node,	
		},
		table: struct {
			entries: []TableEntry,
		},
	}
}

alloc_node :: proc(using p: ^Parser, kind: NodeKind) -> ^Node
{
	n := new(Node);
	n.kind = kind;
	//TODO: Add all nodes to a list of allocated nodes so that we can quickly free them all
	//      This we can free strings, etc.
	return n;
}

make_table :: proc(using p: ^Parser, loc: Token, entries: []TableEntry) -> ^Node
{
	n := alloc_node(p, NodeKind.TABLE);
	n.loc = loc.loc;
	
	n.table.entries = entries;
	return n;
}

make_anonfunc :: proc(using p: ^Parser, loc: Token, args: [][]rune, block: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.ANONFUNC);
	n.loc = loc.loc;
	
	n.anonfunc.args = args;
	n.anonfunc.block = block;
	return n;
}

make_methodcall :: proc(using p: ^Parser, loc: Token, expr: ^Node, name: Token, args: []^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.METHODCALL);
	n.loc = loc.loc;
	
	n.methodcall.expr = expr;
	n.methodcall.name = name.lexeme;
	n.methodcall.args = args;
	return n;
}

make_field :: proc(using p: ^Parser, loc: Token, name: Token, expr: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.FIELD);
	n.loc = loc.loc;
	
	n.field.expr = expr;
	n.field.name = name.lexeme;
	return n;	
}

make_call :: proc(using p: ^Parser, loc: Token, expr: ^Node, args: []^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.CALL);
	n.loc = loc.loc;
	
	n.call.expr = expr;
	n.call.args = args;
	return n;
}

make_assign :: proc(using p: ^Parser, loc: Token, expr: ^Node, value: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.ASSIGN);
	n.loc = loc.loc;
	
	n.assign.lhs = expr;
	n.assign.rhs = value;
	return n;
}

make_while :: proc(using p: ^Parser, loc: Token, cond: ^Node, block: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.WHILE);
	n.loc = loc.loc;
	
	n._while.cond = cond;
	n._while.block = block;
	return n;
}

make_if :: proc(using p: ^Parser, loc: Token, cond: ^Node, block: ^Node, else_block: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.IF);
	n.loc = loc.loc;
	
	n._if.cond = cond;
	n._if.block = block;
	n._if.else_block = else_block;
	return n;
}

make_break :: proc(using p: ^Parser, loc: Token) -> ^Node
{
	n := alloc_node(p, NodeKind.BREAK);
	n.loc = loc.loc;
	
	return n;
}

make_continue :: proc(using p: ^Parser, loc: Token) -> ^Node
{
	n := alloc_node(p, NodeKind.CONTINUE);
	n.loc = loc.loc;
	
	return n;
}

make_return :: proc(using p: ^Parser, loc: Token, expr: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.RETURN);
	n.loc = loc.loc;
	
	n.ret.expr = expr;
	return n;
}

make_func :: proc(using p: ^Parser, loc: Token, name: []rune, args: [][]rune, block: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.FUNC);
	n.loc = loc.loc;
	
	n.func.name = name;
	n.func.args = args;
	n.func.block = block;
	return n;
}

make_block :: proc(using p: ^Parser, loc: Token, stmts: []^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.BLOCK);
	n.loc = loc.loc;
	
	n.block.stmts = stmts;
	return n;
}

make_var :: proc(using p: ^Parser, loc: Token, name: Token, expr: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.VAR);
	n.loc = loc.loc;
	
	n._var.name = name.lexeme;
	n._var.expr = expr;
	return n;		
}

make_index :: proc(using p: ^Parser, loc: Token, expr: ^Node, index: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.INDEX);
	n.loc = loc.loc;
	
	n.index.expr = expr;
	n.index.index_expr = index;
	return n;
}

make_name :: proc(using p: ^Parser, loc: Token, lexeme: []rune) -> ^Node
{
	n := alloc_node(p, NodeKind.NAME);
	n.loc = loc.loc;
	
	n.name.name = lexeme;
	
	return n;
}

make_string :: proc(using p: ^Parser, loc: Token, lexeme: []rune) -> ^Node
{
	n := alloc_node(p, NodeKind.STRING);
	n.loc = loc.loc;
	
	n.str.str = lexeme;
	
	return n;
}

//TODO: FIXME: This is jank
foreign import clib "system:ucrt.lib";
foreign clib {
	strtod :: proc"c"(str: cstring, endptr: ^^u8) -> f64 ---;
}
import "core:unicode/utf8"
lexeme_to_cstring :: proc(lexeme: []rune) -> cstring
{
	bytes: [dynamic]u8;
	for r in lexeme
	{
		buffer, length := utf8.encode_rune(r);
		append(&bytes, ...buffer[..length]);
	}
	append(&bytes, 0);
	return cstring(&bytes[0]);
}

make_number :: proc(using p: ^Parser, loc: Token, lexeme: []rune) -> ^Node
{
	n := alloc_node(p, NodeKind.NUMBER);
	n.loc = loc.loc;
	
	n.number.value = strtod(cstring(lexeme_to_cstring(lexeme)), nil);
	
	return n;
}

make_null :: proc(using p: ^Parser, loc: Token) -> ^Node
{
	n := alloc_node(p, NodeKind.NULL);
	n.loc = loc.loc;
	return n;
}

make_true :: proc(using p: ^Parser, loc: Token) -> ^Node
{
	n := alloc_node(p, NodeKind.TRUE);
	n.loc = loc.loc;
	return n;
}

make_false :: proc(using p: ^Parser, loc: Token) -> ^Node
{
	n := alloc_node(p, NodeKind.FALSE);
	n.loc = loc.loc;
	return n;
}

make_binary :: proc(using p: ^Parser, op: Token, lhs, rhs: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.BINARY);
	n.loc = op.loc;
	
	n.binary.op = op.kind;
	n.binary.lhs = lhs;
	n.binary.rhs = rhs;
	return n;
}

make_unary :: proc(using p: ^Parser, op: Token, expr: ^Node) -> ^Node
{
	n := alloc_node(p, NodeKind.UNARY);
	n.loc = op.loc;

	n.unary.op = op.kind;
	n.unary.expr = expr;
	return n;
}

make_incdec :: proc(using p: ^Parser, op: Token, expr: ^Node, post: bool) -> ^Node
{
	n := alloc_node(p, NodeKind.INCDEC);
	n.loc = op.loc;
	
	n.incdec.op = op.kind;
	n.incdec.expr = expr;
	n.incdec.post = post;
	return n;
}