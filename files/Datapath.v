`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 15:52:07
// Design Name: 
// Module Name: Datapath
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


module Datapath(CLK, Reset, PCEn, IorD, MemWrite, IRWrite,
				RegDst, Mem2Reg, RegWrite, ALUSrcA, ALUSrcB,
				ALUControl, PCSrc, ReadData, ExS, func, op, 
				WriteMemAddress, PC, Zero, WriteData2Reg, WriteData,
				Reg2Show, Mem2Show, RegWriteAddress, Instr, MemContent, RegContent);
	input CLK, Reset;
	input PCEn, IorD, MemWrite, IRWrite;
	input [1:0] RegDst;
	input Mem2Reg, RegWrite, ALUSrcA;
	input [1:0] ALUSrcB;
	input [3:0] ALUControl;
	input [1:0] PCSrc;
	output [31:0] ReadData; //read from mem
	input ExS;
	
	output [5:0] func;
	output [5:0] op;
	output [31:0] WriteMemAddress;
	output [31:0] PC;
	output Zero;
	output [31:0] WriteData2Reg;
	output [31:0] WriteData; //write to mem
	
	//show part
	input [4:0] Reg2Show;//regfile
	input [6:0] Mem2Show;//mem file
	output [4:0] RegWriteAddress;//reg file
	output [31:0] Instr;//have
	output [31:0] MemContent;//mem file
	output [31:0] RegContent;//reg file
	
	wire [31:0] NextPC;
	wire [31:0] ALUOut;
//	wire [31:0] Instr;
	wire [31:0] ReadDataAfterFn;
//	wire [4:0] Reg2Write;
	
	wire [31:0] ReadData1, ReadData2;
	wire [31:0] SignImm, LeftShiftSignImm;
	wire [31:0] ReadDataA, ReadDataB;
	wire [31:0] SrcAIn, SrcBIn;
	wire [31:0] ALUResult;
	
	
	assign func = Instr[5:0];
	assign op = Instr[31:26];
	
	//pc floper
	flopenr #(32) myPCflopenr(CLK, Reset, PCEn, NextPC, PC);
	//mux data or instr
	Mux2 #(32) muxPCorInsrt(PC, ALUOut, IorD, WriteMemAddress);
	//memory read and write
	assign WriteData = ReadDataB;
	IDMem myMem(CLK, IorD, MemWrite, WriteMemAddress, WriteData, ReadData,
				Mem2Show, MemContent);
	//instr flopenr
	flopenr #(32) InstrFlopenr(CLK, 0, IRWrite, ReadData, Instr);
	//read data flopenr
	flopenr #(32) ReadDataFlopenr(CLK, 0, 1, ReadData, ReadDataAfterFn);
	//regDst mux4
	Mux4 #(5) RegDstMux4(Instr[20:16], Instr[15:11], {5'b11111}, {5'b00000}, RegDst, RegWriteAddress);
	//write data to reg mux2
	Mux2 #(32) WriteDataMux2(ALUOut, ReadDataAfterFn, Mem2Reg, WriteData2Reg);
	//register file
	RegFile myReg(CLK, RegWrite, Instr[25:21], Instr[20:16], RegWriteAddress, WriteData2Reg, ReadData1, ReadData2,
					Reg2Show, RegContent);
	//read data from register file flopenr
	flopenr #(32) RegRead1(CLK, 0, 1, ReadData1, ReadDataA);
	flopenr #(32) RegRead2(CLK, 0, 1, ReadData2, ReadDataB);	
	//sign extend
	SignExtend mySignExtend(ExS, Instr[15:0], SignImm);
	//signImm shift left
	ShiftLeft2 myShift(SignImm, LeftShiftSignImm);
	//ALUSrcA mux2
	Mux2 #(32) ALUSrcAMux2(PC, ReadDataA, ALUSrcA, SrcAIn);
	//ALUSrcB mux34
	Mux4 #(32) ALUSrcBMux4(ReadDataB, 4, SignImm, LeftShiftSignImm, ALUSrcB, SrcBIn);
	//ALU
	ALU myALU(SrcAIn, SrcBIn, ALUControl, Instr[10:6], Zero, ALUResult);
	//ALUResult flopenr
	flopenr #(32) ALUResultFlopenr(CLK, 0, 1, ALUResult, ALUOut);
	// instr[25:0] shift left and mux PCSrc
	Mux4 #(32) NextPCMux4(ALUResult, ALUOut, {Instr[31:28], Instr[25:0], 2'b00}, {32'b0}, PCSrc, NextPC);
	

endmodule
