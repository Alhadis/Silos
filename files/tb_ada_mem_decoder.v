/*
 ******************************************************************************
 *  File Name   :   tb_ada_mem_decoder.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Sept 1st, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (c) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Testbench for the MEM decoder
 ******************************************************************************
 */
`timescale 1ns / 1ns

`include "ada_defines.v"
`define cycle   10

module tb_ada_mem_decoder;
    reg             clk;
    reg             rst;
    reg     [31:0]  imem_address;
    wire    [31:0]  imem_data;              // Instruction data

    // MEM interface
    reg     [31:0]  dmem_address;           // Data address
    reg     [31:0]  dmem_data_i;            // Data to memory
    reg             data_word;              // word access
    reg             data_halfword;          // halfword access
    reg             data_byte;              // byte access
    reg             dmem_read;              // read data memory
    reg             dmem_write;             // write data memory
    reg             data_sign_extend;       // read data (byte/half) with sign extended
    wire    [31:0]  dmem_data_o;            // data from memory

    // I/O
    reg     [31:0]  io_data_i;              // data from device
    reg             io_ready;               // device is ready
    wire    [31:0]  io_address;             // device address
    wire    [31:0]  io_data_o;              // data to device
    wire            io_we;                  // write to device
    wire            io_enable;              // enable operation

    // Internal IM
    reg     [31:0]  iimem_data_i;           // data from memory
    wire    [31:0]  iimem_address;          // instruction address
    wire            iimem_we;               // write enable

    // Internal DM
    reg     [31:0]  dimem_data_i;           // data from memory
    wire    [31:0]  dimem_address;          // instruction address
    wire    [31:0]  dimem_data_o;           // data to memory
    wire            dimem_we;               // write enable

    // External Instruction Memory/Instruction Cache
    reg     [31:0]  eimem_cache_data_i;     // Data from memory
    reg             eimem_cache_ready;      // memory is ready
    wire    [31:0]  eimem_cache_address;    // data address
    wire            eimem_cache_wr;         // write = 1, read = 0,
    wire            eimem_cache_enable;    // enable operation

    // External Data Memory/Data Cache
    reg     [31:0]  edmem_cache_data_i;     // Data from memory
    reg             edmem_cache_ready;      // memory is ready
    wire    [31:0]  edmem_cache_address;    // data address
    wire    [31:0]  edmem_cache_data_o;     // data to memory
    wire            edmem_cache_wr;         // write = 1, read = 0,
    wire            edmem_cache_enable;     // enable operation

    // pipeline
    reg             if_kernel_mode;         // privilege access in IF stage
    reg             mem_kernel_mode;        // privilege access in MEM stage
    reg             if_stall;               // Stop transactions if IF is stalled
    reg             if_flush;              // abort IF
    wire            exc_bad_if_address;     // panic
    wire            exc_bad_mem_address;    // panic
    wire            if_stall_md;            // long operation
    wire            mem_stall_md;            // long operation


    //--------------------------------------------------------------------------
    // UUT
    //--------------------------------------------------------------------------
    ada_mem_decoder uut(
        .clk(clk),
        .rst(rst),

        // IF interface
        .imem_address(imem_address),           // Instruction address
        .imem_data(imem_data),     // Instruction data

        // MEM interface
        .dmem_address(dmem_address),                  // Data address
        .dmem_data_i(dmem_data_i),               // Data to memory
        .data_word(data_word), // word access
        .data_halfword(data_halfword),               // halfword access
        .data_byte(data_byte),                       // byte access
        .dmem_read(dmem_read),                       // read data memory
        .dmem_write(dmem_write),                     // write data memory
        .data_sign_extend(data_sign_extend),            // read data (byte/half) with sign extended
        .dmem_data_o(dmem_data_o),                      // data from memory

        // I/O
        .io_data_i(io_data_i),                          // data from device
        .io_ready(io_ready),                            // device is ready
        .io_address(io_address),                        // device address
        .io_data_o(io_data_o),                          // data to device
        .io_we(io_we),                                  // write to device
        .io_enable(io_enable),                          // enable operation

        // Internal IM
        .iimem_data_i(iimem_data_i),            // data from memory
        .iimem_address(iimem_address),          // instruction address
        .iimem_we(iimem_we),                    // write enable

        // Internal DM
        .dimem_data_i(dimem_data_i),            // data from memory
        .dimem_address(dimem_address),          // instruction address
        .dimem_data_o(dimem_data_o),            // data to memory
        .dimem_we(dimem_we),                    // write enable

        // External Instruction Memory/Instruction Cache
        .eimem_cache_data_i(eimem_cache_data_i),        // Data from memory
        .eimem_cache_ready(eimem_cache_ready),          // memory is ready
        .eimem_cache_address(eimem_cache_address),      // data address
        .eimem_cache_wr(eimem_cache_wr),                // write = 1, read = 0,
        .eimem_cache_enable(eimem_cache_enable),        // enable operation

        // External Data Memory/Data Cache
        .edmem_cache_data_i(edmem_cache_data_i),        // Data from memory
        .edmem_cache_ready(edmem_cache_ready),          // memory is ready
        .edmem_cache_address(edmem_cache_address),      // data address
        .edmem_cache_data_o(edmem_cache_data_o),        // data to memory
        .edmem_cache_wr(edmem_cache_wr),                // write = 1, read = 0,
        .edmem_cache_enable(edmem_cache_enable),        // enable operation

        // pipeline
        .if_kernel_mode(if_kernel_mode),                // privilege access in IF stage
        .mem_kernel_mode(mem_kernel_mode),              // privilege access in MEM stage
        .if_stall(if_stall),                            // Stop transactions if IF is stalled
        .if_flush(if_flush),                            // abort IF
        .exc_bad_if_address(exc_bad_if_address),        // panic
        .exc_bad_mem_address(exc_bad_mem_address),      // panic
        .if_stall_md(if_stall_md),                      // long operation
        .mem_stall_md(mem_stall_md)                     // long operation
        );

    //--------------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------------
    initial begin
        // Initialize regs
        clk                = 1;
        rst                = 1;
        imem_address       = 32'hAEAD_F00C;
        dmem_address       = 32'hAEAD_C0DC;
        dmem_data_i        = 32'hDEAD_BEEF;
        data_word          = 0;
        data_halfword      = 0;
        data_byte          = 0;
        dmem_read          = 0;
        dmem_write         = 0;
        data_sign_extend   = 0;
        io_data_i          = 0;
        io_ready           = 0;
        iimem_data_i       = 32'h0BAD_F00D;
        dimem_data_i       = 32'h0BAD_B00B;
        eimem_cache_data_i = 0;
        eimem_cache_ready  = 0;
        edmem_cache_data_i = 0;
        edmem_cache_ready  = 0;
        if_kernel_mode     = 1;
        mem_kernel_mode    = 1;
        if_stall           = 0;
        if_flush           = 0;

        // dump the wave file
        $dumpfile("tb_mem_decoder.vcd");
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
        rst <= #(4.5*`cycle)0;
        $display("Testing the Memory decoder Unit: begin");
        //--------------------------------------------------------------------------
        #(10*`cycle)
        @(posedge clk)
        if_stall         <= 0;
        if_flush         <= 0;
        data_word        <= 0;
        data_halfword    <= 1;
        data_byte        <= 0;
        data_sign_extend <= 0;
        dmem_read        <= 0;
        dmem_write       <= 1;
        //--------------------------------------------------------------------------
        #(10*`cycle)
        @(posedge clk)
        if_stall <= 0;
        if_flush <= 0;
        data_word <= 0;
        dmem_read <= 0;
        //--------------------------------------------------------------------------
        #(10*`cycle)
        @(posedge clk)
        imem_address       = 32'h8EAD_F00C;
        dmem_address       = 32'h8EAD_C0DC;
        //--------------------------------------------------------------------------
        @(posedge clk)
        imem_address       = 32'hEEAD_F00C;
        dmem_address       = 32'hEEAD_C0DC;
        //--------------------------------------------------------------------------
        @(posedge clk)
        imem_address       = 32'h4EAD_F00C;
        dmem_address       = 32'h4EAD_C0DC;
        //--------------------------------------------------------------------------
        @(posedge clk)
        //--------------------------------------------------------------------------
        @(posedge clk)
        //--------------------------------------------------------------------------
        $display("Testing the Memory decoder Unit: finished");
        $finish;
    end
endmodule
