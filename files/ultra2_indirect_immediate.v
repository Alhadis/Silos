// CSCI 320 - Computer Architecture
// Lab 3 - 9/17/13
// Author: Yifan Ge
// 
// Exercise 3:
// Simple implementation of register-regiter processor with 16-bit architecture.
// This implementation is an extension to Exercise 2. It supports immediate
// Load(LOADI) and relative Jump(RJUMP)

module ultra2_indirect_immediate;

	// declare registers and flip-flops
	reg [15:0] IR, MD, PC, MA, ALU, mt;
	reg signed [15:0] R[0:3];
	reg [15:0] MEM[0:255]; 
	reg [1:0] opcode, rd, rs, rt;

initial begin: stop_at
	// Will stop the execution after 50 simulation units.
	#50; $finish;   
end

// These statements done at simulation time 0 (since no #k)
initial begin: Init
	
	// Hardcode the program in the memory starting at address 0
	MEM[10] = 16'b0001000100000011; // LOADI  R1, 3     
	MEM[11] = 16'b0101000000000100; // STORE  R1, 4     
	MEM[12] = 16'b0010000111111100; // LOADI  R2, -4    
	MEM[13] = 16'b1010100100000110; // ADD    R2, R2, R1
	MEM[14] = 16'b0110000000000101; // STORE  R2, 5     
	MEM[15] = 16'b1100000111111110; // RJUMP  -2        
	               
	// Hardcode the immediates
	
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
	$display("Time	PC	IR	opcode	R0	R1	R2	R3");
	
	// Prints the values anytime a value changes
	$monitor("%0d	%d	%b	%b	%d	%d	%d	%d", $time, PC, IR, opcode, R[0], R[1], R[2], R[3]);

	// Dumpfiles for simulation
	$dumpfile("ultra2_indirect_immediate.vcd");
	$dumpvars(0, ultra2_indirect_immediate);

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
				begin // LOAD or LOADI
					case(rt)
						2'b00: // LOAD
							begin
								// EX
								ALU = R[rs]+MA;
								#1;
								// MEM
								MD = MEM[ALU];
								#1;
								// WB
								// If rd is 00, don't change anything.
								// Keep R0 as zero.
								if(rd!=0)
								begin
									R[rd] = MD;
								end
								#1;
								$display("Time %d",$time);
							end
						2'b01: // LOADI
							begin
								// WB
								// If rd is 00, don't change anything.
								// Keep R0 as zero.
								if(rd!=0)
								begin
									// Signed extend the immediate to 16 bits.
									mt = {{8{MA[7]}},MA[7:0]};
									R[rd] = mt;
								end
								#1;
								$display("Time %d", $time);
							end
						default:
							begin
								$display("Unexpected Load instruction.");
							end
					endcase
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
					// If rd is 00, don't change anything.
					// Keep R0 as zero.
					if(rd!=0)
					begin
						R[rd] = ALU;
					end
					#1;
					$display("Time %d", $time);
				end
			2'b11:
				begin // JUMP or RJUMP
					case(rt)
						2'b00: // JUMP
							begin
								// EX 
								ALU = R[rs]+MA;
								PC = ALU;
								#1;
							end
						2'b01: // RJUMP
							begin
								// EX
								// Signed extend the immediate to 16 bits.
								mt = {{8{MA[7]}},MA[7:0]};
								//$display("mt: %d; PC: %d", $signed(mt), PC);
								ALU = PC-1+mt;
								PC = ALU;
								#1;
								//$display("Jumped at time %d to %d", $time, PC);
							end
						default:
							begin
								$display("Unexpected Jump instruction.");
							end
					endcase
				end
		endcase
	end

end

endmodule
