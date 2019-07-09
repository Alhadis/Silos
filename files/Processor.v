`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:43 10/29/2013 
// Design Name: 
// Module Name:    Processor 
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
module Processor
(
	input reset,
	input clk,
	output[5:0] op,
	output[5:0] fn
);
//wire[5:0] op,fn;

wire[1:0] regDst;
wire writeEn;

wire ALUimm,Alufn,logicfn,fnClass;

wire RegImm, AL, leftright;

wire DRead, DWrite;

wire[2:0] brType;
wire[1:0] PCSel;

wire[1:0] RegInData;

Datapath d(
					.op(op), .fn(fn),
					.PCReset(reset),
					.regDst(regDst), .writeEn(writeEn),
					.ALUimm(ALUimm), .Alufn(Alufn), .logicfn(logicfn), .fnClass(fnClass),
					.RegImm(RegImm), .AL(AL), .leftright(leftright),
					.DRead(DRead), .DWrite(DWrite),
					.brType(brType), .PCSel(PCSel),
					.RegInData(RegInData),
					.clk(clk)
			 );

Controller c(
					.op(op), .fn(fn),
					.regDst(regDst), .writeEn(writeEn),
					.ALUimm(ALUimm), .Alufn(Alufn), .logicfn(logicfn), .fnClass(fnClass),
					.RegImm(RegImm), .AL(AL), .leftright(leftright),
					.DRead(DRead), .DWrite(DWrite),
					.brType(brType), .PCSel(PCSel),
					.RegInData(RegInData)
				);

endmodule
