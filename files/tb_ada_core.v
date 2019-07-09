/*
 ******************************************************************************
 *  File Name   :   tb_ada_core.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Sept 2nd, 2014
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

module tb_ada_core;
    reg             clk;
    reg             rst;
    reg     [31:0]  io_interrupt;           //
    reg     [31:0]  io_data_i;              // data from device
    reg             io_ready;               // device is ready
    reg     [31:0]  eimem_cache_data_i;     // Data from memory
    reg             eimem_cache_ready;      // memory is ready
    reg     [31:0]  edmem_cache_data_i;     // Data from memory
    reg             edmem_cache_ready;      // memory is ready

    wire    [31:0]  io_address;             // device address
    wire    [31:0]  io_data_o;              // data to device
    wire            io_we;                  // write to device
    wire            io_enable;              // enable operation
    wire    [31:0]  eimem_cache_address;    // data address
    wire            eimem_cache_wr;         // write = 1, read = 0,
    wire            eimem_cache_enable;     // enable operation
    wire    [31:0]  edmem_cache_address;    // data address
    wire    [31:0]  edmem_cache_data_o;     // data to memory
    wire            edmem_cache_wr;         // write = 1, read = 0,
    wire            edmem_cache_enable;      // enable operation
    wire            icache_flush;
    wire            dcache_flush;

    //--------------------------------------------------------------------------
    // UUT
    //--------------------------------------------------------------------------
    ada_core uut(
        .clk(clk),
        .rst(rst),
        .io_interrupt(io_interrupt),
        .io_data_i(io_data_i),
        .io_ready(io_ready),
        .io_address(io_address),
        .io_data_o(io_data_o),
        .io_we(io_we),
        .io_enable(io_enable),
        .eimem_cache_data_i(eimem_cache_data_i),
        .eimem_cache_ready(eimem_cache_ready),
        .eimem_cache_address(eimem_cache_address),
        .eimem_cache_wr(eimem_cache_wr),
        .eimem_cache_enable(eimem_cache_enable),
        .edmem_cache_data_i(edmem_cache_data_i),
        .edmem_cache_ready(edmem_cache_ready),
        .edmem_cache_address(edmem_cache_address),
        .edmem_cache_data_o(edmem_cache_data_o),
        .edmem_cache_wr(edmem_cache_wr),
        .edmem_cache_enable(edmem_cache_enable),
        .icache_flush(icache_flush),
        .dcache_flush(dcache_flush)
        );

    //--------------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------------
    initial begin
        // Initialize regs
        clk                <= 1;
        rst                <= 1;
        io_interrupt       <= 0;
        io_data_i          <= 0;
        io_ready           <= 0;
        eimem_cache_data_i <= 0;
        eimem_cache_ready  <= 0;
        edmem_cache_data_i <= 0;
        edmem_cache_ready  <= 0;
        // dump the wave file
        $dumpfile("tb_core.vcd");
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
        $display("Testing the ADA Core: begin");
        //--------------------------------------------------------------------------
        rst = #(10*`cycle)0;
        @(posedge clk)
        //--------------------------------------------------------------------------
        @(posedge clk)
        //--------------------------------------------------------------------------
        $display("Testing the ADA Core: finished");
        $finish;
    end
endmodule
