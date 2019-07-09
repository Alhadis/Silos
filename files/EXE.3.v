// build a module for execution
module EXE_Stage
	(
		clk,
		rst,
		Instruction_in,
		Instruction,
		BR_Type,
		EXE_Cmd,
		readdata1,
		readdata2,
		Immediate,
		data2,
		branch_taken,
		branch_address,
		ALU_result
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input	[31:0]	Instruction_in;
	input 	[3:0]	EXE_Cmd;
	input 	[1:0]	BR_Type;
	input 	[31:0]	readdata1;
	input 	[31:0]	readdata2;
	input	[31:0]	data2;
	input 	[31:0] 	Immediate;
	output	[31:0]	Instruction;
	output			branch_taken;
	output	[31:0]	branch_address;
	output	[31:0]	ALU_result;
	
	// pass instruction
	assign Instruction = Instruction_in;
	
	// arithmetic logic unit module
	ALU alu
	(
		.dataa(readdata1),
		.datab(data2),
		.Function(EXE_Cmd),
		.result(ALU_result)
	);
	
	// address selector
	assign branch_address = ((readdata2 << 2) + 4 + Instruction_in);
	
	// branch codition
	Condition_Check condition_check
	(
		.BR_Type(BR_Type),
		.readdata1(readdata1),
		.readdata2(readdata2),
		.branch_taken(branch_taken)
	);
endmodule
