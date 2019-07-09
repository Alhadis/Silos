`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:29 08/11/2018 
// Design Name: 
// Module Name:    vga_module 
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
module vga_module(
    input clk,
    input rst_n,
    output VSYNC_Sig,
    output HSYNC_Sig,
    output [4:0]Red_Sig,
    output [5:0]Green_Sig,
    output [4:0]Blue_Sig
    );
    
    
    wire clk_out;
    wire isReady;
    wire [11:0]x_addr;
    wire [11:0]y_addr;
    
    
    pll_ip pll_ip_inst(
        .CLK_IN1(clk),
        .CLK_OUT1(clk_out),
        .RESET(~rst_n)
    );

    vga_control_module C1(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr),
        .Red_Sig(Red_Sig),
        .Green_Sig(Green_Sig),
        .Blue_Sig(Blue_Sig)
    );
    
    /*
    vga_sync_module_800_600_60 S1(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .VSYNC_Sig(VSYNC_Sig),
        .HSYNC_Sig(HSYNC_Sig),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr)
    );
    */
    
    /*
    vga_sync_module_800_600_75 S2(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .VSYNC_Sig(VSYNC_Sig),
        .HSYNC_Sig(HSYNC_Sig),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr)
    );
    */
    
    
    vga_sync_module_640_480_60 S3(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .VSYNC_Sig(VSYNC_Sig),
        .HSYNC_Sig(HSYNC_Sig),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr)
    );
    
    
    /*
    vga_sync_module_640_480_75 S4(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .VSYNC_Sig(VSYNC_Sig),
        .HSYNC_Sig(HSYNC_Sig),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr)
    );
    */
    
    /*
    vga_sync_module_1024_768_60 S5(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .VSYNC_Sig(VSYNC_Sig),
        .HSYNC_Sig(HSYNC_Sig),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr)
    );
    */
    
    /*
    vga_sync_module_1440_900_60 S6(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .VSYNC_Sig(VSYNC_Sig),
        .HSYNC_Sig(HSYNC_Sig),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr)
    );
    */

    /*
    vga_sync_module_1920_1080_60 S7(
        .vga_clk(clk_out),
        .rst_n(rst_n),
        .VSYNC_Sig(VSYNC_Sig),
        .HSYNC_Sig(HSYNC_Sig),
        .Ready_Sig(isReady),
        .Column_Addr_Sig(x_addr),
        .Row_Addr_Sig(y_addr)
    );
    */
    


endmodule
