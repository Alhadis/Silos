`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:39:34 11/25/2017
// Design Name:   TestLCD
// Module Name:   C:/Users/shala/Documents/Verilog files/Display_LED/testbench.v
// Project Name:  Display_LED
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TestLCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clk;

	// Outputs
	wire sf_e;
	wire e;
	wire rs;
	wire rw;
	wire d;
	wire c;
	wire b;
	wire a;

	// Instantiate the Unit Under Test (UUT)
	TestLCD uut (
		.clk(clk), 
		.sf_e(sf_e), 
		.e(e), 
		.rs(rs), 
		.rw(rw), 
		.d(d), 
		.c(c), 
		.b(b), 
		.a(a)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		

	end
      
endmodule

