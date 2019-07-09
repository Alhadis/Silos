`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:48:54 10/26/2017
// Design Name:   functional_unit
// Module Name:   C:/Users/Subham Rajgaria/Desktop/group14/cpu_controller/aluTest.v
// Project Name:  cpu_controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: functional_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module aluTest;

	// Inputs
	reg [15:0] a;
	reg [15:0] y;
	reg [2:0] fn_sel;

	// Outputs
	wire [15:0] z;

	// Instantiate the Unit Under Test (UUT)
	functional_unit uut (
		.a(a), 
		.y(y), 
		.z(z), 
		.fn_sel(fn_sel)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		y = 0;
		fn_sel = 0;

		// Wait 100 ns for global reset to finish
		#10;
		a= 16'b0000000000000011;
		y = 16'b0000000000000010;
		fn_sel = 3'b000;
        
		// Add stimulus here

	end
      
endmodule

