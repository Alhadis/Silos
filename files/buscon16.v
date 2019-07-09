//
// For Geyser3CMACube chip
// 2011-12-30,31 2012-01-01 MN
// 2012-02-15 sakamoto 
// 2012-04-15 Mitaro Namiki  add bus bridge GLB16->GLB32
// 2012-04-23 sakamoto add RS232C fifo module
// 2012 05 21 sakamoto BusMode
//    BusMode   0  : use sp6 ram,sp6 rom,sp6 uart
//              1  : all bus sequence pass throught to FMC
// 2012-12-01,03,04 MN for test
// 2012-12-24 MN
// 2012-12-30 MN
//----
// 2016-10-31, 11-02--06,09--13,16,20 Geyser5
// 2016-11-17--19 MRAM
// 2016-12-14,18 MN init ROM
//----
// 2017-10-22 MN  add ModLast
// 2017-11-06.15 MN for test
// 2017-11-30 MN  20171130MN
// 2017-12-03 MN for AXI 
`default_nettype none

`define NUM_DEVICE 5
`define BUS_DEVICE 4:0
`define ID_BOOTROM  5'd0
`define ID_BOOTROMC 5'd1
`define ID_AXI      5'd2
`define ID_AXIC     5'd3
`define ID_AXIIO    5'd4

`define DECODE_BOOTROM  (Address[31:16]== 16'hbfc0)
`define DECODE_BOOTROMC (Address[31:16]== 16'h9fc0)
`define DECODE_AXI      (Address[31:20]== 12'ha00)
`define DECODE_AXIC     (Address[31:20]== 12'h800)
`define DECODE_AXIIO    (Address[31:16]== 16'hb880)

module BusController16 (
    input wire 	       Clk,     // I/O clock(1/2 CoreClk)  16bit side
    input wire 	       CoreClk, // original/core clock, unused
    input wire 	       Reset_,
    input wire 	       Strobe,
    input wire 	       Write,
    input wire 	       Block,
    input wire [3:0]   ByteEnable,
    input wire [15:0]  OutDA,
    output wire        Ready,
    output wire [15:0] InD,
    output wire        Interrupt
    , //
    input wire	       AXIClock,
    output wire        AXIARValid,
    input wire         AXIARReady,
    output wire [31:0] AXIARAddr, //
    output wire [3:0]  AXIARLen,   //
    output wire [2:0]  AXIARSize,  //
    output wire [1:0]  AXIARBurst, //
    input wire         AXIRValid,
    output wire        AXIRReady,
    input wire	       AXIRLast,
    input wire [31:0]  AXIRData, //
    input wire [1:0]   AXIRResp,
    //--
    output wire        AXIAWValid,
    input wire         AXIAWReady,
    output wire [31:0] AXIAWAddr, //
    output wire [3:0]  AXIAWLen,   //
    output wire [2:0]  AXIAWSize,  //
    output wire [1:0]  AXIAWBurst, //
    output wire        AXIWValid,
    input wire         AXIWReady,
    output wire	       AXIWLast,
    output wire [31:0] AXIWData, //
    output wire [3:0]  AXIWStrb,  //
    input wire         AXIBValid,
    output wire        AXIBReady,
    input wire [1:0]   AXIBResp
);
    wire BusErr;

    reg [3:0]	RegState, NextState;
`define BIDLE     4'b0000
`define BSETLO    4'b0001
`define BR_WAIT   4'b0100
`define BR_TRANS  4'b0101
`define BW_WAIT   4'b1000
`define BW_1ST    4'b1001
`define BW_TRANS  4'b1010
`define BB_ERR    4'b1110
`define BB_DONE   4'b1111
    reg [1:0]	RegMode;
`define AM_1 	  2'b01
`define AM_2 	  2'b10
`define AM_31     2'b11
    reg [4:0]	RegCount;
    reg		ModStrobe,ModWrite,ModOE,ModWE,ModHi,ModLo,ModAdd1,Increment;
    reg		ModLast; // 2017-10-22 MN
    wire [31:0]	Address;
    reg [31:0]	RegAddress;
    wire [1:0]	Mode;
    wire [1:0] 	ByteEnable16;
    reg [1:0]	RegByteEnable16;
    wire [3:0] 	ByteEnable32;
    reg 	ModSetHi, ModSetLo, ModAutoReady;
   
    wire	IsUpper, IsLower, IsOneHWord;
    wire	IsAM1, IsAM2, IsAM31, IsCountMax;
    wire 	ModulesAck, ModulesReadDelay;

    wire 	ModuleReady, ModulesAutoReady;
    wire	MonBusErr, BusErrReady;
    wire [`BUS_DEVICE] ModuleDecodes, 
		       ModuleEnables, ModuleEnablesTmp, ModuleReadys,
		       ModuleOutEnables, ModuleWriteEnables,
		       ModuleCapOneHWord, ModuleCapOneWord, ModuleCapBlock,
		       ModuleCapWritables, ModuleWritables, ModuleCaps,
		       ModuleCapReadDelays, ModuleCapAutoReadys,
		       ModuleInterrupt,ModuleCapInterrupt;

    assign ByteEnable32[3:0] = (ByteEnable[3:0] == 4'b0000) ?
			       4'b1111 : ByteEnable[3:0];
    assign IsUpper = (ByteEnable32[3:0] == 4'b0100 
			|| ByteEnable32[3:0] == 4'b1000 
			|| ByteEnable32[3:0] == 4'b1100) ;
    assign IsLower = (ByteEnable32[3:0] == 4'b0001
			|| ByteEnable32[3:0] == 4'b0010 
			|| ByteEnable32[3:0] == 4'b0011) ;
    assign IsOneHWord = IsUpper || IsLower ;
    assign ByteEnable16[1:0] = ModSetHi ? ByteEnable32[3:2]
                               : ModSetLo  ? ByteEnable32[1:0]
                               : RegByteEnable16[1:0];
    assign Mode = !ModLo ? RegMode
		  : Block ? `AM_31
		  : IsOneHWord ? `AM_1
		  : `AM_2 ;
    assign IsAM1 = (Mode == `AM_1) ;
    assign IsAM2 = (Mode == `AM_2) ;
    assign IsAM31 = (Mode == `AM_31) ;
    assign IsCountMax = (RegCount == 31);
    assign Address[31:0] =
    	   ModHi ? {OutDA[15:0],RegAddress[15:0]}
	   : ModLo ? {RegAddress[31:16],OutDA[15:6],
                      Block ? 5'b0 : {OutDA[5:2], IsUpper}, 
		      1'b0}
	   : ModAdd1 ? (RegAddress[31:0]+32'd2)
	   : RegAddress;
    
    // check the modules
    assign ModulesAck = |ModuleEnablesTmp[`BUS_DEVICE];
    assign ModuleEnablesTmp[`BUS_DEVICE] = 
		ModuleDecodes[`BUS_DEVICE]
                & ModuleCaps[`BUS_DEVICE]
                & ModuleWritables[`BUS_DEVICE];
    assign ModuleCaps[`BUS_DEVICE] = 
		(ModuleCapOneHWord & {`NUM_DEVICE{IsAM1}})
		| (ModuleCapOneWord & {`NUM_DEVICE{IsAM2}})
		| (ModuleCapBlock   & {`NUM_DEVICE{IsAM31}}) ;
    assign ModuleWritables[`BUS_DEVICE] =
                {`NUM_DEVICE{~Write}}
	        | (ModuleCapWritables & {`NUM_DEVICE{Write}});
    assign ModulesReadDelay = |(ModuleDecodes[`BUS_DEVICE] 
                                & ModuleCapReadDelays[`BUS_DEVICE]);
    assign ModulesAutoReady = |(ModuleDecodes[`BUS_DEVICE] 
                                & ModuleCapAutoReadys[`BUS_DEVICE]);
    //
    assign Interrupt = |(ModuleInterrupt[`BUS_DEVICE]
                         & ModuleCapInterrupt[`BUS_DEVICE]);
    assign ModuleEnables[`BUS_DEVICE] = 
		ModuleDecodes[`BUS_DEVICE] & {`NUM_DEVICE{ModStrobe}};
    assign ModuleReady = 
		|(ModuleReadys[`BUS_DEVICE] & ModuleDecodes[`BUS_DEVICE]);
    assign Ready = ModuleReady || ModAutoReady || BusErrReady;
    assign ModuleOutEnables[`BUS_DEVICE] = 
		ModuleDecodes[`BUS_DEVICE] & {`NUM_DEVICE{ModOE}} ;
    assign ModuleWriteEnables[`BUS_DEVICE] = 
		ModuleDecodes[`BUS_DEVICE]  & {`NUM_DEVICE{ModWE}} ;
    
    //------------------------------------------------------------
    wire [15:0]	RDataFromBootROM, RDataFromAXI;
    assign BusErr = MonBusErr ;
    assign ModuleDecodes[`BUS_DEVICE] = {
		`DECODE_AXIIO,       // 4
		`DECODE_AXIC,        // 3
		`DECODE_AXI,         // 2
		`DECODE_BOOTROMC,    // 1
		`DECODE_BOOTROM      // 0
	    } ;
   assign ModuleCapOneHWord[`BUS_DEVICE]   = `NUM_DEVICE'b11111;
   assign ModuleCapOneWord[`BUS_DEVICE]    = `NUM_DEVICE'b11111;
   assign ModuleCapBlock[`BUS_DEVICE]      = `NUM_DEVICE'b01010;
   assign ModuleCapWritables[`BUS_DEVICE]  = `NUM_DEVICE'b11100;
   assign ModuleCapReadDelays[`BUS_DEVICE] = `NUM_DEVICE'b00011;
   assign ModuleCapAutoReadys[`BUS_DEVICE] = `NUM_DEVICE'b00011;
   assign ModuleCapInterrupt[`BUS_DEVICE]  = `NUM_DEVICE'b00000;
   wire AXIDecodes = ModuleDecodes[`ID_AXI] | ModuleDecodes[`ID_AXIC] 
		   | ModuleDecodes[`ID_AXIIO]  ;
   wire ROMDecodes = ModuleDecodes[`ID_BOOTROM] | ModuleDecodes[`ID_BOOTROMC];
   assign InD[15:0] = !ModStrobe ? 16'b0
			: AXIDecodes ? RDataFromAXI
			: ROMDecodes ? RDataFromBootROM
			: 16'b0;
    //------------------------------------------------------------

    always @(posedge Clk or negedge Reset_) begin
       if(!Reset_) begin
	  RegState <= `BIDLE;
	  RegMode <= 0; 
	  RegCount <= 0;
	  RegAddress <= 0;
	  RegByteEnable16 <= 0;
       end else begin
	  RegState <= NextState;
	  RegMode <= Mode;
	  RegByteEnable16 <= ByteEnable16;
	  if(Increment) begin
	     RegCount <= RegCount + 5'b1;
	     RegAddress[31:0] <= Address[31:0] + 32'd2;
	  end else begin
	     RegCount <= 5'b0;
	     RegAddress <= Address;
	  end
       end
    end // always

    always @(*) begin
       NextState = RegState;
       ModStrobe = 1'b0;
       ModWrite = 1'b0;
       ModOE = 1'b0; ModWE = 1'b0;
       ModHi = 1'b0; ModLo = 1'b0;
       ModAdd1 = 1'b0;
       ModSetHi = 1'b0; ModSetLo = 1'b0; ModAutoReady = 1'b0;
       Increment = 1'b0;
       ModLast = 1'b0; // 2017-10-22
       if(!Reset_) begin
	  NextState = `BIDLE;
       end else begin
	  case (RegState)
	    `BIDLE: begin
	       if(Strobe) begin
		  ModHi = 1'b1;
		  NextState = `BSETLO;
	       end
	    end
	    `BSETLO: begin
	       ModLo = 1'b1;
	       if(!ModulesAck) begin // decode && write && type
		  NextState = `BB_DONE;
	       end else begin
		  ModStrobe = 1'b1;
		  ModWrite = Write;
		  {ModSetHi,ModSetLo} = IsUpper ? 2'b10 : 2'b01;
		  NextState = Write ? `BW_WAIT : `BR_WAIT;
	       end
	    end
	    `BR_WAIT: begin
	       ModStrobe = 1'b1; // 20171130MN
	       if(BusErr) begin
		  ModStrobe = 1'b0; // 20171130MN
		  NextState = `BB_ERR; 
	       end else if(ModuleReady || ModulesAutoReady) begin
		  // ModStrobe = 1'b1; 20171130MN
		  ModOE = 1'b1;
		  ModAutoReady = 1'b1;
		  if(IsAM1) begin
		     NextState = `BB_DONE;
		     ModLast = 1'b1; // 2017-10-22 MN
		  end else begin
		     Increment = 1'b1;
		     if(ModulesReadDelay) begin
			ModAdd1 = 1'b1;
			ModSetHi = 1'b1;
		     end
		     NextState = `BR_TRANS;
		  end
	       end else if(!Strobe) begin
		  ModStrobe = 1'b0; // 20171130MN
		  NextState = `BIDLE ;
	       end 
	    end
	    `BR_TRANS: begin
	       ModOE = 1'b1;
	       ModStrobe = 1'b1;
	       ModSetHi = 1'b1;
	       if(IsAM2 || IsCountMax) begin
		  ModLast = 1'b1; // 2017-10-22 MN
		  NextState = `BB_DONE;
	       end else begin
		  Increment = 1'b1;
	       end
	    end
	    `BW_WAIT: begin
	       ModWrite = 1'b1;
	       ModStrobe = 1'b1; // 20171130MN
	       if(BusErr) begin
	          ModStrobe = 1'b0; // 20171130MN
		  NextState = `BB_ERR;
	       end else if(ModuleReady || ModulesAutoReady) begin
		  // ModStrobe = 1'b1; 20171130MN
		  ModAutoReady = 1'b1;
		  NextState = `BW_1ST;
	       end else if(!Strobe) begin
	          ModStrobe = 1'b0; // 20171130MN
		  NextState = `BIDLE ;
	       end
	    end
	    `BW_1ST: begin
	       ModStrobe = 1'b1;
	       ModWrite = 1'b1;
	       if(!Strobe) begin
		  ModWE = 1'b1;
		  if(IsAM1) begin
		     ModLast = 1'b1; // 2017-10-22 MN
		     NextState = `BIDLE;
		  end else begin
		     Increment = 1'b1;
		     NextState = `BW_TRANS;
		  end
	       end
	    end
	    `BW_TRANS: begin
	       ModStrobe = 1'b1;
	       ModWE = 1'b1;
	       ModWrite = 1'b1;
	       ModSetHi = 1'b1;
	       if(IsAM2 || IsCountMax) begin
		  ModLast = 1'b1; // 2017-10-22 MN
		  NextState = `BIDLE;
	       end else begin
		  Increment = 1'b1;
	       end
	    end
	    `BB_ERR: begin
	       if(BusErrReady)
		 NextState = `BB_DONE ;
	    end
	    `BB_DONE: begin
	       if(!Strobe)
		 NextState = `BIDLE ;
	    end
	  endcase
       end // if(!Reset_)
    end // always @(posedge Clk

    //----------------------------------------------------------------
    B16BootROM BRAMBootROM16(
    	.Clock(Clk),
	.Reset_(Reset_),
	.Strobe(ModuleEnables[`ID_BOOTROM] | ModuleEnables[`ID_BOOTROMC]),
	.Address(Address[31:0]),
	.OEn(ModuleOutEnables[`ID_BOOTROM] | ModuleOutEnables[`ID_BOOTROMC]),
	.ByteEn(ByteEnable16[1:0]),
	.RdData(RDataFromBootROM[15:0])
    );
    assign ModuleInterrupt[`ID_BOOTROM] = 1'b0;
    assign ModuleReadys[`ID_BOOTROM] = 1'b0;
    assign ModuleInterrupt[`ID_BOOTROMC] = 1'b0;
    assign ModuleReadys[`ID_BOOTROMC] = 1'b0;
    
    wire AXIEnables = ModuleEnables[`ID_AXI] | ModuleEnables[`ID_AXIC]
    	 	    | ModuleEnables[`ID_AXIIO] ;
    wire BC16OEn = ModuleOutEnables[`ID_AXI] | ModuleOutEnables[`ID_AXIC]
    	 	 | ModuleOutEnables[`ID_AXIIO] ;
    wire BC16WEn = ModuleWriteEnables[`ID_AXI] | ModuleWriteEnables[`ID_AXIC]
    	 	 | ModuleWriteEnables[`ID_AXIIO] ;
    wire BC16Ready ;
    assign ModuleReadys[`ID_AXI] = BC16Ready;
    assign ModuleReadys[`ID_AXIC] = BC16Ready;
    assign ModuleReadys[`ID_AXIIO] = BC16Ready;
    assign ModuleInterrupt[`ID_AXI] = 1'b0;
    assign ModuleInterrupt[`ID_AXIC] = 1'b0;
    assign ModuleInterrupt[`ID_AXIIO] = 1'b0;
    assign MonBusErr = 1'b0;
    assign BusErrReady = 1'b0;
    BUS16AXI32CONTROL B16AXI32 (
        .Reset_(Reset_),
	.BC16Clock(Clk),
        .BC16Strobe(AXIEnables),
	.BC16Address(Address[31:0]),
	.BC16WrData(OutDA[15:0]),
	.BC16RdData(RDataFromAXI[15:0]),
	.BC16Mode(Mode),
	.BC16Write(ModWrite),
	.BC16Last(ModLast),
	.BC16Ready(BC16Ready),
	.BC16BErr(),
	.BC16OEn(BC16OEn),
	.BC16WEn(BC16WEn),
	.BC16Upper(IsUpper),
	.BC16Lower(IsLower),
	.BC16ByteEn32(ByteEnable),
	.AXIClock(AXIClock),
        .AXIARValid(AXIARValid),
	.AXIARReady(AXIARReady),
	.AXIARAddr(AXIARAddr),
	.AXIARLen(AXIARLen),
	.AXIARSize(AXIARSize),
	.AXIARBurst(AXIARBurst),
        .AXIRValid(AXIRValid),
        .AXIRReady(AXIRReady),
	.AXIRLast(AXIRLast),
	.AXIRData(AXIRData),
	.AXIRResp(AXIRResp),
	.AXIAWValid(AXIAWValid),
        .AXIAWReady(AXIAWReady),
	.AXIAWAddr(AXIAWAddr),
	.AXIAWLen(AXIAWLen),
	.AXIAWSize(AXIAWSize),
	.AXIAWBurst(AXIAWBurst),
        .AXIWValid(AXIWValid),
	.AXIWReady(AXIWReady),
	.AXIWLast(AXIWLast),
	.AXIWData(AXIWData),
	.AXIWStrb(AXIWStrb),
	.AXIBValid(AXIBValid),
	.AXIBReady(AXIBReady),
	.AXIBResp(AXIBResp)
    );
				       
//`default_nettype 
endmodule
