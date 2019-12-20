
package main

using import "core:fmt"
      import "core:strings"

using import "shared:workbench/laas"
using import "shared:workbench/logging"

DEBUG_MODE :: true;

VM :: struct {
	instructions: [dynamic]Instruction,
	registers:    [16]u64,
	memory:       [1024]byte,

	do_print_registers: bool,
	instruction_hit_counts: [dynamic]int,

	label_references: [dynamic]Label_Reference,
	label_to_ip: map[string]u64,
}
STACK_SIZE :: 512;

Instruction :: struct {
	kind: Instruction_Type,
	p1, p2, p3: u64,
}
Label_Reference :: struct {
	ip: u64,
	str: string,
}

Register :: enum {
	r1,  r2,  r3,  r4,
	r5,  r6,  r7,  r8,
	r9,  r10, rfp, rim,
	rj,  rip, rsp, rz,
}

reg :: proc(r: Register) -> int {
	return cast(int)r;
}

reg_from_name :: proc(name: string) -> (Register, bool) {
	switch name {
		case "r1":  return .r1, true;
		case "r2":  return .r2, true;
		case "r3":  return .r3, true;
		case "r4":  return .r4, true;
		case "r5":  return .r5, true;
		case "r6":  return .r6, true;
		case "r7":  return .r7, true;
		case "r8":  return .r8, true;
		case "r9":  return .r9, true;
		case "r10": return .r10, true;
		case "rfp": return .rfp, true;
		case "rim": return .rim, true;
		case "rj":  return .rj, true;
		case "rip": return .rip, true;
		case "rsp": return .rsp, true;
		case "rz":  return .rz, true;
	}
	return {}, false;
}

patch_labels :: proc(vm: ^VM) {
	for ref in vm.label_references {
		ip, ok := vm.label_to_ip[ref.str];
		assert(ok, ref.str);

		vm.instructions[ref.ip].p2 = ip;
	}
}

PRINT_STUFF :: false;
execute :: proc(using vm: ^VM) {
	patch_labels(vm);

	when DEBUG_MODE {
		vm.instruction_hit_counts = make([dynamic]int, len(vm.instructions));
	}

	if PRINT_STUFF {
		println("Generated", len(vm.instructions), "Instructions");
	}

	instruction_loop: for {
		if registers[reg(.rip)] >= cast(u64)len(instructions) do break;

		instruction := instructions[registers[reg(.rip)]];

		if PRINT_STUFF {
			print("\n");
			println(registers[reg(.rip)], instruction);
		}

		increment_ip := true;

		switch cast(Instruction_Type)instruction.kind {
			case .MOV:     registers[instruction.p1] = registers[instruction.p2];
			case .MOVIM:   registers[instruction.p1] = instruction.p2;

			case .PUSH8U:  (cast(^u8 )&memory[registers[reg(.rsp)]])^ = cast(u8 )transmute(u64)registers[instruction.p1]; registers[reg(.rsp)] += 1; assert(registers[reg(.rsp)] < STACK_SIZE);
			case .PUSH16U: (cast(^u16)&memory[registers[reg(.rsp)]])^ = cast(u16)transmute(u64)registers[instruction.p1]; registers[reg(.rsp)] += 2; assert(registers[reg(.rsp)] < STACK_SIZE);
			case .PUSH32U: (cast(^u32)&memory[registers[reg(.rsp)]])^ = cast(u32)transmute(u64)registers[instruction.p1]; registers[reg(.rsp)] += 4; assert(registers[reg(.rsp)] < STACK_SIZE);
			case .PUSH64U: (cast(^u64)&memory[registers[reg(.rsp)]])^ = cast(u64)transmute(u64)registers[instruction.p1]; registers[reg(.rsp)] += 8; assert(registers[reg(.rsp)] < STACK_SIZE);

			case .POP8U:   registers[reg(.rsp)] -= 1; registers[instruction.p1] = cast(u64)(cast(^u8 )&memory[registers[reg(.rsp)]])^;
			case .POP16U:  registers[reg(.rsp)] -= 2; registers[instruction.p1] = cast(u64)(cast(^u16)&memory[registers[reg(.rsp)]])^;
			case .POP32U:  registers[reg(.rsp)] -= 4; registers[instruction.p1] = cast(u64)(cast(^u32)&memory[registers[reg(.rsp)]])^;
			case .POP64U:  registers[reg(.rsp)] -= 8; registers[instruction.p1] = cast(u64)(cast(^u64)&memory[registers[reg(.rsp)]])^;

			case .PUSH8S:  (cast(^i8 )&memory[registers[reg(.rsp)]])^ = cast(i8 )transmute(i64)registers[instruction.p1]; registers[reg(.rsp)] += 1; assert(registers[reg(.rsp)] < STACK_SIZE);
			case .PUSH16S: (cast(^i16)&memory[registers[reg(.rsp)]])^ = cast(i16)transmute(i64)registers[instruction.p1]; registers[reg(.rsp)] += 2; assert(registers[reg(.rsp)] < STACK_SIZE);
			case .PUSH32S: (cast(^i32)&memory[registers[reg(.rsp)]])^ = cast(i32)transmute(i64)registers[instruction.p1]; registers[reg(.rsp)] += 4; assert(registers[reg(.rsp)] < STACK_SIZE);
			case .PUSH64S: (cast(^i64)&memory[registers[reg(.rsp)]])^ = cast(i64)transmute(i64)registers[instruction.p1]; registers[reg(.rsp)] += 8; assert(registers[reg(.rsp)] < STACK_SIZE);

			case .POP8S:   registers[reg(.rsp)] -= 1; registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i8 )&memory[registers[reg(.rsp)]])^;
			case .POP16S:  registers[reg(.rsp)] -= 2; registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i16)&memory[registers[reg(.rsp)]])^;
			case .POP32S:  registers[reg(.rsp)] -= 4; registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i32)&memory[registers[reg(.rsp)]])^;
			case .POP64S:  registers[reg(.rsp)] -= 8; registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i64)&memory[registers[reg(.rsp)]])^;

			case .PUSH32F: (cast(^f32)&memory[registers[reg(.rsp)]])^ = cast(f32)transmute(f64)registers[instruction.p1]; registers[reg(.rsp)] += 4; assert(registers[reg(.rsp)] < STACK_SIZE);
			case .PUSH64F: (cast(^f64)&memory[registers[reg(.rsp)]])^ = cast(f64)transmute(f64)registers[instruction.p1]; registers[reg(.rsp)] += 8; assert(registers[reg(.rsp)] < STACK_SIZE);

			case .JEQ:      if registers[instruction.p2] == registers[instruction.p3]                             { registers[reg(.rip)] = registers[reg(.rj)]; increment_ip = false; }
			case .JNE:      if registers[instruction.p2] != registers[instruction.p3]                             { registers[reg(.rip)] = registers[reg(.rj)]; increment_ip = false; }
			case .JLT:      if transmute(i64)registers[instruction.p2] <  transmute(i64)registers[instruction.p3] { registers[reg(.rip)] = registers[reg(.rj)]; increment_ip = false; }
			case .JGE:      if transmute(i64)registers[instruction.p2] >= transmute(i64)registers[instruction.p3] { registers[reg(.rip)] = registers[reg(.rj)]; increment_ip = false; }
			case .JLTU:     if registers[instruction.p2] <  registers[instruction.p3]                             { registers[reg(.rip)] = registers[reg(.rj)]; increment_ip = false; }
			case .JGEU:     if registers[instruction.p2] >= registers[instruction.p3]                             { registers[reg(.rip)] = registers[reg(.rj)]; increment_ip = false; }

			case .GOTO:     registers[reg(.rip)] = instruction.p2; increment_ip = false;

			case .EQ:       registers[instruction.p1] = (registers[instruction.p2] == registers[instruction.p3] ? 1 : 0);

			case .SV8U:     (cast(^u8 )&memory[registers[instruction.p1]])^ = cast(u8 )transmute(u64)registers[instruction.p2];
			case .SV16U:    (cast(^u16)&memory[registers[instruction.p1]])^ = cast(u16)transmute(u64)registers[instruction.p2];
			case .SV32U:    (cast(^u32)&memory[registers[instruction.p1]])^ = cast(u32)transmute(u64)registers[instruction.p2];
			case .SV64U:    (cast(^u64)&memory[registers[instruction.p1]])^ = cast(u64)transmute(u64)registers[instruction.p2];
			case .LD8U:     registers[instruction.p1] = cast(u64)(cast(^u8 )&memory[registers[instruction.p2]])^;
			case .LD16U:    registers[instruction.p1] = cast(u64)(cast(^u16)&memory[registers[instruction.p2]])^;
			case .LD32U:    registers[instruction.p1] = cast(u64)(cast(^u32)&memory[registers[instruction.p2]])^;
			case .LD64U:    registers[instruction.p1] = cast(u64)(cast(^u64)&memory[registers[instruction.p2]])^;

			case .SV8S:     (cast(^i8 )&memory[registers[instruction.p1]])^ = cast(i8 )transmute(i64)registers[instruction.p2];
			case .SV16S:    (cast(^i16)&memory[registers[instruction.p1]])^ = cast(i16)transmute(i64)registers[instruction.p2];
			case .SV32S:    (cast(^i32)&memory[registers[instruction.p1]])^ = cast(i32)transmute(i64)registers[instruction.p2];
			case .SV64S:    (cast(^i64)&memory[registers[instruction.p1]])^ = cast(i64)transmute(i64)registers[instruction.p2];
			case .LD8S:     registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i8 )&memory[registers[instruction.p2]])^;
			case .LD16S:    registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i16)&memory[registers[instruction.p2]])^;
			case .LD32S:    registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i32)&memory[registers[instruction.p2]])^;
			case .LD64S:    registers[instruction.p1] = transmute(u64)cast(i64)(cast(^i64)&memory[registers[instruction.p2]])^;

			case .SV32F:    (cast(^f32)&memory[registers[instruction.p1]])^ = cast(f32)transmute(f64)registers[instruction.p2];
			case .SV64F:    (cast(^f64)&memory[registers[instruction.p1]])^ = cast(f64)transmute(f64)registers[instruction.p2];
			case .LD32F:    registers[instruction.p1] = transmute(u64)cast(f64)(cast(^f32)&memory[registers[instruction.p2]])^;
			case .LD64F:    registers[instruction.p1] = transmute(u64)cast(f64)(cast(^f64)&memory[registers[instruction.p2]])^;

			case .ADDSIM:   registers[instruction.p1] = transmute(u64)(transmute(i64)registers[instruction.p2] + transmute(i64)instruction.p3);
			case .ADDUIM:   registers[instruction.p1] = transmute(u64)(transmute(u64)registers[instruction.p2] + transmute(u64)instruction.p3);
			case .ADDFIM:   registers[instruction.p1] = transmute(u64)(transmute(f64)registers[instruction.p2] + transmute(f64)instruction.p3);

			case .ADDS:     registers[instruction.p1] = transmute(u64)(transmute(i64)registers[instruction.p2] +  transmute(i64)registers[instruction.p3]);
			case .SUBS:     registers[instruction.p1] = transmute(u64)(transmute(i64)registers[instruction.p2] -  transmute(i64)registers[instruction.p3]);
			case .MULS:     registers[instruction.p1] = transmute(u64)(transmute(i64)registers[instruction.p2] *  transmute(i64)registers[instruction.p3]);
			case .DIVS:     registers[instruction.p1] = transmute(u64)(transmute(i64)registers[instruction.p2] /  transmute(i64)registers[instruction.p3]);
			case .MODS:     registers[instruction.p1] = transmute(u64)(transmute(i64)registers[instruction.p2] %  transmute(i64)registers[instruction.p3]);
			case .MODMODS:  registers[instruction.p1] = transmute(u64)(transmute(i64)registers[instruction.p2] %% transmute(i64)registers[instruction.p3]);

			case .ADDU:     registers[instruction.p1] = registers[instruction.p2] +  registers[instruction.p3];
			case .SUBU:     registers[instruction.p1] = registers[instruction.p2] -  registers[instruction.p3];
			case .MULU:     registers[instruction.p1] = registers[instruction.p2] *  registers[instruction.p3];
			case .DIVU:     registers[instruction.p1] = registers[instruction.p2] /  registers[instruction.p3];
			case .MODU:     registers[instruction.p1] = registers[instruction.p2] %  registers[instruction.p3];
			case .MODMODU:  registers[instruction.p1] = registers[instruction.p2] %% registers[instruction.p3];

			case .ADDF:     registers[instruction.p1] = transmute(u64)(transmute(f64)registers[instruction.p2] + transmute(f64)registers[instruction.p3]);
			case .SUBF:     registers[instruction.p1] = transmute(u64)(transmute(f64)registers[instruction.p2] - transmute(f64)registers[instruction.p3]);
			case .MULF:     registers[instruction.p1] = transmute(u64)(transmute(f64)registers[instruction.p2] * transmute(f64)registers[instruction.p3]);
			case .DIVF:     registers[instruction.p1] = transmute(u64)(transmute(f64)registers[instruction.p2] / transmute(f64)registers[instruction.p3]);

			case .NEG:      registers[instruction.p1] = -registers[instruction.p1];

			case .SHL:      registers[instruction.p1] = registers[instruction.p2] << registers[instruction.p3];
			case .SHR:      registers[instruction.p1] = registers[instruction.p2] >> registers[instruction.p3];
			case .AND:      registers[instruction.p1] = registers[instruction.p2] &  registers[instruction.p3];
			case .OR:       registers[instruction.p1] = registers[instruction.p2] |  registers[instruction.p3];
			case .XOR:      registers[instruction.p1] = registers[instruction.p2] ~  registers[instruction.p3];

			case .QUIT:     registers[reg(.rip)] -= 1; break instruction_loop;
			case .BREAK:    break instruction_loop;
			case:          assert(false, aprint(instruction.kind));
		}

		registers[reg(.rz)] = 0;

		if PRINT_STUFF {
			println(tprint("registers: ", registers));
			println(tprint("stack:     ", memory[:registers[reg(.rsp)]]));
		}

		if increment_ip {
			registers[reg(.rip)] += 1;
		}
	}
}

destroy_vm :: proc(using vm: ^VM) {
	delete(label_to_ip);
	delete(label_references);
	delete(instruction_hit_counts);
}

Instruction_Type :: enum u16 {
	INVALID,

	QUIT, BREAK,

	JUMP, JEQ, JNE, JLT, JGE, JLTU, JGEU,

	GOTO,

	EQ,

	SV8U, SV16U, SV32U, SV64U,
	LD8U, LD16U, LD32U, LD64U,

	SV8S, SV16S, SV32S, SV64S,
	LD8S, LD16S, LD32S, LD64S,

	SV32F, SV64F,
	LD32F, LD64F,

	ADDS, SUBS, MULS, DIVS, MODS, MODMODS,

	ADDU, SUBU, MULU, DIVU, MODU, MODMODU,

	ADDF, SUBF, MULF, DIVF,

	ADDSIM, ADDUIM, ADDFIM,

	NEG,

	SHL, SHR, // SHA,
	SHLI, SHRI, // SHAI,

	AND, OR, XOR,

	MOV, MOVIM,

	PUSH8U,  PUSH16U, PUSH32U, PUSH64U,
	PUSH8S,  PUSH16S, PUSH32S, PUSH64S,
	PUSH32F, PUSH64F,

	POP8U,  POP16U, POP32U, POP64U,
	POP8S,  POP16S, POP32S, POP64S,
	POP32F, POP64F,

	// PSEUDOINSTRUCTIONS

	// CALL, RET,
	// TAIL,

	ANDI, ORI, XORI,
}

HI_BITS_32 ::   0xFFFF0000;
LO_BITS_32 ::   0x0000FFFF;

HIHI_BITS_64 :: 0xFFFF000000000000;
HILO_BITS_64 :: 0x0000FFFF00000000;
LOHI_BITS_64 :: 0x00000000FFFF0000;
LOLO_BITS_64 :: 0x000000000000FFFF;

add_instruction :: proc(using vm: ^VM, inst: Instruction) {
	append(&instructions, inst);
}

quit :: inline proc(using vm: ^VM) {
	add_instruction(vm, Instruction{.QUIT, 0, 0, 0});
}
brk :: inline proc(using vm: ^VM) {
	add_instruction(vm, Instruction{.BREAK, 0, 0, 0});
}

mov :: inline proc(using vm: ^VM, rd, p1: Register) {
	add_instruction(vm, Instruction{.MOV, cast(u64)rd, cast(u64)p1, 0});
}
movsim :: inline proc(using vm: ^VM, rd: Register, p1: i64) {
	add_instruction(vm, Instruction{.MOVIM, cast(u64)rd, transmute(u64)p1, 0});
}
movuim :: inline proc(using vm: ^VM, rd: Register, p1: u64) {
	add_instruction(vm, Instruction{.MOVIM, cast(u64)rd, transmute(u64)p1, 0});
}
movfim :: inline proc(using vm: ^VM, rd: Register, p1: f64) {
	add_instruction(vm, Instruction{.MOVIM, cast(u64)rd, transmute(u64)p1, 0});
}

jeq :: inline proc(using vm: ^VM, str: string, r1, r2: Register) {
	ref := Label_Reference{cast(u64)len(instructions), str};
	append(&label_references, ref);
	movuim(vm, .rj, 0); // will be backpatched
	add_instruction(vm, Instruction{.JEQ, 0, cast(u64)r1, cast(u64)r2});
}
jne :: inline proc(using vm: ^VM, str: string, r1, r2: Register) {
	ref := Label_Reference{cast(u64)len(instructions), str};
	append(&label_references, ref);
	movuim(vm, .rj, 0); // will be backpatched
	add_instruction(vm, Instruction{.JNE, 0, cast(u64)r1, cast(u64)r2});
}
jlt :: inline proc(using vm: ^VM, str: string, r1, r2: Register) {
	ref := Label_Reference{cast(u64)len(instructions), str};
	append(&label_references, ref);
	movuim(vm, .rj, 0); // will be backpatched
	add_instruction(vm, Instruction{.JLT, 0, cast(u64)r1, cast(u64)r2});
}
jge :: inline proc(using vm: ^VM, str: string, r1, r2: Register) {
	ref := Label_Reference{cast(u64)len(instructions), str};
	append(&label_references, ref);
	movuim(vm, .rj, 0); // will be backpatched
	add_instruction(vm, Instruction{.JGE, 0, cast(u64)r1, cast(u64)r2});
}
jltu :: inline proc(using vm: ^VM, str: string, r1, r2: Register) {
	ref := Label_Reference{cast(u64)len(instructions), str};
	append(&label_references, ref);
	movuim(vm, .rj, 0); // will be backpatched
	add_instruction(vm, Instruction{.JLTU, 0, cast(u64)r1, cast(u64)r2});
}
jgeu :: inline proc(using vm: ^VM, str: string, r1, r2: Register) {
	ref := Label_Reference{cast(u64)len(instructions), str};
	append(&label_references, ref);
	movuim(vm, .rj, 0); // will be backpatched
	add_instruction(vm, Instruction{.JGEU, 0, cast(u64)r1, cast(u64)r2});
}
goto :: inline proc(using vm: ^VM, label: string) {
	ref := Label_Reference{cast(u64)len(instructions), label};
	append(&label_references, ref);
	add_instruction(vm, Instruction{.GOTO, 0, 0, 0});
}



eq :: inline proc(using vm: ^VM, rd, r1, r2: Register) {
	add_instruction(vm, Instruction{.EQ, cast(u64)rd, cast(u64)r1, cast(u64)r2});
}



sv8u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV8U, cast(u64)dst, cast(u64)src, 0});
}
sv16u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV16U, cast(u64)dst, cast(u64)src, 0});
}
sv32u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV32U, cast(u64)dst, cast(u64)src, 0});
}
sv64u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV64U, cast(u64)dst, cast(u64)src, 0});
}
ld8u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD8U, cast(u64)dst, cast(u64)src, 0});
}
ld16u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD16U, cast(u64)dst, cast(u64)src, 0});
}
ld32u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD32U, cast(u64)dst, cast(u64)src, 0});
}
ld64u :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD64U, cast(u64)dst, cast(u64)src, 0});
}
sv8s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV8S, cast(u64)dst, cast(u64)src, 0});
}
sv16s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV16S, cast(u64)dst, cast(u64)src, 0});
}
sv32s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV32S, cast(u64)dst, cast(u64)src, 0});
}
sv64s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV64S, cast(u64)dst, cast(u64)src, 0});
}
ld8s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD8S, cast(u64)dst, cast(u64)src, 0});
}
ld16s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD16S, cast(u64)dst, cast(u64)src, 0});
}
ld32s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD32S, cast(u64)dst, cast(u64)src, 0});
}
ld64s :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD64S, cast(u64)dst, cast(u64)src, 0});
}
sv32f :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV32F, cast(u64)dst, cast(u64)src, 0});
}
sv64f :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.SV64F, cast(u64)dst, cast(u64)src, 0});
}
ld32f :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD32F, cast(u64)dst, cast(u64)src, 0});
}
ld64f :: inline proc(using vm: ^VM, dst: Register, src: Register) {
	add_instruction(vm, Instruction{.LD64F, cast(u64)dst, cast(u64)src, 0});
}



addsim :: inline proc(using vm: ^VM, rd, p1: Register, p2: i64) {
	add_instruction(vm, Instruction{.ADDSIM, cast(u64)rd, cast(u64)p1, transmute(u64)p2});
}
adduim :: inline proc(using vm: ^VM, rd, p1: Register, p2: u64) {
	add_instruction(vm, Instruction{.ADDUIM, cast(u64)rd, cast(u64)p1, transmute(u64)p2});
}
addfim :: inline proc(using vm: ^VM, rd, p1: Register, p2: f64) {
	add_instruction(vm, Instruction{.ADDFIM, cast(u64)rd, cast(u64)p1, transmute(u64)p2});
}

adds :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.ADDS, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
subs :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.SUBS, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
muls :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.MULS, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
divs :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.DIVS, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
mods :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.MODS, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
modmods :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.MODMODS, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}

addu :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.ADDU, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
subu :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.SUBU, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
mulu :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.MULU, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
divu :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.DIVU, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
modu :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.MODU, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
modmodu :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.MODMODU, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}

addf :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.ADDF, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
subf :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.SUBF, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
mulf :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.MULF, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
divf :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.DIVF, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}

neg :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.NEG, cast(u64)p1, 0, 0});
}

shl :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.SHL, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
shr :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.SHR, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
and :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.AND, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
or :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.OR, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
xor :: inline proc(using vm: ^VM, rd, p1, p2: Register) {
	add_instruction(vm, Instruction{.XOR, cast(u64)rd, cast(u64)p1, cast(u64)p2});
}
// stack_push :: inline proc(using vm: ^VM, r1: Register) {
// 	add_instruction(vm, Instruction{.PUSH, cast(u64)r1, 0, 0});
// }
// stack_pop :: inline proc(using vm: ^VM, r1: Register) {
// 	add_instruction(vm, Instruction{.POP, cast(u64)r1, 0, 0});
// }

push8u :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH8U, cast(u64)p1, 0, 0});
}
push16u :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH16U, cast(u64)p1, 0, 0});
}
push32u :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH32U, cast(u64)p1, 0, 0});
}
push64u :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH64U, cast(u64)p1, 0, 0});
}

push8s :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH8S, cast(u64)p1, 0, 0});
}
push16s :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH16S, cast(u64)p1, 0, 0});
}
push32s :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH32S, cast(u64)p1, 0, 0});
}
push64s :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH64S, cast(u64)p1, 0, 0});
}

push32f :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH32F, cast(u64)p1, 0, 0});
}
push64f :: inline proc(using vm: ^VM, p1: Register) {
	add_instruction(vm, Instruction{.PUSH64F, cast(u64)p1, 0, 0});
}


pop8u :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP8U, cast(u64)rd, 0, 0});
}
pop16u :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP16U, cast(u64)rd, 0, 0});
}
pop32u :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP32U, cast(u64)rd, 0, 0});
}
pop64u :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP64U, cast(u64)rd, 0, 0});
}

pop8s :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP8S, cast(u64)rd, 0, 0});
}
pop16s :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP16S, cast(u64)rd, 0, 0});
}
pop32s :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP32S, cast(u64)rd, 0, 0});
}
pop64s :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP64S, cast(u64)rd, 0, 0});
}

pop32f :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP32F, cast(u64)rd, 0, 0});
}
pop64f :: inline proc(using vm: ^VM, rd: Register) {
	add_instruction(vm, Instruction{.POP64F, cast(u64)rd, 0, 0});
}



// PSEUDOINSTRUCTIONS

// call :: inline proc(using vm: ^VM, str: string) {
// 	stack_push(vm, .rip, 8);
// 	goto(vm, str);
// }
// ret :: inline proc(using vm: ^VM) {
// 	// stack_pop(vm, rt);
// 	// addi(vm, rt, rt, 1);
// 	mov(vm, rip, rt);
// }

shli :: inline proc(using vm: ^VM, rd: Register, p1: u64) {
	movuim(vm, .rim, p1);
	shl(vm, rd, rd, .rim);
}
shri :: inline proc(using vm: ^VM, rd: Register, p1: u64) {
	movuim(vm, .rim, p1);
	shr(vm, rd, rd, .rim);
}
andi :: inline proc(using vm: ^VM, rd, r1: Register, p2: u64) {
	movuim(vm, .rim, p2);
	and(vm, rd, r1, .rim);
}
ori :: inline proc(using vm: ^VM, rd, r1: Register, p2: u64) {
	movuim(vm, .rim, p2);
	or(vm, rd, r1, .rim);
}
xori :: inline proc(using vm: ^VM, rd, r1: Register, p2: u64) {
	movuim(vm, .rim, p2);
	xor(vm, rd, r1, .rim);
}
label :: inline proc(using vm: ^VM, str: string) {
	instruction_pointer := cast(u64)len(instructions);
	_, ok := label_to_ip[str];
	assert(!ok, tprint("Already have label: ", str));
	label_to_ip[str] = instruction_pointer;
}



main :: proc() {
	unimplemented();
}

parse_and_execute :: proc(code: string, out_vm: ^VM) {
	vm := out_vm;
	lexer := make_lexer(code);
	token: Token;
	for get_next_token(&lexer, &token) {
		#complete
		switch kind in token.kind {
			case Identifier: {
				switch kind.value {
					case "mov": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						mov(vm, dst, src);
					}
					case "movsim": {
						dst := parse_register(&lexer);
						val := parse_number(&lexer, i64);
						movsim(vm, dst, val);
					}
					case "movuim": {
						dst := parse_register(&lexer);
						val := parse_number(&lexer, u64);
						movuim(vm, dst, val);
					}
					case "movfim": {
						dst := parse_register(&lexer);
						val := transmute(f64)parse_number(&lexer, u64);
						movfim(vm, dst, val);
					}
					case "push8u": {
						src := parse_register(&lexer);
						push8u(vm, src);
					}
					case "pop8u": {
						dst := parse_register(&lexer);
						pop8u(vm, dst);
					}
					case "push16u": {
						src := parse_register(&lexer);
						push16u(vm, src);
					}
					case "pop16u": {
						dst := parse_register(&lexer);
						pop16u(vm, dst);
					}
					case "push32u": {
						src := parse_register(&lexer);
						push32u(vm, src);
					}
					case "pop32u": {
						dst := parse_register(&lexer);
						pop32u(vm, dst);
					}
					case "push64u": {
						src := parse_register(&lexer);
						push64u(vm, src);
					}
					case "pop64u": {
						dst := parse_register(&lexer);
						pop64u(vm, dst);
					}
					case "push8s": {
						src := parse_register(&lexer);
						push8s(vm, src);
					}
					case "pop8s": {
						dst := parse_register(&lexer);
						pop8s(vm, dst);
					}
					case "push16s": {
						src := parse_register(&lexer);
						push16s(vm, src);
					}
					case "pop16s": {
						dst := parse_register(&lexer);
						pop16s(vm, dst);
					}
					case "push32s": {
						src := parse_register(&lexer);
						push32s(vm, src);
					}
					case "pop32s": {
						dst := parse_register(&lexer);
						pop32s(vm, dst);
					}
					case "push64s": {
						src := parse_register(&lexer);
						push64s(vm, src);
					}
					case "pop64s": {
						dst := parse_register(&lexer);
						pop64s(vm, dst);
					}
					case "push32f": {
						src := parse_register(&lexer);
						push32f(vm, src);
					}
					case "pop32f": {
						dst := parse_register(&lexer);
						pop32f(vm, dst);
					}
					case "push64f": {
						src := parse_register(&lexer);
						push64f(vm, src);
					}
					case "pop64f": {
						dst := parse_register(&lexer);
						pop64f(vm, dst);
					}
					case "jeq": {
						jump_target := parse_identifier(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						jeq(vm, jump_target, r1, r2);
					}
					case "jne": {
						unimplemented("jne");
					}
					case "jlt": {
						unimplemented("jlt");
					}
					case "jge": {
						unimplemented("jge");
					}
					case "jltu": {
						unimplemented("jltu");
					}
					case "jgeu": {
						unimplemented("jgeu");
					}
					case "goto": {
						token: Token;
						get_next_token(&lexer, &token);
						ident, ok := token.kind.(Identifier);
						if !ok {
							panic(tprint("Expected call label, got", token.kind));
						}
						goto(vm, ident.value);
					}
					case "eq": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						eq(vm, dst, r1, r2);
					}
					case "sv8u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv8u(vm, dst, src);
					}
					case "sv16u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv16u(vm, dst, src);
					}
					case "sv32u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv32u(vm, dst, src);
					}
					case "sv64u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv64u(vm, dst, src);
					}
					case "ld8u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld8u(vm, dst, src);
					}
					case "ld16u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld16u(vm, dst, src);
					}
					case "ld32u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld32u(vm, dst, src);
					}
					case "ld64u": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld64u(vm, dst, src);
					}
					case "sv8s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv8s(vm, dst, src);
					}
					case "sv16s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv16s(vm, dst, src);
					}
					case "sv32s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv32s(vm, dst, src);
					}
					case "sv64s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv64s(vm, dst, src);
					}
					case "ld8s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld8s(vm, dst, src);
					}
					case "ld16s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld16s(vm, dst, src);
					}
					case "ld32s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld32s(vm, dst, src);
					}
					case "ld64s": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld64s(vm, dst, src);
					}
					case "sv32f": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv32f(vm, dst, src);
					}
					case "sv64f": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						sv64f(vm, dst, src);
					}
					case "ld32f": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld32f(vm, dst, src);
					}
					case "ld64f": {
						dst := parse_register(&lexer);
						src := parse_register(&lexer);
						ld64f(vm, dst, src);
					}
					case "addsim": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						im := parse_number(&lexer, i64);
						addsim(vm, dst, r1, im);
					}
					case "adduim": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						im := parse_number(&lexer, u64);
						adduim(vm, dst, r1, im);
					}
					case "addfim": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						im := transmute(f64)parse_number(&lexer, u64);
						addfim(vm, dst, r1, im);
					}
					case "adds": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						adds(vm, dst, r1, r2);
					}
					case "subs": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						subs(vm, dst, r1, r2);
					}
					case "muls": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						muls(vm, dst, r1, r2);
					}
					case "divs": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						divs(vm, dst, r1, r2);
					}
					case "mods": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						mods(vm, dst, r1, r2);
					}
					case "modmods": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						modmods(vm, dst, r1, r2);
					}
					case "addu": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						addu(vm, dst, r1, r2);
					}
					case "subu": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						subu(vm, dst, r1, r2);
					}
					case "mulu": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						mulu(vm, dst, r1, r2);
					}
					case "divu": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						divu(vm, dst, r1, r2);
					}
					case "modu": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						modu(vm, dst, r1, r2);
					}
					case "modmodu": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						modmodu(vm, dst, r1, r2);
					}
					case "addf": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						addf(vm, dst, r1, r2);
					}
					case "subf": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						subf(vm, dst, r1, r2);
					}
					case "mulf": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						mulf(vm, dst, r1, r2);
					}
					case "divf": {
						dst := parse_register(&lexer);
						r1 := parse_register(&lexer);
						r2 := parse_register(&lexer);
						divf(vm, dst, r1, r2);
					}
					case "neg": {
						r1 := parse_register(&lexer);
						neg(vm, r1);
					}
					case "shl": {
						unimplemented("shl");
					}
					case "shr": {
						unimplemented("shr");
					}
					case "and": {
						unimplemented("and");
					}
					case "or": {
						unimplemented("or");
					}
					case "xor": {
						unimplemented("xor");
					}
					case "quit": {
						quit(vm);
					}
					case "brk": {
						brk(vm);
					}
					case: {
						panic(tprint(kind.value));
					}
				}
			}

			case Number: {
				panic(tprint(kind));
			}

			case String: {
				panic(tprint(kind));
			}

			case Symbol: {
				switch kind.value {
					case '#': { // comment
						token: Token;
						newline_loop: for get_next_token(&lexer, &token) {
							switch kind in token.kind {
								case New_Line: {
									break newline_loop;
								}
							}
						}
					}
					case ':': { // label
						token: Token;
						get_next_token(&lexer, &token);
						label_ident, ok := token.kind.(Identifier);
						if !ok {
							panic(tprint("Expected label identifier, got", token.kind));
						}
						label(vm, label_ident.value);
					}
					case: {
						panic(tprint(kind.value));
					}
				}
			}

			case New_Line: {

			}

			case EOF: {

			}

			case: panic(tprint(kind));
		}
	}

	execute(vm);
}

parse_register :: proc(lexer: ^Lexer, loc := #caller_location) -> Register {
	reg_specifier_token: Token;
	get_next_token(lexer, &reg_specifier_token);
	ident, ok2 := reg_specifier_token.kind.(Identifier);
	if !ok2 {
		panic(tprint("Expected register specifier, got ", reg_specifier_token.kind, loc));
	}

	reg, ok3 := reg_from_name(ident.value);
	if !ok3 {
		panic(tprint("Expected register specifier, got ", ident.value, loc));
	}

	return reg;
}

parse_number :: proc(lexer: ^Lexer, $Type: typeid, loc := #caller_location) -> Type {
	root_token: Token;
	root_ok := get_next_token(lexer, &root_token);
	if !root_ok {
		panic(tprint("Expected number, got ", root_token));
	}

	when Type == u64 {
		number, ok := root_token.kind.(Number);
		if !ok {
			panic(tprint("Expected number, got ", root_token.kind, loc));
		}
		return number.unsigned_int_value;
	}
	else when Type == i64 {
		number_token := root_token;
		sign : i64 = 1;
		if sym, ok := root_token.kind.(Symbol); ok {
			if sym.value == '-' {
				sign = -1;
			}
			real_number_token: Token;
			num_ok := get_next_token(lexer, &real_number_token);
			if !num_ok {
				panic(tprint("Expected number, got", real_number_token.kind));
			}
			number_token = real_number_token;
		}
		number, num_ok := number_token.kind.(Number);
		if !num_ok {
			panic(tprint("Expected number, got", number_token.kind));
		}
		return number.int_value * sign;
	}
	else {
		#assert(false);
	}

	panic(tprint(type_info_of(Type)));
	return {};
}

parse_identifier :: proc(lexer: ^Lexer) -> string {
	token: Token;
	ok := get_next_token(lexer, &token);
	assert(ok, tprint("Expected identifier, got", token));
	ident, ok2 := token.kind.(Identifier);
	assert(ok2, tprint("Expected identifier, got", token.kind));
	return ident.value;
}