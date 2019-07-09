`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:50 10/21/2014 
// Design Name: 
// Module Name:    DivisorFrecuencias 
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
module DivisorFrecuencias(
	input clk,
	output clk_25Mhz,//para VGA
	output clk_1s//Para los botones
	//output clk_50Mhz //para el mouse
    );
	
	 //reg clk_25Temp = 0 ;
	 reg [18:0] contador = 19'h0;
	 reg clk_1sTemp = 0;
	 reg [1:0] contador100Mhz = 2'b0;
	 
	 always@(posedge clk)begin
		contador <= contador + 1'b1;
		contador100Mhz <= contador100Mhz + 1'b1;
		
		if (contador == 19'h493E0)begin
			contador <= 19'd0;
			clk_1sTemp <= ~clk_1sTemp;
		end 
	end
		
	
	
	//assign clk_25Mhz = clk_25Temp;
	assign clk_25Mhz = contador100Mhz[1];
	assign clk_1s = clk_1sTemp;
	//assign clk_50Mhz = contador100Mhz[0];
	
endmodule
