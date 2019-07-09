// CSCI 320 - Computer Architecture
// Lab 3 - 9/17/13
// Author: Yifan Ge
// 
// Exercise 3:
// Simple implementation of register-regiter processor with 16-bit architecture.
// This implementation is an extension to Exercise 2. It supports immediate
// Load(LOADI) and relative Jump(RJUMP)

module ultra3;

	// declare registers and flip-flops
	reg signed [15:0] R[0:3];
	reg [15:0] MEM[0:255];

	// Control regs
	reg		msb;
	reg		mof;
	reg signed [15:0] MD, ALU; 
	reg [15:0] 	IR, PC;
	reg signed [5:0]	IM;
	reg signed [15:0]	IM_16;
	reg [1:0] 	rd, rs, rt;
	reg [3:0] 	opcode;

	// Calculation regs
	reg [15:0]	temp, counter;

initial begin: stop_at
	// Will stop the execution after 50 simulation units.
	#120; $finish;   
end

// These statements done at simulation time 0 (since no #k)
initial begin: Init
	
	// Hardcode the program in the memory starting at address 0
	MEM[3] = 16'b10; // 2
	MEM[4] = 16'b01; // 1
	MEM[10] = 16'b0000010000000011; // LOAD R1, 3
	MEM[11] = 16'b0000100000000100; // LOAD R2, 4
	MEM[12] = 16'b1110000110000010; // BNE R1, R2, 2
	MEM[13] = 16'b0100010110000000; // ADD R1, R1, R2
	MEM[14] = 16'b0010010000000101; // STORE R1, 5
	MEM[15] = 16'b0100010010000000; // ADD R1, R0, R2
	MEM[16] = 16'b1101000110000010; // BEQ R1, R2, 2
	MEM[17] = 16'b1100000000001010; // JUMP 10
	MEM[18] = 16'b0010010000000110; // STORE R1, 6
	MEM[19] = 16'b0001010000000100; // LOADI R1, 4
	MEM[20] = 16'b1111001001111010; // BLT R2, R1, -6
	MEM[21] = 16'b1100000000001100; // JUMP 12

	// Hardcode the immediates
	
	// Initialize the wires AC, IR, MD, PC
	IR = 16'b0;
	MD = 16'b0;
	PC = 10;
	ALU = 16'b0;
	
	
	IM = 6'b0;
	temp = 16'b0;
	counter = 16'b0;
	mof = 1'b0;
	msb = 1'b0;
	opcode = 4'b0;
	rd = 2'b0;
	rs = 2'b0;
	rt = 2'b0;


	// Initialize the registers	
	R[0] = 16'b0;
	R[1] = 16'b0;
	R[2] = 16'b0;
	R[3] = 16'b0;
	
	// Display a header
	$display("Time	PC	IR	opcode	R0	R1	R2	R3	mof");
	
	// Prints the values anytime a value changes
	$monitor("%0d	%d	%b	%b	%d	%d	%d	%d	%b", $time, PC, IR, opcode, R[0], R[1], R[2], R[3], mof);

	// Dumpfiles for simulation
	$dumpfile("ultra3.vcd");
	$dumpvars(0, ultra3);

end

// main_process will loop until simulation is over
always
begin: main_process

	// use while loop to simulate the processor		
	while(1)
	begin
		// IF
		IR = MEM[PC];
		$display("Decoding at Time %d; PC=%d: ", $time, PC); 
		PC = PC + 1;
		#1;
		// ID
		opcode = IR[15:12];
		rd = IR[11:10];
		rs = IR[9:8];
		rt = IR[7:6];
		IM = IR[5:0];
		IM_16 = {{10{IM[5]}},IM[5:0]};
		mof = 1'b0;
		msb = 1'b0;
		temp = 16'b0;
		counter = 16'b0;
		#1;

		// EX, MEM, and WB stages are different depending on the
		// opcode. This case selection sorts the instruction based on
		// the opcode and operates accordingly.
		case (opcode)
			4'b0000: // LOAD
				begin
					if(rs!=0)
					begin
						// EX
						ALU = R[rs]+IM_16;
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
						$display("Time %d LOAD R[%d], (%d)R[%d]",$time, rd, IM, rs);
					end
					else
					begin
						ALU = IM_16;
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
						$display("Time %d LOAD R[%d], %d",$time, rd, IM);
					end
				end
			4'b0001: // LOADI
				begin
					// WB
					// If rd is 00, don't change anything.
					// Keep R0 as zero.
					if(rd!=0)
					begin
						// Signed extend the immediate to 16 bits.
						R[rd] = IM_16;
					end
					#1;
					$display("Time %d LOADI R[%d], %d", $time, rd, IM);
				end
			4'b0010: // STORE
				begin
					if(rs!=0)
					begin
						// EX
						ALU = R[rs]+IM_16;
						#1;
						// MEM
						MD = R[rd];
						MEM[ALU] = MD;
						#1;
						$display("Time %d STORE R[%d], (%d)R[%d]", $time, rd, IM, rs);
					end
					else
					begin
						ALU = IM_16;
						// MEM
						MD = R[rd];
						MEM[ALU] = MD;
						#1;
						$display("Time %d STORE R[%d], %d", $time, rd, IM);
					end
				end
			4'b0011: // STOREI
				begin
					// MEM
					MD = R[rd];
					MEM[IM] = MD;
					#1;
					$display("Time %d STOREI R[%d], %d", $time, rd, IM);
				end
			4'b0100: // ADD
				begin 
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
					$display("Time %d ADD R[%d], R[%d], R[%d]", $time, rd, rs, rt);
				end
			4'b0101: // SUB
				begin
					// EX
					ALU = R[rs] - R[rt];
					#1;
					// WB
					// If rd is 00, don't change anything.
					// Keep R0 as zero.
					if(rd!=0)
					begin
						R[rd] = ALU;
					end
					#1;
					$display("Time %d SUB R[%d], R[%d], R[%d]", $time, rd, rs, rt);
				end
			4'b1000: // Multiply
				begin
					if(R[rs] > 0)
					begin
						msb = R[rt][15];
						temp = R[rt];
						counter = R[rs];
					end
					else if(R[rt] > 0)
					begin
						msb = R[rs][15];
						temp = R[rs];
						counter = R[rt];
					end
					else
					begin
						msb = 1'b0;
						temp = 0 - R[rs];
						counter = 0 - R[rt];
					end
					ALU = 16'b0;
					// EX
					while(counter!=0)
					begin
						counter = counter - 1;
						ALU = ALU + temp;
						if(ALU[15] != msb)
							mof = 1'b1;
					end
					if(mof == 1'b1)
						ALU = 16'b0;
					#1;
					// WB
					// If rd is 00, don't change anything.
					// Keep R0 as zero.
					if(rd != 0)
						R[rd] = ALU;
					#1;
					$display("Time %d MUL R[%d], R[%d], R[%d]", $time, rd, rs, rt);	
				end
			4'b1100:
				begin // JUMP or RJUMP
					case(rt)
						2'b00: // JUMP
							begin
								if(rs != 2'b0)
								begin
									// EX 
									ALU = R[rs]+IM_16;
									PC = ALU;
									#1;
									$display("Time %d JUMP (%d)R[%d]", $time, IM, rs);
								end
								else 
								begin
									PC = IM_16;
									$display("Time %d JUMP %d", $time, IM);
								end
							end
						2'b01: // RJUMP
							begin
								// EX
								//$display("mt: %d; PC: %d", $signed(mt), PC);
								ALU = PC-1+IM_16;
								PC = ALU;
								#1;
								$display("Time %d RJUMP %d", $time, IM);
							end
						default:
							begin
								$display("Unexpected Jump instruction.");
							end
					endcase
				end
			4'b1101: // BEQ
				begin
					// EX
					ALU = R[rs]-R[rt];
					if(ALU == 0)
						begin 
							ALU = PC-1+IM_16;
							PC = ALU;
							#1;
						end
					$display("Time %d BEQ R[%d], R[%d], %d", $time, rs, rt, IM);
				end
			4'b1110: // BNE
				begin
					// EX
					ALU = R[rs]-R[rt];
					if(ALU != 0)
						begin 
							ALU = PC-1+IM_16;
							PC = ALU;
							#1;
						end
					$display("Time %d BNE R[%d], R[%d], %d", $time, rs, rt, IM);
				end
			4'b1111: // BLT
				begin
					// EX
					ALU = R[rs]-R[rt];
					if(ALU < 0)
						begin 
							ALU = PC-1+IM_16;
							PC = ALU;
							#1;
						end
					$display("Time %d BLT R[%d], R[%d], %d", $time, rs, rt, IM);
				end
		endcase
	end

end

endmodule
