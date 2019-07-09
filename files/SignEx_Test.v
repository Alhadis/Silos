`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:08:49 07/06/2019
// Design Name:   SignEx
// Module Name:   D:/Uni/Arch/project/MIPSproject/SignEx_Test.v
// Project Name:  MIPSproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignEx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignEx_Test;

	// Inputs
	reg [15:0] wirein;

	// Outputs
	wire [31:0] wireout;

	// Instantiate the Unit Under Test (UUT)
	SignEx uut (
		.wirein(wirein), 
		.wireout(wireout)
	);

	initial begin
		// Initialize Inputs
		wirein = 0;

		// Wait 100 ns for global reset to finish
		#100;
      wirein = 16'b1010010010101010;
		// Add stimulus here

	end
      
endmodule

