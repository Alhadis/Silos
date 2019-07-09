`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 20:46:06
// Design Name: 
// Module Name: TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIB(
    input en,
    input  [5:0]f0,
    input  [5:0]f1,
    input rst,
    input clk,
    output reg [5:0]fn
    );
    wire [2:0]f;
    wire [5:0] in0;
    wire [5:0] out0;
    wire [5:0] in1;
    wire [5:0] out1;
    wire [5:0] sum;

//assign fn=sum;
ALU ADD (out0,out1,3'h01,sum ,f);
REG_file A0 (clk,rst,1,in0,out0);
REG_file A1 (clk,rst,1,in1,out1);
assign in0=(en)?f0:sum;
assign in1=(en)?f1:out0;
always@(posedge clk)
begin
 fn<=sum;
end
endmodule
