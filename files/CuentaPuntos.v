`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:26 10/21/2014 
// Design Name: 
// Module Name:    CuentaPuntos 
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
module CuentaPuntos(
	 input iClk,
    input iEnableContar,
	 input iReset,
    output [8:0] Numero
    );
	 reg[8:0] RegContador;
	 always@(posedge iClk)
	 begin
		if(iReset)
			RegContador <= 8'd0;
			
		else if(iEnableContar)
			RegContador <= RegContador + 1'b1;
	 end
	 
	 assign Numero = RegContador;
	 
endmodule
