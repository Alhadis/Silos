`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:53 04/06/2015 
// Design Name: 
// Module Name:    Mux2a1 
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
module Mux2a1(
    input [1:0] Entradas,
    input Selector,
    output Salida
    );

	wire a1, a2, a3;
	not(a3, Selector);
	and(a1, Entradas[1], Selector);
	and(a2, Entradas[0], a3);
	or(Salida, a1, a2);
endmodule
