`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:21 09/30/2014 
// Design Name: 
// Module Name:    checkser 
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
module checkser(
    input [15:0] data,
    input clk,
    output reg err
    );

	reg [16:0] last=0;

	always @ (posedge clk) begin
		if (data != last[15:0]) err <= 1;
		else err <= 0;
		last <= data + 1;
	end


endmodule
