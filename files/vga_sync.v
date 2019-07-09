`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:42 10/21/2014 
// Design Name: 
// Module Name:    vga_sync 
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
module vga_sync(
   clkP,
	 sincH,				
	 sincV,				
	 video,				
	 pixelX,		
	 pixelY
    );
	 
	input	clkP;			
	output sincH;				
	output sincV;				
	output video;				
	output [10:0] pixelX;		
	output [9:0] pixelY;
	

	reg [10:0] pixelX;	
	reg [9:0] pixelY;				
	reg sincH;				
	reg sincV;				
	reg videoH;				
	reg videoV;				
	reg video;
	
	 localparam HD = 640; //area horizontal pintada
	 localparam HF = 28;  //16 borde izquierdo
	 localparam HR = 96;  //retraso horizontal
	 localparam HT = 800; //tamano total de la pantalla horizontal
    localparam HB = 36;  //48 borde derecho
	
	 localparam VD = 480; //area vertical pintada
	 localparam VF = 10; //borde superior
	 localparam VB = 33; //borde inferior
	 localparam VR = 2;  //retraso vertical
    localparam VT = 525;
	 
	 initial begin
		pixelX = 0;
		pixelY = 0;
		sincH = 0;
		sincV = 0;
	 end
	 
	 //recorre las columnas
	 always @ (posedge clkP) begin
		if (pixelX == (HT - 1))
			pixelX <= 11'h000;
		else
			pixelX <= pixelX + 11'd1;		
	end

	//baja las lineas
	always @ (posedge clkP) begin
	if ((pixelY == (VT - 1)) && (pixelX == (HT - 1)))
		begin
			pixelY <= 10'h000;
		end
		else if ((pixelX == (HT - 1)))
			pixelY <= pixelY + 1'd1;
	end

	
	always @ (posedge clkP) begin
		if (pixelX == (HD + HF -1))
			sincH <= 1'b1;
		else if (pixelX == (HT - HB -1))
			sincH <= 1'b0;
	end

	always @ (posedge clkP) begin
		if ((pixelY == (VD + VF -1) &&
				(pixelX == HT - 1))) 
			sincV = 1'b1;
		else if ((pixelY == (VT - VB - 1))	&&
				(pixelX == (HT - 1)))
			sincV = 1'b0;
	end

	always @ (posedge clkP) begin
		if (pixelX == (HD - 2)) 
			videoH <= 1'b1;
		else if (pixelX == (HT - 2))
			videoH <= 1'b0;
	end

	always @ (posedge clkP) begin
		if ((pixelY == (VD - 1) &&
				(pixelX == HT - 2))) 
			videoV <= 1'b1;
		else if ((pixelY == (VT - 1)) &&
				(pixelX == (HT - 2)))
			videoV <= 1'b0;
	end

	always @ (posedge clkP) begin
		if (videoH || videoV)
			video <= 1'b0;
		else
			video <= 1'b1;
	end
	
endmodule
