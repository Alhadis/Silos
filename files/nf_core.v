`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:17 07/05/2011 
// Design Name: 
// Module Name:    nf_core 
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
module nf_core(
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

	input			tx_rgmii_clk_int,
	input			rx_rgmii_0_clk_int,
	input			rx_rgmii_1_clk_int,

//	output	[19:0]	debug_data,
	//core clock
	input			core_clk_int,

	//misc
	input			reset
    );

	wire 			disable_crc_check_0;
	wire 			disable_crc_gen_0;
	wire			enable_jumbo_rx_0;
	wire			enable_jumbo_tx_0;
	wire			rx_mac_en_0;
	wire			tx_mac_en_0;

	wire	[7:0]	gmac_rx_data_0;
	wire			gmac_rx_dvld_0;
	wire			gmac_rx_goodframe_0;
	wire			gmac_rx_badframe_0;

	wire	[7:0]	gmac_tx_data_0;
	wire			gmac_tx_dvld_0;
	wire			gmac_tx_ack_0;

	wire			reset_MAC_0;
	
	gig_eth_mac gig_eth_mac_0(
	//	Reset, Clock
		.reset				(reset),
		.rx_clk				(rx_rgmii_0_clk_int),
		.tx_clk				(tx_rgmii_clk_int),

	//	Configuration 
		.conf_rx_en			(rx_mac_en_0),
		.conf_rx_jumbo_en	(enable_jumbo_rx_0),
		.conf_rx_no_chk_crc	(disable_crc_check_0),
		.conf_tx_en			(tx_mac_en_0),
		.conf_tx_jumbo_en	(enable_jumbo_tx_0),
		.conf_tx_no_gen_crc	(disable_crc_gen_0),

	//	RX Client Interface
		.mac_rx_data		(gmac_rx_data_0),
		.mac_rx_dvld		(gmac_rx_dvld_0),
		.mac_rx_goodframe	(gmac_rx_goodframe_0),
		.mac_rx_badframe	(gmac_rx_badframe_0),

	//	TX Client Interface
		.mac_tx_data		(gmac_tx_data_0),
		.mac_tx_dvld		(gmac_tx_dvld_0),
		.mac_tx_ack			(gmac_tx_ack_0),
		.mac_tx_underrun	(1'b0),

	//	RX GMII Interface
		.gmii_rx_data		(gmii_0_rxd_reg),
		.gmii_rx_dvld		(gmii_0_rx_dv_reg),
		.gmii_rx_er			(gmii_0_rx_er_reg),

	//	TX GMII Interface
		.gmii_tx_data		(gmii_0_txd_int),
		.gmii_tx_en			(gmii_0_tx_en_int),
		.gmii_tx_er			(gmii_0_tx_er_int),

		.gmii_col			(gmii_0_col_int),
		.gmii_crs			(gmii_0_crs_int)
	);
	
	wire			disable_crc_check_1;
	wire			disable_crc_gen_1;
	wire			enable_jumbo_rx_1;
	wire			enable_jumbo_tx_1;
	wire			rx_mac_en_1;
	wire			tx_mac_en_1;

	wire	[7:0]	gmac_rx_data_1;
	wire			gmac_rx_dvld_1;
	wire			gmac_rx_goodframe_1;
	wire			gmac_rx_badframe_1;

	wire 			gmac_tx_data_1;
	wire			gmac_tx_dvld_1;
	wire			gmac_tx_ack_1;

	wire			reset_MAC_1;

	wire			frame_sent;
	wire			frame_caught;

	gig_eth_mac gig_eth_mac_1(
		.reset				(reset),
		.rx_clk				(rx_rgmii_1_clk_int),
		.tx_clk				(tx_rgmii_clk_int),

		.conf_rx_en			(rx_mac_en_1),
		.conf_rx_jumbo_en	(enable_jumbo_rx_1),
		.conf_rx_no_chk_crc	(disable_crc_check_1),
		.conf_tx_en			(tx_mac_en_1),
		.conf_tx_jumbo_en	(enable_jumbo_tx_1),
		.conf_tx_no_gen_crc	(disable_crc_gen_1),

		.mac_rx_data		(gmac_rx_data_1),
		.mac_rx_dvld		(gmac_rx_dvld_1),
		.mac_rx_goodframe	(gmac_rx_goodframe_1),
		.mac_rx_badframe	(gmac_rx_badframe_1),

		.mac_tx_data		(gmac_tx_data_1),
		.mac_tx_dvld		(gmac_tx_dvld_1),
		.mac_tx_ack			(gmac_tx_ack_1),
		.mac_tx_underrun	(1'b1),

		.gmii_rx_data		(gmii_1_rxd_reg),
		.gmii_rx_dvld		(gmii_1_rx_dv_reg),
		.gmii_rx_er			(gmii_1_rx_er_reg),

		.gmii_tx_data		(gmii_1_txd_int),
		.gmii_tx_en			(gmii_1_tx_en_int),
		.gmii_tx_er			(gmii_1_tx_er_int),

		.gmii_col			(gmii_1_col_int),
		.gmii_crs			(gmii_1_crs_int)
	);

	frame_sender	frame_sender(
		.reset				(reset),
		.tx_clk				(tx_rgmii_clk_int),
		.conf_tx_en			(tx_mac_en_0),
		.conf_tx_jumbo_en	(enable_jumbo_tx_0),
		.conf_tx_no_gen_crc	(disable_crc_gen_0),
		.mac_tx_data		(gmac_tx_data_0),
		.mac_tx_dvld		(gmac_tx_dvld_0),
		.mac_tx_ack			(gmac_tx_ack_0),
		.frame_sent			(frame_sent)
	);
	
	frame_catcher	frame_catcher(
		.reset				(reset),
		.rx_clk				(rx_rgmii_1_clk_int),
		.conf_rx_en			(rx_mac_en_1),
		.conf_rx_jumbo_en	(enable_jumbo_rx_1),
		.conf_rx_no_chk_crc	(disable_crc_check_1),
		.mac_rx_data		(gmac_rx_data_1),
		.mac_rx_dvld		(gmac_rx_dvld_1),
		.mac_rx_goodframe	(gmac_rx_goodframe_1),
		.mac_rx_badframe	(gmac_rx_badframe_1),
		.frame_caught		(frame_caught)
	);
	
	timer	timer(
		.reset				(reset),
		.tx_clk				(tx_rgmii_clk_int),
//		.time_out			(debug_data),
		.frame_sent 		(frame_sent),
		.frame_caught		(frame_caught)
	);
endmodule
