`timescale 1ns / 1ps

module top(
	input rst,
	input clk,
	input [31:0] control_dat,
	input [31:0] control_adr,
	input dat_rdy,
	input set_addressLength,
	input we,
	
	inout sda,
	output scl
    );

wire [31:0]wb_m2s_dat;
wire [31:0]wb_m2s_adr;
wire wb_m2s_we;
wire wb_m2s_sel;
wire wb_m2s_stb;
wire wb_m2s_cyc;

wire wb_s2m_dat;
wire wb_s2m_ack;
wire addressLength;			//User defined

wishbone_master wb_m(
	.rst_i(rst),
	.clk_i(clk),
	.dat_i(wb_s2m_dat),
	.ack_i(wb_s2m_ack),
	
	.adr_o(wb_m2s_adr),
	.dat_o(wb_m2s_dat),
	.we_o(wb_m2s_we),
	.sel_o(wb_m2s_sel),
	.stb_o(wb_m2s_stb),
	.cyc_o(wb_m2s_cyc),
	.addressLength_out(addressLength),
	
	//master controlling signals
	.control_dat(control_dat),
	.control_adr(control_adr),
	.dat_rdy(dat_rdy),
	.addressLength_in(set_addressLength),
	.we(we)
);


wishbone_slave #(
	.slave_addr(32'h1000_0000)) 
	wb_s(
	.rst_i(rst),
	.clk_i(clk),
	.dat_i(wb_m2s_dat),
	.adr_i(wb_m2s_adr),
	.we_i(wb_m2s_we),
	.sel_i(wb_m2s_sel),
	.stb_i(wb_m2s_stb),
	.cyc_i(wb_m2s_cyc),
	.addressLength(addressLength),
	
	.dat_o(wb_s2m_dat),
	.ack_o(wb_s2m_ack),
	
	// Periphery signals
	.sda(sda),
	.scl(scl)
);
	

endmodule
