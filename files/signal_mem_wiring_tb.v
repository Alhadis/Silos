`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HKUST
// Engineer: Charles JIANG
// 
// Create Date: 
// Design Name: 
// Module Name: 
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
`include "define.vh"

module param_calc_testbench;

localparam CLK_PERIOD   = 10.0;
localparam RST_TIME     = CLK_PERIOD * 3;

// signal lists ------------------------------------------------------------------
reg clk, rst_n;

// instantiation -----------------------------------------------------------------

// clock and reset ---------------------------------------------------------------
initial begin
  clk = 0;
  forever #(CLK_PERIOD/2.0) clk = ~clk;
end

initial begin 
    rst_n = 0;
    #RST_TIME rst_n = 1;
    
    
end


endmodule
