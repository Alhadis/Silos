`include "../../src/verilog/jh512.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:11 05/11/2019
// Design Name:   JH512
// Module Name:   H:/jh/jh_tb.v
// Project Name:  jh
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JH512
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tester_v_jh512;

	// Inputs
	reg clk;
	reg [1023:0] state;
	reg [127:0] data;

	// Outputs
	wire [511:0] hash;
	
	// Instantiate the Unit Under Test (UUT)
	JH512 uut (
		.clk(clk), 
		.state(state), 
		.data(data), 
		.hash(hash)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		data = 128'd7659432094555543122297600000000654;
		state = 1024'd345;
	end
   	always begin
		#1 clk = ~clk;
   	end
endmodule

