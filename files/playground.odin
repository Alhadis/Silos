package main

import "core:fmt"
import "core:time"
import "vm"

main :: proc() {
	fmt.println("Hellope!");
	code: [dynamic]byte;
	defer delete(code);

	for i in 0..<100000 {
		vm.op_loadq(&code, vm.Reg.R1, u64(i + 1));
		vm.op_addq(&code, vm.Reg.R0, vm.Reg.R1);
	}
	vm.op_halt(&code);

	d: time.Duration;
	for i in 0..<10 {
		start := time.now();
		ctx: vm.Core;
		for vm.cpu(&ctx, code[:]) == false {}
		end := time.now();
		fmt.println(ctx.r[0].Q);
		d += time.diff(start, end);
	}
	fmt.printf("avg: %vms\n", (d/10)/1000);
}