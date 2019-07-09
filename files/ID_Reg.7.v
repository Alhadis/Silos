// build a module for instruction decode register
module ID_Stage_reg
	(
		clk,
		rst,
		stall,
		loadForwardStall,
		superStall,
		branch_taken,
		src1_in,
		src2_in,
		dest_in,
		readdata1_in,
		readdata2_in,
		Is_Imm_in,
		Immediate_in,
		data1_in,
		data2_in,
		WB_En_in,
		MEM_R_En_in,
		MEM_W_En_in,
		BR_Type_in,
		EXE_Cmd_in,
		PC_in,
        src1,
        src2,
		dest,
		readdata1,
		readdata2,
		Is_Imm,
		Immediate,
		data1,
		data2,
		WB_En,
		MEM_R_En,
		MEM_W_En,
		BR_Type,
		EXE_Cmd,
		PC
	);

	// input and output ports
	input			clk;
	input			rst;
	input			stall;
	input 		loadForwardStall;
	input 		superStall;
	input			branch_taken;
	input 			WB_En_in;
	input 			MEM_R_En_in;
	input 			MEM_W_En_in;
	input           Is_Imm_in;
	input 	[1:0]	BR_Type_in;
	input 	[3:0]	EXE_Cmd_in;
	input   [4:0]   src1_in;
	input   [4:0]   src2_in;
	input 	[4:0]	dest_in;
	input	[31:0]	readdata1_in;
	input	[31:0]	readdata2_in;
	input 	[31:0]	Immediate_in;
	input 	[31:0]	data1_in;
	input 	[31:0]	data2_in;
	input	[31:0]	PC_in;
	output 			WB_En;
	output 			MEM_R_En;
	output 			MEM_W_En;
	output          Is_Imm;
	output 	[1:0]	BR_Type;
	output 	[3:0]	EXE_Cmd;
	output 	[4:0]	src1;
	output 	[4:0]	src2;
	output 	[4:0]	dest;
	output	[31:0]	readdata1;
	output	[31:0]	readdata2;
	output 	[31:0]	Immediate;
	output 	[31:0]	data1;
	output 	[31:0]	data2;
	output	[31:0]	PC;

	// registers
	reg 	[1:0]	BR_Type;
	reg 	[3:0]	EXE_Cmd;
	reg 	[4:0]	src1;
	reg 	[4:0]	src2;
	reg 	[4:0]	dest;
	reg		[31:0]	readdata1;
	reg		[31:0]	readdata2;
	reg 	[31:0]	Immediate;
	reg 	[31:0]	data1;
	reg 	[31:0]	data2;
	reg             Is_Imm;
	reg 			WB_En;
	reg 			MEM_R_En;
	reg 			MEM_W_En;
	reg		[31:0]	PC;

	// build module

	// pass instruction decode outputs
	always @(posedge clk)
	begin
		if(rst | branch_taken)
		begin
			dest <= 5'b0;
			readdata1 <= 32'b0;
			readdata2 <= 32'b0;
			Is_Imm <= 1'b0;
			Immediate <= 32'b0;
			data1 <= 32'b0;
			data2 <= 32'b0;
			WB_En <= 1'b0;
			MEM_R_En <= 1'b0;
			MEM_W_En <= 1'b0;
			BR_Type <= 2'b0;
			EXE_Cmd <= 4'b0;
			PC <= 32'b0;
			src1 <= 5'b0;
			src2 <= 5'b0;
			dest <= 5'b0;
		end
		else
		begin
			if (~stall & ~superStall & ~loadForwardStall)
			begin
				dest <= dest_in;
				readdata1 <= readdata1_in;
				readdata2 <= readdata2_in;
				Is_Imm <= Is_Imm_in;
				Immediate <= Immediate_in;
				data1 <= data1_in;
				data2 <= data2_in;
				WB_En <= WB_En_in;
				MEM_R_En <= MEM_R_En_in;
				MEM_W_En <= MEM_W_En_in;
				BR_Type <= BR_Type_in;
				EXE_Cmd <= EXE_Cmd_in;
				PC <= PC_in;
				src1 <= src1_in;
				src2 <= src2_in;
				dest <= dest_in;
			end
		end
	end

endmodule
