`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:22 09/26/2014 
// Design Name: 
// Module Name:    myblkram 
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
module myblkram(
    input [8:0] wb_adr,
    input wb_stb,
    input wb_cyc,
    output reg wb_ack,
    output [31:0] wb_dat_o,
    input [31:0] wb_dat_i,
    input wb_we,
    input wb_clk,
	 input wb_rst,
	 input [3:0] wb_sel,
    input gtp_clk,
    input [15:0] gtp_dat,
    input gtp_vld,
    input cntrl_run,
    output reg cntrl_ready
    );

	 wire [3:0] WEA;
	 reg [1:0] WEB;
	 reg [9:0] ADDRB;
	 reg cntrl_run_d;
	 reg cntrl_run_dd;
	 reg gtp_rst;


	   RAMB16BWER #(
      // DATA_WIDTH_A/DATA_WIDTH_B: 0, 1, 2, 4, 9, 18, or 36
      .DATA_WIDTH_A(36),
      .DATA_WIDTH_B(18),
      // DOA_REG/DOB_REG: Optional output register (0 or 1)
      .DOA_REG(0),
      .DOB_REG(0),
      // EN_RSTRAM_A/EN_RSTRAM_B: Enable/disable RST
      .EN_RSTRAM_A("TRUE"),
      .EN_RSTRAM_B("TRUE"),
      // RSTTYPE: "SYNC" or "ASYNC" 
      .RSTTYPE("SYNC"),
      // RST_PRIORITY_A/RST_PRIORITY_B: "CE" or "SR" 
      .RST_PRIORITY_A("CE"),
      .RST_PRIORITY_B("CE"),
      // SIM_COLLISION_CHECK: Collision check enable "ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE" 
      .SIM_COLLISION_CHECK("ALL"),
      // SIM_DEVICE: Must be set to "SPARTAN6" for proper simulation behavior
      .SIM_DEVICE("SPARTAN3ADSP"),
      // SRVAL_A/SRVAL_B: Set/Reset value for RAM output
      .SRVAL_A(36'h000000000),
      .SRVAL_B(36'h000000000),
      // WRITE_MODE_A/WRITE_MODE_B: "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
      .WRITE_MODE_A("WRITE_FIRST"),
      .WRITE_MODE_B("WRITE_FIRST") 
   )
   RAMB16BWER_inst (
      // Port A Data: 32-bit (each) output: Port A data
      .DOA(wb_dat_o),       // 32-bit output: A port data output
      .DOPA(),     // 4-bit output: A port parity output
      // Port B Data: 32-bit (each) output: Port B data
      .DOB(),       // 32-bit output: B port data output
      .DOPB(),     // 4-bit output: B port parity output
      // Port A Address/Control Signals: 14-bit (each) input: Port A address and control signals
      .ADDRA({wb_adr, 5'h00}),   // 14-bit input: A port address input
      .CLKA(wb_clk),     // 1-bit input: A port clock input
      .ENA(1'b1),       // 1-bit input: A port enable input
      .REGCEA(1'b0), // 1-bit input: A port register clock enable input
      .RSTA(1'b0),     // 1-bit input: A port register set/reset input
      .WEA(WEA),       // 4-bit input: Port A byte-wide write enable input
      // Port A Data: 32-bit (each) input: Port A data
      .DIA(wb_dat_i),       // 32-bit input: A port data input
      .DIPA(4'h0),     // 4-bit input: A port parity input
      // Port B Address/Control Signals: 14-bit (each) input: Port B address and control signals
      .ADDRB({ADDRB, 4'h00}),   // 14-bit input: B port address input
      .CLKB(gtp_clk),     // 1-bit input: B port clock input
      .ENB(1'b1),       // 1-bit input: B port enable input
      .REGCEB(1'b0), // 1-bit input: B port register clock enable input
      .RSTB(1'b0),     // 1-bit input: B port register set/reset input
      .WEB({2'b00, WEB}),       // 4-bit input: Port B byte-wide write enable input
      // Port B Data: 32-bit (each) input: Port B data
      .DIB({16'h0000, gtp_dat}),       // 32-bit input: B port data input
      .DIPB(4'h0)      // 4-bit input: B port parity input
   );

	genvar i;
	generate
      for (i=0; i < 4; i=i+1) 
      begin:	WBWRITE
         assign WEA[i] = wb_sel[i] & wb_stb & wb_cyc & wb_we;
      end
   endgenerate

	always @ (posedge wb_clk) begin
		wb_ack <= #1 wb_cyc & wb_stb & !wb_ack;
	end

	always @ (posedge gtp_clk) begin
		cntrl_run_d <= cntrl_run;
		cntrl_run_dd <= cntrl_run_d;
		gtp_rst <= wb_rst;
		if ((gtp_rst) || (cntrl_run_d & !cntrl_run_dd)) begin
			cntrl_ready <= 0;
			ADDRB <= 0;
			WEB <= 2'b00;
		end else begin
			if (!cntrl_ready && ADDRB == 9'h1FF) begin
				cntrl_ready <= 1;
			end
			if (!cntrl_ready) begin
				WEB <= {2{gtp_vld}};
				if (gtp_vld) ADDRB <= ADDRB + 1;
			end else begin
				WEB <= 2'b00;
			end
		end
	end

endmodule
