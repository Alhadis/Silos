`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:16:18 09/27/2012
// Design Name:   multi_4by4_struct
// Module Name:   X:/Ec551_Lab1/test_multi_4by4_struct.v
// Project Name:  Ec551_Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multi_4by4_struct
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_multi_4by4_struct;

	// Inputs
	reg [3:0] m;
	reg [3:0] q;

	// Outputs
	wire [7:0] p;

	// Instantiate the Unit Under Test (UUT)
	multi_4by4_struct uut (
		.p(p), 
		.m(m), 
		.q(q)
	);

		initial begin
		m = 4'b0000;
		q = 4'b0000;
		
		#100;
		m = 4'b0001;
		q = 4'b0000;
		
		#100;
		m = 4'b0011;
		q = 4'b0010;
		
		#100;
		m = 4'b1000;
		q = 4'b0100;
	end
      
endmodule

