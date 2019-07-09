
module add_const_design(clk, a, b, z);

	input               clk;

	input       [3:0]   a;
	input       [3:0]   b;
	output  reg [3:0]   z;

	always @(posedge clk)
		z <= a + b + 1'b0;

endmodule

