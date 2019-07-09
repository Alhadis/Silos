// build a module for instruction decode
module ID_Stage
	(
		clk,
		rst,
		writedata,
		write,
		instruction_in,
		readdata1,
		readdata2,
		PC,
		Immediate,
		data2,
		dest
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input			write;
	input	[31:0]	writedata;
	input	[31:0]	instruction_in;
	output	[31:0]	readdata1;
	output	[31:0]	readdata2;
	output	[31:0]	PC;
	output 	[31:0]	Immediate;
	output 	[31:0]	data2;
	output 	[5:0]	dest;
	
	// wires and register
	wire 		Is_Imm;
	wire 		WB_En;
	wire 		MEM_R_En;
	wire 		MEM_W_En;
	wire [3:0] 	EXE_Cmd;
	wire [1:0]	BR_Type;
	
	// build module
	assign PC = instruction_in;
	
	// control unit
	Controller CU
	(
		.Opcode(instruction_in[31:26]),
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
		.readaddress1(instruction_in[25:21]),
		.readaddress2(instruction_in[20:16]),
		.writeaddress(instruction_in[15:11]),
		.writedata(writedata),
		.write(write),
		.readdata1(readdata1),
		.readdata2(readdata2)
	);
	
	// sign extend
	assign Immediate = {{16{instruction_in[15]}}, instruction_in[15:0]};
	
	// data 2 mux
	assign data2 = (Is_Imm) ? Immediate : readdata2;
	
	// destination
	assign dest = (Is_Imm) ? instruction_in[20:16] : instruction_in[15:11];
	
endmodule
