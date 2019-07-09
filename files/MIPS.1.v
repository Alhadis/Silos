// build a module for assembling
module MIPS
	(
		clk,
		rst,
		Seven_Segments
	);
	
	// input and outputs
	input			clk;
	input			rst;
	output	[27:0]	Seven_Segments;
	
	// wires
	wire	[31:0]	PC11;
	wire	[31:0]	Instruction11;
	wire	[31:0]	PC12;
	wire	[31:0]	Instruction12;
	wire	[31:0]	PC21;
	wire	[31:0]	PC22;
	wire	[31:0]	PC31;
	wire	[31:0]	PC32;
	wire	[31:0]	PC41;
	wire	[31:0]	PC42;
	wire	[31:0]	PC51;
	
	// assemble modules
	
	assign Seven_Segments = 
		{
			Instruction12[24:21],
			Instruction11[24:21],
			PC51[3:0],
			PC41[3:0],
			PC31[3:0],
			PC21[3:0],
			PC11[3:0]
		};
	
	// instruction fetch
	IF_Stage IFS
		(
			.clk(clk),
			.rst(rst),
			.PC(PC11),
			.Instruction(Instruction11)
		);
		
	// instruction fetch register
	IF_Stage_reg IFR
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC11),
			.Instruction_in(Instruction11),
			.PC(PC12),
			.Instruction(Instruction12)
		);
		
	// instruction decode
	ID_Stage IDS
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC12),
			.PC(PC21)
		);
	// instruction decode register
	ID_Stage_reg IDR
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC21),
			.PC(PC22)
		);
	// execution
	EXE_Stage EXES
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC22),
			.PC(PC31)
		);
	// execution register
	EXE_Stage_reg EXER
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC31),
			.PC(PC32)
		);
	// memory
	MEM_Stage MEMS
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC32),
			.PC(PC41)
		);
	// memory register
	MEM_Stage_reg MEMR
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC41),
			.PC(PC42)
		);
	// writeback
	WB_Stage WBS
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC42),
			.PC(PC51)
		);
	
endmodule
