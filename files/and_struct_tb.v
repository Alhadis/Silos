// Testbench for and_struct

`timescale 1ns/1ns
module and_struct_tb();
	reg clk;
	reg [1:0] count;
	wire f;
	initial begin
		clk = 1;
		count = -1;
	end
	always #5 clk = ~clk;
	always @(posedge clk)
		count = count + 1;
	and_struct MUT(count[1], count[0], f);	
endmodule //and_struct_tb
	
