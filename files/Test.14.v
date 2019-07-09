module test;

	// registers and wires
	reg				clk;
	reg				rst;
	
	// module under test
	MIPS UUT
	(
		clk,
		rst
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
