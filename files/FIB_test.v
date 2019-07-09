`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 22:00:59
// Design Name: 
// Module Name: FIB_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIB_test();
    reg [5:0] f0;
    reg [5:0] f1;
    reg rst;
    reg en;
    reg clk;
    wire [5:0]fn;
    FIB ALU1 (
        .en(en),
        .f0(f0),
        .f1(f1),
        .rst(rst),
        .clk(clk),
        .fn(fn)
    );
    initial f0=6'b000001;
    initial f1=6'b000001;
    initial clk=0;
    initial rst=0;
    initial 
    begin
    en=1;
    #100 en=0;
    #1500 en=1;
    #100 en=0;
    end
    always #50 clk=~clk;
    initial begin
    #600 rst=1;
    #600 rst=0;
    end
    
endmodule
