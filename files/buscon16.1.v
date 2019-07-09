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
`default_nettype none

`define NUM_DEVICE 5
`define BUS_DEVICE 4:0
`define ID_BOOTROM 3'd0
`define ID_TESTMEM 3'd1
`define ID_SHAREDMEM    3'd2
`define ID_UART    3'd3
`define ID_MRAM    3'd4

//`define DECODE_BOOTROM (Address[31:16]== 16'hbfc0) //change
`define DECODE_BOOTROM (32'hBFC0_0000 <= Address && Address < 32'hBFC0_0000 + 32'h0010_0000)
`define DECODE_TMEM    (32'h0000_0000 <= Address && Address < 32'h0000_0000 + 32'h0010_0000) 
`define DECODE_SHAREDMEM    (Address[31:16]== 16'h0020)
`define DECODE_UART    (Address[31:16]== 16'h0030)
`define DECODE_MRAM    (Address[31:16]== 16'h0100)

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
//
    ,
    input wire 	       UARTRxData, 
    output wire        UARTTxData
//
	/*
    ,
    input wire		MramClock,   // for extension
    output wire [17:0]	MramAddress, // 16bit word address
    output wire		MramE_,
    output wire		MramG_,
    output wire		MramW_,
    output wire	[1:0]	MramBEn_,
    input wire [15:0]	MramInData,
    output wire [15:0]	MramOutData,
    output wire		MramOutDataEn_
    */
//
    ,
     output wire reset_n,
     output wire cache_en,
     output wire tlb_en, 
     output wire bus_err,
     output wire nmi_n,
     output wire hard_int
     
     //bram rom interface port
     
     ,
     output wire [31:0] rom_addr,
     output wire [1:0] rom_ByteEnable,
     output wire rom_OEn,
     output wire rom_WEn,
     output wire [15:0] rom_WrData,
     output wire rom_en,
     input wire [15:0] rom_RdData
     
     // bram ram interface port
     ,
      output wire [31:0] ram_addr,
      output wire [1:0] ram_ByteEnable,
      output wire ram_OEn,
      output wire ram_WEn,
      output wire [15:0] ram_WrData,
      output wire ram_en,
      input wire [15:0] ram_RdData
	  
	  // bram shared mem interface port
	  ,
	  output wire [31:0] shared_addr,
      output wire [1:0] shared_ByteEnable,
      output wire shared_OEn,
      output wire shared_WEn,
      output wire [15:0] shared_WrData,
      output wire shared_en,
      input wire [15:0] shared_RdData
	  
);
    assign nmi_n = 1'b1;
    assign cache_en = 1'b1;
    assign tlb_en = 1'b0;
    assign bus_err = 1'b0;
    assign hard_int = 1'b0;
    
   
   reg [12:0] count;
   assign reset_n = &count;
   
   always @(posedge CoreClk or negedge Reset_) begin
       if(!Reset_) count <= 0;
       else if(~&count) count <= count+1;
   end

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
    wire [15:0]	RDataFromTMEM, RDataFromSHAREDMEM, RDataFromUART;
    wire [15:0]	RDataFromBootROM, RDataFromMRAM;
    assign BusErr = MonBusErr ;
    assign ModuleDecodes[`BUS_DEVICE] = {
		`DECODE_MRAM,        // 4
		`DECODE_UART,        // 3
		`DECODE_SHAREDMEM,        // 2
		`DECODE_TMEM,        // 1
		`DECODE_BOOTROM      // 0
	    } ;
   assign ModuleCapOneHWord[`BUS_DEVICE]   = `NUM_DEVICE'b11111;
   assign ModuleCapOneWord[`BUS_DEVICE]    = `NUM_DEVICE'b11111;
   assign ModuleCapBlock[`BUS_DEVICE]      = `NUM_DEVICE'b10111;
   assign ModuleCapWritables[`BUS_DEVICE]  = `NUM_DEVICE'b11111;
   assign ModuleCapReadDelays[`BUS_DEVICE] = `NUM_DEVICE'b00111;
   assign ModuleCapAutoReadys[`BUS_DEVICE] = `NUM_DEVICE'b11111;
   assign ModuleCapInterrupt[`BUS_DEVICE]  = `NUM_DEVICE'b01000;
   assign InD[15:0] = !ModStrobe ? 16'b0
			: ModuleDecodes[`ID_MRAM]    ? RDataFromMRAM
			: ModuleDecodes[`ID_UART]    ? RDataFromUART
			: ModuleDecodes[`ID_SHAREDMEM]    ? RDataFromSHAREDMEM
			: ModuleDecodes[`ID_TESTMEM] ? RDataFromTMEM
			: ModuleDecodes[`ID_BOOTROM] ? RDataFromBootROM
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
	       if(BusErr) begin
		  NextState = `BB_ERR; 
	       end else if(ModuleReady || ModulesAutoReady) begin
		  ModStrobe = 1'b1;
		  ModOE = 1'b1;
		  ModAutoReady = 1'b1;
		  if(IsAM1) begin
		     NextState = `BB_DONE;
		  end else begin
		     Increment = 1'b1;
		     if(ModulesReadDelay) begin
			ModAdd1 = 1'b1;
			ModSetHi = 1'b1;
		     end
		     NextState = `BR_TRANS;
		  end
	       end else if(!Strobe) begin
		  NextState = `BIDLE ;
	       end
	    end
	    `BR_TRANS: begin
	       ModOE = 1'b1;
	       ModStrobe = 1'b1;
	       ModSetHi = 1'b1;
	       if(IsAM2 || IsCountMax) begin
		  NextState = `BB_DONE;
	       end else begin
		  Increment = 1'b1;
	       end
	    end
	    `BW_WAIT: begin
	       ModWrite = 1'b1;
	       if(BusErr) begin
		  NextState = `BB_ERR;
	       end else if(ModuleReady || ModulesAutoReady) begin
		  ModStrobe = 1'b1;
		  ModAutoReady = 1'b1;
		  NextState = `BW_1ST;
	       end else if(!Strobe) begin
		  NextState = `BIDLE ;
	       end
	    end
	    `BW_1ST: begin
	       ModStrobe = 1'b1;
	       ModWrite = 1'b1;
	       if(!Strobe) begin
		  ModWE = 1'b1;
		  if(IsAM1) begin
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
    
    
    //ROM interface assign 
     
    assign rom_addr = Address[31:0];
    assign rom_ByteEnable = ByteEnable16[1:0];
    assign rom_OEn = ModuleOutEnables[`ID_BOOTROM];
    assign rom_WEn  = ModuleWriteEnables[`ID_BOOTROM];
    assign rom_WrData = OutDA[15:0];
    assign RDataFromBootROM[15:0] = rom_RdData;
    assign ModuleInterrupt[`ID_BOOTROM] = 1'b0;
    assign rom_en = ModuleEnables[`ID_BOOTROM];

    //RAM interface assign 

    assign ram_addr = Address[31:0];
    assign ram_ByteEnable = ByteEnable16[1:0];
    assign ram_OEn = ModuleOutEnables[`ID_TESTMEM];
    assign ram_WEn  = ModuleWriteEnables[`ID_TESTMEM];
    assign ram_WrData = OutDA[15:0];
    assign RDataFromTMEM[15:0] = ram_RdData;
    assign ModuleInterrupt[`ID_TESTMEM] = 1'b0;
    assign ram_en = ModuleEnables[`ID_TESTMEM];

	//shared mem assign

	assign shared_addr = Address[31:0];
    assign shared_ByteEnable = ByteEnable16[1:0];
    assign shared_OEn = ModuleOutEnables[`ID_SHAREDMEM];
    assign shared_WEn  = ModuleWriteEnables[`ID_SHAREDMEM];
    assign shared_WrData = OutDA[15:0];
    assign RDataFromSHAREDMEM[15:0] = shared_RdData;
    assign ModuleInterrupt[`ID_SHAREDMEM] = 1'b0;
    assign shared_en = ModuleEnables[`ID_SHAREDMEM];
	

    //assign RDataFromSHAREDMEM[15:0] = 0;
    //assign ModuleInterrupt[`ID_SHAREDMEM] = 1'b0;
    //assign ModuleReadys[`ID_SHAREDMEM] = 1'b0;

    UARTLiteBusCon16 UART16(
    	.Clk		(Clk),
	.Reset_		(Reset_),
	.Strobe		(ModuleEnables[`ID_UART]),
	.Address	(Address[31:0]),
	.ByteEn		(ByteEnable32[3:0]),
	.Mode16		(Mode[1:0]),
	.OEn		(ModuleOutEnables[`ID_UART]),
	.WEn		(ModuleWriteEnables[`ID_UART]),
	.WrData		(OutDA[15:0]),
	.RdData		(RDataFromUART[15:0]),
	.RxData		(UARTRxData),
	.TxData		(UARTTxData),
	.Interrupt      (ModuleInterrupt[`ID_UART])
    );
    assign ModuleReadys[`ID_UART] = 1'b0;
 
    assign ModuleInterrupt[`ID_MRAM] = 1'b0;
    assign ModuleReadys[`ID_MRAM] = 1'b0;


    assign MonBusErr = 1'b0;
    assign BusErrReady = 1'b0;	 

`default_nettype wire
endmodule
