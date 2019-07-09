`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2019 22:58:29
// Design Name: 
// Module Name: adder_module
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



module adder_module(
    input [15:0]a, [15:0]b,
    output [16:0]sum, cout)
    ;
    wire [15:0]cout_aux;
//    integer i;
//    always @*
    
//    for(i = 0; i < 16; i = i +1)
//    begin 
    
    single_adder module_0(.a(a[0]),.b(b[0]), .cin(1'b0), .s(sum[0]), .cout(cout_aux[0]));   
    single_adder module_1(.a(a[1]),.b(b[1]), .cin(cout_aux[0]), .s(sum[1]), .cout(cout_aux[1]));
    single_adder module_2(.a(a[2]),.b(b[2]), .cin(cout_aux[1]), .s(sum[2]), .cout(cout_aux[2]));
    single_adder module_3(.a(a[3]),.b(b[3]), .cin(cout_aux[2]), .s(sum[3]), .cout(cout_aux[3]));
    single_adder module_4(.a(a[4]),.b(b[4]), .cin(cout_aux[3]), .s(sum[4]), .cout(cout_aux[4]));
    single_adder module_5(.a(a[5]),.b(b[5]), .cin(cout_aux[4]), .s(sum[5]), .cout(cout_aux[5]));
    single_adder module_6(.a(a[6]),.b(b[6]), .cin(cout_aux[5]), .s(sum[6]), .cout(cout_aux[6]));
    single_adder module_7(.a(a[7]),.b(b[7]), .cin(cout_aux[6]), .s(sum[7]), .cout(cout_aux[7]));
    single_adder module_8(.a(a[8]),.b(b[8]), .cin(cout_aux[7]), .s(sum[8]), .cout(cout_aux[8]));
    single_adder module_9(.a(a[9]),.b(b[9]), .cin(cout_aux[8]), .s(sum[9]), .cout(cout_aux[9]));
    single_adder module_10(.a(a[10]),.b(b[10]), .cin(cout_aux[9]), .s(sum[10]), .cout(cout_aux[10]));
    single_adder module_11(.a(a[11]),.b(b[11]), .cin(cout_aux[10]), .s(sum[11]), .cout(cout_aux[11]));
    single_adder module_12(.a(a[12]),.b(b[12]), .cin(cout_aux[11]), .s(sum[12]), .cout(cout_aux[12]));
    single_adder module_13(.a(a[13]),.b(b[13]), .cin(cout_aux[12]), .s(sum[13]), .cout(cout_aux[13]));
    single_adder module_14(.a(a[14]),.b(b[14]), .cin(cout_aux[13]), .s(sum[14]), .cout(cout_aux[14]));
    single_adder module_15(.a(a[15]),.b(b[15]), .cin(cout_aux[14]), .s(sum[15]), .cout(cout_aux[15]));
    assign sum[16] = cout_aux[15];
        
    
    
   
//    end

    
endmodule


module single_adder(
        input a, b, cin,
        output s, cout
            );
            
    wire aux1, aux2, aux3;
    
    
    xor xor1(aux1, a, b);
    
    xor xor2(s, aux1, cin);
    
    //carry block
    
    
    and and1(aux2, aux1, cin);
    and and2(aux3, a, b);
    or or1(cout, aux2, aux3);
    
    
endmodule
