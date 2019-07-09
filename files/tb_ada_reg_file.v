/*
 ******************************************************************************
 *  File Name   :   tb_ada_reg_file.v
 *  Project     :   NR1K processor
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

module tb_ada_reg_file;
    //Inputs
    reg             clk;
    reg             rst;
    reg     [4:0]   read_addr_a;
    reg     [4:0]   read_addr_b;
    reg     [4:0]   write_addr;
    reg     [31:0]  write_data;
    reg             we;
    // outputs
    wire    [31:0]  read_data_a;
    wire    [31:0]  read_data_b;

    //--------------------------------------------------------------------------
    // UUT
    //--------------------------------------------------------------------------
    ada_reg_file uut(
        .clk(clk),
        .read_addr_a(read_addr_a),
        .read_addr_b(read_addr_b),
        .write_addr(write_addr),
        .write_data(write_data),
        .we(we),
        .read_data_a(read_data_a),
        .read_data_b(read_data_b)
    );

    //--------------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------------
    initial begin
        // Initialize Inputs
        clk         = 1;
        rst         = 1;
        read_addr_a = 0;
        read_addr_b = 0;
        write_addr  = 0;
        write_data  = 0;
        we          = 0;

        // dump the wave file
        $dumpfile("tb_reg_file.vcd");
        $dumpvars;
    end

    //--------------------------------------------------------------------------
    // Clock
    //--------------------------------------------------------------------------
    always begin
        #(`cycle/2) clk = !clk;
    end

    //--------------------------------------------------------------------------
    // simulation
    //--------------------------------------------------------------------------
    integer i = 0;
    reg [31:0] temp [1:31];
    initial begin
        rst = #(5*`cycle)0;
        $display("----------------------------------------------------------");
        $display("time\tTemp\t\tWA\tWD");
        $display("----------------------------------------------------------");
        // fill the register file
        for(i = 1; i < 32; i = i + 1) begin
            @(negedge clk)
            temp[i]    = $random;
            write_addr = i;
            write_data = temp[i];
            we         = 1;
            @(negedge clk)
            we         = 0;

            $display("%4d\t%h\t%h\t%h", $time, temp[i], write_addr, write_data);
        end

        @(negedge clk)
        we         = 0;
        write_addr = 0;
        write_data = 0;
        // pause
        #(`cycle);

        //Read the register file. Port 1
        $display("----------------------------------------------------------");
        $display("Test Port 1");
        for(i = 0; i < 32; i = i + 1) begin
            @(posedge clk)
            read_addr_a = i;
            #5;
            if (i == 5'd0 && read_data_a != 32'd0) begin
                $display("Error: Register 0 MUST READ ZERO");
            end
            else if (i != 5'd0 && read_data_a != temp[i]) begin
                $display("Error Port 1: Register [%3d] must read %d. Read %d instead.", i, temp[i], read_data_a);
            end
        end

        //Read the register file. Port 2
        $display("----------------------------------------------------------");
        $display("Test Port 2");
        for(i = 0; i < 32; i = i + 1) begin
            @(posedge clk)
            read_addr_b = i;
            #5;
            if (i == 5'd0 && read_data_b != 32'd0) begin
                $display("Error: Register 0 MUST READ ZERO\n");
            end
            else if (i != 5'd0 && read_data_b != temp[i]) begin
                $display("Error Port 2: Register [%3d] must read %d. Read %d instead.", i, temp[i], read_data_b);
            end
        end
        $display("----------------------------------------------------------");
        $finish;
    end

endmodule
