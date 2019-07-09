// build a module for execution
module EXE_Stage_reg
	(
			clk,
			rst,
			Instruction_in,
			Instruction,
			WB_En_in,
			MEM_R_En_in,
			MEM_W_En_in,
			ALU_result_in,
			WB_En,
			MEM_R_En,
			MEM_W_En,
			ALU_result
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input	[31:0]	Instruction_in;
	output	[31:0]	Instruction;
	input			WB_En_in;
	input			MEM_R_En_in;
	input			MEM_W_En_in;
	input	[31:0]	ALU_result_in;
	output			WB_En;
	output			MEM_R_En;
	output			MEM_W_En;
	output	[31:0]	ALU_result;
	
	// registers
	reg		[31:0]	Instruction;
	reg				WB_En;
	reg				MEM_R_En;
	reg				MEM_W_En;
	reg		[31:0]	ALU_result;
	
	// build module
	always @(posedge clk)
	begin
		if(rst)
		begin
			Instruction <= 32'b0;
			WB_En <= 1'b0;
			MEM_R_En <= 1'b0;
			MEM_W_En <= 1'b0;
			ALU_result <= 32'b0;
		end
		else
		begin
			Instruction <= Instruction_in;
			WB_En <= WB_En_in;
			MEM_R_En <= MEM_R_En_in;
			MEM_W_En <= MEM_W_En_in;
			ALU_result <= ALU_result_in;
		end
	end
	
endmodule
