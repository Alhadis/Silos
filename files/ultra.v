// CSCI 320 - Computer Architecture
// Lab 2 - 9/10/13
// Author: Yifan Ge
// 
// 
//

module ultra;

	// declare registers and flip-flops
	reg [7:0] AC, IR, MD, PC, MA, ALU;
	reg [7:0] MEM[0:63]; 
	reg [1:0] opcode;

initial begin: stop_at
	// Will stop the execution after 20 simulation units.
	#100; $finish;   
end

// These statements done at simulation time 0 (since no #k)
initial begin: Init
	
	// Hardcode the program in the memory starting at address 0
	MEM[0] = 8'b00010000; // LOAD INPUT
	MEM[1] = 8'b01010010; // STORE OUTPUT
	MEM[2] = 8'b10010001; // ADD INCREMENT
	MEM[3] = 8'b11000001; // JUMP 1
	
	// Hardcode the immediates
	MEM[16] = 5; // input
	MEM[17] = 1; // increment
	MEM[18] = 0; // output

	// Initialize the registers AC, IR, MD, PC, MA
	AC = 8'b0;
	IR = 8'b0;
	MD = 8'b0;
	PC = 8'b0;
	MA = 8'b0;
	
	ALU = 8'b0;
	opcode = 2'b0;

	// Display a header
	$display("Time	PC	opcode	IR	AC	MD	MA	ALU	OUTPUT");
	
	// Prints the values anytime a value changes
	$monitor("	%0d	%b	%b	%b	%b	%b	%b	%b	%0d", $time, PC, opcode, IR, AC, MD, MA, ALU, MEM[18]);

	// Dumpfiles for simulation
	$dumpfile("ultra.vcd");
	$dumpvars(0, ultra);

end

// main_process will loop until simulation is over
always
begin: main_process
		
	while(1)
	begin
		// IF
		IR = MEM[PC];
		PC = PC + 1; 
		#1;
		// ID
		opcode = IR[7:6];
		MA = IR[5:0];
		#1;
		case (opcode)
			2'b00: 
				begin // LOAD
					// MEM
					MD = MEM[MA];
					#1;
					// WB
					AC = MD;
					#1;
				end
			2'b01:
				begin // STORE
					// MEM
					MD = AC;
					MEM[MA] = MD;
					#1;
				end
			2'b10:
				begin // ADD
					// MEM
					MD = MEM[MA];
					#1;
					// EX
					ALU = AC + MD;
					#1;
					// WB
					AC = ALU;
					#1;
				end
			2'b11:
				begin // JUMP
					PC = MA;
				end
		endcase
	end

end

endmodule
