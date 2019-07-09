`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 19:43:18
// Design Name: 
// Module Name: fib_sim
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


module fib_sim(

    );
    
    reg [7:0] f0,f1;
    reg rst,clk;
    wire [7:0] fn;
    
    FIB #(8) DUT(f0,f1,rst,clk,fn);
    
    initial
    begin
        clk=0;
        f0=0;
        f1=1;
        rst=1;
        #10 rst=0;
    end
    
    always  #5 clk=~clk;
endmodule
