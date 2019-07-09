`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:59:29 11/11/2014 
// Design Name: 
// Module Name:    BaudGen 
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
module BaudGen 
#(
parameter N=10, M=652
)
(
input wire clk,reset,
output wire max_tick
);

reg [N-1:0] r_reg;
wire [N-1:0] r_next;

always@(posedge clk, posedge reset)
	if(reset)
		r_reg<=0;
	else
		r_reg<=r_next;

		
assign r_next=(r_reg==(M-10'd1))? 10'b0:r_reg+10'd1;

assign max_tick= (r_reg==(M-10'd1)) ? 1'b1:1'b0;

endmodule
