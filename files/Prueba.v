`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:45:04 10/23/2014
// Design Name:   Top
// Module Name:   G:/ProyectoFinal-Juego/Prueba.v
// Project Name:  ProyectoFinal-Juego
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Prueba;

	// Inputs
	reg iReset;
	reg iStart;
	reg iClk;
	reg iPosicionY1;
	reg iPosicionY2;

	// Outputs
	wire sincH;
	wire sincV;
	wire colorR;
	wire colorG;
	wire colorB;
	wire [3:0] conectorAn;
	wire [0:6] display;
	
	
	

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.iReset(iReset), 
		.iStart(iStart), 
		.iClk(iClk), 
		.iPosicionY1(iPosicionY1), 
		.iPosicionY2(iPosicionY2), 
		.sincH(sincH), 
		.sincV(sincV), 
		.colorR(colorR), 
		.colorG(colorG), 
		.colorB(colorB), 
		.conectorAn(conectorAn), 
		.display(display)
	);

	
	localparam T = 10;
	
	always begin
	iClk = 1;
	#(T/2);
	iClk = 0;
	#(T/2);
	end

	initial begin
		// Initialize Inputs
		iReset = 1;
		iStart = 0;
		#1500000;
		@(negedge  iClk)
		iReset = 0;
		iStart = 0;
		#6000000;
		@(negedge  iClk)
		iReset = 0;
		iStart = 1;
		#1500000;
		@(negedge  iClk)
		iReset = 0;
		iStart = 0;
        
		// Add stimulus here

	end
      
endmodule

