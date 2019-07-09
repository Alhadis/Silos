`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:50:02 07/06/2019
// Design Name:   PC
// Module Name:   D:/Uni/Arch/project/MIPSproject/Test_PC.v
// Project Name:  MIPSproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_PC;

	// Inputs
	reg PCEn;
	reg [31:0] PC_in;
	reg clk;

	// Outputs
	wire [31:0] PC_out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.PCEn(PCEn), 
		.PC_in(PC_in), 
		.clk(clk), 
		.PC_out(PC_out)
	);

	initial begin
		// Initialize Inputs
		PCEn = 0;
		PC_in = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      PCEn = 1;
		PC_in = 100;
		
		
		#300;
		PCEn = 0;
		// Add stimulus here

	end
	
	always begin
	#50;
	clk = ~clk;
	end
      
endmodule

