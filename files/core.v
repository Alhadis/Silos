`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:42 07/04/2011 
// Design Name: 
// Module Name:    core 
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
module core(
	//Eth 0 MAC to RGMII interfaces
	input			eth_clock_0_speed,
	input			eth_duplex_0_status,
	input			eth_link_0_status,
	input			gmii_0_crs_int,
	input			gmii_0_col_int,
	input	[7:0]	gmii_0_rxd_reg,
	input			gmii_0_rx_dv_reg,
	input			gmii_0_rx_er_reg,
	output	[7:0]	gmii_0_txd_int,
	output			gmii_0_tx_en_int,
	output			gmii_0_tx_er_int,

	//Eth 1 MAC to RGMII interfaces
	input			eth_clock_1_speed,
	input			eth_duplex_1_status,
	input			eth_link_1_status,
	input			gmii_1_crs_int,
	input			gmii_1_col_int,
	input	[7:0]	gmii_1_rxd_reg,
	input			gmii_1_rx_dv_reg,
	input			gmii_1_rx_er_reg,
	output	[7:0]	gmii_1_txd_int,
	output			gmii_1_tx_en_int,
	output			gmii_1_tx_er_int,

	//core clock
	input			core_clk_int,

	//misc
	input			reset
    );


endmodule
