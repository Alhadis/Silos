/*
 ******************************************************************************
 *  File Name   :   tb_ada_exu.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 17th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Testbench for the EXU (execution unit)
 ******************************************************************************
 */
`timescale 1ns / 1ns

`include "ada_defines.v"
`define cycle   10

module tb_ada_exu;
    // inputs
    reg             clk;
    reg             rst;
    reg     [31:0]  port_a;
    reg     [31:0]  port_b;
    reg     [4:0]   operation;
    reg             ex_stall;
    reg             ex_flush;
    //outputs
    wire    [31:0]  result;
    wire            exc_div_zero;
    wire            haz_ex_stall;

    //--------------------------------------------------------------------------
    // UUT
    //--------------------------------------------------------------------------
    ada_exu uut(
        .clk(clk),
        .rst(rst),
        .port_a(port_a),
        .port_b(port_b),
        .operation(operation),
        .ex_stall(ex_stall),
        .ex_flush(ex_flush),
        .result(result),
        .exc_div_zero(exc_div_zero),
        .haz_ex_stall(haz_ex_stall)
        );

    //--------------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------------
    initial begin
        // Initialize Inputs
        clk       = 1;
        rst       = 1;
        port_a    = 0;
        port_b    = 0;
        operation = 0;
        ex_stall  = 0;
        ex_flush  = 0;
        // dump the wave file
        $dumpfile("tb_exu.vcd");
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
        @(posedge clk)
        operation <= 5'b11111;
        // the interesting part
        @(posedge clk)
        operation <= `ALU_OP_MULS;
        port_a <= 32'h8000_0000;
        port_b <= 32'h0400_0000;
        @(posedge clk)
        operation <= `ALU_OP_MULU;
        port_a <= 32'd200;
        port_b <= 32'd400;
        @(posedge clk)
        operation <= `ALU_OP_DIVS;
        port_a <= 32'd2000;
        port_b <= 32'd20;
        @(posedge clk) operation <= `ALU_OP_ADD;
        @(posedge clk) operation <= `ALU_OP_MULS;
        ex_stall <= 1;
        @(posedge clk) operation <= `ALU_OP_MULU;
        ex_stall <= 1;
        @(posedge clk) operation <= `ALU_OP_ADD;
        #(35*`cycle);
        @(posedge clk) operation <= `ALU_OP_MFH;
        ex_stall <= 0;
        @(posedge clk) operation <= `ALU_OP_MFL;
        ex_stall <= 0;
        port_a <= -32'd2000;
        port_b <= 32'd25;
        @(posedge clk) operation <= `ALU_OP_DIVS;
        @(posedge clk) operation <= 5'b11111;
        #(35*`cycle);
        @(posedge clk) operation <= `ALU_OP_MFH;
        @(posedge clk) operation <= `ALU_OP_MFL;
        @(posedge clk) operation <= 5'b11111;
        @(posedge clk) operation <= `ALU_OP_MTH;
        port_a <= 32'hDEAD_BEEF;
        @(posedge clk) operation <= `ALU_OP_MTL;
        port_a <= 32'h0BAD_F00D;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        $finish;
    end
endmodule
