`timescale 1ns / 10ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:52:32 04/01/2015
// Design Name:   memory
// Module Name:   /home/igor/proj/wfd125/wfd125-mainfpga/testmemory/testmemory.v
// Project Name:  fpga_main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmemory;

	// Inputs
	reg wb_clk;
	reg wb_rst;
	reg wbm_cyc;
	reg wbm_stb;
	reg wbm_we;
	reg [3:0] wbm_sel;
	reg [28:0] wbm_addr;
	reg [31:0] wbm_dat_i;
	reg wbr_cyc;
	reg wbr_stb;
	reg wbr_we;
	reg [1:0] wbr_addr;
	reg [31:0] wbr_dat_i;
	reg gtp_clk;
	reg [63:0] gtp_dat;
	reg gtp_vld;
	reg mcb_clk;

	// Outputs
	wire wbm_ack;
	wire wbm_stall;
	wire [31:0] wbm_dat_o;
	wire wbr_ack;
	wire [31:0] wbr_dat_o;
	wire [14:0] MEMA;
	wire [2:0] MEMBA;
	wire MEMRST;
	wire MEMCKE;
	wire MEMWE;
	wire MEMODT;
	wire MEMRAS;
	wire MEMCAS;
	wire MEMUDM;
	wire MEMLDM;
	wire [1:0] MEMCK;
	wire [1:0] MEMUDQS;
	wire [1:0] MEMLDQS;
	wire MEMZIO;
	wire MEMRZQ;
	wire [31:0] status;

	// Bidirs
	wire [15:0] MEMD;
	
	// other
	reg [31:0] cnt;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.wb_clk(wb_clk), 
		.wb_rst(wb_rst), 
		.wbm_cyc(wbm_cyc), 
		.wbm_stb(wbm_stb), 
		.wbm_we(wbm_we), 
		.wbm_sel(wbm_sel), 
		.wbm_addr(wbm_addr), 
		.wbm_dat_i(wbm_dat_i), 
		.wbm_ack(wbm_ack), 
		.wbm_stall(wbm_stall), 
		.wbm_dat_o(wbm_dat_o), 
		.wbr_cyc(wbr_cyc), 
		.wbr_stb(wbr_stb), 
		.wbr_we(wbr_we), 
		.wbr_addr(wbr_addr), 
		.wbr_dat_i(wbr_dat_i), 
		.wbr_ack(wbr_ack), 
		.wbr_dat_o(wbr_dat_o), 
		.gtp_clk(gtp_clk), 
		.gtp_dat(gtp_dat), 
		.gtp_vld(gtp_vld), 
		.mcb_clk(mcb_clk), 
		.MEMA(MEMA), 
		.MEMBA(MEMBA), 
		.MEMD(MEMD), 
		.MEMRST(MEMRST), 
		.MEMCKE(MEMCKE), 
		.MEMWE(MEMWE), 
		.MEMODT(MEMODT), 
		.MEMRAS(MEMRAS), 
		.MEMCAS(MEMCAS), 
		.MEMUDM(MEMUDM), 
		.MEMLDM(MEMLDM), 
		.MEMCK(MEMCK), 
		.MEMUDQS(MEMUDQS), 
		.MEMLDQS(MEMLDQS), 
		.MEMZIO(MEMZIO), 
		.MEMRZQ(MEMRZQ), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		wb_clk = 0;
		wb_rst = 0;
		wbm_cyc = 0;
		wbm_stb = 0;
		wbm_we = 0;
		wbm_sel = 4'b1111;
		wbm_addr = 0;
		wbm_dat_i = 0;
		wbr_cyc = 0;
		wbr_stb = 0;
		wbr_we = 0;
		wbr_addr = 0;
		wbr_dat_i = 0;
		gtp_clk = 0;
		gtp_dat = 0;
		gtp_vld = 0;
		mcb_clk = 0;
		
		cnt = 0;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end


	always @ (*) #4 wb_clk <= !wb_clk;
	always @ (*) #4 mcb_clk <= !mcb_clk;
	
	always @ (posedge wb_clk) begin
//		if (!wbm_stall) cnt <= cnt + 1;
		cnt <= cnt + 1;
		wbm_dat_i <= cnt;
		wbm_stb <= 0;
		case (cnt)
			4:	wb_rst <= 1;
			8: wb_rst <= 0;
			32: begin
				wbm_cyc <= 1;
				wbm_we <= 1;
				wbm_stb <= 1;
				wbm_addr <= wbm_addr + 1;
			end
		endcase

		if (wbm_ack) wbm_cyc <= 0;
	
	end
	
      
endmodule

