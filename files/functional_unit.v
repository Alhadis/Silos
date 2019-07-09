`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:19 08/10/2017 
// Design Name: 
// Module Name:    functional_unit 
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
module functional_unit(a,y,z,fn_sel);
	input a,y,fn_sel;
	wire[9:0] a;
	wire[9:0] y;
	wire[2:0] fn_sel;
	output z;
	reg[9:0] z;
	always @(a or y or fn_sel)
		if(fn_sel == 3'b000)
			z <= a + y;
		else if(fn_sel == 3'b001)
			z <= 0000000001;
		else if(fn_sel == 3'b010)
			z <= y;
		else if(fn_sel == 3'b011)
			z <= y;
		else
			z <= y+1;
		
endmodule
