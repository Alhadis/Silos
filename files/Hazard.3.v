// build a module for hazard detection
module Hazard
	(
		Sel,
		BR_Type,
		SRAM_NOT_READY,
		WB_En1,
		WB_En2,
		Is_Imm,
		src1,
		src2,
		dest1,
		dest2,
		Stall,
		superStall
	);

	// define input and output ports
	input			Sel;
	input			WB_En1;
	input			WB_En2;
	input			Is_Imm;
	input			SRAM_NOT_READY;
	input	[1:0]	BR_Type;
	input	[4:0]	src1;
	input	[4:0]	src2;
	input	[4:0]	dest1;
	input	[4:0]	dest2;
	output			Stall;
	output 			superStall;

	// wires and registers
	wire    shouldForward1FromExe;
	wire    shouldForward2FromExe;
	wire    shouldForward1FromMem;
	wire    shouldForward2FromMem;
	wire		shouldForwardMemFromExe;
	wire		shouldForwardMemFromMem;

	// define branch types
	parameter NO_BRANCH_Code = 2'b0;
	parameter BEZ_Code = 2'b01;
	parameter BNE_Code = 2'b10;
	parameter JMP_Code = 2'b11;

	assign shouldForward1FromExe = !( src1 ^ dest1 ) & WB_En1 & |dest1;
	assign shouldForward2FromExe = !( src2 ^ dest1 ) & WB_En1 & (~Is_Imm | !(BR_Type ^ BNE_Code)) & |dest1;
	// assign shouldForwardMemFromExe = !( src2 ^ dest1 ) & WB_En1 & mem_W_En  & |dest1;
	assign shouldForward1FromMem = ((!( src1 ^ dest2 )) & WB_En2) & (|dest2);
	assign shouldForward2FromMem = ((!( src2 ^ dest2 )) & WB_En2 & (~Is_Imm | !(BR_Type ^ BNE_Code))) & |dest2;
	// assign shouldForwardMemFromMem = !( src2 ^ dest2 ) & WB_En2 & mem_W_En & |dest2;
	assign shouldForward1 = shouldForward1FromExe | shouldForward1FromMem;
	assign shouldForward2 = shouldForward2FromExe | shouldForward2FromMem;

	// build module
	assign Stall = ( shouldForward1 | shouldForward2) & Sel;
	assign superStall = SRAM_NOT_READY;


endmodule
