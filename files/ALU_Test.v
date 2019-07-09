`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:17:01 07/06/2019
// Design Name:   ALU
// Module Name:   D:/Uni/Arch/project/MIPSproject/ALU_Test.v
// Project Name:  MIPSproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Test;

	// Inputs
	reg [31:0] SrcA;
	reg [31:0] SrcB;
	reg [3:0] operation;

	// Outputs
	wire [31:0] ALUResult;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.SrcA(SrcA), 
		.SrcB(SrcB), 
		.operation(operation), 
		.ALUResult(ALUResult), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		SrcA = 0;
		SrcB = 0;
		operation = 0;

		// Wait 100 ns for global reset to finish
		#100;
      operation = 4'b0010;
		SrcA = 10;
		SrcB = 10;
		
		// Add stimulus here

	end
      
endmodule

