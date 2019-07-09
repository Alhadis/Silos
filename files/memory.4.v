`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		SvirLex
// 
// Create Date:    17:03:59 03/27/2015 
// Design Name:    memory
// Module Name:    memory 
// Project Name:   wfd125-mainfpga
// Target Devices: XC6SLX45T
// Description: 
//		Accepts and buffers data from 4 GTP recievers, passes it to SDRAM memory
//		in blocks with round-robbin arbitration
//		Supports full pipelined block transfer interface for Wishbone
//		assumes only sequential addresses in a single block transfers
//
//		with CSR28=1, WADR reads debug lines as indicated below
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module memory # (
	 parameter FIFO_MBITS = 13,
    parameter READ_BURST_LEN = 8
)
(
    input         wb_clk,
    input         wb_rst,
   // Memory WishBone
    input         wbm_cyc,
    input         wbm_stb,
    input         wbm_we,
	 input [3:0]   wbm_sel,
	 input [28:0]  wbm_addr,	// byte address is 29 bit wide for 4 Gbits (512 Mbytes)
    input [31:0]  wbm_dat_i,
    output reg    wbm_ack,
    output        wbm_stall,
    output reg [31:0] wbm_dat_o,
   // Register WishBone
    input         wbr_cyc,
    input         wbr_stb,
    input         wbr_we,
	 input [1:0]   wbr_addr,
    input [31:0]  wbr_dat_i,
    output        wbr_ack,
    output [31:0] wbr_dat_o,
   // GTP data
	// reciever clock 125 MHz
	 input         gtp_clk,
	// recied data from 4 recievers
    input [63:0]  gtp_dat,
	// recieved data valid (not a comma) from 4 recievers
    input [3:0]   gtp_vld,
	// trigger data from triggen module
	 input [15:0]	trg_dat,
	// trigger data valid
	 input			trg_vld,
	//		token synchronization
	 input [15:0]  tok_dat,
	 input         tok_vld,
	// SDRAM interface
	 input         mcb_clk,
	// Address
    output [14:0] MEMA,
	// Bank addr
    output [2:0]  MEMBA,
	// Data
    inout [15:0]  MEMD,
	// Other single ended
    output        MEMRST,
    output        MEMCKE,
    output        MEMWE,
    output        MEMODT,
    output        MEMRAS,
    output        MEMCAS,
    output        MEMUDM,
    output        MEMLDM,
	// Pairs
    output [1:0]  MEMCK,
    output [1:0]  MEMUDQS,
    output [1:0]  MEMLDQS,
	// Impedance matching
    output        MEMZIO,
    output        MEMRZQ,
	// current status
    output  		status,
	 output	[4:0]	tp
    );

//======= SIGNALS ==============

	// port 0 : MIG to WB interface and fsm signals
	localparam	inv_time = 63;// time in wb_clk to make readahead invalid (~1 us @ 125 MHz)
	wire  		mem_rst;			// external reset or command from register
	wire  		mcb_rst;			// mcb and fsm reset from CSR
	wire			fifo_rst;		// recieving fifo reset from CSR
	wire  		w0_full;			// port 0 write fifo full
	wire  		w0_enable;	   // port 0 write fifo enable
	wire  		p0_full;       // port 0 cmd fifo full
	reg   		p0_enable = 0; // port 0 cmd fifo enable
	reg   		r0_enable = 0; // port 0 read fifo enable
	wire			r0_empty;		// port 0 read fifo empty
	wire [6:0]	r0_cnt;			// port 0 read fifo current data counter
	reg [5:0] 	p0_blen;			// port 0 current burst length
	reg [2:0] 	p0_cmd;			// port 0 instruction
	wire [31:0] r0_data;			// port 0 read fifo data
	reg [6:0] 	stb_cnt;			// valid wbm_stb counter for one block transfer
	reg [6:0] 	ack_cnt;			// read wbm_ack counter for one block transfer
	reg [28:0] 	adr_beg;			// burst beginning address
	reg [28:0] 	adr_next;		// next address available in read fifo
	reg [6:0]	rd_left;			// number of dwords in fifo (after burst execution)
	reg [6:0]	inv_cnt = 0;	// number of dwords to take  out from fifo for invalidation
	reg			inv_nz_d = 0;	// nonzero inv_cnt delayed
	wire			invld;			// fifo under invalidation

	// gtp recievers and arbitter
	localparam 				NFIFO		= 6;
	wire [31:0] 			dattoarb;			// data from gtp FIFOs to arbitter (common "tri-state")
	wire [NFIFO-1:0]		fifo_have;			// ready from FIFOs to arbitter
	wire [NFIFO-1:0]		arb_wants;			// get from arbitter to FIFOs
	wire [NFIFO-1:0]		fifo_empty;			// empty flag from fifos
	wire [NFIFO-1:0]		fifo_missed;		// error pulse from fifo when it's full to accept a block
	wire [NFIFO-1:0]		fifo_ovr;			// error pulse from fifo when it expects CW but doesn't get it
	wire [NFIFO-1:0]		fifo_undr;			// error pulse from fifo when it gets unexpected CW
	wire						arb_invld;			// wadr read from arbitter -- invalidate WB fifo

	// port 2 : arbitter to MIG interface
	wire			p2_enable;		// port 2 cmd fifo enable
	wire			p2_full;			// port 2 cmd fifo full
	wire			p2_empty;		// port 2 cmd fifo empty
	wire [5:0]	p2_blen;			// port 2 current burst length
	wire			w2_enable;		// port 2 write fifo enable
	wire			w2_full;			// port 2 write fifo full
	wire			w2_empty;		// port 2 write fifo empty
	wire [28:0]	adr_rcv;			// port 2 address within recieving area
	wire [31:0]	datfromarb;		// port 2 write data from arbitter

	wire [31:0] wbr_dat_a;		// register data from arbitter

	// debug lines
	// 31        28  X X 25  24     23  22  21  20   X 18  12     11  10   9   8   X 6    0
	// rd_left[3:0]     ful emp    err ovf ful emp     rd_cnt    err ovf ful emp     wr_cnt
	//                  p0_cmd     -------- p0_rd -----------    -------- p0_wr -----------
	wire [31:0] debug;

	assign wbr_dat_o = (en_debug) ? debug : wbr_dat_a;

	assign debug[7] = 0;
	assign debug[18:12] = r0_cnt;
	assign debug[19] = 0;
	assign debug[27:26] = 0;
	assign debug[9] = w0_full;
	assign debug[20] = r0_empty;
	assign debug[25] = p0_full;
	assign debug[31:28] = 0;
	
	assign tp[0] = |rd_left;
	assign tp[1] = invld;
	assign tp[2] = p0_enable;
	assign tp[3] = r0_enable;
	assign tp[4] = r0_empty;

	// We always write to wr_fifo if it's not full, otherwise we signal STALL
	assign w0_enable = wbm_cyc & wbm_stb & wbm_we & ~wbm_stall;
	assign wbm_stall = w0_full | p0_full;
	assign mem_rst = wb_rst | mcb_rst;
	
	assign invld = inv_nz_d | (|inv_cnt);

// MIG to WB state machine
	reg [2:0] state;
	localparam ST_RST 		= 0;
	localparam ST_IDLE 		= 1;
	localparam ST_WR_FIFO 	= 2;
	localparam ST_WR_CMD		= 3;
	localparam ST_RD_FIFO 	= 4;
	localparam ST_RD_CMD		= 5;
	
	
	always @(posedge wb_clk) begin
		// Defaults
		wbm_ack <= w0_enable;	
		if (wbm_cyc & wbm_stb & ~wbm_stall) begin
			stb_cnt <= stb_cnt + 1;
		end
		p0_enable <= 0;
		r0_enable <= 0;
		// check invalidation req from arbitter
		if (arb_invld) begin
			inv_cnt <= rd_left;
			rd_left <= 0;
		end
		// service invalidate request: take out data from rd fifo when allowed by r0_empty
		if (|inv_cnt & ~r0_empty) begin
			r0_enable <= 1;
			inv_cnt <= inv_cnt - 1;
		end
		inv_nz_d <= |inv_cnt;
		// main state machine
		if (mem_rst) begin
         state <= ST_RST;
      end else begin
			case (state)
				ST_RST : begin
					// We are here at the end of reset pulse and always with mcb_reset (no need to clear fifos)
					// Wait for end of current cycle here
					if (~wbm_cyc) begin
						inv_cnt <= 0;
						rd_left <= 0;
						state <= ST_IDLE;
					end
				end
            ST_IDLE : begin
					stb_cnt <= 0;
					ack_cnt <= 0;
					if (wbm_cyc & wbm_stb & ~wbm_stall) begin
						// This is first valid stb in a cycle
						stb_cnt <= 1;
						adr_beg <= wbm_addr;
						if (wbm_we) begin
							// Write operation
							state <= ST_WR_FIFO;
						end else begin
							// Read operation
							if ((wbm_addr == adr_next) & |rd_left & ~invld) begin	// adr_next is always valid if read fifo is not empty
								// we may have data in fifo ready immediately
								if (~r0_empty) begin
								// we have reqired data in read fifo
									r0_enable <= 1;
									rd_left <= rd_left - 1;
									wbm_ack <= 1;
									wbm_dat_o <= r0_data;
									ack_cnt <= 1;
									adr_next <= adr_next + 4;
								end
								state <= ST_RD_FIFO;
							end else begin
								// otherwise start new burst and read out dummy data if necessary
								p0_blen <= READ_BURST_LEN - 1;
								p0_cmd <= 3'b011;			// read with autoprecharge
								ack_cnt <= 0;
								adr_next <= wbm_addr;	// this will become address of the first word in fifo after dummy readout
								if (~invld) begin			// start invalidation if not already underway
									inv_cnt <= rd_left;
								end
								rd_left <= READ_BURST_LEN;		// we will execute burst, immediately or not
								if (p0_full) begin
									state <= ST_RD_CMD;
								end else begin 
									p0_enable <= 1;		// execute instruction
									state <= ST_RD_FIFO;
								end
							end
						end
					end
            end
            ST_WR_FIFO : begin
					if (w0_full | ~wbm_cyc) begin
						// wr_fifo full or write cycle ended
						p0_blen <= stb_cnt - 1;
						p0_cmd <= 3'b010;			// write with autoprecharge
						inv_cnt <= rd_left;		// invalidate read fifo (always on writes)
						rd_left <= 0;
						if (p0_full) begin
							state <= ST_WR_CMD;
						end else begin 
							p0_enable <= 1;	// execute instruction
							state <= ST_IDLE;
						end	// else we stay in this state and continue writing FIFO
					end 
            end
            ST_WR_CMD : begin
					if (~p0_full) begin
						p0_enable <= 1;
						state <= ST_IDLE;
					end
            end
            ST_RD_FIFO : begin
					if (wbm_cyc & ((ack_cnt < stb_cnt) | wbm_stb)) begin
						if (|rd_left) begin 
							if (~invld & ~r0_empty) begin
							// we have data to read and junk already removed -- send
								r0_enable <= 1;
								rd_left <= rd_left - 1;
								wbm_ack <= 1;
								wbm_dat_o <= r0_data;
								ack_cnt <= ack_cnt + 1;
								adr_next <= adr_next + 4;
							end
						end else begin
							// this is not the first read and we need more data -- start new burst with no invalidation
							p0_blen <= READ_BURST_LEN - 1;
							p0_cmd <= 3'b011;			// read with autoprecharge
							adr_beg <= adr_next;		// this will become address of the first word in fifo
							rd_left <= READ_BURST_LEN;
							if (p0_full) begin
								state <= ST_RD_CMD;
							end else begin 
								p0_enable <= 1;		// execute instruction
							end
						end
					end else if (~wbm_cyc) begin
						state <= ST_IDLE;
					end
            end
            ST_RD_CMD : begin
					if (~p0_full) begin
						p0_enable <= 1;		// execute instruction (prepared in ST_IDLE)
						state <= ST_RD_FIFO;
					end
            end
         endcase 
      end
	end

// MIG DDR3 SDRAM controller
// we only use port 0 for Wishbone ternsfers and port 2 for GTP data writing
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
// system
  .c1_sys_clk             (mcb_clk),
  .c1_sys_rst_i           (mem_rst),                        
  .c1_clk0		        	  (),			// unused output
  .c1_rst0		           (),			// unused output
  .c1_calib_done          (),			// unused so far
// SDRAM chip signals to board
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
// port 0 bidirectional
   .c1_p0_cmd_clk                          (wb_clk),
   .c1_p0_cmd_en                           (p0_enable),
   .c1_p0_cmd_instr                        (p0_cmd), // write or read with autoprecharge
   .c1_p0_cmd_bl                           (p0_blen),		// burst length
   .c1_p0_cmd_byte_addr                    ({1'b0, adr_beg}),
   .c1_p0_cmd_empty                        (debug[24]),
   .c1_p0_cmd_full                         (p0_full),
   .c1_p0_wr_clk                           (wb_clk),
   .c1_p0_wr_en                            (w0_enable),
   .c1_p0_wr_mask                          (~wbm_sel),	// this is masking out
   .c1_p0_wr_data                          (wbm_dat_i),
   .c1_p0_wr_full                          (w0_full),
   .c1_p0_wr_empty                         (debug[8]),
   .c1_p0_wr_count                         (debug[6:0]),
   .c1_p0_wr_underrun                      (debug[10]),
   .c1_p0_wr_error                         (debug[11]),
   .c1_p0_rd_clk                           (wb_clk),
   .c1_p0_rd_en                            (r0_enable),
   .c1_p0_rd_data                          (r0_data),
   .c1_p0_rd_full                          (debug[21]),
   .c1_p0_rd_empty                         (r0_empty),
   .c1_p0_rd_count                         (r0_cnt),
   .c1_p0_rd_overflow                      (debug[22]),
   .c1_p0_rd_error                         (debug[23]),
// port1 unused
   .c1_p1_cmd_clk                          (1'b0),
   .c1_p1_cmd_en                           (1'b0),
   .c1_p1_cmd_instr                        (3'b000),
   .c1_p1_cmd_bl                           (6'b000000),
   .c1_p1_cmd_byte_addr                    (30'h00000000),
   .c1_p1_cmd_empty                        (),
   .c1_p1_cmd_full                         (),
   .c1_p1_wr_clk                           (1'b0),
   .c1_p1_wr_en                            (1'b0),
   .c1_p1_wr_mask                          (4'b1111),
   .c1_p1_wr_data                          (32'h00000000),
   .c1_p1_wr_full                          (),
   .c1_p1_wr_empty                         (),
   .c1_p1_wr_count                         (),
   .c1_p1_wr_underrun                      (),
   .c1_p1_wr_error                         (),
   .c1_p1_rd_clk                           (1'b0),
   .c1_p1_rd_en                            (1'b0),
   .c1_p1_rd_data                          (),
   .c1_p1_rd_full                          (),
   .c1_p1_rd_empty                         (),
   .c1_p1_rd_count                         (),
   .c1_p1_rd_overflow                      (),
   .c1_p1_rd_error                         (),
// port 2 write only	!!! on gtp_clk
   .c1_p2_cmd_clk                          (gtp_clk),
   .c1_p2_cmd_en                           (p2_enable),
   .c1_p2_cmd_instr                        (3'b010),		// always write with autoprecharge
   .c1_p2_cmd_bl                           (p2_blen),
   .c1_p2_cmd_byte_addr                    ({1'b0, adr_rcv}),
   .c1_p2_cmd_empty                        (p2_empty),
   .c1_p2_cmd_full                         (p2_full),
   .c1_p2_wr_clk                           (gtp_clk),
   .c1_p2_wr_en                            (w2_enable),
   .c1_p2_wr_mask                          (4'b0000),		// always all 4 bytes
   .c1_p2_wr_data                          (datfromarb),
   .c1_p2_wr_full                          (w2_full),
   .c1_p2_wr_empty                         (w2_empty),
   .c1_p2_wr_count                         (),
   .c1_p2_wr_underrun                      (),
   .c1_p2_wr_error                         (),
// ports 3-5 unused
   .c1_p3_cmd_clk                          (1'b0),
   .c1_p3_cmd_en                           (1'b0),
   .c1_p3_cmd_instr                        (3'b000),
   .c1_p3_cmd_bl                           (6'b000000),
   .c1_p3_cmd_byte_addr                    (30'h00000000),
   .c1_p3_cmd_empty                        (),
   .c1_p3_cmd_full                         (),
   .c1_p3_wr_clk                           (1'b0),
   .c1_p3_wr_en                            (1'b0),
   .c1_p3_wr_mask                          (4'b1111),
   .c1_p3_wr_data                          (32'h00000000),
   .c1_p3_wr_full                          (),
   .c1_p3_wr_empty                         (),
   .c1_p3_wr_count                         (),
   .c1_p3_wr_underrun                      (),
   .c1_p3_wr_error                         (),
   .c1_p4_cmd_clk                          (1'b0),
   .c1_p4_cmd_en                           (1'b0),
   .c1_p4_cmd_instr                        (3'b000),
   .c1_p4_cmd_bl                           (6'b000000),
   .c1_p4_cmd_byte_addr                    (30'h00000000),
   .c1_p4_cmd_empty                        (),
   .c1_p4_cmd_full                         (),
   .c1_p4_wr_clk                           (1'b0),
   .c1_p4_wr_en                            (1'b0),
   .c1_p4_wr_mask                          (4'b1111),
   .c1_p4_wr_data                          (32'h00000000),
   .c1_p4_wr_full                          (),
   .c1_p4_wr_empty                         (),
   .c1_p4_wr_count                         (),
   .c1_p4_wr_underrun                      (),
   .c1_p4_wr_error                         (),
   .c1_p5_cmd_clk                          (1'b0),
   .c1_p5_cmd_en                           (1'b0),
   .c1_p5_cmd_instr                        (3'b000),
   .c1_p5_cmd_bl                           (6'b000000),
   .c1_p5_cmd_byte_addr                    (30'h00000000),
   .c1_p5_cmd_empty                        (),
   .c1_p5_cmd_full                         (),
   .c1_p5_wr_clk                           (1'b0),
   .c1_p5_wr_en                            (1'b0),
   .c1_p5_wr_mask                          (4'b1111),
   .c1_p5_wr_data                          (32'h00000000),
   .c1_p5_wr_full                          (),
   .c1_p5_wr_empty                         (),
   .c1_p5_wr_count                         (),
   .c1_p5_wr_underrun                      (),
   .c1_p5_wr_error                         ()
);

// these FIFO's recieve blocks of data from GTP and interface to arbitter
   genvar i;
   generate
      for (i=0; i < 4; i=i+1) 
      begin : gfifo
			gtpfifo # (
				.MBITS(FIFO_MBITS)
			) 
			rcvfifo(
				.gtp_clk		(gtp_clk),
				.gtp_dat    (gtp_dat[i*16+15:i*16]),
				.gtp_vld		(gtp_vld[i]),
				.rst			(fifo_rst),
				.give			(arb_wants[i]),
				.data			(dattoarb),
				.have			(fifo_have[i]),
				.empty		(fifo_empty[i]),
				.err_ovr		(fifo_ovr[i]),
				.err_undr	(fifo_undr[i]),
				.missed		(fifo_missed[i])
			);
      end
   endgenerate

//	fifth fifo keeps information for triggers, generated in this wfd
			gtpfifo # (
				.MBITS(FIFO_MBITS)
			) 
			trgfifo(
				.gtp_clk		(gtp_clk),
				.gtp_dat    (trg_dat),
				.gtp_vld		(trg_vld),
				.rst			(fifo_rst),
				.give			(arb_wants[4]),
				.data			(dattoarb),
				.have			(fifo_have[4]),
				.empty		(fifo_empty[4]),
				.err_ovr		(fifo_ovr[4]),
				.err_undr	(fifo_undr[4]),
				.missed		(fifo_missed[4])
			);

//	sixth fifo keeps timing information for tokens 0, 256, 512 and 768
			gtpfifo # (
				.MBITS(FIFO_MBITS)
			) 
			tokfifo(
				.gtp_clk		(gtp_clk),
				.gtp_dat    (tok_dat),
				.gtp_vld		(tok_vld),
				.rst			(fifo_rst),
				.give			(arb_wants[5]),
				.data			(dattoarb),
				.have			(fifo_have[5]),
				.empty		(fifo_empty[5]),
				.err_ovr		(fifo_ovr[5]),
				.err_undr	(fifo_undr[5]),
				.missed		(fifo_missed[5])
			);
	
// arbitter
	
rcv_arb #(
	 .MBITS		(FIFO_MBITS),
	 .NFIFO		(NFIFO)
)
arbitter (
	 .wb_clk			(wb_clk),
	 .wb_rst			(wb_rst),
   // Register WishBone
    .wbr_cyc		(wbr_cyc),
    .wbr_stb		(wbr_stb),
    .wbr_we			(wbr_we),
	 .wbr_addr		(wbr_addr),
    .wbr_dat_i		(wbr_dat_i),
    .wbr_ack		(wbr_ack),
    .wbr_dat_o		(wbr_dat_a),
	 .rd_wadr		(arb_invld),
	 // 	trace back a few bits from csr
	 .fifo_rst		(fifo_rst),			//	~CSR31 or CSR30 (autoclear) or wb_rst
	 .mcb_rst		(mcb_rst),			// autoclear bits CSR29 or CSR30
	 .en_debug		(en_debug),
	 // interface with recieving FIFOs
	 .gtp_clk		(gtp_clk),
	 .want			(arb_wants),
	 .datfromfifo	(dattoarb),
	 .have			(fifo_have),
	 .fifo_empty	(fifo_empty),
	 .fifo_ovr		(fifo_ovr),
	 .fifo_undr		(fifo_undr),
	 .fifo_missed	(fifo_missed),
	 // inteface with MIG
	 .cmd_enable	(p2_enable),		// MIG port cmd fifo enable
	 .cmd_full		(p2_full),			// MIG port cmd fifo full
	 .cmd_empty		(p2_empty),			// MIG port cmd fifo full
	 .blen			(p2_blen),			// MIG port current burst length
	 .wr_enable		(w2_enable),		// MIG port write fifo enable
	 .wr_full		(w2_full),			// MIG port write fifo full
	 .wr_empty		(w2_empty),			// MIG port write fifo empty
	 .adr_rcv		(adr_rcv),			// MIG address within recieving area
	 .dattomcb		(datfromarb),		// MIG port write data
	 // error
	 .status			(status)
    );


endmodule
