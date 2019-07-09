`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:03:00 07/06/2019
// Design Name:   Regfile
// Module Name:   D:/Uni/Arch/project/MIPSproject/RegFile_Test.v
// Project Name:  MIPSproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Regfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegFile_Test;

	// Inputs
	reg clk;
	reg RegWrite;
	reg [4:0] A1;
	reg [4:0] A2;
	reg [4:0] A3;
	reg [31:0] WD3;
	reg [3:0] state;

	// Outputs
	wire [31:0] RD1;
	wire [31:0] RD2;

	// Instantiate the Unit Under Test (UUT)
	Regfile uut (
		.clk(clk), 
		.RegWrite(RegWrite), 
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.WD3(WD3), 
		.RD1(RD1), 
		.RD2(RD2), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		RegWrite = 0;
		A1 = 0;
		A2 = 0;
		A3 = 0;
		WD3 = 0;
		state = 0;

		// Wait 100 ns for global reset to finish
		#50;
		RegWrite = 1;
		A3 = 15;
		WD3 = 23;
		#100;
		RegWrite = 1;
		A3 = 16;
		WD3 = 24;
		#50;
		RegWrite = 0;
		A1 = 15;
		A2 = 16;
		
		
        
		// Add stimulus here

	end
    
	always begin
	#50;
	clk = ~clk;
	end
    	 
endmodule

