// build a module for instruction decode register
module ID_Stage_reg
	(
		clk,
		rst,
		dest_in,
		readdata1_in,
		readdata2_in,
		Immediate_in,
		data1_in,
		data2_in,
		WB_En_in,
		MEM_R_En_in,
		MEM_W_En_in,
		BR_Type_in,
		EXE_Cmd_in,
		PC_in,
		dest,
		readdata1,
		readdata2,
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
	input 			WB_En_in;
	input 			MEM_R_En_in;
	input 			MEM_W_En_in;
	input 	[1:0]	BR_Type_in;
	input 	[3:0]	EXE_Cmd_in;
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
	output 	[1:0]	BR_Type;
	output 	[3:0]	EXE_Cmd;
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
	reg 	[4:0]	dest;
	reg		[31:0]	readdata1;
	reg		[31:0]	readdata2;
	reg 	[31:0]	Immediate;
	reg 	[31:0]	data1;
	reg 	[31:0]	data2;
	reg 			WB_En;
	reg 			MEM_R_En;
	reg 			MEM_W_En;
	reg		[31:0]	PC;
	
	// build module
	
	// pass instruction decode outputs
	always @(posedge clk)
	begin
		if(rst)
		begin
			dest <= 5'b0;
			readdata1 <= 32'b0;
			readdata2 <= 32'b0;
			Immediate <= 32'b0;
			data1 <= 32'b0;
			data2 <= 32'b0;
			WB_En <= 1'b0;
			MEM_R_En <= 1'b0;
			MEM_W_En <= 1'b0;
			BR_Type <= 2'b0;
			EXE_Cmd <= 4'b0;
			PC <= 32'b0;
		end
		else
		begin
			dest <= dest_in;
			readdata1 <= readdata1_in;
			readdata2 <= readdata2_in;
			Immediate <= Immediate_in;
			data1 <= data1_in;
			data2 <= data2_in;
			WB_En <= WB_En_in;
			MEM_R_En <= MEM_R_En_in;
			MEM_W_En <= MEM_W_En_in;
			BR_Type <= BR_Type_in;
			EXE_Cmd <= EXE_Cmd_in;
			PC <= PC_in;
		end
	end
	
endmodule
