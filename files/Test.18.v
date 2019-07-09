module test;

	// registers and wires
	reg				clk;
	reg				rst;
	reg				Sel;
	wire	[5:0]	Instruction;
	
	// module under test
	MIPS UUT
	(
		clk,
		rst,
		Sel,
		Instruction
	);
	
	// write a test
	
	initial repeat (650) #(10) clk = ~clk;
	
	initial
	begin
		Sel = 0;
				clk = 0; 	rst = 0;
		#( 35 ) rst = 1;
		#( 40 ) rst = 0;
	end
	
endmodule
