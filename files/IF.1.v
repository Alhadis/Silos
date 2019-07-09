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
			0:			Instruction = 32'b000000_00001_00010_00000_00000000000;
			1:			Instruction = 32'b000000_00011_00100_00000_00000000000;
			2:			Instruction = 32'b000000_00101_00110_00000_00000000000;
			3:			Instruction = 32'b000000_00111_01000_00010_00000000000;
			4:			Instruction = 32'b000000_01001_01010_00011_00000000000;
			5:			Instruction = 32'b000000_01011_01100_00000_00000000000;
			6:			Instruction = 32'b000000_01101_01110_00000_00000000000;
			default:	Instruction = 32'bx;
		endcase
	end
	
endmodule
			