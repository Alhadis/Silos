`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2019 01:29:10 AM
// Design Name: 
// Module Name: rdp
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

module rdp	#(
  parameter DATA_WIDTH = 8,
  parameter ADDRS_WIDTH = 4
)(
  input clkA,
  input clkB,
  input [DATA_WIDTH-1:0] dataA,
  input [ADDRS_WIDTH-1:0] addrsA, addrsB,
  input wrnA,
  input rdnB,
  output reg [DATA_WIDTH-1:0] dataB
);
  
  localparam RAM_DEPTH = (1 << ADDRS_WIDTH)-1;
  
  reg [DATA_WIDTH-1:0] r_2p [RAM_DEPTH:0];
  
  always @(posedge clkA) begin
    if(wrnA) begin
      r_2p[addrsA]	<= dataA;
    end
  end
  
  always @(posedge clkB) begin
    if(rdnB) begin
      dataB	<= r_2p[addrsB];
    end
  end
  
endmodule