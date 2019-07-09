`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ABS Enterprises
// Engineer: Noah Boot
// 
// Create Date: 02/10/2019 09:17:29 PM
// Design Name: 
// Module Name: 9-Bit Adder and Subtractor
// Project Name: 9-Bit Processor
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


module AdderModule(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
    
    //assign B = B ^ Cin;
    assign S = Cin ^ (A ^ B);
    assign Cout = ((A^B) & Cin) | (A&B);

endmodule

module Adder(
    input wire [8:0]A,
    input wire [8:0]B,
    input wire Cin,
    output wire [8:0]S
    );
    
    wire [8:0] C;
    
    AdderModule Add0(A[0], B[0], Cin, S[0], C[0]);
    AdderModule Add1(A[1], B[1], C[0],S[1], C[1]);
    AdderModule Add2(A[2], B[2], C[1], S[2], C[2]);
    AdderModule Add3(A[3], B[3], C[2], S[3], C[3]);
    AdderModule Add4(A[4], B[4], C[3], S[4], C[4]);
    AdderModule Add5(A[5], B[5], C[4], S[5], C[5]);
    AdderModule Add6(A[6], B[6], C[5], S[6], C[6]);
    AdderModule Add7(A[7], B[7], C[6], S[7], C[7]);
    AdderModule Add8(A[8], B[8], C[7], S[8], C[8]);
 
    
endmodule



/////////////////////////////////////////////////
////////////////////////////////////////////////
