// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun May 27 21:08:30 2018
// Host        : kacper-pc running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ divider_32_20_0_sim_netlist.v
// Design      : divider_32_20_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_divider_32_20
   (quotient,
    qv,
    clk,
    start,
    dividend,
    divisor);
  output [31:0]quotient;
  output qv;
  input clk;
  input start;
  input [31:0]dividend;
  input [19:0]divisor;

  wire clk;
  wire [31:0]dividend;
  wire [31:0]dividend_reg;
  wire [19:0]divisor;
  wire divisor_reg;
  wire \divisor_reg_reg_n_0_[0] ;
  wire \divisor_reg_reg_n_0_[10] ;
  wire \divisor_reg_reg_n_0_[11] ;
  wire \divisor_reg_reg_n_0_[12] ;
  wire \divisor_reg_reg_n_0_[13] ;
  wire \divisor_reg_reg_n_0_[14] ;
  wire \divisor_reg_reg_n_0_[15] ;
  wire \divisor_reg_reg_n_0_[16] ;
  wire \divisor_reg_reg_n_0_[17] ;
  wire \divisor_reg_reg_n_0_[18] ;
  wire \divisor_reg_reg_n_0_[19] ;
  wire \divisor_reg_reg_n_0_[1] ;
  wire \divisor_reg_reg_n_0_[2] ;
  wire \divisor_reg_reg_n_0_[3] ;
  wire \divisor_reg_reg_n_0_[4] ;
  wire \divisor_reg_reg_n_0_[5] ;
  wire \divisor_reg_reg_n_0_[6] ;
  wire \divisor_reg_reg_n_0_[7] ;
  wire \divisor_reg_reg_n_0_[8] ;
  wire \divisor_reg_reg_n_0_[9] ;
  wire [7:0]i;
  wire \i[0]_i_1_n_0 ;
  wire \i[1]_i_1_n_0 ;
  wire \i[2]_i_1_n_0 ;
  wire \i[3]_i_1_n_0 ;
  wire \i[4]_i_1_n_0 ;
  wire \i[4]_i_2_n_0 ;
  wire \i[4]_i_3_n_0 ;
  wire \i[4]_i_4_n_0 ;
  wire \i[5]_i_1_n_0 ;
  wire \i[6]_i_1_n_0 ;
  wire \i[7]_i_1_n_0 ;
  wire \i[7]_i_2_n_0 ;
  wire [7:0]lat_cnt;
  wire \lat_cnt[0]_i_1_n_0 ;
  wire \lat_cnt[1]_i_1_n_0 ;
  wire \lat_cnt[2]_i_1_n_0 ;
  wire \lat_cnt[3]_i_1_n_0 ;
  wire \lat_cnt[4]_i_1_n_0 ;
  wire \lat_cnt[5]_i_1_n_0 ;
  wire \lat_cnt[6]_i_1_n_0 ;
  wire \lat_cnt[7]_i_1_n_0 ;
  wire \lat_cnt[7]_i_2_n_0 ;
  wire \lat_cnt[7]_i_3_n_0 ;
  wire [51:0]mul_res;
  wire [31:0]quotient;
  wire qv;
  wire result_reg;
  wire sar1;
  wire sar1_carry__0_i_1_n_0;
  wire sar1_carry__0_i_2_n_0;
  wire sar1_carry__0_i_3_n_0;
  wire sar1_carry__0_i_4_n_0;
  wire sar1_carry__0_i_5_n_0;
  wire sar1_carry__0_i_6_n_0;
  wire sar1_carry__0_i_7_n_0;
  wire sar1_carry__0_i_8_n_0;
  wire sar1_carry__0_n_0;
  wire sar1_carry__0_n_1;
  wire sar1_carry__0_n_2;
  wire sar1_carry__0_n_3;
  wire sar1_carry__1_i_1_n_0;
  wire sar1_carry__1_i_2_n_0;
  wire sar1_carry__1_i_3_n_0;
  wire sar1_carry__1_i_4_n_0;
  wire sar1_carry__1_i_5_n_0;
  wire sar1_carry__1_i_6_n_0;
  wire sar1_carry__1_i_7_n_0;
  wire sar1_carry__1_i_8_n_0;
  wire sar1_carry__1_n_0;
  wire sar1_carry__1_n_1;
  wire sar1_carry__1_n_2;
  wire sar1_carry__1_n_3;
  wire sar1_carry__2_i_1_n_0;
  wire sar1_carry__2_i_2_n_0;
  wire sar1_carry__2_i_3_n_0;
  wire sar1_carry__2_i_4_n_0;
  wire sar1_carry__2_i_5_n_0;
  wire sar1_carry__2_i_6_n_0;
  wire sar1_carry__2_i_7_n_0;
  wire sar1_carry__2_i_8_n_0;
  wire sar1_carry__2_n_0;
  wire sar1_carry__2_n_1;
  wire sar1_carry__2_n_2;
  wire sar1_carry__2_n_3;
  wire sar1_carry__3_i_1_n_0;
  wire sar1_carry__3_i_2_n_0;
  wire sar1_carry__3_i_3_n_0;
  wire sar1_carry__3_i_4_n_0;
  wire sar1_carry__3_i_5_n_0;
  wire sar1_carry__3_i_6_n_0;
  wire sar1_carry__3_i_7_n_0;
  wire sar1_carry__3_i_8_n_0;
  wire sar1_carry__3_n_0;
  wire sar1_carry__3_n_1;
  wire sar1_carry__3_n_2;
  wire sar1_carry__3_n_3;
  wire sar1_carry__4_i_1_n_0;
  wire sar1_carry__4_i_2_n_0;
  wire sar1_carry__4_i_3_n_0;
  wire sar1_carry__4_i_4_n_0;
  wire sar1_carry__4_i_5_n_0;
  wire sar1_carry__4_i_6_n_0;
  wire sar1_carry__4_i_7_n_0;
  wire sar1_carry__4_i_8_n_0;
  wire sar1_carry__4_n_0;
  wire sar1_carry__4_n_1;
  wire sar1_carry__4_n_2;
  wire sar1_carry__4_n_3;
  wire sar1_carry__5_i_1_n_0;
  wire sar1_carry__5_i_2_n_0;
  wire sar1_carry__5_i_3_n_0;
  wire sar1_carry__5_i_4_n_0;
  wire sar1_carry__5_n_3;
  wire sar1_carry_i_1_n_0;
  wire sar1_carry_i_2_n_0;
  wire sar1_carry_i_3_n_0;
  wire sar1_carry_i_4_n_0;
  wire sar1_carry_i_5_n_0;
  wire sar1_carry_i_6_n_0;
  wire sar1_carry_i_7_n_0;
  wire sar1_carry_i_8_n_0;
  wire sar1_carry_n_0;
  wire sar1_carry_n_1;
  wire sar1_carry_n_2;
  wire sar1_carry_n_3;
  wire \sar[0]_i_1_n_0 ;
  wire \sar[10]_i_1_n_0 ;
  wire \sar[11]_i_1_n_0 ;
  wire \sar[12]_i_1_n_0 ;
  wire \sar[13]_i_1_n_0 ;
  wire \sar[14]_i_1_n_0 ;
  wire \sar[14]_i_2_n_0 ;
  wire \sar[15]_i_1_n_0 ;
  wire \sar[15]_i_2_n_0 ;
  wire \sar[16]_i_1_n_0 ;
  wire \sar[17]_i_1_n_0 ;
  wire \sar[18]_i_1_n_0 ;
  wire \sar[19]_i_1_n_0 ;
  wire \sar[1]_i_1_n_0 ;
  wire \sar[20]_i_1_n_0 ;
  wire \sar[21]_i_1_n_0 ;
  wire \sar[22]_i_1_n_0 ;
  wire \sar[22]_i_2_n_0 ;
  wire \sar[23]_i_1_n_0 ;
  wire \sar[23]_i_2_n_0 ;
  wire \sar[24]_i_1_n_0 ;
  wire \sar[25]_i_1_n_0 ;
  wire \sar[26]_i_1_n_0 ;
  wire \sar[27]_i_1_n_0 ;
  wire \sar[28]_i_1_n_0 ;
  wire \sar[29]_i_1_n_0 ;
  wire \sar[2]_i_1_n_0 ;
  wire \sar[30]_i_1_n_0 ;
  wire \sar[30]_i_2_n_0 ;
  wire \sar[31]_i_1_n_0 ;
  wire \sar[31]_i_2_n_0 ;
  wire \sar[31]_i_3_n_0 ;
  wire \sar[31]_i_4_n_0 ;
  wire \sar[31]_i_5_n_0 ;
  wire \sar[3]_i_1_n_0 ;
  wire \sar[4]_i_1_n_0 ;
  wire \sar[5]_i_1_n_0 ;
  wire \sar[6]_i_1_n_0 ;
  wire \sar[6]_i_2_n_0 ;
  wire \sar[7]_i_1_n_0 ;
  wire \sar[7]_i_2_n_0 ;
  wire \sar[8]_i_1_n_0 ;
  wire \sar[9]_i_1_n_0 ;
  wire \sar_reg_n_0_[0] ;
  wire \sar_reg_n_0_[10] ;
  wire \sar_reg_n_0_[11] ;
  wire \sar_reg_n_0_[12] ;
  wire \sar_reg_n_0_[13] ;
  wire \sar_reg_n_0_[14] ;
  wire \sar_reg_n_0_[15] ;
  wire \sar_reg_n_0_[16] ;
  wire \sar_reg_n_0_[17] ;
  wire \sar_reg_n_0_[18] ;
  wire \sar_reg_n_0_[19] ;
  wire \sar_reg_n_0_[1] ;
  wire \sar_reg_n_0_[20] ;
  wire \sar_reg_n_0_[21] ;
  wire \sar_reg_n_0_[22] ;
  wire \sar_reg_n_0_[23] ;
  wire \sar_reg_n_0_[24] ;
  wire \sar_reg_n_0_[25] ;
  wire \sar_reg_n_0_[26] ;
  wire \sar_reg_n_0_[27] ;
  wire \sar_reg_n_0_[28] ;
  wire \sar_reg_n_0_[29] ;
  wire \sar_reg_n_0_[2] ;
  wire \sar_reg_n_0_[30] ;
  wire \sar_reg_n_0_[31] ;
  wire \sar_reg_n_0_[3] ;
  wire \sar_reg_n_0_[4] ;
  wire \sar_reg_n_0_[5] ;
  wire \sar_reg_n_0_[6] ;
  wire \sar_reg_n_0_[7] ;
  wire \sar_reg_n_0_[8] ;
  wire \sar_reg_n_0_[9] ;
  wire start;
  wire [1:0]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire [3:0]NLW_sar1_carry_O_UNCONNECTED;
  wire [3:0]NLW_sar1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_sar1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_sar1_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_sar1_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_sar1_carry__4_O_UNCONNECTED;
  wire [3:2]NLW_sar1_carry__5_CO_UNCONNECTED;
  wire [3:0]NLW_sar1_carry__5_O_UNCONNECTED;

  LUT3 #(
    .INIT(8'h10)) 
    \dividend_reg[31]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(start),
        .O(divisor_reg));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[0] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[0]),
        .Q(dividend_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[10] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[10]),
        .Q(dividend_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[11] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[11]),
        .Q(dividend_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[12] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[12]),
        .Q(dividend_reg[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[13] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[13]),
        .Q(dividend_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[14] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[14]),
        .Q(dividend_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[15] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[15]),
        .Q(dividend_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[16] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[16]),
        .Q(dividend_reg[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[17] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[17]),
        .Q(dividend_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[18] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[18]),
        .Q(dividend_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[19] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[19]),
        .Q(dividend_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[1] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[1]),
        .Q(dividend_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[20] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[20]),
        .Q(dividend_reg[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[21] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[21]),
        .Q(dividend_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[22] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[22]),
        .Q(dividend_reg[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[23] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[23]),
        .Q(dividend_reg[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[24] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[24]),
        .Q(dividend_reg[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[25] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[25]),
        .Q(dividend_reg[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[26] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[26]),
        .Q(dividend_reg[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[27] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[27]),
        .Q(dividend_reg[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[28] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[28]),
        .Q(dividend_reg[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[29] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[29]),
        .Q(dividend_reg[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[2] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[2]),
        .Q(dividend_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[30] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[30]),
        .Q(dividend_reg[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[31] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[31]),
        .Q(dividend_reg[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[3] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[3]),
        .Q(dividend_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[4] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[4]),
        .Q(dividend_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[5] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[5]),
        .Q(dividend_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[6] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[6]),
        .Q(dividend_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[7] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[7]),
        .Q(dividend_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[8] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[8]),
        .Q(dividend_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dividend_reg_reg[9] 
       (.C(clk),
        .CE(divisor_reg),
        .D(dividend[9]),
        .Q(dividend_reg[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[0] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[0]),
        .Q(\divisor_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[10] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[10]),
        .Q(\divisor_reg_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[11] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[11]),
        .Q(\divisor_reg_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[12] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[12]),
        .Q(\divisor_reg_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[13] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[13]),
        .Q(\divisor_reg_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[14] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[14]),
        .Q(\divisor_reg_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[15] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[15]),
        .Q(\divisor_reg_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[16] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[16]),
        .Q(\divisor_reg_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[17] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[17]),
        .Q(\divisor_reg_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[18] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[18]),
        .Q(\divisor_reg_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[19] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[19]),
        .Q(\divisor_reg_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[1] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[1]),
        .Q(\divisor_reg_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[2] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[2]),
        .Q(\divisor_reg_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[3] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[3]),
        .Q(\divisor_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[4] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[4]),
        .Q(\divisor_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[5] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[5]),
        .Q(\divisor_reg_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[6] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[6]),
        .Q(\divisor_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[7] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[7]),
        .Q(\divisor_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[8] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[8]),
        .Q(\divisor_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divisor_reg_reg[9] 
       (.C(clk),
        .CE(divisor_reg),
        .D(divisor[9]),
        .Q(\divisor_reg_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \i[0]_i_1 
       (.I0(i[0]),
        .O(\i[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \i[1]_i_1 
       (.I0(i[0]),
        .I1(i[1]),
        .O(\i[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \i[2]_i_1 
       (.I0(i[1]),
        .I1(i[0]),
        .I2(i[2]),
        .O(\i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \i[3]_i_1 
       (.I0(i[0]),
        .I1(i[1]),
        .I2(i[2]),
        .I3(i[3]),
        .O(\i[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \i[4]_i_1 
       (.I0(\i[4]_i_2_n_0 ),
        .I1(state[1]),
        .O(\i[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000001FF)) 
    \i[4]_i_2 
       (.I0(\i[4]_i_4_n_0 ),
        .I1(lat_cnt[6]),
        .I2(lat_cnt[7]),
        .I3(state[1]),
        .I4(state[0]),
        .O(\i[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFE0001)) 
    \i[4]_i_3 
       (.I0(i[3]),
        .I1(i[2]),
        .I2(i[1]),
        .I3(i[0]),
        .I4(i[4]),
        .O(\i[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \i[4]_i_4 
       (.I0(lat_cnt[4]),
        .I1(lat_cnt[2]),
        .I2(lat_cnt[0]),
        .I3(lat_cnt[1]),
        .I4(lat_cnt[3]),
        .I5(lat_cnt[5]),
        .O(\i[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8F20)) 
    \i[5]_i_1 
       (.I0(state[1]),
        .I1(\i[7]_i_2_n_0 ),
        .I2(\i[4]_i_2_n_0 ),
        .I3(i[5]),
        .O(\i[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hA8FF0200)) 
    \i[6]_i_1 
       (.I0(state[1]),
        .I1(\i[7]_i_2_n_0 ),
        .I2(i[5]),
        .I3(\i[4]_i_2_n_0 ),
        .I4(i[6]),
        .O(\i[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAA8FFFF00020000)) 
    \i[7]_i_1 
       (.I0(state[1]),
        .I1(\i[7]_i_2_n_0 ),
        .I2(i[6]),
        .I3(i[5]),
        .I4(\i[4]_i_2_n_0 ),
        .I5(i[7]),
        .O(\i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \i[7]_i_2 
       (.I0(i[0]),
        .I1(i[1]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .O(\i[7]_i_2_n_0 ));
  FDSE \i_reg[0] 
       (.C(clk),
        .CE(\i[4]_i_2_n_0 ),
        .D(\i[0]_i_1_n_0 ),
        .Q(i[0]),
        .S(\i[4]_i_1_n_0 ));
  FDSE \i_reg[1] 
       (.C(clk),
        .CE(\i[4]_i_2_n_0 ),
        .D(\i[1]_i_1_n_0 ),
        .Q(i[1]),
        .S(\i[4]_i_1_n_0 ));
  FDSE \i_reg[2] 
       (.C(clk),
        .CE(\i[4]_i_2_n_0 ),
        .D(\i[2]_i_1_n_0 ),
        .Q(i[2]),
        .S(\i[4]_i_1_n_0 ));
  FDSE \i_reg[3] 
       (.C(clk),
        .CE(\i[4]_i_2_n_0 ),
        .D(\i[3]_i_1_n_0 ),
        .Q(i[3]),
        .S(\i[4]_i_1_n_0 ));
  FDSE \i_reg[4] 
       (.C(clk),
        .CE(\i[4]_i_2_n_0 ),
        .D(\i[4]_i_3_n_0 ),
        .Q(i[4]),
        .S(\i[4]_i_1_n_0 ));
  FDRE \i_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\i[5]_i_1_n_0 ),
        .Q(i[5]),
        .R(1'b0));
  FDRE \i_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\i[6]_i_1_n_0 ),
        .Q(i[6]),
        .R(1'b0));
  FDRE \i_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\i[7]_i_1_n_0 ),
        .Q(i[7]),
        .R(1'b0));
  (* CHECK_LICENSE_TYPE = "mult_32_20_lm,mult_gen_v12_0_13,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_13,Vivado 2017.4" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_32_20_lm instance_name
       (.A({\sar_reg_n_0_[31] ,\sar_reg_n_0_[30] ,\sar_reg_n_0_[29] ,\sar_reg_n_0_[28] ,\sar_reg_n_0_[27] ,\sar_reg_n_0_[26] ,\sar_reg_n_0_[25] ,\sar_reg_n_0_[24] ,\sar_reg_n_0_[23] ,\sar_reg_n_0_[22] ,\sar_reg_n_0_[21] ,\sar_reg_n_0_[20] ,\sar_reg_n_0_[19] ,\sar_reg_n_0_[18] ,\sar_reg_n_0_[17] ,\sar_reg_n_0_[16] ,\sar_reg_n_0_[15] ,\sar_reg_n_0_[14] ,\sar_reg_n_0_[13] ,\sar_reg_n_0_[12] ,\sar_reg_n_0_[11] ,\sar_reg_n_0_[10] ,\sar_reg_n_0_[9] ,\sar_reg_n_0_[8] ,\sar_reg_n_0_[7] ,\sar_reg_n_0_[6] ,\sar_reg_n_0_[5] ,\sar_reg_n_0_[4] ,\sar_reg_n_0_[3] ,\sar_reg_n_0_[2] ,\sar_reg_n_0_[1] ,\sar_reg_n_0_[0] }),
        .B({\divisor_reg_reg_n_0_[19] ,\divisor_reg_reg_n_0_[18] ,\divisor_reg_reg_n_0_[17] ,\divisor_reg_reg_n_0_[16] ,\divisor_reg_reg_n_0_[15] ,\divisor_reg_reg_n_0_[14] ,\divisor_reg_reg_n_0_[13] ,\divisor_reg_reg_n_0_[12] ,\divisor_reg_reg_n_0_[11] ,\divisor_reg_reg_n_0_[10] ,\divisor_reg_reg_n_0_[9] ,\divisor_reg_reg_n_0_[8] ,\divisor_reg_reg_n_0_[7] ,\divisor_reg_reg_n_0_[6] ,\divisor_reg_reg_n_0_[5] ,\divisor_reg_reg_n_0_[4] ,\divisor_reg_reg_n_0_[3] ,\divisor_reg_reg_n_0_[2] ,\divisor_reg_reg_n_0_[1] ,\divisor_reg_reg_n_0_[0] }),
        .CLK(clk),
        .P(mul_res));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \lat_cnt[0]_i_1 
       (.I0(lat_cnt[0]),
        .O(\lat_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \lat_cnt[1]_i_1 
       (.I0(lat_cnt[0]),
        .I1(lat_cnt[1]),
        .O(\lat_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFEFF01F0)) 
    \lat_cnt[2]_i_1 
       (.I0(lat_cnt[0]),
        .I1(lat_cnt[1]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(lat_cnt[2]),
        .O(\lat_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \lat_cnt[3]_i_1 
       (.I0(lat_cnt[2]),
        .I1(lat_cnt[0]),
        .I2(lat_cnt[1]),
        .I3(lat_cnt[3]),
        .O(\lat_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFE0001)) 
    \lat_cnt[4]_i_1 
       (.I0(lat_cnt[3]),
        .I1(lat_cnt[1]),
        .I2(lat_cnt[0]),
        .I3(lat_cnt[2]),
        .I4(lat_cnt[4]),
        .O(\lat_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    \lat_cnt[5]_i_1 
       (.I0(lat_cnt[4]),
        .I1(lat_cnt[2]),
        .I2(lat_cnt[0]),
        .I3(lat_cnt[1]),
        .I4(lat_cnt[3]),
        .I5(lat_cnt[5]),
        .O(\lat_cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \lat_cnt[6]_i_1 
       (.I0(\i[4]_i_4_n_0 ),
        .I1(lat_cnt[6]),
        .O(\lat_cnt[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \lat_cnt[7]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\lat_cnt[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \lat_cnt[7]_i_2 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\lat_cnt[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \lat_cnt[7]_i_3 
       (.I0(lat_cnt[6]),
        .I1(\i[4]_i_4_n_0 ),
        .I2(lat_cnt[7]),
        .O(\lat_cnt[7]_i_3_n_0 ));
  FDRE \lat_cnt_reg[0] 
       (.C(clk),
        .CE(\lat_cnt[7]_i_2_n_0 ),
        .D(\lat_cnt[0]_i_1_n_0 ),
        .Q(lat_cnt[0]),
        .R(\lat_cnt[7]_i_1_n_0 ));
  FDRE \lat_cnt_reg[1] 
       (.C(clk),
        .CE(\lat_cnt[7]_i_2_n_0 ),
        .D(\lat_cnt[1]_i_1_n_0 ),
        .Q(lat_cnt[1]),
        .R(\lat_cnt[7]_i_1_n_0 ));
  FDRE \lat_cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\lat_cnt[2]_i_1_n_0 ),
        .Q(lat_cnt[2]),
        .R(1'b0));
  FDRE \lat_cnt_reg[3] 
       (.C(clk),
        .CE(\lat_cnt[7]_i_2_n_0 ),
        .D(\lat_cnt[3]_i_1_n_0 ),
        .Q(lat_cnt[3]),
        .R(\lat_cnt[7]_i_1_n_0 ));
  FDRE \lat_cnt_reg[4] 
       (.C(clk),
        .CE(\lat_cnt[7]_i_2_n_0 ),
        .D(\lat_cnt[4]_i_1_n_0 ),
        .Q(lat_cnt[4]),
        .R(\lat_cnt[7]_i_1_n_0 ));
  FDRE \lat_cnt_reg[5] 
       (.C(clk),
        .CE(\lat_cnt[7]_i_2_n_0 ),
        .D(\lat_cnt[5]_i_1_n_0 ),
        .Q(lat_cnt[5]),
        .R(\lat_cnt[7]_i_1_n_0 ));
  FDRE \lat_cnt_reg[6] 
       (.C(clk),
        .CE(\lat_cnt[7]_i_2_n_0 ),
        .D(\lat_cnt[6]_i_1_n_0 ),
        .Q(lat_cnt[6]),
        .R(\lat_cnt[7]_i_1_n_0 ));
  FDRE \lat_cnt_reg[7] 
       (.C(clk),
        .CE(\lat_cnt[7]_i_2_n_0 ),
        .D(\lat_cnt[7]_i_3_n_0 ),
        .Q(lat_cnt[7]),
        .R(\lat_cnt[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result_reg[31]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(result_reg));
  FDRE \result_reg_reg[0] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[0] ),
        .Q(quotient[0]),
        .R(1'b0));
  FDRE \result_reg_reg[10] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[10] ),
        .Q(quotient[10]),
        .R(1'b0));
  FDRE \result_reg_reg[11] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[11] ),
        .Q(quotient[11]),
        .R(1'b0));
  FDRE \result_reg_reg[12] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[12] ),
        .Q(quotient[12]),
        .R(1'b0));
  FDRE \result_reg_reg[13] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[13] ),
        .Q(quotient[13]),
        .R(1'b0));
  FDRE \result_reg_reg[14] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[14] ),
        .Q(quotient[14]),
        .R(1'b0));
  FDRE \result_reg_reg[15] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[15] ),
        .Q(quotient[15]),
        .R(1'b0));
  FDRE \result_reg_reg[16] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[16] ),
        .Q(quotient[16]),
        .R(1'b0));
  FDRE \result_reg_reg[17] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[17] ),
        .Q(quotient[17]),
        .R(1'b0));
  FDRE \result_reg_reg[18] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[18] ),
        .Q(quotient[18]),
        .R(1'b0));
  FDRE \result_reg_reg[19] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[19] ),
        .Q(quotient[19]),
        .R(1'b0));
  FDRE \result_reg_reg[1] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[1] ),
        .Q(quotient[1]),
        .R(1'b0));
  FDRE \result_reg_reg[20] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[20] ),
        .Q(quotient[20]),
        .R(1'b0));
  FDRE \result_reg_reg[21] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[21] ),
        .Q(quotient[21]),
        .R(1'b0));
  FDRE \result_reg_reg[22] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[22] ),
        .Q(quotient[22]),
        .R(1'b0));
  FDRE \result_reg_reg[23] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[23] ),
        .Q(quotient[23]),
        .R(1'b0));
  FDRE \result_reg_reg[24] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[24] ),
        .Q(quotient[24]),
        .R(1'b0));
  FDRE \result_reg_reg[25] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[25] ),
        .Q(quotient[25]),
        .R(1'b0));
  FDRE \result_reg_reg[26] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[26] ),
        .Q(quotient[26]),
        .R(1'b0));
  FDRE \result_reg_reg[27] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[27] ),
        .Q(quotient[27]),
        .R(1'b0));
  FDRE \result_reg_reg[28] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[28] ),
        .Q(quotient[28]),
        .R(1'b0));
  FDRE \result_reg_reg[29] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[29] ),
        .Q(quotient[29]),
        .R(1'b0));
  FDRE \result_reg_reg[2] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[2] ),
        .Q(quotient[2]),
        .R(1'b0));
  FDRE \result_reg_reg[30] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[30] ),
        .Q(quotient[30]),
        .R(1'b0));
  FDRE \result_reg_reg[31] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[31] ),
        .Q(quotient[31]),
        .R(1'b0));
  FDRE \result_reg_reg[3] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[3] ),
        .Q(quotient[3]),
        .R(1'b0));
  FDRE \result_reg_reg[4] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[4] ),
        .Q(quotient[4]),
        .R(1'b0));
  FDRE \result_reg_reg[5] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[5] ),
        .Q(quotient[5]),
        .R(1'b0));
  FDRE \result_reg_reg[6] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[6] ),
        .Q(quotient[6]),
        .R(1'b0));
  FDRE \result_reg_reg[7] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[7] ),
        .Q(quotient[7]),
        .R(1'b0));
  FDRE \result_reg_reg[8] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[8] ),
        .Q(quotient[8]),
        .R(1'b0));
  FDRE \result_reg_reg[9] 
       (.C(clk),
        .CE(result_reg),
        .D(\sar_reg_n_0_[9] ),
        .Q(quotient[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rv_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(result_reg),
        .Q(qv),
        .R(1'b0));
  CARRY4 sar1_carry
       (.CI(1'b0),
        .CO({sar1_carry_n_0,sar1_carry_n_1,sar1_carry_n_2,sar1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sar1_carry_i_1_n_0,sar1_carry_i_2_n_0,sar1_carry_i_3_n_0,sar1_carry_i_4_n_0}),
        .O(NLW_sar1_carry_O_UNCONNECTED[3:0]),
        .S({sar1_carry_i_5_n_0,sar1_carry_i_6_n_0,sar1_carry_i_7_n_0,sar1_carry_i_8_n_0}));
  CARRY4 sar1_carry__0
       (.CI(sar1_carry_n_0),
        .CO({sar1_carry__0_n_0,sar1_carry__0_n_1,sar1_carry__0_n_2,sar1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sar1_carry__0_i_1_n_0,sar1_carry__0_i_2_n_0,sar1_carry__0_i_3_n_0,sar1_carry__0_i_4_n_0}),
        .O(NLW_sar1_carry__0_O_UNCONNECTED[3:0]),
        .S({sar1_carry__0_i_5_n_0,sar1_carry__0_i_6_n_0,sar1_carry__0_i_7_n_0,sar1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__0_i_1
       (.I0(mul_res[15]),
        .I1(dividend_reg[15]),
        .I2(mul_res[14]),
        .I3(dividend_reg[14]),
        .O(sar1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__0_i_2
       (.I0(mul_res[13]),
        .I1(dividend_reg[13]),
        .I2(mul_res[12]),
        .I3(dividend_reg[12]),
        .O(sar1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__0_i_3
       (.I0(mul_res[11]),
        .I1(dividend_reg[11]),
        .I2(mul_res[10]),
        .I3(dividend_reg[10]),
        .O(sar1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__0_i_4
       (.I0(mul_res[9]),
        .I1(dividend_reg[9]),
        .I2(mul_res[8]),
        .I3(dividend_reg[8]),
        .O(sar1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__0_i_5
       (.I0(dividend_reg[15]),
        .I1(mul_res[15]),
        .I2(dividend_reg[14]),
        .I3(mul_res[14]),
        .O(sar1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__0_i_6
       (.I0(dividend_reg[13]),
        .I1(mul_res[13]),
        .I2(dividend_reg[12]),
        .I3(mul_res[12]),
        .O(sar1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__0_i_7
       (.I0(dividend_reg[11]),
        .I1(mul_res[11]),
        .I2(dividend_reg[10]),
        .I3(mul_res[10]),
        .O(sar1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__0_i_8
       (.I0(dividend_reg[9]),
        .I1(mul_res[9]),
        .I2(dividend_reg[8]),
        .I3(mul_res[8]),
        .O(sar1_carry__0_i_8_n_0));
  CARRY4 sar1_carry__1
       (.CI(sar1_carry__0_n_0),
        .CO({sar1_carry__1_n_0,sar1_carry__1_n_1,sar1_carry__1_n_2,sar1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({sar1_carry__1_i_1_n_0,sar1_carry__1_i_2_n_0,sar1_carry__1_i_3_n_0,sar1_carry__1_i_4_n_0}),
        .O(NLW_sar1_carry__1_O_UNCONNECTED[3:0]),
        .S({sar1_carry__1_i_5_n_0,sar1_carry__1_i_6_n_0,sar1_carry__1_i_7_n_0,sar1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__1_i_1
       (.I0(mul_res[23]),
        .I1(dividend_reg[23]),
        .I2(mul_res[22]),
        .I3(dividend_reg[22]),
        .O(sar1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__1_i_2
       (.I0(mul_res[21]),
        .I1(dividend_reg[21]),
        .I2(mul_res[20]),
        .I3(dividend_reg[20]),
        .O(sar1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__1_i_3
       (.I0(mul_res[19]),
        .I1(dividend_reg[19]),
        .I2(mul_res[18]),
        .I3(dividend_reg[18]),
        .O(sar1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__1_i_4
       (.I0(mul_res[17]),
        .I1(dividend_reg[17]),
        .I2(mul_res[16]),
        .I3(dividend_reg[16]),
        .O(sar1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__1_i_5
       (.I0(dividend_reg[23]),
        .I1(mul_res[23]),
        .I2(dividend_reg[22]),
        .I3(mul_res[22]),
        .O(sar1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__1_i_6
       (.I0(dividend_reg[21]),
        .I1(mul_res[21]),
        .I2(dividend_reg[20]),
        .I3(mul_res[20]),
        .O(sar1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__1_i_7
       (.I0(dividend_reg[19]),
        .I1(mul_res[19]),
        .I2(dividend_reg[18]),
        .I3(mul_res[18]),
        .O(sar1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__1_i_8
       (.I0(dividend_reg[17]),
        .I1(mul_res[17]),
        .I2(dividend_reg[16]),
        .I3(mul_res[16]),
        .O(sar1_carry__1_i_8_n_0));
  CARRY4 sar1_carry__2
       (.CI(sar1_carry__1_n_0),
        .CO({sar1_carry__2_n_0,sar1_carry__2_n_1,sar1_carry__2_n_2,sar1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({sar1_carry__2_i_1_n_0,sar1_carry__2_i_2_n_0,sar1_carry__2_i_3_n_0,sar1_carry__2_i_4_n_0}),
        .O(NLW_sar1_carry__2_O_UNCONNECTED[3:0]),
        .S({sar1_carry__2_i_5_n_0,sar1_carry__2_i_6_n_0,sar1_carry__2_i_7_n_0,sar1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__2_i_1
       (.I0(mul_res[31]),
        .I1(dividend_reg[31]),
        .I2(mul_res[30]),
        .I3(dividend_reg[30]),
        .O(sar1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__2_i_2
       (.I0(mul_res[29]),
        .I1(dividend_reg[29]),
        .I2(mul_res[28]),
        .I3(dividend_reg[28]),
        .O(sar1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__2_i_3
       (.I0(mul_res[27]),
        .I1(dividend_reg[27]),
        .I2(mul_res[26]),
        .I3(dividend_reg[26]),
        .O(sar1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry__2_i_4
       (.I0(mul_res[25]),
        .I1(dividend_reg[25]),
        .I2(mul_res[24]),
        .I3(dividend_reg[24]),
        .O(sar1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__2_i_5
       (.I0(dividend_reg[31]),
        .I1(mul_res[31]),
        .I2(dividend_reg[30]),
        .I3(mul_res[30]),
        .O(sar1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__2_i_6
       (.I0(dividend_reg[29]),
        .I1(mul_res[29]),
        .I2(dividend_reg[28]),
        .I3(mul_res[28]),
        .O(sar1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__2_i_7
       (.I0(dividend_reg[27]),
        .I1(mul_res[27]),
        .I2(dividend_reg[26]),
        .I3(mul_res[26]),
        .O(sar1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry__2_i_8
       (.I0(dividend_reg[25]),
        .I1(mul_res[25]),
        .I2(dividend_reg[24]),
        .I3(mul_res[24]),
        .O(sar1_carry__2_i_8_n_0));
  CARRY4 sar1_carry__3
       (.CI(sar1_carry__2_n_0),
        .CO({sar1_carry__3_n_0,sar1_carry__3_n_1,sar1_carry__3_n_2,sar1_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({sar1_carry__3_i_1_n_0,sar1_carry__3_i_2_n_0,sar1_carry__3_i_3_n_0,sar1_carry__3_i_4_n_0}),
        .O(NLW_sar1_carry__3_O_UNCONNECTED[3:0]),
        .S({sar1_carry__3_i_5_n_0,sar1_carry__3_i_6_n_0,sar1_carry__3_i_7_n_0,sar1_carry__3_i_8_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__3_i_1
       (.I0(mul_res[39]),
        .I1(mul_res[38]),
        .O(sar1_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__3_i_2
       (.I0(mul_res[37]),
        .I1(mul_res[36]),
        .O(sar1_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__3_i_3
       (.I0(mul_res[35]),
        .I1(mul_res[34]),
        .O(sar1_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__3_i_4
       (.I0(mul_res[33]),
        .I1(mul_res[32]),
        .O(sar1_carry__3_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__3_i_5
       (.I0(mul_res[38]),
        .I1(mul_res[39]),
        .O(sar1_carry__3_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__3_i_6
       (.I0(mul_res[36]),
        .I1(mul_res[37]),
        .O(sar1_carry__3_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__3_i_7
       (.I0(mul_res[34]),
        .I1(mul_res[35]),
        .O(sar1_carry__3_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__3_i_8
       (.I0(mul_res[32]),
        .I1(mul_res[33]),
        .O(sar1_carry__3_i_8_n_0));
  CARRY4 sar1_carry__4
       (.CI(sar1_carry__3_n_0),
        .CO({sar1_carry__4_n_0,sar1_carry__4_n_1,sar1_carry__4_n_2,sar1_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({sar1_carry__4_i_1_n_0,sar1_carry__4_i_2_n_0,sar1_carry__4_i_3_n_0,sar1_carry__4_i_4_n_0}),
        .O(NLW_sar1_carry__4_O_UNCONNECTED[3:0]),
        .S({sar1_carry__4_i_5_n_0,sar1_carry__4_i_6_n_0,sar1_carry__4_i_7_n_0,sar1_carry__4_i_8_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__4_i_1
       (.I0(mul_res[47]),
        .I1(mul_res[46]),
        .O(sar1_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__4_i_2
       (.I0(mul_res[45]),
        .I1(mul_res[44]),
        .O(sar1_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__4_i_3
       (.I0(mul_res[43]),
        .I1(mul_res[42]),
        .O(sar1_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__4_i_4
       (.I0(mul_res[41]),
        .I1(mul_res[40]),
        .O(sar1_carry__4_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__4_i_5
       (.I0(mul_res[46]),
        .I1(mul_res[47]),
        .O(sar1_carry__4_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__4_i_6
       (.I0(mul_res[44]),
        .I1(mul_res[45]),
        .O(sar1_carry__4_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__4_i_7
       (.I0(mul_res[42]),
        .I1(mul_res[43]),
        .O(sar1_carry__4_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__4_i_8
       (.I0(mul_res[40]),
        .I1(mul_res[41]),
        .O(sar1_carry__4_i_8_n_0));
  CARRY4 sar1_carry__5
       (.CI(sar1_carry__4_n_0),
        .CO({NLW_sar1_carry__5_CO_UNCONNECTED[3:2],sar1,sar1_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,sar1_carry__5_i_1_n_0,sar1_carry__5_i_2_n_0}),
        .O(NLW_sar1_carry__5_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,sar1_carry__5_i_3_n_0,sar1_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__5_i_1
       (.I0(mul_res[51]),
        .I1(mul_res[50]),
        .O(sar1_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    sar1_carry__5_i_2
       (.I0(mul_res[49]),
        .I1(mul_res[48]),
        .O(sar1_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__5_i_3
       (.I0(mul_res[50]),
        .I1(mul_res[51]),
        .O(sar1_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sar1_carry__5_i_4
       (.I0(mul_res[48]),
        .I1(mul_res[49]),
        .O(sar1_carry__5_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry_i_1
       (.I0(mul_res[7]),
        .I1(dividend_reg[7]),
        .I2(mul_res[6]),
        .I3(dividend_reg[6]),
        .O(sar1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry_i_2
       (.I0(mul_res[5]),
        .I1(dividend_reg[5]),
        .I2(mul_res[4]),
        .I3(dividend_reg[4]),
        .O(sar1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry_i_3
       (.I0(mul_res[3]),
        .I1(dividend_reg[3]),
        .I2(mul_res[2]),
        .I3(dividend_reg[2]),
        .O(sar1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    sar1_carry_i_4
       (.I0(mul_res[1]),
        .I1(dividend_reg[1]),
        .I2(mul_res[0]),
        .I3(dividend_reg[0]),
        .O(sar1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry_i_5
       (.I0(dividend_reg[7]),
        .I1(mul_res[7]),
        .I2(dividend_reg[6]),
        .I3(mul_res[6]),
        .O(sar1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry_i_6
       (.I0(dividend_reg[5]),
        .I1(mul_res[5]),
        .I2(dividend_reg[4]),
        .I3(mul_res[4]),
        .O(sar1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry_i_7
       (.I0(dividend_reg[3]),
        .I1(mul_res[3]),
        .I2(dividend_reg[2]),
        .I3(mul_res[2]),
        .O(sar1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sar1_carry_i_8
       (.I0(dividend_reg[1]),
        .I1(mul_res[1]),
        .I2(dividend_reg[0]),
        .I3(mul_res[0]),
        .O(sar1_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[0]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[6]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[0] ),
        .O(\sar[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[10]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[14]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[10] ),
        .O(\sar[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[11]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[15]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[11] ),
        .O(\sar[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[12]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[14]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[12] ),
        .O(\sar[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[13]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[15]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[13] ),
        .O(\sar[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[14]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[14]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[14] ),
        .O(\sar[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \sar[14]_i_2 
       (.I0(i[4]),
        .I1(i[3]),
        .I2(i[0]),
        .I3(\sar[31]_i_3_n_0 ),
        .O(\sar[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[15]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[15]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[15] ),
        .O(\sar[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \sar[15]_i_2 
       (.I0(i[4]),
        .I1(i[3]),
        .I2(i[0]),
        .I3(\sar[31]_i_3_n_0 ),
        .O(\sar[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[16]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[22]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[16] ),
        .O(\sar[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[17]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[23]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[17] ),
        .O(\sar[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[18]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[22]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[18] ),
        .O(\sar[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[19]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[23]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[19] ),
        .O(\sar[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[1]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[7]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[1] ),
        .O(\sar[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[20]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[22]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[20] ),
        .O(\sar[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[21]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[23]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[21] ),
        .O(\sar[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[22]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[22]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[22] ),
        .O(\sar[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \sar[22]_i_2 
       (.I0(i[3]),
        .I1(i[4]),
        .I2(i[0]),
        .I3(\sar[31]_i_3_n_0 ),
        .O(\sar[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[23]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[23]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[23] ),
        .O(\sar[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \sar[23]_i_2 
       (.I0(i[3]),
        .I1(i[4]),
        .I2(i[0]),
        .I3(\sar[31]_i_3_n_0 ),
        .O(\sar[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[24]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[30]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[24] ),
        .O(\sar[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[25]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[31]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[25] ),
        .O(\sar[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[26]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[30]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[26] ),
        .O(\sar[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[27]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[31]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[27] ),
        .O(\sar[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[28]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[30]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[28] ),
        .O(\sar[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[29]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[31]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[29] ),
        .O(\sar[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[2]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[6]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[2] ),
        .O(\sar[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[30]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[30]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[30] ),
        .O(\sar[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \sar[30]_i_2 
       (.I0(i[4]),
        .I1(i[3]),
        .I2(i[0]),
        .I3(\sar[31]_i_3_n_0 ),
        .O(\sar[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[31]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[31]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[31] ),
        .O(\sar[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \sar[31]_i_2 
       (.I0(i[4]),
        .I1(i[3]),
        .I2(i[0]),
        .I3(\sar[31]_i_3_n_0 ),
        .O(\sar[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h22222222A2222222)) 
    \sar[31]_i_3 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(state[1]),
        .I2(\sar[31]_i_4_n_0 ),
        .I3(\sar[31]_i_5_n_0 ),
        .I4(sar1),
        .I5(lat_cnt[0]),
        .O(\sar[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \sar[31]_i_4 
       (.I0(lat_cnt[3]),
        .I1(lat_cnt[4]),
        .I2(lat_cnt[5]),
        .I3(lat_cnt[6]),
        .I4(state[0]),
        .I5(lat_cnt[7]),
        .O(\sar[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \sar[31]_i_5 
       (.I0(lat_cnt[1]),
        .I1(lat_cnt[2]),
        .O(\sar[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[3]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[7]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[3] ),
        .O(\sar[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[4]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[6]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[4] ),
        .O(\sar[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDF0020200000)) 
    \sar[5]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(\sar[7]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[5] ),
        .O(\sar[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[6]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[6]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[6] ),
        .O(\sar[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \sar[6]_i_2 
       (.I0(i[0]),
        .I1(\sar[31]_i_3_n_0 ),
        .I2(i[4]),
        .I3(i[3]),
        .O(\sar[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080800000)) 
    \sar[7]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[7]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[7] ),
        .O(\sar[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \sar[7]_i_2 
       (.I0(i[0]),
        .I1(\sar[31]_i_3_n_0 ),
        .I2(i[4]),
        .I3(i[3]),
        .O(\sar[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[8]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[14]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[8] ),
        .O(\sar[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEF0010100000)) 
    \sar[9]_i_1 
       (.I0(i[1]),
        .I1(i[2]),
        .I2(\sar[15]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\sar_reg_n_0_[9] ),
        .O(\sar[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[0]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[10]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[11]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[12]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[13]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[14]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[15]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[16]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[17]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[18]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[19]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[1]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[20]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[21]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[22]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[23]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[24]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[25]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[26]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[27]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[28]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[29]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[2]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[30]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[31]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[3]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[4]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[5]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[6]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[7]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[8]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sar_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\sar[9]_i_1_n_0 ),
        .Q(\sar_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000033370004)) 
    \state[0]_i_1 
       (.I0(lat_cnt[7]),
        .I1(state[1]),
        .I2(lat_cnt[6]),
        .I3(\i[4]_i_4_n_0 ),
        .I4(start),
        .I5(state[0]),
        .O(\state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FFF000)) 
    \state[1]_i_1 
       (.I0(\i[7]_i_2_n_0 ),
        .I1(\state[1]_i_2_n_0 ),
        .I2(state[0]),
        .I3(\state[1]_i_3_n_0 ),
        .I4(state[1]),
        .O(\state[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \state[1]_i_2 
       (.I0(i[6]),
        .I1(i[5]),
        .I2(i[7]),
        .O(\state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAEEEEAAAFEEEE)) 
    \state[1]_i_3 
       (.I0(state[0]),
        .I1(start),
        .I2(\i[4]_i_4_n_0 ),
        .I3(lat_cnt[6]),
        .I4(state[1]),
        .I5(lat_cnt[7]),
        .O(\state[1]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "divider_32_20_0,divider_32_20,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "divider_32_20,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    start,
    dividend,
    divisor,
    quotient,
    qv);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000" *) input clk;
  input start;
  input [31:0]dividend;
  input [19:0]divisor;
  output [31:0]quotient;
  output qv;

  wire clk;
  wire [31:0]dividend;
  wire [19:0]divisor;
  wire [31:0]quotient;
  wire qv;
  wire start;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_divider_32_20 inst
       (.clk(clk),
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .qv(qv),
        .start(start));
endmodule

(* CHECK_LICENSE_TYPE = "mult_32_20_lm,mult_gen_v12_0_13,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "mult_gen_v12_0_13,Vivado 2017.4" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_32_20_lm
   (CLK,
    A,
    B,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [19:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [51:0]P;

  wire [31:0]A;
  wire [19:0]B;
  wire CLK;
  wire [51:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "20" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "4" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "51" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_13 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "32" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "20" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "4" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "51" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_13
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [31:0]A;
  input [19:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [51:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [31:0]A;
  wire [19:0]B;
  wire CLK;
  wire [51:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "20" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "4" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "51" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_13_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
CvmaYyJzAT4gGJRlCkE1yXt5Lv9gJbr2gC0wBzixkhI3TupXRLTg9s4Z9WVWp43QDkUuM3VRZjAj
RVnqESt3JA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hHyS2uxRkJ6sHR79RwG8dxYfMwySDoNzo0ZpVSoiAp/93R212I5J1LxM+7EujDw/cO/x9djlyxbz
erzC6/tIqQ2nS2hUZANmmER9YkiA1RlXlIqDOWo8pOFHNj1c4jf7Zdq7OJMDPvKF+fLgmk5Lu9Y0
15oIyfQw7L+gXpW1qEU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Cfhh7YIOGyVJiZpd5j8xa2ugbHZdDDpkNcw6vvVCCgnGCfzlen3wlGk0omzzJqyVapnfg0aPFCVf
eH/noQVGu1bQkowx0JKcNE5x1v5DKH//UNI+lq09SNF0WKlMcTAGlNSUzO8kgVv9uNbKUHDXodcD
5iGh6bHMhVPSu1QKpTfJlIMd2CMz0JfDQiVbfTaAGKvrQhaqVte7pYpnqiXM7povPwt/ntWHBH4s
XSF4J4eDVLMuQmQNy3vrqFdEUqmQFtLWgNRpG2fwo19Y2lRzT3ux5SiA0Iv55uR6x7AG21x8BZlD
JC102ufirdrREfWUzlClY8zmr+TUHpTF/SgPMw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UWceDgHVHZAg17Yudaw03bncVn75AJ6y0RYlYeqdZU3kMG9E1W6q5REaQAI7sMZSrC2g0zavsx4w
utskoq80P2avoebtdvBfjr/nBCQqUN3AvM3GSk85froboZgk4fCQ8UtEj2Qk7ob+ox/md7d9P9dw
2YULi+eG04dUc1g45wwF0ZoZdARk7Ml+fXMnm7zxmvqVieAEsVq6ETZN/P0pwvIpAakLTayKriGC
qcrb1S28bOuV+Na/FX9rxN6hM5aK7vSdFqja5GGs32r9UVRIkX6i7uqS9pWQDR0Qa31W3z6wrRrT
+2wzEwNMDKYuWVIM1FQo/Tp0NKa1Y+kyjahSGA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tLsJPLnIUk5FSxPTGLkNhAFldHrP7oFH8h39nfqyEmnC/AmGzR3fePfCEcee3I4TYySABpWhyXIf
m1jGiCuHfIpFkF2EJqjWmBev0bD33cbw1av2xtJRFa5gaQjxChO9URfjedFvCQWWwjlxejc9nD0N
O0V2XUDQxd573YmSBuByzshlxt3bujEd6Xeeb8N8NI8c2ZsfY4693LGdb3k6gtY9ZEoo4XuYVt6n
S2tNFVJTfQjyBEXbuCPqpwGf6bPdy2SKvTE/s4rSIVTO08J6bXDaEOBUGg13XVoJJqrayiJRVuQL
LhoiPzgOqS6ude1uUaMHE/SN9X/vt/6uOsOl2w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jgk19ieS+ZYiySHKvgAHMus0OAx0HPJ59p64LMaYK8CyW0wSM8LIn++sFz9tsOBdLj2gb8IKpSVr
SOX9XXXM2pQFSME7x8q0m+EPg9m1+ghIpW4bU/w4zVq4NBjYydZCI0Hpy+X3op0a3+eENVEw5SoK
4R/zOL7aV/2nZ//wkaw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L/BPRr/PHH5da1O06dKRr5ST8eskM6lzR1UPuTvZQ6RCsFEjTD1HgyqjW7/ypnIq7V5TYDC553+Y
rJnEENzDc6RSpzenrYxw7NrURpUedIWlCc/PEf5Zq9gu1ESkpND7t98rc+uiAz7zsn/pHD/K50NR
q9l/gcWkOCgArmADo1Lw9usrfZ8ECIPKY2kLxeTYbh4fsrCpPQsQUk4NxX3N1Q0h3RRUCdHSFc0O
lvGip/vd24OK8zXDMaQv4fPmgToFQMUvLrJXErEUeRlkpxkcX6g6Zu4RMWwwmkNIfZHpc5K8Q3RL
MMc5rARUSXbNbpf28H3iyAMZ0y+EgI0CrKwooA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I0OsnZTumiIitzBl6fpGAGEFwC0LuNp69Y9/D3UnGb+ulClhsM7s1olTjbfS6zu5glu8WgrWI8kp
3ZS/IhmMmZNX8U6OcdGBAKQByVnIxqNoUZv7sO8KbmBb3zfcpaOhPwrGRLWpdwwE5hSqnzwJB00j
4mUbY1itgCPNEvnhUqjKibFn5yjl8dk09KZ2GItQJQfCyMnwFj+LNsSzge3KQeEXPIer5UKKNGZe
b7xSnDunvjOPFYS6Bi2sj9yt4UacjiwlC2r2fkL8D6vuGiwJoIIPTAUfJLM/p1fshqyVWbHSO/lK
aqoLAEYLV57wHZpG4Qq9oStICBhxkNQClDWOug==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
akDIu9JtlYUNJamJtzxII+8Ydecx86MCUoZxzQLXzJGTxUeA9NZSOkyWVqfkO8PxJrXB1gbdY/U1
ezN9kk55FNsE/w5Y5ItrREXnccsLQhCxGbn4KPLYSVXKn76mOMwIRuTJKSqh0K5NM7pBcVOTbOv3
U0sk/BN5NkQsNRPrjt8Jbb809Bn5nNGpYf9j6DM3RRRCgDD2DlOUmcieMFYrCehbMtakzUD3tqUU
QQJp//jTA/ylP04b8rG757TBAq7nm+kCwYQ8/yiT6RTy8hqsYkEZIvmqLmLj39VRMVd+KPm39NLR
YpxHJyWfjoYV04Q/XQd81BhOs2sad+EWCuVx5Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22768)
`pragma protect data_block
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
t20DlQWirTgH3KWZ663v2yD8aLlbY5IS7A==
`pragma protect end_protected
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
