`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:44 10/21/2014 
// Design Name: 
// Module Name:    Choque 
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
module Choque(
    input [9:0] iPosicionXT, //Posicion X del obstaculo
    input [8:0] iPosicionYT, //Posicion Y del obstaculo
    input [8:0] iPosicionXC,  //Posicion X del obstaculo

    output reg oStop 
    );
	 
	 always@(iPosicionXT or iPosicionXC or iPosicionYT)
	 begin
		oStop = 0;
		if(iPosicionXT > 320)
		begin
			if((iPosicionYT> 325) && (iPosicionYT <455) && (iPosicionXC> 265)&&(iPosicionXC<395))
				oStop = 1;
		end
		else
		begin
			if((iPosicionYT> 325) && (iPosicionYT <455) && (iPosicionXC>= 214)&&(iPosicionXC< 290))
				oStop = 1;
		end
	 end


endmodule

