`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Private
// Engineer: Uttej
// 
// Create Date: 07/01/2019 09:28:08 PM
// Design Name: 
// Module Name: MAC
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

//`define HIGH_ACCURACY
`define LOW_LATENCY

module MAC #(
  parameter DATA_WIDTH = 8
)(
  input wire clk,
  input wire rst,
  input wire begin_ops,
  input wire end_ops,
  input wire [DATA_WIDTH-1:0] in0,
  input wire [DATA_WIDTH-1:0] in1,
  `ifdef HIGH_ACCURACY
	output wire [(2*DATA_WIDTH):0] out,
  `else
	output wire [DATA_WIDTH-1:0] out,
  `endif
  output wire mac_ready
);
  
  (*keep = "true"*) reg begin_ops_internal, begin_ops_internal_delayed, end_ops_internal;
  (*keep = "true"*) reg end_ops_internal_delayed, rst_internal, mac_ready_internal;
  (*keep = "true"*) reg [DATA_WIDTH-1:0] in0_internal, in1_internal;
  
  `ifdef HIGH_ACCURACY
	(*keep = "true"*) reg [(2*DATA_WIDTH)-1:0] prod_val;
	(*keep = "true"*) reg [(2*DATA_WIDTH):0] sum_val, out_internal;
	wire [(2*DATA_WIDTH):0] temp_sum_val;

	always @(posedge clk) begin
      if(rst) begin
        begin_ops_internal <= 1'b0;
        begin_ops_internal_delayed <= 1'b0;
        end_ops_internal <= 1'b0;
        end_ops_internal_delayed <= 1'b0;
        mac_ready_internal <= 1'b0;
        rst_internal <=  1'b1;
        in0_internal <= {(DATA_WIDTH){1'b0}};
        in1_internal <= {(DATA_WIDTH){1'b0}};
      end
      else begin
        begin_ops_internal <= begin_ops;
        begin_ops_internal_delayed <= begin_ops_internal;
        end_ops_internal <= end_ops;
        end_ops_internal_delayed <= end_ops_internal;
        mac_ready_internal <= end_ops_internal_delayed;
        rst_internal <=  1'b0;
        in0_internal <= in0;
        in1_internal <= in1;
      end
	end

	always @(posedge clk or posedge rst_internal) begin
      if(rst_internal) begin
        prod_val <= {(2*DATA_WIDTH){1'b0}};
        sum_val <= {(2*DATA_WIDTH+1){1'b0}};
      end
      else begin
        if(begin_ops_internal || begin_ops_internal_delayed) begin
          prod_val <= {{(8){1'b0}}, in0_internal} * {{(8){1'b0}}, in1_internal};
        end
        
        if(begin_ops_internal_delayed)begin
        	sum_val <= {1'b0, prod_val} + temp_sum_val;
        end
        else if(end_ops_internal_delayed) begin
          sum_val <= {(2*DATA_WIDTH+1){1'b0}};
        end
      end
	end

	assign temp_sum_val = sum_val;

	always @(posedge clk or posedge rst_internal) begin
      if(rst_internal) begin
        out_internal <= {(2*DATA_WIDTH){1'b0}};
      end
      else begin
        if(end_ops_internal_delayed) begin //&& !mac_ready_internal) begin
          out_internal <= temp_sum_val;
        end
      end
	end

	assign mac_ready = mac_ready_internal;
	assign out = out_internal;
  
  `else
	(*keep = "true"*) reg [DATA_WIDTH-1:0] prod_val;
	(*keep = "true"*) reg [DATA_WIDTH-1:0] sum_val, out_internal;
	wire [DATA_WIDTH-1:0] temp_sum_val;

	always @(posedge clk) begin
      if(rst) begin
        begin_ops_internal <= 1'b0;
        begin_ops_internal_delayed <= 1'b0;
        end_ops_internal <= 1'b0;
        end_ops_internal_delayed <= 1'b0;
        mac_ready_internal <= 1'b0;
        rst_internal <=  1'b1;
        in0_internal <= {(DATA_WIDTH){1'b0}};
        in1_internal <= {(DATA_WIDTH){1'b0}};
      end
      else begin
        begin_ops_internal <= begin_ops;
        begin_ops_internal_delayed <= begin_ops_internal;
        end_ops_internal <= end_ops;
        end_ops_internal_delayed <= end_ops_internal;
        mac_ready_internal <= end_ops_internal_delayed;
        rst_internal <=  1'b0;
        in0_internal <= in0;
        in1_internal <= in1;
      end
	end

	always @(posedge clk or posedge rst_internal) begin
      if(rst_internal) begin
        prod_val <= {(DATA_WIDTH){1'b0}};
        sum_val <= {(DATA_WIDTH){1'b0}};
      end
      else begin
        if(begin_ops_internal || begin_ops_internal_delayed) begin
          prod_val <= in0_internal * in1_internal;
          //sum_val <= prod_val + temp_sum_val;
        end
        
        if(begin_ops_internal_delayed) begin
          sum_val <= prod_val + temp_sum_val;
        end
        else if(end_ops_internal_delayed) begin
          sum_val <= {(DATA_WIDTH){1'b0}};
        end
      end
	end

	assign temp_sum_val = sum_val;

	always @(posedge clk or posedge rst_internal) begin
      if(rst_internal) begin
        out_internal <= {(DATA_WIDTH){1'b0}};
      end
      else begin
        if(end_ops_internal_delayed) begin
          out_internal <= temp_sum_val;
        end
      end
	end

	assign mac_ready = mac_ready_internal;
	assign out = out_internal;
  `endif
  
endmodule
