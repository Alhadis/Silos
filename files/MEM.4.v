// build a module for instruction decode
module MEM_Stage
	(
		clk,
		rst,
		Instruction_in,
		Instruction
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input	[31:0]	Instruction_in;
	output	[31:0]	Instruction;
	
	// build module
	assign Instruction = Instruction_in;
	
endmodule
