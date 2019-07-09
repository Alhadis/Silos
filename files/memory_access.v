`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:09 06/25/2019 
// Design Name: 
// Module Name:    memory_access 
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
module memory_access(
	input clk,
	input Branch,
	input Zero,
	input MemWrite,
	input MemRead,
	input [31:0]Address,
	input [31:0]writeDataMemory,
//	input [31:0]nextIns, //Adder from instruction fetch
//	input [31:0]branchIns, //Adder from execution phase
	output [31:0]memoryOut,
	output PCSrc
//	output [31:0]branchMux
    );

assign PCSrc = Branch & Zero;

data_memory dataMemory(
	.clk(clk),
	.MemWrite(MemWrite),
	.MemRead(MemRead),
	.addr(Address),
	.readData(memoryOut),
	.writeData(writeDataMemory)
);

endmodule
