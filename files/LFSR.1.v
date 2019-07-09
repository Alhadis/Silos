`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:19 10/21/2014 
// Design Name: 
// Module Name:    LFSR 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LFSR(
  input  clk,
  input  rst_n,
  output reg [8:0] data
);


wire feedback = data[8] ^ data[3] ;

always @(posedge clk)
  if (rst_n) 
    data <= 9'hf + data;
  else
    data <= {data[7:0], feedback} ;

	
  
endmodule // End Of Module counter