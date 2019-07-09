// build a module for execution
module EXE_Stage
	(
		BR_Type,
		EXE_Cmd,
		readdata1,
		readdata2,
		Immediate,
		PC_in,
		data2,
		branch_taken,
		branch_address,
		ALU_result
	);
	
	// input and output ports
	output			branch_taken;
	input 	[1:0]	BR_Type;
	input 	[3:0]	EXE_Cmd;
	input 	[31:0]	readdata1;
	input 	[31:0]	readdata2;
	input	[31:0]	data2;
	input 	[31:0] 	Immediate;
	input 	[31:0]	PC_in;
	output	[31:0]	branch_address;
	output	[31:0]	ALU_result;
	
	// build module
	
	// arithmetic logic unit module
	ALU alu
	(
		.dataa(readdata1),
		.datab(data2),
		.Function(EXE_Cmd),
		.result(ALU_result)
	);
	
	// address selector
	assign branch_address = ({Immediate[31], (Immediate[30:0] << 2)} + 4 + PC_in);
	
	// branch codition
	Condition_Check condition_check
	(
		.BR_Type(BR_Type),
		.readdata1(readdata1),
		.readdata2(readdata2),
		.branch_taken(branch_taken)
	);
endmodule
