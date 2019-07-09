`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2019 08:48:43 PM
// Design Name: 
// Module Name: MAC_tb
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


//`define HIGH_ACC
`define LOW_LAT

module MAC_tb #(
  parameter DATA_WIDTH = 8
);
  
  reg clk;
  reg rst;
  reg begin_ops = 0;
  reg end_ops = 0;
  reg [DATA_WIDTH-1:0] in0 = 0;
  reg [DATA_WIDTH-1:0] in1 = 0;
  `ifdef HIGH_ACC
    wire [(2*DATA_WIDTH):0] out;
  `else
    wire [DATA_WIDTH-1:0] out;
  `endif
  wire mac_ready;
  
  integer period = 10;
  
  MAC #(
    .DATA_WIDTH(DATA_WIDTH)
  )uut(
    .clk(clk),
    .rst(rst),
    .begin_ops(begin_ops),
    .end_ops(end_ops),
    .in0(in0),
    .in1(in1),
    .out(out),
    .mac_ready(mac_ready)
  );
  
  initial begin
    forever #(period/2) clk = ~clk;
  end
  
  initial begin
  	clk = 0;
    rst = 1'b0;
    
    #(2*period);
    
    rst = 1'b1;
    
    #(2*period);
    
    rst = 1'b0;
    
    #(10*period);
    
    begin_ops = 1'b1;
    in0 = 8'd5;
    in1 = 8'd8;
    
    #(period);
    in0 = 8'd3;
    in1 = 8'd2;
    
    #(period);
    in0 = 8'd1;
    in1 = 8'd1;
    
    #(period);
    in0 = 8'd0;
    in1 = 8'd6;
    
    #(period);
    in0 = 8'd2;
    in1 = 8'd5;
    begin_ops = 1'b0;
  	end_ops = 1'b1;
    
    #(period);
    begin_ops = 1'b1;
  	end_ops = 1'b0;
    in0 = 8'd10;
    in1 = 8'd8;
    
    #(period);
    in0 = 8'd9;
    in1 = 8'd11;
    
    #(period);
    in0 = 8'd5;
    in1 = 8'd4;
    
    #(period);
    in0 = 8'd3;
    in1 = 8'd7;
    //begin_ops = 1'b0;
  	//end_ops = 1'b1;
    
    #(period);
    begin_ops = 1'b0;
  	end_ops = 1'b1;
    
    #(period);
    begin_ops = 1'b0;
  	end_ops = 1'b0;
    
    #(10*period);
    
    $finish;
  end
  
endmodule