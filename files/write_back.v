`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:29 06/25/2019 
// Design Name: 
// Module Name:    write_back 
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
module write_back#(
	parameter data_len = 32
)(
//	input Jump,
	input MemToReg,
//	input [31:0]branchMux,
//	input [31:0]jumpIns,
	input [data_len - 1 : 0]dataFromAlu,
	input [data_len - 1 : 0]dataFromMemory,
	output[data_len - 1 : 0] dataMux
//	output [31:0] jumpMux
    );

assign dataMux = MemToReg ? dataFromMemory : dataFromAlu;

endmodule
