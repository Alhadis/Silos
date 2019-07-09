/*
 ******************************************************************************
 *  File Name   :   tb_ada_exception.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 17th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (c) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Testbench for the EXU (execution unit)
 ******************************************************************************
 */
`timescale 1ns / 1ns

`include "ada_defines.v"
`define cycle   10

module tb_ada_exception;
    reg             clk;
    reg             rst;
    reg     [4:0]   reg_ra;
    reg     [4:0]   reg_wa;
    reg     [31:0]  reg_data_i;
    reg             reg_we;
    reg             id_stall;
    reg             exc_if_invalid_address;
    reg             exc_op_reset;
    reg             exc_op_shutdown;
    reg             exc_op_syscall;
    reg             exc_op_break;
    reg             exc_op_invalid;
    reg             exc_branch_invalid_address;
    reg             exc_div_zero;
    reg             exc_mem_invalid_address;
    reg             op_rfe;
    reg             op_rfb;
    reg     [31:0]  io_interrupt;
    reg     [31:0]  if_bad_address;
    reg     [31:0]  id_exc_pc;
    reg     [31:0]  ex_exc_pc;
    reg     [31:0]  mem_exc_pc;
    reg     [31:0]  mem_bad_address;
    reg             id_can_exc;
    reg             ex_can_exc;
    reg             mem_can_exc;

    wire    [31:0]  reg_data_o;
    wire            kernel_mode;
    wire            if_exc_flush;
    wire            id_exc_flush;
    wire            ex_exc_flush;
    wire            mem_exc_flush;
    wire            if_exception_stall;
    wire            id_exception_stall;
    wire            ex_exception_stall;
    wire            mem_exception_stall;
    wire            exception_pc_selector;
    wire    [31:0]  exception_pc;
    wire            icache_flush;
    wire            dcache_flush;

    //--------------------------------------------------------------------------
    // UUT
    //--------------------------------------------------------------------------
    ada_exception uut(
        .clk(clk),
        .rst(rst),
        .reg_ra(reg_ra),
        .reg_wa(reg_wa),
        .reg_data_i(reg_data_i),
        .reg_we(reg_we),
        .id_stall(id_stall),
        .exc_if_invalid_address(exc_if_invalid_address),
        .exc_op_reset(exc_op_reset),
        .exc_op_shutdown(exc_op_shutdown),
        .exc_op_syscall(exc_op_syscall),
        .exc_op_break(exc_op_break),
        .exc_op_invalid(exc_op_invalid),
        .exc_branch_invalid_address(exc_branch_invalid_address),
        .exc_div_zero(exc_div_zero),
        .exc_mem_invalid_address(exc_mem_invalid_address),
        .op_rfe(op_rfe),
        .op_rfb(op_rfb),
        .io_interrupt(io_interrupt),
        .if_bad_address(if_bad_address),
        .id_exc_pc(id_exc_pc),
        .ex_exc_pc(ex_exc_pc),
        .mem_exc_pc(mem_exc_pc),
        .mem_bad_address(),
        .id_can_exc(id_can_exc),
        .ex_can_exc(ex_can_exc),
        .mem_can_exc(mem_can_exc),

        .reg_data_o(reg_data_o),
        .kernel_mode(kernel_mode),
        .if_exc_flush(if_exc_flush),
        .id_exc_flush(id_exc_flush),
        .ex_exc_flush(ex_exc_flush),
        .mem_exc_flush(mem_exc_flush),
        .if_exception_stall(if_exception_stall),
        .id_exception_stall(id_exception_stall),
        .ex_exception_stall(ex_exception_stall),
        .mem_exception_stall(mem_exception_stall),
        .exception_pc_selector(exception_pc_selector),
        .exception_pc(exception_pc),
        .icache_flush(icache_flush),
        .dcache_flush(dcache_flush)
        );

    //--------------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------------
    initial begin
        // Initialize Inputs
        clk                        = 1;
        rst                        = 1;
        reg_ra                     = 0;
        reg_wa                     = 0;
        reg_data_i                 = 0;
        reg_we                     = 0;
        id_stall                   = 0;
        exc_if_invalid_address     = 0;
        exc_op_reset               = 0;
        exc_op_shutdown            = 0;
        exc_op_syscall             = 0;
        exc_op_break               = 0;
        exc_op_invalid             = 0;
        exc_branch_invalid_address = 0;
        exc_div_zero               = 0;
        exc_mem_invalid_address    = 0;
        op_rfe                     = 0;
        op_rfb                     = 0;
        io_interrupt               = 0;
        if_bad_address             = 0;
        id_exc_pc                  = 0;
        ex_exc_pc                  = 0;
        mem_exc_pc                 = 0;
        mem_bad_address            = 0;
        id_can_exc                 = 0;
        ex_can_exc                 = 0;
        mem_can_exc                = 0;
        // dump the wave file
        $dumpfile("tb_exception.vcd");
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
        rst = #(4.5*`cycle)0;
        $display("Testing the Exception Unit: begin");
        //--------------------------------------------------------------------------
        #(10*`cycle)
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= `ADA_SR_CC_H;
        reg_wa                     <= `ADA_SR_ICC;
        reg_data_i                 <= 32'h0000_0001;
        reg_we                     <= 1;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 0;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 0;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 0;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 0;
        if_bad_address             <= 0;
        id_exc_pc                  <= 0;
        ex_exc_pc                  <= 0;
        mem_exc_pc                 <= 0;
        mem_bad_address            <= 0;
        id_can_exc                 <= 0;
        ex_can_exc                 <= 0;
        mem_can_exc                <= 0;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= `ADA_SR_CC_L;
        reg_wa                     <= `ADA_SR_DCC;
        reg_data_i                 <= 32'h0000_0001;
        reg_we                     <= 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= `ADA_SR_PIT;
        reg_data_i                 <= 32'h0000_004;
        reg_we                     <= 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= `ADA_SR_ITE;
        reg_data_i                 <= 1;
        reg_we                     <= 1;
        #(4*`cycle)
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= `ADA_SR_ITA;
        reg_data_i                 <= 1;
        reg_we                     <= 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= 0;
        reg_data_i                 <= 32'h0123_4567;
        reg_we                     <= 0;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 1;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 0;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 1;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 0;
        if_bad_address             <= 32'h0BAD_1F00;
        id_exc_pc                  <= 32'h0BAD_1D00;
        ex_exc_pc                  <= 32'h0BAD_E500;
        mem_exc_pc                 <= 32'h0BAD_E600;
        mem_bad_address            <= 32'h0BAD_E700;
        id_can_exc                 <= 1;
        ex_can_exc                 <= 1;
        mem_can_exc                <= 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= 0;
        reg_data_i                 <= 32'h0123_4567;
        reg_we                     <= 0;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 1;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 0;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 1;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 0;
        if_bad_address             <= 32'h0BAD_1F00;
        id_exc_pc                  <= 32'h0BAD_1D00;
        ex_exc_pc                  <= 32'h0BAD_E500;
        mem_exc_pc                 <= 32'h0BAD_E600;
        mem_bad_address            <= 32'h0BAD_E700;
        id_can_exc                 <= 1;
        ex_can_exc                 <= 1;
        mem_can_exc                <= 0;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= 0;
        reg_data_i                 <= 32'h0123_4567;
        reg_we                     <= 0;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 0;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 1;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 0;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 0;
        if_bad_address             <= 32'h0BAD_1F00;
        id_exc_pc                  <= 32'h0BAD_1D00;
        ex_exc_pc                  <= 32'h0BAD_E500;
        mem_exc_pc                 <= 32'h0BAD_E600;
        mem_bad_address            <= 32'h0BAD_E700;
        id_can_exc                 <= 1;
        ex_can_exc                 <= 1;
        mem_can_exc                <= 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= 0;
        reg_data_i                 <= 32'h0123_4567;
        reg_we                     <= 0;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 0;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 1;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 0;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 0;
        if_bad_address             <= 32'h0BAD_1F00;
        id_exc_pc                  <= 32'h0BAD_1D00;
        ex_exc_pc                  <= 32'h0BAD_E500;
        mem_exc_pc                 <= 32'h0BAD_E600;
        mem_bad_address            <= 32'h0BAD_E700;
        id_can_exc                 <= 1;
        ex_can_exc                 <= 0;
        mem_can_exc                <= 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= 0;
        reg_data_i                 <= 32'h0123_4567;
        reg_we                     <= 0;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 0;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 1;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 0;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 0;
        if_bad_address             <= 32'h0BAD_1F00;
        id_exc_pc                  <= 32'h0BAD_1D00;
        ex_exc_pc                  <= 32'h0BAD_E500;
        mem_exc_pc                 <= 32'h0BAD_E600;
        mem_bad_address            <= 32'h0BAD_E700;
        id_can_exc                 <= 1;
        ex_can_exc                 <= 0;
        mem_can_exc                <= 0;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= 0;
        reg_data_i                 <= 32'h0123_4567;
        reg_we                     <= 0;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 0;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 0;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 0;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 32'h1000_1000;
        if_bad_address             <= 32'h0BAD_1F00;
        id_exc_pc                  <= 32'h0BAD_1D00;
        ex_exc_pc                  <= 32'h0BAD_E500;
        mem_exc_pc                 <= 32'h0BAD_E600;
        mem_bad_address            <= 32'h0BAD_E700;
        id_can_exc                 <= 1;
        ex_can_exc                 <= 1;
        mem_can_exc                <= 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        reg_ra                     <= 0;
        reg_wa                     <= 0;
        reg_data_i                 <= 0;
        reg_we                     <= 0;
        id_stall                   <= 0;
        exc_if_invalid_address     <= 0;
        exc_op_reset               <= 0;
        exc_op_shutdown            <= 0;
        exc_op_syscall             <= 0;
        exc_op_break               <= 0;
        exc_op_invalid             <= 0;
        exc_branch_invalid_address <= 0;
        exc_div_zero               <= 0;
        exc_mem_invalid_address    <= 0;
        op_rfe                     <= 0;
        op_rfb                     <= 0;
        io_interrupt               <= 0;
        if_bad_address             <= 0;
        id_exc_pc                  <= 0;
        ex_exc_pc                  <= 0;
        mem_exc_pc                 <= 0;
        mem_bad_address            <= 0;
        id_can_exc                 <= 0;
        ex_can_exc                 <= 0;
        mem_can_exc                <= 0;
        //--------------------------------------------------------------------------
        @(posedge clk)
        //--------------------------------------------------------------------------
        $display("Testing the Exception Unit: finished");
        $finish;
    end
endmodule
