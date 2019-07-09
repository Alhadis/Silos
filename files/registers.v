`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:26 06/12/2019 
// Design Name: 
// Module Name:    registers 
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
module registers#(
	parameter sbits = 5, //Selection Bits
	parameter reg_quantity = 32, //2 ^ sbits
	parameter reg_size = 32
)(
	input clk,
	input reset,
	input regwrite,
	input [sbits - 1 : 0] wr,
	input [sbits - 1 : 0] rr1,
	input [sbits - 1 : 0] rr2,
	input [reg_size - 1 : 0] wd,
	output reg[reg_size - 1 : 0] rd1,
	output reg[reg_size - 1 : 0] rd2
    );
	 
	reg [reg_size - 1 : 0] registers [reg_quantity - 1 : 0];
	
	integer i;
	initial
	begin
	for(i = 0; i < reg_quantity - 1; i = i + 1)
		registers[i] = 0;
	end
	
	always@(posedge clk)
	begin
		rd1 <= registers[rr1];
		rd2 <= registers[rr2];
	end
	
	always@(negedge clk)
	begin
	if(reset)
		begin
			for(i = 0; i < reg_quantity - 1; i = i + 1)
				registers[i] = 0;
		end
	if(regwrite)
		registers[wr] <= wd;
	end
	

endmodule
