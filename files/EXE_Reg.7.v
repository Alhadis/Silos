// build a module for execution
module EXE_Stage_reg
	(
			clk,
			rst,
			loadForwardStall,
			superStall,
			PC_in,
			WB_En_in,
			MEM_R_En_in,
			MEM_W_En_in,
			dest_in,
			readdata_in,
			Is_Imm_in,
			Immediate_in,
			ALU_result_in,
			PC,
			WB_En,
			MEM_R_En,
			MEM_W_En,
			readdata,
			dest,
			Is_Imm,
			Immediate,
			ALU_result
	);

	// input and output ports
	input			clk;
	input			rst;
	input 		loadForwardStall;
	input 		superStall;
	input			WB_En_in;
	input			MEM_R_En_in;
	input			MEM_W_En_in;
	input           Is_Imm_in;
	input	[4:0]	dest_in;
	input	[31:0]	readdata_in;
	input	[31:0]	PC_in;
	input	[31:0]	Immediate_in;
	input	[31:0]	ALU_result_in;
	output			WB_En;
	output			MEM_R_En;
	output			MEM_W_En;
	output          Is_Imm;
	output	[4:0]	dest;
	output	[31:0]	readdata;
	output	[31:0]	PC;
	output	[31:0]	Immediate;
	output	[31:0]	ALU_result;

	// registers
	reg				WB_En;
	reg				MEM_R_En;
	reg				MEM_W_En;
	reg             Is_Imm;
	reg		[4:0]	dest;
	reg		[31:0]	readdata;
	reg		[31:0]	PC;
	reg		[31:0]	Immediate;
	reg		[31:0]	ALU_result;

	// build module
	always @(posedge clk)
	begin
		if(rst)
		begin
			dest <= 5'b0;
			PC <= 32'b0;
			WB_En <= 1'b0;
			MEM_R_En <= 1'b0;
			MEM_W_En <= 1'b0;
			Is_Imm <= 1'b0;
			readdata <= 32'b0;
			Immediate <= 32'b0;
			ALU_result <= 32'b0;
		end
		else
		begin
			if (~superStall & ~loadForwardStall) begin
				dest <= dest_in;
				PC <= PC_in;
				WB_En <= WB_En_in;
				MEM_R_En <= MEM_R_En_in;
				MEM_W_En <= MEM_W_En_in;
				Is_Imm <= Is_Imm_in;
				readdata <= readdata_in;
				Immediate <= Immediate_in;
				ALU_result <= ALU_result_in;
			end
		end
	end

endmodule
