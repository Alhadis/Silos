/*
 ******************************************************************************
 *  File Name   :   tb_ada_id_stage.v
 *  Project     :   NR1K processor
 *  Version     :   0.1
 *  Date        :   Aug 28th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Testbench for the Instruction decode Stage
 ******************************************************************************
 */
`timescale 1ns / 1ns

`include "ada_defines.v"
`define cycle   10

module tb_ada_id_stage;
    reg             clk;
    reg             rst;
    reg     [31:0]  instruction;
    reg     [31:0]  pc_current;
    reg     [31:0]  pc_next;
    reg     [1:0]   forward_port_a_select;
    reg     [1:0]   forward_port_b_select;
    reg     [31:0]  exu_fwd_data;
    reg     [31:0]  mem_fwd_data;
    reg     [31:0]  wb_fwd_data;
    reg     [4:0]   wb_gpr_wa;
    reg     [31:0]  wb_gpr_wd;
    reg             wb_gpr_we;
    reg     [31:0]  sr_data_input;
    reg             sr_sm;

    wire            haz_take_branch;
    wire            exc_op_reset;
    wire            exc_op_shutdown;
    wire            exc_op_syscall;
    wire            exc_op_break;
    wire            exc_op_invalid;
    wire            exc_op_rfe;
    wire            exc_op_rfb;
    wire            exc_bad_branch_addr;
    wire    [31:0]  pc_branch_address;
    wire    [4:0]   id_gpr_port_a;
    wire    [4:0]   id_gpr_port_b;
    wire    [4:0]   exu_operation;
    wire    [31:0]  exu_port_a;
    wire    [31:0]  exu_port_b;
    wire    [31:0]  mem_store_data;
    wire    [4:0]   exu_gpr_wa;
    wire            exu_gpr_we;
    wire    [4:0]   sr_ra;
    wire    [4:0]   sr_wa;
    wire    [31:0]  sr_wd;
    wire            sr_we;
    wire            mem_write;
    wire            mem_read;
    wire            mem_byte;
    wire            mem_halfword;
    wire            mem_sign_ext;
    wire            mem_exu_mem_select;

    //--------------------------------------------------------------------------
    // UUT
    //--------------------------------------------------------------------------
    ada_id_stage uut(
        .clk(clk),
        .instruction(instruction),
        .pc_current(pc_current),
        .pc_next(pc_next),
        .forward_port_a_select(forward_port_a_select),
        .forward_port_b_select(forward_port_b_select),
        .exu_fwd_data(exu_fwd_data),
        .mem_fwd_data(mem_fwd_data),
        .wb_fwd_data(wb_fwd_data),
        .wb_gpr_wa(wb_gpr_wa),
        .wb_gpr_wd(wb_gpr_wd),
        .wb_gpr_we(wb_gpr_we),
        .sr_data_input(sr_data_input),
        .sr_sm(sr_sm),

        .haz_take_branch(haz_take_branch),
        .exc_op_reset(exc_op_reset),
        .exc_op_shutdown(exc_op_shutdown),
        .exc_op_syscall(exc_op_syscall),
        .exc_op_break(exc_op_break),
        .exc_op_invalid(exc_op_invalid),
        .exc_op_rfe(exc_op_rfe),
        .exc_op_rfb(exc_op_rfb),
        .exc_bad_branch_addr(exc_bad_branch_addr),
        .pc_branch_address(pc_branch_address),
        .id_gpr_port_a(id_gpr_port_a),
        .id_gpr_port_b(id_gpr_port_b),
        .exu_operation(exu_operation),
        .exu_port_a(exu_port_a),
        .exu_port_b(exu_port_b),
        .mem_store_data(mem_store_data),
        .exu_gpr_wa(exu_gpr_wa),
        .exu_gpr_we(exu_gpr_we),
        .sr_ra(sr_ra),
        .sr_wa(sr_wa),
        .sr_wd(sr_wd),
        .sr_we(sr_we),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .mem_byte(mem_byte),
        .mem_halfword(mem_halfword),
        .mem_sign_ext(mem_sign_ext),
        .mem_exu_mem_select(mem_exu_mem_select)
        );

    //--------------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------------
    initial begin
        // Initialize Inputs
        clk                   = 1;
        rst                   = 1;
        instruction           = 32'h0000_0000;
        pc_current            = 32'hDEAD_BEEF;
        pc_next               = 32'hDEAD_C0DE;
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b00;
        exu_fwd_data          = 32'hA0A0_B0B0;
        mem_fwd_data          = 32'hA1A1_B1B1;
        wb_fwd_data           = 32'hA2A2_B2B2;
        wb_gpr_wa             = 5'b00000;
        wb_gpr_wd             = 32'h0101_0404;
        wb_gpr_we             = 0;
        sr_data_input        = 32'h0BAD_F00D;
        sr_sm                = 0;

        // dump the wave file
        $dumpfile("tb_id_stage.vcd");
        $dumpvars;
    end

    //--------------------------------------------------------------------------
    // clock
    //--------------------------------------------------------------------------
    always  begin
        #(`cycle/2) clk = !clk;
    end

    //--------------------------------------------------------------------------
    // simulation
    //--------------------------------------------------------------------------
    initial begin
        rst = #(5*`cycle)0;
        $display("Testing the ID stage.");
        @(posedge clk)
        wb_gpr_wa = 5'b00000;
        wb_gpr_we = 1;
        @(posedge clk)
        wb_gpr_wa = 5'b00001;
        @(posedge clk)
        wb_gpr_wa = 5'b00010;
        @(posedge clk)
        wb_gpr_wa = 5'b00011;
        @(posedge clk)
        wb_gpr_wa = 5'b00100;
        @(posedge clk)
        wb_gpr_wa = 5'b00101;
        @(posedge clk)
        wb_gpr_wa = 5'b00110;
        @(posedge clk)
        wb_gpr_we = 0;
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_ADD, 5'b01000, 5'b0001, 5'b00010, 5'b00000, `EXT_OP_ADD}; // R8 <= R1 + R2
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b01;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b10;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b11;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b01;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b10;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b11;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b00;
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_ADDI, 5'b01001, 5'b00100, 16'h0100}; // R9 <= R4 + 0x0100
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b01;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b10;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b11;
        forward_port_b_select = 2'b00;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b01;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b10;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b11;
        @(posedge clk)
        forward_port_a_select = 2'b00;
        forward_port_b_select = 2'b00;
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_B, 5'b11111, 21'h00_0001};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_B, 5'b11111, 21'h00_AA00};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_BE, 5'b11111, 5'b0001, 16'h0010};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_BE, 5'b00011, 5'b00001, 16'h0100};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_BG, 5'b11111, 5'b00000, 16'h0101};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_BG, 5'b11111, 5'b00010, 16'h0110};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_CALL, 5'b11111, 21'h00_CA77}; //
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_CALLR, 5'b11111, 5'b0000, 5'b00001, 5'b00000, `EXT_OP_CALLR};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_LDSB, 5'b00010, 5'b00000, 16'h0001};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_LDSH, 5'b0011, 5'b00000, 16'h002};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_LDUB, 5'b00100, 5'b00000, 16'h0003};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_LDUH, 5'b00101, 5'b00000, 16'h0004};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_LDUI, 5'b00110, 5'b00000, 16'h2345};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_LDW, 5'b00111, 5'b00000, 16'h0020};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RESET, 5'b00000, 5'b00000, 5'b00000, 5'b00000, `EXT_OP_RESET};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RFE, 5'b00000, 5'b00000, 5'b00000, 5'b00000, `EXT_OP_RFE};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RFB, 5'b00000, 5'b00000, 5'b00000, 5'b00000, `EXT_OP_RFB};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RSCR, 5'b11111, 5'b0000, 5'b00001, 5'b00000, `EXT_OP_RSCR};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RESET, 5'b00000, 5'b00000, 5'b00000, 5'b00000, `EXT_OP_RESET};
        sr_sm      = 1;
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RFE, 5'b00000, 5'b00000, 5'b00000, 5'b00000, `EXT_OP_RFE};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RFB, 5'b00000, 5'b00000, 5'b00000, 5'b00000, `EXT_OP_RFB};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_RSCR, 5'b11111, 5'b0000, 5'b00001, 5'b00000, `EXT_OP_RSCR};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = {`OP_WSCR, 5'b00101, 5'b0011, 5'b00000, 5'b00000, `EXT_OP_WSCR};
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        instruction = 32'h0000_0000;
        sr_sm      = 0;
        //---------------------------------------------------------------------------------------------
        @(posedge clk)
        //---------------------------------------------------------------------------------------------
        $display("Test finished");
        $finish;
    end
endmodule
