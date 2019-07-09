// build a module for register after instruction fetch stage
module IF_Stage_reg
	(
		clk,
		rst,
		PC_in,
		Instruction_in,
		PC,
		Instruction
	);
	
	// input and outputs
	input			clk;
	input			rst;
	input	[31:0]	PC_in;
	input	[31:0]	Instruction_in;
	output	[31:0]	PC;
	output	[31:0]	Instruction;
	
	// registers
	reg		[31:0]	PC;
	reg		[31:0]	Instruction;
	
	// build module
	
	// transition	between
	always @(posedge clk)
	begin
		if(rst)
		begin
			PC <= 32'b0;
			Instruction <= 32'b0;
		end
		else
		begin
			PC <= PC_in;
			Instruction <= Instruction_in;
		end
	end
	
endmodule
