`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:53 04/20/2015
// Design Name:   cmux21
// Module Name:   /home/igor/proj/wfd125/wfd125-mainfpga/testbmux/testbmux.v
// Project Name:  fpga_main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmux21
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbmux;

	// Inputs
	reg I0;
	reg I1;
	reg S;

	// Outputs
	wire O;

	// Instantiate the Unit Under Test (UUT)
	cmux21 uut (
		.I0(I0), 
		.I1(I1), 
		.S(S), 
		.O(O)
	);

	initial begin
		// Initialize Inputs
		I0 = 0;
		I1 = 0;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
	end

		// Add stimulus here
		always @ (*) #4 I0 <= !I0; 
		always @ (*) #8 I1 <= !I1; 
		always @ (*) #100 S <= !S; 


      
endmodule

