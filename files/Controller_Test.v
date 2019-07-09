`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:57:45 07/06/2019
// Design Name:   Controller
// Module Name:   D:/Uni/Arch/project/MIPSproject/Controller_Test.v
// Project Name:  MIPSproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Controller_Test;

	// Inputs
	reg clk;
	reg reset;
	reg [5:0] Op;
	reg Zero;
	reg INT;
	reg INTD;
	reg NMI;

	// Outputs
	wire IorD;
	wire MemWrite;
	wire MemtoReg;
	wire IRWrite;
	wire PCSrc;
	wire [1:0] ALUSrcB;
	wire ALUSrcA;
	wire RegWrite;
	wire RegDst;
	wire PCEn;
	wire [1:0] ALUOp;
	wire [3:0] state;

	// Instantiate the Unit Under Test (UUT)
	Controller uut (
		.clk(clk), 
		.reset(reset), 
		.Op(Op), 
		.Zero(Zero), 
		.INT(INT), 
		.INTD(INTD), 
		.NMI(NMI), 
		.IorD(IorD), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.IRWrite(IRWrite), 
		.PCSrc(PCSrc), 
		.ALUSrcB(ALUSrcB), 
		.ALUSrcA(ALUSrcA), 
		.RegWrite(RegWrite), 
		.RegDst(RegDst), 
		.PCEn(PCEn), 
		.ALUOp(ALUOp), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		Op = 0;
		Zero = 0;
		INT = 0;
		INTD = 0;
		NMI = 0;

		// Wait 100 ns for global reset to finish
		#50;
		reset = 1;
		Op = 6'b000000;
		Zero = 0;
		#50;
		reset = 0;

      
		// Add stimulus here

	end
	always begin
	#50;
	clk = ~clk;
	end
    
      
endmodule

