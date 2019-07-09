`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2018 23:13:10
// Design Name: 
// Module Name: top
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


module top(
    input   clk,
    input   rst_n,
    input   wire    [511:0]     data_a,
    input   wire    [511:0]     data_b,
    
    output  wire    [511:0]     data_out
    );
    
wire    [15:0]      data_a_w      [31:0];
wire    [15:0]      data_b_w      [31:0];
wire    [15:0]      data_out_w    [31:0];

for(genvar i=0;i<32;i=i+1) begin: assign_data
    assign data_a_w[i] =  data_a[16*(i+1)-1:16*i];
    assign data_b_w[i] =  data_b[16*(i+1)-1:16*i];
end

for(genvar i=0;i<32;i=i+1) begin: assign_data_out
    assign data_out[16*(i+1)-1:16*i] = data_out_w[i];
end

for(genvar i=0;i<32;i=i+1) begin: dut
    mult_gen_0 simd_mult(
        .CLK        (clk),
        .A          (data_a_w[i]),
        .B          (data_b_w[i]),
        .P          (data_out_w[i])
    );
end    

endmodule
