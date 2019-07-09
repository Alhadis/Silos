// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun May 27 21:08:30 2018
// Host        : kacper-pc running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim
//               /home/kacper/SystemyRekonfigurowalne/centroid/centroid.srcs/sources_1/ip/divider_32_20_0/divider_32_20_0_sim_netlist.v
// Design      : divider_32_20_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "divider_32_20_0,divider_32_20,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "divider_32_20,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module divider_32_20_0
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

  divider_32_20_0_divider_32_20 inst
       (.clk(clk),
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .qv(qv),
        .start(start));
endmodule

(* ORIG_REF_NAME = "divider_32_20" *) 
module divider_32_20_0_divider_32_20
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
  divider_32_20_0_mult_32_20_lm instance_name
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

(* CHECK_LICENSE_TYPE = "mult_32_20_lm,mult_gen_v12_0_13,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "mult_32_20_lm" *) 
(* X_CORE_INFO = "mult_gen_v12_0_13,Vivado 2017.4" *) 
module divider_32_20_0_mult_32_20_lm
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
  divider_32_20_0_mult_gen_v12_0_13 U0
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
(* ORIG_REF_NAME = "mult_gen_v12_0_13" *) 
module divider_32_20_0_mult_gen_v12_0_13
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
  divider_32_20_0_mult_gen_v12_0_13_viv i_mult
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
Ti0dlVTeFJQPMEyw3UgBY5Ife62Xl0bQisLdQH7n6MGN9GvMKncyKCyF6o4i8fgJPTyUhSUq8W+S
nHAu5bAsP9qwlK+54g4uRuJxBDsyWUZha4jp/dvlNMGfeTf2Jk5UDBWFTt/cScEZxYHzTN734bIG
5Pt3UDtky88UVhkGpdqzrlgkQDkRJvUTiqlTTuka3ttAm533JRgT4iBa9eYfpQxOyrkFETgJGY4S
fFZ/ITSGTH7wc4GexGL0LByZT4TLmZDgqDp4gxGQfO5UaqL1noKqZ4mE0edSY7UuUgl6edn9XlaC
XrDgX7tfEURmZoi7dZqRY1CMMagzCL+pXJGhYA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
e7t4tacBZGGsKUNDIxFwU6kuDtWbotFX1UxS/0fuIBIbd0zOWS/Fvj/c/8vgteoE7p199d3o86iV
QfMzScm7I2QG2mkzB1rD6GAvCpTH8kkBZyG7/+RxYsy86yNTFuQHBBPgI7y13Dvzzqu8hdkCqWOX
AlS917XvStbr7r2a0DXdIteRxYz3yx7tHe7eBM/zV9aFtMWsU8EZZisDmFr03VXkhW0xCySDyKPD
dEEyL81KV9nY5Pphmtc3SSB7tNMU0IWD9YjJP1YCyVkL7h0Ji+CHdVg3xA4CaPPmSR+zgC4tN5ep
b7qrBx6OISEjXzNsRpzghCSnROLaVxLUinGX/g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22720)
`pragma protect data_block
MxacveBcHAXxnTGSqpSmytPIGTQ7mRyw6ZhMOGxIJHuePTF8EoQg0ozwO9Eaie/kpUNBoDMRgbXz
EZJWq9gv1n0FFxRGZxfwJ9+g6UCP5q4IsSJIY6ZRnUFyX9vuYxDFnjNM/JBNuAwqIidETZxiXP71
7zmngHmqSt3wy++epIj6EKVSGpms+3GfnfSEa6sOwexGbVhvjdufajyFzDeN6IUIx61+Yt150lPY
Dl9o4Z3MhiY2GadKfO8o5/wQ5F70pvz07o79g0uhA+qm4ZjuA7MsA8LChfBTyIzYB66UXaEfz62A
noI3YtAVOPJpCKZLFBQg1Dcx1lt+EH8A6W4krx7YYv34mgTJeAP/anRG+qhpfR2dE38T+xCTFO1+
+ETlWEaxy/gXzriWK4CTkGSaOHIBLcW+PbfuCOi7F07pfd+HDpd6c+1hdvKfsOvV+rSNM8X2xTqa
cI5uQlQ9Ztbj+1YCEbWBU+Ukjjy/xwDQsT2f/IbUNJ8iomGKk8sw4VAuydWkbATf1KAe0//tnv57
e0Jw1nLfr5wEZk+m5IJXIxSAlG2O8X63JRdMMEMJ3M7/fe8pE35t7U9MyXKTzTnSoouWnhuomkVo
LHrKzx/7QiqibPW5cyTgXui7PYfoL0AzFCd4ZTPir8+i39nmXIA6miiI6H78u+wR2iU7ZrEv889z
XmCpPBiB3hyhzj30yiYabUtKnJ4VUqB7N9W6XQcaWvheeQ4toZUYwEvLn1k9PSIi285rx2pCMH5s
Hb7A+A9EjaMWX8XpzqkY3e05zSr/VFWdd2WVFaTze8gD8hj7O/DTHcgrcSGAaUaVQkQM1Zvz2sDT
w6rEg2VJBDdP9Nh22RYn73zZWBV0e95PsbKCKoOFmeuOq3huLFuL2Aap7ZR061s0ZnHqwbd+IhuZ
3+0Rju+btyYx0FWt8S50Tvj003i9Jgt1w91gX1DFrDctyDQnq/ozjCfG/l2ndZsXPy2WbCYrrcW1
FVKybW0+Q2A+r9twVn5U8+pL7yGWmXNb11eWxDGvdB5XAubQ8hvN6hdlzFNpLCqd5Bd6WE5RLJWV
nkEHkd0GArAyuKWpX5ca47yQhnMA8j1DjYsB/vDqD7TeMyzmvD58wzP1hXCg0ePB+qEPqyts0guT
u8PfgCdEOE9cbDgjQzcsGdxMf+am22E3bUyPm+f5G8PluRi4ff+y+3a2oq1KCXCXVWhyX1k4GNtT
dbGBNkrkAAV51WV8mqhuaqP/t1ftQsUIplmnvIPpEYSgFVqb7bOVZ1XXtc4r1nYp+i0nseAYerrG
AdDSxVKpt7UWFmrdRW+Tk48ZVLptQ78YKuD/oiFfeyyjBQr2IjtPtThNK6iAEPUioF7+JEb1hwTd
JV9dhT82JGWBtXnglKhakT+pD4eHewUVPLlweSveLXpQe8i+j3Eskojmc8e9KYnmZF7ip5jO2vSg
cYe5OdoTUT1HmKehGx9LkynmxiyQx15OuQgpuoLVzL+S8qXUeH6jaFV69EVLov2YeLCFDbUTagZ1
+4GHIadJ/AnKHMBQOPy2IR3Yg18vTaHk97kT31nOwRkglbOPEyx2ZkEAZM3dSav3S4eE+Yrtmv6z
Clj1s2UCRRXJZsKw403pRO/GV6lIbpC/22bMMjL9bEd9BmQ9wol2rJ8fyc+9DgcWmqh970OyUj02
iOeDtsTeeK3fjBKBoBFR+ZDuHo/D+j87YpQiVgSCPRpTNqe+1zGjWxaHKfQZrf8sJw4zwZHST33D
TlUEFHCJfJxEFEEOg8Qydy5EaiCC9uKyBf7xH0wNJ1DIYgOoz2sTTUmX623gnSyKy9XKRvjC20Cw
cD4sMQU0jxAYON0zbJyDRFNEW6BL2IfhycYj/hrS6z0GsdTyejafVqu4zo+a2tPNwuIoKN0WW4qt
HR/1+0Q25sEaCcMrVnvED0MoarkfBFOawVVkbJM2+TnxOSFWZxexr9wchd+0qhZy7/6oLSIjUObq
7gmJ1xc1cRKOFhmHdDnhV1n+9LcY/F4uRMACou/zXM4s1Axq/uarsx4Hz6t7B9GBJB4UUapjEeWv
XsJEO+n/owZmxifmelFTw98fMM4faoNed6q2koBAo+Nodk6qOqMpRh9+aPoOrKACaJabXz5jUot1
65/kIGtLoKQ4IPPMRhsasujjOfmdw6wNQ+kvdXRfCPiqmIA5PFdSZrhyJGIgrnnajgppZoDKIte6
iCQjg3DiUpMe/NAXpj4rdiLPLn7jff7QLLHBipq+7X0TAMWfYbuGXKYl0XAgDg7i4QLRKkLbyzRT
EeKuABhffg/28ecCVMMceiZwRHMCPIkgAZLdskkQ0tzPKbhSFo+IZ+44amAfcRE+bVoaIKxtrFsa
ExuGitHQb6hC2LR7AYKjYr6cOAs+Ggd5XN8+enxU31ibgZ8vIagBbxM+uMSP3KQOxG3hiAV4GUYt
S3RXV2oKR41mPYfv7fC9jS7k9cuAfyBQH15RFbWtufK+Xr+zXAtjJnWB4XDF1+pVn4ZpEYo/rexD
l78Bbq3EbSRk9AL/X9IXV+PvCNJOaZwYfxYlgTsYpA74p55quBwwzcfKocrMInfMWE9gJGVcdC9k
a9l+Ow8u6w8t9OhlDhCYT/rC4BVpjQWT475r3SlB30Yb8FvipFEFexE1J3bJA6i69yn9FRGCD0fp
38f9xUnd0FAE4yYL9OdoIXGsLWfMmuyty8K2bPkRke4wOfbZAjKvOhBpcS+l6fLZb0p4UU3RjPGy
0eepK5Ea9SQxehWRBK5roHXTB/+90Z5BA7BMvHpINGE4aJCukhOcgVBi9lyq5TigCKlxl0J4CXDb
Re9qSKaWU6/pvzBW9+4KKiPrQWDz1ooSJUQdnjQsLb4dPzB8Ig/LfD1H0YkDFG6jmAZ7YpS2+QuB
Fp2RZH3guN0vxLJMuFzPgkIP/jDzmjuyJruMC/T35T61CHFL9YYzwKaa84ktgXWtCsp9Zgi/SLwY
hOzgC9uesq2cOlURlmpmviZpN8gc/HPxV5xfOQmQzqHppgHJx1l9YRJzMOh+TmO+aTU9SCnateNk
I6hX5VbIlosLaVLqb2rkCsUp+rIOYi+YhVTDfwkg1nSHiNLZlDQi3OCUT1NEuy2uIdomh2brxsg3
gEjMqTJuwvcy9Emo7tquKVv8aW5CYWYyC3WqedbYifXFtRCylZ0H/VrfVOXGsUZ89ZWBHeUD9O3L
o1EDXh30PfpAz7yAaSTPjYNDVZpXM00srQW2D6gafeOT8WFnnVoaEyzLonQaUJdm1CvqeS8y2iFT
COMLuCUs2k5c7YvMNqeIsd4Gx1xfJMJJEbKSU4hd52zfXwRkei4DIFVixu3HKjp4IV+6JuxF6v+k
aqBwlhZoJsDKipQeRCSlVIYbGvtQ8b3GFrd9HGBjuUaTvL+a6uiMrVUGbSReqbbpeLH2XuXitiZv
M9Im1wby42gRy1OzjdPEdGNb8GTyJHcwxcOAOisxLKyewWxu73zw6XpIUBrYlc6p12X+BF036jWi
6gBmMKhmYaM6VGKPsV7t5Npom9vz3z4M8GQe9ga6ARP2P348C/aqQ5hI3X5GSxzfPMOS3KHLPigX
4wB1lZRCz7gdHNOZksw3E7fOXOAV6s9TwHJzJp3UGZOq3PpZEEJIRW1uwMALswTjjSPhRnEI/509
mUIeiYKCGejAKoUcVGTKhMNsjsGJCbYH5aThEhlAQ7jkUHboV5cNP2P1PVhNktlHP6fIWUD7i2Q7
RhM4RXM2XiOpkiB/690ZNUWcULvap0nyC6RbjJ/NOGbImlpRZu0AHzzK9rwCt0uBqveFjk5/onDQ
1iILEdo06Ao6qMhroLyLJ6ek1ffgj2GnjjmPBp4K3gbkqFWNyuVgMSaAGQeDjseorxT9pERbj/pu
7zYE0vbHrZ72S9EEgKmof2Di8eWthNMI4+r6Bewcte1ZHW58kftPZWtq2npdzbRnZ+T32t2JvJq5
9vJP5d11X/veRPceZ+SEHTVUYpRxFGCaEeTZx96oa79MLgU+CrxrObYJWiVRz4lCkXX1wwN2b39x
fQqwf/+YM96WXsiZjmx8ExXdEnJMALbnWqy6LxLALypxnccZbCMyfh7f/42STWes3rki8kcdMrv9
lllgGKl8SljbLfAtX5dwdwURMsn6EqNOsGZJC0wm9rKCHfj/baGWgrKSKJGywsLvCHv5D5daxgAy
gZXIYDwKcameJUvfbveKVkVcAxSbbb5+ZyW48rSne7b5Q5VjsPgvUleilgnchMNr/63z4T2Ue4Qo
CxReB5lr3Zeigt5FGqtTrO153G9aoKaEme23e0jbcNellmTPORMTY0inCjFVs65JYy/bywH46GmR
4QDgRoNQmsF/3qwDVPzijzwOLxWrO1Z3T+76RggHoAuRLxgHGlA2BXRjTSUwYsRexXngG09xXSAm
zfnZCoHuNX9W2k5n3AkiTPo+njVHIV/zfZWQnBV8A6Bd/OEYXgz7iZgNqhQ0W6RAKl7wxnoY4rAo
xcAA4dnHF2QpyTe2cqMu7e8JLR3pupyjJVRK7qox3Q3mYp1y5nl+ISUq+32t3ahi9C2NUy1bS7Z3
TI0v7/Pk53RODaCX6gbExqr5UB7Kcdx4AdtqxdPRva35Fo+3G1H0619UXeaEFRELeWSZxXiY0OSu
2N8r5uBh0kMoEGNOjSttkrFz3E33Z0vQSOOhsca8NGvlfsqSeBmv0KcXIr1qeyRcj3XYelkjz8uz
a3z62CQE44RyFNinCGoQ3xaQAqIQsuXkNyyElaL4SbERR0Y6Qbw1HMsOlwQ+a94HrdfdmcayfWFA
CzU3Ks72rIR/wC8r+LZaf4NhkAlkWJGVcaXaVozsz4b1orktt9PtjhdevqMth1CbJnJtHCCsK2Kt
NjIQOxNAnIQ/w9Es0rTelzq1N+vnjvLIC6v0S95l2h92J4HhY7jbM2tLhMPLrvT7HvLF2BDQZBPS
YxYWeEqwadCymfrMf3C5YnjrXQ1j2WTrf82vv6m8aPJhZoIoA3WomjnfR/NNi/cUMLyqu/lIKLWY
oyq1BpS8qGkh6cNhBKOi7OMDJQbHClXKYN/fTUb3qCCyp76tEIs0FnZ3Lzenf2NzyisvW5qvaMCg
XulI9fZ1+TjSOTBJsDIdkkZ21Lz3GQKKf6d0GRA7Qaidzfb9eiiBvj11x3ndTdzzEZyYJ5lDpZzu
cY+9eRqTvsAJAtFyB3rSYYsRsx4SVqI2ZOr4t5/sgihPGWQZxoT+ljviG3bJHpNVx7BRL0weMCM8
J7PBVzFJyqJHpCJKOmAXJ6GMrJnTLi4T+ObIUtllVWwGClMiVUBOQn8k0MkR2JW43ROPTp8Xu7Ij
iRDoP7pi0SDc7W1Lo0dgkCLhF9BBuTZK1FiKYUjvQpxyr4wXje9tKGOhNhYUSaSO/IkJP8P/87rf
Z5nOlI809q3p5RlIyrAevtJu+NEudLaxYHfDYKpF8wS6/GFqR2SxblUtIJv+PSz+N30Kzf/dx+mn
GVPtj2VrxZxwCRI66n0BFkS1BLalTmdaj8Vm4QagEwYK5tsmhUW2A/cPACdf1fakkX7AMARC9eW/
0w/Jktxuf7i8+9ULDrrjfy52cyHipQrEjSPkuJnmBW/F5pjWHmpyrGQmhZpRzW5UPcGzBNGe79+q
NP2Auu9PFgwbGo2Vu4lm/nGP8Geg9+EupuEM80XI5vvcqJ6Vy6n4NYEhlYALB6REEN7qqkR/DFN9
lZ3Xa3SvcThopa4FugBD6vH5c9VjnEE+s148w8d+NkRjVFa29GS9xoEcvjGVIpLt7xpGr0yyu916
xLleHXu2S6bMvEu/eKC4usEDFDkJbS+lK6ingBqhxCUq4K6wAQaQzcvNF6j7ZmpIMw+b2fklOOpX
3J3/7lQmbO/l5xNcuzZMA4Z+EeZ+HSf9c92H+VQPgzU+plRxJamLMgb5CRWAd+t9U5DZjp7yN0wc
w5A9EIy3CVByauAuuJSE43VOJqWDD8rjuhUkE6Y7mFj+HqZsVlaQM4khP9uOyK1Lxa60WHWh5e8I
9+Ru2/td1THyqRphbsaR396eotdi+CuBEsXW9WpXDYZDF4hcsqaQCH+BxzFANSzzpnZ76pSTh7rV
8iTFGi8s5QUU9G1hK3gVqHR/nasiCLvgnZQZtJfvs8lIaKsoqujbe5jrim0dTjuPgL45S3XiYShR
33m6Ywl+ApoygPWPPrDIZbDifY+FDY0qGWdiNcHf2QjNyUbnzPD6ZpnuXa/5oe2R8nEebWY1/y7Y
xOBQu2wwgH4MqqPcncfsoUCTKh129eOjtkkIABDztVX8HF7XGgD71pb3A7SFclgVCI1bOIZ3pbb5
5HwzWQVc0nwn8/94wh9fp1I6u7TSK6laMJ43Zi4npAHvD5fTEKxF3RufnM+vR1tNQTipd5aMEldO
VDzXy9Bb4kWxqOtadfXf64Oc9bCu8u+aUoFwRnoEHLmxUToUjqh4F49kPUCjNWfqn42UI1XXNwOV
q59GFJwoKlqNJCJJPeM3eXf/GsuRZfLNqORzGqt7LANw9YW5y9imDntBNoKUZAMrRWFpkXECO2hk
a/LCaM5httXQI8TdQ/a+f9N5M6azzob/7hy5/9G7846JtmzWFaZeN2hh6Fx8AmJI8zZnhIDzT6WC
kUEEj50s2MHLEZcJr3oJpYkcMS1TxGNY5AM41uS+KedsVm7TD0NM8jx2YOwQPh/U9knZ5MdYUs64
UhdEiVaZPDz0z4ewayuxxWt51BbjBnjDgm9FF0APAlRwuMbg2E1Da8kevYDNxeny6gkKUbtRfrVi
49FyxD2N8c3D2vTIAl/DDxOTf88tjspxZ6XL9Rh/yepFBoCUlWmZLoIC8p71pi+L/AP/rytTG+nh
69rIxBmzMKcRn2NXwDgHJ94naUtPYVH2291pebX4FOahNnuMdmfONqVr4iE7W6ffVEKg4bhHS0wU
KBm7uzk02DrFxl6Pjf09wnzvvaJ9WxifM6NyfjojKMaGDmsVU7WtlQBYIkj/6s4xPh5PJVBV6EIG
NTmoM6lcmTFz/Im4SlhnRctT2P6Z+KVbmlcMudbIzJC25lic3wpYeTaI7l8fEbzhXYkX63p1NFZp
54aKfqSW0tWz6WQdeNaTS5KhVyeCYqXvEyAUqrjHSTJ7o4YmBma1ujee1JXuMEBYdnKWqHJL8vQJ
zYwJwdxUtqnSsfM/O7zn+PJ0f6d29/AgQqpRLJAbKJEvp/pdCoVel54JUDqkjuOtZqJhIrA7OG+6
LPcpVjg3Hf0uZQ5rP7Zm499PpfPyg0FwCrV4M8An41Wjh1CqrS7KCzD02ZYApe+579yaOYfFOJCL
LV8wqNyBxz/hzTom4vydBze0hv+2HIM2YPRruDMspBRlKBUAtnkktyuBsiVNFphoJ3o5aECuRASk
zAavc8THGtELvAcHABIabmTtuMjaRwPISrLtSEd4/W0A7KLirAJP8b4RtAZiCfq6R2YMtq+znObT
iHAdpYkU9whlvwsHgQsEJkQpYepplw9exDXnYA8vt+XMmXMukdoSgCO3gOlIiRwyBxVv6UPwiVjq
++u9uv5f/GGxTjQIFhAS2cM7/RXKiyrLQiZaqkizCzTX8W19RJ16Z6m+MO8cwm+fPPTZUkoRjjzL
qgw92qlmP1d92/7FhgWjaKuaykV9r9hc8ipC1pwbl3l+6cx17Y1S08KodXvDmDEbW81y6qp5RhK7
yvPi+6Fqy6JQjUyGBhuTOVSN2Vx2aCjOy2pBBgsWXaEQ98f5flZLaIHkVtiUAWvlMF9JepeBOjHy
JhTD4cE8fVUJUR1XfFt5Vcsh/MO39TxQ7zijXdKz82/MeK0NXhLclYKSVnqOvT8VDzZ9mACTNC90
utw/ffCizxYXYD5FN2rUI8Fd0efHF2mFRAhGF+BlO2SPCEf7W9mrxk5sryxJrwgSqwuZes5Jt+U8
GezbQU/0buTJOyJYxrMzPRPHpel0iBv6l5X/sXHbK0fynEGl86cmctYcfUUwhTqGJOOiOqBsgXiI
zuvWJMiXsus7whvvCwt7TIrDnAMjkYp8VOMgQsj5u4Ee81q1cI7xEhbSz3CN9xGw07JyyuNwa4hP
DNmbWwMBAGUpPvvjB/XRFYX+FGnGarv4bJT1DH82h/CkK97hxuGdTZ0UFV15aRybLSmUC/XJAqVR
+8Z2xxd0WD6vtiVo5UlNxnh7IzcWNqEphyBYepp3UCeHb3H0Z9Cfzh2j9rMzAPavaQ04uBEAf0w7
QiHOstbYSev4mn2J1hs0mNNcyWIDp/xsRijOIHkwQHq7gXI+yAt9eXSpTrUxWmCRpKj1DMvUyXdd
6EX8w3UlOBIL7pPdbfM8q9dcHeMtS9cZxtyFDtUGSWwj5/h1C5eDS9pxPMQ9Q4FNyPXAXFanw0SE
WAX0cs4Eu4aJWQkxdCM+Fd402OWU0BEJy86tK09ZHXmVXRIWZhtk2UjAen4HhlG15vBlWKZMKTg5
K0garr2QPk8rJk/7ArKggRpRA+qZBvaOv63BUcIgSgce9t2TTfJJ2lCFiSUuxYH/N8hDx0FkDV0O
bt2X4k9OZqdS2Mx3mQrgtHXy4KMHbdqBrGImemLWoHlbUVSGzbJWH/ntDmrQdGq7GNelan2QT5Eq
Y+7x/o3QfV+ilpbG6v5u8eyHPQbLdLtG22ot+3rvB/FbOpTWa4d66YaA2G9AG3GINV2IkHj5eX1j
P/JMn/S1AL6JUhqG1xSCXmmAC3PM3JXSuf+TWqoRgrefR2AV/tOKc4ymEfT9/OVHuPJdJ+iOripb
2F5aFf1r7rwSIeUyFyWRf6v2sYorHlYvRpN0I1qlvugaMM+Ovf/tdODtvnx7urqlkk2L1GDzCyPS
1fEIEZ6nA+8SssFeRhe3GcDJxhvTX/Y3W8fePLTNI84TurfCvPgOfMnwoySJT9lFRdrFY/bp2NUV
lvXztKrLnztIcPScwCwd1tVbiXvwu5u1tn429gBQLUkQTskLGy+YXbqM+8j3twopeQqvZhqinZzz
tmPp6K6se+6vFX3KsOp4/m77oEL1kvF7Zkj2rlHmBP5zoZnJEzJq3x+SpGSzaccjQm2BMWU82bX6
JIgk96+Mwvyi3jpM5NlDZNPnQaNNAT4aF2P66syjdPINh+Job4MRoviiKFT4U5nlOX8pZEOmJ3Ui
9oBmq+n+o2HILl6t0frsS3J2PbXf1n2VB8k7rZOTw7gOeoPc3cBJD7+b7+CcaKOADW16IsORN7dj
wIR4i5177h6kdWMpZCZhjESK86AFLxWwcZb70+P9dlxgUMzpYMOzTUv7kwhRBL41HHvApdbAlJk8
aHQr25JjjxPvlYD/Etrgi+2UdWizBZE5fzeM6zdloPQbV1aPJkk4HfMstZDko9j3akFYUDTls34D
0cEjdl4tK15uJl52wpVuopx+FdYmpL9QKId5ysbz+M85e0VXkjO7qIo9KAcsFUkvDjadk7nYwoRz
TLOycdroM50K58KVlu7Hqc/Ck+dKBQvhI3i4qHAs0AP9xokOyNVjzcOYMm5mgmWNQj5EdT0l6Yos
lgmAhTOLidGo3emf3r8vY1QmczJnR7d4/r1BYIvzzoQBsZUyqsFudvVGhf+7db7NXzMNSKLZ/HVt
whgc4x3fsuj9jq7Z2cnshKjN2hB2GLQTR2VIPwvdHryxFtlUHa9BjSmN61IXGMvJ1gitYuntJAuh
ZaKIJiesmDSZJrJmqiRnJvHuzBKzTTTVwT4H+is15i9sOvBr53NtN6nO0Pvk2fRum1qjP0iJL/Qa
WdpJ56XzO9dU8mLQYaAaww0RfOdBJYtTWxCBhmcasOOekY/dB/vfiIXAzQTyXiJbYQaTMpUv0Tf+
IHQQm1gTIuNuEJmUPvkBOnTmiaGDdsOH25qLhaB315IDdfzjZqbDWRbuydaDtJFLf2JNmIpNmzkc
k8bl9jTc4ceqDylfJjW+fkwhsNuxwuxfAuy9R9vMk3c0NpryWCM7ZioAQdkLKxRGZOcrUts2fD9h
8YDrSy+yyOsVTBXO8yjBvY3qb3QnONWszSFcAsxovPMqHusRGbIoBnxiv3AbOLRsMejWQyctgX0E
amBD+d1gW5x+DWT5R2+/TAKKMc5eTwdeAcEb/XVQNzlmlEmunY+6Tbg+nxfk9uHx25r2CsPOrs2n
fe3ElXqt4joZ4klSR+OXnJ9v8sADGM+J+HeiW3T+zKqtIivL06PWwCQ65vwATm4MPmYJXLrZVBJs
6SZVkOnmcRFxj4z0UPEJXvo35ncSFSls7iN1MqVsTpqpmdZQvB0V3V1lLj+PP4L/bjt/8nGEEmj5
+s57keB1rNbx0AIuqbxWq8cEKMw5omj4SL6ia64A6E2JJMhfD1YuFsRf3CykJI2lkX08hjiIkc6E
jdG3NQRHU2fBsuc/sVjleasm9uYjsGKvyPaCteVQpXnFs03Wz27gQYv8PXwdYLSjTlMScDVFy+j0
zzH1VzXpYtIKaqu427IyLgMBcaambjfTzSrtHn18rU/92yO+6DifMqTR4iI0Pp98EXXzxOFJ05F1
tgnMvruY1GMK0qdDl20+JQs+w/DSvujm0qCoY0MSfGxBspOFzIrSsmaje0JWWvhOfEXgn7x4RYw5
Jyzh1AL/ITv8TkOl21UL+265VXYKnidkYO59n5hNpVbr257KivgjOEXKlRSJjIJeyF4OiTZFuzgR
QV2X4WeTmN4HIDSPqbGCld7qhq33EJ0BvS+uXgJGP4VXPB4bbAL3Q4uYVrIQw2SjjbbubYmUrEUx
GO4M2JNkLvMnAJn4CaxkxXcVEuirnli9hBPGymcMdjpVWxvt513TQ3SaC0bsPMwOV43vU6fn7JBX
950m6R6RzJvQXMtaU15TLnQwRi82xwr3wxqaifRhZ0jZKOpHI7xUcjJ+5nbX03HwEDbSQ1+diqgx
AHH0BOUoqVbWkOt2BRBGs7NLPzBTz5fPPOLf+oo2eEf5lJVyTOiH0DfGmdPrXPJ0VkcdEcisQd8r
Bfrra46nYDal2m2jkNQVfVs0N3T/ksI6sp0GinbnhZirU6caYFypTMm0NtTJpSieMqC55QgZv5YI
KoO+xnaabCksn+1uC91RnlhuqXlvPPx9jsM7aQ2fJpeBQrytysP1q4Nu4KT2esucDSQEPbAGXOz1
3VOpmWVm/LFzWl5Z+y1qmKJTDqKiFmNb5+fcof0nkb7Q2hx21hdAu9qZivYrnaNub4OSSdnf2NK4
I2Bq0ov6+/Ahl7ShLP6IiAEOqWQjs4d5wW8yo5CYw9PaaC/cGJZG6Xkswv7O9KBz6p2Q5cTCPSSs
pl3qibeJARF1YCKdKsyMfqIQWpErXAo+1el8vLkTT3gtLT3eu3L2goKL+ynB/XXt1ULRKqaAr7Ve
2zPk+x2ky1IvlqETKBxN86cWNXdl9gIn/SEkyZ7xfBfHJhlYSNh0TXiSnAJ2WjisFo+64UWR4YND
P27ITieHzLNHZcEp4m5nuDWLpsvH9lmnW5sHtuhK7rlS74IHnqt7H3RpHZtYuzlmhOOCm4GG0+Zm
XaW2vvM0Xop3YF1AREEsKdKdsET6633ffNhpXTsFCT0E/XuP6prkZwuNqmmWTLUvo8aAeAbWH8Qs
EzB2LmnOfflicLZDOh+rN/YHPwt4uSQmXmp0PA3JjhQ/6fclvQ8ACl1xjKXzCufH5yFqOkf3eykf
MnUnbiWHhrvzn8nI9gWKipLlqJLcna+BWCjcKKF2VBeFh8UQ8MIaMWNS3h256Cc++RwrHmeP93Nr
fcf2XrRwhdN568TZQUKO+mWW22Gaa6cHD8+79Pvyh/8XF8HljIuQddLrDUf2+zQtzt0/XwO9zhbQ
Wh8DhgVPvZXGvONnrgfvUQE2lWMpnRc+UWwJMl3UtM6KSs/5Wq69SJJiTGECmn+RlQDPN0QqNt/k
IwBMYPFf53VDKEaFLG/rrUQfE3htel5mcsmMoLke2w9qpO8vx0WpVadJxUbq0aURdbOG/VSSYEXQ
PzfHs/sHPHOU2EWGdRSnQBpbCDdE0RVBFoLxTdjJDT/I/4/GueAH9tuMTxC4hNACDj7ww3d3ViLS
f07L/+00FrJm+8Q5gurdVW7nydMbuRA1xxF2qhDa9SQOE1fBt8C/Fs2WtRTmCqC+g/vG/OJDYiip
24jXjNY07xR1r0/0GJEHhhvNZEaM//G7MVsJT8ZqnIfyAuRroGkLHpWd02hI2KuTlP0PFgtVvgG9
dzITtV9LOUD1TQjLuHoKzPBCAM6oZ54CuYOKs4hH0Mte2dBtOvvJyGLAFPZBZiLqU4M1KSdjnhk8
RbCh0PJ3hk05gs13sWl68eDe0haqJWoU9xuQNTNVTr3bPrTbP0KQtWHd3ncJPXtHcKHOvISYxNu8
B6bgCxlgYeqMGCA8zCTppnpmdOkyVkayUa6ARBrxiDqjr+LCoXZahNk0y5rIiTIfIdA6KNhg4yN3
0LDYO+o0h8zSPV66YH1n2IU685TXk67Hy+5U69A+EDplkHSr7lhVDyDZ79cMHJS0/MWu6vtw1orj
dbjLs5fR2/7A/f5KFQXDKNZdOvI7T/XtEmtIoOWbKXjZPVMdeBkNyanof1ZKTyBwXE7oTEdRiKFm
lRmmr/gLiIDUFQFZaX1CXer95KJ8zfSTNIP8TxG5mBPyjnvht0unFbh29rw2XL2AUqjsEEDZFe5x
3IWN3/YHTkrZPuyvgLi2KapXGN9lV+ovUh9EUteP+qWZkEFA99HRaI5InelRx55JnDCPFF4/MDIL
DTYZv1vk9cIPWjKNxMlLDrLxCKKrPCIoiCGn2gRTJJWTPmFHxD3KpgKPrJf7GaZlJt7Y5xom1WuC
VNzq5eP0TabQ8p4onknfa8Ice3CEkpDGSaFvaOlQ2QlWDNX5pXCVTOI82avXDrWgLRDCQSqRHZcb
9Gk9hi+MmcYQexWJbV4B/cE3KDD9akVWUTErI+fL0gRSn1CuCC+z62WQyjJW/NxRaVxJNYYPazHk
aGOKcKuALkqGc5xTOHed8gwNmw1dLhGisf9lWrC2ftwBvrXZerfMyTjkOavbPBqp0nKDWsTyvK8X
COCTeKRFiqPlROfBeAsbHXOqf5ev8pPSMWWov2CT1sWwKGEqm1rmZ68SXu0rlkFQ4L9jWxQx7O8W
K70ckNEt3Mdl29XKY9fKa0/2YGBucJ2wafuPsJZXBtuDH3Ig+BKrimBI+Y/Csb++9AV703kW7ckC
ll6rAGG3f8SHgYwbeb4H7E89ruD96e4u+LEqSngb7mW3+Ny7NbfHAcdj0RtzfI1rrE/FK20VxG6r
KB+688qgXORCle4jOEs6aRpW1NOb02EXudM0MqhiG65DimAJlThfYnOUNG6PWLihYcHFjp96SETt
bSB35X09Nvm49fiPbG4Gil8HEErgcb/nNzvKun5vzOHaUEUOOA8mGG7Gg6gv0oJ7YzbRifU51ywl
R+IKiGKL+prileMxfpKXUSA/I5WtRA8up22zGPFzql8Oo5d7giGHsR41cDbMbi4W9AYVxJQeXBel
EM3IwQ04YXLgxU2DUF8f2JsC/AbpffH0gI+qzHWVCGB6Zh7u+qZZ+wpmq1JAavBJaSOs4KZfeFp1
X6Wu8lML530BeSXWDcwFKwwGz4FZBYny1dbVPZ2ID2WEZHtTfJ1b8ohTq+uPew3QvEcc+t6s/Dsr
IqXTc6GBUSdRliHYw7aaQyNsD3J51758tcHBajxGEX5Jn/JsunlE0nLrRG33Qef8W1bfw9v0cFmq
Mhe/e9gkzsqQlALlQKVpczkoNpEn8PhrRuEB7vw6z8QLSix1w5uhmpcEzFzIhVbNnvdcIcAEjop/
gyg98rOrTcABsGtVz7i2Oyq4Y126frmJ8r+0ahtHV4iLjAjBkfPv+69pPFAuLsJNDRmj3zDKwYNj
w8+UYaqfCLrLUgccfHEDD0/FAZrSF9peohiyHvSgS0sG92sKgW9zSXDYx/069KLNmMObAFyHZaXI
dv6abLrtUREGC98qaVIQQ5jhUMLQjvoYuQuFnYJjFS8DociQCQ3ReRcgwnr1kQN/rIT4iV3DW0Wx
CQ3tsZnvq4IGXdqVTFX/ISwo+Y707pLtG4tE8nDBOQ3ROuY0Y5o73WgHGYAudnLbD+jYsrdecK52
txD5Rj9jwHN0pHiZRRc+kuBoiiq3hSd7JbeLGvSmCqZoP0NifxLjHjld7ayFWFNlWwXRhJZSYo0b
tTIJDeH1XN4LpHaQ2DkQ9XJgavaWzipybdivcdLV8tBCGcxpVbLpAw2AqHlJXyXfjMo0BFtA1DoG
j8gs30iMlQfOcHK93XFAk+S63iA70mNEqWuuoG1kS5f3Z5Ylu5LarbBNFm92VaTqVmw4p2o3F61K
f2PfNNL/ZdgBGKmYynsadYEE0bk8EHmOfnh/M2B8rdn5arMNORu0KZWjMzGa56UXVI0R5xwLiz9Z
8MyJ7vxCaZLwbrYvl8XE+A16GQ+9ykCvW92nNiJncyM5tuLvXmnF5fZt9QTzfZT6FrUWsygV16N9
kOFLjRUOvRo+Dn6hE+JCmEA1tDo0KX8daL1SWLsw/djU7ZOGlwKIhPcF+S44KWJSf+TgFIcWd8r4
OQvYLh/emNBtvCOn4G3TuhK0Mrnm9ssh5p/Zxq9ID7V2N/+JMhNfCbw++uErtSaqobL0wbzbUUV8
iyb/+GHx/qFlUCJUZ5pkPqTeMZTQBPCxQikPsprxDyi8dM6BmvsTIaid1fzdLhY9PyZDs0qnTGIc
m4/WpADU14cqUULts57wETPjuwT7E1Jg7pWOlfCxNXYafCTUlsfydIrXKToRnASsrTjb3KnY7QRj
WEGIT02YM/g+62tQWdqngCx55olQ3W+7k0t85I05Kv0qr8BxWw3jTW7nmyZo3rAHLf+odX6DWJp2
2hnNZNTB0sefv7NvoqYLT/a3j1O3yzlzQWexSzAJNtE97wl5VUflYe3uqSUn3MnZdylwEcOlzlfB
SJ4vRi7FFqyBTZfVSVEm/bEyLfJEd7+PYz7JXcMQXL52d5rQxxUY/PyU0ChCR9IAOeH6RN+g2pNC
LjiN94vmKi7xWSp6gTudKBcZZonIbJGQyetyXRhxLdboWq42Y4g7CiSQOtjLx/jeUJ3RfqNzT8wf
W2nH0+a2vLZAnLrhS4R4VOxIwFa3fKZdeNTKD+F9F0FWwwdwhjM4vHOhd7Jjafng5Adw9n5TM44K
zofVmP5BtHLFW5IH9wgpe28MdCOMz2BOw6sIGCRWM/EtJxwxdYxRKofCNhTU7LptOy1kSnnCw80B
aJxd9aoqBmcKW4GxJ5HatvgsEoeg1XVrkUuadhGvklgF1cBUoXaLM60IkwvHMh07AM2a+98cA8TR
J6ARdsVE4fss0k9DYDkHJzEqwLIxqsh999aJPxkuyHu2hnCE/WnYGYYTei8Mbtw7CK10QQk1Zbb/
OKXkJYU85MD8IK1pUHYcmLPKkVjIqCeJyFCGB7A+WU0oSV1/G2q5nqy8vGhsAUpGEhAl8YjlGrI9
3cwKub1cRs/uZFD1dM+B1O6K2rWQF2qsZ6e6oL1qAwfpcdqvmm9Aa8GR4IDS9v3GsPXIeoEjzoJi
EWWHJ6JGyFKBaxQHwFo8+ZEKx9OPM/zz4vGg5UAsfIqVsgeYIwqvWeznfw0j+ePdLUVlpyOMjve0
OkrV2j1c2ObwV2yFDTgGvmbnEIYHD56Gww5fCDgbYcglaqpAJ/daj20BjUGIYmsUVO2Yz3clucj4
KI6LMYw5nmuxpVQ2AFcaGvQpfZyEoOwVS0d4p7MqCNnA1hk5TKsvvs8Z9YNpwoGoUm17eWhjDxVd
Ag4e16f9oXhWrZBqc9/W+0ae1SDHDy0v+Mw65Yh19F/YwHWuej6Y6fI7VhG8nhvzcD+ZQrVmxe6Q
LuFFc3sjzeKkitfuFbhg7lCsGNA9MB5d4U6pjDDt5/IBKyiTwssQr36bVgCo4fKWS/LG7Gb/fVgf
xrEB/JZVeNi6JcgfcK35zULsXYZJOrL8CJZ5aJ3F1IRbhiNmRyXnFVXd1KeOKdhLv1mojPyZVC+M
X2TaLVhHbSWdQSXpMoDGwaWxlDyXgzcu1c88uNPjJ4j6hOww+Phmmaf6be3mVZIpfC8w99qtQk7N
TTd9EG3+u6juilORn+A+tUx+a9mvzpjwItvDrezfPTCYJz5paev9kq84Atp5xw5Ow0R4ZjsT928q
yl6eKbY1dzKvFYGlp5bbLf2Yr/rIxrb+z/r2yDabEagQRN5DV13mijZTQL3m2Xvq7pVnqOgktyxp
e0BMkUXubB40Bpn1KOg1ixJFiY1o5uTd/wX/UorextoFNP5Pvuy0FpmHB4oms+/IjYW1QJ0JV2IO
mOXyKhz+M6drX8UqMR9CG0fFr2XOOu8zDhph/yH1pMU3jRIVGN4rn/A977rqpz2nAnCDxEiIBhL5
Yfwa8b1BVw96+dofSFeJ/QlpGWR5QECHZK38ZzQuNgiAPgYxiGDXz7AtxeOKUjaRxoxiyPCkH5Dp
m6WEIvPOKatar98Ms+PVnE+QFm9mGwx0YLMEWG8Fq3adSK9fy3dyhqYo5rGzpkvOF0eaP+Nfvk0R
89lprriNHp4Skg61zIidMrcDCsYIxpZJfmSiNR+YRen9QGCppu0F4nR+VigYDmDqVnkDswWAprO4
i1WaVwAWQi3qkbHTy8pnIui6IghT1w00sKPnj0F3eb5q/mU3tVGoZ403CAzK4A/difCiqu+ALKDo
EtowLXVng+npQL6bG5f4bWXp6buFK21lkaWltkLF0HwMPEdVUrhIG2XEonuyjixsBHL1fWIJp5n7
2fJN3pDDiLGXD9EGmg8YoKHFL5dK6VOVfTaEAzDAuy9ni6Vvk9+QOO9Xb/2SmvDAxnCknGuf2lfy
I3yvp5I9DqZO1SBuPK5XvUpTqkJOA2O5oP7/e+zzT3+PIsTjvdM92LfNcPrwUKVn7ObeSfcFypko
okHJKc8i0qwouRLIilJTYoIOr8SInWa9NcX0A9tvgOjTSoLhFUcgprFt/tjiVzox29lpkJ+lVqNQ
rt0QLb4SAjQvltcixumL1gBl85flxMv+rz1ceGI+IDyYusI/0HR+oMq7yz6DQAqKR0JsyS6pwg2L
fG2yIYCiQzMw6D0B2uhA7K6wBEVq4XkJ4Uyzou/hXHPwt2kMcLvxOHOgy+suhZ7DPUMlpszBS9DR
G7gLcRGuNNh6ylliV9Y/ZkDHAmPbhiqbF931jnYkdMqWwSRImP+t4ecndaqFHpuDs2d3Pj62iFKL
tOj5tqNOIiYdd4l1rKGBkUUpOwAjbWFXGxMHDIHCyzLkts6xU+9TClryBfT4ure3u8EPTfSxIFWY
FQO9aOgqRtqJHVFxt4jWsuRnKB4OKFV9wTTQG4AF8arxOf2VSI4HYnnOqyevh8zYRwe3eIoatA7I
5EnDF/+zT36vufXvzPwQ25ceykczHC6x4sN9HS21jyPXfw13mRN6uFR30nFc/glzuqu0npaKoExm
5JWIMI+GcmIgdwUYnRwutHR6WJppVjhw1Ngxdz4dop676YB46YoV+lrU+dhFsC1R0oeCUfQXATqy
1FkKQ+4KTg3tyltczlal69NIjRwevXbGZzHJywYpHY5XHz6SnqMVUBT/lbR4vu4WHrEETP4cBqn+
ohLqMvgdiSoBfatfWrPweA5g9ZzYervmxMuD08OjpetH6jOaCNuZXxXQleTMPq2DKpsqbL03B/Re
WXUL/S7fd5IDSwhiquaZhpD+XezLJBi/YwI7SQ9Dx8IM748q9oLfbSuoQivxas7DFKpAMhPzQI7L
Dm4A62jsYONVKMeSI8RArtom4yxS32/aNrPPGQdloCc6aJIHOVbpdel92wZZEJqTVxvgiexJ0FHM
DxALQBeR0hUVhyzeEpUR0vW2e9hn+/O16epRgHkzabRYsysoU62AKZ6M4xATw2K7VO7vey/KP1Ih
lISjNvuOOsY+TIEBp/DDStBGjlgcSWze5B9yhkdEZ6KDHXAxqNmvqVmhAxAHi+LDFyu40LzXig55
WqFUhTQdGPR3Q8XpE/EsaAYwWoMuiYr7UROU5EYfCsCS3gJuU/v410Bh079JLKMLUsGgFBui/Ivb
0R7OcWTU1+rAz9LbinF3Hxrjv1Uk8GXztcxWH6f9JNAj8YibW93FpmY09twUzthHygPRMeGhw7Rf
snysdLTzizZU+Eo4hLOV/D8Z0jIGoK4N1/7kVD0gou+DXjk4fD4I+ifPBFrqA7Ku9jcCQX1mv33A
9mUrDpvs1gU86DFn80HN6zwPavPnNhTCpwjdIy4kFYJ35naHKZ8320b6XtpZYHKNr3i1iK5d0PhB
OVjeTWHbm/CJCIyMo8MQ2rFYTGuH+oqv6gWdG/1CQ8mn2G+n6DPYLW+70eDFROFkQhcqV559++wm
G6GzQbTcGxLI/UyGmWSC/UaQndVLriLw++ssCDUGJHdz4tx4pFqdFOtMGYjrM3ZXvHUZP6cWgfOS
YcJ0/Ef8F1Ars8uUIVuJeOBd65jY1h481xW14CZnhNvaRu/mjT4V4iIGpcMaOddP+R3moJqgGPqq
gmor7YpA0dCkfgSGqE5oM5HG26f231Nt0SAGR8kLurY/vO2nWRPPpS8h+ZvJ7eS7Yb1qC4mrGTiL
13xiqBcbfPj145foR4zgw0DIi0Qi4XsgWo4gWMDTQfZCq0sfwMdayl124c7S4feWfLo/i8ZnbTQK
Z4W/YxqNjRjc46/DfBJA+a00eOWo7ihsnhphVT1WQLCMq5RiWlHxZq5WiuD0dEyGtho02fOqwwpo
5K+d3tkaW6TcnSIOswOEcdhUrCyqqE4fALKD8q+7ZUUs5tS6HsWP8dyOwZVGSGieVXOhhd7sulE4
efX3vqLWTBB0eceX0zkye9ZOJi8++oQ5eC7b2Z8dJRsFoiUM8UBorWx29jXp+NKPjEgnL8JvWCwa
TFHl92w716lWRXyUdyP5cfp/Oiu1NwIzH6eh8jqOPCGIQb/9Rn9IFzl2vfigbj6tELJvLPIzQV6d
9T3gUHO2DrTo+uU7iQVh3k2pEFcUJE+DOAK6FfO7rN0l2HTKCS7BpdeYPbRzqLPL92xnNvlYEKHx
Q4mzh8bNNslIw6VcyaqerbmiKVyQ5nxwYbNz9DQmmIot9UmAJivZtjMAGd5sJDkrvAU8iO2fy8/J
YI3/cAbgPplyB6Q8oxdo5TNWasdkJMPnKmgvhlb7244hWnk8qJY+ZNdKN10f59zeBJD0A21kfzJx
jgVszkPL2WThEhkex7aAj+QZVE1Q8jG81uz3Bry3M9tsdC2rvLPdKBS0z/Y4Hx3HcIwrlzQBUrsA
O+cWfNCi1SHwTovrXyImYRQ+hYoYTs25PCsKImnJO2f04CdBavD/DAuSZSYnm89ku2+Op8LqpANI
TnxEdivXb+bAJ192kv2Gfk5cYcO76Jar6Tv4DEkrSOwLsNw7X0uo0pSczHV8G/62Z/MnGrjXEEjC
Rg0x+vkCKd9DuKZ+PDEGDzYbtAyvj4iW+PESvGqjoK+4w+DBWQwfeRcY6Ucgd0tZlL1ES9+v1Plw
I0wNqgn5NglNzH6ilVpjUTbI2mw4wRoygQLH7NitSjxd992Fj3s+WBiPTfC86BxxVCtIFoJWaINn
sSP6Zgxb71Togcgh9VzOz/PCfFb9N/Csu0r6L3h7xRMl0Wb9fELWwMZf5ifLOaLQ8q1RD07QBjhh
suhWzjuDMz1CWbSBpBYXj11Vi1INnY88sbGJ4tnjTRBwH3NHxn8Z1YGj3lswwSjw7O/E0AP5R+64
jVER8ZSPv5MPCGAC2FDdF0KuhDQSu/p+AB4VhhAt2MlaCbLH/VDCbrphvIIFymfWD4PiquoxFX+M
CcKk0KsNKavMbibWCRHCbBtUN7FQH4icqwlbp5eR035w5tPJIkXY36IG5k8H4srDQzhui9cy298h
zn+0novN7MjkJkBb4B5//rF9Pd+gp+O8GbgXx/miGpcoiFkfbAS6gUCOyffUfx5mIod+RyiRHr6y
E2pYhkXSSz3bwk8Py04fC6RzBuYyFYC78CFJaOgalTvVr5ri43IOvFvcMl84Gr9zcfZFTSkmqnUN
rwBiwiDUfzdK1LHdzm51dV/Fx97gkUe2tbKECjmnfK7zRboJCJgeHpYzYly5t9a1ioddesfMaKlK
a+MuIIO13ncVi75DNyK7Kl+cv4QKn+4fE7NYFlswbZMqQj53LnMT9WJTG9fF3FqARNhtgfxZzGKp
u9okF/kyoRFT4lAP08+ScB0l/vr5pT3xiOzmhkBl03TBbHkT92wQY1fi0VUX4AK6zekAVpYciMjj
kpu7LDyvomtiNmskdvxAegPpL9swFrDP+s/l2LuuxkrI+/bcO5uGd1rKOFOxWkILAB6lRC6z4Ivc
eL93Yhc5kWbzUVsv0uKLnVD5I3Kith2n6c8NtDANEtR7BeRWKwfelNNQMt0vT775xVdsRxxO98pc
1EdBaL0zRFHysmHiHUuv30Q4yspdLLYkA2yWspblO3Qve8vM5JnyqGm4qrz/e3JwRzcFi0ku4oXR
aIG6yJ3BZvXOCtkqye79WjpRIELVMDaF9EF9VGHaWhzX8nph9iwLdhhb7ChLvjyY4ufzaLimUuT+
xF2MfwuwZtM4Kh7HhmCKkBcFOKQf1lLquFXJW4GzjCjO30Nr2qTW3uIoQTdctmZygXxAKGZM22AZ
02M+D2utsatJIEeSvGzBuxDUTIFf/l+bMFNVUayItaJ4BjbPtcYm7qOi2vPdG6a1fVxNJBQb2K9/
6/k/i6oYN2aIZwo4A+Dkmeey0h9AdSu4iEs0Zp7BHobgV/GFq8suLRLhK8H5u8T3DYT49PqLw7Ht
xNyXbdNu05pr6/CGzOQUblBfkH4rkYU3h1ySJj+Js5EcYax3/dWjY6tdWjO2xN492orFwJTegypV
zJmXlINcDLTeYDFJe8sUvNdaTaTcKfk+5LDvsrOQjTFGqxl90EF/kVA6sLnyDqo3Kp3atsG4bx28
d3b+RJhhH6GvNvi+m4LuSa6M+b/OHA2+cYnzm5TCngR3aGHlUJl4jmUBm9mKiUYCU3qB4FyNfYmw
V9oOQJW4tdH8sIQuOIBqze3sbRhFvEtTSj453bdMvIrSGCwR2S2Y8nMAoPAwmQ+MqhckoFglu/C6
gDS8nuuZyHR8R2/hoaiiB3/vZ4V/qh+k/46QXZOyJxhc+PHgkxmI3mqRfY0e536ylVJjNmwJQ0Xf
ij/TZp159bznc83TEG7UQzpaIjk4mfei5fEWzraITuKz1KMUbhLIj6aSOVbXedZUdK20Hp39ISr4
rBZCzaRiP3nsnRuhvsDT+9gCIsVmgSSzx6n/Ss79+h6I8rt9GYU/l+NZZxIFjiZ250KH0T3LYy7I
3nC7vVdrEyYMea+tafBDHgAQl5lUR73U13lIEStxIfZiKzdrow/Ndr0faA4Cxwrhd/We8rqB8G+v
S1VwfeuJfWjmsZZXREdhsh5ZT0/O6Oj+lrBgmnC/qXA2QYR/xsE972QE1RmvZ8zmrbjDMyeuUB0L
Dw4HvH4GOeryQFjUFmL8MVqrHhdKnAB1QVr9E5PvOPlSLwhYBDAJaVHza5tMmeXZX4+thV1HcuEw
k5MDko0WJEbRB+N8YgU3Q0cLE0bTSAymXBakNlU5KYWdp3Dbdkdh4rVTJaJbL7PGi1TJ3hRqiQhL
EFC1RuC/mKttLty2a1KN0Uxu92dJPDyG6yHMDedGVudFmoKEgqksYL/ynEAQIP+e8J5ACXtki5+a
1BGW8zSA3ChlIt+fmd7QGhihpBYBJiD7TdJ1NaFUjcmTmOcMM26u92hIop3gRcOYodhHPLw25Re1
Lx/DQB6jfZcYZR7aNzyPsGQQmO3z/LUtAv6Fl+j75yPSeAuJtC5Ay8ztzml0yRlAH6gy5bTrGKSr
mCmyHPEvKE2bnf1kAOc1LaN+anxLT8KY4lVV5TSY5x9y1S1HZnGrN+Q6rZv/GHDCA9dDOMiIq5Kl
yo9wVWu4Jth+xjTBAHrvsWt7QeVB2myJKFwcfj6GNB5bYrTPY8gFY/eyOt75ApmI4Z9JpRPY3PA9
if8S+SJSr5MD43NV0nOLV3RqTrt6ugZfNpbwml4K0O7nAc1oF13PS1YIVFhlRNQ/PE72vZ+zQq7e
U0RNg33OVGmNoAKeQ/X+TziLXGlcgkkeWoald3cwAISNyJH/N+296OXFpjTKUN8a+S0oKA1wYoS2
RfBldYrt5Uulp/QE4aX2ZV3MJyD7uB5e1efP1iIEvlLrTzNZ7Sr82tJ6+Fq8WKNd4QklCaiqhMyx
6aocHcb38Yvuh5H09gv8EX/blu5nydAQR7+P1ipG4bO0STbvSpHy83KWDJg4MtKjJ6+j9/M08PhL
Xm1U0kwgCQWpspaROH3koSqlo5Nzbb9gSu+XZPkEdGtKAUcG4O1aJ4frwbs3ftQzYftebPXCWSFs
5IylBf61l8tzHX7o03/Nbtcgm0K23qYwnA6MbIhsoxvDRpkkLXnzDHiSJzTzKKLdK6mmL8DOKlPl
HheYsRsN0uyGmP1Ya/T9eYBiVkshiVXZidHsxBb1Eej7ygAZjfMRASOukfJfLdZBa5YQNEJOSdr/
avJRUUw0EQLS53sCnz3yERRFOY714qNPl59pO7HJ5j4LnduZg8t+A3zRdBftzmOS08PnKWqFu70B
309YwugLiJv+oL5Vd25H9CeAPH4+I2ipWCIax99vQuN1+BLXd38k+eIpQSljx2Dh848a97ghUz5t
Y3oW8aT5RFYILMYi9wy1VccngQ01lfl+aMkdmoMn/hBi1HB0N1NEc1pPqEuRSAG4NpV+FgkMFyku
9G8WhRHIE9LQdXddMjF5TpxEM3hYXouwppS4xBduAoBNrlfpF4EnOkLThAIY2pyQyG0Ah0+SbsF9
aAkBswZLZKatsOB533ICDEbNfXUHitMhwjX+cJxqz2+3JwIZhwrxM9sA67Sk0yTq7nbwr/3WhZ5D
oXXSexc8JIq64N8YoXvNz64VHmx2CoRPtk8+aKxkrYsHojtXgXGjnxMIFMwlb5AAokLx7T7TdGjW
Qh4eyepo7ZekLYuOxIVheAoy7JvWk+rxtSGNdSxw1FmqEsfrZNbTdSSS8jO+pLyELEUVZNR4ScqF
O1dgF2q9fP9hknKprmMzDcw1IJ/W9HjCIUlCqVKYB5hMcPaYqF8pmrMXgtO1tPuQVJXPTW3n4lwA
lsqoJPD0FV/qIPWLCDy6feTkSPdeOPy/gENIK3FSroKc7v67ce1cKrrJSShuZXwwvFM0az1uBA7i
v56Uuk9D2ythOXecfLhk4RRrW/M7ovVyDeBUbZ4Uj84dNg3nNa//irS6P99oKhmcHetfwkmeOpws
ORpUscxL8Y4M8FPfMhhsDrH1rgYZcvOoawYC2gszTq0RBUwu0SzXtN5wfD4Xdh/qWIv4YZXiLXPe
zR6dZ0ppFtt21jsq7/qTMfIpupdBL1O5MoWG3B4R5dGh26Nonz4XswJm9fa7PI37nyDWjGNoJXDU
QobigbUtGbS6sGyqoxRH1WodhZkRZHpeV2ZBTlJPNM7ko5Fya7sxf+biFQTJXg42uHetd6DZuzYv
6h8z3JWFIxg7DM0rH3DJRaH3VDz7f15Ks2bng1f+1pGUbEFhZU5Erody7xBG9uWQCSqq7vle7zHd
t0UNgBqPA9jrjfWlN5TaakPkNfKVkfiOGJo77xcCKgcgo4rS/5E9uCT9ho0LcqX//1uGM1NghoD5
suiCF2vMig3c6lMM5yGKHjePoQ6DBjn4/w/i/yys12GFogbI0XwlgL0ORmQcoNqBxzQlAPuO8uUa
VBlZt3Kd+h0dnjsFHj0B3Bx03n9evMOYueLspMTap46OajewMJoLbf0Wts0uV+vtXB3HEYv4+eAb
TautociBwOAhhnB9aP4xjtM2BVY2SGD/cfbksrXbceLvmGfmRjJCDfxM+BDp2E/sP/tQGtVhXH6W
AktC/sb+CcqcdB/Z5kSD7XQai7UqMd6Xkb0b3VlyvvYAyz/0veTuT0XT0X0xFbSnG7xX9cADNIWx
cJIfiio43aBqsPVQq9MeIf/av2zVUqQ76BwicTuCRh2XzloKPmKSKPMzPnz68tGgZZv/7OeoPD4S
cn9c+Lh3rSg+YeLxNYnNu/3XIIcigPz/ViPxOXL5+S3yYwSt2ZlQqPJYeITf6A5x3864ysAPs9tJ
WWh05dIQ5LKustRoob9wX9wOFWr1S+Zc3JJ4V2gvZBTg1FFfqNkWA007aRmP/nCYk72ftTaNUb5n
hv5vSnxMU2bU7bChhCGKmc0eyw05iD5bFS2wlmUUWOUng8OcV/Y1FQjJUPGD8ny5REC66CyXiBko
jGaX1xu52igTKbQC5AIKjo6/f9y4hhcXpjLtGnY40fqhHUT6DnMoRUcC3PfK9T09iz+SQr5en0c0
nf3Nqaie5MftQ2+1u7MshLUM5RETfQZXnkiPaO+HG/FRyOxZonL0NiBAxZpWufj01aA0kKdaeFtk
g0bynw63a0nZ1OjXDTaLIV9un/hDkBNbbuJdw2LnkIpyidfEsa9W43uznvkfiyeahT+S9AAQHNvD
7yp+tcVSmMZND4YXuZVOfFTbNzpMsfQ8gKmOmFw5aalniKOB0akH5jfWiFL88HxLQVzb9Str9l9J
QUvakoz0zfAffYCzUrFj1HYAgzsKWR22d/qB5Zl8IvIbnCGk/k3feSW7by0105LBfkEMygw2LM/p
odmaXkuDGfnVZnY3vQDh0jUHEuUoLTc2Jsr/N7w3LH/CdFGX/HYagC1TlqF8ry2htVYp3lLrYBNR
5k8j9kClP/2kiJzB5mH+xUrFBfv2iOvxw9pKYPoAuvM0dV/Ak9Y4PffBOXdM51yr2e2kE7car1cd
rDjHW7/NZBs3Eg55fZIwefFxKuRi9hm9PaR2ujDHXRwwo2JCQmoSZKkvMPZ7piYay3A+X1u7FGM8
sZN5L3CClqWNEC3ywLfQRVHk7TpwaXZw/tbNYHAs5tNIW1xcOzWbn6rEd3I0MQq3XD8JcvzPFmQ1
Om+Z70mGXW8yNc/ZUxrC5yc54850prCjGwgvW8uHirb2+4CXVqRmDr3w7vrd0NRSmR6XH/QoVKw7
opCZBjOoFc9eg0M4gTCT0cQ2svs+ly/VgsUTXTxpqmphC+e4yMwy61i4cRo3dU/saWaQjm9e3Xcb
EpjAdzhwKRDsIjoxHNBZ+e/s8xVfs6yCdANzpRhyVwaagVlKpIlax7BdRZ+c6011wD4Tn5sV85ir
pUexybCHkL8VTHXQCFa8UzcJvkj8FXuwf20aL0f3DZuQlqxW9ALVtW6T+XfGAQjculMjXsEwrR4T
/wnfztz7cBXSPOkITwo0hqi1g1Mmw4eU6pAToLYpdJ86wCw2VUXnt7NnOpNI79925zMFOJqp3zlq
HxWWOS9Z8NmRuxQ6lNbm0llxmZNcSDQI2i5ja+S2VA5Ye9wEIZ+d6H6VIHj/x8F7vCmeDkeC1jvj
r5QGzZEFHPwvPI6qkUGwSW+p6DnFCzS0p12KenUiDzlxfYJt8riPPCy3DFH55V1DZawXCAp9HdXK
PS5ngN9Cg1XZqdLrqz7nhEJKbRX9hI0UX5Rb/1n1Nq2sS+YQJhsBCPIXCNMk5PLwSmptIYayGs99
IKYN4IN2CvF0tNbrg7CF57SXGBwRJ/AZQI5zUdAMWQnvNDYjVM46DmkAt+syFPPKlUqA+oYsIMFn
cbR3PM6tTxu5puibiA/HAeeTB9m/nm8TOWJnre+M5rVLDc3R7an04+BaZaTQ3M2N31L6IFJPQv+F
/E3VmmWDSY0DYHOFXX863sh5kXXvS+D3Vek4nha7E6Xr/+0cfNv7GyHZVdCE1FeUrWOoYzL5D9cc
JXSJOyUZL71nI7blxN/Bi4hZxOHQbwBZQbS5LIrTdhPZzCjmMgjwyohE83aD1kE1uexHdcFJR8k1
4wcWULy46G8c5BfT1UBCb97vlcs1V2QvRa1xC+Zf0tuIbvFnS//UJme9aTFDGEaTDZPrpTtc/vVD
l2xM8BX/c+KeGx587gKgK0joGC7goOSlvypHBfotPlN8nYm8ESxAyiObqSwDH5ZQQkKnXyCRxqU7
YRb02v7YVoQF1UNvIGVjvphJgiumXqso/4Onywzf/d32pi0uvmLMIgPl1SidyCkirG01+V/rtlLO
wSXKw/od800rb8q/cebb8Z6HEOy+0bHIb66t+fcnw7vQOtub2Gryn5lyKsIfQUe14Gbw9h3QhENv
m2WDnc1h0/zyGGb6ux5yJhhQ35TOskE+9pKO4oL+w6Zsnb09++S82SsV/BHUnTIUiP0RTFfJl47w
eAQG3c8ryyjz1tRPeL2aiie/g4ZKZxoLFq59B4Czxa3jPhWZHMbGK+nYp/Yil5oW/GfMQp06C5bY
CuJ1y8LdfRbbyUzicVfxu8T3EcUvaTZhr991Qpn9vS4ANsPlYm1J1nY00y5Gg3HjtuA/HTR5KmFP
iXZvLpKn+mUEKBZqVv/npvWRgAHDHYm8i6dCU7P9NLWWIRQeiv3jE7YJU+wDIz/SbMICsJ5giNs9
go/g2lqulqt8HJ1zkzgVH7DGQiEHIQ5lJOhXQrJ6Syk3CnnVLwgWwMJ9Makyxx4SQJNnntSS31Q1
ZGNo/8yDoNdjAHA4YXr56/4nVKL46AYSD9IMAGjShkeeKw13C1AUrK1QbVE9l8Wxd3Em76DLSsb9
e0TLHrxiWw0LgNhKBmU9OexVLYfZKZfNPf1PLnG86O6bhANOLdc3lsCb65Mh4AzR4hsAMHKdn1MN
mFeiec5MaP3ERWVorkGLM5x9HO80ZZyVh8oqiT9nYLx2l/zq7ASede/lrbCteOCjQ7OvAwB8wT/W
FXtOfMysZZUQZtyvGlUEsrAPX6lTbG4ckGhLFK0N1ht0RTomUhSA+Y4AjgLFOvvOgKxzETFqRrw0
1C9ON/T6QdR2rtRyK2BKrUhQWIEjTREzwITL8LopEG6CTIVTXgmBSDAQTE7OX/CsN91/zbB9HUSw
rWu3jiVE95vkN85Mub0xDXXCxBvCMy58QkDoWtcqZeP/6MT7NDc+mp15+fue6zQsRQ/2ATSJgfgL
dS9JpT+GNWRsEjLoJy5KO0tw3CLknATRNG+wyIC7O6mZeD4St42zHmRBMbIiY1rAZQpR533Mo3Hf
GNGSgeRzwtmrWAynwd6M4jwvscnDf3kpp4DDr5+t2/ebhou6hXQyPwThj+mdzld2rxcsorg2LMfe
Qe/rHqFX9cZD5u+I+D6B2qU4JWIdGx0714h9bNIdrMIaizGIkK11quz83Ytp+PmoyUs5tqaGBrNO
K2xMYlxCpkzwpZypkpcfg3p059Hnh4j5s0/XWHR/t+nPU71Lxl4XNVg6BQIGA5t2BKFta5SLrOVq
fvQLdqgQQEOibcw5Ra35XfI2erHJGKUEUWdOsciBUMnQAYHtCovHer6Dw9FyoyhhpiVeOh+iV5bZ
M9bIlb9c1Wch1Tkeuro6sW0qRz7HjJVnzEqe9hgrtN3FCSCIWPjpl9I1nNwZKLvpYh9q8qO18nG5
mKAm17m84pkHx7ecTK+G4kcb/F+UveNoryJ7FgOzIJopE6tZennQdYM/hfmS6QbkvYIrAC1x7GSr
RHWNXLILhjXqXM2K5mmONKA4RzqtJWHd7lfdx4fup2R/Bl28IKsmNGm6/eZ4uOJ7OBmmVvOdHvhD
0LzspOlM2tNG+IjqZF0fmr1+3TiAdCz5Yf10stCG5T5VUdLX/imdPZ+EZ5BpcqQlHZbf36JdrAuy
VYx5ZBQJwFdI6XSJH4TORcP2mbCepUF54KGnMcU7+l/4gSQgFlcDafrzoMZNjyLFEUJN7sxKEwVY
ac3FYSZOQ+wINqH8UX8hko4TDBKhTBp38FGcHXqS3zF18APU4KfnTCckCCgk1T+wicxS84jydMVA
snu5eqxbk0eiu935bOcAzworNZFlelCPp8dWNQnZZU6JT/ZAoY9Ed/vJW1xulQ+hh6bZ+Slz0Pz2
3LE6HP1b3WkPVtWD5FCVgt5+tNDaYpoofsNzRxdHv2UoZCAhc/TR7jkNv8hf2BONAi9ODE/WGni/
CZazY/IWNGMZTIjs95PIpBj5eLmsou+8lqRnBZpCkHdUVKJzxxyqNkcwn5lWmErtfeofSUert26x
vE3tnU6oAH4EA7vCleq++O0IlRbOgkCoZfkEujWdzIi5nm7sw4ZgeNmtaMywMd1FelwR35FjIHnU
z+oGUWH1rUA+GlHKjpmoj4bhzmy/WAySaIilYyWeS7z2CPVcfVS8C7kjKVxiN3sQCRPzfHB73Y7U
p36z7BS2Q+kLkb/Y2xEGtiBa8sTDazlyU3kCxKMFLoO6JDZII4y+7Wsrl9Qne8NcKbqrttnm9IS4
3tzivOM2e0R6KGqNEb+i6q4xh2eCi6xMsIbq3XewzxUFuIDztXUbm+VS0gOkPQh2XdcOKQSE8UAk
FN8UTurIfvjHTAgjBZcDnK0tGAe5a8Hy870SBlmFengXWeqmXYltnJaj9Pq7u/g5f1MChS8aXenr
58O/nyrzReELK6k7n3WdMfCeA8pnHfxuIXQVc0bUolAknn66g5RYR/y9e/44P0MA498urDLvGKx0
nx/TocCYhsGXTVMDuBQxFlITUYAB7Eus0JSYJja440KOuVwtT4gjR3UTGTB54cefl/xTWyc9bHEV
l38QdzbZ4soGUqfNkTMlRpcOP3Gc2nULJeUWno+GwrkHeeAlYjgLGrpOi+lrTlWiumylhy/oqk8J
GoNuy6LEci47O+aUh0/0tDVl68mIfp8uSVG9r3OJUP4OZiW7H391SUG2l0FSZXYmznUwFn0VSpfq
ZHoo66cvUa2FcTOFtFS9dJIEiJutUFu50N2RrdnQ+EYCvYeP2kWR+na7dJBYJ9NO4wUh7ejVJDWr
xEYXptdr8PWU+f7/RZa3eQQB0Q1/3VBlhTJlxpWn7kDKfry2qr56SmD7bNswljygw6Mrtuck+zAH
CuMSR2WCWUO/Fv02xXfbVvekkMvZn/RrgWjaKiUFHsBn9YHsn+QlYwd1a60UJDSFkm2TWGGya/ZV
uRBIzMpsaJicY3t7IiExg8C4ta1NJZSyySsqbbfXB/Z/24brBhjdCtsd6qGCoEritmYC/mcFw4/x
yspEeY/I2PzFzxa4GHL9qQZ/KAfnyNBezEmvz7367hHTmelNtFPTJNJ3DB6B9hHqu/iV15evN5Z0
NkFCmL40dZEEgANCSi8pocpxurUq0sPnm29J+GsQnjhNwTlpYa3H95Dl5vd2a01sHpt09sciCC1N
xhwYRyYyEe8SrE9CbBeoJ4IrOv1u1AX5KD3ErCTFQ2UTBZjg4W/h6faVSBAs/onLFeZBxmgJoG+c
QTByBj8bZBJIPZ/pOoYZqILww2A0s8EYQeAanpUyjc/nWgwjlYHjw/kShzjT25AApyncF8UX90FF
P4G8w0h+UQ0YxAbt0FgbsVhQth5gN2fZRWQFyTW8v2mfTmOVN/ICDhenWVGZYg9nFbLa2UR3l1N0
sDcvM/plJ8cKQ8j2UwpJCmpdYIcr+VLykA0imLpFBJX36CO5YeMQR+JwUznBcwvr7SUFDRXOmjIH
MvEGevM9orADQgY+HV901fk53zkO9WCT88o76D9RHrOZvBYIeskiX7TObs2kApFXn3cc1YE5Rb2s
9qIZJ3RksoVlHhnEndm2W1OzAj50Yl+6qLcHWQC6sOx0OuGEAp+wTvKuY+eLBAA3HBak5s6qLqxW
kwTOZGO4SJJCP4bIY0Lk2bPFwmRW1sk29K+iay54ZHHBfg7WKebTvQc4p7lk4ErrsKvPCnPmxvST
lJflM/nqDJwrXGmdNbqvr7DcA92Cl/E284NIo4MuRR9MMRZ52yC4rYXQOWnsLUoYSKFLTZQAkeCR
VT/mk57bbv2lZJYopR0a5mQc6FC1I/xuIn93J/0Z5EbbYgcakbRNLWSQnwSF0yflDU0BuQaykJSs
COSbjH7OiisXRXCTMDO2AXasTKckUSaRJ7SiHa4wNanCN7VK5+jlwhCe5TCjnwUL1ObMmrBcm0aO
v+H4ysBhghmbi+DSaX6tkLHUGe0efpPv+lhH+I10Qg0+4cAS+0+TqV8OpPgByDTrb2f4cVbUEWlv
92s2EjIr5kAIa+WIi+zNBAo+H8rhrInyZ1eepqbeC85jzQl1pCc64AzTZJ6RKrXpZ7EkhdnHAkbf
UzVD+s7xeaQ+W/sQdc8V9/D6Rpr324oDqFKt4ktoCUdefxUa5WfuvDIyigQKmGtHRUb4N7dC+elg
eV+sK24XBnuLFp946ZkycbPH6m8ORRrz7p9TRkojw+UjjY34sFLtjYKKdeEReldBbSwzULpVVzoC
I7CQvY3Y+edTab9nTkpZqSEPBP5PI84vMdzZTinpExHNSw==
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
