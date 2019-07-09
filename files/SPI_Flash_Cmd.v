`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:21:27 06/24/2019 
// Design Name: 
// Module Name:    SPI_Flash_Com 
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
module SPI_Flash_Cmd
(
	input           sys_clk,
	input           rst,
	input[7:0]      cmd,
	input           cmd_valid,
	output          cmd_ack,
	input[23:0]     addr,
	input[7:0]      data_in,
	input[8:0]      size,
	output reg      date_reg,
	output reg[7:0] data_out,
	output reg      data_valid,
	//to spi master
	output reg      CS_reg,
	output reg      wr_req,
	input           wr_ack,
	output reg[7:0] send_data,
	input[7:0]      data_recv
);
parameter S_IDLE        = 0;
parameter S_CS_LOW      = 1;
parameter S_CS_HIGH     = 2;
parameter S_KEEP_CS_LOW = 3;
parameter S_READ_BYTES  = 4;
parameter S_WRITE_BYTES = 5;
parameter S_CMD_LATCH   = 6;
parameter S_WR_CMD_CODE = 7;
parameter S_CMD_ACK     = 8;

reg[4:0]    state, next_state;
reg[8:0]    byte_cnt;
reg         wr_ack_d0;
reg[7:0]    cmd_code;
reg[8:0]    byte_size;
assign cmd_ack = (state == S_CMD_ACK) ? 1'b1 : 1'b0;
always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		wr_ack_d0 <= 1'b0;
	else
		wr_ack_d0 <= wr_ack;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_req <= 1'b0;
	else
		wr_req <= (state == S_READ_BYTES || state == S_WR_CMD_CODE || state == S_WRITE_BYTES) ? 1'b1 : 1'b0;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		data_req <= 1'b0;
	else
		data_req <= ((state == S_WRITE_BYTES ) && (byte_cnt >= 9'd2) && (byte_cnt != byte_size - 9'd1) && wr_ack_d0 == 1'b1) ? 1'b1 : 1'b0;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		state <= S_IDLE;
	else
		state <= next_state;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		CS_reg <= 1'b0;
	else if(state == S_CS_LOW)
		CS_reg <= 1'b0;
	else if(state == S_CS_HIGH || state == S_IDLE)
		CS_reg <= 1'b1;
end
endmodule
