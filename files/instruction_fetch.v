`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:24:31 06/11/2019 
// Design Name: 
// Module Name:    instruction_fetch 
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
module instruction_fetch#(
	parameter length = 32,
	parameter addr_length = 32
	)(
	input reset,
	input clk,
	input Wr,
	input [length - 1: 0] dataFromInterface,
	input [addr_length - 1: 0] addrFromInterface,
	output [length - 1 : 0] pm_out,
	output [length - 1 : 0] nextIns, //adder_out
	
	input PCSrc,
	input Jump,
	input [31:0] branchIns,
	input [31:0] jumpIns
    );
	 wire [31:0] branchMux;
	 wire [31:0] jumpMux;
	 
	 assign branchMux = PCSrc ? branchIns : nextIns;
	 assign jumpMux = Jump ? jumpIns : branchMux;
	 
	 wire [addr_length - 1 : 0] addr;
	 wire [length - 1 : 0]pc_out;
	 wire  [length - 1 : 0]constant;
	 
	 
	 assign constant = 32'b100;
	 assign addr = Wr ? addrFromInterface : pc_out;

PC pc(
	.clk(clk),
	.reset(reset),
	.new_pc(jumpMux),
	.pc(pc_out)
);

adder adder(
	.a(pc_out),
	.b(constant),
	.result(nextIns)
);

program_memory PM(
	.clk(clk),
	.addr(addr),
	.Wr(Wr),
	.dataFromInterface(dataFromInterface),
	.instruction(pm_out)
);

endmodule
