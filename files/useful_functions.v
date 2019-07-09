`timescale 1ns / 1ps
// ------------------------------------------------------------------------------------------------
// Projects: LDPC Derate Matching
// Creation: Charles
// Creation Date: 8/14 2018
// Version: v1.0
// Content:
//      Create the file
// ------------------------------------------------------------------------------------------------
`include "define.vh"

module one_hot_enc(
    input   wire    [`D_WIDTH_LOG2-1:0] decimal_in,
    output  wire    [`DATA_WIDTH-1:0]   one_hot_out
    );

// 1. function clogb2
function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction // clogb2

// 2. function STR_TO_INT
function integer STR_TO_INT;

input [7:0] in;

begin
	if(in == "8")
		STR_TO_INT = 8;
	else if(in == "4")
		STR_TO_INT = 4;
	else
		STR_TO_INT = 0;
end
endfunction // STR_TO_INT
    
endmodule
