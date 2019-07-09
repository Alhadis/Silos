`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:18:53 04/20/2015
// Design Name:   cmux41
// Module Name:   /home/igor/proj/wfd125/wfd125-mainfpga/testbmux/testbmux4.v
// Project Name:  fpga_main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmux41
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbmux4;

	// Inputs
	reg I0;
	reg I1;
	reg I2;
	reg I3;
	reg [1:0] S;

	// Outputs
	wire O;

	// Instantiate the Unit Under Test (UUT)
	cmux41 uut (
		.I0(I0), 
		.I1(I1), 
		.I2(I2), 
		.I3(I3), 
		.S(S), 
		.O(O)
	);

	initial begin
		// Initialize Inputs
		I0 = 0;
		I1 = 0;
		I2 = 0;
		I3 = 0;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
		always @ (*) #4 I0 <= !I0; 
		always @ (*) #8 I1 <= !I1; 
		always @ (*) #16 I2 <= !I2; 
		always @ (*) #32 I3 <= !I3; 
		always @ (*) #200 S <= S + 1; 

      
endmodule

