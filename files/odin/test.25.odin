package main

using import "core:fmt"
using import "../"
      import "core:sys/win32"

      import "shared:workbench/stopwatch"

main :: proc() {
	test_main();
}

test_main :: proc() {
	break_test();
	immediate_test();
	signed_test();
	unsigned_test();
	float_test();
	// bit_test();
	// jump_test();
	// call_test();
	// factorial_test();
	// save_load_test();
	// parse_test();
}

break_test :: proc() {
	println(#procedure);
	vm: VM;
	defer destroy_vm(&vm);

	movi(&vm, 1, 1);
	movi(&vm, 2, 2);
	brk(&vm);

	execute(&vm);

	assert(vm.register_memory[1] == 1, tprint(vm.register_memory[1]));
	assert(vm.register_memory[2] == 2, tprint(vm.register_memory[2]));
	assert(vm.register_memory[3] == 0, tprint(vm.register_memory[3]));

	movi(&vm, 1, 3);
	mov(&vm, 3, 2);
	brk(&vm);

	execute(&vm);

	assert(vm.register_memory[1] == 3, tprint(vm.register_memory[1]));
	assert(vm.register_memory[2] == 2, tprint(vm.register_memory[2]));
	assert(vm.register_memory[3] == 2, tprint(vm.register_memory[3]));
}

immediate_test :: proc() {
	println(#procedure);
	vm: VM;
	defer destroy_vm(&vm);

	movis(&vm, 1, -5);
	movis(&vm, 2, 3);
	addi(&vm, 3, 1, 2);
	addi(&vm, 4, 1, -8);

	execute(&vm);

	assert(transmute(i64)vm.register_memory[1] ==  -5, tprint(transmute(i64)vm.register_memory[1]));
	assert(transmute(i64)vm.register_memory[2] ==   3, tprint(transmute(i64)vm.register_memory[2]));
	assert(transmute(i64)vm.register_memory[3] ==  -3, tprint(transmute(i64)vm.register_memory[3]));
	assert(transmute(i64)vm.register_memory[4] == -13, tprint(transmute(i64)vm.register_memory[4]));
}

signed_test :: proc() {
	println(#procedure);
	vm: VM;
	defer destroy_vm(&vm);

	movis(&vm, 1, -5);
	movi(&vm, 2, 3);
	add(&vm, 3, 1, 2);
	sub(&vm, 4, 1, 2);
	mul(&vm, 5, 1, 2);
	div(&vm, 6, 1, 2);
	mod(&vm, 7, 1, 2);

	execute(&vm);

	assert(transmute(i64)vm.register_memory[1] ==  -5, tprint(transmute(i64)vm.register_memory[1]));
	assert(transmute(i64)vm.register_memory[2] ==   3, tprint(transmute(i64)vm.register_memory[2]));
	assert(transmute(i64)vm.register_memory[3] ==  -2, tprint(transmute(i64)vm.register_memory[3]));
	assert(transmute(i64)vm.register_memory[4] ==  -8, tprint(transmute(i64)vm.register_memory[4]));
	assert(transmute(i64)vm.register_memory[5] == -15, tprint(transmute(i64)vm.register_memory[5]));
	assert(transmute(i64)vm.register_memory[6] ==  -1, tprint(transmute(i64)vm.register_memory[6]));
	assert(transmute(i64)vm.register_memory[7] ==  -2, tprint(transmute(i64)vm.register_memory[7]));
}

unsigned_test :: proc() {
	println(#procedure);
	vm: VM;
	defer destroy_vm(&vm);

	movi(&vm, 1, 5);
	movi(&vm, 2, 3);
	addu(&vm, 3, 1, 2);
	subu(&vm, 4, 1, 2);
	mulu(&vm, 5, 1, 2);
	divu(&vm, 6, 1, 2);
	modu(&vm, 7, 1, 2);

	execute(&vm);

	assert(transmute(i64)vm.register_memory[1] ==  5, tprint(transmute(i64)vm.register_memory[1]));
	assert(transmute(i64)vm.register_memory[2] ==  3, tprint(transmute(i64)vm.register_memory[2]));
	assert(transmute(i64)vm.register_memory[3] ==  8, tprint(transmute(i64)vm.register_memory[3]));
	assert(transmute(i64)vm.register_memory[4] ==  2, tprint(transmute(i64)vm.register_memory[4]));
	assert(transmute(i64)vm.register_memory[5] == 15, tprint(transmute(i64)vm.register_memory[5]));
	assert(transmute(i64)vm.register_memory[6] ==  1, tprint(transmute(i64)vm.register_memory[6]));
	assert(transmute(i64)vm.register_memory[7] ==  2, tprint(transmute(i64)vm.register_memory[7]));
}

float_test :: proc() {
	println(#procedure);
	vm: VM;
	defer destroy_vm(&vm);

	movif(&vm, 1, 1.5);
	movif(&vm, 2, 2.5);
	addf(&vm, 3, 1, 2);
	subf(&vm, 4, 1, 2);
	mulf(&vm, 5, 1, 2);
	divf(&vm, 6, 1, 2);

	execute(&vm);

	assert(transmute(f64)vm.register_memory[1] ==  1.5, tprint(transmute(f64)vm.register_memory[1]));
	assert(transmute(f64)vm.register_memory[2] ==  2.5, tprint(transmute(f64)vm.register_memory[2]));
	assert(transmute(f64)vm.register_memory[3] ==  4.0, tprint(transmute(f64)vm.register_memory[3]));
	assert(transmute(f64)vm.register_memory[4] ==   -1, tprint(transmute(f64)vm.register_memory[4]));
	assert(transmute(f64)vm.register_memory[5] == 3.75, tprint(transmute(f64)vm.register_memory[5]));
	assert(transmute(f64)vm.register_memory[6] ==  0.6, tprint(transmute(f64)vm.register_memory[6]));
}

bit_test :: proc() {
	println(#procedure);
	vm: VM;
	defer destroy_vm(&vm);

	movi(&vm, 1, 11);
	movi(&vm, 2, 3);
	shl(&vm, 3, 1, 2);
	shr(&vm, 4, 1, 2);
	and(&vm, 5, 1, 2);
	or (&vm, 6, 1, 2);
	xor(&vm, 7, 1, 2);

	execute(&vm);

	assert(vm.register_memory[1] == 11, tprint(vm.register_memory[1]));
	assert(vm.register_memory[2] ==  3, tprint(vm.register_memory[2]));
	assert(vm.register_memory[3] == 88, tprint(vm.register_memory[3]));
	assert(vm.register_memory[4] ==  1, tprint(vm.register_memory[4]));
	assert(vm.register_memory[5] ==  3, tprint(vm.register_memory[5]));
	assert(vm.register_memory[6] == 11, tprint(vm.register_memory[6]));
	assert(vm.register_memory[7] ==  8, tprint(vm.register_memory[7]));
}

jump_test :: proc() {
	println(#procedure);
	vm: VM;
	// vm.do_print_registers = true;
	defer destroy_vm(&vm);

	movis(&vm, 1, 11);
	movis(&vm, 2, -15);
	movis(&vm, 3, 0);
	movis(&vm, 4, 0);
	movis(&vm, 5, 0);
	movis(&vm, 6, 0);

	jeq(&vm, "jeq_skip", 1, 2);
	movis(&vm, 3, 1);
	label(&vm, "jeq_skip");

	jne(&vm, "jne_skip", 1, 2);
	movis(&vm, 4, 1);
	label(&vm, "jne_skip");

	jlt(&vm, "jlt_skip", 1, 2);
	movis(&vm, 5, 1);
	label(&vm, "jlt_skip");

	jge(&vm, "jge_skip", 1, 2);
	movis(&vm, 6, 1);
	label(&vm, "jge_skip");

	execute(&vm);

	assert(transmute(i64)vm.register_memory[1] ==  11, tprint(vm.register_memory[1]));
	assert(transmute(i64)vm.register_memory[2] == -15, tprint(vm.register_memory[2]));
	assert(transmute(i64)vm.register_memory[3] ==   1, tprint(vm.register_memory[3]));
	assert(transmute(i64)vm.register_memory[4] ==   0, tprint(vm.register_memory[4]));
	assert(transmute(i64)vm.register_memory[5] ==   1, tprint(vm.register_memory[5]));
	assert(transmute(i64)vm.register_memory[6] ==   0, tprint(vm.register_memory[6]));
}

call_test :: proc() {
	println(#procedure);
	/*
	start:
		mov 1 5      # original data
		mov 2 3      # original data
		push 1       # save before call
		push 2       # save before call

		mov 1 12     # parameter
		mov 2 7      # parameter
		call foo

		pop 2
		pop 1
		quit
	foo:
		add rr 1 2
		ret
	*/

	vm: VM;
	// vm.do_print_registers = true;
	defer destroy_vm(&vm);

	label(&vm, "start");
	movi(&vm, 1, 5);    // original data
	movi(&vm, 2, 3);    // original data
	stack_push(&vm, 1);  // save original data
	stack_push(&vm, 2);  // save original data

	movi(&vm, 1, 12);   // put parameter in
	movi(&vm, 2, 7);    // put parameter in
	call(&vm, "foo");     // call foo
	stack_pop(&vm, 2);   // restore original data
	stack_pop(&vm, 1);   // restore original data
	quit(&vm);
	label(&vm, "foo");
	add(&vm, rr, 1, 2);
	ret(&vm);

	execute(&vm);

	assert(vm.register_memory[1] ==  5, tprint(vm.register_memory[1]));
	assert(vm.register_memory[2] ==  3, tprint(vm.register_memory[2]));
	assert(vm.register_memory[rr] == 19, tprint(vm.register_memory[rr]));
}

factorial_test :: proc() {
	factorial :: proc(a: int) -> int {
		if a == 1 {
			return 1;
		}

		return a * factorial(a-1);
	}

	println(#procedure);
	vm: VM;
	// vm.do_print_registers = true;
	defer destroy_vm(&vm);

	movi(&vm, 1, 5);
	call(&vm, "factorial");
	quit(&vm);

	label(&vm, "factorial");
	movi(&vm, 2, 1);
	jne(&vm, "not_equal", 1, 2);
	movi(&vm, rr, 1);
	ret(&vm);

	label(&vm, "not_equal");
	sub(&vm, 2, 1, 2);
	stack_push(&vm, 1);
	stack_push(&vm, 2);
	mov(&vm, 1, 2);
	call(&vm, "factorial");
	stack_pop(&vm, 2);
	stack_pop(&vm, 1);
	mul(&vm, rr, rr, 1);
	ret(&vm);

	sw := stopwatch.start_new();
	execute(&vm);
	stopwatch.stop(&sw);

	answer_sw := stopwatch.start_new();
	answer := cast(u64)factorial(5);
	stopwatch.stop(&answer_sw);

	// println("time:", stopwatch.elapsed_time, "odin time:", answer_sw.elapsed_time);
	// print_instruction_counts(&vm);

	assert(vm.register_memory[rr] == answer);
}

save_load_test :: proc() {
	println(#procedure);
	vm: VM;
	// vm.do_print_registers = true;
	defer destroy_vm(&vm);

	movi(&vm, 1, 5);
	movi(&vm, 2, 6);
	movi(&vm, 3, 7);
	movi(&vm, 4, 8);
	movi(&vm, 5, ~u64(0));
	sv64(&vm, 1, 5);
	sv32(&vm, 2, 5);
	sv16(&vm, 3, 5);
	sv8 (&vm, 4, 5);
	brk(&vm);

	execute(&vm);

	assert(vm.main_memory[5] == 0xFFFFFFFFFFFFFFFF, tprint(vm.main_memory));
	assert(vm.main_memory[6] == 0xFFFFFFFF,         tprint(vm.main_memory));
	assert(vm.main_memory[7] == 0xFFFF,             tprint(vm.main_memory));
	assert(vm.main_memory[8] == 0xFF,               tprint(vm.main_memory));
	assert(vm.register_memory[6]  == 0, tprint(vm.register_memory[6]));
	assert(vm.register_memory[7]  == 0, tprint(vm.register_memory[7]));
	assert(vm.register_memory[8]  == 0, tprint(vm.register_memory[8]));
	assert(vm.register_memory[9]  == 0, tprint(vm.register_memory[9]));
	assert(vm.register_memory[10] == 0, tprint(vm.register_memory[10]));
	assert(vm.register_memory[11] == 0, tprint(vm.register_memory[11]));
	assert(vm.register_memory[12] == 0, tprint(vm.register_memory[12]));

	ld64(&vm, 6, 1);
	ld64(&vm, 7, 2);
	ld64(&vm, 8, 3);
	ld64(&vm, 9, 4);
	ld32(&vm, 10, 1);
	ld16(&vm, 11, 1);
	ld8 (&vm, 12, 1);
	quit(&vm);

	execute(&vm);

	assert(vm.register_memory[6]  == 0xFFFFFFFFFFFFFFFF, tprint(vm.register_memory[6]));
	assert(vm.register_memory[7]  == 0xFFFFFFFF,         tprint(vm.register_memory[7]));
	assert(vm.register_memory[8]  == 0xFFFF,             tprint(vm.register_memory[8]));
	assert(vm.register_memory[9]  == 0xFF,               tprint(vm.register_memory[9]));
	assert(vm.register_memory[10] == 0xFFFFFFFF,         tprint(vm.register_memory[10]));
	assert(vm.register_memory[11] == 0xFFFF,             tprint(vm.register_memory[11]));
	assert(vm.register_memory[12] == 0xFF,               tprint(vm.register_memory[12]));
}

parse_test :: proc() {
	println(#procedure);
	PROGRAM :: `
	start:
		mov 1 5      # original data
		mov 2 3      # original data
		push 1       # save before call
		push 2       # save before call

		mov 1 12     # parameter
		mov 2 7      # parameter
		call foo

		pop 2
		pop 1
		quit
	foo:
		add rr 1 2
		ret`;


}