`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:57 10/22/2014 
// Design Name: 
// Module Name:    Display 
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
module Display(
	 input iClk,
    input [11:0] inputs, 
    output [0:6] outputs,
	 output reg [3:0] an
    );
	 
	 reg [0:6] copyOuputs = 7'b1111110;
	 reg [0:3] selector = 4'd0;
	 reg [1:0]  posicion = 2'd0;
	 
	 always@(posedge iClk)
	 begin
		case(posicion)
			0: begin
				an = 4'b0001;
				selector <= inputs[3:0];
				posicion = posicion +1'd1;
			end
			1: begin
				an = 4'b0010;
				selector <= inputs[7:4];
				posicion = posicion +1'd1;
			end
			2: begin
				an = 4'b0100;
				selector <= inputs[11:8];
				posicion = posicion +1'd1;
			end
			3: begin
				an = 4'b1000;
				//selector <= inputs[11:8];
				posicion = 2'd0;
			end
		endcase
	 end
	 
	 always@(selector)
	 begin
		case(selector)
			4'd0: copyOuputs=7'b1111110;
			4'd1: copyOuputs=7'b0110000;
			4'd2: copyOuputs=7'b1101101;
			4'd3: copyOuputs=7'b1111001;
			4'd4: copyOuputs=7'b0110011;
			4'd5: copyOuputs=7'b1011011;
			4'd6: copyOuputs=7'b1011111;
			4'd7: copyOuputs=7'b1110000;
			4'd8: copyOuputs=7'b1111111;
			4'd9: copyOuputs=7'b1110011;
			//4'd10: copyOuputs=7'b1111101;
			//4'd11: copyOuputs=7'b0011111;
			//4'd12: copyOuputs=7'b1001110;
			//4'd13: copyOuputs=7'b0111101;
			//4'd14: copyOuputs=7'b1101111;
			//4'd15: copyOuputs=7'b1000111;
			default: copyOuputs=7'b1111110;
		endcase
	 end
	 assign outputs=copyOuputs;


endmodule
