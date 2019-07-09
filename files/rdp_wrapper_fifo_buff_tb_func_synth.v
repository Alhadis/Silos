// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Fri Jul  5 21:18:59 2019
// Host        : tensaZangetsu running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/uttej/Desktop/VivadoProjs/NNA/NNA.sim/sim_1/synth/func/xsim/rdp_wrapper_fifo_buff_tb_func_synth.v
// Design      : rdp_wrapper_fifo_buff
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rdp
   (DOBDO,
    CLK,
    wr_internal,
    rd_internal,
    Q,
    \rd_cntr_delayed_reg[7] ,
    \data_in_internal_reg[7] );
  output [7:0]DOBDO;
  input CLK;
  input wr_internal;
  input rd_internal;
  input [7:0]Q;
  input [7:0]\rd_cntr_delayed_reg[7] ;
  input [7:0]\data_in_internal_reg[7] ;

  wire CLK;
  wire [7:0]DOBDO;
  wire [7:0]Q;
  wire [7:0]\data_in_internal_reg[7] ;
  wire [7:0]\rd_cntr_delayed_reg[7] ;
  wire rd_internal;
  wire wr_internal;
  wire [15:0]NLW_r_2p_reg_DOADO_UNCONNECTED;
  wire [15:8]NLW_r_2p_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_r_2p_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_r_2p_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "r_2p" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    r_2p_reg
       (.ADDRARDADDR({1'b1,1'b1,Q,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,\rd_cntr_delayed_reg[7] ,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(CLK),
        .CLKBWRCLK(CLK),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\data_in_internal_reg[7] }),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_r_2p_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_r_2p_reg_DOBDO_UNCONNECTED[15:8],DOBDO}),
        .DOPADOP(NLW_r_2p_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_r_2p_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(wr_internal),
        .ENBWREN(rd_internal),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ADDRS_WIDTH = "8" *) (* ADDRS_WIDTH_INTERNAL = "9" *) (* DATA_WIDTH = "8" *) 
(* RAM_DEPTH = "255" *) 
(* NotValidForBitStream *)
module rdp_wrapper_fifo_buff
   (clk,
    rst,
    clr_ptrs,
    rdn,
    wrn,
    data_in,
    full,
    empty,
    almost_full,
    almost_empty,
    data_out);
  input clk;
  input rst;
  input clr_ptrs;
  input rdn;
  input wrn;
  input [7:0]data_in;
  output full;
  output empty;
  output almost_full;
  output almost_empty;
  output [7:0]data_out;

  wire almost_empty;
  wire almost_empty_OBUF;
  wire almost_empty_i_1_n_0;
  wire almost_full;
  wire almost_full_OBUF;
  wire almost_full_i_1_n_0;
  wire almost_full_i_2_n_0;
  wire almost_full_i_3_n_0;
  wire almost_full_i_4_n_0;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire clr_ptrs;
  wire clr_ptrs_IBUF;
  wire [7:0]data_in;
  wire [7:0]data_in_IBUF;
  wire [7:0]data_in_internal;
  wire [7:0]data_out;
  wire [7:0]data_out_OBUF;
  wire empty;
  wire empty_OBUF;
  wire empty_i_3_n_0;
  wire empty_i_4_n_0;
  wire empty_i_5_n_0;
  wire empty_i_6_n_0;
  wire empty_i_7_n_0;
  wire empty_internal;
  wire empty_reg_i_2_n_0;
  wire empty_reg_i_2_n_1;
  wire empty_reg_i_2_n_2;
  wire empty_reg_i_2_n_3;
  wire empty_reg_i_2_n_4;
  wire empty_reg_i_2_n_5;
  wire empty_reg_i_2_n_6;
  wire empty_reg_i_2_n_7;
  wire full;
  wire full_OBUF;
  wire full_i_10_n_0;
  wire full_i_11_n_0;
  wire full_i_2_n_0;
  wire full_i_3_n_0;
  wire full_i_5_n_0;
  wire full_i_7_n_0;
  wire full_i_8_n_0;
  wire full_i_9_n_0;
  wire full_internal3_out;
  wire full_reg_i_4_n_2;
  wire full_reg_i_4_n_7;
  wire full_reg_i_6_n_0;
  wire full_reg_i_6_n_1;
  wire full_reg_i_6_n_2;
  wire full_reg_i_6_n_3;
  wire full_reg_i_6_n_4;
  wire full_reg_i_6_n_5;
  wire full_reg_i_6_n_6;
  wire full_reg_i_6_n_7;
  wire [8:0]p_1_in__0;
  (* RTL_KEEP = "ture" *) wire [8:0]rd_cntr;
  wire \rd_cntr[0]_i_1_n_0 ;
  wire \rd_cntr[1]_i_1_n_0 ;
  wire \rd_cntr[2]_i_1_n_0 ;
  wire \rd_cntr[3]_i_1_n_0 ;
  wire \rd_cntr[4]_i_1_n_0 ;
  wire \rd_cntr[5]_i_1_n_0 ;
  wire \rd_cntr[6]_i_1_n_0 ;
  wire \rd_cntr[6]_i_2_n_0 ;
  wire \rd_cntr[7]_i_1_n_0 ;
  wire \rd_cntr[8]_i_1_n_0 ;
  wire \rd_cntr[8]_i_2_n_0 ;
  wire \rd_cntr[8]_i_3_n_0 ;
  wire \rd_cntr[8]_i_4_n_0 ;
  wire \rd_cntr[8]_i_5_n_0 ;
  wire \rd_cntr[8]_i_6_n_0 ;
  wire [7:0]rd_cntr_delayed;
  wire rd_internal;
  wire rd_internal1_out;
  wire rdn;
  wire rdn_IBUF;
  wire rst;
  wire rst_IBUF;
  (* RTL_KEEP = "ture" *) wire [8:0]wr_cntr;
  wire \wr_cntr[4]_i_2_n_0 ;
  wire \wr_cntr[6]_i_2_n_0 ;
  wire \wr_cntr[8]_i_12_n_0 ;
  wire \wr_cntr[8]_i_13_n_0 ;
  wire \wr_cntr[8]_i_14_n_0 ;
  wire \wr_cntr[8]_i_15_n_0 ;
  wire \wr_cntr[8]_i_16_n_0 ;
  wire \wr_cntr[8]_i_17_n_0 ;
  wire \wr_cntr[8]_i_18_n_0 ;
  wire \wr_cntr[8]_i_19_n_0 ;
  wire \wr_cntr[8]_i_1_n_0 ;
  wire \wr_cntr[8]_i_20_n_0 ;
  wire \wr_cntr[8]_i_21_n_0 ;
  wire \wr_cntr[8]_i_22_n_0 ;
  wire \wr_cntr[8]_i_24_n_0 ;
  wire \wr_cntr[8]_i_3_n_0 ;
  wire \wr_cntr[8]_i_4_n_0 ;
  wire \wr_cntr[8]_i_5_n_0 ;
  wire \wr_cntr[8]_i_6_n_0 ;
  wire \wr_cntr[8]_i_7_n_0 ;
  wire \wr_cntr[8]_i_8_n_0 ;
  wire \wr_cntr[8]_i_9_n_0 ;
  wire [7:0]wr_cntr_delayed;
  wire \wr_cntr_reg[8]_i_10_n_0 ;
  wire \wr_cntr_reg[8]_i_10_n_1 ;
  wire \wr_cntr_reg[8]_i_10_n_2 ;
  wire \wr_cntr_reg[8]_i_10_n_3 ;
  wire \wr_cntr_reg[8]_i_10_n_4 ;
  wire \wr_cntr_reg[8]_i_10_n_5 ;
  wire \wr_cntr_reg[8]_i_10_n_6 ;
  wire \wr_cntr_reg[8]_i_10_n_7 ;
  wire \wr_cntr_reg[8]_i_11_n_0 ;
  wire \wr_cntr_reg[8]_i_11_n_1 ;
  wire \wr_cntr_reg[8]_i_11_n_2 ;
  wire \wr_cntr_reg[8]_i_11_n_3 ;
  wire \wr_cntr_reg[8]_i_11_n_4 ;
  wire \wr_cntr_reg[8]_i_11_n_5 ;
  wire \wr_cntr_reg[8]_i_11_n_6 ;
  wire \wr_cntr_reg[8]_i_11_n_7 ;
  wire \wr_cntr_reg[8]_i_23_n_2 ;
  wire \wr_cntr_reg[8]_i_23_n_7 ;
  wire wr_internal;
  wire wr_internal0_out;
  wire wrn;
  wire wrn_IBUF;
  wire [3:0]NLW_full_reg_i_4_CO_UNCONNECTED;
  wire [3:1]NLW_full_reg_i_4_O_UNCONNECTED;
  wire [3:0]\NLW_wr_cntr_reg[8]_i_23_CO_UNCONNECTED ;
  wire [3:1]\NLW_wr_cntr_reg[8]_i_23_O_UNCONNECTED ;

  OBUF almost_empty_OBUF_inst
       (.I(almost_empty_OBUF),
        .O(almost_empty));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h55570000)) 
    almost_empty_i_1
       (.I0(empty_reg_i_2_n_4),
        .I1(empty_reg_i_2_n_5),
        .I2(empty_reg_i_2_n_7),
        .I3(empty_reg_i_2_n_6),
        .I4(empty_i_3_n_0),
        .O(almost_empty_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    almost_empty_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(almost_empty_i_1_n_0),
        .Q(almost_empty_OBUF),
        .R(rst_IBUF));
  OBUF almost_full_OBUF_inst
       (.I(almost_full_OBUF),
        .O(almost_full));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBAAFBFB)) 
    almost_full_i_1
       (.I0(almost_full_i_2_n_0),
        .I1(wr_cntr[8]),
        .I2(rd_cntr[8]),
        .I3(full_reg_i_4_n_7),
        .I4(full_reg_i_4_n_2),
        .I5(almost_full_i_3_n_0),
        .O(almost_full_i_1_n_0));
  LUT6 #(
    .INIT(64'h0404040404040444)) 
    almost_full_i_2
       (.I0(full_i_3_n_0),
        .I1(almost_full_i_4_n_0),
        .I2(\wr_cntr_reg[8]_i_10_n_4 ),
        .I3(\wr_cntr_reg[8]_i_10_n_6 ),
        .I4(\wr_cntr_reg[8]_i_10_n_5 ),
        .I5(\wr_cntr_reg[8]_i_10_n_7 ),
        .O(almost_full_i_2_n_0));
  LUT6 #(
    .INIT(64'h8880808080808080)) 
    almost_full_i_3
       (.I0(full_i_3_n_0),
        .I1(\wr_cntr[8]_i_8_n_0 ),
        .I2(empty_reg_i_2_n_4),
        .I3(empty_reg_i_2_n_5),
        .I4(empty_reg_i_2_n_6),
        .I5(empty_reg_i_2_n_7),
        .O(almost_full_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    almost_full_i_4
       (.I0(\wr_cntr_reg[8]_i_11_n_6 ),
        .I1(\wr_cntr_reg[8]_i_11_n_7 ),
        .I2(\wr_cntr_reg[8]_i_11_n_5 ),
        .I3(\wr_cntr_reg[8]_i_11_n_4 ),
        .I4(\wr_cntr_reg[8]_i_23_n_7 ),
        .I5(\wr_cntr_reg[8]_i_23_n_2 ),
        .O(almost_full_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    almost_full_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(almost_full_i_1_n_0),
        .Q(almost_full_OBUF),
        .R(rst_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF clr_ptrs_IBUF_inst
       (.I(clr_ptrs),
        .O(clr_ptrs_IBUF));
  IBUF \data_in_IBUF[0]_inst 
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[1]_inst 
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[2]_inst 
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[3]_inst 
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  IBUF \data_in_IBUF[4]_inst 
       (.I(data_in[4]),
        .O(data_in_IBUF[4]));
  IBUF \data_in_IBUF[5]_inst 
       (.I(data_in[5]),
        .O(data_in_IBUF[5]));
  IBUF \data_in_IBUF[6]_inst 
       (.I(data_in[6]),
        .O(data_in_IBUF[6]));
  IBUF \data_in_IBUF[7]_inst 
       (.I(data_in[7]),
        .O(data_in_IBUF[7]));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[0]),
        .Q(data_in_internal[0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[1]),
        .Q(data_in_internal[1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[2]),
        .Q(data_in_internal[2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[3]),
        .Q(data_in_internal[3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[4]),
        .Q(data_in_internal[4]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[5]),
        .Q(data_in_internal[5]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[6]),
        .Q(data_in_internal[6]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_internal_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data_in_IBUF[7]),
        .Q(data_in_internal[7]),
        .R(rst_IBUF));
  OBUF \data_out_OBUF[0]_inst 
       (.I(data_out_OBUF[0]),
        .O(data_out[0]));
  OBUF \data_out_OBUF[1]_inst 
       (.I(data_out_OBUF[1]),
        .O(data_out[1]));
  OBUF \data_out_OBUF[2]_inst 
       (.I(data_out_OBUF[2]),
        .O(data_out[2]));
  OBUF \data_out_OBUF[3]_inst 
       (.I(data_out_OBUF[3]),
        .O(data_out[3]));
  OBUF \data_out_OBUF[4]_inst 
       (.I(data_out_OBUF[4]),
        .O(data_out[4]));
  OBUF \data_out_OBUF[5]_inst 
       (.I(data_out_OBUF[5]),
        .O(data_out[5]));
  OBUF \data_out_OBUF[6]_inst 
       (.I(data_out_OBUF[6]),
        .O(data_out[6]));
  OBUF \data_out_OBUF[7]_inst 
       (.I(data_out_OBUF[7]),
        .O(data_out[7]));
  OBUF empty_OBUF_inst
       (.I(empty_OBUF),
        .O(empty));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    empty_i_1
       (.I0(empty_reg_i_2_n_5),
        .I1(empty_reg_i_2_n_7),
        .I2(empty_reg_i_2_n_6),
        .I3(empty_reg_i_2_n_4),
        .I4(empty_i_3_n_0),
        .O(empty_internal));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    empty_i_3
       (.I0(full_reg_i_6_n_5),
        .I1(full_reg_i_6_n_4),
        .I2(full_reg_i_6_n_7),
        .I3(full_reg_i_6_n_6),
        .I4(full_reg_i_4_n_7),
        .I5(full_reg_i_4_n_2),
        .O(empty_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    empty_i_4
       (.I0(wr_cntr[3]),
        .I1(rd_cntr[3]),
        .O(empty_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    empty_i_5
       (.I0(wr_cntr[2]),
        .I1(rd_cntr[2]),
        .O(empty_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    empty_i_6
       (.I0(wr_cntr[1]),
        .I1(rd_cntr[1]),
        .O(empty_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    empty_i_7
       (.I0(wr_cntr[0]),
        .I1(rd_cntr[0]),
        .O(empty_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    empty_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(empty_internal),
        .Q(empty_OBUF),
        .R(rst_IBUF));
  CARRY4 empty_reg_i_2
       (.CI(1'b0),
        .CO({empty_reg_i_2_n_0,empty_reg_i_2_n_1,empty_reg_i_2_n_2,empty_reg_i_2_n_3}),
        .CYINIT(1'b1),
        .DI(wr_cntr[3:0]),
        .O({empty_reg_i_2_n_4,empty_reg_i_2_n_5,empty_reg_i_2_n_6,empty_reg_i_2_n_7}),
        .S({empty_i_4_n_0,empty_i_5_n_0,empty_i_6_n_0,empty_i_7_n_0}));
  OBUF full_OBUF_inst
       (.I(full_OBUF),
        .O(full));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hDDDDDD1D)) 
    full_i_1
       (.I0(full_i_2_n_0),
        .I1(full_i_3_n_0),
        .I2(full_reg_i_4_n_2),
        .I3(full_reg_i_4_n_7),
        .I4(full_i_5_n_0),
        .O(full_internal3_out));
  LUT2 #(
    .INIT(4'h9)) 
    full_i_10
       (.I0(wr_cntr[5]),
        .I1(rd_cntr[5]),
        .O(full_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    full_i_11
       (.I0(wr_cntr[4]),
        .I1(rd_cntr[4]),
        .O(full_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    full_i_2
       (.I0(\wr_cntr[8]_i_12_n_0 ),
        .I1(\wr_cntr_reg[8]_i_10_n_5 ),
        .I2(\wr_cntr_reg[8]_i_10_n_6 ),
        .I3(\wr_cntr_reg[8]_i_11_n_5 ),
        .I4(\wr_cntr_reg[8]_i_10_n_4 ),
        .O(full_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    full_i_3
       (.I0(rd_cntr[8]),
        .I1(wr_cntr[8]),
        .O(full_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    full_i_5
       (.I0(empty_reg_i_2_n_5),
        .I1(empty_reg_i_2_n_4),
        .I2(empty_reg_i_2_n_7),
        .I3(empty_reg_i_2_n_6),
        .I4(\wr_cntr[8]_i_8_n_0 ),
        .O(full_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    full_i_7
       (.I0(wr_cntr[8]),
        .I1(rd_cntr[8]),
        .O(full_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    full_i_8
       (.I0(wr_cntr[7]),
        .I1(rd_cntr[7]),
        .O(full_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    full_i_9
       (.I0(wr_cntr[6]),
        .I1(rd_cntr[6]),
        .O(full_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    full_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(full_internal3_out),
        .Q(full_OBUF),
        .R(rst_IBUF));
  CARRY4 full_reg_i_4
       (.CI(full_reg_i_6_n_0),
        .CO({NLW_full_reg_i_4_CO_UNCONNECTED[3:2],full_reg_i_4_n_2,NLW_full_reg_i_4_CO_UNCONNECTED[0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,wr_cntr[8]}),
        .O({NLW_full_reg_i_4_O_UNCONNECTED[3:1],full_reg_i_4_n_7}),
        .S({1'b0,1'b0,1'b1,full_i_7_n_0}));
  CARRY4 full_reg_i_6
       (.CI(empty_reg_i_2_n_0),
        .CO({full_reg_i_6_n_0,full_reg_i_6_n_1,full_reg_i_6_n_2,full_reg_i_6_n_3}),
        .CYINIT(1'b0),
        .DI(wr_cntr[7:4]),
        .O({full_reg_i_6_n_4,full_reg_i_6_n_5,full_reg_i_6_n_6,full_reg_i_6_n_7}),
        .S({full_i_8_n_0,full_i_9_n_0,full_i_10_n_0,full_i_11_n_0}));
  rdp ram_2_port
       (.CLK(clk_IBUF_BUFG),
        .DOBDO(data_out_OBUF),
        .Q(wr_cntr_delayed),
        .\data_in_internal_reg[7] (data_in_internal),
        .\rd_cntr_delayed_reg[7] (rd_cntr_delayed),
        .rd_internal(rd_internal),
        .wr_internal(wr_internal));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_cntr[0]_i_1 
       (.I0(rd_cntr[0]),
        .I1(\rd_cntr[8]_i_3_n_0 ),
        .O(\rd_cntr[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \rd_cntr[1]_i_1 
       (.I0(rd_cntr[0]),
        .I1(\rd_cntr[8]_i_3_n_0 ),
        .I2(rd_cntr[1]),
        .O(\rd_cntr[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \rd_cntr[2]_i_1 
       (.I0(rd_cntr[2]),
        .I1(\rd_cntr[8]_i_3_n_0 ),
        .I2(rd_cntr[0]),
        .I3(rd_cntr[1]),
        .O(\rd_cntr[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \rd_cntr[3]_i_1 
       (.I0(rd_cntr[3]),
        .I1(rd_cntr[2]),
        .I2(rd_cntr[1]),
        .I3(rd_cntr[0]),
        .I4(\rd_cntr[8]_i_3_n_0 ),
        .O(\rd_cntr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \rd_cntr[4]_i_1 
       (.I0(rd_cntr[4]),
        .I1(\rd_cntr[8]_i_3_n_0 ),
        .I2(rd_cntr[3]),
        .I3(rd_cntr[0]),
        .I4(rd_cntr[1]),
        .I5(rd_cntr[2]),
        .O(\rd_cntr[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \rd_cntr[5]_i_1 
       (.I0(rd_cntr[4]),
        .I1(rd_cntr[3]),
        .I2(\rd_cntr[6]_i_2_n_0 ),
        .I3(\rd_cntr[8]_i_3_n_0 ),
        .I4(rd_cntr[5]),
        .O(\rd_cntr[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \rd_cntr[6]_i_1 
       (.I0(rd_cntr[5]),
        .I1(\rd_cntr[8]_i_3_n_0 ),
        .I2(\rd_cntr[6]_i_2_n_0 ),
        .I3(rd_cntr[3]),
        .I4(rd_cntr[4]),
        .I5(rd_cntr[6]),
        .O(\rd_cntr[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \rd_cntr[6]_i_2 
       (.I0(rd_cntr[2]),
        .I1(rd_cntr[1]),
        .I2(rd_cntr[0]),
        .O(\rd_cntr[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \rd_cntr[7]_i_1 
       (.I0(rd_cntr[7]),
        .I1(\rd_cntr[8]_i_5_n_0 ),
        .I2(\rd_cntr[8]_i_3_n_0 ),
        .I3(rd_cntr[5]),
        .I4(rd_cntr[6]),
        .O(\rd_cntr[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \rd_cntr[8]_i_1 
       (.I0(rst_IBUF),
        .I1(clr_ptrs_IBUF),
        .I2(\rd_cntr[8]_i_3_n_0 ),
        .I3(\rd_cntr[8]_i_4_n_0 ),
        .O(\rd_cntr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \rd_cntr[8]_i_2 
       (.I0(rd_cntr[8]),
        .I1(rd_cntr[7]),
        .I2(rd_cntr[6]),
        .I3(rd_cntr[5]),
        .I4(\rd_cntr[8]_i_3_n_0 ),
        .I5(\rd_cntr[8]_i_5_n_0 ),
        .O(\rd_cntr[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA2)) 
    \rd_cntr[8]_i_3 
       (.I0(rdn_IBUF),
        .I1(empty_i_3_n_0),
        .I2(empty_reg_i_2_n_4),
        .I3(rst_IBUF),
        .I4(\rd_cntr[8]_i_6_n_0 ),
        .O(\rd_cntr[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \rd_cntr[8]_i_4 
       (.I0(rd_cntr[7]),
        .I1(rd_cntr[8]),
        .I2(rd_cntr[5]),
        .I3(rd_cntr[6]),
        .I4(\rd_cntr[8]_i_5_n_0 ),
        .O(\rd_cntr[8]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \rd_cntr[8]_i_5 
       (.I0(rd_cntr[4]),
        .I1(rd_cntr[3]),
        .I2(rd_cntr[0]),
        .I3(rd_cntr[1]),
        .I4(rd_cntr[2]),
        .O(\rd_cntr[8]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \rd_cntr[8]_i_6 
       (.I0(empty_reg_i_2_n_5),
        .I1(empty_reg_i_2_n_7),
        .I2(empty_reg_i_2_n_6),
        .O(\rd_cntr[8]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[0]),
        .Q(rd_cntr_delayed[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[1]),
        .Q(rd_cntr_delayed[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[2]),
        .Q(rd_cntr_delayed[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[3]),
        .Q(rd_cntr_delayed[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[4]),
        .Q(rd_cntr_delayed[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[5]),
        .Q(rd_cntr_delayed[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[6]),
        .Q(rd_cntr_delayed[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_delayed_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_cntr[7]),
        .Q(rd_cntr_delayed[7]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[0]_i_1_n_0 ),
        .Q(rd_cntr[0]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[1]_i_1_n_0 ),
        .Q(rd_cntr[1]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[2]_i_1_n_0 ),
        .Q(rd_cntr[2]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[3]_i_1_n_0 ),
        .Q(rd_cntr[3]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[4]_i_1_n_0 ),
        .Q(rd_cntr[4]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[5]_i_1_n_0 ),
        .Q(rd_cntr[5]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[6]_i_1_n_0 ),
        .Q(rd_cntr[6]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[7]_i_1_n_0 ),
        .Q(rd_cntr[7]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_cntr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_cntr[8]_i_2_n_0 ),
        .Q(rd_cntr[8]),
        .R(\rd_cntr[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    rd_internal_i_1
       (.I0(rdn_IBUF),
        .I1(empty_OBUF),
        .O(rd_internal1_out));
  FDRE #(
    .INIT(1'b0)) 
    rd_internal_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rd_internal1_out),
        .Q(rd_internal),
        .R(rst_IBUF));
  IBUF rdn_IBUF_inst
       (.I(rdn),
        .O(rdn_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  LUT4 #(
    .INIT(16'h57A8)) 
    \wr_cntr[0]_i_1 
       (.I0(wrn_IBUF),
        .I1(\wr_cntr[8]_i_5_n_0 ),
        .I2(\wr_cntr[8]_i_4_n_0 ),
        .I3(wr_cntr[0]),
        .O(p_1_in__0[0]));
  LUT5 #(
    .INIT(32'h57FFA800)) 
    \wr_cntr[1]_i_1 
       (.I0(wr_cntr[0]),
        .I1(\wr_cntr[8]_i_4_n_0 ),
        .I2(\wr_cntr[8]_i_5_n_0 ),
        .I3(wrn_IBUF),
        .I4(wr_cntr[1]),
        .O(p_1_in__0[1]));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \wr_cntr[2]_i_1 
       (.I0(wr_cntr[2]),
        .I1(wrn_IBUF),
        .I2(\wr_cntr[8]_i_6_n_0 ),
        .I3(wr_cntr[0]),
        .I4(wr_cntr[1]),
        .O(p_1_in__0[2]));
  LUT5 #(
    .INIT(32'h999AAAAA)) 
    \wr_cntr[3]_i_1 
       (.I0(wr_cntr[3]),
        .I1(\wr_cntr[4]_i_2_n_0 ),
        .I2(\wr_cntr[8]_i_4_n_0 ),
        .I3(\wr_cntr[8]_i_5_n_0 ),
        .I4(wrn_IBUF),
        .O(p_1_in__0[3]));
  LUT5 #(
    .INIT(32'hAAAA6AAA)) 
    \wr_cntr[4]_i_1 
       (.I0(wr_cntr[4]),
        .I1(\wr_cntr[8]_i_6_n_0 ),
        .I2(wrn_IBUF),
        .I3(wr_cntr[3]),
        .I4(\wr_cntr[4]_i_2_n_0 ),
        .O(p_1_in__0[4]));
  LUT3 #(
    .INIT(8'h7F)) 
    \wr_cntr[4]_i_2 
       (.I0(wr_cntr[2]),
        .I1(wr_cntr[0]),
        .I2(wr_cntr[1]),
        .O(\wr_cntr[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h56AAAAAA)) 
    \wr_cntr[5]_i_1 
       (.I0(wr_cntr[5]),
        .I1(\wr_cntr[8]_i_4_n_0 ),
        .I2(\wr_cntr[8]_i_5_n_0 ),
        .I3(wrn_IBUF),
        .I4(\wr_cntr[6]_i_2_n_0 ),
        .O(p_1_in__0[5]));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \wr_cntr[6]_i_1 
       (.I0(wr_cntr[6]),
        .I1(\wr_cntr[8]_i_6_n_0 ),
        .I2(wrn_IBUF),
        .I3(\wr_cntr[6]_i_2_n_0 ),
        .I4(wr_cntr[5]),
        .O(p_1_in__0[6]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \wr_cntr[6]_i_2 
       (.I0(wr_cntr[4]),
        .I1(wr_cntr[3]),
        .I2(wr_cntr[1]),
        .I3(wr_cntr[0]),
        .I4(wr_cntr[2]),
        .O(\wr_cntr[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h56AAAAAA)) 
    \wr_cntr[7]_i_1 
       (.I0(wr_cntr[7]),
        .I1(\wr_cntr[8]_i_4_n_0 ),
        .I2(\wr_cntr[8]_i_5_n_0 ),
        .I3(wrn_IBUF),
        .I4(\wr_cntr[8]_i_7_n_0 ),
        .O(p_1_in__0[7]));
  LUT6 #(
    .INIT(64'hFFABFFFFFFA8FF00)) 
    \wr_cntr[8]_i_1 
       (.I0(\wr_cntr[8]_i_3_n_0 ),
        .I1(\wr_cntr[8]_i_4_n_0 ),
        .I2(\wr_cntr[8]_i_5_n_0 ),
        .I3(rst_IBUF),
        .I4(wrn_IBUF),
        .I5(clr_ptrs_IBUF),
        .O(\wr_cntr[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \wr_cntr[8]_i_12 
       (.I0(\wr_cntr_reg[8]_i_23_n_7 ),
        .I1(\wr_cntr_reg[8]_i_11_n_6 ),
        .I2(\wr_cntr_reg[8]_i_11_n_7 ),
        .I3(\wr_cntr_reg[8]_i_23_n_2 ),
        .I4(\wr_cntr_reg[8]_i_11_n_4 ),
        .O(\wr_cntr[8]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wr_cntr[8]_i_13 
       (.I0(full_reg_i_4_n_2),
        .I1(full_reg_i_4_n_7),
        .O(\wr_cntr[8]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wr_cntr[8]_i_14 
       (.I0(\wr_cntr_reg[8]_i_10_n_4 ),
        .I1(\wr_cntr_reg[8]_i_11_n_5 ),
        .I2(\wr_cntr_reg[8]_i_10_n_6 ),
        .I3(\wr_cntr_reg[8]_i_10_n_5 ),
        .O(\wr_cntr[8]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_15 
       (.I0(rd_cntr[3]),
        .I1(wr_cntr[3]),
        .O(\wr_cntr[8]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_16 
       (.I0(rd_cntr[2]),
        .I1(wr_cntr[2]),
        .O(\wr_cntr[8]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_17 
       (.I0(rd_cntr[1]),
        .I1(wr_cntr[1]),
        .O(\wr_cntr[8]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_18 
       (.I0(rd_cntr[0]),
        .I1(wr_cntr[0]),
        .O(\wr_cntr[8]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_19 
       (.I0(rd_cntr[7]),
        .I1(wr_cntr[7]),
        .O(\wr_cntr[8]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \wr_cntr[8]_i_2 
       (.I0(wr_cntr[8]),
        .I1(\wr_cntr[8]_i_6_n_0 ),
        .I2(wrn_IBUF),
        .I3(\wr_cntr[8]_i_7_n_0 ),
        .I4(wr_cntr[7]),
        .O(p_1_in__0[8]));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_20 
       (.I0(rd_cntr[6]),
        .I1(wr_cntr[6]),
        .O(\wr_cntr[8]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_21 
       (.I0(rd_cntr[5]),
        .I1(wr_cntr[5]),
        .O(\wr_cntr[8]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_22 
       (.I0(rd_cntr[4]),
        .I1(wr_cntr[4]),
        .O(\wr_cntr[8]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \wr_cntr[8]_i_24 
       (.I0(rd_cntr[8]),
        .I1(wr_cntr[8]),
        .O(\wr_cntr[8]_i_24_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \wr_cntr[8]_i_3 
       (.I0(wr_cntr[8]),
        .I1(wr_cntr[7]),
        .I2(\wr_cntr[6]_i_2_n_0 ),
        .I3(wr_cntr[5]),
        .I4(wr_cntr[6]),
        .O(\wr_cntr[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000202220222022)) 
    \wr_cntr[8]_i_4 
       (.I0(full_reg_i_4_n_2),
        .I1(full_reg_i_4_n_7),
        .I2(rd_cntr[8]),
        .I3(wr_cntr[8]),
        .I4(\wr_cntr[8]_i_8_n_0 ),
        .I5(\wr_cntr[8]_i_9_n_0 ),
        .O(\wr_cntr[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFFFFE)) 
    \wr_cntr[8]_i_5 
       (.I0(\wr_cntr_reg[8]_i_10_n_4 ),
        .I1(\wr_cntr_reg[8]_i_11_n_5 ),
        .I2(\wr_cntr_reg[8]_i_10_n_6 ),
        .I3(\wr_cntr_reg[8]_i_10_n_5 ),
        .I4(\wr_cntr[8]_i_12_n_0 ),
        .I5(full_i_3_n_0),
        .O(\wr_cntr[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h70FF70FF70FF7000)) 
    \wr_cntr[8]_i_6 
       (.I0(\wr_cntr[8]_i_9_n_0 ),
        .I1(\wr_cntr[8]_i_8_n_0 ),
        .I2(\wr_cntr[8]_i_13_n_0 ),
        .I3(full_i_3_n_0),
        .I4(\wr_cntr[8]_i_12_n_0 ),
        .I5(\wr_cntr[8]_i_14_n_0 ),
        .O(\wr_cntr[8]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \wr_cntr[8]_i_7 
       (.I0(wr_cntr[6]),
        .I1(wr_cntr[5]),
        .I2(\wr_cntr[6]_i_2_n_0 ),
        .O(\wr_cntr[8]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \wr_cntr[8]_i_8 
       (.I0(full_reg_i_6_n_6),
        .I1(full_reg_i_6_n_7),
        .I2(full_reg_i_6_n_4),
        .I3(full_reg_i_6_n_5),
        .O(\wr_cntr[8]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \wr_cntr[8]_i_9 
       (.I0(empty_reg_i_2_n_6),
        .I1(empty_reg_i_2_n_7),
        .I2(empty_reg_i_2_n_4),
        .I3(empty_reg_i_2_n_5),
        .O(\wr_cntr[8]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[0]),
        .Q(wr_cntr_delayed[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[1]),
        .Q(wr_cntr_delayed[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[2]),
        .Q(wr_cntr_delayed[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[3]),
        .Q(wr_cntr_delayed[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[4]),
        .Q(wr_cntr_delayed[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[5]),
        .Q(wr_cntr_delayed[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[6]),
        .Q(wr_cntr_delayed[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_delayed_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_cntr[7]),
        .Q(wr_cntr_delayed[7]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[0]),
        .Q(wr_cntr[0]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[1]),
        .Q(wr_cntr[1]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[2]),
        .Q(wr_cntr[2]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[3]),
        .Q(wr_cntr[3]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[4]),
        .Q(wr_cntr[4]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[5]),
        .Q(wr_cntr[5]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[6]),
        .Q(wr_cntr[6]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[7]),
        .Q(wr_cntr[7]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \wr_cntr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in__0[8]),
        .Q(wr_cntr[8]),
        .R(\wr_cntr[8]_i_1_n_0 ));
  CARRY4 \wr_cntr_reg[8]_i_10 
       (.CI(1'b0),
        .CO({\wr_cntr_reg[8]_i_10_n_0 ,\wr_cntr_reg[8]_i_10_n_1 ,\wr_cntr_reg[8]_i_10_n_2 ,\wr_cntr_reg[8]_i_10_n_3 }),
        .CYINIT(1'b1),
        .DI(rd_cntr[3:0]),
        .O({\wr_cntr_reg[8]_i_10_n_4 ,\wr_cntr_reg[8]_i_10_n_5 ,\wr_cntr_reg[8]_i_10_n_6 ,\wr_cntr_reg[8]_i_10_n_7 }),
        .S({\wr_cntr[8]_i_15_n_0 ,\wr_cntr[8]_i_16_n_0 ,\wr_cntr[8]_i_17_n_0 ,\wr_cntr[8]_i_18_n_0 }));
  CARRY4 \wr_cntr_reg[8]_i_11 
       (.CI(\wr_cntr_reg[8]_i_10_n_0 ),
        .CO({\wr_cntr_reg[8]_i_11_n_0 ,\wr_cntr_reg[8]_i_11_n_1 ,\wr_cntr_reg[8]_i_11_n_2 ,\wr_cntr_reg[8]_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI(rd_cntr[7:4]),
        .O({\wr_cntr_reg[8]_i_11_n_4 ,\wr_cntr_reg[8]_i_11_n_5 ,\wr_cntr_reg[8]_i_11_n_6 ,\wr_cntr_reg[8]_i_11_n_7 }),
        .S({\wr_cntr[8]_i_19_n_0 ,\wr_cntr[8]_i_20_n_0 ,\wr_cntr[8]_i_21_n_0 ,\wr_cntr[8]_i_22_n_0 }));
  CARRY4 \wr_cntr_reg[8]_i_23 
       (.CI(\wr_cntr_reg[8]_i_11_n_0 ),
        .CO({\NLW_wr_cntr_reg[8]_i_23_CO_UNCONNECTED [3:2],\wr_cntr_reg[8]_i_23_n_2 ,\NLW_wr_cntr_reg[8]_i_23_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,rd_cntr[8]}),
        .O({\NLW_wr_cntr_reg[8]_i_23_O_UNCONNECTED [3:1],\wr_cntr_reg[8]_i_23_n_7 }),
        .S({1'b0,1'b0,1'b1,\wr_cntr[8]_i_24_n_0 }));
  LUT2 #(
    .INIT(4'h2)) 
    wr_internal_i_1
       (.I0(wrn_IBUF),
        .I1(full_OBUF),
        .O(wr_internal0_out));
  FDRE #(
    .INIT(1'b0)) 
    wr_internal_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(wr_internal0_out),
        .Q(wr_internal),
        .R(rst_IBUF));
  IBUF wrn_IBUF_inst
       (.I(wrn),
        .O(wrn_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
