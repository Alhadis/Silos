// build a module for checking condition
module Condition_Check
	(
		BR_Type,
		readdata1,
		readdata2,
		branch_taken
	);
	
	// input and output ports
	input 	[1:0]	BR_Type;
	input 	[31:0]	readdata1;
	input 	[31:0]	readdata2;
	output			branch_taken;
	
	// wires and registers
	reg				branch_taken;
	
	// define branch types
	parameter NO_BRANCH = 2'b0;
	parameter BEZ = 2'b01;
	parameter BNE = 2'b10;
	parameter JMP = 2'b11;
	
	// build module
	
	// pass instruction
	always @(*)
	begin
		case(BR_Type)
			BEZ:
				branch_taken = (readdata1 == 0);
			BNE:
				branch_taken = (readdata1 != readdata2);
			JMP:
				branch_taken = 1;
			NO_BRANCH:
				branch_taken = 0;
			default:
				branch_taken = 1'bx;
		endcase
	end
endmodule

