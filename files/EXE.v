// build a module for execution
module EXE_Stage
	(
		BR_Type,
		EXE_Cmd,
		readdata1,
		readdata2,
		Immediate,
		shouldForward1,
		shouldForward2,
		PC_in,
		data2,
		forwardVal1,
		forwardVal2,
		branch_taken,
		branch_address,
		ALU_result
	);

	// input and output ports
	input shouldForward1;
	input shouldForward2;
	input [1:0]	BR_Type;
	input [3:0]	EXE_Cmd;
	input [31:0] readdata1;
	input [31:0] readdata2;
	input	[31:0] data2;
	input	[31:0] forwardVal1;
	input	[31:0] forwardVal2;
	input [31:0] Immediate;
	input [31:0] PC_in;
	output	branch_taken;
	output	[31:0] branch_address;
	output	[31:0] ALU_result;

	// wires and registers
	wire [31:0] aluData1;
	wire [31:0] aluData2;
	wire [31:0] conditionCheckData1;
	wire [31:0] conditionCheckData2;

	// arithmetic logic unit module
	assign aluData1 = shouldForward1 ? forwardVal1 : readdata1;
	assign aluData2 = shouldForward2 ? forwardVal2 : data2;

	ALU alu
	(
		.dataa(aluData1),
		.datab(aluData2),
		.Function(EXE_Cmd),
		.result(ALU_result)
	);

	// address selector
	assign branch_address = (Immediate << 2) - 4 + PC_in;

	// branch codition
	assign conditionCheckData1 = shouldForward1 ? forwardVal1 : readdata1;
	assign conditionCheckData2 = shouldForward2 ? forwardVal2 : readdata2;

	Condition_Check condition_check
	(
		.BR_Type(BR_Type),
		.readdata1(conditionCheckData1),
		.readdata2(conditionCheckData2),
		.branch_taken(branch_taken)
	);
endmodule
