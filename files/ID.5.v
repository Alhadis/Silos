// build a module for instruction decode
module ID_Stage
	(
		clk,
		rst,
		writedata,
		write,
		lastDestination,
		Instruction_in,
		Stall_Special_Condition,
		WB_En,
		MEM_R_En,
		MEM_W_En,
		Is_Imm,
		BR_Type,
		EXE_Cmd,
		readdata1,
		readdata2,
		Immediate,
		data1,
		data2,
		src1,
		src2,
		dest
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input			write;
	input	[4:0]	lastDestination;
	input	[31:0]	writedata;
	input	[31:0]	Instruction_in;
	output			Stall_Special_Condition;
	output 			WB_En;
	output 			MEM_R_En;
	output 			MEM_W_En;
	output			Is_Imm;
	output 	[1:0]	BR_Type;
	output 	[3:0] 	EXE_Cmd;
	output 	[4:0]	src1;
	output 	[4:0]	src2;
	output 	[4:0]	dest;
	output	[31:0]	readdata1;
	output	[31:0]	readdata2;
	output 	[31:0]	Immediate;
	output 	[31:0]	data1;
	output 	[31:0]	data2;
	
	// build module
	
	// control unit
	Controller CU
	(
		.Opcode(Instruction_in[31:26]),
		.Stall_Special_Condition(Stall_Special_Condition),
		.Is_Imm(Is_Imm),
		.WB_En(WB_En),
		.MEM_R_En(MEM_R_En),
		.MEM_W_En(MEM_W_En),
		.EXE_Cmd(EXE_Cmd),
		.BR_Type(BR_Type)
	);
	
	// register file
	Register_File RF
	(
		.clk(clk),
		.rst(rst),
		.readaddress1(src1),
		.readaddress2(src2),
		.writeaddress(lastDestination),
		.writedata(writedata),
		.write(write),
		.readdata1(readdata1),
		.readdata2(readdata2)
	);
	
	// sign extend
	assign Immediate = {{16{Instruction_in[15]}}, Instruction_in[15:0]};
	
	// data 1 mux
	assign data1 = readdata1;
	
	// data 2 mux
	assign data2 = (Is_Imm) ? Immediate : readdata2;
	
	// sources
	assign src1 = 	Instruction_in[25:21];
	assign src2 = 	Instruction_in[20:16];
	
	// destination
	assign dest = (Is_Imm) ? Instruction_in[20:16] : Instruction_in[15:11];
	
endmodule
