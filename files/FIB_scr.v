`timescale 1ns / 1ps
`include "ALU_Header.v"

module FIB
#(parameter MSB=63)
(
    input [MSB:0] f0,
    input [MSB:0] f1,
    input  rst,
    input clk,
    output [MSB:0] fn
    );
    
    wire [MSB:0] in1,in2,out1,out2,aluout,sum;
    
    Register #(MSB)   Reg1(.in(in1),.en(1'b1),.rst(1'b0),.clk(clk),.out(out1));
    
    Register #(MSB)   Reg2(.in(in2),.en(1'b1),.rst(1'b0),.clk(clk),.out(out2));
    
    ALU      #(MSB)   mALU(.a(out1),.b(out2),.s(`ALU_Add),.y(aluout));
    
    assign in1 = rst ? f0[MSB:0]  : out2;
    assign in2 = rst ? f1[MSB:0]  : sum;
    assign sum = clk ? sum : aluout;
    assign fn  = out2;
endmodule
