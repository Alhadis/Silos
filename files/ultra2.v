// CSCI 320 - Computer Architecture
// Lab 3 - 9/17/13
// Author: Yifan Ge
//
// Exercise 1:
// Simple implementation of register-regiter processor with 16-bit architecture.
// This implementation uses direct addressing mode.

module ultra2;

	// declare registers and flip-flops
	reg [15:0] IR, MD, PC, MA, ALU;
	reg [15:0] R[0:3];
	reg [15:0] MEM[0:255]; 
	reg [1:0] opcode, rd, rs, rt;

initial begin: stop_at
	// Will stop the execution after 20 simulation units.
	#100; $finish;   
end

// These statements done at simulation time 0 (since no #k)
initial begin: Init
	
	// Hardcode the program in the memory starting at address 0
	MEM[10] = 16'b0001000000000011; // LOAD  R1, 3
	MEM[11] = 16'b0010000000000100; // LOAD  R2, 4
	MEM[12] = 16'b1001011000000000; // ADD   R1, R1, R2
	MEM[13] = 16'b0100010000000101; // STORE R1, 5
	MEM[14] = 16'b1100000000001100; // JUMP 12
	
	// Hardcode the immediates
	MEM[3] = 2;
	MEM[4] = 1;
	
	// Initialize the wires AC, IR, MD, PC, MA
	IR = 16'b0;
	MD = 16'b0;
	PC = 10;
	MA = 16'b0;
	ALU = 16'b0;
	opcode = 2'b0;
	rd = 2'b0;
	rs = 2'b0;
	rt = 2'b0;

	// Initialize the registers	
	R[0] = 16'b0;
	R[1] = 16'b0;
	R[2] = 16'b0;
	R[3] = 16'b0;
	
	// Display a header
	$display("Time	PC	IR	opcode	R0	R1	R2	R3	M");
	
	// Prints the values anytime a value changes
	$monitor("%0d	%d	%b	%b	%d	%d	%d	%d	%d", $time, PC, IR, opcode, R[0], R[1], R[2], R[3], MEM[5]);

	// Dumpfiles for simulation
	$dumpfile("ultra2.vcd");
	$dumpvars(0, ultra2);

end

// main_process will loop until simulation is over
always
begin: main_process

	// use while loop to simulate the processor		
	while(1)
	begin
		// IF
		IR = MEM[PC];
		PC = PC + 1; 
		#1;
		// ID
		opcode = IR[15:14];
		rd = IR[13:12];
		rs = IR[11:10];
		rt = IR[9:8];
		MA = IR[7:0];
		#1;

		// EX, MEM, and WB stages are different depending on the
		// opcode. This case selection sorts the instruction based on
		// the opcode and operates accordingly.
		case (opcode)
			2'b00: 
				begin // LOAD
					// MEM
					MD = MEM[MA];
					#1;
					// WB
					R[rd] = MD;
					#1;
					$display("Time %d",$time);
				end
			2'b01:
				begin // STORE
					// MEM
					MD = R[rs];
					MEM[MA] = MD;
					#1;
				end
			2'b10:
				begin // ADD
					// EX
					ALU = R[rs] + R[rt];
					#1;
					// WB
					R[rd] = ALU;
					#1;
					$display("Time %d", $time);
				end
			2'b11:
				begin // JUMP
					PC = MA;
				end
		endcase
	end

end

endmodule
