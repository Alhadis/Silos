`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:41 10/21/2014 
// Design Name: 
// Module Name:    Jugador 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Jugador(

	 input clk,
    input reset,
    input der, 
    input izq,
    output espacioAr,
	 output espacioAb,
    output [8:0] posicionX
    );
	 
	 localparam XInicial = 9'd278;
	 localparam dx = 9'd1;
	 localparam xMin = 9'd215;
	 localparam xMax =9'd340;
	 
	 reg [8:0] rPosicionX = XInicial;
	 
	
	 always@(posedge clk or posedge reset)
	 begin
		if(reset) begin
			rPosicionX <= XInicial;
		end
		else begin
			if(izq) begin
				rPosicionX <= (rPosicionX - dx);
				end
			else if(der) begin
				rPosicionX <= (rPosicionX + dx);
				end
		end
	  end
	 
	assign espacioAb = (rPosicionX >= xMin)? 1'b1 : 1'b0;
	assign espacioAr = (rPosicionX <= xMax)? 1'b1 : 1'b0;
	assign posicionX = rPosicionX;
	
endmodule
