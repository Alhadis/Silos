`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:42 10/01/2014 
// Design Name: 
// Module Name:    xspi_master 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: SPI master - WB slave interface with 3-state data IO
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// CLK_POL = 1
// 
// CLK ---------\    /--\    /--\    /--\    /--\    /--\    /--\    /--\    /-----------
//               \--/    \--/    \--/    \--/    \--/    \--/    \--/    \--/    
// DAT     ------\/------\/------\/------\/------\/------\/------\/------\/------\/------
//                \------/\------/\------/\------/\------/\------/\------/\------/
// CS  ---\                                                                          /---
//         \------------------------------------------------------------------------/
//
//	CSR bits:
//	7:0  - ~spi_cs (active high)
//	8    - =0 - data bits from master, =1 - to master
// 14:9 - reserved
// 15   - busy - operation in progress, read only
// DAT bits:
// 7:0  - data byte
// 14:8 - reserved
// 15   - busy, the same as in CSR
//////////////////////////////////////////////////////////////////////////////////
module xspi_master
	#(		
		parameter integer CLK_DIV = 49,	// half divider for wb_clk: spi_clk = wb_clk / (2*(CLK_DIV + 1))
		parameter CLK_POL = 1'b0			// active clock edge (rising = 0, falling = 1)
	)(
	 input wb_rst,
    input wb_clk,
    input wb_we,
    input [15:0] wb_dat_i,
    output [15:0] wb_dat_o,
    input wb_cyc,
    input wb_stb,
    output reg wb_ack,
    inout spi_dat,
    output spi_clk,
    output [7:0] spi_cs,	// active low
    input wb_adr				// adr=0 - shift (data) register, adr=1 - CSR
   );

	 reg [9:0] clk_cnt = 0;
	 reg [15:0] CSR = 0;
	 reg [7:0] sreg = 0;
	 reg [3:0] bit_cnt = 0; 
	 reg clk = 1'b1;			// passive - high
	 wire WBWR;
	 
	 assign spi_clk = clk ^ CLK_POL;
	 assign spi_cs = ~CSR[7:0];
	 assign spi_dat = (CSR[8]) ? 1'bZ : sreg[7];
	 assign wb_dat_o = (wb_adr) ? CSR : {CSR[15], 7'h00, sreg};	// read busy in both registers
	 assign WBWR = wb_cyc & wb_stb & wb_we;
	 
	 always @ (posedge wb_clk) begin
		wb_ack <= #1 wb_cyc & wb_stb & !wb_ack;
	   if (wb_rst) begin 
			clk_cnt <= 0;
			bit_cnt <= 0;
			CSR <= 0;
			clk <= 1'b1;
		end else begin
			CSR[15] <= | bit_cnt;
			if (WBWR & wb_adr) begin
				CSR[14:0] <= wb_dat_i[14:0];
			end
			if (!bit_cnt) begin
				if (WBWR & (!wb_adr)) begin
					if (!CSR[8]) begin
						sreg <= wb_dat_i[7:0];
					end 
					bit_cnt <= 1;
					clk_cnt <= CLK_DIV;
					clk <= 1'b0;
				end
			end else begin
				if (clk_cnt) begin 
					clk_cnt <= clk_cnt - 1;
				end else begin
					clk_cnt <= CLK_DIV;
					clk <= !clk;
					if (!clk) begin	//	rising edge - shift input data, increment bit counter
						if (CSR[8]) begin
							sreg <= {sreg[6:0], spi_dat};
						end
						if (bit_cnt == 8) begin
							bit_cnt <= 0;
						end else begin
							bit_cnt <= bit_cnt + 1;
						end
					end else begin // falling edge - shift output data
						if (!CSR[8]) begin
							sreg <= {sreg[6:0], 1'b0};
						end
					end
				end
			end
		end
	 end

endmodule
