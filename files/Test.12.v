module test;

	// registers and wires
	reg				clk;
	reg				rst;
	wire	[27:0]	Seven_Segments;
	
	// module under test
	MIPS UUT
	(
		clk,
		rst,
		Seven_Segments
	);
	
	// write a test
	
	initial repeat (200) #(10) clk = ~clk;
	
	initial
	begin
		clk = 0; rst = 0;
		#(35) rst = 1;
		#(40) rst = 0;
	end
	
endmodule
