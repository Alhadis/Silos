`timescale 1ns / 1ps

//GROUP NUMBER  - A05
//GROUP MEMBERS - ASHNA JAIN(201501008)
//					 - CHARMI CHOKSHI(201501021)
//              - MANASI DUBEY(201501051)
//DESCRIPTION:  - This is the Top Module of our microprocessor.

//code starts from here
module main_module(ins, A, B, current_address, ans_ex, mux_ans_dm, ans_wb, data_in, clk, interrupt, reset, data_out);

input [7:0] data_in;		//input declaration
input clk;
input interrupt;
input reset;

output [7:0] data_out;		//output declaration
output [19:0] ins;
output [7:0] A;
output [7:0] B;
output [7:0] current_address;
output [7:0] ans_ex;
output [7:0] mux_ans_dm;
output [7:0] ans_wb;


//declaring internal inputs and outputs of each module as wire

wire [19:0] ins_pm;		//wire declaration
wire [7:0] jmp_loc, data_out,B_Bypass, mux_ans_dm, imm, data_in;
wire [3:0] flag_ex;
wire [4:0] RW_ex, RW_dm, op_dec, RW_dec;
wire [1:0] mux_sel_A, mux_sel_B;	
wire pc_mux_sel, stall, stall_pm, mem_en_ex,mem_rw_ex,mem_mux_sel_ex, mem_en_dec,mem_rw_dec,mem_mux_sel_dec, imm_sel;


//calling the instances of each modules used in this MIPS Processor

program_counter_module pc(ins,ins_pm,current_address,jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk);		//calling instance of program_counter_module

jump_control_module jc(ins,clk,interrupt,current_address,flag_ex,reset,pc_mux_sel,jmp_loc);		//calling instance of jump_control_module

register_bank_module rb(ins, RW_dm, ans_ex, mux_ans_dm, ans_wb, imm, mux_sel_A, mux_sel_B, imm_sel, clk, reset, A, B);		//calling instance of register_bank_module

dependency_check_module dc(ins,clk,reset,mux_sel_A,mux_sel_B,imm_sel,imm,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,RW_dec,op_dec);		//calling instance of dependency_check_module

execution_module eb(flag_ex,ans_ex,data_out,B_Bypass,mem_en_ex,mem_rw_ex,mem_mux_sel_ex,RW_ex,A,B,data_in,op_dec,clk,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,RW_dec,reset);		//calling instance of execution_module

data_memory_module dm(ans_ex,B_Bypass,RW_ex,mem_en_ex,mem_rw_ex,mem_mux_sel_ex,clk,reset,mux_ans_dm,RW_dm);		//calling instance of data_memory_module

stall_control_module sc(stall,stall_pm,ins_pm,clk,reset);		//calling instance of stall_control_module

write_back_module wb(mux_ans_dm,ans_wb,reset,clk);		//calling instance of write_back_module

endmodule		//code enda here
