// build a module for assembling
module MIPS
	(
		clk,
		rst,
		Instruction
	);
	
	// input and outputs
	input			clk;
	input			rst;
	output	[5:0]	Instruction;
	
	// wires
	wire 			Stall_Special_Condition;
	wire 			WB_En21;
	wire			WB_En22;
	wire			WB_En32;
	wire			WB_En42;
	wire			MEM_R_En21;
	wire			MEM_R_En22;
	wire			MEM_R_En32;
	wire			MEM_R_En42;
	wire			MEM_W_En21;
	wire			MEM_W_En22;
	wire			MEM_W_En32;
	wire			Is_Imm;
	wire 			Branch_Taken;
	wire			Stall;
	wire	[1:0]	BR_Type1;
	wire	[1:0]	BR_Type2;
	wire	[4:0]	src1;
	wire	[4:0]	src2;
	wire	[4:0]	dest1;
	wire	[4:0]	dest2;
	wire	[4:0]	dest3;
	wire	[4:0]	dest4;
	wire	[3:0]	EXE_Cmd1;
	wire	[3:0]	EXE_Cmd2;
	wire	[31:0]	PC11;
	wire	[31:0]	PC12;
	wire	[31:0]	PC2;
	wire	[31:0]	PC3;
	wire	[31:0]	PC4;
	wire	[31:0]	Instruction1;
	wire	[31:0]	Instruction2;
	wire 	[31:0] 	Branch_Address;
	wire	[31:0]	readdata11;
	wire	[31:0]	readdata12;
	wire	[31:0]	readdata21;
	wire	[31:0]	readdata22;
	wire	[31:0]	readdata23;
	wire	[31:0]	data11;
	wire	[31:0]	data12;
	wire	[31:0]	data21;
	wire	[31:0]	data22;
	wire	[31:0]	Immediate1;
	wire	[31:0]	Immediate2;
	wire	[31:0]	Immediate3;
	wire	[31:0]	WB_Data;
	wire	[31:0]	ALU_Result31;
	wire	[31:0]	ALU_Result32;
	wire	[31:0]	ALU_Result42;
	wire	[31:0]	Mem_Data1;
	wire	[31:0]	Mem_Data2;
	
	// assemble modules
	
	// output
	assign Instruction = Instruction1[31:26];
	
	// instruction fetch
	IF_Stage IFS
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.branch_address(Branch_Address),
			.Instruction(Instruction1),
			.branch_taken(Branch_Taken),
			.PC(PC11)
		);
		
	// instruction fetch register
	IF_Stage_reg IFR
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.branch_taken(Branch_Taken),
			.Instruction_in(Instruction1),
			.PC_in(PC11),
			.Instruction(Instruction2),
			.PC(PC12)
		);
		
	// instruction decode
	ID_Stage IDS
		(
			.clk(clk),
			.rst(rst),
			.writedata(WB_Data),
			.write(WB_En42),
			.lastDestination(dest4),
			.Instruction_in(Instruction2),
			.Stall_Special_Condition(Stall_Special_Condition),
			.WB_En(WB_En21),
			.MEM_R_En(MEM_R_En21),
			.MEM_W_En(MEM_W_En21),
			.Is_Imm(Is_Imm),
			.BR_Type(BR_Type1),
			.EXE_Cmd(EXE_Cmd1),
			.readdata1(readdata11),
			.readdata2(readdata21),
			.Immediate(Immediate1),
			.data1(data11),
			.data2(data21),
			.src1(src1),
			.src2(src2),
			.dest(dest1)
		);
	// hazard detectoin unit
	Hazard HU
		(
			.Stall_Special_Condition(Stall_Special_Condition),
			.WB_En1(WB_En22),
			.WB_En2(WB_En32),
			.Is_Imm(Is_Imm),
			.src1(src1),
			.src2(src2),
			.dest1(dest2),
			.dest2(dest3),
			.Stall(Stall)
		);
	// instruction decode register
	ID_Stage_reg IDR
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.branch_taken(Branch_Taken),
			.readdata1_in(readdata11),
			.readdata2_in(readdata21),
			.Immediate_in(Immediate1),
			.data1_in(data11),
			.data2_in(data21),
			.dest_in(dest1),
			.WB_En_in(WB_En21),
			.MEM_R_En_in(MEM_R_En21),
			.MEM_W_En_in(MEM_W_En21),
			.BR_Type_in(BR_Type1),
			.EXE_Cmd_in(EXE_Cmd1),
			.PC_in(PC12),
			.readdata1(readdata12),
			.readdata2(readdata22),
			.Immediate(Immediate2),
			.data1(data12),
			.data2(data22),
			.dest(dest2),
			.WB_En(WB_En22),
			.MEM_R_En(MEM_R_En22),
			.MEM_W_En(MEM_W_En22),
			.BR_Type(BR_Type2),
			.EXE_Cmd(EXE_Cmd2),
			.PC(PC2)
		);
	// execution
	EXE_Stage EXES
		(
			.BR_Type(BR_Type2),
			.EXE_Cmd(EXE_Cmd2),
			.readdata1(data12),
			.readdata2(readdata22),
			.Immediate(Immediate2),
			.data2(data22),
			.branch_taken(Branch_Taken),
			.PC_in(PC11),
			.branch_address(Branch_Address),
			.ALU_result(ALU_Result31)
		);
	// execution register
	EXE_Stage_reg EXER
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC2),
			.PC(PC3),
			.WB_En_in(WB_En22),
			.MEM_R_En_in(MEM_R_En22),
			.MEM_W_En_in(MEM_W_En22),
			.readdata_in(readdata22),
			.Immediate_in(Immediate3),
			.ALU_result_in(ALU_Result31),
			.dest_in(dest2),
			.WB_En(WB_En32),
			.MEM_R_En(MEM_R_En32),
			.MEM_W_En(MEM_W_En32),
			.readdata(readdata23),
			.Immediate(Immediate3),
			.ALU_result(ALU_Result32),
			.dest(dest3)
		);
	// memory
	MEM_Stage MEMS
		(
			.clk(clk),
			.rst(rst),
			.read(MEM_R_En32),
			.write(MEM_W_En32),
			.address(ALU_Result32[15:0]),
			.readdata(Mem_Data1),
			.writedata(readdata23)
		);
	// memory register
	MEM_Stage_reg MEMR
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC3),
			.PC(PC4),
			.WB_En_in(WB_En32),
			.MEM_R_En_in(MEM_R_En32),
			.ALU_result_in(ALU_Result32),
			.Mem_Data_in(Mem_Data1),
			.dest_in(dest3),
			.WB_En(WB_En42),
			.MEM_R_En(MEM_R_En42),
			.ALU_result(ALU_Result42),
			.Mem_Data(Mem_Data2),
			.dest(dest4)
		);
	// writeback
	WB_Stage WBS
		(
			.MEM_R_En(MEM_R_En42),
			.ALU_result(ALU_Result42),
			.Mem_Data(Mem_Data2),
			.WB_Data(WB_Data)
		);
	
endmodule
