`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:15 05/27/2013 
// Design Name: 
// Module Name:    multi_alu 
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
`include "macro.vh"
module alu(input wire [31:0] a,
input wire [31:0] b,
input wire [3:0] switch,
output reg [31:0] display_num);
initial begin
display_num=0;
end
always @ (switch)
begin
	case(switch[3:0])
		`ALU_ADD:display_num=a + b;
		`ALU_SUB:display_num=a - b;
		`ALU_OR:display_num=a|b;
		`ALU_AND:display_num=a&b;
		`ALU_NOR:display_num=~(a|b);
		`ALU_SLT:display_num= (a<b)? 1:0;
		//`ALU_SLL:display_num=
	//	default:display=a+b;
	endcase
	end
endmodule
