`timescale 1ns/1ps
//-----------------------------------------------------
//    控制模块
//-----------------------------------------------------
module control
(
    input clk,      //32MHz系统时钟
    input rst_n,      //高电平有效复位信号
    input clk_d1,
    input clk_d2,
    input pd_before,
    input pd_after,
    input [15:0] declk,
    output clk_i,
    output clk_q
);

wire gate_open = (~pd_before) & clk_d1;
wire gate_close = pd_after & clk_d2;
wire clk_in = gate_open | gate_close;   //分频器驱动时钟

reg clki, clkq;
/*
reg [2:0] cnt;
always @ (posedge clk or negedge rst_n)
    if (!rst_n) begin
        cnt <= 3'd0; clki <= 0; clkq <= 0;
    end
    else begin
        if (clk_in) cnt <= cnt + 1'b1;
        clki <= ~cnt[2];
        clkq <= cnt[2];
    end

assign clk_i = clki;
assign clk_q = clkq;
*/

/**********************产生4倍时钟*************************/

reg [31:0] clkcnt;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        clkcnt <= 0;    
    end
    else if (clk_in) begin
        clkcnt <= clkcnt + 2147483648 / declk;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        clki <= 0;
        clkq <= 1;
    end
    else if (clkcnt <= 32'h7FFF_FFFF) begin
        clki <= 1'b0;
        clkq <= 1'b1;
    end
    else begin
        clki <= 1'b1;
        clkq <= 1'b0;
    end 
end

/*
reg [31:0] clkcnt;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        clkcnt <= 0;    
    end
    else if (clk_in) begin
        clkcnt <= clkcnt + 1;
    end
	 else if (clkcnt >= declk / 4)
			clkcnt <= 0;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        clki <= 0;
        clkq <= 1;
    end
    else if (clkcnt <= declk / 8 - 1 ) begin
        clki <= 1'b0;
        clkq <= 1'b1;
    end
    else begin
        clki <= 1'b1;
        clkq <= 1'b0;
    end 
end
*/
assign clk_i = clki;
assign clk_q = clkq;
endmodule