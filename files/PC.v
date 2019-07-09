`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:47 06/11/2019 
// Design Name: 
// Module Name:    PC 
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
module PC#(parameter LENGTH = 32)(
	input [LENGTH -1 : 0] new_pc,
	input clk,
	input reset,
	output reg [LENGTH -1 : 0] pc
);

initial pc=0;

always@(posedge clk)
begin
if (reset)
	pc <= 0;
else
	pc <= new_pc;
end

endmodule
