`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:10 10/21/2014 
// Design Name: 
// Module Name:    MaquinaMaster 
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
module MaquinaMaster(
    input iClk,   
    output reg oEnableLFSR,
	 output reg oPintar,
	 output reg oResetPintar,
	 input iStop,
    input iStart,
    input iReset
    );
	 
	 
	 reg[2:0] estado, sigEstado;
	 
	  parameter[2:0]
		a = 3'd0,
		b = 3'd1,
		c = 3'd2,
		d = 3'd3,
		e = 3'd4;
		
		
	always@(estado or iStart or iStop)
	 begin
		case(estado)
			a: sigEstado = b;
			b:if(iStart) sigEstado = c;
				else sigEstado = b;
			c:	sigEstado = d;
			d:if(iStop)sigEstado = e;
				else sigEstado = d;
			e: sigEstado = a;
			default: sigEstado = a;
		endcase
	 end

	always@(estado)
	 begin		
		oEnableLFSR = 1'd0;
		oPintar=0;
		oResetPintar = 1'd0;
		
		case(estado)
			a:begin				
				oEnableLFSR = 1'd1;
			end
			c:begin
				oPintar = 1'd1;
			end
			e: oResetPintar = 1'd1;
		endcase
		
	 end
	 
	 always@(posedge iClk)
	 begin
		if(iReset)
			estado <= a;
		else
			estado <= sigEstado;
	 end


endmodule

