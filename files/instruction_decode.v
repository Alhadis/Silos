`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:08 06/13/2019 
// Design Name: 
// Module Name:    instruction_decode 
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
module instruction_decode(
	input clk,
	input reset,
	input [31:0] instruction,
	input [31:0] WriteData,
	input [31:0] nextIns,
	output Jump,
	output Branch,
	output MemRead,
	output MemtoReg,
	output [1:0] AluOp,
	output MemWrite,
	output AluSrc,
	output [31:0]ReadData1,
	output [31:0]ReadData2,
	output [31:0]extendOut, //no se ni que deberia valer esto...
	output [31:0]jumpIns,
	
	output RegWrite,
	output [4:0] WriteRegister, //Van al pipeline y despues vuelven cuando esten los datos para escribir
	
	input WB_RegWrite,
	input [4:0]WB_WriteRegister
    );
	wire RegDst;
	
	assign jumpIns[27:0] = instruction[25:0] << 2;
	assign jumpIns [31:28] = nextIns[31:28];
	
	assign WriteRegister = RegDst ? instruction[15:11] : instruction[20:16];
	
	
control control(
	.opcode(instruction[31:26]),
	.RegDst(RegDst),
	.AluSrc(AluSrc),
	.MemtoReg(MemtoReg),
	.RegWrite(RegWrite),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.Branch(Branch),
	.AluOp1(AluOp[1]),
	.AluOp0(AluOp[0]),
	.Jump(Jump)
);

registers registers(
	.clk(clk),
	.reset(reset),
	.regwrite(WB_RegWrite),
	.wr(WB_WriteRegister),
	.rr1(instruction[25:21]),
	.rr2(instruction[20:16]),
	.wd(WriteData),
	.rd1(ReadData1),
	.rd2(ReadData2)
);

sign_extend sign_extend(
	.unextend(instruction[15:0]),
	.extend(extendOut)
);

endmodule
