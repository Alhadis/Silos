`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:08 04/06/2015 
// Design Name: 
// Module Name:    principal 
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
module principal(
    input [1:0] Entradas,
    input Selector,
    output Salida
    );

	wire w1,w2;
	and (w1, Entradas[1], Entradas[0]);
	or (w2, Entradas[1], Entradas[0]);
	Mux2a1 U1({w1,w2}, Selector, Salida);
endmodule
