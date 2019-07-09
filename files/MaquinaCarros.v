`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:34 10/21/2014 
// Design Name: 
// Module Name:    MaquinaCarros 
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
module MaquinaCarros(
    input iClk,
    input iEnable,
	 input iReset,
	 input iEnableCero,
	 input iResetPintar,
	 output reg pintar,
	 output reg EnableX,
	 output reg EnableY,
	 output reg Suma,
	 output reg Salta
    );
	 
	 
	 reg[2:0] estado, sigEstado;
	 
	 
	  parameter[2:0]
		a = 3'd0,
		b = 3'd1,
		c = 3'd2,
		d = 3'd3,
		e = 3'd4;
		
		always@(estado or iEnable or iEnableCero or iResetPintar)
		begin
			
			begin
				if(iResetPintar)
					sigEstado = a;
				else 
				begin
					case(estado)
					a:if(iEnable) sigEstado = b;
						else sigEstado = a;
					b:sigEstado = c;
					c:sigEstado = d;
					d:if(iEnableCero)sigEstado= e;
						else sigEstado= c;
					e:sigEstado = c;
					default: sigEstado = a;
					endcase
				end
			end
		end
		
	 always@(estado)
	 begin
		EnableX = 1'd0;
		EnableY = 1'd0;
		Suma = 1'd0;
		Salta = 1'd0;
		pintar = 1'd1;
		case(estado)
		a:begin
			pintar = 1'd0;
		end
		
		b:begin
			pintar = 1'd0;
			EnableX = 1'd1;
			EnableY = 1'd1;
		end
		c:begin
			Suma = 1'd1;
		end
		e:begin
			Salta = 1'd1;
			EnableY = 1'd1;
		end
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
