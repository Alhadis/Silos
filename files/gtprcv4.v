`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITEP
// Engineer: SvirLex
// 
// Create Date:    17:45:34 10/22/2014 
// Design Name:    UWFD64
// Module Name:    gtprcv4 
// Project Name:   fpga_main
// Target Devices: XC6LXT
// Tool versions: 
// Description:    get and send data and get clock via S6 GTP transiver module
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module gtprcv4(
    input [7:0] rxpin,		// input data pins
    output [7:0] txpin,		// output data pins
    input [1:0] clkpin,		// input clock pins - tile0 package pins A10/B10
    output clkout,			// output 125 MHz clock
	 output clkwb,				// output clock for wishbone
 	 output gck_o,				// output clock for mcb
    output [63:0] data_o,	// output data 4x16bit
    output [3:0] charisk_o,// output char is K-char signature
    input [63:0] data_i,	// output data 4x16bit
    input [3:0] charisk_i, // output char is K-char signature	 
	 output locked				// DCM here is locked
    );

	 parameter WB_DIVIDE = 5;		// parameters for c clkwb generation
	 parameter WB_MULTIPLY = 4;	// parameters for c clkwb generation - 100 MHz default

	 wire [7:0] kchar_o;
	 wire refclk_i;	// 125 MHz
//	 (* KEEP = "TRUE" *) wire gtpclk_o;	// 125 MHz
	 wire [1:0] gtpclk_o;	// 125 MHz
	 wire gclk_o;		// 125 MHz
	 wire bufclk_o;	// 125 MHz
	 wire pll_lock;
	 wire CLK125;
	 wire CLK250;

	 genvar i;
	 generate
		for (i = 0; i < 4; i = i + 1) begin : LCharisk
			assign charisk_o[i] = kchar_o[2*i] | kchar_o[2*i+1];
		end
	 endgenerate
	 
	 assign clkout = CLK125;

    //--------------------------- The GTP Wrapper -----------------------------
    s6_gtpwizard_v1_11 #
    (
        .WRAPPER_SIM_GTPRESET_SPEEDUP   (0),      // Set this to 1 for simulation
        .WRAPPER_SIMULATION             (0)       // Set this to 1 for simulation
    )
    s6_gtpwizard_v1_11_i
    (
        //_____________________________________________________________________
        //TILE0  (X0_Y0)
        //---------------------- Loopback and Powerdown Ports ----------------------
        .TILE0_LOOPBACK0_IN             (3'b000),
        .TILE0_LOOPBACK1_IN             (3'b000),
        //------------------------------- PLL Ports --------------------------------
        .TILE0_CLK00_IN                 (refclk_i),
        .TILE0_CLK01_IN                 (refclk_i),
        .TILE0_GTPRESET0_IN             (1'b0),
        .TILE0_GTPRESET1_IN             (1'b0),
        .TILE0_PLLLKDET0_OUT            (pll_lock),
        .TILE0_PLLLKDET1_OUT            (),
        .TILE0_RESETDONE0_OUT           (),
        .TILE0_RESETDONE1_OUT           (),
        //--------------------- Receive Ports - 8b10b Decoder ----------------------
        .TILE0_RXCHARISCOMMA0_OUT       (),
        .TILE0_RXCHARISCOMMA1_OUT       (),
        .TILE0_RXCHARISK0_OUT           (kchar_o[1:0]),
        .TILE0_RXCHARISK1_OUT           (kchar_o[3:2]),
        .TILE0_RXDISPERR0_OUT           (),
        .TILE0_RXDISPERR1_OUT           (),
        .TILE0_RXNOTINTABLE0_OUT        (),
        .TILE0_RXNOTINTABLE1_OUT        (),
        //------------- Receive Ports - Comma Detection and Alignment --------------
//        .TILE0_RXBYTEISALIGNED0_OUT     (),
//        .TILE0_RXBYTEISALIGNED1_OUT     (),
//        .TILE0_RXCOMMADET0_OUT          (),
//        .TILE0_RXCOMMADET1_OUT          (),
        .TILE0_RXENMCOMMAALIGN0_IN      (1'b1),
        .TILE0_RXENMCOMMAALIGN1_IN      (1'b1),
        .TILE0_RXENPCOMMAALIGN0_IN      (1'b1),
        .TILE0_RXENPCOMMAALIGN1_IN      (1'b1),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .TILE0_RXDATA0_OUT              (data_o[15:0]),
        .TILE0_RXDATA1_OUT              (data_o[31:16]),
        .TILE0_RXUSRCLK0_IN             (CLK250),
        .TILE0_RXUSRCLK1_IN             (CLK250),
        .TILE0_RXUSRCLK20_IN            (CLK125),
        .TILE0_RXUSRCLK21_IN            (CLK125),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .TILE0_RXN0_IN                  (rxpin[1]),
        .TILE0_RXN1_IN                  (rxpin[3]),
        .TILE0_RXP0_IN                  (rxpin[0]),
        .TILE0_RXP1_IN                  (rxpin[2]),
        //------------- Receive Ports - RX Loss-of-sync State Machine --------------
        .TILE0_RXLOSSOFSYNC0_OUT        (),
        .TILE0_RXLOSSOFSYNC1_OUT        (),
        //-------------------------- TX/RX Datapath Ports --------------------------
        .TILE0_GTPCLKOUT0_OUT           (gtpclk_o),
        .TILE0_GTPCLKOUT1_OUT           (),
        //----------------- Transmit Ports - 8b10b Encoder Control -----------------
        .TILE0_TXCHARISK0_IN            ({1'b0, charisk_i[0]}),
        .TILE0_TXCHARISK1_IN            ({1'b0, charisk_i[1]}),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TILE0_TXDATA0_IN               (data_i[15:0]),
        .TILE0_TXDATA1_IN               (data_i[31:16]),
        .TILE0_TXUSRCLK0_IN             (CLK250),
        .TILE0_TXUSRCLK1_IN             (CLK250),
        .TILE0_TXUSRCLK20_IN            (CLK125),
        .TILE0_TXUSRCLK21_IN            (CLK125),
        //------------- Transmit Ports - TX Driver and OOB signalling --------------
        .TILE0_TXN0_OUT                 (txpin[1]),
        .TILE0_TXN1_OUT                 (txpin[3]),
        .TILE0_TXP0_OUT                 (txpin[0]),
        .TILE0_TXP1_OUT                 (txpin[2]),
    
        //_____________________________________________________________________
        //_____________________________________________________________________
        //TILE1  (X1_Y0)
 
        //---------------------- Loopback and Powerdown Ports ----------------------
        .TILE1_LOOPBACK0_IN             (3'b000),
        .TILE1_LOOPBACK1_IN             (3'b000),
        //------------------------------- PLL Ports --------------------------------
        .TILE1_CLK00_IN                 (refclk_i),
        .TILE1_CLK01_IN                 (refclk_i),
        .TILE1_GTPRESET0_IN             (1'b0),
        .TILE1_GTPRESET1_IN             (1'b0),
        .TILE1_PLLLKDET0_OUT            (),
        .TILE1_PLLLKDET1_OUT            (),
        .TILE1_RESETDONE0_OUT           (),
        .TILE1_RESETDONE1_OUT           (),
        //--------------------- Receive Ports - 8b10b Decoder ----------------------
        .TILE1_RXCHARISCOMMA0_OUT       (),
        .TILE1_RXCHARISCOMMA1_OUT       (),
        .TILE1_RXCHARISK0_OUT           (kchar_o[5:4]),
        .TILE1_RXCHARISK1_OUT           (kchar_o[7:6]),
        .TILE1_RXDISPERR0_OUT           (),
        .TILE1_RXDISPERR1_OUT           (),
        .TILE1_RXNOTINTABLE0_OUT        (),
        .TILE1_RXNOTINTABLE1_OUT        (),
        //------------- Receive Ports - Comma Detection and Alignment --------------
//        .TILE1_RXBYTEISALIGNED0_OUT     (),
//        .TILE1_RXBYTEISALIGNED1_OUT     (),
//        .TILE1_RXCOMMADET0_OUT          (),
//        .TILE1_RXCOMMADET1_OUT          (),
        .TILE1_RXENMCOMMAALIGN0_IN      (1'b1),
        .TILE1_RXENMCOMMAALIGN1_IN      (1'b1),
        .TILE1_RXENPCOMMAALIGN0_IN      (1'b1),
        .TILE1_RXENPCOMMAALIGN1_IN      (1'b1),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .TILE1_RXDATA0_OUT              (data_o[47:32]),
        .TILE1_RXDATA1_OUT              (data_o[63:48]),
        .TILE1_RXUSRCLK0_IN             (CLK250),
        .TILE1_RXUSRCLK1_IN             (CLK250),
        .TILE1_RXUSRCLK20_IN            (CLK125),
        .TILE1_RXUSRCLK21_IN            (CLK125),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .TILE1_RXN0_IN                  (rxpin[5]),
        .TILE1_RXN1_IN                  (rxpin[7]),
        .TILE1_RXP0_IN                  (rxpin[4]),
        .TILE1_RXP1_IN                  (rxpin[6]),
        //------------- Receive Ports - RX Loss-of-sync State Machine --------------
        .TILE1_RXLOSSOFSYNC0_OUT        (),
        .TILE1_RXLOSSOFSYNC1_OUT        (),
        //-------------------------- TX/RX Datapath Ports --------------------------
        .TILE1_GTPCLKOUT0_OUT           (),
        .TILE1_GTPCLKOUT1_OUT           (),
        //----------------- Transmit Ports - 8b10b Encoder Control -----------------
        .TILE1_TXCHARISK0_IN            ({1'b0, charisk_i[2]}),
        .TILE1_TXCHARISK1_IN            ({1'b0, charisk_i[3]}),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TILE1_TXDATA0_IN               (data_i[47:32]),
        .TILE1_TXDATA1_IN               (data_i[63:48]),
        .TILE1_TXUSRCLK0_IN             (CLK250),
        .TILE1_TXUSRCLK1_IN             (CLK250),
        .TILE1_TXUSRCLK20_IN            (CLK125),
        .TILE1_TXUSRCLK21_IN            (CLK125),
        //------------- Transmit Ports - TX Driver and OOB signalling --------------
        .TILE1_TXN0_OUT                 (txpin[5]),
        .TILE1_TXN1_OUT                 (txpin[7]),
        .TILE1_TXP0_OUT                 (txpin[4]),
        .TILE1_TXP1_OUT                 (txpin[6])
    );
    
    IBUFDS refclk_ibufds_i
    (
        .O                              (refclk_i),
        .I                              (clkpin[0]),  // Connect to package pin A10
        .IB                             (clkpin[1])   // Connect to package pin B10
    );

	 BUFIO2 #(
      .DIVIDE(1),             // DIVCLK divider (1,3-8)
      .DIVIDE_BYPASS("TRUE"), // Bypass the divider circuitry (TRUE/FALSE)
      .I_INVERT("FALSE"),     // Invert clock (TRUE/FALSE)
      .USE_DOUBLER("FALSE")   // Use doubler circuitry (TRUE/FALSE)
    )
    gtpclk_bufio2_i (
      .DIVCLK(bufclk_o),      // 1-bit output: Divided clock output
      .IOCLK(),           		// 1-bit output: I/O output clock
      .SERDESSTROBE(), 			// 1-bit output: Output SERDES strobe (connect to ISERDES2/OSERDES2)
      .I(gtpclk_o[0]) 		      // 1-bit input: Clock input (connect to IBUFG)
    );

    BUFG gtpclk_bufg_i (
       .O(gclk_o),   // 1-bit output: Clock buffer output
       .I(bufclk_o)  // 1-bit input: Clock buffer input
    );

	 assign gck_o = gclk_o;

	 DCM_SP #(
      .CLKDV_DIVIDE(2.0),                   // CLKDV divide value
                                            // (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
      .CLKFX_DIVIDE(WB_DIVIDE),             // Divide value on CLKFX outputs - D - (1-32)
      .CLKFX_MULTIPLY(WB_MULTIPLY),         // Multiply value on CLKFX outputs - M - (2-32)
      .CLKIN_DIVIDE_BY_2("FALSE"),          // CLKIN divide by two (TRUE/FALSE)
      .CLKIN_PERIOD(8.0),                   // Input clock period specified in nS
      .CLKOUT_PHASE_SHIFT("NONE"),          // Output phase shift (NONE, FIXED, VARIABLE)
      .CLK_FEEDBACK("1X"),                  // Feedback source (NONE, 1X, 2X)
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SYSTEM_SYNCHRNOUS or SOURCE_SYNCHRONOUS
      .DFS_FREQUENCY_MODE("LOW"),           // Unsupported - Do not change value
      .DLL_FREQUENCY_MODE("LOW"),           // Unsupported - Do not change value
      .DSS_MODE("NONE"),                    // Unsupported - Do not change value
      .DUTY_CYCLE_CORRECTION("TRUE"),       // Unsupported - Do not change value
      .FACTORY_JF(16'hc080),                // Unsupported - Do not change value
      .PHASE_SHIFT(0),                      // Amount of fixed phase shift (-255 to 255)
      .STARTUP_WAIT("FALSE")                // Delay config DONE until DCM_SP LOCKED (TRUE/FALSE)
    )
    UDCM (
      .CLK0(CLK125),       // 1-bit output: 0 degree clock output
      .CLK180(),     		// 1-bit output: 180 degree clock output
      .CLK270(),     		// 1-bit output: 270 degree clock output
      .CLK2X(CLK250),      // 1-bit output: 2X clock frequency clock output
      .CLK2X180(), 			// 1-bit output: 2X clock frequency, 180 degree clock output
      .CLK90(),       		// 1-bit output: 90 degree clock output
      .CLKDV(),       		// 1-bit output: Divided clock output
      .CLKFX(clkwb),   		// 1-bit output: Digital Frequency Synthesizer output (DFS)
      .CLKFX180(), 			// 1-bit output: 180 degree CLKFX output
      .LOCKED(locked),     // 1-bit output: DCM_SP Lock Output
      .PSDONE(),   		   // 1-bit output: Phase shift done output
      .STATUS(),     		// 8-bit output: DCM_SP status output
      .CLKFB(CLK125),      // 1-bit input: Clock feedback input
      .CLKIN(gclk_o),      // 1-bit input: Clock input
      .DSSEN(1'b0),       	// 1-bit input: Unsupported, specify to GND.
      .PSCLK(1'b0),       	// 1-bit input: Phase shift clock input
      .PSEN(1'b0),         // 1-bit input: Phase shift enable
      .PSINCDEC(1'b0), 		// 1-bit input: Phase shift increment/decrement input
      .RST(!pll_lock)      // 1-bit input: Active high reset input
    );

endmodule
