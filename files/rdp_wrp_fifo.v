`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2019 01:37:24 AM
// Design Name: 
// Module Name: rdp_wrp_fifo
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


module rdp_wrapper_fifo_buff #(
  parameter DATA_WIDTH = 8,
  parameter ADDRS_WIDTH = 8
  
  //localparam ADDRS_WIDTH_INTERNAL = ADDRS_WIDTH + 1,
  //localparam RAM_DEPTH = 255
)(
  input clkA, clkB,
  input rst,
  input clr_ptrs,
  input rdn, wrn,
  input [DATA_WIDTH-1:0] data_in,
  output reg full,
  output reg empty,
  output reg almost_full,
  output reg almost_empty,
  output [DATA_WIDTH-1:0] data_out
);
  
  localparam ADDRS_WIDTH_INTERNAL = ADDRS_WIDTH + 1;
  localparam RAM_DEPTH = (1 << ADDRS_WIDTH)-1;
  
  //wire clkA, clkB;
  
  (*keep = "ture"*)reg [ADDRS_WIDTH_INTERNAL-1:0] wr_cntr, rd_cntr;
  reg [ADDRS_WIDTH-1:0] wr_cntr_delayed, rd_cntr_delayed;
  wire rd_cntr_ovf, wr_cntr_ovf;
  reg full_internal, empty_internal, almost_full_internal, almost_empty_internal;
  reg [DATA_WIDTH-1:0] data_in_internal;
  reg rd_internal, wr_internal;
  
  rdp #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDRS_WIDTH(ADDRS_WIDTH)
  )ram_2_port(
    .clkA(clkA),
    .clkB(clkB),
    .dataA(data_in_internal),
    .addrsA(wr_cntr_delayed[ADDRS_WIDTH-1:0]),
    .wrnA(wr_internal),
    .rdnB(rd_internal),
    .addrsB(rd_cntr_delayed[ADDRS_WIDTH-1:0]),
    .dataB(data_out)
  );
  
//  assign full = full_internal;
//  assign empty = empty_internal;
//  assign almost_full = almost_full_internal;
//  assign almost_empty = almost_empty_internal;
  
//  assign clkA = clk;
//  assign clkB = clk;
  
  //assigning outputs
  always @(posedge clkA) begin
    if(rst) begin
        full <= 1'b0;
        almost_full <= 1'b0;
    end
    else begin
        full <= full_internal;
        almost_full <= almost_full_internal;
    end
  end 
  always @(posedge clkB) begin
    if(rst) begin
        empty <= 1'b0;
        almost_empty <= 1'b0;
    end
    else begin
        empty <= empty_internal;
        almost_empty <= almost_empty_internal;
    end
  end
  //to delay the data
  always @(posedge clkA) begin
    if(rst) begin
      data_in_internal	<= {DATA_WIDTH{1'b0}};
    end
    else begin
      data_in_internal	<= data_in;
    end
  end
  
  //assigning write en to mem
  always @(posedge clkA) begin
    if(rst) begin
    	wr_internal <= 1'b0;
    end
    else begin
      if(wrn) begin
        if(!full) begin
        	wr_internal <= 1'b1;
        end
        else begin
        	wr_internal <= 1'b0;
        end
      end
      else begin
      	wr_internal <= 1'b0;
      end
    end
  end
  
  //assigning read en to mem
  always @(posedge clkB) begin
    if(rst) begin
      	rd_internal <= 1'b0;
    end
    else begin
      if(rdn) begin
        if(!empty) begin
        	rd_internal <= 1'b1;
        end
        else begin
        	rd_internal <= 1'b0;
        end
      end
      else begin
      	rd_internal <= 1'b0;
      end
    end
  end
  
  //counting up the write ptr
  always @(posedge clkA) begin
    if(rst) begin
      wr_cntr	<= {ADDRS_WIDTH_INTERNAL{1'b0}};
      wr_cntr_delayed <= wr_cntr[ADDRS_WIDTH-1:0];
    end
    else begin
      if(wrn && !full_internal) begin
        if(wr_cntr < {ADDRS_WIDTH_INTERNAL{1'b1}}) begin
        	wr_cntr <= wr_cntr + 1'b1;
          	wr_cntr_delayed <= wr_cntr[ADDRS_WIDTH-1:0];
        end
        else begin
        	wr_cntr <= {ADDRS_WIDTH_INTERNAL{1'b0}};
          	wr_cntr_delayed <= wr_cntr[ADDRS_WIDTH-1:0];
        end
      end
      else begin
        if(clr_ptrs) begin
        	wr_cntr <= {ADDRS_WIDTH_INTERNAL{1'b0}};
          	wr_cntr_delayed <= wr_cntr[ADDRS_WIDTH-1:0];
        end
        else begin
          	wr_cntr <= wr_cntr;
          	wr_cntr_delayed <= wr_cntr[ADDRS_WIDTH-1:0];
        end
      end
    end
  end
  
  //counting up the read ptr
  always @(posedge clkB) begin
    if(rst) begin
      rd_cntr	<= {ADDRS_WIDTH_INTERNAL{1'b0}};
      rd_cntr_delayed <= rd_cntr[ADDRS_WIDTH-1:0];
    end
    else begin
      if(rdn && !empty_internal) begin
        if(rd_cntr < {ADDRS_WIDTH_INTERNAL{1'b1}}) begin
        	rd_cntr <= rd_cntr + 1'b1;
          	rd_cntr_delayed <= rd_cntr[ADDRS_WIDTH-1:0];
        end
        else begin
        	rd_cntr <= {ADDRS_WIDTH_INTERNAL{1'b0}};
          	rd_cntr_delayed <= rd_cntr[ADDRS_WIDTH-1:0];
        end
      end
      else begin
        if(clr_ptrs) begin
        	rd_cntr <= {ADDRS_WIDTH_INTERNAL{1'b0}};
          	rd_cntr_delayed <= rd_cntr[ADDRS_WIDTH-1:0];
        end
        else begin
          	rd_cntr <= rd_cntr;
          	rd_cntr_delayed <= rd_cntr[ADDRS_WIDTH-1:0];
        end
      end
    end
  end

assign wr_cntr_ovf = (wr_cntr[ADDRS_WIDTH]) ? wr_cntr[ADDRS_WIDTH] ^ rd_cntr[ADDRS_WIDTH] : 1'b0;
assign rd_cntr_ovf = (rd_cntr[ADDRS_WIDTH]) ? rd_cntr[ADDRS_WIDTH] ^ wr_cntr[ADDRS_WIDTH] : 1'b0;

//assigning full and almost full internal signals
always @(*) begin
    if(rst) begin
        full_internal = 1'b0;
        almost_full_internal = 1'b0;
    end
    else begin
        if(wr_cntr_ovf) begin
            if(rd_cntr - wr_cntr <= 1) begin
                full_internal = 1'b1;
            end
            else begin
                full_internal = 1'b0;
            end
            
            if(rd_cntr - wr_cntr <= 8) begin
                almost_full_internal = 1'b1;
            end
            else begin
                almost_full_internal = 1'b0;
            end
        end
        else begin
            if(rd_cntr_ovf) begin
                if(rd_cntr - wr_cntr <= 1) begin
                    full_internal = 1'b1;
                end
                else begin
                    full_internal = 1'b0;
                end
                
                if(rd_cntr - wr_cntr <= 8) begin
                    almost_full_internal = 1'b1;
                end
                else begin
                    almost_full_internal = 1'b0;
                end
            end
            else begin
                if(wr_cntr - rd_cntr >= RAM_DEPTH) begin
                    full_internal = 1'b1;
                end
                else begin
                    full_internal = 1'b0;
                end
                
                if(wr_cntr - rd_cntr >= RAM_DEPTH - 8) begin
                    almost_full_internal = 1'b1;
                end
                else begin
                    almost_full_internal = 1'b0;
                end
            end
        end
    end
end

//assigning empty and almost empty internal signals
always @(*) begin
    if(rst) begin
        empty_internal = 1'b0;
        almost_empty_internal = 1'b0;
    end
    else begin
        if(rd_cntr_ovf) begin
            if(rd_cntr - wr_cntr <= 0) begin
                empty_internal = 1'b1;
            end
            else begin
                empty_internal = 1'b0;
            end
            
            if(rd_cntr - wr_cntr >= RAM_DEPTH - 8) begin
                almost_empty_internal = 1'b1;
            end
            else begin
                almost_empty_internal = 1'b0;
            end
        end
        else begin
            if(!wr_cntr_ovf) begin
                if(rd_cntr - wr_cntr <= 0) begin
                    empty_internal = 1'b1;
                end
                else begin
                    empty_internal = 1'b0;
                end
                
                if(rd_cntr - wr_cntr >= RAM_DEPTH - 8) begin
                    almost_empty_internal = 1'b1;
                end
                else begin
                    almost_empty_internal = 1'b0;
                end
            end
            else begin
                if(wr_cntr - rd_cntr <= 0) begin
                    empty_internal = 1'b1;
                end
                else begin
                    empty_internal = 1'b0;
                end
                
                if(wr_cntr - rd_cntr <= 8) begin
                    almost_empty_internal = 1'b1;
                end
                else begin
                    almost_empty_internal = 1'b0;
                end
            end
        end
    end
end
endmodule
