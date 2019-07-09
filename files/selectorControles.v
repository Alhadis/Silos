`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:48 10/30/2014 
// Design Name: 
// Module Name:    selectorControles 
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
module selectorControles(
		input iclk,
		input [1:0]selectorControles,
		input [0:5] mouse,
		input [7:0] acelerometro,
		input botonDerecha,
		input botonIzquierda,
		output salidaDerecha,
		output salidaIzquierda
    );
	 
	 reg controlDer  = 0;
	 reg controlIzq  = 0;
	 
	always@(posedge iclk, posedge selectorControles[0], posedge mouse[5], posedge botonDerecha, posedge botonIzquierda, posedge acelerometro[0])
		
	 begin		
		
		case(selectorControles)
			//Botones
			0:begin				
				controlDer <= botonDerecha;
				controlIzq <= botonIzquierda;
			end
			//Mouse
			1:begin
				controlDer  <= (mouse[0] || mouse[1] || mouse[2]) && !mouse[5];
				controlIzq   <= mouse[5];
			end
			default:
			begin
					if(acelerometro == 8'd41)
					begin
						controlIzq <= 1;
						controlDer <= 0;
					end
					else
					begin
						controlDer <= 1;
						controlIzq <= 0;
					end
			end
		endcase
		
	 end
	 
	 assign salidaDerecha 	= controlDer;
	 assign salidaIzquierda = controlIzq;

endmodule
