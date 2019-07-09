`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:25:36 10/17/2012
// Design Name:   ALU
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/ALUTest.v
// Project Name:  KGP_RISC
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
	reg [31:0] X;
	reg [31:0] Y;
	reg fnSel;
	reg fnClass;
	reg [2:0] LogicFunc;

	// Outputs
	wire Carry;
	wire [31:0] ALUOut;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.X(X), 
		.Y(Y), 
		.fnSel(fnSel), 
		.fnClass(fnClass), 
		.LogicFunc(LogicFunc), 
		.Carry(Carry), 
		.ALUOut(ALUOut)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		fnSel = 0;
		fnClass = 0;
		LogicFunc = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial 
		begin
			X = 32'b011; Y = 32'b010; fnSel = 1'b0; fnClass = 1'b0; LogicFunc = 3'b000;       //Add
			#10; X = 32'b011; Y = 32'b010; fnSel = 1'b1; fnClass = 1'b0; LogicFunc = 3'b001;  //2's Complement
			#10; X = 32'b011; Y = 32'b010; fnSel = 1'b0; fnClass = 1'b1; LogicFunc = 3'b000;  //AND
			#10; X = 32'b011; Y = 32'b010; fnSel = 1'b0; fnClass = 1'b1; LogicFunc = 3'b001;  //XOR
			#10; X = 32'b011; Y = 32'b010; fnSel = 1'b0; fnClass = 1'b1; LogicFunc = 3'b010;  //SHLL or SHLLV
			#10; X = 32'b011; Y = 32'b010; fnSel = 1'b0; fnClass = 1'b1; LogicFunc = 3'b110;  //SHRL or SHRLV
			#10; X = 32'b011; Y = 32'b010; fnSel = 1'b0; fnClass = 1'b1; LogicFunc = 3'b100;  //SHRA or SHRAV
		   #10; X = -2; Y = 32'b010; fnSel = 1'b0; fnClass = 1'b1; LogicFunc = 3'b100;  //SHRA or SHRAV

		end
      
endmodule

