// CSCI 320 - Computer Architecture
// Lab 3 - 9/17/13
// Author: Yifan Ge
// 
// Exercise 2:
// Simple implementation of register-regiter processor with 16-bit architecture.
// This implementation is an extension to Exercise 1. It supports indirect
// addressing as well as fixed value R0 register.

module ultra2_indirect;

	// declare registers and flip-flops
	reg [15:0] IR, MD, PC, MA, ALU;
	reg [15:0] R[0:3];
	reg [15:0] MEM[0:255]; 
	reg [1:0] opcode, rd, rs, rt;

initial begin: stop_at
	// Will stop the execution after 50 simulation units.
	#50; $finish;   
end

// These statements done at simulation time 0 (since no #k)
initial begin: Init
	
	// Hardcode the program in the memory starting at address 0
	MEM[10] = 16'b0011000000000001; // Load  R3, 1
	MEM[11] = 16'b0010110000000010; // Load  R2, 2(R3)
	MEM[12] = 16'b1010101000000000; // Add   R2, R2, R2
	MEM[13] = 16'b0110000000000110; // Store R2, 6
	MEM[14] = 16'b0000000000000110; // Load  R0, 6
	MEM[15] = 16'b0110110000000110; // Store R2, 6(R3)
	MEM[16] = 16'b1100110000001010; // Jump  10(R3)
	
	// Hardcode the immediates
	MEM[1] = 2;
	MEM[2] = 6;
	MEM[3] = 11;
	MEM[4] = 14;
	MEM[5] = 7;
	
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
	$display("Time	PC	IR	opcode	R0	R1	R2	R3	MEM[6]	MEM[8]");
	
	// Prints the values anytime a value changes
	$monitor("%0d	%d	%b	%b	%d	%d	%d	%d	%d	%d", $time, PC, IR, opcode, R[0], R[1], R[2], R[3], MEM[6], MEM[8]);

	// Dumpfiles for simulation
	$dumpfile("ultra2_indirect.vcd");
	$dumpvars(0, ultra2_indirect);

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
					// EX
					ALU = R[rs]+MA;
					#1;
					// MEM
					MD = MEM[ALU];
					#1;
					// WB
					if(rd!=0)
					begin
						R[rd] = MD;
					end
					#1;
					$display("Time %d",$time);
				end
			2'b01:
				begin // STORE
					// EX
					ALU = R[rs]+MA;
					#1;
					// MEM
					MD = R[rd];
					MEM[ALU] = MD;
					#1;
				end
			2'b10:
				begin // ADD
					// EX
					ALU = R[rs] + R[rt];
					#1;
					// WB
					if(rd!=0)
					begin
						R[rd] = ALU;
					end
					#1;
					$display("Time %d", $time);
				end
			2'b11:
				begin // JUMP
					// EX 
					ALU = R[rs]+MA;
					PC = ALU;
					#1;
				end
		endcase
	end

end

endmodule
