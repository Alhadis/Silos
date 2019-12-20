package calc

import "core:os"
import "core:fmt"
import "core:mem"
import "core:math"
import "core:sort"
import "core:strings"
import "core:strconv"
import "core:unicode/utf8"

// Don't mind me

_string_buffer: [4096]u8;

when ODIN_OS == "windows" {
	foreign import libc "system:libcmt.lib";
	foreign libc {
		gets_s :: proc"c"(buffer: ^u8, size: i32) -> cstring ---;
	}
	read_line :: proc() -> string {
		cstr := gets_s(&_string_buffer[0], i32(len(_string_buffer)));
		return cast(string) cstr;
	}
}
else when ODIN_OS == "linux" {
	foreign import libc "system:c";
	foreign libc {
		stdin: rawptr;
		fgets :: proc"c"(buffer: ^u8, size: i32, stream: /* FILE* */ rawptr) -> cstring ---;
	}
	read_line :: proc() -> string {
		cstr := fgets(&_string_buffer[0], i32(len(_string_buffer)), stdin);
		return cast(string) cstr;
	}
}
else do #assert(false, "I need libc");

Value :: union {
	f64,
	Value_Vector,
	Value_Function,
	Value_User_Function,
	Value_Error,
}

Function_Proc :: #type proc(args: []f64) -> f64;
Value_Function :: struct {
	args: int,
	desc: string,
	proc_ptr: Function_Proc,
}

Value_User_Function :: struct {
	args: []string,
	expr: ^Expr,
}

Value_Vector :: struct {
	elements: [dynamic]Value,
}

Value_Error :: struct {
	msg: string,
}

State :: struct {
	parent: ^State,
	variables: map[string]Value,
}

Scope :: struct {
	
}

New_State :: struct {

}

Parser :: struct {
	data: string,
	offset: int,
	current_rune: rune,
	current_rune_offset: int,
	current_token: Token,
	expressions: [dynamic]^Expr,

	error: bool,
	error_msg: string,
	error_msg_buffer: [4096]u8,
}

Location :: struct {
	start, end: int,
}

Token_Kinds :: distinct bit_set[Token_Kind];
Token_Kind :: enum {
	Ident,
	Number,
	LeftPar,
	RightPar,
	Plus,
	Minus,
	Slash,
	Asterisk,
	Hat,
	Equal,
	Comma,
	Mod,
	At,
	LeftBracket,
	RightBracket,
	LeftBrace,
	RightBrace,

	Eof,
}

get_human_readable_token_name :: proc(kind: Token_Kind) -> string {
	using Token_Kind;
	switch kind {
	case Ident:        return "identifier";
	case Number:       return "number";
	case LeftPar:      return "(";
	case RightPar:     return ")";
	case Plus:         return "+";
	case Minus:        return "-";
	case Slash:        return "/";
	case Asterisk:     return "*";
	case Hat:          return "^";
	case Equal:        return "=";
	case Comma:        return ",";
	case Mod:          return "%";
	case At:           return "@";
	case LeftBracket:  return "[";
	case RightBracket: return "]";
	case LeftBrace:    return "{";
	case RightBrace:   return "}";
	case Eof:          return "end of input";
	case: panic("missing human readable token kind"); return "(missing name)";
	}
}

Token :: struct {
	kind: Token_Kind,
	lexeme: string,
}

Expr :: struct {
	loc: Location,
	derived: union {
		Expr_Bad,
		Expr_Number,
		Expr_Ident,
		Expr_Binary,
		Expr_Assign,
		Expr_Call,
		Expr_Function,
		Expr_Vector,
		Expr_Index,
		Expr_Unary,
	},
}

Expr_Bad :: struct {
	using base: ^Expr,
}

Expr_Number :: struct {
	using base: ^Expr,
	value: f64,
}

Expr_Ident :: struct {
	using base: ^Expr,
	name: string,
}

Expr_Binary :: struct {
	using base: ^Expr,
	op: Token_Kind,
	lhs: ^Expr,
	rhs: ^Expr,
}

Expr_Assign :: struct {
	using base: ^Expr,
	lhs: ^Expr,
	rhs: ^Expr,
}

Expr_Call :: struct {
	using base: ^Expr,
	expr: ^Expr,
	args: []^Expr,
}

Expr_Function :: struct {
	using base: ^Expr,
	args: []string,
	expr: ^Expr,
}

Expr_Vector :: struct {
	using base: ^Expr,
	elements: [dynamic]^Expr,
}

Expr_Index :: struct {
	using base: ^Expr,
	expr: ^Expr,
	index: ^Expr,
}

Expr_Unary :: struct {
	using base: ^Expr,
	op: Token_Kind,
	expr: ^Expr,
}

new_expr :: proc(parser: ^Parser, $T: typeid) -> ^T {
	e := new(Expr); //TODO: Use parser.allocator
	e.derived = T{base = e};
	append(&parser.expressions, e);
	return &e.derived.(T);
}

next_rune :: proc(using parser: ^Parser) -> rune {
	current_rune_offset = offset;
	r, i := utf8.decode_rune_in_string(data[offset:]);

	//fmt.printf("'%r'\n", r);
	if i == 0 {
		current_rune = 0;
		return current_rune;
	}

	offset += i;
	current_rune = r;
	return current_rune;
}

read_token :: proc(using parser: ^Parser) -> Token {
	using Token_Kind;

	switch current_rune {
	case ' ':  next_rune(parser); return read_token(parser);		
	case '\n': next_rune(parser); return read_token(parser);
	case 0:    next_rune(parser); return Token{kind = Eof};

	case '+':  next_rune(parser); return Token{kind = Plus};
	case '-':  next_rune(parser); return Token{kind = Minus};
	case '*':  next_rune(parser); return Token{kind = Asterisk};
	case '/':  next_rune(parser); return Token{kind = Slash};
	case '^':  next_rune(parser); return Token{kind = Hat};
	case '(':  next_rune(parser); return Token{kind = LeftPar};
	case ')':  next_rune(parser); return Token{kind = RightPar};
	case '[':  next_rune(parser); return Token{kind = LeftBracket};
	case ']':  next_rune(parser); return Token{kind = RightBracket};
	case '{':  next_rune(parser); return Token{kind = LeftBrace};
	case '}':  next_rune(parser); return Token{kind = RightBrace};
	case '=':  next_rune(parser); return Token{kind = Equal};
	case ',':  next_rune(parser); return Token{kind = Comma};
	case '%':  next_rune(parser); return Token{kind = Mod};
	case '@':  next_rune(parser); return Token{kind = At};

	case '0'..'9':
		start := current_rune_offset;
		next_rune(parser);
		found_dot := false;

		for (current_rune >= '0' && current_rune <= '9') || current_rune == '.' {
			if current_rune == '.' {
				if found_dot {
					break;
				} else {
					found_dot = true;
				}
			}
			next_rune(parser);
		}

		return Token{kind = Number, lexeme = data[start:current_rune_offset]};
	case 'a'..'z', 'A'..'Z':
		start := current_rune_offset;
		next_rune(parser);

		for (current_rune >= 'a' && current_rune <= 'z') || (current_rune >= 'A' && current_rune <= 'Z') || (current_rune >= '0' && current_rune <= '9') {
			next_rune(parser);
		}

		//fmt.printf("Ident: '%v'\n", data[start:current_rune_offset]);

		return Token{kind = Ident, lexeme = data[start:current_rune_offset]};
	}

	//fmt.panicf("Unknown character: '%r'/%d", current_rune, current_rune);
	error = true;
	error_msg = fmt.bprintf(error_msg_buffer[:], "error: unexpected character: '%r'/%d", current_rune, current_rune);
	return {kind = Eof};
}

next_token :: proc(using parser: ^Parser) -> Token {
	current_token = read_token(parser);
	//fmt.printf("parsed token: %v\n", current_token);
	return current_token;
}

parse_operand :: proc(using parser: ^Parser) -> ^Expr {
	using Token_Kind;

	switch current_token.kind {
	case Number:
		e := new_expr(parser, Expr_Number);
		e.value = strconv.parse_f64(current_token.lexeme);

		next_token(parser);
		return e;
	case Ident:
		e := new_expr(parser, Expr_Ident);
		e.name = strings.new_string(current_token.lexeme);
		
		next_token(parser);
		return e;
	case LeftBracket:
		next_token(parser);

		elements: [dynamic]^Expr;
		if current_token.kind != RightBracket {
			for {
				append(&elements, parse_expr(parser));

				if current_token.kind == RightBracket {
					break;
				}
			}
		}
		next_token(parser); // eat ']'

		vec := new_expr(parser, Expr_Vector);
		vec.elements = elements;
		return vec;
	case LeftPar:
		next_token(parser);

		e := parse_expr(parser);
		if current_token.kind != RightPar {
			error = true;
			error_msg = fmt.bprintf(error_msg_buffer[:], "error: mismateched parentheses");
			return new_expr(parser, Expr_Bad);
		}
		next_token(parser);
		return e;
	case At:
		next_token(parser);

		if current_token.kind != LeftPar {
			error = true;
			error_msg = fmt.bprintf(error_msg_buffer[:], "error: expected '(' after '@'");
			return new_expr(parser, Expr_Bad);
		}
		next_token(parser);

		args: [dynamic]string;
		if current_token.kind != RightPar {
			for {
				if current_token.kind != Ident {
					error = true;
					error_msg = fmt.bprintf(error_msg_buffer[:], "error: expected identifiers, got '%v'", get_human_readable_token_name(current_token.kind));
					return new_expr(parser, Expr_Bad);
				}
				append(&args, strings.new_string(current_token.lexeme));
				next_token(parser);

				if current_token.kind == RightPar {
					break;
				}

				if current_token.kind == Comma {
					next_token(parser);
					continue;
				}

				error = true;
				error_msg = fmt.bprintf(error_msg_buffer[:], "error: expected ',', got '%v'", get_human_readable_token_name(current_token.kind));
				return new_expr(parser, Expr_Bad);
			}
		}
		next_token(parser);

		fn := new_expr(parser, Expr_Function);
		fn.args = args[:];
		fn.expr = parse_expr(parser);

		return fn;
	case:
		error = true;
		error_msg = fmt.bprintf(error_msg_buffer[:], "error: unexpected '%v'", get_human_readable_token_name(current_token.kind));
		next_token(parser);
		return new_expr(parser, Expr_Bad);
	}

	panic("DASDS");
	return nil;
}

parse_base :: proc(using parser: ^Parser) -> ^Expr {
	lhs := parse_operand(parser);

	using Token_Kind;
	for (current_token.kind in Token_Kinds{LeftPar, LeftBrace}) {
		switch current_token.kind {
		case LeftBrace:
			// expr{
			next_token(parser);

			index_expr := parse_expr(parser);

			if current_token.kind != RightBrace {
				error = true;
				error_msg = fmt.bprintf(error_msg_buffer[:], "error: expected '}', got '%v'", get_human_readable_token_name(current_token.kind));
				next_token(parser);
				return new_expr(parser, Expr_Bad);
			}
			next_token(parser);

			index := new_expr(parser, Expr_Index);
			index.expr = lhs;
			index.index = index_expr;
			lhs = index;
		case LeftPar:
			// expr(
			next_token(parser);

			args: [dynamic]^Expr;
			if current_token.kind != RightPar {
				for {
					append(&args, parse_expr(parser));

					if current_token.kind == RightPar {
						break;
					}

					if current_token.kind == Comma {
						next_token(parser);
						continue;
					}

					error = true;
					error_msg = fmt.bprintf(error_msg_buffer[:], "error: expected ',', got '%v'", get_human_readable_token_name(current_token.kind));
					return new_expr(parser, Expr_Bad);
				}
			}
			next_token(parser); // Eat ')'

			call := new_expr(parser, Expr_Call);
			call.expr = lhs;
			call.args = args[:];
			lhs = call;
		}
	}

	return lhs;
}

parse_unary :: proc(using parser: ^Parser) -> ^Expr {
	op := current_token;
	is_unary := false;

	using Token_Kind;
	if (op.kind in Token_Kinds{Plus, Minus}) {
		is_unary = true;
		next_token(parser);
	}

	expr: ^Expr = nil;
	if is_unary {
		expr = parse_unary(parser);
	} else {
		expr = parse_base(parser);
	}

	if is_unary {
		unary := new_expr(parser, Expr_Unary);
		unary.op   = op.kind;
		unary.expr = expr;
		expr = unary;
	}

	return expr;
}

parse_exp :: proc(using parser: ^Parser) -> ^Expr {
	lhs := parse_unary(parser);

	using Token_Kind;
	for (current_token.kind in Token_Kinds{Hat}) {
		op := current_token;
		next_token(parser);

		rhs := parse_unary(parser);
		bin := new_expr(parser, Expr_Binary);
		bin.op = op.kind;
		bin.lhs = lhs;
		bin.rhs = rhs;

		lhs = bin;
	}

	return lhs;
}

parse_mul :: proc(using parser: ^Parser) -> ^Expr {
	lhs := parse_exp(parser);

	using Token_Kind;
	for (current_token.kind in Token_Kinds{Asterisk, Slash, Mod}) {
		op := current_token;
		next_token(parser);

		rhs := parse_exp(parser);
		bin := new_expr(parser, Expr_Binary);
		bin.op = op.kind;
		bin.lhs = lhs;
		bin.rhs = rhs;

		lhs = bin;
	}

	return lhs;
}

parse_plus_minus :: proc(using parser: ^Parser) -> ^Expr {
	lhs := parse_mul(parser);

	using Token_Kind;
	for (current_token.kind in Token_Kinds{Plus, Minus}) {
		op := current_token;
		next_token(parser);

		rhs := parse_mul(parser);
		bin := new_expr(parser, Expr_Binary);
		bin.op = op.kind;
		bin.lhs = lhs;
		bin.rhs = rhs;

		lhs = bin;
	}

	return lhs;
}

parse_assign :: proc(using parser: ^Parser) -> ^Expr {
	lhs := parse_plus_minus(parser);

	if current_token.kind == Token_Kind.Equal {
		next_token(parser);
		rhs := parse_plus_minus(parser);
		assign := new_expr(parser, Expr_Assign);
		assign.lhs = lhs;
		assign.rhs = rhs;

		lhs = assign;
	}

	return lhs;
}

parse_expr :: proc(using parser: ^Parser) -> ^Expr {
	return parse_assign(parser);
}

init_parser_string :: proc(using parser: ^Parser, str: string) {
	// Remove this when we use the allocator
	for v in parser.expressions {
		// free(v); // Well this was fucking stupid wasnt it
	}
	clear(&parser.expressions);

	data = str;
	offset = 0;
	current_rune = 0;
	current_rune_offset = 0;
	error = false;
	next_rune(parser); // Setup first rune
	next_token(parser);
}

eval_expr :: proc(state: ^State, expr: ^Expr) -> Value {
	using Token_Kind;

	#complete switch e in expr.derived {
	case Expr_Bad:
		panic("eval_expr: Expr_Bad");
	case Expr_Function:
		return Value_User_Function{args = e.args, expr = e.expr};
	case Expr_Number:
		return e.value;
	case Expr_Vector:
		els: [dynamic]Value;
		for e in e.elements {
			append(&els, eval_expr(state, e));
		}
		return Value_Vector{elements = els};
	case Expr_Unary:
		rhs := eval_expr(state, e.expr).(f64);

		switch e.op {
		case Plus:	   return +rhs;
		case Minus:    return -rhs;
		case: panic("Unimplemented oprator");
		}
	case Expr_Binary:
		// Report error if lhs and rhs are not f64
		lhs := eval_expr(state, e.lhs).(f64);
		rhs := eval_expr(state, e.rhs).(f64);

		switch e.op {
		case Plus:	   return lhs + rhs;
		case Minus:    return lhs - rhs;
		case Slash:    return lhs / rhs;
		case Asterisk: return lhs * rhs;
		case Mod:      return math.mod(lhs, rhs);
		case Hat:      return math.pow(lhs, rhs);
		case: panic("Unimplemented oprator");
		}
	case Expr_Index:
		base := eval_expr(state, e.expr);
		switch v in base {
		case Value_Vector:
		case:
			//fmt.printf("  error: cannot index %v\n", v);
			return Value_Error{msg = fmt.aprintf("error: cannot index %v", v)}; //TODO: LEAK
			//return 0;
		}

		index := eval_expr(state, e.index);
		switch v in index {
		case f64:
		case:
			// Print the actual value?
			//fmt.printf("  error: %v is not a valid index\n", v);
			return Value_Error{msg = fmt.aprintf("error: %v is not a valid index", v)}; //TODO: LEAK
		}

		vec := base.(Value_Vector);
		index_v := index.(f64);
		index_i := int(index_v);
		if index_i < 0 || index_i >= len(vec.elements) {
			//fmt.printf("  error: index out of bounds %v\n", index_i);
			return Value_Error{msg = fmt.aprintf("error: index out of bounds %v", index_i)}; //TODO: LEAK
		}

		return base.(Value_Vector).elements[index_i];
	case Expr_Ident:
		//fmt.printf("ident: '%v'\n", e.name);
		v, found := get_variable(state, e.name);
		if found {
			return v;
		} else {
			//fmt.printf("v: '%v'\n", e.name);
			//panic("unknown var//TODO: error");
			return Value_Error{msg = fmt.aprintf("error: unknown variable %v", e.name)}; //TODO: LEAK
		}
		panic("TODO");
	case Expr_Assign:
		ident, ok := e.lhs.derived.(Expr_Ident);
		if !ok {
			//fmt.printf("lhs: %#v\n", e.lhs.derived);
			//panic("Can only assign to identifiers");
			return Value_Error{msg = fmt.aprintf("error: cannot assign to %v", e.lhs.derived)}; //TODO: LEAK
		}

		//fmt.printf("assign: '%v'\n", ident.name);
		v := eval_expr(state, e.rhs);
		set_variable(state, ident.name, v);
		return v;
	case Expr_Call:
		base := eval_expr(state, e.expr);

		switch fn in base {
		case Value_Function:
			args: [dynamic]f64;
			defer delete(args);

			for expr_arg in e.args {
				val := eval_expr(state, expr_arg).(f64);
				append(&args, val);
			}
			result := fn.proc_ptr(args[:]);

			return result;
		case Value_User_Function:
			args: [dynamic]Value;
			defer delete(args);

			for expr_arg in e.args {
				append(&args, eval_expr(state, expr_arg));
			}

			expr_state := new(State);
			defer free(expr_state);
			expr_state.parent = state; // Do we really want to inherit these variables
			for v, i in fn.args {
				expr_state.variables[v] = args[i];
			}

			//fmt.printf("v is %v\n", fn.expr^);
			result := eval_expr(expr_state, fn.expr);

			return result;
		case:
			//fmt.printf("    error: cannot call %v\n", fn);
			//return 0;
			return Value_Error{msg = fmt.aprintf("error: %v is not a function", fn)};
		}
	}

	fmt.printf("%v\n", expr.derived);

	panic("Invalid code path");
	return -123456;
}

set_variable :: proc(state: ^State, name: string, v: Value) {
	state.variables[name] = v;
}

get_variable :: proc(state: ^State, name: string) -> (Value, bool) {
	if state == nil do return nil, false;

	v, ok := state.variables[name];
	if ok {
		return v, true;
	} else {
		return get_variable(state.parent, name);
	}
}

print_expr :: proc(expr: ^Expr) {
	#complete switch e in expr.derived {
	case Expr_Bad:
		panic("print_expr: Expr_Bad");
	case Expr_Number:
		fmt.printf("%v", e.value);
	case Expr_Ident:
		fmt.printf("%v", e.name);
	case Expr_Vector:
		fmt.printf("[");
		if len(e.elements) > 0 {
			print_expr(e.elements[0]);
			if len(e.elements) > 1 {
				for i := 1; i < len(e.elements); i += 1 {
					fmt.printf("  ");
					print_expr(e.elements[i]);
				}
			}
		}
		fmt.printf("]");
	case Expr_Index:
		print_expr(e.expr);
		fmt.printf("{");
		print_expr(e.index);
		fmt.printf("}");
	case Expr_Unary:
		rhs_is_basic := false;
		switch e in e.expr.derived {
		case Expr_Ident, Expr_Number:
			rhs_is_basic = true;
		}
		
		using Token_Kind;
		switch e.op {
		case Plus:     fmt.printf("+");
		case Minus:    fmt.printf("-");
		}

		if !rhs_is_basic do fmt.printf("(");
		print_expr(e.expr);
		if !rhs_is_basic do fmt.printf(")");

	case Expr_Binary:
		print_expr(e.lhs);

		rhs_is_basic := false;
		switch e in e.rhs.derived {
		case Expr_Ident, Expr_Number:
			rhs_is_basic = true;
		}
		
		using Token_Kind;
		switch e.op {
		case Plus:     fmt.printf(" + ");
		case Minus:    fmt.printf(" - ");
		case Asterisk: fmt.printf("*");
		case Slash:    fmt.printf("/");
		case Mod:      fmt.printf("%");
		case Hat:
			fmt.printf("^");
			if !rhs_is_basic do fmt.printf("(");
		}
		print_expr(e.rhs);
		if e.op == Hat && !rhs_is_basic do fmt.printf(")");

	case Expr_Assign:
		print_expr(e.lhs);
		fmt.printf(" = ");
		print_expr(e.rhs);
	case Expr_Call:
		print_expr(e.expr);
		fmt.printf("(");
		for v in e.args {
			print_expr(v);
		}
		fmt.printf(")");
	case Expr_Function:
		fmt.printf("@(");
		if len(e.args) > 0 {
			fmt.printf("%v", e.args[0]);
			if len(e.args) > 1 {
				for i := 1; i < len(e.args); i += 1 {
					fmt.printf(", %v", e.args[i]);
				}
			}
		}
		fmt.printf(") ");
		print_expr(e.expr);
	}
}

print_welcome :: proc() {
	fmt.printf("ocalc - by thebirk\n\ntype '.help' for more information\n");
}

print_help :: proc() {
	fmt.printf("  .help/.h     - Prints this message (duh)\n");
	fmt.printf("  .quit/.q     - Quits the application\n");
	fmt.printf("  .vars/.v     - Lists all variables and their values\n");
	fmt.printf("  .clear/.cls  - Clears the screen\n");
}

print_value :: proc(value: Value) {
	#complete switch v in value {
	case f64:
		fmt.printf("%.8v", v);
	case Value_Vector:
		fmt.printf("[");
		if len(v.elements) > 0 {
			fmt.printf("%v", v.elements[0]);
			if len(v.elements) > 1 {
				for i := 1; i < len(v.elements); i += 1 {
					fmt.printf("  ");
					print_value(v.elements[i]);
				}
			}
		}
		fmt.printf("]");
	case Value_Function:
		if v.args == 1 {
			fmt.printf("[native, %d argument]  %s", v.args, v.desc);
		} else {
			fmt.printf("[native, %d arguments] %s", v.args, v.desc);
		}
	case Value_User_Function:
		fmt.printf("@(");
		if len(v.args) > 0 {
			fmt.printf("%v", v.args[0]);
			if len(v.args) > 1 {
				for i := 1; i < len(v.args); i += 1 {
					fmt.printf(", %v", v.args[i]);
				}
			}
		}
		fmt.printf(") ");
		print_expr(v.expr);
	case Value_Error:
		fmt.printf("\e[91m%v\e[0m", v.msg);
	}
}

print_all_vars :: proc(state: ^State) {
	longest_var := 0;
	for k, _ in state.variables {
		if len(k) > longest_var do longest_var = len(k);
	}
	print_values_of_type :: proc(state: ^State, $T: typeid, longest_var: int) -> (result: int) {
		all_values: [dynamic]string;
		defer delete(all_values);

		for k, v in state.variables {
			switch type in v {
			case T:
				append(&all_values, k);
			}
		}

		sort.quick_sort_proc(all_values[:], proc(a, b: string) -> int {
			num_digits :: proc(s: string) -> int {
				count := 0;
				for r in s {
					if !(r >= '0' && r <= '9') do break;
					count += 1;
				}
				return count;
			}

			na := num_digits(a);
			nb := num_digits(b);



			return 0;
		});

		for k in all_values {
			fmt.printf("  %v: ", k);
			padding := longest_var - len(k);
			for i in 0..padding-1 {
				fmt.printf(" ");
			}
			print_value(state.variables[k]);
			fmt.printf("\n");
		}

		result = len(all_values);
		return;
	}

	if print_values_of_type(state, Value_Function, longest_var) > 0 {
		fmt.printf("\n");
	}

	if print_values_of_type(state, Value_User_Function, longest_var) > 0 {
		fmt.printf("\n");
	}

	print_values_of_type(state, Value_Vector, longest_var);
	print_values_of_type(state, f64, longest_var);
}

exec_string :: proc(state: ^State, str: string) {
	//This one leaks everything!
	parser: Parser;
	init_parser_string(&parser, str);
	expr := parse_expr(&parser);

	assert(parser.error == false);
	eval_expr(state, expr);
}

/*

Too solve errors in the eval_expr part
Have a Value_Error type and an extra return argument
All calls to eval_expr has to check the return value of that and bail if its true
The error message is then carried up the stack using first return value, hence why the
error should be of type Value.

*/

main :: proc() {
	print_welcome();

	state: State;
	
	set_variable(&state, "sin", Value_Function{
		args = 1,
		proc_ptr = proc(args: []f64) -> f64 {
			assert(len(args) == 1);
			return math.sin(args[0]);
		}
	});
	set_variable(&state, "cos", Value_Function{
		args = 1,
		proc_ptr = proc(args: []f64) -> f64 {
			assert(len(args) == 1);
			return math.cos(args[0]);
		}
	});
	set_variable(&state, "tan", Value_Function{
		args = 1,
		proc_ptr = proc(args: []f64) -> f64 {
			assert(len(args) == 1);
			return math.tan(args[0]);
		}
	});
	set_variable(&state, "sqrt", Value_Function{
		args = 1,
		proc_ptr = proc(args: []f64) -> f64 {
			assert(len(args) == 1);
			return math.sqrt(args[0]);
		}
	});
	set_variable(&state, "ln", Value_Function{
		args = 1,
		desc = "natural logarithm",
		proc_ptr = proc(args: []f64) -> f64 {
			assert(len(args) == 1);
			return math.log(args[0]);
		}
	});
	set_variable(&state, "abs", Value_Function{
		args = 1,
		desc = "absolute value",
		proc_ptr = proc(args: []f64) -> f64 {
			assert(len(args) == 1);
			return abs(args[0]);
		}
	});
	set_variable(&state, "fact", Value_Function{
		args = 1,
		desc = "integer factorial",
		proc_ptr = proc(args: []f64) -> f64 {
			assert(len(args) == 1);
			//integers only
			factorial :: proc(v: int) -> int {
				if v <= 1 do return 1;
				else do return v*factorial(v-1);
			}
			return f64(factorial(int(args[0])));
		}
	});

	//TODO: Make some variables immutable
	set_variable(&state, "pi" , math.PI);
	set_variable(&state, "e"  , math.E);
	set_variable(&state, "eps", math.EPSILON);

	exec_string(&state, "dot=@(a, b) a{0}*b{0}+a{1}*b{1}+a{2}*b{2}");
	exec_string(&state, "log=@(x) ln(x)/ln(10)");

	parser: Parser;
	// parser.allocator = multi_arena_allocator(&parser_multi_arena);
	for {
		// free_all(parser.allocator);
		fmt.printf("> ");
		str_in := read_line();


		str := strings.trim_space(str_in);
		//fmt.printf("str: %v, str_in: %v\n", str, str_in);
		if str == "" {
			continue;
		}

		if str[0] == '.' {
			switch str {
			case ".help", ".h":
				print_help();
			case ".exit", ".q", ".quit", ".x", ".e":
				os.exit(0);
			case ".cls", ".clear": {
				fmt.printf("\e[2J");
				fmt.printf("\e[0;0H");
			}
			case ".vars", ".v":
				print_all_vars(&state);
			case:
				fmt.printf("  unknown command '%v'\n", str);
			}
			continue;
		}

		init_parser_string(&parser, str);
		expr := parse_expr(&parser);
		if parser.current_token.kind != Token_Kind.Eof {
			parser.error = true;
			parser.error_msg = fmt.bprintf(parser.error_msg_buffer[:], "error: unexpected '%v'", get_human_readable_token_name(parser.current_token.kind));
		}

		if parser.error {
			fmt.printf("\e[91m%v\n\e[0m", parser.error_msg);
		} else {
			//fmt.printf("%#v\n", expr.derived);

			result := eval_expr(&state, expr);
			fmt.printf("\n=   ");
			print_value(result);
			fmt.printf("\n\n");

			//fmt.printf("%#v\n", state);
		}
	}
}