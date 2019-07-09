`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:13:46 06/25/2019 
// Design Name: 
// Module Name:    data_memory 
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

module data_memory#(
	parameter ADDR_LENGTH = 32,
	parameter DATA_LENGTH = 32
)(
	input clk,
	input MemWrite,
	input MemRead,
	input [ADDR_LENGTH - 1 : 0]addr,
	input[DATA_LENGTH - 1 : 0] writeData,
	output reg[DATA_LENGTH - 1 : 0] readData
   );
	
	localparam MEM_SIZE = 2 ^ ADDR_LENGTH ; //Es asi???
	reg [DATA_LENGTH - 1 : 0]memory[0 : 32]; //Supongo que no le podemos meter 4GB de memoria a la FPGA

initial
begin
	memory[0] = 5;
	memory[1] = 10;
end

always @(posedge clk)
begin
	if(MemRead)
		readData <= memory[addr];
end

always @(negedge clk)
begin
	if(MemWrite)
		memory[addr] <= writeData;
end

endmodule
