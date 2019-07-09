`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:29 03/18/2014 
// Design Name: 
// Module Name:    if_stage 
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
//stages of p_cpu
`include "macro.vh"

//if_stage
module if_stage (CCLK, clk, rst, npc, nid_pc, ctrl_branch, if_wpcir,
	if_pc, if_pc4, if_inst, IF_ins_type,IF_ins_number,ID_ins_type,ID_ins_number);
	input CCLK;
	input clk;
	input rst;
	input [31:0] npc;
	input [31:0] nid_pc;
	input ctrl_branch;
	
	input if_wpcir;  //#
	
	output [31:0] if_pc;
	output [31:0] if_pc4;
	output [31:0] if_inst;
	output [3:0] IF_ins_number;
	output [3:0] IF_ins_type;
	output [3:0] ID_ins_type;
	output [3:0] ID_ins_number;
	
	wire clk;
	wire rst;
	wire ctrl_branch;
	wire [31:0] nid_pc;
	wire [31:0] if_pc;
	wire [31:0] if_inst;
	wire [31:0] inst_m;
	reg [31:0] pc;
	reg run;
	reg [3:0] ID_ins_type;
	reg [3:0] ID_ins_number;
	
	initial begin
		pc[31:0]=32'hffffffff;
		run = 1'b0;
		ID_ins_type[3:0] = 4'b0000;
		ID_ins_number[3:0] = 4'b0000;
	end


	assign if_pc4 =if_wpcir?(pc):(pc+1);//! you know~
	assign if_pc =(ctrl_branch)? (nid_pc):(if_pc4);//! judge by ctrl_branch
	assign IF_ins_number[3:0] = npc[3:0] ;
	assign IF_ins_type[3:0] = `INST_TYPE_NONE;
	assign if_inst[31:0] = inst_m[31:0];
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			pc[31:0]<=0;
			run <= 1'b0;
		end
		else begin
	      pc[31:0] <= npc[31:0];  //this should be if_pc I think
			run <= 1'b1;
		end
		//run <= 1'b1;
	end

	always @(if_inst or run) begin
		if (run == 1'b0) begin	//for initial 0
			ID_ins_type[3:0] <= 4'b0000;
			ID_ins_number[3:0] <= 4'b0000;
		end
		else
		begin
		
			if(!if_wpcir)
				ID_ins_number[3:0] <= pc[3:0];
			 
				
			if(!if_wpcir) begin 
				case (if_inst[31:26])
					`OP_ALUOp: begin		//R-type
						case(if_inst[5:0])
							`FUNC_ADD: ID_ins_type <= `INST_TYPE_ADD;
							`FUNC_SUB: ID_ins_type <= `INST_TYPE_SUB;
							`FUNC_AND: ID_ins_type <= `INST_TYPE_AND;
							`FUNC_OR: ID_ins_type <= `INST_TYPE_OR;
							`FUNC_NOR: ID_ins_type <= `INST_TYPE_NOR;
							`FUNC_SLT: ID_ins_type <= `INST_TYPE_SLT;
							`FUNC_SLL: ID_ins_type <= `INST_TYPE_SLL;
							`FUNC_SRL: ID_ins_type <= `INST_TYPE_SRL;
							`FUNC_SRA: ID_ins_type <= `INST_TYPE_SRA;
							default: ID_ins_type <= `INST_TYPE_NONE;
						endcase
					end
					`OP_ADDI:ID_ins_type <= `INST_TYPE_ADD;
					`OP_ANDI: ID_ins_type <= `INST_TYPE_AND;
					`OP_ORI: ID_ins_type <= `INST_TYPE_OR;
					`OP_LW: ID_ins_type <= `INST_TYPE_LW;
					`OP_SW: ID_ins_type <= `INST_TYPE_SW;
					`OP_BEQ: ID_ins_type <= `INST_TYPE_BEQ;
					`OP_JMP: ID_ins_type <= `INST_TYPE_JMP;
					`OP_BNE: ID_ins_type <= `INST_TYPE_BNE;
					default: begin
						ID_ins_type <= `INST_TYPE_NONE;
					end
				endcase
			end
			
			else 
				ID_ins_type <= `INST_TYPE_NONE;
		end
	end

	//instr_mem x_inst_mem(.addr(pc[7:0]),.clk(clk),.dout(inst_m));
	imem x_inst_mem (
	  .clka(~CCLK), // input clka
	  .addra(pc[7:0]), // input [7 : 0] addra
	  .douta(inst_m) // output [31 : 0] douta
	);
	
endmodule