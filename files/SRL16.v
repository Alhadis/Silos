// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/SRL16.v,v 1.7.158.1 2007/03/09 18:13:19 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /\
// /___/  \  /  \   Vendor : Xilinx
// \   \   \/   /   Version : 8.1i (I.13)
//  \   \      /    Description : Xilinx Functional Simulation Library Component     |
//  /   /      \            16-Bit Shift Register Look-Up-Table
// /___/   /\   \   Filename : SRL16.v
// \   \  /  \  /   Timestamp : Thu Mar 25 16:43:40 PST 2004
//  \___\/\___\/
//
// Revision:
//    03/23/04 - Initial version.
// End Revision

//`timescale  1 ps / 1 ps    // what is it?


module SRL16 (Q, A0, A1, A2, A3, CLK, D);

    parameter INIT = 16'h0000;

    output Q;

    input  A0, A1, A2, A3, CLK, D;

    reg  [15:0] data;


    assign Q = data[{A3, A2, A1, A0}];

    initial
    begin
          assign  data = INIT;
          while (CLK === 1'b1 || CLK===1'bX) 
            #10; 
          deassign data;
    end


    always @(posedge CLK)
    begin
	{data[15:0]} <= #100 {data[14:0], D};
    end


endmodule

