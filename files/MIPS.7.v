// build a module for assembling
// FPGA: EP2C35F672C6
module MIPS
	(
		clk,
		rst,
		Sel,
		SRAMaddress, 	//	SRAM Address bus 18 Bits
		SRAMWEn, 			//	SRAM Write Enable
		SRAMdata, 		//	SRAM Data bus 16 Bits
	);

	// input and outputs
	input					clk;
	input					rst;
	input					Sel;
	output  			SRAMWEn;
	output [17:0]	SRAMaddress;
	inout	[15:0]	SRAMdata;

	// wires
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
	wire			Is_Imm1;
	wire			Is_Imm2;
	wire			Is_Imm3;
	wire			Is_Imm4;
	wire      shouldForward11;
	wire      shouldForward12;
	wire 			Branch_Taken;
	wire			SRAM_NOT_READY;
	wire			Stall;
	wire 			loadForwardStall;
	wire 			superStall;
	wire	[1:0]	BR_Type1;
	wire	[1:0]	BR_Type2;
	wire	[4:0]	src11;
	wire	[4:0]	src21;
	wire	[4:0]	src12;
	wire	[4:0]	src22;
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
	wire    [31:0]  forwardVal11;
	wire    [31:0]  forwardVal12;
	wire    [31:0]  memForwardVal;
	wire	[31:0]	WB_Data0;
	wire	[31:0]	WB_Data;
	wire	[31:0]	ALU_Result31;
	wire	[31:0]	ALU_Result32;
	wire	[31:0]	ALU_Result42;
	wire	[31:0]	Mem_Data1;
	wire	[31:0]	Mem_Data2;

	// assemble modules

	// instruction fetch
	IF_Stage IFS
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.loadForwardStall(loadForwardStall),
			.superStall(superStall),
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
			.loadForwardStall(loadForwardStall),
			.superStall(superStall),
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
			.WB_En(WB_En21),
			.MEM_R_En(MEM_R_En21),
			.MEM_W_En(MEM_W_En21),
			.Is_Imm(Is_Imm1),
			.BR_Type(BR_Type1),
			.EXE_Cmd(EXE_Cmd1),
			.readdata1(readdata11),
			.readdata2(readdata21),
			.Immediate(Immediate1),
			.data1(data11),
			.data2(data21),
			.src1(src11),
			.src2(src21),
			.dest(dest1)
		);
	// hazard detectoin unit
	Hazard HU
		(
			.Sel(Sel),
			.BR_Type(BR_Type1),
			.SRAM_NOT_READY( SRAM_NOT_READY ),
			.WB_En1(WB_En22),
			.WB_En2(WB_En32),
			.Is_Imm(Is_Imm1),
			.src1(src11),
			.src2(src21),
			.dest1(dest2),
			.dest2(dest3),
			.Stall(Stall),
			.superStall(superStall)
		);
	// instruction decode register
	ID_Stage_reg IDR
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.loadForwardStall(loadForwardStall),
			.superStall(superStall),
			.branch_taken(Branch_Taken),
			.readdata1_in(readdata11),
			.readdata2_in(readdata21),
			.Is_Imm_in(Is_Imm1),
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
			.src1_in(src11),
			.src2_in(src21),
			.readdata1(readdata12),
			.readdata2(readdata22),
			.Is_Imm(Is_Imm2),
			.Immediate(Immediate2),
			.data1(data12),
			.data2(data22),
			.src1(src12),
			.src2(src22),
			.dest(dest2),
			.WB_En(WB_En22),
			.MEM_R_En(MEM_R_En22),
			.MEM_W_En(MEM_W_En22),
			.BR_Type(BR_Type2),
			.EXE_Cmd(EXE_Cmd2),
			.PC(PC2)
		);
	ForwardUnit FU
    (
      .BR_Type(BR_Type2), // Pass BR_Type through levels
      .WB_En1(WB_En32),
      .WB_En2(WB_En42),
			.mem_W_En(MEM_W_En22),
			.mem_R_En1(MEM_R_En32),
			.mem_R_En2(MEM_R_En42),
      .Is_Imm(Is_Imm2),
      .src1(src12),
      .src2(src22),
			.readdata2(readdata22),
      .dest1(dest3),
      .dest2(dest4),
      .aluResult1(WB_Data0),
      .aluResult2(WB_Data),
      .srcOut1(forwardVal11),
      .srcOut2(forwardVal12),
			.memOut(memForwardVal),
      .shouldForward1(shouldForward11),
      .shouldForward2(shouldForward12),
			.loadForwardStall(loadForwardStall)
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
			.ALU_result(ALU_Result31),
            .shouldForward1(shouldForward11),
            .shouldForward2(shouldForward12),
            .forwardVal1(forwardVal11),
            .forwardVal2(forwardVal12)
		);
	// execution register
	EXE_Stage_reg EXER
		(
			.clk(clk),
			.rst(rst),
			.loadForwardStall(loadForwardStall),
			.superStall(superStall),
			.PC_in(PC2),
			.PC(PC3),
			.WB_En_in(WB_En22),
			.MEM_R_En_in(MEM_R_En22),
			.MEM_W_En_in(MEM_W_En22),
			.readdata_in(memForwardVal),
			.Is_Imm_in(Is_Imm2),
			.Immediate_in(Immediate3),
			.ALU_result_in(ALU_Result31),
			.dest_in(dest2),
			.WB_En(WB_En32),
			.MEM_R_En(MEM_R_En32),
			.MEM_W_En(MEM_W_En32),
			.readdata(readdata23),
			.Is_Imm(Is_Imm3),
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
			.aluResult(ALU_Result32),
			.readdata(Mem_Data1),
			.writedata(readdata23),
			.wbData(WB_Data0),
			.SRAMaddress( SRAMaddress ),
			.SRAMWEn( SRAMWEn ),
			.SRAM_NOT_READY( SRAM_NOT_READY ),
			.SRAMdata( SRAMdata )
		);
	// memory register
	MEM_Stage_reg MEMR
		(
			.clk(clk),
			.rst(rst),
			.superStall(superStall),
			.PC_in(PC3),
			.PC(PC4),
			.WB_En_in(WB_En32),
			.MEM_R_En_in(MEM_R_En32),
			.Is_Imm_in(Is_Imm3),
        	.ALU_result_in(ALU_Result32),
			.Mem_Data_in(Mem_Data1),
			.dest_in(dest3),
			.WB_En(WB_En42),
			.MEM_R_En(MEM_R_En42),
			.Is_Imm(Is_Imm4),
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
