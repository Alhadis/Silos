module Big_SignalTrans_E(
	input clk,
	input rst_n,
	input [1:0] key_in,
	input Man_in,
	output m_seq1,
	output m_seq3,
	output clk_mseq2,
	output manchester,
	output clkoutMan,
	output clk_i,
	output decode,
	output clkout2,
	output clk_q,
	output Bit_Sync
);

wire c0, c1;
pll	pll_inst (
	.inclk0 ( clk ),
	.c0 ( c0 ),
	.c1 ( c1 )
	);

	
wire clk_mseq;

key_scan key_scan_inst
(
	.clk(clk) ,	// input  clk_sig
	.key_in(key_in) ,	// input [3:0] key_in_sig
	.clk_out(clk_mseq), 	// output  clk_out_sig
	.clk_out_2(clk_mseq2) ,	// output  clk_out_2_sig
	.rst_n(rst_n) 	// input  rst_n_sig

);

m_sequence m_sequence_inst1
(
	.clk(clk_mseq) ,	// input  clk_sig
	.m_seq(m_seq1) ,	// output 3_seq_sig
	.rst_n(rst_n) 	// input  rst_n_sig
);


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
deClock deClock_inst
(
	.clk(clk) ,	// input  clk_sig
	.code(Man_in) ,	// input  code_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.clkout(clkoutMan) ,	// output  clkout_sig
	.clkout2(clkout2), 	// output  clkout2_sig
	.declk(declk) 	// output [15:0] declk_sig
);

/*****************锁相法*************************/
wire clk_d1,clk_d2;
/*
clk_gen clk_gen_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_sig
	.clk_d1(clk_d1) ,	// output  clk_d1_sig
	.clk_d2(clk_d2) 	// output  clk_d2_sig
);
*/
wire pd_before,pd_after;
//wire clk_q;
/*
control control_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.clk_d1(clk_d1) ,	// input  clk_d1_sig
	.clk_d2(clk_d2) ,	// input  clk_d2_sig
	.pd_before(dout1) ,	// input  pd_before_sig
	.pd_after(dout2) ,	// input  pd_after_sig
	.clk_i(clk_i) ,	// output  clk_i_sig
	.clk_q(clk_q) 	// output  clk_q_sig
);
*/
wire [15:0]declk;
control control_inst
(
	.clk(c1) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.clk_d1(clk) ,	// input  clk_d1_sig
	.clk_d2(~clk) ,	// input  clk_d2_sig
	.pd_before(dout1) ,	// input  pd_before_sig
	.pd_after(dout2) ,	// input  pd_after_sig
	.declk(declk) ,	// input [15:0] declk_sig
	.clk_i(clk_i) ,	// output  clk_i_sig
	.clk_q(clk_q) 	// output  clk_q_sig
);

wire dout1,dou2;
moniflop moniflop_inst1
(
	.clk(c1) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_sig
	.din(pd_before) ,	// input  din_sig
	.dout(dout1) 	// output  dout_sig
);

moniflop moniflop_inst2
(
	.clk(c1) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_sig
	.din(pd_after) ,	// input  din_sig
	.dout(dout2) 	// output  dout_sig
);


phaseDetec phaseDetec_inst
(
	.clk(c1) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.datain(Man_in) ,	// input  datain_sig
	.clk_i(clk_i) ,	// input  clk_i_sig
	.clk_q(clk_q) ,	// input  clk_q_sig
	.pd_before(pd_before) ,	// output  pd_before_sig
	.pd_after(pd_after) 	// output  pd_after_sig
);


syncout syncout_inst
(
	.rst_n(rst_n) ,	// input  rst_n_sig
	.clk32(clk) ,	// input  clk32_sig
	.clk_i(clk_i) ,	// input  clk_i_sig
	.clk_d2(clk_d2) ,	// input  clk_d2_sig
	.datain(~Man_in) ,	// input  datain_sig
	.Bit_Sync(Bit_Sync) ,	// output  Bit_Sync_sig
	.dataout() 	// output  dataout_sig
);




/************************解码**********************/
/*
decoding decoding_inst
(
	.clk(clkout2) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.code(manchester) ,	// input  code_sig
	.decode(decode), 	// output  decode_sig
	.fail(fail) 	// output  fail_sig
);
*/
/*
decoding_r decoding_r_inst
(
	.clk(clkout2) ,	// input  clk_sig
	.rst_n(key_in[1]||key_in[0]) ,	// input  rst_n_sig
	.code(manchester) ,	// input  code_sig
	.decode(decode) ,	// output  decode_sig
	.fail(fail) 	// output  fail_sig
);
*/



endmodule
