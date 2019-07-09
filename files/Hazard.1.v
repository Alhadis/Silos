// build a module for hazard detection
module Hazard
	(
		Stall_Special_Condition,
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
	input			Stall_Special_Condition;
	input			WB_En1;
	input			WB_En2;
	input			Is_Imm;
	input	[4:0]	src1;
	input	[4:0]	src2;
	input	[4:0]	dest1;
	input	[4:0]	dest2;
	output			Stall;
	
	// build module
	assign Stall =	( !( src1 ^ dest1 ) & WB_En1 ) |
					( !( src2 ^ dest1 ) & WB_En1 & (~Is_Imm | Stall_Special_Condition) ) |
					( !( src1 ^ dest2 ) & WB_En2 )  |
					( !( src2 ^ dest2 ) & WB_En2 & (~Is_Imm | Stall_Special_Condition) );
	
endmodule
