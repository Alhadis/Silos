// build a module for instruction decode
module ID_Stage_reg
	(
		clk,
		rst,
		PC_in,
		PC
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input	[31:0]	PC_in;
	output	[31:0]	PC;
	
	// registers
	reg		[31:0]	PC;
	
	// build module
	always @(posedge clk)
	begin
		if(rst)
			PC <= 32'b0;
		else
			PC = PC_in;
	end
	
endmodule
