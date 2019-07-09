`timescale 1ns/1ps
//-----------------------------------------------------
//   双相时钟信号生成模块
//-----------------------------------------------------
module clk_gen
(
    input clk,      //32MHz系统时钟
    input rst_n,      //高电平有效复位信号
    output clk_d1,  //时钟1
    output clk_d2   //时钟2
);

//-----------------------------------------------------
//  产生占空比为1:1，时钟为采样频率（8MHz）的双相时钟
//  两路时钟输出相位相差两个系统时钟周期 
//-----------------------------------------------------
reg [3:0] cnt;     //计数器
reg clkd1, clkd2;

//在计数器的控制下完成指定时钟输出
always @ (posedge clk or negedge rst_n)
    if (!rst_n) begin
        cnt <= 4'd0; clkd1 <= 1'b0; clkd2 <= 1'b0;
    end
    else 
        case (cnt)
            4'd0 : begin  
                clkd1 <= 1'b1;
                clkd2 <= 1'b0;
                cnt <= cnt + 1'b1;
            end
            4'd11 : begin
                clkd1 <= 1'b0;
                clkd2 <= 1'b1;
                cnt <= cnt + 1'b1;
            end
            default : begin
                clkd1 <= 1'b0;
                clkd2 <= 1'b0;
                cnt <= cnt + 1'b1;
            end
        endcase

assign clk_d1 = clkd1;
assign clk_d2 = clkd2;

endmodule