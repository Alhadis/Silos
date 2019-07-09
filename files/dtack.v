`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:56 10/30/2014 
// Design Name: 
// Module Name:    dtack 
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
module dtack(
		input wb_clk,
		input vme_dtack,
		input vme_dtack_oe,
		output xdtack,
		output xdtackoe
   );

	reg dtack = 1;
	reg dtackoe = 1;
	reg dtack_d	= 1;
	reg dtackoe_d = 1;
	reg dtackoe_dd = 1;
	assign xdtack = (dtackoe_dd) ? dtack_d : 1'bZ;
	assign xdtackoe = (dtackoe_dd) ? 1'b0 : 1'bZ;

	always @ (posedge wb_clk) begin
		dtack <= vme_dtack;
		dtack_d <= dtack & vme_dtack;
		dtackoe <= vme_dtack_oe;
		dtackoe_d <= dtackoe & vme_dtack_oe;
		dtackoe_dd <= dtackoe & vme_dtack_oe & dtackoe_d;
	end
	
endmodule
