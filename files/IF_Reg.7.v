// build a module for register after instruction fetch stage
module IF_Stage_reg
	(
		clk,
		rst,
		stall,
		loadForwardStall,
		superStall,
		branch_taken,
		Instruction_in,
		PC_in,
		Instruction,
		PC
	);

	// input and outputs
	input			clk;
	input			rst;
	input			stall;
	input 		loadForwardStall;
	input 		superStall;
	input			branch_taken;
	input	[31:0]	Instruction_in;
	input	[31:0]	PC_in;
	output	[31:0]	Instruction;
	output	[31:0]	PC;


	// registers
	reg		[31:0]	Instruction;
	reg		[31:0]	PC;

	// build module

	// transition	between
	always @(posedge clk)
	begin
		if(rst | branch_taken)
		begin
			Instruction <= 32'b0;
			PC <= 32'b0;
		end
		else
		begin
			if( ~stall & ~superStall & ~loadForwardStall)
			begin
				Instruction <= Instruction_in;
				PC <= PC_in;
			end
		end
	end

endmodule
