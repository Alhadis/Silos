// build a module for instruction fetch stage
module IF_Stage
	(
		clk,
		rst,
		PC,
		Instruction
	);
	
	// define input and output ports
	input			clk;
	input			rst;
	output	[31:0]	PC;
	output	[31:0]	Instruction;
	
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
			PC <= PC + 1;
	end
	
	// build instruction memory
	always @(*)
	begin
		case(PC)
			0:			Instruction = 32'b000000_00001_00010_00000_00000000000; // No Operation
			1:			Instruction = 32'b000001_00011_00100_00000_00000000000; // Add r3 r4 r0
			2:			Instruction = 32'b000011_00011_00100_00000_00000000000; // Sub r3 r4 r0
			3:			Instruction = 32'b000101_00011_00100_00000_00000000000; // And r3 r4 r0
			4:			Instruction = 32'b000110_00011_00100_00000_00000000000; // Or  r3 r4 r0
			5:			Instruction = 32'b000111_00011_00100_00000_00000000000; // Nor r3 r4 r0
			6:			Instruction = 32'b001000_00011_00100_00000_00000000000; // Xor r3 r4 r0
			7:			Instruction = 32'b001001_00011_00100_00000_00000000000; // SLA r3 r4 r0
			8:			Instruction = 32'b001010_00011_00100_00000_00000000000; // SLL r3 r4 r0
			9:			Instruction = 32'b001011_00011_00100_00000_00000000000; // SRA r3 r4 r0
			10:			Instruction = 32'b001100_00011_00100_00000_00000000000; // SRL r3 r4 r0

			11:			Instruction = 32'b100000_00101_00110_00000_00000000010; // AddI r5 r6 2
			12:			Instruction = 32'b100001_00101_00110_00000_00000000010; // SubI r5 r6 2
			13:			Instruction = 32'b100100_00111_01000_00010_00000000000; // LD r7 r8 
			14:			Instruction = 32'b100101_01001_01010_00011_00000000000; // ST r9 r10
			15:			Instruction = 32'b101000_01011_00000_00000_00000000000; // BEZ r11 0
			16:			Instruction = 32'b101001_01101_01110_00000_00000000000; // BNE r13 r14 0
			17:			Instruction = 32'b101001_01101_01110_00000_00000000000; // JMP 0
			default:	Instruction = 32'bx;
		endcase
	end
	
endmodule
			