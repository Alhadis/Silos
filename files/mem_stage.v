`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:52 03/19/2014 
// Design Name: 
// Module Name:    mem_stage 
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
//mem_stage
module mem_stage (clk, rst, ex_destR, ex_inB, ex_aluR, ex_wreg, ex_m2reg, ex_wmem, ex_branch, ex_pc, ex_zero,
	mem_wreg, mem_m2reg, mem_mdata,	mem_aluR, mem_destR, mem_branch, mem_pc,
	EXE_ins_type, EXE_ins_number, MEM_ins_type, MEM_ins_number);
  
	input clk;
	input rst;
	input[4:0] ex_destR;
	input[31:0] ex_inB;
	input[31:0] ex_aluR;
	input ex_branch;
	input[31:0] ex_pc;
	input ex_zero;
	input ex_wreg;
	input ex_m2reg;
	input ex_wmem;
	
	output mem_branch;
	
	input[3:0] EXE_ins_type;
	input[3:0] EXE_ins_number;
	output[3:0] MEM_ins_type;
	output[3:0] MEM_ins_number;
	
	output mem_wreg;
	output mem_m2reg;
	output[31:0] mem_mdata;
	output[31:0] mem_aluR;
	output[31:0] mem_pc;
	output[4:0] mem_destR;

	wire mwmem;
	wire branch, zero;
	wire [31:0] data_in;
	wire mem_branch;
	
	assign mem_branch = zero & branch;//!
	Reg_EXE_MEM x_Reg_EXE_MEM(clk,rst,ex_wreg,ex_m2reg,ex_wmem,ex_aluR,ex_inB,ex_destR,ex_branch,ex_pc,ex_zero,  //inputs
		mem_wreg, mem_m2reg, mwmem, mem_aluR, data_in, mem_destR, branch, mem_pc, zero,
		EXE_ins_type, EXE_ins_number, MEM_ins_type, MEM_ins_number);
	
	//data_mem x_data_mem(mem_aluR[7:0],clk,data_in,mem_mdata,mwmem);
	dmem x_data_mem (
	  .clka(~clk), // input clka
	  .wea(mwmem), // input [0 : 0] wea
	  .addra(mem_aluR[7:0]), // input [7 : 0] addra
	  .dina(data_in), // input [31 : 0] dina
	  .douta(mem_mdata) // output [31 : 0] douta
	);
	
endmodule

