`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:54 10/26/2014 
// Design Name: 
// Module Name:    udDecenasCentenas 
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
module udDecenasCentenas(
input clk,
	input [8:0] binario,
	output reg [11:0] display
	//output [3:0] unidades,
//	output [3:0] decenas,
	///output [3:0] centenas
    );

	reg [19:0] z;
	integer i;
	  
	 //ALGORITMO DE SUMA 3 Y CORRIMIENTO A LA IZQ
	always @(posedge clk )begin
	   
        //Inicialización de datos en cero.
        z = 0 ;
        //Se realizan los primeros tres corrimientos.
        z[11:3] = binario;
		 
        for (i=0;i<6;i=i+1) //las repeticiones sera < ( numero bits inputs -3)
		  begin
            //Unidades (4 bits).
            if (z[12:9] > 4) begin
                z[12:9] = z[12:9] + 3'd3;
            end
            //Decenas (4 bits).
            if (z[16:13] > 4)begin
                z[16:13] = z[16:13] + 3'd3;
            end
            //Centenas (3 bits).
            if (z[19:17] > 4)begin
                z[19:17]  = z[19:17]  + 3'd3;
            end 
            //Corrimiento a la izquierda.
            z[19 :1] = z[18:0];
        end
        //Pasando datos de variable Z, correspondiente a BCD.
        display <= z[19 : 9];
    end 
	 
	//assign unidades =  display[3:0];
	//assign  decenas = display[7:4];
	//assign centenas = display[11:8];

endmodule
