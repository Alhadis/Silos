`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:06:19 06/22/2018 
// Design Name: 
// Module Name:    top_module 
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
module top_module(
    input CLK,
    input RST_n,
    input [3:0] keys,
    
    //写法一
    // output [3:0] leds
    
    //写法二
    output reg [3:0] leds
    );
    
    //按键按下led亮 按键弹起led灭
    
    //写法一
    // debounce_module K0(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[0]), .Pin_Out(leds[0]));
    // debounce_module K1(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[1]), .Pin_Out(leds[1]));
    // debounce_module K2(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[2]), .Pin_Out(leds[2]));
    // debounce_module K3(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[3]), .Pin_Out(leds[3]));
    
    //写法二
    //调用子模块时，输出接口只能用wire进行映射
    wire led0;
    wire led1;
    wire led2;
    wire led3;
    
    debounce_module K0(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[0]), .Pin_Out(led0));
    debounce_module K1(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[1]), .Pin_Out(led1));
    debounce_module K2(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[2]), .Pin_Out(led2));
    debounce_module K3(.CLK(CLK), .RST_n(RST_n), .Pin_In(keys[3]), .Pin_Out(led3));
    
    always @(*) begin
        leds <= {led3, led2, led1, led0};
    end
    
    // 不需要输出寄存器化
    // assign leds = {led3, led2, led1, led0};

endmodule
