/*
 ******************************************************************************
 *  File Name   :   tb_ada_hazard.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 30th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Testbench for the Hazard unit
 ******************************************************************************
 */
`timescale 1ns / 1ns

`include "ada_defines.v"
`define cycle   10

module tb_ada_hazard;
    reg             clk;
    reg             rst;
    reg     [4:0]   id_gpr_port_a;
    reg     [4:0]   id_gpr_port_b;
    reg     [4:0]   ex_gpr_wa;
    reg     [4:0]   mem_gpr_wa;
    reg     [4:0]   wb_gpr_wa;
    reg             ex_gpr_we;
    reg             mem_gpr_we;
    reg             wb_gpr_we;
    reg             if_mem_request_stall;
    reg             ex_data_read;
    reg             mem_request_stall;
    reg             if_exception_stall;
    reg             id_exception_stall;
    reg             ex_exception_stall;
    reg             mem_exception_stall;
    reg             ex_exu_stall;
    wire    [1:0]   forward_port_a_select;
    wire    [1:0]   forward_port_b_select;
    wire            if_stall;
    wire            id_stall;
    wire            ex_stall;
    wire            mem_stall;
    wire            wb_stall;


    //--------------------------------------------------------------------------
    // UUT
    //--------------------------------------------------------------------------
    ada_hazard uut(
        .id_gpr_port_a(id_gpr_port_a),
        .id_gpr_port_b(id_gpr_port_b),
        .ex_gpr_wa(ex_gpr_wa),
        .mem_gpr_wa(mem_gpr_wa),
        .wb_gpr_wa(wb_gpr_wa),
        .ex_gpr_we(ex_gpr_we),
        .mem_gpr_we(mem_gpr_we),
        .wb_gpr_we(wb_gpr_we),
        .if_mem_request_stall(if_mem_request_stall),
        .ex_data_read(ex_data_read),
        .mem_request_stall(mem_request_stall),
        .if_exception_stall(if_exception_stall),
        .id_exception_stall(id_exception_stall),
        .ex_exception_stall(ex_exception_stall),
        .mem_exception_stall(mem_exception_stall),
        .ex_exu_stall(ex_exu_stall),
        .forward_port_a_select(forward_port_a_select),
        .forward_port_b_select(forward_port_b_select),
        .if_stall(if_stall),
        .id_stall(id_stall),
        .ex_stall(ex_stall),
        .mem_stall(mem_stall),
        .wb_stall(wb_stall)
        );

    //--------------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------------
    initial begin
        // Initialize Inputs
        clk                  = 1;
        rst                  = 1;
        id_gpr_port_a        = 5'b0;
        id_gpr_port_b        = 5'b0;
        ex_gpr_wa            = 5'b0;
        mem_gpr_wa           = 5'b0;
        wb_gpr_wa            = 5'b0;
        ex_gpr_we            = 0;
        mem_gpr_we           = 0;
        wb_gpr_we            = 0;
        if_mem_request_stall = 0;
        ex_data_read         = 0;
        mem_request_stall    = 0;
        if_exception_stall   = 0;
        id_exception_stall   = 0;
        ex_exception_stall   = 0;
        mem_exception_stall  = 0;
        ex_exu_stall         = 0;
        // dump the wave file
        $dumpfile("tb_hazard.vcd");
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
        $display("Testing the Hazard Unit: begin");
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b0;
        id_gpr_port_b        = 5'b0;
        ex_gpr_wa            = 5'b0;
        mem_gpr_wa           = 5'b0;
        wb_gpr_wa            = 5'b0;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00010;
        id_gpr_port_b        = 5'b00001;
        ex_gpr_wa            = 5'b00100;
        mem_gpr_wa           = 5'b01000;
        wb_gpr_wa            = 5'b10000;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00010;
        id_gpr_port_b        = 5'b00001;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 0;
        mem_gpr_we           = 0;
        wb_gpr_we            = 0;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 0;
        mem_gpr_we           = 0;
        wb_gpr_we            = 0;
        ex_data_read         = 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        ex_data_read         = 1;
        //--------------------------------------------------------------------------ç
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        if_mem_request_stall = 0;
        ex_data_read         = 1; //
        mem_request_stall    = 1;
        if_exception_stall   = 0;
        id_exception_stall   = 0;
        ex_exception_stall   = 0;
        mem_exception_stall  = 0;
        ex_exu_stall         = 0;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        if_mem_request_stall = 0;
        ex_data_read         = 0;
        mem_request_stall    = 0;
        if_exception_stall   = 0;
        id_exception_stall   = 0;
        ex_exception_stall   = 0;
        mem_exception_stall  = 0;
        ex_exu_stall         = 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        if_mem_request_stall = 0;
        ex_data_read         = 0;
        mem_request_stall    = 1;
        if_exception_stall   = 0;
        id_exception_stall   = 0;
        ex_exception_stall   = 0;
        mem_exception_stall  = 0;
        ex_exu_stall         = 1;
        //--------------------------------------------------------------------------
        @(posedge clk)
        id_gpr_port_a        = 5'b00011;
        id_gpr_port_b        = 5'b00010;
        ex_gpr_wa            = 5'b00010;
        mem_gpr_wa           = 5'b00010;
        wb_gpr_wa            = 5'b00010;
        ex_gpr_we            = 1;
        mem_gpr_we           = 1;
        wb_gpr_we            = 1;
        if_mem_request_stall = 1;
        ex_data_read         = 0;
        mem_request_stall    = 1;
        if_exception_stall   = 0;
        id_exception_stall   = 0;
        ex_exception_stall   = 0;
        mem_exception_stall  = 0;
        ex_exu_stall         = 0;
        //--------------------------------------------------------------------------
        @(posedge clk)
        //--------------------------------------------------------------------------
        $display("Testing the Hazard Unit: finished");
        $finish;
    end
endmodule
