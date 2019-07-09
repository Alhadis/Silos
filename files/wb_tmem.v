`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:41 09/26/2014 
// Design Name: 
// Module Name:    wb_tmem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//		Registers:
//		0 - port0 cmd for writes(W)/fifo status (R)
//		1 - port0 data for writes (W)
//		2 - port1 cmd for writes(W)/fifo status (R)
//		3 - port1 data for writes (W)
//		4 - port2 cmd, writes only (W)/fifo status (R)
//		5 - port2 data, writes only (W)
//		6 - port3 cmd, writes only (W)/fifo status (R)
//		7 - port3 data, writes only (W)
//		8 - port4 cmd, writes only (W)/fifo status (R)
//		9 - port4 data, writes only (W)
//		10 - port5 cmd, writes only (W)/fifo status (R)
//		11 - port5 data, writes only (W)
//		12 - port0 cmd for reads (W)/fifo status (R)
//		13 - port0 data for reads (R)
//		14 - port1 cmd for reads (W)/fifo ststus (R)
//		15 - port1 data for reads (R)
//
//		portX cmd: W[31:27] burst length 1-32
//               W[26:0] address of 32-bit word
//               R[31:13] not used, reads 0
//					  R[12] cmd fifo full (only in 2,4,6,8,10)
//               R[11] cmd fifo empty (only in 2,4,6,8,10)
//					  R[10:4] read/write fifo counter
//				     R[3] error
//					  R[2] read overflow/write underrun
//					  R[1] data fifo full
//					  R[0] data fifo empty
//		writes to 13 or 15 with any data cause MCB reset
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module wb_tmem(
	// system clock 125 MHz
	 input clk,
	// system reset, active high
	 input rst,
	// wb interface
    input [31:0] wb_dat_i,
    output reg [31:0] wb_dat_o,
    input wb_we,
    input wb_clk,
    input wb_cyc,
    output reg wb_ack,
    input wb_stb,
    input [3:0] wb_adr,
	// SDRAM interface
	// Address
    output [14:0] MEMA,
	// Bank addr
    output [2:0] MEMBA,
	// Data
    inout [15:0] MEMD,
	// Other single ended
    output MEMRST,
    output MEMCKE,
    output MEMWE,
    output MEMODT,
    output MEMRAS,
    output MEMCAS,
    output MEMUDM,
    output MEMLDM,
	// Pairs
    output [1:0] MEMCK,
    output [1:0] MEMUDQS,
    output [1:0] MEMLDQS,
	// Impedance matching
    output MEMZIO,
    output MEMRZQ
    );

	wire [15:0] ws;
	reg [15:0] rs;
	wire [31:0] rd [15:0];
	wire [5:0] blen;
	wire [29:0] badr;

	assign blen = {1'b0, wb_dat_i[31:27]};		// max burst length is 32 (blen+1), though 64 is allowed
	assign badr = {1'b0, wb_dat_i[26:0], 2'b00};	// always on 32bit boundary, somehow must be 30 bit total

   genvar i;
   generate
      for (i=0; i<15; i=i+1) 
      begin: stbs
         assign ws[i] = ((wb_adr == i) & wb_we & wb_cyc & wb_stb & !wb_ack ) ? 1'b1 : 1'b0;
      end
   endgenerate


	always @ (posedge wb_clk) begin
		wb_ack <= wb_cyc & wb_stb;
		rs <= 16'h0000;
		if (wb_cyc & wb_stb & !wb_we) rs[wb_adr] <= 1'b1;
		wb_dat_o <= rd[wb_adr];
	end


 memcntr # (
    .C1_P0_MASK_SIZE(4),
    .C1_P0_DATA_PORT_SIZE(32),
    .C1_P1_MASK_SIZE(4),
    .C1_P1_DATA_PORT_SIZE(32),
    .DEBUG_EN(0),
    .C1_MEMCLK_PERIOD(3300),		// Memory freq 125 MHz
    .C1_CALIB_SOFT_IP("TRUE"),
    .C1_SIMULATION("FALSE"),
    .C1_RST_ACT_LOW(0),
    .C1_INPUT_CLK_TYPE("INTERNAL"),		// Clocks are internal
    .C1_MEM_ADDR_ORDER("ROW_BANK_COLUMN"),
    .C1_NUM_DQ_PINS(16),
    .C1_MEM_ADDR_WIDTH(15),
    .C1_MEM_BANKADDR_WIDTH(3)
)
u_memcntr (

  .c1_sys_clk             (clk),
  .c1_sys_rst_i           (rst | ws[13] | ws[15]),                        
  .c1_clk0		        	  (),			// unused output
  .c1_rst0		           (),			// unused output
  .c1_calib_done          (),			// unused so far

  .mcb1_dram_dq           (MEMD),  
  .mcb1_dram_a            (MEMA),  
  .mcb1_dram_ba           (MEMBA),
  .mcb1_dram_ras_n        (MEMRAS),                        
  .mcb1_dram_cas_n        (MEMCAS),                        
  .mcb1_dram_we_n         (MEMWE),                          
  .mcb1_dram_odt          (MEMODT),
  .mcb1_dram_cke          (MEMCKE),                          
  .mcb1_dram_ck           (MEMCK[0]),                          
  .mcb1_dram_ck_n         (MEMCK[1]),       
  .mcb1_dram_dqs          (MEMLDQS[0]),                          
  .mcb1_dram_dqs_n        (MEMLDQS[1]),
  .mcb1_dram_udqs         (MEMUDQS[0]),    // for X16 parts                        
  .mcb1_dram_udqs_n       (MEMUDQS[1]),    // for X16 parts
  .mcb1_dram_udm          (MEMUDM),        // for X16 parts
  .mcb1_dram_dm           (MEMLDM),
  .mcb1_dram_reset_n      (MEMRST),
  .mcb1_rzq               (MEMRZQ),  
  .mcb1_zio               (MEMZIO),
	
   .c1_p0_cmd_clk                          (wb_clk),
   .c1_p0_cmd_en                           (ws[0] | ws[12]),
   .c1_p0_cmd_instr                        (ws[12] ? 3'b011 : 3'b010), // write or read with autoprecharge
   .c1_p0_cmd_bl                           (blen),		// burst length
   .c1_p0_cmd_byte_addr                    (badr),
   .c1_p0_cmd_empty                        (rd[0][11]),
   .c1_p0_cmd_full                         (rd[0][12]),
   .c1_p0_wr_clk                           (wb_clk),
   .c1_p0_wr_en                            (ws[1]),
   .c1_p0_wr_mask                          (4'b0000),	// always all 4 bytes
   .c1_p0_wr_data                          (wb_dat_i),
   .c1_p0_wr_full                          (rd[0][1]),
   .c1_p0_wr_empty                         (rd[0][0]),
   .c1_p0_wr_count                         (rd[0][10:4]),
   .c1_p0_wr_underrun                      (rd[0][2]),
   .c1_p0_wr_error                         (rd[0][3]),
   .c1_p0_rd_clk                           (wb_clk),
   .c1_p0_rd_en                            (rs[13]),		// always valid if not empty
   .c1_p0_rd_data                          (rd[13]),
   .c1_p0_rd_full                          (rd[12][1]),
   .c1_p0_rd_empty                         (rd[12][0]),
   .c1_p0_rd_count                         (rd[12][10:4]),
   .c1_p0_rd_overflow                      (rd[12][2]),
   .c1_p0_rd_error                         (rd[12][3]),
   .c1_p1_cmd_clk                          (wb_clk),
   .c1_p1_cmd_en                           (ws[2] | ws[14]),
   .c1_p1_cmd_instr                        (ws[14] ? 3'b011 : 3'b010),
   .c1_p1_cmd_bl                           (blen),
   .c1_p1_cmd_byte_addr                    (badr),
   .c1_p1_cmd_empty                        (rd[2][11]),
   .c1_p1_cmd_full                         (rd[2][12]),
   .c1_p1_wr_clk                           (wb_clk),
   .c1_p1_wr_en                            (ws[3]),
   .c1_p1_wr_mask                          (4'b0000),
   .c1_p1_wr_data                          (wb_dat_i),
   .c1_p1_wr_full                          (rd[2][1]),
   .c1_p1_wr_empty                         (rd[2][0]),
   .c1_p1_wr_count                         (rd[2][10:4]),
   .c1_p1_wr_underrun                      (rd[2][2]),
   .c1_p1_wr_error                         (rd[2][3]),
   .c1_p1_rd_clk                           (wb_clk),
   .c1_p1_rd_en                            (rs[15]),
   .c1_p1_rd_data                          (rd[15]),
   .c1_p1_rd_full                          (rd[14][1]),
   .c1_p1_rd_empty                         (rd[14][0]),
   .c1_p1_rd_count                         (rd[14][10:4]),
   .c1_p1_rd_overflow                      (rd[14][2]),
   .c1_p1_rd_error                         (rd[14][3]),
   .c1_p2_cmd_clk                          (wb_clk),
   .c1_p2_cmd_en                           (ws[4]),
   .c1_p2_cmd_instr                        (3'b010),	// always write with autoprecharge
   .c1_p2_cmd_bl                           (blen),
   .c1_p2_cmd_byte_addr                    (badr),
   .c1_p2_cmd_empty                        (rd[4][11]),
   .c1_p2_cmd_full                         (rd[4][12]),
   .c1_p2_wr_clk                           (wb_clk),
   .c1_p2_wr_en                            (ws[5]),
   .c1_p2_wr_mask                          (4'b0000),
   .c1_p2_wr_data                          (wb_dat_i),
   .c1_p2_wr_full                          (rd[4][1]),
   .c1_p2_wr_empty                         (rd[4][0]),
   .c1_p2_wr_count                         (rd[4][10:4]),
   .c1_p2_wr_underrun                      (rd[4][2]),
   .c1_p2_wr_error                         (rd[4][3]),
   .c1_p3_cmd_clk                          (wb_clk),
   .c1_p3_cmd_en                           (ws[6]),
   .c1_p3_cmd_instr                        (3'b010),
   .c1_p3_cmd_bl                           (blen),
   .c1_p3_cmd_byte_addr                    (badr),
   .c1_p3_cmd_empty                        (rd[6][11]),
   .c1_p3_cmd_full                         (rd[6][12]),
   .c1_p3_wr_clk                           (wb_clk),
   .c1_p3_wr_en                            (ws[7]),
   .c1_p3_wr_mask                          (4'b0000),
   .c1_p3_wr_data                          (wb_dat_i),
   .c1_p3_wr_full                          (rd[6][1]),
   .c1_p3_wr_empty                         (rd[6][0]),
   .c1_p3_wr_count                         (rd[6][10:4]),
   .c1_p3_wr_underrun                      (rd[6][2]),
   .c1_p3_wr_error                         (rd[6][3]),
   .c1_p4_cmd_clk                          (wb_clk),
   .c1_p4_cmd_en                           (ws[8]),
   .c1_p4_cmd_instr                        (3'b010),
   .c1_p4_cmd_bl                           (blen),
   .c1_p4_cmd_byte_addr                    (badr),
   .c1_p4_cmd_empty                        (rd[8][11]),
   .c1_p4_cmd_full                         (rd[8][12]),
   .c1_p4_wr_clk                           (wb_clk),
   .c1_p4_wr_en                            (ws[9]),
   .c1_p4_wr_mask                          (4'b0000),
   .c1_p4_wr_data                          (wb_dat_i),
   .c1_p4_wr_full                          (rd[8][1]),
   .c1_p4_wr_empty                         (rd[8][0]),
   .c1_p4_wr_count                         (rd[8][10:4]),
   .c1_p4_wr_underrun                      (rd[8][2]),
   .c1_p4_wr_error                         (rd[8][3]),
   .c1_p5_cmd_clk                          (wb_clk),
   .c1_p5_cmd_en                           (ws[10]),
   .c1_p5_cmd_instr                        (3'b010),
   .c1_p5_cmd_bl                           (blen),
   .c1_p5_cmd_byte_addr                    (badr),
   .c1_p5_cmd_empty                        (rd[10][11]),
   .c1_p5_cmd_full                         (rd[10][12]),
   .c1_p5_wr_clk                           (wb_clk),
   .c1_p5_wr_en                            (ws[11]),
   .c1_p5_wr_mask                          (4'b0000),
   .c1_p5_wr_data                          (wb_dat_i),
   .c1_p5_wr_full                          (rd[10][1]),
   .c1_p5_wr_empty                         (rd[10][0]),
   .c1_p5_wr_count                         (rd[10][10:4]),
   .c1_p5_wr_underrun                      (rd[10][2]),
   .c1_p5_wr_error                         (rd[10][3])
);

endmodule
