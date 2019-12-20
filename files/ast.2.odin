package koi

import "core:strconv"
import "core:strings"

Node :: struct {
	loc: Location,
	kind: any,
}

NodeNull  :: struct {using node: Node}
NodeTrue  :: struct {using node: Node}
NodeFalse :: struct {using node: Node}

NodeIdent :: struct {
	using node: Node,
	name: string,
}

NodeNumber :: struct {
	using node: Node,
	value: f64,
}

NodeString :: struct {
	using node: Node,
	value: string,
}

NodeIndex :: struct {
	using node: Node,
	expr: ^Node,
	index: ^Node,
}

NodeField :: struct {
	using node: Node,
	expr: ^Node,
	field: ^Node,
}

NodeCall :: struct {
	using node: Node,
	expr: ^Node,
	args: [dynamic]^Node,
}

NodeBinary :: struct {
	using node: Node,
	op: TokenType,
	lhs, rhs: ^Node,
}

NodeUnary :: struct {
	using node: Node,
	op: TokenType,
	expr: ^Node,
}

NodeAssignment :: struct {
	using node: Node,
	op: TokenType,
	lhs: ^Node,
	rhs: ^Node,
}

NodeBlock :: struct {
	using node: Node,
	stmts: [dynamic]^Node,
}

NodeVariableDecl :: struct {
	using node: Node,
	name: string,
	expr: ^Node,
}

NodeFn :: struct {
	using node: Node,
	name: string,
	args: [dynamic]string,
	last_is_vararg: bool,
	block: ^Node,
}

NodeIf :: struct {
	using node: Node,
	cond: ^Node,
	block: ^Node,
	else_: ^Node,
}

NodeForType :: enum {
	Expr,
	InExpr,
	Forever,
}

NodeFor :: struct {
	using node: Node,
	forkind: NodeForType,
	expr: ^Node,
	inexpr: ^Node,
	block: ^Node,
}

NodeWhile :: struct {
	using node: Node,
	cond: ^Node,
	block: ^Node,
}

NodeReturn :: struct {
	using node: Node,
	expr: ^Node,
}

NodeImport :: struct {
	using node: Node,
	name: string,
}

NodeTableLiteralEntry :: struct {
	name: ^Node,
	expr: ^Node,
}

NodeTableLiteral :: struct {
	using node: Node,
	entries: [dynamic]NodeTableLiteralEntry,
}

NodeArrayLiteral :: struct {
	using node: Node,
	entries: [dynamic]^Node,
}

NodePrint :: struct {
	using node: Node,
	args: [dynamic]^Node,
}

NodeLen :: struct {
	using node: Node,
	expr: ^Node,
}

NodeFnExpr :: struct {
	using node: Node,
	args: [dynamic]string,
	last_is_vararg: bool,
	block: ^Node,
}

NodeSelfCall :: struct {
	using node: Node,
	expr: ^Node,
	args: [dynamic]^Node,
}

new_node :: proc(parser: ^Parser, $T: typeid) -> ^T {
	n := new(T);
	n.kind = n^;
	return n;
}

make_ident :: proc(parser: ^Parser, t: Token) -> ^NodeIdent {
	n := new_node(parser, NodeIdent);
	n.loc = t.loc;
	n.name = strings.new_string(t.lexeme);
	return n;
}

make_number :: proc(parser: ^Parser, t: Token) -> ^NodeNumber {
	n := new_node(parser, NodeNumber);
	n.loc = t.loc;
	n.value = strconv.parse_f64(t.lexeme);
	return n;
}

make_string :: proc(parser: ^Parser, t: Token) -> ^NodeString {
	n := new_node(parser, NodeString);
	n.loc = t.loc;
	//n.value = strings.new_string(t.lexeme);
	n.value = unquote_string(parser, t.loc, t.lexeme);
	return n;
}

make_string_from_string :: proc(parser: ^Parser, t: Token, str: string) -> ^NodeString {
	n := new_node(parser, NodeString);
	n.loc = t.loc;
	// n.value = str;
	n.value = unquote_string(parser, t.loc, str);
	return n;
}

make_index :: proc(parser: ^Parser, op: Token, expr: ^Node, index: ^Node) -> ^NodeIndex {
	n := new_node(parser, NodeIndex);
	n.loc = op.loc;
	n.expr = expr;
	n.index = index;
	return n;
}

make_field :: proc(parser: ^Parser, op: Token, expr: ^Node, field: Token) -> ^NodeField {
	n := new_node(parser, NodeField);
	n.loc = op.loc;
	n.expr = expr;
	n.field = make_string_from_string(parser, field, strings.new_string(field.lexeme));
	return n;
}

make_call :: proc(parser: ^Parser, loc: Token, expr: ^Node, args: [dynamic]^Node) -> ^NodeCall {
	n := new_node(parser, NodeCall);
	n.loc = loc.loc;
	n.expr = expr;
	n.args = args;
	return n;
}

make_binary :: proc(parser: ^Parser, op: Token, lhs, rhs: ^Node) -> ^NodeBinary {
	n := new_node(parser, NodeBinary);
	n.loc = op.loc;
	n.lhs = lhs;
	n.rhs = rhs;
	n.op = op.kind;
	return n;
}

make_unary :: proc(parser: ^Parser, op: Token, expr: ^Node) -> ^NodeUnary {
	n := new_node(parser, NodeUnary);
	n.loc = op.loc;
	n.expr = expr;
	n.op = op.kind;
	return n;
}

make_assignment :: proc(parser: ^Parser, op: Token, lhs, rhs: ^Node) -> ^NodeAssignment {
	n := new_node(parser, NodeAssignment);
	n.loc = op.loc;
	n.op = op.kind;
	n.lhs = lhs;
	n.rhs = rhs;
	return n;
}

make_block :: proc(parser: ^Parser, t: Token, stmts: [dynamic]^Node) -> ^NodeBlock {
	n := new_node(parser, NodeBlock);
	n.loc = t.loc;
	n.stmts = stmts;
	return n;
}

make_variable_decl :: proc(parser: ^Parser, op: Token, expr: ^Node) -> ^NodeVariableDecl {
	n := new_node(parser, NodeVariableDecl);
	n.loc = op.loc;
	n.expr = expr;
	n.name = strings.new_string(op.lexeme);
	return n;
}

make_variable_decl_named :: proc(parser: ^Parser, t: Token, name: string, expr: ^Node) -> ^NodeVariableDecl {
	n := new_node(parser, NodeVariableDecl);
	n.loc = t.loc;
	n.name = name;
	n.expr = expr;
	return n;
}

make_fn :: proc(parser: ^Parser, fn: Token, name: Token, args: [dynamic]string, last_is_vararg: bool, block: ^Node) -> ^NodeFn {
	n := new_node(parser, NodeFn);
	n.loc = fn.loc;
	n.name = strings.new_string(name.lexeme);
	n.args = args;
	n.last_is_vararg = last_is_vararg;
	n.block = block;
	return n;
}

make_if :: proc(parser: ^Parser, t: Token, cond: ^Node, block: ^Node, else_: ^Node) -> ^NodeIf {
	n := new_node(parser, NodeIf);
	n.loc = t.loc;
	n.cond = cond;
	n.block = block;
	n.else_ = else_;
	return n;
}

make_for_infinite :: proc(parser: ^Parser, t: Token, block: ^Node) -> ^NodeFor {
	n := new_node(parser, NodeFor);
	n.loc = t.loc;
	n.forkind = NodeForType.Forever;
	n.block = block;
	return n;
}

make_for_expr :: proc(parser: ^Parser, t: Token, expr: ^Node, block: ^Node) -> ^NodeFor {
	n := new_node(parser, NodeFor);
	n.loc = t.loc;
	n.forkind = NodeForType.Expr;
	n.expr = expr;
	n.block = block;
	return n;
}

make_for_inexpr :: proc(parser: ^Parser, t: Token, expr: ^Node, inexpr: ^Node, block: ^Node) -> ^NodeFor {
	n := new_node(parser, NodeFor);
	n.loc = t.loc;
	n.forkind = NodeForType.InExpr;
	n.expr = expr;
	n.inexpr = inexpr;
	n.block = block;
	return n;
}

make_return :: proc(parser: ^Parser, t: Token, expr: ^Node) -> ^NodeReturn {
	n := new_node(parser, NodeReturn);
	n.loc = t.loc;
	n.expr = expr;
	return n;
}

make_import :: proc(parser: ^Parser, t: Token, name: Token) -> ^NodeImport {
	n := new_node(parser, NodeImport);
	n.loc = t.loc;
	n.name = strings.new_string(name.lexeme);
	return n;
}

make_table_literal :: proc(parser: ^Parser, t: Token, entries: [dynamic]NodeTableLiteralEntry) -> ^NodeTableLiteral {
	n := new_node(parser, NodeTableLiteral);
	n.loc = t.loc;
	n.entries = entries;
	return n;
}

make_array_literal :: proc(parser: ^Parser, t: Token, entries: [dynamic]^Node) -> ^NodeArrayLiteral{
	n := new_node(parser, NodeArrayLiteral);
	n.loc = t.loc;
	n.entries = entries;
	return n;	
}

make_print :: proc(parser: ^Parser, t: Token, args: [dynamic]^Node) -> ^NodePrint {
	n := new_node(parser, NodePrint);
	n.loc = t.loc;
	n.args = args;
	return n;
}

make_len :: proc(parser: ^Parser, t: Token, expr: ^Node) -> ^NodeLen {
	n := new_node(parser, NodeLen);
	n.loc = t.loc;
	n.expr = expr;
	return n;
}

make_fn_expr :: proc(parser: ^Parser, t: Token, args: [dynamic]string, last_is_vararg: bool, block: ^Node) -> ^NodeFnExpr {
	n := new_node(parser, NodeFnExpr);
	n.loc = t.loc;
	n.args = args;
	n.last_is_vararg = last_is_vararg;
	n.block = block;
	return n;	
}

make_selfcall :: proc(parser: ^Parser, t: Token, field: ^Node, args:[dynamic]^Node) -> ^NodeSelfCall {
	n := new_node(parser, NodeSelfCall);
	n.loc = t.loc;
	n.expr = field;
	n.args = args;
	return n;
}

make_null :: proc(parser: ^Parser, t: Token) -> ^NodeNull {
	n := new_node(parser, NodeNull);
	n.loc = t.loc;
	return n;
}

make_true :: proc(parser: ^Parser, t: Token) -> ^NodeTrue {
	n := new_node(parser, NodeTrue);
	n.loc = t.loc;
	return n;
}

make_false :: proc(parser: ^Parser, t: Token) -> ^NodeFalse {
	n := new_node(parser, NodeFalse);
	n.loc = t.loc;
	return n;
}
