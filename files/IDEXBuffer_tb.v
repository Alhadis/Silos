`timescale 1ns / 1ps
`include "IDEXBuffer.v"

module IDEXBuffer_tb;

	reg clk, hazard, reset,regWrite,r0Write,alusource,alusource2,memRead,memWrite,memSource;
	reg[3:0] RA1,RA2,FN_offset,opcode;
	reg[15:0] SE_offset,RD1,RD2;
	wire regWrite_o,r0Write_o,alusource_o,alusource2_o,memRead_o,memWrite_o,memSource_o;
	wire[3:0] RA1_o,RA2_o,opcode_o,FN_offset_o;
	wire[15:0] SE_offset_o,RD1_o,RD2_o;

	IDEXBuffer uut(clk,hazard,reset,opcode,RA1,RA2,FN_offset,RD1,RD2,SE_offset,regWrite,r0Write,alusource,alusource2,memRead,memWrite,memSource,opcode_o,RA1_o,RA2_o,FN_offset_o,RD1_o,RD2_o,SE_offset_o,regWrite_o,r0Write_o,alusource_o,alusource2_o,memRead_o,memWrite_o,memSource_o);

	initial clk=0;
	always #10 clk = ~clk;

	initial begin
	hazard = 0;
	reset = 1;
	regWrite = 1;
	r0Write = 1;
	alusource = 1;
	alusource2 = 1;
	memRead = 1;
	memWrite = 1;
	memSource = 1;
	RA1 = 1;
	RA2 = 1;
	FN_offset = 1;
	opcode = 1;
	SE_offset = 1;
	RD1 = 1;
	RD2 = 1;
	#20
	reset = 0;
	#20
	hazard = 1;
	reset = 1;
	regWrite = 0;
	r0Write = 0;
	alusource = 0;
	alusource2 = 0;
	memRead = 0;
	memWrite = 0;
	memSource = 0;
	RA1 = 0;
	RA2 = 0;
	FN_offset = 0;
	opcode = 0;
	SE_offset = 0;
	RD1 = 0;
	RD2 = 0;
	#20
	$finish;
	end
endmodule
