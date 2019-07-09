`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITEP
// Engineer: SvirLex
// 
// Create Date:    18:59:22 09/26/2014 
// Design Name: 
// Module Name:    myblkram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//		Data fifo.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//		Write 16-bit input words accompanied with valid.
//		Add 0xFFFF filler at the end of block with odd number of 16-bit words
//		Read ignore address. 
//		Any write causes reset
//////////////////////////////////////////////////////////////////////////////////
module rcvfifo(
		input wb_stb,
		input wb_cyc,
		output reg wb_ack,
		output reg [31:0] wb_dat_o,
		input wb_clk,
		input wb_we,
		input gtp_clk,
		input [15:0] gtp_dat,
		input gtp_vld,
		output reg [15:0] fifocnt,
		output reg overflow
   );

	parameter MBITS = 13;
	localparam	CH_COMMA = 16'h00BC;		// comma K28.5

	reg [31:0] fifo [2**MBITS-1:0];
	reg [MBITS-1:0] waddr = 0;
	reg [MBITS-1:0] wwaddr = 0;
	reg [MBITS-1:0] raddr = 0;
	reg [MBITS-1:0] rraddr = 0;
	reg reset = 0;
	reg odd = 0;
	reg rreset = 0;
	reg read = 0;
	reg readd = 0;
	reg [15:0] evendat = 0;
	wire [15:0] odddat;
	wire [MBITS-1:0] waddrp;
	
	assign odddat = (gtp_vld) ? gtp_dat : 16'h7FFF;
	assign waddrp = waddr + 1;

//		write fifo
	always @ (posedge gtp_clk) begin
		rreset <= reset;
		rraddr <= raddr;
		if (rreset) begin
			waddr <= 0;
			odd <= 0;
			overflow <= 0;
		end else if (!overflow && !odd && gtp_vld && waddrp != rraddr) begin
			evendat <= gtp_dat;
			odd <= 1;
		end else if (odd && (gtp_vld || (gtp_dat == CH_COMMA))) begin
			fifo[waddr] <= {odddat, evendat};	// fill the last halfword after block
			odd <= 0;
			waddr <= waddr + 1;
		end else if (waddrp == rraddr && gtp_vld) begin
			overflow <= 1;
		end
	end
	
//		read fifo
	always @ (posedge wb_clk) begin
		wb_ack <= wb_cyc && wb_stb;
		reset <= wb_cyc && wb_stb && wb_we;
		read <= wb_cyc && wb_stb && !wb_we;
		readd <= read;
		wwaddr <= waddr;
		wb_dat_o <= fifo[raddr];
		fifocnt <= wwaddr - raddr;
		if (reset) begin
			raddr <= 0;
		end else if (!read && readd && raddr != wwaddr) begin
			raddr <= raddr + 1;
		end 
		fifocnt <= (wwaddr - raddr) & (2**MBITS - 1);
	end
	
endmodule
