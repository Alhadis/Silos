`timescale 1ns / 1ps

module wishbone_master(
	//wb signals
	input rst_i,
	input clk_i,
	input [31:0] dat_i,
	input ack_i,
	
	output [31:0] adr_o,
	output [31:0] dat_o,
	output we_o,
	output sel_o,
	output stb_o,
	output cyc_o,
	output addressLength_out,
	
	//master controlling signals
	input [31:0] control_dat,
	input [31:0] control_adr,
	input dat_rdy,
	input addressLength_in,
	input we
    );
	 
reg [31:0]reg_adr_o;
reg [31:0]reg_dat_o;
reg reg_we_o;	 
reg reg_sel_o;
reg reg_sys_o;
reg reg_cyc_o;
reg addressLength;

always @(posedge clk_i)
begin
	if(rst_i || ack_i)
	begin
		reg_adr_o <= 0;
		reg_dat_o <= 0;
		reg_we_o <= 0;
		reg_sel_o <= 0;
		reg_sys_o <= 0;
		reg_cyc_o <= 0;
		addressLength <= 0;
	end
	else if(dat_rdy)
	begin
		reg_adr_o <= control_adr;
		reg_dat_o <= control_dat;
		reg_we_o <= we;				
		reg_sel_o <= 1;
		reg_cyc_o <= 1;
		addressLength <= addressLength_in;
	end
end

assign adr_o = reg_adr_o;
assign dat_o = reg_dat_o;
assign we_o = reg_we_o;	 
assign sel_o = reg_sel_o;
assign sys_o = reg_sys_o;
assign cyc_o = reg_cyc_o;
assign addressLength_out = addressLength;
		

endmodule
