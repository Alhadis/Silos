`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2018 14:49:17
// Design Name: 
// Module Name: datapath_module
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


module datapath_module(
    input Clock, Reset,
    input IRload, JMPmux, PCload, Meminst, MemWr,
    input [1:0] Asel,
    input Aload, Sub,
    output [2:0] IR75,
    output Apos, Aeq0,
    input [7:0] Input,
    output [7:0] Output
    );
    
wire [7:0] dp_IR, dp_RAMQ;
wire [4:0] dp_JMPmux, dp_PC, dp_increment, dp_meminst;
wire [7:0] dp_Amux, dp_addsub, dp_A;

Register_module #(8) U0_IR(
    .Clock(Clock),
    .Clear(Reset),
    .Write(IRload),
    .D(dp_RAMQ),
    .Q(dp_IR)
    );

Mux21_module #(5) U1_JMPmux(
    .S(JMPmux),
    .D1(dp_IR[4:0]),
    .D0(dp_increment),
    .Y(dp_JMPmux)
    );

Register_module #(5) U2_PC(
    .Clock(Clock),
    .Clear(Reset),
    .Write(IRload),
    .D(dp_RAMQ),
    .Q(dp_IR)    
    );

Mux21_module #(5) U3_meminst(
    .S(Meminst),
    .D1(dp_IR[4:0]),
    .D0(dp_PC),
    .Y(dp_meminst)
    );

Increment_module U4_inc(
    .A(dp_PC),
    .F(dp_increment)
    );

ram_module U5_ram(
    .Clock(Clock),
    .Reset(Reset),
    .WE(MemWr),
    .Address(dp_meminst),
    .D(dp_A),
    .Q(dp_RAMQ)
    );

Mux41_module #(8) U6_Amux(
    .S(Asel),
    .D3(8'b00000000),
    .D2(dp_RAMQ),
    .D1(Input),
    .D0(dp_addsub),
    .Y(dp_Amux)
    );

Register_module #(8) U7_A(
    .Clock(Clock),
    .Clear(Reset),
    .Write(IRload),
    .D(dp_RAMQ),
    .Q(dp_IR)  
    );

Addsub_module #(8) U8_addsub(
    .S(Sub),
    .A(dp_A),
    .B(dp_RAMQ),
    .F(dp_addsub)
    );

assign IR75 = dp_IR[7:5];
assign Aeq0 = (dp_A == 0)? 1:0;
assign Apos = ~dp_A[7];
assign Output = dp_A;

endmodule
