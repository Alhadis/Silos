`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:15 07/06/2019
// Design Name:   ALUcontrol
// Module Name:   D:/Uni/Arch/project/MIPSproject/ALUControl_Test.v
// Project Name:  MIPSproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUcontrol
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUControl_Test;

	// Inputs
	reg ALUop1;
	reg ALUop0;
	reg [5:0] funct;
	reg [5:0] opcode;

	// Outputs
	wire [3:0] Operation;

	// Instantiate the Unit Under Test (UUT)
	ALUcontrol uut (
		.ALUop1(ALUop1), 
		.ALUop0(ALUop0), 
		.funct(funct), 
		.opcode(opcode), 
		.Operation(Operation)
	);

	initial begin
		// Initialize Inputs
		ALUop1 = 0;
		ALUop0 = 0;
		funct = 0;
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
      funct = 4'b0000;
		ALUop1 = 1;
		
		
		// Add stimulus here

	end
      
endmodule

