module test;

	// registers and wires
	reg				clk;
	reg				rst;
	reg				alaki;
	wire	[5:0]	Instruction;
	
	// module under test
	MIPS UUT
	(
		clk,
		rst,
		Instruction
	);
	
	// write a test
	
	initial repeat (600) #(10) clk = ~clk;
	initial repeat (400) #(5) alaki = ~alaki;
	
	initial
	begin
		clk = 0; rst = 0; alaki = 0;
		#(35) rst = 1;
		#(40) rst = 0;
	end
	
endmodule
