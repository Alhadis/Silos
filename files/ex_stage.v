`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:06 03/18/2014 
// Design Name: 
// Module Name:    ex_stage 
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

//ex_stage

module ex_stage (clk, rst, id_imm, id_inA, id_inB, id_wreg, id_m2reg, id_wmem, id_aluc, id_aluimm,id_shift, id_branch, id_pc4,id_regrt,id_rt,id_rd,
	ex_wreg, ex_m2reg, ex_wmem, ex_aluR, ex_inB, ex_destR, ex_branch, ex_pc, ex_zero, 
	ID_ins_type, ID_ins_number, EXE_ins_type, EXE_ins_number);
	input clk;
	input rst;
	input[31:0] id_imm;
	input[31:0] id_inA;
	input[31:0] id_inB;
	input id_wreg;
	input id_m2reg;
	input id_wmem;
	input[3:0] id_aluc;
	input id_aluimm;
	input id_shift;
	input[4:0] id_regrt;
	input[4:0] id_rt;
	input[4:0] id_rd;
	
	input[3:0] ID_ins_type;
	input[3:0] ID_ins_number;
	output[3:0] EXE_ins_type;
	output[3:0] EXE_ins_number;
	
	input[31:0] id_pc4;
	input id_branch;
	output ex_branch;
	output ex_zero;
	output ex_wreg;
	output ex_m2reg;
	output ex_wmem;
	output[31:0] ex_aluR;
	output[31:0] ex_inB;
	output[31:0] ex_pc;
	output[4:0] ex_destR;
	
	wire [3:0] ealuc;
	wire ealuimm,eshift;
	wire [31:0] sa;
	wire [31:0] edata_a,edata_b,a_in,b_in,odata_imm;
	wire [31:0] ex_aluR;
	wire [31:0] epc4;
	wire e_regrt;
	wire [4:0]e_rt;
	wire [4:0]e_rd;

	assign a_in = eshift ? sa : edata_a;
	assign b_in = ealuimm ? odata_imm : edata_b;
	assign ex_inB = edata_b;//!
	assign ex_pc = epc4 + odata_imm;//!
	assign ex_zero = (ex_aluR==32'h0);//!
	assign ex_destR = e_regrt? e_rt: e_rd; //!
	
	Reg_ID_EXE	x_Reg_ID_EXE(clk, rst, id_wreg,id_m2reg,id_wmem,id_aluc,id_shift,id_aluimm, id_inA,id_inB,id_imm,id_branch,id_pc4,id_regrt,id_rt,id_rd,
		ex_wreg,ex_m2reg,	ex_wmem,ealuc,	eshift, ealuimm, edata_a,edata_b, odata_imm, ex_branch, epc4,e_regrt,e_rt,e_rd,
		ID_ins_type, ID_ins_number, EXE_ins_type, EXE_ins_number);
	imm2sa x_imm2sa(odata_imm,sa);
	alu x_Alu(a_in,b_in,ealuc,ex_aluR);
	
endmodule
