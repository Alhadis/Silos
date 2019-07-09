`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:49 09/23/2014 
// Design Name: 
// Module Name:    ledengine 
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
module ledengine
	#(
		parameter MAXCNT = 12500000
	)
	(
    input trig,
    input clk,
    output reg led
    );

reg [31:0] CNT = 0;

	always @ (posedge clk) begin
		if (CNT != 0) begin
			led <= 0;
			CNT <= CNT - 1;
		end else begin
			led <= 1;
		end
		if (trig == 1) begin
			CNT <= MAXCNT;
		end
	end

endmodule
