package badscript

import "core:fmt"
import "core:os"
import "core:unicode/utf8"

Variable :: struct
{
	name: string,
	index: u32,
	is_global: bool,
	
	is_func: bool,
	args: int,
	
}

Function :: struct
{
	variables: [dynamic]Variable,
}

Scope :: struct
{
	parent: ^Scope,
	function: ^Function,
	variables: [dynamic]Variable,
}

// TODO: Figure out a way so that we can call from other vms, that way we dont have to compile everything into one vm
//       This allows us to store things like the vm in bytecode form and save some time.
Program :: struct
{
	name: string,
	top_levels: []^Node,
	global_scope: ^Scope,
	current_scope: ^Scope,
	lexer_data: []rune,
	code: [dynamic]Bytecode,
	start_address: u32,
}

gen_error :: proc(using program: ^Program, node: ^Node, fmt_str: string, args: ...any)
{
	//TODO: If we are on windows check in ANSICON env variable is set, if it is
	//      windows has ANSI support. Otherwise dont print color.
	fmt.printf("\x1B[94m%s(%d:%d)\x1B[0m \x1B[91merror:\x1B[0m ", node.loc.filename, node.loc.line, node.loc.char);	
	fmt.printf(fmt_str, ...args);
	fmt.printf("\n\n");
	
	start := find_rune_from_right(lexer_data[..], node.loc.fileoffset, '\n');
	end := find_rune_from_left(lexer_data[..], node.loc.fileoffset, '\n');
	if lexer_data[start] == '\n' do start += 1;	
	if end < len(lexer_data) && lexer_data[end] == '\n' do end -= 1;
	output := lexer_data[start..end];
	
	prefix := "    > ";
	fmt.printf(prefix);
	//TODO: Fancy over-the-top idea! Syntax highlighting! Wouldnt that be amazing!!
	for r in output
	{
		fmt.printf("%r", r);
	}
	fmt.printf("\n");
	
	for i in 0..len(prefix)
	{
		fmt.printf(" ");
	}
	for i := start; i < node.loc.fileoffset-1; i += 1
	{
		if lexer_data[i] == '\t'
		{
			fmt.printf("\t");
		}
		else
		{
			fmt.printf(" ");
		}
	}
	fmt.printf("\x1B[91m^");
	if node.loc.length > 1
	{
		for i in 1..node.loc.length
		{
			fmt.printf("~");
		}
	}
	fmt.printf("\n\x1B[0m");
	
	os.exit(1);
}

make_scope :: proc(program: ^Program) -> ^Scope
{
	return new(Scope);
}

// Returns the new scope
push_scope :: proc(program: ^Program, function: ^Function) -> ^Scope
{
	scope := make_scope(program);
	scope.function = function;
	scope.parent = program.current_scope;
	program.current_scope = scope;
	return scope;
}

// Returns the current scope after popping
pop_scope :: proc(program: ^Program) -> ^Scope
{
	old_scope := program.current_scope;
	program.current_scope = old_scope.parent;
	free(old_scope);
	return program.current_scope;
}

scope_get :: proc(program: ^Program, name: string) -> ^Variable
{
	scope := program.current_scope;
	for scope != nil
	{
		for v, it in scope.variables
		{
			if v.name == name
			{
				return &scope.variables[it];
			}
		}
		scope = scope.parent;
	}
	
	return nil;
}

scope_add :: proc(program: ^Program, name: string, n: ^Node) -> ^Variable
{
	scope := program.current_scope;
	
	if scope.function != nil
	{
		//TODO: Check for duplicates in current scope
		
		// Local function
		if len(scope.function.variables) < 256
		{
			index := cast(u32) len(scope.function.variables);
			v := Variable{
				name = name,
				index = index,
				is_global = false,
			};
			append(&scope.function.variables, v);
			append(&scope.variables, v);
			return &scope.function.variables[index];
		}
		else
		{
			gen_error(program, n, "Too many local variables. You can only have a maximum of 256.");
			return nil;
		}
	}
	else
	{
		index := cast(u32) len(scope.variables);
		// Global scope
		v := Variable{
			name = name,
			index = index,
			is_global = true,
		};
		append(&scope.variables, v);
		return &scope.variables[index];
	}
}

generate_block :: proc(using program: ^Program, block_node: ^Node)
{
	assert(block_node.kind == NodeKind.BLOCK);
	push_scope(program, program.current_scope.function);
	for n in block_node.block.stmts
	{
		using NodeKind;
		switch n.kind {
		case VAR:
		{
			name := make_string_from_runes(n._var.name);
			v := scope_add(program, name, n);
			generate_expr(program, n._var.expr);
			append(&program.code, Bytecode.SETLOCAL);
			append(&program.code, cast(Bytecode) v.index);
		}
		case ASSIGN:
		{
			using n.assign;
			if lhs.kind != NodeKind.NAME && lhs.kind != NodeKind.FIELD && lhs.kind != NodeKind.INDEX
			{
				gen_error(program, lhs, "Cannot assign to left side of assignment!");
			}
			
			switch lhs.kind {
			case NodeKind.NAME:
			{
				name := make_string_from_runes(lhs.name.name);
				v := scope_get(program, name);
				if v == nil
				{
					gen_error(program, lhs, "Undeclared variable: '%s'", name);
				}
				else
				{
					generate_expr(program, rhs);
					if v.is_global
					{
						append(&program.code, Bytecode.SETGLOBAL);
					}
					else
					{
						append(&program.code, Bytecode.SETLOCAL);
					}
					append(&program.code, cast(Bytecode) v.index);
				}
			}
			case NodeKind.FIELD:
			{
				assert(false, "Incomplete");
			}
			case NodeKind.INDEX:
			{
				assert(false, "Incomplete");
			}
			case: assert(false, "Invalid switch case");
			}
		}
		case IF:
		{
			assert(false, "incomplete!");
		}
		case BLOCK:
		{
			push_scope(program, program.current_scope.function);
			generate_block(program, n);
			pop_scope(program);
		}
		case: assert(false, "Incomplete switch");
		}
	}
	pop_scope(program);
}

generate_func :: proc(program: ^Program, node: ^Node)
{
	assert(node.kind == NodeKind.FUNC);
	address := cast(u32)len(program.code);
	name := make_string_from_runes(node.func.name);
	
	v := scope_add(program, name, node);
	v.index = address;
	
	function := new(Function);
	program.current_scope.function = function;
	
	//TODO: Register arguments as locals
	//      I guess we should pass args on the stack
	//      and automatically place them into their respective locals
	
	generate_block(program, node.func.block);
	//TODO: We could insert a PUSHNULL safely here right?
	//      Or would we be leaking nulls in the stack slowly?
	append(&program.code, Bytecode.RETURN);
}

generate_bytecode_for_program :: proc(using program: ^Program)
{
	// Where do we put this code? At the start of main()? yes!
	
	{
		for n in program.top_levels
		{
			switch n.kind {
			case NodeKind.VAR:
			{
				name := make_string_from_runes(n._var.name);
				scope_add(program, name, n);
			}
			}
		}
	}
	
	{
		// Generate functions
		for n in program.top_levels
		{
			if(n.kind == NodeKind.FUNC)
			{
				generate_func(program, n);
			}
		}
	}
	
	{
		main: ^Node = nil;
		for n in program.top_levels
		{
			if n.kind == NodeKind.FUNC
			{
				if _compare_slices(n.func.name, []rune{'m', 'a', 'i', 'n'})
				{
					main = n;
					break;
				}
			}
		}
		if main == nil
		{
			fmt.printf("Missing main function!\n");
			os.exit(1);
		}
		else
		{
			if len(main.func.args) != 1
			{
				gen_error(program, main, "main should only take one annd only one argument (args table)!");
			}
			else
			{
				// I assume the current namespace is the globa namespace
				// should I set it directly?
				// Because this will crash if we have unbalanced push/pop_scope calls
				// which is nice, I guess...
				v := scope_get(program, "main");
				if v == nil
				{
					assert(false, "A main function node exists but main cant be found in the global scope");
				}
				else
				{
					program.start_address = cast(u32) len(program.code);
					{
						// Generate code for global variables
						for n in program.top_levels
						{
							if(n.kind == NodeKind.VAR)
							{
								name := make_string_from_runes(n._var.name);
								v := scope_get(program, name);
								if n._var.expr != nil
								{
									generate_expr(program, n._var.expr);
									append(&code, Bytecode.SETGLOBAL);
									append(&code, cast(Bytecode) v.index);
								}
							}
						}
					}
					// Call main function
					append(&program.code, Bytecode.CALL);
					// TODO: We need a way to resolve function address later, that way we support out-of-order func calls
					//       we dont want out-of-order for globals as that's "too" much of a hassle
					write_u32(&program.code, v.index); // Address of main
					// TODO: We should probably store the number of
					// locals and arguments in the Variable of a function
					append(&program.code, 2); // Number of locals
					append(&program.code, Bytecode.STOP);
				}
			}
		}
	}
}

make_program :: proc(name: string, top_levels: []^Node, lexer_data: []rune) -> ^Program
{
	p := new(Program);
	
	p.name = name;
	p.top_levels = top_levels;
	p.global_scope = make_scope(p);
	p.current_scope = p.global_scope;
	p.lexer_data = lexer_data;
	
	generate_bytecode_for_program(p);
	append(&p.code, Bytecode.GETGLOBAL);
	append(&p.code, cast(Bytecode) 0);
	append(&p.code, Bytecode.GETGLOBAL);
	append(&p.code, cast(Bytecode) 1);
	append(&p.code, Bytecode.GETGLOBAL);
	append(&p.code, cast(Bytecode) 2);
	append(&p.code, Bytecode.STOP);
	
	return p;
}


make_string_from_runes :: proc(runes: []rune) -> string
{
	bytes: [dynamic]u8;
	for r in runes
	{
		buffer, length := utf8.encode_rune(r);
		append(&bytes, ...buffer[..length]);
	}
	return string(bytes[..]);
}

generate_expr :: proc(using program: ^Program, n: ^Node)
{
	using NodeKind;
	switch n.kind {
	case NAME:
	{
		name := make_string_from_runes(n.name.name);
		v := scope_get(program, name);
		if v == nil
		{
			gen_error(program, n, "Undeclared variable: '%s'", name);
		}
		if v.is_global
		{
			append(&code, Bytecode.GETGLOBAL);
		}
		else
		{
			append(&code, Bytecode.GETLOCAL);
		}
		append(&code, cast(Bytecode) v.index);
	}
	case NUMBER:
	{
		append(&code, Bytecode.PUSHNUMBER);
		write_f64(&code, n.number.value);
	}
	case BINARY:
	{
		assert(n.binary.op == TokenKind.ADD, "Temp assert! Incomplete");
		generate_expr(program, n.binary.lhs);
		generate_expr(program, n.binary.rhs);
		append(&code, Bytecode.ADD);
	}
	
	case: assert(false, "Incomplete or invalid switch case");
	}
	}
	}
}