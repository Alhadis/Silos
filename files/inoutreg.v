`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:41 09/26/2014 
// Design Name: 
// Module Name:    inoutreg 
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
module inoutreg(
    input [31:0] wb_dat_i,
    output [31:0] wb_dat_o,
    input wb_we,
    input wb_clk,
    input wb_cyc,
    output reg wb_ack,
    input wb_stb,
	 input wb_adr,
    output reg [31:0] reg_o = 0,
    input [31:0] reg_i
    );

	reg [31:0] reg_ii;
	assign wb_dat_o = (wb_adr) ? reg_o : reg_ii;
	
	always @ (posedge wb_clk) begin
		wb_ack <= #1 wb_cyc & wb_stb;
		if (wb_cyc & wb_stb & wb_we & wb_adr) reg_o <= wb_dat_i;
		reg_ii <= reg_i;
	end

endmodule
