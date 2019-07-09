/*
 *******************************************************************************
 *  File Name   :   ada_hazard.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 10th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (c) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Hazard detection and forwarding control.
 *                  Also, controls the pipeline registers for proper functioning
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_hazard(
    input   [4:0]   id_gpr_port_a,          // GPR address A: ID stage
    input   [4:0]   id_gpr_port_b,          // GPR address B: ID stage
    input   [4:0]   ex_gpr_wa,              // GPR write address: EX stage
    input   [4:0]   mem_gpr_wa,             // GPR write address: MEM stage
    input   [4:0]   wb_gpr_wa,              // GPR write address: WB stage
    input           ex_gpr_we,              // GPR write enable: EX stage
    input           mem_gpr_we,             // GPR write enable: MEM stage
    input           wb_gpr_we,              // GPR write enable: WB stage
    input           if_mem_request_stall,   // Request stall IF stage from memory decoder unit.
    input           ex_data_read,           // Memory load: EX stage
    input           mem_request_stall,      // Request stall MEM stage from memory decoder unit.
    input           if_exception_stall,     // Request stall IF stage from exception controller.
    input           id_exception_stall,     // Request stall ID stage from exception controller.
    input           ex_exception_stall,     // Request stall EX stage from exception controller.
    input           mem_exception_stall,    // Request stall MEM stage from exception controller.
    input           ex_exu_stall,           // Hazard from EX stage
    output  [1:0]   forward_port_a_select,  // forwarding selector: port A
    output  [1:0]   forward_port_b_select,  // forwarding selector: port B
    output          if_stall,               // Stall IF stage
    output          id_stall,               // Stall ID stage
    output          ex_stall,               // Stall EX stage
    output          mem_stall,              // Stall MEM stage
    output          wb_stall                // Stall WB stage
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: wire
    //--------------------------------------------------------------------------
    // no forwarding if reading register zero
    wire id_port_a_is_zero;
    wire id_port_b_is_zero;
    // verify match: register address and write address (EX, MEM & WB)
    wire id_ex_port_a_match;
    wire id_ex_port_b_match;
    wire id_mem_port_a_match;
    wire id_mem_port_b_match;
    wire id_wb_port_a_match;
    wire id_wb_port_b_match;
    // ID stall: EX
    wire id_stall_1;
    wire id_stall_2;
    // ID forwarding: EX
    wire id_forward_1;
    wire id_forward_2;
    // ID forwarding: MEM
    wire id_forward_3;
    wire id_forward_4;
    // ID forwarding: WB
    wire id_forward_5;
    wire id_forward_6;

    //--------------------------------------------------------------------------
    // assignments
    //--------------------------------------------------------------------------
    assign id_port_a_is_zero   = (id_gpr_port_a == 5'b0);
    assign id_port_b_is_zero   = (id_gpr_port_b == 5'b0);

    // perform address check
    assign id_ex_port_a_match  = (id_gpr_port_a == ex_gpr_wa)  & (~id_port_a_is_zero) & ex_gpr_we;
    assign id_mem_port_a_match = (id_gpr_port_a == mem_gpr_wa) & (~id_port_a_is_zero) & mem_gpr_we;
    assign id_wb_port_a_match  = (id_gpr_port_a == wb_gpr_wa)  & (~id_port_a_is_zero) & wb_gpr_we;
    assign id_ex_port_b_match  = (id_gpr_port_b == ex_gpr_wa)  & (~id_port_b_is_zero) & ex_gpr_we;
    assign id_mem_port_b_match = (id_gpr_port_b == mem_gpr_wa) & (~id_port_b_is_zero) & mem_gpr_we;
    assign id_wb_port_b_match  = (id_gpr_port_b == wb_gpr_wa)  & (~id_port_b_is_zero) & wb_gpr_we;

    // stall on ID if EX match and memory access (Load instruction on EX stage -> create Delay Slot).
    assign id_stall_1          = id_ex_port_a_match & ex_data_read;
    assign id_stall_2          = id_ex_port_b_match & ex_data_read;

    // forward from EX if match (and if EX instruction isn't a load instruction. Store doesn't affect here)
    assign id_forward_1        = id_ex_port_a_match & ~ex_data_read;
    assign id_forward_2        = id_ex_port_b_match & ~ex_data_read;

    //forward from MEM if match and no memory write.
    // using ~mem_data_write here is redundant, because mem_data_write = ~mem_gpr_we.
    assign id_forward_3        = id_mem_port_a_match;
    assign id_forward_4        = id_mem_port_b_match;

    // forward from WB
    assign id_forward_5        = id_wb_port_a_match;
    assign id_forward_6        = id_wb_port_b_match;

    //--------------------------------------------------------------------------
    // Assign stall signals
    //--------------------------------------------------------------------------
    assign wb_stall  = mem_stall;                                                   // this can be 0 (never stall)
    assign mem_stall = mem_exception_stall | mem_request_stall;
    assign ex_stall  = ex_exception_stall  | ex_exu_stall | mem_stall;
    assign id_stall  = id_exception_stall  | id_stall_1 | id_stall_2 | ex_stall ;
    assign if_stall  = if_exception_stall  | if_mem_request_stall | id_stall;

    //--------------------------------------------------------------------------
    // forwarding control signals
    // 00 -> ID (no forwarding)
    // 01 -> EX
    // 10 -> MEM
    // 11 -> WB
    //--------------------------------------------------------------------------
    assign forward_port_a_select = (id_forward_1) ? 2'b01 : ((id_forward_3) ? 2'b10 : ((id_forward_5) ? 2'b11 : 2'b00));
    assign forward_port_b_select = (id_forward_2) ? 2'b01 : ((id_forward_4) ? 2'b10 : ((id_forward_6) ? 2'b11 : 2'b00));
endmodule
