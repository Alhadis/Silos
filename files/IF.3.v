// build a module for instruction fetch stage
module IF_Stage
	(
		clk,
		rst,
		Instruction,
		branch_taken,
		branch_address,
		PC
	);
	
	// define input and output ports
	input			clk;
	input			rst;
	output	[31:0]	Instruction;
	output 			branch_taken;
	output	[31:0]	branch_address;
	output	[31:0]	PC;
	
	// registers
	reg		[31:0]	PC;
	reg		[31:0]	Instruction;
	
	// build module
	
	// build program counter
	always @(posedge clk)
	begin
		if(rst)
			PC <= 32'b0;
		else
		begin
			if(branch_taken)
				PC <= branch_address;
			else
				PC <= PC + 4;
		end
	end
	
	// build instruction memory
	always @(*)
	begin
		case(PC)
			0:			Instruction = 32'b000000_00001_00010_00000_00000000000; // No Operation
			4:			Instruction = 32'b000001_00011_00100_00000_00000000000; // Add r3 r4 r0
			8:			Instruction = 32'b000011_00011_00100_00000_00000000000; // Sub r3 r4 r0
			12:			Instruction = 32'b000101_00011_00100_00000_00000000000; // And r3 r4 r0
			16:			Instruction = 32'b000110_00011_00100_00000_00000000000; // Or  r3 r4 r0
			20:			Instruction = 32'b000111_00011_00100_00000_00000000000; // Nor r3 r4 r0
			24:			Instruction = 32'b001000_00011_00100_00000_00000000000; // Xor r3 r4 r0
			28:			Instruction = 32'b001001_00011_00100_00000_00000000000; // SLA r3 r4 r0
			32:			Instruction = 32'b001010_00011_00100_00000_00000000000; // SLL r3 r4 r0
			36:			Instruction = 32'b001011_00011_00100_00000_00000000000; // SRA r3 r4 r0
			40:			Instruction = 32'b001100_00011_00100_00000_00000000000; // SRL r3 r4 r0

			44:			Instruction = 32'b100000_00101_00110_00000_00000000010; // AddI r5 r6 2
			48:			Instruction = 32'b100001_00101_00110_00000_00000000010; // SubI r5 r6 2
			52:			Instruction = 32'b100100_00111_01000_00010_00000000000; // LD r7 r8 
			56:			Instruction = 32'b100101_01001_01010_00011_00000000000; // ST r9 r10
			60:			Instruction = 32'b101000_01011_00000_00000_00000000000; // BEZ r11 0
			64:			Instruction = 32'b101001_01101_01110_00000_00000000000; // BNE r13 r14 0
			68:			Instruction = 32'b101010_01101_01110_00000_00000000000; // JMP 0
			default:	Instruction = {32{1'bx}};
		endcase
	end
	
endmodule
			