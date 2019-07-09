module Big_SignalTrans_E_r(
	input clk,
	input rst_n,
	input [1:0] key_in,
	input Man_in,
	input SCK,
	input CS_N,
	input CS_N_r,
	input MOSI,
	output MISO,
	output m_seq1,
	output m_seq3,
	output manchester,
	output clk_mseq,
	output clk_i
);

wire c0, c1;
pll	pll_inst (
	.inclk0 ( clk ),
	.c0 ( c0 ),  //10M分频
	.c1 ( c1 )  //200M倍频
);

/****************按键扫描*************************/	
//wire clk_mseq;

key_scan key_scan_inst
(
	.clk(clk) ,	// input  clk_sig
	.key_in(key_in) ,	// input [3:0] key_in_sig
	.clk_out(clk_mseq), 	// output  clk_out_sig
	.clk_out_2(clk_mseq2) ,	// output  clk_out_2_sig
	.rst_n(rst_n) 	// input  rst_n_sig

);
/*
key_scan_r key_scan_r_inst
(
	.clk(clk) ,	// input  clk_sig
	.key_in(key_in) ,	// input [3:0] key_in_sig
	.clk_out(clk_mseq) ,	// output  clk_out_sig
	.clk_out_2(clk_mseq2) ,	// output  clk_out_2_sig
	.rst_n(rst_n) 	// input  rst_n_sig
);

*/

/******************m序列产生***********************/
m_sequence m_sequence_inst1
(
	.clk(clk_mseq) ,	// input  clk_sig
	.m_seq(m_seq1) ,	// output 3_seq_sig
	.rst_n(rst_n) 	// input  rst_n_sig
);

/*********************伪随机信号产生***************/
m_sequence3 m_sequence3_inst
(
	.clk(c0) ,	// input  clk_sig
	.m_seq(m_seq3) ,	// output  m_seq_sig
	.rst_n(rst_n) 	// input  rst_n_sig
);

/*************************曼彻斯特编码************/
Manchester Manchester_inst
(
	.clk(clk_mseq2) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.datain(m_seq1) ,	// input  datain_sig
	.dataout(manchester) 	// output  dataout_sig
);

/******************提取同步时钟*******************/
wire [15:0]declk;
wire data_ready;
deClock deClock_inst
(
	.clk(clk) ,	// input  clk_sig
	.code(Man_in) ,	// input  code_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.clkout(clkoutMan) ,	// output  clkout_sig
	.clkout2(clkout2), 	// output  clkout2_sig
	.declk(declk), 	// output [15:0] declk_sig
	.ready(data_ready) 	// output  ready_sig
);

/****************与32通信***********************/
connectTo32 connectTo32_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.CS_N(CS_N) ,	// input  CS_N_sig
	.SCK(SCK) ,	// input  SCK_sig
	.txd_data(declk) ,	// input [15:0] txd_data_sig
	.data_ready(data_ready) ,	// input  data_ready_sig
	.MISO(MISO) 	// output  MISO_sig
);
wire [15:0]rxd_data;
wire rxd_flag;
Stm32connectTo Stm32connectTo_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.CS_N(CS_N_r) ,	// input  CS_N_sig
	.SCK(SCK) ,	// input  SCK_sig
	.MOSI(MOSI) ,	// input  MOSI_sig
	.rxd_data(rxd_data) ,	// output [15:0] rxd_data_sig
	.rxd_flag(rxd_flag) 	// output  rxd_flag_sig
);

/************************同步***********************/
Synchronize Synchronize_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.Manin(Man_in) ,	// input  Manin_sig
	.divclk(rxd_data) ,	// input [15:0] divclk_sig
	.rxd_flag(rxd_flag) ,	// input  rxd_flag_sig
	.syn(clk_i) 	// output  syn_sig
);






endmodule
