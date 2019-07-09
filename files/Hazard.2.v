// build a module for hazard detection
module Hazard
	(
		Sel,
		BR_Type,
		WB_En1,
		WB_En2,
		Is_Imm,
		src1,
		src2,
		dest1,
		dest2,
		Stall
	);
	
	// define input and output ports
	input			Sel;
	input			WB_En1;
	input			WB_En2;
	input			Is_Imm;
	input	[1:0]	BR_Type;
	input	[4:0]	src1;
	input	[4:0]	src2;
	input	[4:0]	dest1;
	input	[4:0]	dest2;
	output			Stall;

	// define branch types	
	parameter NO_BRANCH_Code = 2'b0;
	parameter BEZ_Code = 2'b01;
	parameter BNE_Code = 2'b10;
	parameter JMP_Code = 2'b11;
	
	// build module
	assign Stall =	( ( |src1 & !( src1 ^ dest1 ) & WB_En1 ) |
					( |src2 & !( src2 ^ dest1 ) & WB_En1 & (~Is_Imm | !(BR_Type ^ BNE_Code) ) ) |
					( |src1 & !( src1 ^ dest2 ) & WB_En2 )  |
					( |src2 & !( src2 ^ dest2 ) & WB_En2 & (~Is_Imm | !(BR_Type ^ BNE_Code) ) ) ) &
					Sel;
	
endmodule
