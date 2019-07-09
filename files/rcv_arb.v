`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		 ITEP
// Engineer: 		 SvirLex
// 
// Create Date:    19:59:41 04/05/2015 
// Design Name: 	 fpga-main
// Module Name:    rcv_arb
// Project Name: 	 wfd125
// Revision: 
// Revision 0.01 - File Created
// Description:
//		Performs Round Robbin arbitration between data FIFOs, passes data to SDRAM memory
//
//	Registers:	(bits not mentioned are not used)
//		0: 	CSR (RW)
//				CSR31	(RW)	Recieve FIFO enable/reset, when 0 fifos do not accept data and
//						no arbitration is performed, all pointers are kept initialized
//				CSR30	(RWC) Full reset of the module (MCB, WBRAM fsm, FIFOs) -- auto cleared
//				CSR29	(RWC) MCB and WBRAM fsm reset -- auto cleared
//				CSR28	(RW)  enable debug, when 1 WADR reads debug lines rather than last written block addr
//				CSR27	(R)	arbitter paused because of errors or memory full
//				CSR26	(R)	RADR invalid: specified RADR is beyond limits set by LIMR
//				CSR[23:20] (R)  same as CSR[7:4] for fifo 4
//				CSR[19:16] (R)  same as CSR[7:4] for fifo 3
//				CSR[15:12] (R)  same as CSR[7:4] for fifo 2
//				CSR[11:8]  (R)  same as CSR[7:4] for fifo 1
//				CSR7	(R)	(sticky) fifo 0 underrun error: CW recieved when not expected
//				CSR6	(R)	(sticky) fifo 0 overrun error: no CW recieved when expected
//				CSR5	(R)	(sticky) fifo 0 missed a block because it's full
//				CSR4	(R)	fifo 0 empty
//				CSR3	(R)	arbitter underrun error: CW recieved earlier than expected, RECIEVING STOPPED
//				CSR2	(R)	arbitter overrunrun error: no CW recieved when expected, RECIEVING STOPPED
//				CSR1	(R)   SDRAM GTP area full -  no more blocks can be written from GTP
//				CSR0	(R)   SDRAM GTP area empty -  no new data available for read
//
//		4:		RADR	(RW)
//				RADR[28:2]	must be set by readout procedure to indicate the last physical address that was already read by it
//				RADR[1:0]	will be ignored and 00 used instead
//
//		8:		LIMR	(RW)
//				LIMR[31:16]	upper 16bit of the address of the first 8K block following the recieving area
//				LIMR[15:0]	upper 16bit of the address of the first 8K block of the recieving area
//				writing to this reg must be done when fifo is disabled with CSR31=0, otherwise writing is ignored
//
//		C:		WADR	(R)
//				WADR[28:2]	physical addres of the first free cell after recieved block is written
//				WADR[1:0]	always reads 00
//
//				with CSR28=1 reads debug lines as indicated in memory.v
//
//////////////////////////////////////////////////////////////////////////////////
module rcv_arb #(
	 parameter MBITS = 13,
	 parameter NFIFO = 5
)
(
	 input					wb_clk,
	 input					wb_rst,
   // Register WishBone
    input         		wbr_cyc,
    input         		wbr_stb,
    input         		wbr_we,
	 input [1:0]   		wbr_addr,
    input [31:0]  		wbr_dat_i,
    output reg    		wbr_ack,
    output reg [31:0]	wbr_dat_o,
	 output reg				rd_wadr,
	 // 	trace back a few bits from csr
	 output reg				fifo_rst,
	 output reg				mcb_rst,
	 output 					en_debug,
	 // interface with recieving FIFOs
	 input					gtp_clk,			// all arbitration and MIG writes are on this clock
	 output [NFIFO-1:0]	want,
	 input [31:0]			datfromfifo,	// common "tri-state"
	 input [NFIFO-1:0]	have,
	 input [NFIFO-1:0]	fifo_empty,
	 input [NFIFO-1:0]	fifo_ovr,
	 input [NFIFO-1:0]	fifo_undr,
	 input [NFIFO-1:0]	fifo_missed,
	 // inteface with MIG
	 output reg				cmd_enable,		// MIG port cmd fifo enable
	 input					cmd_full,		// MIG port cmd fifo full
	 input					cmd_empty,		// MIG port cmd fifo empty
	 output [5:0]			blen,				// MIG port current burst length
	 output					wr_enable,		// MIG port write fifo enable
	 input					wr_full,			// MIG port write fifo full
	 input					wr_empty,		// MIG port write fifo empty
	 output reg [28:0]	adr_rcv,			// MIG address within recieving area
	 output [31:0]			dattomcb,		// MIG port write data
	 // total error or full
	 output 					status
    );

	// arbitration
	reg [3:0]			rr_cnt = 0;			// counter for Round Robbin arbitration
	wire 					fifohave;			// OR of dvalids from gtpfifos, actually have from currently selected fifo
	wire 					pause;				// pause gtpfifo readout
	wire					nextf;				// force increment of RR counter (after block is fully read)
	// intermediate fifo
	reg [31:0] 			afifo [2**MBITS-1:0];
	reg [31:0]			af_data;				// intermediate fifo output data
	reg [MBITS-1:0] 	af_waddr = 0;		// current fifo write pointer
	reg [MBITS-1:0] 	af_waddr_b = 0;	// end of block fifo write pointer
	reg [MBITS-1:0] 	af_raddr = 0;		// current fifo read pointer
	wire [MBITS-1:0]	af_graddr;			// fifo read addr for get operation for MIG
	reg  [7:0]			af_towrite = 0;	// number of Dwords to write - 1
	reg 					af_full;				// intermediate fifo full
	wire 					af_empty;			// intermediate fifo empty
	wire					af_have;				// immediate answer to af_give
	reg 					af_undr = 0;		// underrun error
	reg 					af_ovr = 0;			// overrun error
	// MIG interface
	wire					mem_give;			// request for data from memory
	reg					mem_full;			// recieving area of memory is full
	wire					mem_empty;			// recieving area of memory is empty
	reg					radr_invalid;		// reading process provided radr beyond boundaries
	reg [28:0] 			waddr;				// current address for MIG write
	reg [5:0] 			blen_c;				//	counter for burst length
	reg					wr_empty_d	= 1;	// delayed empty from wr fifo
	

	// registers
	reg [31:0]	csr = 0;					// control and status
	reg [31:0]	radr = 0;				// last read by readout procedure
	reg [31:0]	limr = 32'h00010000;	// limits of the recieving area, def. 8k starting @0
	reg [31:0]	wadr = 0;				// write address as diplayed to the user
	reg [5:0]	rst_cnt = 0;			// autoclear counter
	
	integer j;

	assign status = (|(csr & 32'h00EEEEE0)) | radr_invalid | af_undr | af_ovr | mem_full; // full, missed, undr, ovr or "radr invalid"	

	genvar i;
   generate
      for (i=0; i<NFIFO; i=i+1) 
      begin: gwant
         assign want[i] = ((rr_cnt == i) & ~pause);
      end
   endgenerate
	
	// RR arbitration and intermediate fifo
	assign	fifohave = |have;
	assign	pause = af_full | af_undr | af_ovr ;
	assign	nextf = (af_towrite == 1);
	assign 	af_graddr = (af_have) ? (af_raddr + 1) : af_raddr;
	assign	af_empty = (af_waddr_b == af_raddr);
	assign	af_have = mem_give & ~(af_empty);
	// memory interface
	assign	dattomcb = af_data;
	assign	wr_enable = af_have;
	assign	mem_give = ~(mem_full | wr_full | cmd_full | radr_invalid);	
	assign	blen = waddr[28:2] - adr_rcv[28:2] - 1;
	assign	mem_empty = (radr[28:0] == waddr);
	
	assign	en_debug = csr[28];

	always @ (posedge gtp_clk) begin
		// reclock fifo_rst
		fifo_rst <= ~csr[31] | csr[30];
		// defaults
		cmd_enable <= 0;
		
		if (fifo_rst) begin
			// reset
			rr_cnt <= 0;									// rest RR counter
			af_waddr <= 0;									// init intermediate fifo pointers
			af_waddr_b <= 0;								// init intermediate fifo pointers
			af_raddr <= 0;									// init intermediate fifo pointers
			af_towrite <= 0;								// init intermediate fifo pointers
			af_full <= 0;
			af_undr <= 0;
			af_ovr <= 0;
			waddr <= {limr[15:0], {13{1'b0}}};		// init MIG pointers
			wadr <= {limr[15:0], {13{1'b0}}};		// init MIG pointers
			adr_rcv <= {limr[15:0], {13{1'b0}}};	// init MIG pointers
			mem_full <= 0;
			blen_c <= 0;
			csr[NFIFO*4+3:4] <= 0;						// clear sticky error bits
		end else begin
			// advance round robbin counter
			if ((~fifohave & ~pause) | (nextf & ~pause)) begin
				if (rr_cnt == NFIFO-1) begin
					rr_cnt <= 0;
				end else begin
					rr_cnt <= rr_cnt + 1;
				end
			end
			// intermediate fifo
			// if we are writing this word from gtp to intermediate fifo
			if (fifohave) begin
				afifo[af_waddr] <= datfromfifo;
				af_waddr <= af_waddr + 1;
				// forecast full condition for the next cycle
				af_full <= ((af_waddr + 2) == af_raddr);
				// we only need to follow block structure to switch to the next gtp fifo
				if (datfromfifo[15]) begin
					// this is CW
					af_towrite <= datfromfifo[8:1];		// number of dwords to write -1
					if (|af_towrite) begin
						af_undr <= 1;	// must accept next CW with towrite=0, otherwize it's too early
					end
				end else begin
					if (|af_towrite) af_towrite <= af_towrite - 1;
					else af_ovr <= 1;	// must have accepted CW with towrite=0, otherwize it's too late
				end
				// writing last word of the block on this clk
				if (af_towrite == 1) af_waddr_b <= af_waddr + 1;
			end	// fifohave
			af_data <= afifo[af_graddr];
			if (af_have) begin
				af_raddr <= af_raddr + 1;
			end
			// memory interface
			// latch waddr when MIG data fifo is empty
			wr_empty_d <= wr_empty & cmd_empty;
			if (wr_empty & cmd_empty & ~wr_empty_d)	wadr <= waddr;
			// next burst always starts at this address
			if (cmd_enable) begin
				adr_rcv <= waddr;
			end
			// if we have data in intermediate fifo
			if (af_have) begin
				// increment and wrap waddr
				if ( (waddr + 4) == {limr[31:16], 13'h0000} ) begin
					waddr <= {limr[15:0], 13'b0};
				end else begin
					waddr <= waddr + 4;
				end
				// forecast full condition for the next cycle
				mem_full <=  (radr[28:0]  == (waddr + 8)) | 
								((radr[28:0] == {limr[15:0], 13'h0004}) & ((waddr + 4) == {limr[31:16], 13'h0000})) |
								((radr[28:0] == {limr[15:0], 13'h0000}) & ((waddr + 8) == {limr[31:16], 13'h0000}));
				// increment current burst length
				blen_c <= blen_c + 1;						// default behavior
				// issue command if: blen=32 or last waddress before wrap
				if ( blen_c == 31 || (waddr + 4) == {limr[31:16], 13'h0000}) begin
					cmd_enable <= 1;
					blen_c <= 0;
				end
			end else if (mem_give & |blen_c) begin
				// issue command if intermediate fifo is empty
				cmd_enable <= 1;
				blen_c <= 0;
			end	// af_have

			// sticky errors
			for (j = 0; j < NFIFO; j=j+1) begin
				if (fifo_missed[j]) begin
					csr[j*4+5] <= 1;
				end
				if (fifo_ovr[j]) begin
					csr[j*4+6] <= 1;
				end
				if (fifo_undr[j]) begin
					csr[j*4+7] <= 1;
				end
			end

		end		// not reset

		// empty flag (overrides reset)
		for (j = 0; j < NFIFO; j=j+1) begin
				csr[j*4+4] <= fifo_empty[j];
		end

	end		// posedge gtp_clk
		
	// WB registers
	always @(posedge wb_clk) begin
		// registers: reset-independent
		wbr_ack <=  wbr_cyc & wbr_stb;
		// wrte regs
		if (wbr_cyc & wbr_stb & wbr_we) begin;
			case (wbr_addr)
			2'b00:	begin
				csr[31:28] <= wbr_dat_i[31:28];
				if ( |wbr_dat_i[30:29]) rst_cnt <= 6'hFF;
			end
			2'b01:	begin
				radr[28:2] <= wbr_dat_i[28:2];
				// check raddr is within limits
				radr_invalid <= (wbr_dat_i[28:13] < limr[15:0]) || (wbr_dat_i[28:13] >= limr[31:16]);
			end
			2'b10:	begin
				if (~csr[31]) begin
					limr <= wbr_dat_i;
					radr_invalid <= (radr[28:13] < wbr_dat_i[15:0]) || (radr[28:13] >= wbr_dat_i[31:16]);
				end
			end
			endcase
		end
		// read regs
		rd_wadr <= 0;		// default
		if (wbr_cyc & wbr_stb & ~wbr_we) begin;
			case (wbr_addr)
			2'b00:	wbr_dat_o <= {csr[31:28], pause, radr_invalid, csr[25:4], af_undr, af_ovr, mem_full, mem_empty};
			2'b01:	wbr_dat_o <= radr;
			2'b10:	wbr_dat_o <= limr;
			2'b11:	begin	
					wbr_dat_o <= wadr;
					rd_wadr <= 1;
				end
			endcase
		end
		// autoclear reset bits
		if ( |rst_cnt ) begin
			rst_cnt <= rst_cnt - 1;
		end 
		if (rst_cnt == 1) begin
			csr[30:29] <= 0;
		end
		// fifo_rst @ wb_clk
		if (~csr[31] | csr[30]) begin 
			radr <= {limr[15:0], {13{1'b0}}};
			radr_invalid <= 0;
		end
		// mcb reset is asyncronous, can be wb_clk timed
		mcb_rst <= csr[29] | csr[30];

	end		// posedge wb_clk

endmodule
