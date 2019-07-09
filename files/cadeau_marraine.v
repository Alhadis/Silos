// ======================================================================
// cadeau_marraine.v generated from TopDesign.cysch
// 11/08/2014 at 11:42
// This file is auto generated. ANY EDITS YOU MAKE MAY BE LOST WHEN THIS FILE IS REGENERATED!!!
// ======================================================================

/* -- WARNING: The following section of defines are deprecated and will be removed in a future release -- */
`define CYDEV_CHIP_DIE_LEOPARD 1
`define CYDEV_CHIP_REV_LEOPARD_PRODUCTION 3
`define CYDEV_CHIP_REV_LEOPARD_ES3 3
`define CYDEV_CHIP_REV_LEOPARD_ES2 1
`define CYDEV_CHIP_REV_LEOPARD_ES1 0
`define CYDEV_CHIP_DIE_PSOC4A 2
`define CYDEV_CHIP_REV_PSOC4A_PRODUCTION 17
`define CYDEV_CHIP_REV_PSOC4A_ES0 17
`define CYDEV_CHIP_DIE_PANTHER 3
`define CYDEV_CHIP_REV_PANTHER_PRODUCTION 1
`define CYDEV_CHIP_REV_PANTHER_ES1 1
`define CYDEV_CHIP_REV_PANTHER_ES0 0
`define CYDEV_CHIP_DIE_PSOC5LP 4
`define CYDEV_CHIP_REV_PSOC5LP_PRODUCTION 0
`define CYDEV_CHIP_REV_PSOC5LP_ES0 0
`define CYDEV_CHIP_DIE_EXPECT 2
`define CYDEV_CHIP_REV_EXPECT 17
`define CYDEV_CHIP_DIE_ACTUAL 2
/* -- WARNING: The previous section of defines are deprecated and will be removed in a future release -- */
`define CYDEV_CHIP_FAMILY_UNKNOWN 0
`define CYDEV_CHIP_MEMBER_UNKNOWN 0
`define CYDEV_CHIP_FAMILY_PSOC3 1
`define CYDEV_CHIP_MEMBER_3A 1
`define CYDEV_CHIP_REVISION_3A_PRODUCTION 3
`define CYDEV_CHIP_REVISION_3A_ES3 3
`define CYDEV_CHIP_REVISION_3A_ES2 1
`define CYDEV_CHIP_REVISION_3A_ES1 0
`define CYDEV_CHIP_FAMILY_PSOC4 2
`define CYDEV_CHIP_MEMBER_4A 2
`define CYDEV_CHIP_REVISION_4A_PRODUCTION 17
`define CYDEV_CHIP_REVISION_4A_ES0 17
`define CYDEV_CHIP_MEMBER_4D 3
`define CYDEV_CHIP_REVISION_4D_PRODUCTION 0
`define CYDEV_CHIP_REVISION_4D_ES0 0
`define CYDEV_CHIP_FAMILY_PSOC5 3
`define CYDEV_CHIP_MEMBER_5A 4
`define CYDEV_CHIP_REVISION_5A_PRODUCTION 1
`define CYDEV_CHIP_REVISION_5A_ES1 1
`define CYDEV_CHIP_REVISION_5A_ES0 0
`define CYDEV_CHIP_MEMBER_5B 5
`define CYDEV_CHIP_REVISION_5B_PRODUCTION 0
`define CYDEV_CHIP_REVISION_5B_ES0 0
`define CYDEV_CHIP_FAMILY_USED 2
`define CYDEV_CHIP_MEMBER_USED 2
`define CYDEV_CHIP_REVISION_USED 17
// CharLCD_v2_0(ConversionRoutines=true, CUSTOM0=0,E,8,8,8,E,0, CUSTOM1=0,A,A,4,4,4,0, CUSTOM2=0,E,A,E,8,8,0, CUSTOM3=0,E,A,C,A,A,0, CUSTOM4=0,E,8,C,8,E,0, CUSTOM5=0,E,8,E,2,E,0, CUSTOM6=0,E,8,E,2,E,0, CUSTOM7=0,4,4,4,0,4,0, CustomCharacterSet=0, TypeReplacementString=uint32, CY_COMPONENT_NAME=CharLCD_v2_0, CY_CONTROL_FILE=<:default:>, CY_FITTER_NAME=LCD_Char_1, CY_INSTANCE_SHORT_NAME=LCD_Char_1, CY_MAJOR_VERSION=2, CY_MINOR_VERSION=0, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=cydsfit No Version Information Found, INSTANCE_NAME=LCD_Char_1, )
module CharLCD_v2_0_0 ;



	wire [6:0] tmpOE__LCDPort_net;
	wire [6:0] tmpFB_6__LCDPort_net;
	wire [6:0] tmpIO_6__LCDPort_net;
	wire [0:0] tmpINTERRUPT_0__LCDPort_net;
	electrical [0:0] tmpSIOVREF__LCDPort_net;

	cy_psoc3_pins_v1_10
		#(.id("5d7669ae-5f32-40b5-9c5a-1eda1fc21044/ed092b9b-d398-4703-be89-cebf998501f6"),
		  .drive_mode(21'b110_110_110_110_110_110_110),
		  .ibuf_enabled(7'b1_1_1_1_1_1_1),
		  .init_dr_st(7'b0_0_0_0_0_0_0),
		  .input_clk_en(0),
		  .input_sync(7'b1_1_1_1_1_1_1),
		  .input_sync_mode(7'b0_0_0_0_0_0_0),
		  .intr_mode(14'b00_00_00_00_00_00_00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(",,,,,,"),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(7'b0_0_0_0_0_0_0),
		  .oe_reset(0),
		  .oe_sync(7'b0_0_0_0_0_0_0),
		  .output_clk_en(0),
		  .output_clock_mode(7'b0_0_0_0_0_0_0),
		  .output_conn(7'b0_0_0_0_0_0_0),
		  .output_mode(7'b0_0_0_0_0_0_0),
		  .output_reset(0),
		  .output_sync(7'b0_0_0_0_0_0_0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(",,,,,,"),
		  .pin_mode("OOOOOOO"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(7'b0_0_0_0_0_0_0),
		  .sio_ibuf(""),
		  .sio_info(14'b00_00_00_00_00_00_00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(7'b0_0_0_0_0_0_0),
		  .spanning(0),
		  .use_annotation(7'b0_0_0_0_0_0_0),
		  .vtrip(14'b10_10_10_10_10_10_10),
		  .width(7))
		LCDPort
		 (.oe(tmpOE__LCDPort_net),
		  .y({7'b0}),
		  .fb({tmpFB_6__LCDPort_net[6:0]}),
		  .io({tmpIO_6__LCDPort_net[6:0]}),
		  .siovref(tmpSIOVREF__LCDPort_net),
		  .interrupt({tmpINTERRUPT_0__LCDPort_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__LCDPort_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{7'b1111111} : {7'b1111111};



endmodule

// TCPWM_P4_v1_10(PWMCompare=0, PWMCompareBuf=65535, PWMCompareSwap=0, PWMCountMode=3, PWMCountPresent=false, PWMDeadTimeCycle=0, PWMInterruptMask=1, PWMKillEvent=0, PWMLinenSignal=0, PWMLineSignal=0, PWMMode=4, PWMPeriod=10000, PWMPeriodBuf=65535, PWMPeriodSwap=0, PWMPrescaler=0, PWMReloadMode=0, PWMReloadPresent=false, PWMRunMode=0, PWMSetAlign=0, PWMStartMode=0, PWMStartPresent=false, PWMStopEvent=0, PWMStopMode=0, PWMStopPresent=false, PWMSwitchMode=0, PWMSwitchPresent=false, QuadEncodingModes=0, QuadIndexMode=0, QuadIndexPresent=false, QuadInterruptMask=1, QuadPhiAMode=3, QuadPhiBMode=3, QuadStopMode=0, QuadStopPresent=false, TCCaptureMode=0, TCCapturePresent=false, TCCompare=65535, TCCompareBuf=65535, TCCompareSwap=0, TCCompCapMode=2, TCCountingModes=0, TCCountMode=3, TCCountPresent=false, TCInterruptMask=1, TCPeriod=65535, TCPrescaler=0, TCPWMCapturePresent=false, TCPWMConfig=7, TCPWMCountPresent=false, TCPWMReloadPresent=false, TCPWMStartPresent=false, TCPWMStopPresent=false, TCReloadMode=0, TCReloadPresent=false, TCRunMode=0, TCStartMode=0, TCStartPresent=false, TCStopMode=0, TCStopPresent=false, CY_COMPONENT_NAME=TCPWM_P4_v1_10, CY_CONTROL_FILE=<:default:>, CY_FITTER_NAME=PWM_1, CY_INSTANCE_SHORT_NAME=PWM_1, CY_MAJOR_VERSION=1, CY_MINOR_VERSION=10, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=cydsfit No Version Information Found, INSTANCE_NAME=PWM_1, )
module TCPWM_P4_v1_10_1 (
    stop,
    count,
    reload,
    start,
    capture,
    interrupt,
    ov,
    un,
    cc,
    clock,
    line,
    line_n);
    input       stop;
    input       count;
    input       reload;
    input       start;
    input       capture;
    output      interrupt;
    output      ov;
    output      un;
    output      cc;
    input       clock;
    output      line;
    output      line_n;

    parameter PWMCountMode = 3;
    parameter PWMReloadMode = 0;
    parameter PWMReloadPresent = 0;
    parameter PWMStartMode = 0;
    parameter PWMStopMode = 0;
    parameter PWMSwitchMode = 0;
    parameter QuadIndexMode = 0;
    parameter QuadPhiAMode = 3;
    parameter QuadPhiBMode = 3;
    parameter QuadStopMode = 0;
    parameter TCCaptureMode = 0;
    parameter TCCountMode = 3;
    parameter TCReloadMode = 0;
    parameter TCStartMode = 0;
    parameter TCStopMode = 0;


    cy_m0s8_tcpwm_v1_0 cy_m0s8_tcpwm_1 (
        .capture(capture),
        .underflow(un),
        .overflow(ov),
        .line_out_compl(line_n),
        .line_out(line),
        .compare_match(cc),
        .interrupt(interrupt),
        .count(count),
        .reload(reload),
        .stop(stop),
        .start(start),
        .clock(clock));



endmodule

// TCPWM_P4_v1_10(PWMCompare=0, PWMCompareBuf=65535, PWMCompareSwap=0, PWMCountMode=3, PWMCountPresent=false, PWMDeadTimeCycle=0, PWMInterruptMask=1, PWMKillEvent=0, PWMLinenSignal=0, PWMLineSignal=0, PWMMode=4, PWMPeriod=10000, PWMPeriodBuf=65535, PWMPeriodSwap=0, PWMPrescaler=0, PWMReloadMode=0, PWMReloadPresent=false, PWMRunMode=0, PWMSetAlign=0, PWMStartMode=0, PWMStartPresent=false, PWMStopEvent=0, PWMStopMode=0, PWMStopPresent=false, PWMSwitchMode=0, PWMSwitchPresent=false, QuadEncodingModes=0, QuadIndexMode=0, QuadIndexPresent=false, QuadInterruptMask=1, QuadPhiAMode=3, QuadPhiBMode=3, QuadStopMode=0, QuadStopPresent=false, TCCaptureMode=0, TCCapturePresent=false, TCCompare=65535, TCCompareBuf=65535, TCCompareSwap=0, TCCompCapMode=2, TCCountingModes=0, TCCountMode=3, TCCountPresent=false, TCInterruptMask=1, TCPeriod=65535, TCPrescaler=0, TCPWMCapturePresent=false, TCPWMConfig=7, TCPWMCountPresent=false, TCPWMReloadPresent=false, TCPWMStartPresent=false, TCPWMStopPresent=false, TCReloadMode=0, TCReloadPresent=false, TCRunMode=0, TCStartMode=0, TCStartPresent=false, TCStopMode=0, TCStopPresent=false, CY_COMPONENT_NAME=TCPWM_P4_v1_10, CY_CONTROL_FILE=<:default:>, CY_FITTER_NAME=PWM_2, CY_INSTANCE_SHORT_NAME=PWM_2, CY_MAJOR_VERSION=1, CY_MINOR_VERSION=10, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=cydsfit No Version Information Found, INSTANCE_NAME=PWM_2, )
module TCPWM_P4_v1_10_2 (
    stop,
    count,
    reload,
    start,
    capture,
    interrupt,
    ov,
    un,
    cc,
    clock,
    line,
    line_n);
    input       stop;
    input       count;
    input       reload;
    input       start;
    input       capture;
    output      interrupt;
    output      ov;
    output      un;
    output      cc;
    input       clock;
    output      line;
    output      line_n;

    parameter PWMCountMode = 3;
    parameter PWMReloadMode = 0;
    parameter PWMReloadPresent = 0;
    parameter PWMStartMode = 0;
    parameter PWMStopMode = 0;
    parameter PWMSwitchMode = 0;
    parameter QuadIndexMode = 0;
    parameter QuadPhiAMode = 3;
    parameter QuadPhiBMode = 3;
    parameter QuadStopMode = 0;
    parameter TCCaptureMode = 0;
    parameter TCCountMode = 3;
    parameter TCReloadMode = 0;
    parameter TCStartMode = 0;
    parameter TCStopMode = 0;


    cy_m0s8_tcpwm_v1_0 cy_m0s8_tcpwm_1 (
        .capture(capture),
        .underflow(un),
        .overflow(ov),
        .line_out_compl(line_n),
        .line_out(line),
        .compare_match(cc),
        .interrupt(interrupt),
        .count(count),
        .reload(reload),
        .stop(stop),
        .start(start),
        .clock(clock));



endmodule

// TCPWM_P4_v1_10(PWMCompare=0, PWMCompareBuf=65535, PWMCompareSwap=0, PWMCountMode=3, PWMCountPresent=false, PWMDeadTimeCycle=0, PWMInterruptMask=1, PWMKillEvent=0, PWMLinenSignal=0, PWMLineSignal=0, PWMMode=4, PWMPeriod=10000, PWMPeriodBuf=65535, PWMPeriodSwap=0, PWMPrescaler=0, PWMReloadMode=0, PWMReloadPresent=false, PWMRunMode=0, PWMSetAlign=0, PWMStartMode=0, PWMStartPresent=false, PWMStopEvent=0, PWMStopMode=0, PWMStopPresent=false, PWMSwitchMode=0, PWMSwitchPresent=false, QuadEncodingModes=0, QuadIndexMode=0, QuadIndexPresent=false, QuadInterruptMask=1, QuadPhiAMode=3, QuadPhiBMode=3, QuadStopMode=0, QuadStopPresent=false, TCCaptureMode=0, TCCapturePresent=false, TCCompare=65535, TCCompareBuf=65535, TCCompareSwap=0, TCCompCapMode=2, TCCountingModes=0, TCCountMode=3, TCCountPresent=false, TCInterruptMask=1, TCPeriod=65535, TCPrescaler=0, TCPWMCapturePresent=false, TCPWMConfig=7, TCPWMCountPresent=false, TCPWMReloadPresent=false, TCPWMStartPresent=false, TCPWMStopPresent=false, TCReloadMode=0, TCReloadPresent=false, TCRunMode=0, TCStartMode=0, TCStartPresent=false, TCStopMode=0, TCStopPresent=false, CY_COMPONENT_NAME=TCPWM_P4_v1_10, CY_CONTROL_FILE=<:default:>, CY_FITTER_NAME=PWM_3, CY_INSTANCE_SHORT_NAME=PWM_3, CY_MAJOR_VERSION=1, CY_MINOR_VERSION=10, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=cydsfit No Version Information Found, INSTANCE_NAME=PWM_3, )
module TCPWM_P4_v1_10_3 (
    stop,
    count,
    reload,
    start,
    capture,
    interrupt,
    ov,
    un,
    cc,
    clock,
    line,
    line_n);
    input       stop;
    input       count;
    input       reload;
    input       start;
    input       capture;
    output      interrupt;
    output      ov;
    output      un;
    output      cc;
    input       clock;
    output      line;
    output      line_n;

    parameter PWMCountMode = 3;
    parameter PWMReloadMode = 0;
    parameter PWMReloadPresent = 0;
    parameter PWMStartMode = 0;
    parameter PWMStopMode = 0;
    parameter PWMSwitchMode = 0;
    parameter QuadIndexMode = 0;
    parameter QuadPhiAMode = 3;
    parameter QuadPhiBMode = 3;
    parameter QuadStopMode = 0;
    parameter TCCaptureMode = 0;
    parameter TCCountMode = 3;
    parameter TCReloadMode = 0;
    parameter TCStartMode = 0;
    parameter TCStopMode = 0;


    cy_m0s8_tcpwm_v1_0 cy_m0s8_tcpwm_1 (
        .capture(capture),
        .underflow(un),
        .overflow(ov),
        .line_out_compl(line_n),
        .line_out(line),
        .compare_match(cc),
        .interrupt(interrupt),
        .count(count),
        .reload(reload),
        .stop(stop),
        .start(start),
        .clock(clock));



endmodule

// TCPWM_P4_v1_10(PWMCompare=0, PWMCompareBuf=65535, PWMCompareSwap=0, PWMCountMode=3, PWMCountPresent=false, PWMDeadTimeCycle=0, PWMInterruptMask=1, PWMKillEvent=0, PWMLinenSignal=0, PWMLineSignal=0, PWMMode=4, PWMPeriod=10000, PWMPeriodBuf=65535, PWMPeriodSwap=0, PWMPrescaler=0, PWMReloadMode=0, PWMReloadPresent=false, PWMRunMode=0, PWMSetAlign=0, PWMStartMode=0, PWMStartPresent=false, PWMStopEvent=0, PWMStopMode=0, PWMStopPresent=false, PWMSwitchMode=0, PWMSwitchPresent=false, QuadEncodingModes=0, QuadIndexMode=0, QuadIndexPresent=false, QuadInterruptMask=1, QuadPhiAMode=3, QuadPhiBMode=3, QuadStopMode=0, QuadStopPresent=false, TCCaptureMode=0, TCCapturePresent=false, TCCompare=65535, TCCompareBuf=65535, TCCompareSwap=0, TCCompCapMode=2, TCCountingModes=0, TCCountMode=3, TCCountPresent=false, TCInterruptMask=1, TCPeriod=60000, TCPrescaler=0, TCPWMCapturePresent=false, TCPWMConfig=1, TCPWMCountPresent=false, TCPWMReloadPresent=false, TCPWMStartPresent=false, TCPWMStopPresent=false, TCReloadMode=0, TCReloadPresent=false, TCRunMode=0, TCStartMode=0, TCStartPresent=false, TCStopMode=0, TCStopPresent=false, CY_COMPONENT_NAME=TCPWM_P4_v1_10, CY_CONTROL_FILE=<:default:>, CY_FITTER_NAME=TIM_4, CY_INSTANCE_SHORT_NAME=TIM_4, CY_MAJOR_VERSION=1, CY_MINOR_VERSION=10, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=cydsfit No Version Information Found, INSTANCE_NAME=TIM_4, )
module TCPWM_P4_v1_10_4 (
    stop,
    count,
    reload,
    start,
    capture,
    interrupt,
    ov,
    un,
    cc,
    clock,
    line,
    line_n);
    input       stop;
    input       count;
    input       reload;
    input       start;
    input       capture;
    output      interrupt;
    output      ov;
    output      un;
    output      cc;
    input       clock;
    output      line;
    output      line_n;

    parameter PWMCountMode = 3;
    parameter PWMReloadMode = 0;
    parameter PWMReloadPresent = 0;
    parameter PWMStartMode = 0;
    parameter PWMStopMode = 0;
    parameter PWMSwitchMode = 0;
    parameter QuadIndexMode = 0;
    parameter QuadPhiAMode = 3;
    parameter QuadPhiBMode = 3;
    parameter QuadStopMode = 0;
    parameter TCCaptureMode = 0;
    parameter TCCountMode = 3;
    parameter TCReloadMode = 0;
    parameter TCStartMode = 0;
    parameter TCStopMode = 0;


    cy_m0s8_tcpwm_v1_0 cy_m0s8_tcpwm_1 (
        .capture(capture),
        .underflow(un),
        .overflow(ov),
        .line_out_compl(line_n),
        .line_out(line),
        .compare_match(cc),
        .interrupt(interrupt),
        .count(count),
        .reload(reload),
        .stop(stop),
        .start(start),
        .clock(clock));



endmodule

// top
module top ;

          wire  Net_41;
          wire  Net_40;
          wire  Net_39;
          wire  Net_38;
          wire  Net_37;
          wire  Net_36;
          wire  Net_35;
          wire  Net_34;
          wire  Net_33;
          wire  Net_32;
          wire  Net_31;
          wire  Net_30;
          wire  Net_29;
          wire  Net_28;
          wire  Net_27;
          wire  Net_26;
          wire  Net_25;
          wire  Net_24;
          wire  Net_23;
          wire  Net_22;
          wire  Net_21;
          wire  Net_20;
          wire  Net_19;
          wire  Net_18;
          wire  Net_17;
          wire  Net_16;
          wire  Net_15;
          wire  Net_14;
          wire  Net_13;
          wire  Net_12;
          wire  Net_11;
          wire  Net_10;
          wire  Net_9;
          wire  Net_8;
          wire  Net_7;
          wire  Net_6;
          wire  Net_5;
          wire  Net_4;
          wire  Net_3;
          wire  Net_2;
          wire  Net_1;
          wire  Net_331;
          wire  Net_337;
          wire  Net_129;
          wire  Net_117;
          wire  Net_68;
          wire  Net_74;
          wire  Net_72;
          wire  Net_121;
          wire  Net_133;
          wire  Net_108;
          wire  Net_95;

    CharLCD_v2_0_0 LCD_Char_1 ();

    TCPWM_P4_v1_10_1 PWM_1 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_68),
        .ov(Net_6),
        .un(Net_7),
        .cc(Net_8),
        .line(Net_72),
        .line_n(Net_9),
        .clock(Net_74));
    defparam PWM_1.PWMCountMode = 3;
    defparam PWM_1.PWMReloadMode = 0;
    defparam PWM_1.PWMReloadPresent = 0;
    defparam PWM_1.PWMStartMode = 0;
    defparam PWM_1.PWMStopMode = 0;
    defparam PWM_1.PWMSwitchMode = 0;
    defparam PWM_1.QuadIndexMode = 0;
    defparam PWM_1.QuadPhiAMode = 3;
    defparam PWM_1.QuadPhiBMode = 3;
    defparam PWM_1.QuadStopMode = 0;
    defparam PWM_1.TCCaptureMode = 0;
    defparam PWM_1.TCCountMode = 3;
    defparam PWM_1.TCReloadMode = 0;
    defparam PWM_1.TCStartMode = 0;
    defparam PWM_1.TCStopMode = 0;

    TCPWM_P4_v1_10_2 PWM_2 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_117),
        .ov(Net_15),
        .un(Net_16),
        .cc(Net_17),
        .line(Net_121),
        .line_n(Net_18),
        .clock(Net_95));
    defparam PWM_2.PWMCountMode = 3;
    defparam PWM_2.PWMReloadMode = 0;
    defparam PWM_2.PWMReloadPresent = 0;
    defparam PWM_2.PWMStartMode = 0;
    defparam PWM_2.PWMStopMode = 0;
    defparam PWM_2.PWMSwitchMode = 0;
    defparam PWM_2.QuadIndexMode = 0;
    defparam PWM_2.QuadPhiAMode = 3;
    defparam PWM_2.QuadPhiBMode = 3;
    defparam PWM_2.QuadStopMode = 0;
    defparam PWM_2.TCCaptureMode = 0;
    defparam PWM_2.TCCountMode = 3;
    defparam PWM_2.TCReloadMode = 0;
    defparam PWM_2.TCStartMode = 0;
    defparam PWM_2.TCStopMode = 0;


	cy_clock_v1_0
		#(.id("2372d904-f599-4e94-a937-cbf30710aca1"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("100000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_2
		 (.clock_out(Net_95));


    TCPWM_P4_v1_10_3 PWM_3 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_129),
        .ov(Net_25),
        .un(Net_26),
        .cc(Net_27),
        .line(Net_133),
        .line_n(Net_28),
        .clock(Net_108));
    defparam PWM_3.PWMCountMode = 3;
    defparam PWM_3.PWMReloadMode = 0;
    defparam PWM_3.PWMReloadPresent = 0;
    defparam PWM_3.PWMStartMode = 0;
    defparam PWM_3.PWMStopMode = 0;
    defparam PWM_3.PWMSwitchMode = 0;
    defparam PWM_3.QuadIndexMode = 0;
    defparam PWM_3.QuadPhiAMode = 3;
    defparam PWM_3.QuadPhiBMode = 3;
    defparam PWM_3.QuadStopMode = 0;
    defparam PWM_3.TCCaptureMode = 0;
    defparam PWM_3.TCCountMode = 3;
    defparam PWM_3.TCReloadMode = 0;
    defparam PWM_3.TCStartMode = 0;
    defparam PWM_3.TCStopMode = 0;


	cy_clock_v1_0
		#(.id("30443c36-6964-4ee1-9efe-af42ce2dde68"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("100000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_3
		 (.clock_out(Net_108));


	wire [0:0] tmpOE__PWM1_net;
	wire [0:0] tmpFB_0__PWM1_net;
	wire [0:0] tmpIO_0__PWM1_net;
	wire [0:0] tmpINTERRUPT_0__PWM1_net;
	electrical [0:0] tmpSIOVREF__PWM1_net;

	cy_psoc3_pins_v1_10
		#(.id("e219e390-1ce5-49ce-ad3e-702089585d25"),
		  .drive_mode(3'b110),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b1),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b1),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("O"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1))
		PWM1
		 (.oe(tmpOE__PWM1_net),
		  .y({Net_72}),
		  .fb({tmpFB_0__PWM1_net[0:0]}),
		  .io({tmpIO_0__PWM1_net[0:0]}),
		  .siovref(tmpSIOVREF__PWM1_net),
		  .interrupt({tmpINTERRUPT_0__PWM1_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__PWM1_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};

	wire [0:0] tmpOE__PWM2_net;
	wire [0:0] tmpFB_0__PWM2_net;
	wire [0:0] tmpIO_0__PWM2_net;
	wire [0:0] tmpINTERRUPT_0__PWM2_net;
	electrical [0:0] tmpSIOVREF__PWM2_net;

	cy_psoc3_pins_v1_10
		#(.id("fdc5f587-2927-4fc4-acc0-945b16c97a74"),
		  .drive_mode(3'b110),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b1),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b1),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("O"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1))
		PWM2
		 (.oe(tmpOE__PWM2_net),
		  .y({Net_121}),
		  .fb({tmpFB_0__PWM2_net[0:0]}),
		  .io({tmpIO_0__PWM2_net[0:0]}),
		  .siovref(tmpSIOVREF__PWM2_net),
		  .interrupt({tmpINTERRUPT_0__PWM2_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__PWM2_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};

	wire [0:0] tmpOE__PWM3_net;
	wire [0:0] tmpFB_0__PWM3_net;
	wire [0:0] tmpIO_0__PWM3_net;
	wire [0:0] tmpINTERRUPT_0__PWM3_net;
	electrical [0:0] tmpSIOVREF__PWM3_net;

	cy_psoc3_pins_v1_10
		#(.id("c4749d34-f08a-4d33-bb22-fa567c5a7292"),
		  .drive_mode(3'b110),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b1),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b1),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("O"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1))
		PWM3
		 (.oe(tmpOE__PWM3_net),
		  .y({Net_133}),
		  .fb({tmpFB_0__PWM3_net[0:0]}),
		  .io({tmpIO_0__PWM3_net[0:0]}),
		  .siovref(tmpSIOVREF__PWM3_net),
		  .interrupt({tmpINTERRUPT_0__PWM3_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__PWM3_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};


	cy_isr_v1_0
		#(.int_type(2'b10))
		TC1_ISR
		 (.int_signal(Net_68));



	cy_isr_v1_0
		#(.int_type(2'b10))
		TC2_ISR
		 (.int_signal(Net_117));



	cy_isr_v1_0
		#(.int_type(2'b10))
		TC3_ISR
		 (.int_signal(Net_129));


    TCPWM_P4_v1_10_4 TIM_4 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_331),
        .ov(Net_35),
        .un(Net_36),
        .cc(Net_37),
        .line(Net_38),
        .line_n(Net_39),
        .clock(Net_337));
    defparam TIM_4.PWMCountMode = 3;
    defparam TIM_4.PWMReloadMode = 0;
    defparam TIM_4.PWMReloadPresent = 0;
    defparam TIM_4.PWMStartMode = 0;
    defparam TIM_4.PWMStopMode = 0;
    defparam TIM_4.PWMSwitchMode = 0;
    defparam TIM_4.QuadIndexMode = 0;
    defparam TIM_4.QuadPhiAMode = 3;
    defparam TIM_4.QuadPhiBMode = 3;
    defparam TIM_4.QuadStopMode = 0;
    defparam TIM_4.TCCaptureMode = 0;
    defparam TIM_4.TCCountMode = 3;
    defparam TIM_4.TCReloadMode = 0;
    defparam TIM_4.TCStartMode = 0;
    defparam TIM_4.TCStopMode = 0;


	cy_clock_v1_0
		#(.id("72f73c91-d285-4113-8eaf-6cc5d31dcc2a"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("100000000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_4
		 (.clock_out(Net_337));



	cy_isr_v1_0
		#(.int_type(2'b10))
		TC4_ISR
		 (.int_signal(Net_331));



	cy_clock_v1_0
		#(.id("782d7a58-9327-432e-9d9e-efa2d29fdf99"),
		  .source_clock_id("413DE2EF-D9F2-4233-A808-DFAF137FD877"),
		  .divisor(0),
		  .period("100000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_1
		 (.clock_out(Net_74));




endmodule

