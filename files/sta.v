`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:37 06/22/2011 
// Design Name: 
// Module Name:    sta 
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

// sample: /netfpga/lib/verilog/core/io/mdio/src/nf2_mdio.v 


module sta(
	input		clk,
	input		reset,
	output reg	phy_mdc,
	output		phy_mdio_out,
	output		phy_mdio_tri,
	input		phy_mdio_in
    );
// In general FALL_COUNT = 2*RISE_COUNT
	parameter RISE_COUNT = 5;
	parameter FALL_COUNT = 10;
	
	reg		mdc_rising, mdc_falling;
	reg [7:0]	mdc_counter;

	always @(posedge clk)
		if(reset | (mdc_counter == FALL_COUNT))
			mdc_counter <= 1;
		else
			mdc_counter <= mdc_counter + 1;

	always @(posedge clk) begin
		mdc_rising	<= (mdc_counter == RISE_COUNT);
		mdc_falling	<= (mdc_counter == FALL_COUNT);
		phy_mdc		<= reset ? 0 : (mdc_rising ? 1 : (mdc_falling ? 0 : phy_mdc));
	end
	
	reg [1:0] state, state_nxt;
	
	parameter	IDLE	= 0,
			START	= 1,
			RUN	= 2;

	reg [31:0] cmd_reg, tri_ctrl;

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			cmd_reg		<= 'h0;
			tri_ctrl	<= 'h0;
		end
		else if ((state == RUN)&& mdc_falling) begin
			cmd_reg 	<= {cmd_reg[30:0],1'b0};
			tri_ctrl	<= {tri_ctrl[30:0],1'b0};
		end
	end

	assign phy_mdio_out = cmd_reg[31];
	assign phy_mdio_tri = tri_ctrl[31];

endmodule
