/*
 *******************************************************************************
 *  File Name   :   ada_bram.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Sept 1st, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (c) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Block RAM used for the Internal Memory
 *******************************************************************************
 */

 module ada_bram #(
    parameter DATA = 32,
    parameter ADDR = 8
    )(
    // Port A
    input                   a_clk,
    input                   a_wr,
    input       [ADDR-1:0]  a_addr,
    input       [DATA-1:0]  a_din,
    output  reg [DATA-1:0]  a_dout,
    // Port B
    input                   b_clk,
    input                   b_wr,
    input       [ADDR-1:0]  b_addr,
    input       [DATA-1:0]  b_din,
    output  reg [DATA-1:0]  b_dout
    );

    //--------------------------------------------------------------------------
    // Shared memory
    //--------------------------------------------------------------------------
    reg [DATA-1:0] mem [(2**ADDR)-1:0];

    // initiate the memory to zeros. For testing.
    // TODO: Add interface to modify this memory using a debug interface
    integer i;
    initial begin
        for (i=0; i < 256; i=i+1)
            mem[i] = 32'b0;
    end

    //--------------------------------------------------------------------------
    // Port A
    //--------------------------------------------------------------------------
    always @(posedge a_clk) begin
        a_dout      <= mem[a_addr];
        if(a_wr) begin
            a_dout      <= a_din;
            mem[a_addr] <= a_din;
        end
    end

    //--------------------------------------------------------------------------
    // Port B
    //--------------------------------------------------------------------------
    always @(posedge b_clk) begin
        b_dout      <= mem[b_addr];
        if(b_wr) begin
            b_dout      <= b_din;
            mem[b_addr] <= b_din;
        end
    end
endmodule
