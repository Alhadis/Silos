`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:44 10/08/2014
// Design Name:   pwm
// Module Name:   /home/bjones/src/fpga-led-counter/test/pwm_tb.v
// Project Name:  fpga-led-counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pwm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pwm_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] compare0;
	reg [7:0] compare1;
	reg [7:0] compare2;
	reg [7:0] compare3;

	// Outputs
	wire [3:0] pwm;

	// Instantiate the Unit Under Test (UUT)
	pwm uut0 (
		.clk(clk), 
		.rst(rst), 
		.compare(compare0), 
		.pwm(pwm[0])
	);
	pwm uut1 (
		.clk(clk), 
		.rst(rst), 
		.compare(compare1), 
		.pwm(pwm[1])
	);
	pwm uut2 (
		.clk(clk), 
		.rst(rst), 
		.compare(compare2), 
		.pwm(pwm[2])
	);
	pwm uut3 (
		.clk(clk), 
		.rst(rst), 
		.compare(compare3), 
		.pwm(pwm[3])
	);

	// clock and reset block
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#100;
		// toggle clock a bit
		repeat(4) #10 clk = ~clk;
		// bring rst low
		rst = 0;
		// generate the clock forever
		forever #10 clk = ~clk;
	end
	
	// set parameters for pwm modules
	initial begin
		compare0 = 0;
		compare1 = 0;
		compare2 = 0;
		compare3 = 0;
		@(negedge rst);  // wait for reset to lower
		compare0 = 192;  // 75% 
		compare1 = 128;  // 50% duty cycle
		compare2 = 64;   // 25% duty cycle
		compare3 = 32;   // 12.5% duty cycle
		repeat(1000) @(posedge clk);
		$finish;
	end
      
endmodule

