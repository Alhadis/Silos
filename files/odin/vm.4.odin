package badscript

import "core:fmt"

/*

Exmaple:
func main: 1 arg, 2 locals
	PUSHN 0                 ; [ 0 ]
	SETLOCAL 0              ; [ ]    
	PUSHARG 0               ; [ args_table ]
	CALL len 1              ; [ numargs ]
	SETLOCAL 1              ; [ ]
	GETLOCAL 0              ; [ 0 ]
	GETLOCAL 1              ; [ 0 numargs ]
	JG enough_args          ; [ ]
	PUSHS "Not enough args" ; [ "Not enough args" ]
	CALL println 1          ; [ ]
	RETURN
enough args:
	PUSHS "We have args"    ; [ "We have args" ]
	CALL println 1          ; [ ]
	RETURN

*/

Bytecode :: enum u8
{
	INVALID_OP,
	PUSHNUMBER,
	PUSHNULL,
	PUSHTRUE,
	PUSHFALSE,
	PUSHSTRING,
	PUSHTABLE,
	GETLOCAL,
	SETLOCAL,
	GETGLOBAL,
	SETGLOBAL,
	TABLESET,
	TABLEGET,
	CALL,
	METHODCALL,
	JE,
	JNE,
	JL,
	JLE,
	JG,
	JGE,
	JTRUE,
	JFALSE,
	ADD,
	SUB,
	MUL,
	DIV,
	MOD,
	RETURN,
	STOP,
}

StackFrame :: struct
{
	return_address: u32,
	locals: [dynamic]^Value,
}

// We should have some sort of frame call stack
VirtualMachine :: struct
{
	code: []Bytecode,
	stack: [dynamic]^Value,
	globals: [dynamic]^Value,
	callstack: [dynamic]StackFrame,
	ip: u32,
	running: bool,
}

make_vm :: proc(code: []Bytecode, num_globals: int) -> ^VirtualMachine
{
	vm := new(VirtualMachine);
	vm.code = code;
	vm.ip = 0;
	reserve(&vm.globals, num_globals);
	for i in 0..num_globals
	{
		append(&vm.globals, nil);
	}
	return vm;
}


runtime_error :: proc(using vm: ^VirtualMachine)
{
	//TODO: actually implement this thing
	assert(false);
}

write_f64 :: proc(code: ^[dynamic]Bytecode, number: f64)
{ //TODO: Decide on endianess
	v := transmute(u64)number;
	for i in 0..8
	{
		append(code, cast(Bytecode) (v & 0xFF));
		v = v >> 8;
	}
}

write_u32 :: proc(code: ^[dynamic]Bytecode, v: u32)
{
	for i in 0..4
	{
		append(code, cast(Bytecode) (v & 0xFF));
		v = v >> 8;
	}
}

read_u32 :: proc(using vm: ^VirtualMachine) -> u32
{
	v: u32 = 0;
	offset := cast(u32)0;
	for i in 0..4
	{
		v |= cast(u32) code[ip] << offset;
		offset += 8;
		ip += 1;
	}
	return v;
}

write_string :: proc(code: ^[dynamic]Bytecode, s: string)
{
	assert(false, "Revise this proc");
	// U32 ought to be enough for badscripts
	length := u32(len(s));
	data := transmute([]Bytecode)cast([]u8)s;
	write_u32(code, length);
	append(code, ...data);
}


read_and_copy_utf8_string :: proc(using vm: ^VirtualMachine) -> string
{
	//TODO: We should probably prefix strings with 
	// a length, what size do we want. u64 wont waste that much as were arent going to have *that* many strings
	return "ello";
}

read_f64 :: proc(using vm: ^VirtualMachine) -> f64
{ //TODO: Decide on endianess
	v: u64 = 0;
	offset := cast(u64)0;
	for i in 0..8
	{
		v |= cast(u64) code[ip] << offset;
		offset += 8;
		ip += 1;
	}
	return transmute(f64)v;
}

read_u8 :: proc(using vm: ^VirtualMachine) -> u8
{
	v := cast(u8)code[ip];
	ip += 1;
	return v;
}

run :: proc(using vm: ^VirtualMachine, start_ip: u32) -> [dynamic]^Value
{
	ip = start_ip;
	running = true;
	fmt.printf("Running vm with %d bytecodes\n", len(vm.code));
	for running
	{
		op := code[ip];
		ip += 1;
		
		fmt.printf("Bytecode: %v", op);
		using Bytecode;
		switch op {
		case INVALID_OP:
			assert(false);
		case STOP:
			running = false;
		case PUSHNUMBER:
			num := new_value(Number);
			num.number = read_f64(vm);
			append(&stack, num);
		case PUSHSTRING:
			str := new_value(String);
			str.text = read_and_copy_utf8_string(vm);
			append(&stack, str);
		case PUSHNULL:
			append(&stack, null_value);
		case PUSHTRUE:
			append(&stack, true_value);
		case PUSHFALSE:
			append(&stack, false_value);
		case PUSHTABLE:
			append(&stack, new_value(Table));
		case ADD:
			rhs := pop(&stack);
			lhs := pop(&stack);
			append(&stack, value_add(lhs, rhs));
		case GETGLOBAL:
			global := read_u8(vm);
			append(&stack, globals[global]);
		case SETGLOBAL:
			global := read_u8(vm);
			globals[global] = pop(&stack);
		case SETLOCAL:
			v := pop(&stack);
			l := read_u8(vm);
			callstack[len(callstack)-1].locals[l] = v;
		case GETLOCAL:
			l := read_u8(vm);
			append(&stack, callstack[len(callstack)-1].locals[l]);
		case CALL:
		{
			address := read_u32(vm);
			locals := read_u8(vm);
			ret := ip;
			//fmt.printf("\nCALL: address: %d, locals: %d, return_address: %d\n", address, locals, ret);
			sf := StackFrame{return_address = ret};
			for i in 0..locals
			{
				append(&sf.locals, nil);
			}
			append(&callstack, sf);
			ip = address;
		}
		case RETURN:
			sf := pop(&callstack);
			ip = sf.return_address;
			free(sf.locals);
		case: fmt.printf("INVALID OP CASE: %d", op);
		}
		
		fmt.printf(", stack: %v\n", stack);
	}
	
	return stack;
}