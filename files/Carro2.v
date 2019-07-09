`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:13 10/21/2014 
// Design Name: 
// Module Name:    Carro2 
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
module Carro2(
	 input iClk,
    input[9:0] iPosicionX,
    input[8:0] iPosicionY,
    input[9:0] iPosicionAuxX,
    input[8:0] iPosicionAuxY,
    input iEnable,
    input iSuma,
    input iSalto,
    output[9:0] oPosicionSalidaX,
    output[8:0] oPosicionSalidaY
    );
	 
	 reg[9:0] RegistroX;
	 reg[8:0] RegistroY;
	 
	 always@(posedge iClk)
	 begin
		if(iEnable)begin
			RegistroX = iPosicionX;
			RegistroY = iPosicionY;
		end
		if(iSuma)begin
			RegistroY = RegistroY + 9'd1;			
		end
		if(iSalto)begin
			RegistroX = iPosicionAuxX;
			RegistroY = iPosicionAuxY;
		end
	 end

	 assign oPosicionSalidaX = RegistroX;
	 assign oPosicionSalidaY = RegistroY;
endmodule