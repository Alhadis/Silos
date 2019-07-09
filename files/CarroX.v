`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:26 10/21/2014 
// Design Name: 
// Module Name:    CarroX 
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
module CarroX(
	 input iClk,
    input[9:0] iPosicionX,
    input[8:0] iPosicionY,
    input[9:0] iPosicionAuxX,
    input[8:0] iPosicionAuxY,
    input iEnable,
    input iSuma,
    input iSalto,
    output[9:0] oPosicionSalidaX,
    output[8:0] oPosicionSalidaY,
	 output reg oEnableCero,
	 output reg oEnableCuenta
    );
	 
	 reg[9:0] RegistroX;
	 reg[8:0] RegistroY;
	 
	 always@(posedge iClk)
	 begin
		oEnableCero = 1'd0;
		oEnableCuenta = 1'd0;
		if(iEnable)begin
			RegistroX = iPosicionX;
			RegistroY = iPosicionY;
		end
		if(iSuma)begin
			RegistroY = RegistroY + 9'd1;
			if(RegistroY == 10'd480)begin
				oEnableCuenta = 1'd1;
				oEnableCero = 1'd1;
			end
		end
		if(iSalto)begin
			RegistroX = iPosicionAuxX;
			RegistroY = iPosicionAuxY;
		end
	 end

	 assign oPosicionSalidaX = RegistroX;
	 assign oPosicionSalidaY = RegistroY;
endmodule
