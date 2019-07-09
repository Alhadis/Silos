`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:41:23 10/24/2013
// Design Name:   ALU
// Module Name:   C:/Users/in dia/Dropbox/Coaa/Assignment 8/ALU/ALUTest.v
// Project Name:  ALU
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

module ALUTest;

	// Inputs
	reg [31:0] rs_;
	reg [31:0] rt_;
	reg [31:0] imm;
	reg ALUimm;
	reg ALUfn;
	reg logicfn;
	reg fnClass;

	// Outputs
	wire [31:0] result;
	wire zFlag;
	wire carryFlag;
	wire signFlag;
	wire overflowFlag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.rs_(rs_), 
		.rt_(rt_), 
		.imm(imm), 
		.ALUimm(ALUimm), 
		.ALUfn(ALUfn), 
		.logicfn(logicfn), 
		.fnClass(fnClass), 
		.result(result), 
		.zFlag(zFlag), 
		.carryFlag(carryFlag), 
		.signFlag(signFlag), 
		.overflowFlag(overflowFlag)
	);

	initial begin
		// Initialize Inputs
		rs_ = 0;
		rt_ = 0;
		imm = 0;
		ALUimm = 0;
		ALUfn = 0;
		logicfn = 0;
		fnClass = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rs_ = -32534634;
		rt_ = 3456345;
		imm = 3456;
		ALUfn = 0; 
		fnClass = 0;
		
		#100
		rs_ = -3455;
		rt_ = 3455;
		imm = 3456;
		ALUfn = 0; 
		fnClass = 0;
		
		#100
		rs_ = 32534634;
		rt_ = 3456345;
		imm = 3456;
		ALUfn = 0; 
		fnClass = 0;
		
		#100;
		
		
		ALUimm = 1;
		
		#100;
		
		ALUimm = 0;
		ALUfn = 1;
		
		#100
		
		ALUfn = 0;
		fnClass = 1;
		logicfn = 0;
		
		#100
		logicfn = 1;
		// Add stimulus here
		

	end
      
endmodule

