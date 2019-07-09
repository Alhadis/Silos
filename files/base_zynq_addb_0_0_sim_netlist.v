// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Wed Jun 26 18:30:28 2019
// Host        : ACER_7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ base_zynq_addb_0_0_sim_netlist.v
// Design      : base_zynq_addb_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb
   (clk,
    addb_aresetn,
    addb_s_axi_awaddr,
    addb_s_axi_awvalid,
    addb_s_axi_wdata,
    addb_s_axi_wstrb,
    addb_s_axi_wvalid,
    addb_s_axi_bready,
    addb_s_axi_araddr,
    addb_s_axi_arvalid,
    addb_s_axi_rready,
    addb_s_axi_awready,
    addb_s_axi_wready,
    addb_s_axi_bresp,
    addb_s_axi_bvalid,
    addb_s_axi_arready,
    addb_s_axi_rdata,
    addb_s_axi_rresp,
    addb_s_axi_rvalid);
  input clk;
  input addb_aresetn;
  input [3:0]addb_s_axi_awaddr;
  input addb_s_axi_awvalid;
  input [31:0]addb_s_axi_wdata;
  input [3:0]addb_s_axi_wstrb;
  input addb_s_axi_wvalid;
  input addb_s_axi_bready;
  input [3:0]addb_s_axi_araddr;
  input addb_s_axi_arvalid;
  input addb_s_axi_rready;
  output addb_s_axi_awready;
  output addb_s_axi_wready;
  output [1:0]addb_s_axi_bresp;
  output addb_s_axi_bvalid;
  output addb_s_axi_arready;
  output [31:0]addb_s_axi_rdata;
  output [1:0]addb_s_axi_rresp;
  output addb_s_axi_rvalid;

  wire \<const0> ;
  wire addb_aresetn;
  wire [3:0]addb_s_axi_araddr;
  wire addb_s_axi_arready;
  wire addb_s_axi_arvalid;
  wire [3:0]addb_s_axi_awaddr;
  wire addb_s_axi_awready;
  wire addb_s_axi_awvalid;
  wire addb_s_axi_bready;
  wire addb_s_axi_bvalid;
  wire [31:0]addb_s_axi_rdata;
  wire addb_s_axi_rready;
  wire addb_s_axi_rvalid;
  wire [31:0]addb_s_axi_wdata;
  wire addb_s_axi_wready;
  wire [3:0]addb_s_axi_wstrb;
  wire addb_s_axi_wvalid;
  wire clk;
  wire [15:0]gateway_in;
  wire [15:0]gateway_in1;
  wire [16:0]gateway_out;

  assign addb_s_axi_bresp[1] = \<const0> ;
  assign addb_s_axi_bresp[0] = \<const0> ;
  assign addb_s_axi_rresp[1] = \<const0> ;
  assign addb_s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_axi_lite_interface addb_axi_lite_interface
       (.A(gateway_in),
        .B(gateway_in1),
        .S(gateway_out),
        .addb_aresetn(addb_aresetn),
        .addb_s_axi_araddr(addb_s_axi_araddr),
        .addb_s_axi_arready(addb_s_axi_arready),
        .addb_s_axi_arvalid(addb_s_axi_arvalid),
        .addb_s_axi_awaddr(addb_s_axi_awaddr),
        .addb_s_axi_awready(addb_s_axi_awready),
        .addb_s_axi_awvalid(addb_s_axi_awvalid),
        .addb_s_axi_bready(addb_s_axi_bready),
        .addb_s_axi_bvalid(addb_s_axi_bvalid),
        .addb_s_axi_rdata(addb_s_axi_rdata),
        .addb_s_axi_rready(addb_s_axi_rready),
        .addb_s_axi_rvalid(addb_s_axi_rvalid),
        .addb_s_axi_wdata(addb_s_axi_wdata),
        .addb_s_axi_wready(addb_s_axi_wready),
        .addb_s_axi_wstrb(addb_s_axi_wstrb),
        .addb_s_axi_wvalid(addb_s_axi_wvalid),
        .clk(clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_struct addb_struct
       (.A(gateway_in),
        .B(gateway_in1),
        .S(gateway_out));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_axi_lite_interface
   (addb_s_axi_wready,
    addb_s_axi_awready,
    addb_s_axi_arready,
    B,
    A,
    addb_s_axi_rdata,
    addb_s_axi_rvalid,
    addb_s_axi_bvalid,
    addb_s_axi_awvalid,
    addb_s_axi_wvalid,
    addb_aresetn,
    addb_s_axi_arvalid,
    clk,
    addb_s_axi_awaddr,
    addb_s_axi_wdata,
    addb_s_axi_wstrb,
    addb_s_axi_araddr,
    S,
    addb_s_axi_bready,
    addb_s_axi_rready);
  output addb_s_axi_wready;
  output addb_s_axi_awready;
  output addb_s_axi_arready;
  output [15:0]B;
  output [15:0]A;
  output [31:0]addb_s_axi_rdata;
  output addb_s_axi_rvalid;
  output addb_s_axi_bvalid;
  input addb_s_axi_awvalid;
  input addb_s_axi_wvalid;
  input addb_aresetn;
  input addb_s_axi_arvalid;
  input clk;
  input [3:0]addb_s_axi_awaddr;
  input [31:0]addb_s_axi_wdata;
  input [3:0]addb_s_axi_wstrb;
  input [3:0]addb_s_axi_araddr;
  input [16:0]S;
  input addb_s_axi_bready;
  input addb_s_axi_rready;

  wire [15:0]A;
  wire [15:0]B;
  wire [16:0]S;
  wire addb_aresetn;
  wire [3:0]addb_s_axi_araddr;
  wire addb_s_axi_arready;
  wire addb_s_axi_arvalid;
  wire [3:0]addb_s_axi_awaddr;
  wire addb_s_axi_awready;
  wire addb_s_axi_awvalid;
  wire addb_s_axi_bready;
  wire addb_s_axi_bvalid;
  wire [31:0]addb_s_axi_rdata;
  wire addb_s_axi_rready;
  wire addb_s_axi_rvalid;
  wire [31:0]addb_s_axi_wdata;
  wire addb_s_axi_wready;
  wire [3:0]addb_s_axi_wstrb;
  wire addb_s_axi_wvalid;
  wire clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_axi_lite_interface_verilog inst
       (.A(A),
        .B(B),
        .S(S),
        .addb_aresetn(addb_aresetn),
        .addb_s_axi_araddr(addb_s_axi_araddr),
        .addb_s_axi_arready(addb_s_axi_arready),
        .addb_s_axi_arvalid(addb_s_axi_arvalid),
        .addb_s_axi_awaddr(addb_s_axi_awaddr),
        .addb_s_axi_awready(addb_s_axi_awready),
        .addb_s_axi_awvalid(addb_s_axi_awvalid),
        .addb_s_axi_bready(addb_s_axi_bready),
        .addb_s_axi_bvalid(addb_s_axi_bvalid),
        .addb_s_axi_rdata(addb_s_axi_rdata),
        .addb_s_axi_rready(addb_s_axi_rready),
        .addb_s_axi_rvalid(addb_s_axi_rvalid),
        .addb_s_axi_wdata(addb_s_axi_wdata),
        .addb_s_axi_wready(addb_s_axi_wready),
        .addb_s_axi_wstrb(addb_s_axi_wstrb),
        .addb_s_axi_wvalid(addb_s_axi_wvalid),
        .clk(clk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_axi_lite_interface_verilog
   (addb_s_axi_wready,
    addb_s_axi_awready,
    addb_s_axi_arready,
    B,
    A,
    addb_s_axi_rdata,
    addb_s_axi_rvalid,
    addb_s_axi_bvalid,
    addb_s_axi_awvalid,
    addb_s_axi_wvalid,
    addb_aresetn,
    addb_s_axi_arvalid,
    clk,
    addb_s_axi_awaddr,
    addb_s_axi_wdata,
    addb_s_axi_wstrb,
    addb_s_axi_araddr,
    S,
    addb_s_axi_bready,
    addb_s_axi_rready);
  output addb_s_axi_wready;
  output addb_s_axi_awready;
  output addb_s_axi_arready;
  output [15:0]B;
  output [15:0]A;
  output [31:0]addb_s_axi_rdata;
  output addb_s_axi_rvalid;
  output addb_s_axi_bvalid;
  input addb_s_axi_awvalid;
  input addb_s_axi_wvalid;
  input addb_aresetn;
  input addb_s_axi_arvalid;
  input clk;
  input [3:0]addb_s_axi_awaddr;
  input [31:0]addb_s_axi_wdata;
  input [3:0]addb_s_axi_wstrb;
  input [3:0]addb_s_axi_araddr;
  input [16:0]S;
  input addb_s_axi_bready;
  input addb_s_axi_rready;

  wire [15:0]A;
  wire [15:0]B;
  wire [16:0]S;
  wire addb_aresetn;
  wire [3:0]addb_s_axi_araddr;
  wire addb_s_axi_arready;
  wire addb_s_axi_arvalid;
  wire [3:0]addb_s_axi_awaddr;
  wire addb_s_axi_awready;
  wire addb_s_axi_awvalid;
  wire addb_s_axi_bready;
  wire addb_s_axi_bvalid;
  wire [31:0]addb_s_axi_rdata;
  wire addb_s_axi_rready;
  wire addb_s_axi_rvalid;
  wire [31:0]addb_s_axi_wdata;
  wire addb_s_axi_wready;
  wire [3:0]addb_s_axi_wstrb;
  wire addb_s_axi_wvalid;
  wire [3:0]axi_araddr;
  wire axi_arready_i_1_n_0;
  wire [3:0]axi_awaddr;
  wire axi_awready_i_2_n_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[17]_i_1_n_0 ;
  wire \axi_rdata[18]_i_1_n_0 ;
  wire \axi_rdata[19]_i_1_n_0 ;
  wire \axi_rdata[20]_i_1_n_0 ;
  wire \axi_rdata[21]_i_1_n_0 ;
  wire \axi_rdata[22]_i_1_n_0 ;
  wire \axi_rdata[23]_i_1_n_0 ;
  wire \axi_rdata[24]_i_1_n_0 ;
  wire \axi_rdata[25]_i_1_n_0 ;
  wire \axi_rdata[26]_i_1_n_0 ;
  wire \axi_rdata[27]_i_1_n_0 ;
  wire \axi_rdata[28]_i_1_n_0 ;
  wire \axi_rdata[29]_i_1_n_0 ;
  wire \axi_rdata[30]_i_1_n_0 ;
  wire \axi_rdata[31]_i_1_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready_i_1_n_0;
  wire clk;
  wire [1:0]dec_r;
  wire p_0_in;
  wire [16:0]p_0_in1_in;
  wire \slv_reg_array[0][0]_i_1_n_0 ;
  wire \slv_reg_array[0][0]_i_2_n_0 ;
  wire \slv_reg_array[0][0]_i_3_n_0 ;
  wire \slv_reg_array[0][10]_i_1_n_0 ;
  wire \slv_reg_array[0][11]_i_1_n_0 ;
  wire \slv_reg_array[0][12]_i_1_n_0 ;
  wire \slv_reg_array[0][13]_i_1_n_0 ;
  wire \slv_reg_array[0][14]_i_1_n_0 ;
  wire \slv_reg_array[0][15]_i_1_n_0 ;
  wire \slv_reg_array[0][15]_i_2_n_0 ;
  wire \slv_reg_array[0][16]_i_1_n_0 ;
  wire \slv_reg_array[0][17]_i_1_n_0 ;
  wire \slv_reg_array[0][18]_i_1_n_0 ;
  wire \slv_reg_array[0][19]_i_1_n_0 ;
  wire \slv_reg_array[0][1]_i_1_n_0 ;
  wire \slv_reg_array[0][20]_i_1_n_0 ;
  wire \slv_reg_array[0][21]_i_1_n_0 ;
  wire \slv_reg_array[0][22]_i_1_n_0 ;
  wire \slv_reg_array[0][23]_i_1_n_0 ;
  wire \slv_reg_array[0][23]_i_2_n_0 ;
  wire \slv_reg_array[0][24]_i_1_n_0 ;
  wire \slv_reg_array[0][25]_i_1_n_0 ;
  wire \slv_reg_array[0][26]_i_1_n_0 ;
  wire \slv_reg_array[0][27]_i_1_n_0 ;
  wire \slv_reg_array[0][28]_i_1_n_0 ;
  wire \slv_reg_array[0][29]_i_1_n_0 ;
  wire \slv_reg_array[0][2]_i_1_n_0 ;
  wire \slv_reg_array[0][30]_i_1_n_0 ;
  wire \slv_reg_array[0][31]_i_1_n_0 ;
  wire \slv_reg_array[0][31]_i_2_n_0 ;
  wire \slv_reg_array[0][31]_i_3_n_0 ;
  wire \slv_reg_array[0][3]_i_1_n_0 ;
  wire \slv_reg_array[0][4]_i_1_n_0 ;
  wire \slv_reg_array[0][5]_i_1_n_0 ;
  wire \slv_reg_array[0][6]_i_1_n_0 ;
  wire \slv_reg_array[0][7]_i_1_n_0 ;
  wire \slv_reg_array[0][7]_i_2_n_0 ;
  wire \slv_reg_array[0][8]_i_1_n_0 ;
  wire \slv_reg_array[0][9]_i_1_n_0 ;
  wire \slv_reg_array[1][0]_i_1_n_0 ;
  wire \slv_reg_array[1][0]_i_2_n_0 ;
  wire \slv_reg_array[1][10]_i_1_n_0 ;
  wire \slv_reg_array[1][11]_i_1_n_0 ;
  wire \slv_reg_array[1][12]_i_1_n_0 ;
  wire \slv_reg_array[1][13]_i_1_n_0 ;
  wire \slv_reg_array[1][14]_i_1_n_0 ;
  wire \slv_reg_array[1][15]_i_1_n_0 ;
  wire \slv_reg_array[1][15]_i_2_n_0 ;
  wire \slv_reg_array[1][16]_i_1_n_0 ;
  wire \slv_reg_array[1][17]_i_1_n_0 ;
  wire \slv_reg_array[1][18]_i_1_n_0 ;
  wire \slv_reg_array[1][19]_i_1_n_0 ;
  wire \slv_reg_array[1][1]_i_1_n_0 ;
  wire \slv_reg_array[1][20]_i_1_n_0 ;
  wire \slv_reg_array[1][21]_i_1_n_0 ;
  wire \slv_reg_array[1][22]_i_1_n_0 ;
  wire \slv_reg_array[1][23]_i_1_n_0 ;
  wire \slv_reg_array[1][23]_i_2_n_0 ;
  wire \slv_reg_array[1][24]_i_1_n_0 ;
  wire \slv_reg_array[1][25]_i_1_n_0 ;
  wire \slv_reg_array[1][26]_i_1_n_0 ;
  wire \slv_reg_array[1][27]_i_1_n_0 ;
  wire \slv_reg_array[1][28]_i_1_n_0 ;
  wire \slv_reg_array[1][29]_i_1_n_0 ;
  wire \slv_reg_array[1][2]_i_1_n_0 ;
  wire \slv_reg_array[1][30]_i_1_n_0 ;
  wire \slv_reg_array[1][31]_i_1_n_0 ;
  wire \slv_reg_array[1][31]_i_2_n_0 ;
  wire \slv_reg_array[1][3]_i_1_n_0 ;
  wire \slv_reg_array[1][4]_i_1_n_0 ;
  wire \slv_reg_array[1][5]_i_1_n_0 ;
  wire \slv_reg_array[1][6]_i_1_n_0 ;
  wire \slv_reg_array[1][7]_i_1_n_0 ;
  wire \slv_reg_array[1][7]_i_2_n_0 ;
  wire \slv_reg_array[1][8]_i_1_n_0 ;
  wire \slv_reg_array[1][9]_i_1_n_0 ;
  wire [31:16]\slv_reg_array_reg[0] ;
  wire [31:16]\slv_reg_array_reg[1] ;
  wire slv_reg_rden__0;

  FDRE \axi_araddr_reg[0] 
       (.C(clk),
        .CE(axi_arready_i_1_n_0),
        .D(addb_s_axi_araddr[0]),
        .Q(axi_araddr[0]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[1] 
       (.C(clk),
        .CE(axi_arready_i_1_n_0),
        .D(addb_s_axi_araddr[1]),
        .Q(axi_araddr[1]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[2] 
       (.C(clk),
        .CE(axi_arready_i_1_n_0),
        .D(addb_s_axi_araddr[2]),
        .Q(axi_araddr[2]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[3] 
       (.C(clk),
        .CE(axi_arready_i_1_n_0),
        .D(addb_s_axi_araddr[3]),
        .Q(axi_araddr[3]),
        .R(p_0_in));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(addb_s_axi_arvalid),
        .I1(addb_s_axi_arready),
        .O(axi_arready_i_1_n_0));
  FDRE axi_arready_reg
       (.C(clk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(addb_s_axi_arready),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[0] 
       (.C(clk),
        .CE(axi_awready_i_2_n_0),
        .D(addb_s_axi_awaddr[0]),
        .Q(axi_awaddr[0]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[1] 
       (.C(clk),
        .CE(axi_awready_i_2_n_0),
        .D(addb_s_axi_awaddr[1]),
        .Q(axi_awaddr[1]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[2] 
       (.C(clk),
        .CE(axi_awready_i_2_n_0),
        .D(addb_s_axi_awaddr[2]),
        .Q(axi_awaddr[2]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[3] 
       (.C(clk),
        .CE(axi_awready_i_2_n_0),
        .D(addb_s_axi_awaddr[3]),
        .Q(axi_awaddr[3]),
        .R(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(addb_aresetn),
        .O(p_0_in));
  LUT3 #(
    .INIT(8'h08)) 
    axi_awready_i_2
       (.I0(addb_s_axi_awvalid),
        .I1(addb_s_axi_wvalid),
        .I2(addb_s_axi_awready),
        .O(axi_awready_i_2_n_0));
  FDRE axi_awready_reg
       (.C(clk),
        .CE(1'b1),
        .D(axi_awready_i_2_n_0),
        .Q(addb_s_axi_awready),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(addb_s_axi_awvalid),
        .I1(addb_s_axi_wvalid),
        .I2(addb_s_axi_wready),
        .I3(addb_s_axi_awready),
        .I4(addb_s_axi_bready),
        .I5(addb_s_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(addb_s_axi_bvalid),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[0]_i_1 
       (.I0(A[0]),
        .I1(dec_r[0]),
        .I2(S[0]),
        .I3(dec_r[1]),
        .I4(B[0]),
        .O(p_0_in1_in[0]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[10]_i_1 
       (.I0(A[10]),
        .I1(dec_r[0]),
        .I2(S[10]),
        .I3(dec_r[1]),
        .I4(B[10]),
        .O(p_0_in1_in[10]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[11]_i_1 
       (.I0(A[11]),
        .I1(dec_r[0]),
        .I2(S[11]),
        .I3(dec_r[1]),
        .I4(B[11]),
        .O(p_0_in1_in[11]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[12]_i_1 
       (.I0(A[12]),
        .I1(dec_r[0]),
        .I2(S[12]),
        .I3(dec_r[1]),
        .I4(B[12]),
        .O(p_0_in1_in[12]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[13]_i_1 
       (.I0(A[13]),
        .I1(dec_r[0]),
        .I2(S[13]),
        .I3(dec_r[1]),
        .I4(B[13]),
        .O(p_0_in1_in[13]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[14]_i_1 
       (.I0(A[14]),
        .I1(dec_r[0]),
        .I2(S[14]),
        .I3(dec_r[1]),
        .I4(B[14]),
        .O(p_0_in1_in[14]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[15]_i_1 
       (.I0(A[15]),
        .I1(dec_r[0]),
        .I2(S[15]),
        .I3(dec_r[1]),
        .I4(B[15]),
        .O(p_0_in1_in[15]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[16]_i_1 
       (.I0(\slv_reg_array_reg[1] [16]),
        .I1(dec_r[0]),
        .I2(S[16]),
        .I3(dec_r[1]),
        .I4(\slv_reg_array_reg[0] [16]),
        .O(p_0_in1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \axi_rdata[16]_i_2 
       (.I0(axi_araddr[2]),
        .I1(axi_araddr[0]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[1]),
        .O(dec_r[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \axi_rdata[16]_i_3 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[1]),
        .O(dec_r[1]));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[17]_i_1 
       (.I0(\slv_reg_array_reg[0] [17]),
        .I1(\slv_reg_array_reg[1] [17]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[18]_i_1 
       (.I0(\slv_reg_array_reg[0] [18]),
        .I1(\slv_reg_array_reg[1] [18]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[19]_i_1 
       (.I0(\slv_reg_array_reg[0] [19]),
        .I1(\slv_reg_array_reg[1] [19]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[1]_i_1 
       (.I0(A[1]),
        .I1(dec_r[0]),
        .I2(S[1]),
        .I3(dec_r[1]),
        .I4(B[1]),
        .O(p_0_in1_in[1]));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[20]_i_1 
       (.I0(\slv_reg_array_reg[0] [20]),
        .I1(\slv_reg_array_reg[1] [20]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[21]_i_1 
       (.I0(\slv_reg_array_reg[0] [21]),
        .I1(\slv_reg_array_reg[1] [21]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[22]_i_1 
       (.I0(\slv_reg_array_reg[0] [22]),
        .I1(\slv_reg_array_reg[1] [22]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[23]_i_1 
       (.I0(\slv_reg_array_reg[0] [23]),
        .I1(\slv_reg_array_reg[1] [23]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[24]_i_1 
       (.I0(\slv_reg_array_reg[0] [24]),
        .I1(\slv_reg_array_reg[1] [24]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[25]_i_1 
       (.I0(\slv_reg_array_reg[0] [25]),
        .I1(\slv_reg_array_reg[1] [25]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[26]_i_1 
       (.I0(\slv_reg_array_reg[0] [26]),
        .I1(\slv_reg_array_reg[1] [26]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[27]_i_1 
       (.I0(\slv_reg_array_reg[0] [27]),
        .I1(\slv_reg_array_reg[1] [27]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[28]_i_1 
       (.I0(\slv_reg_array_reg[0] [28]),
        .I1(\slv_reg_array_reg[1] [28]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[29]_i_1 
       (.I0(\slv_reg_array_reg[0] [29]),
        .I1(\slv_reg_array_reg[1] [29]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[2]_i_1 
       (.I0(A[2]),
        .I1(dec_r[0]),
        .I2(S[2]),
        .I3(dec_r[1]),
        .I4(B[2]),
        .O(p_0_in1_in[2]));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[30]_i_1 
       (.I0(\slv_reg_array_reg[0] [30]),
        .I1(\slv_reg_array_reg[1] [30]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA0AAACAAAA)) 
    \axi_rdata[31]_i_1 
       (.I0(\slv_reg_array_reg[0] [31]),
        .I1(\slv_reg_array_reg[1] [31]),
        .I2(axi_araddr[1]),
        .I3(axi_araddr[0]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[3]_i_1 
       (.I0(A[3]),
        .I1(dec_r[0]),
        .I2(S[3]),
        .I3(dec_r[1]),
        .I4(B[3]),
        .O(p_0_in1_in[3]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[4]_i_1 
       (.I0(A[4]),
        .I1(dec_r[0]),
        .I2(S[4]),
        .I3(dec_r[1]),
        .I4(B[4]),
        .O(p_0_in1_in[4]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[5]_i_1 
       (.I0(A[5]),
        .I1(dec_r[0]),
        .I2(S[5]),
        .I3(dec_r[1]),
        .I4(B[5]),
        .O(p_0_in1_in[5]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[6]_i_1 
       (.I0(A[6]),
        .I1(dec_r[0]),
        .I2(S[6]),
        .I3(dec_r[1]),
        .I4(B[6]),
        .O(p_0_in1_in[6]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[7]_i_1 
       (.I0(A[7]),
        .I1(dec_r[0]),
        .I2(S[7]),
        .I3(dec_r[1]),
        .I4(B[7]),
        .O(p_0_in1_in[7]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[8]_i_1 
       (.I0(A[8]),
        .I1(dec_r[0]),
        .I2(S[8]),
        .I3(dec_r[1]),
        .I4(B[8]),
        .O(p_0_in1_in[8]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[9]_i_1 
       (.I0(A[9]),
        .I1(dec_r[0]),
        .I2(S[9]),
        .I3(dec_r[1]),
        .I4(B[9]),
        .O(p_0_in1_in[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[0]),
        .Q(addb_s_axi_rdata[0]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[10] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[10]),
        .Q(addb_s_axi_rdata[10]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[11] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[11]),
        .Q(addb_s_axi_rdata[11]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[12] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[12]),
        .Q(addb_s_axi_rdata[12]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[13] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[13]),
        .Q(addb_s_axi_rdata[13]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[14] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[14]),
        .Q(addb_s_axi_rdata[14]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[15] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[15]),
        .Q(addb_s_axi_rdata[15]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[16] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[16]),
        .Q(addb_s_axi_rdata[16]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[17] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[17]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[17]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[18] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[18]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[18]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[19] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[19]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[19]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[1] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[1]),
        .Q(addb_s_axi_rdata[1]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[20] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[20]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[20]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[21] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[21]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[21]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[22] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[22]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[22]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[23] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[23]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[23]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[24] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[24]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[24]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[25] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[25]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[25]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[26] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[26]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[26]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[27] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[27]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[27]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[28] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[28]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[28]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[29] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[29]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[29]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[2] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[2]),
        .Q(addb_s_axi_rdata[2]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[30] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[30]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[30]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[31] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[31]_i_1_n_0 ),
        .Q(addb_s_axi_rdata[31]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[3] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[3]),
        .Q(addb_s_axi_rdata[3]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[4] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[4]),
        .Q(addb_s_axi_rdata[4]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[5] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[5]),
        .Q(addb_s_axi_rdata[5]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[6] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[6]),
        .Q(addb_s_axi_rdata[6]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[7] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[7]),
        .Q(addb_s_axi_rdata[7]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[8] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[8]),
        .Q(addb_s_axi_rdata[8]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[9] 
       (.C(clk),
        .CE(slv_reg_rden__0),
        .D(p_0_in1_in[9]),
        .Q(addb_s_axi_rdata[9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h0F88)) 
    axi_rvalid_i_1
       (.I0(addb_s_axi_arready),
        .I1(addb_s_axi_arvalid),
        .I2(addb_s_axi_rready),
        .I3(addb_s_axi_rvalid),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(addb_s_axi_rvalid),
        .R(p_0_in));
  LUT3 #(
    .INIT(8'h08)) 
    axi_wready_i_1
       (.I0(addb_s_axi_awvalid),
        .I1(addb_s_axi_wvalid),
        .I2(addb_s_axi_wready),
        .O(axi_wready_i_1_n_0));
  FDRE axi_wready_reg
       (.C(clk),
        .CE(1'b1),
        .D(axi_wready_i_1_n_0),
        .Q(addb_s_axi_wready),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hEFFF000020000000)) 
    \slv_reg_array[0][0]_i_1 
       (.I0(addb_s_axi_wdata[0]),
        .I1(\slv_reg_array[0][0]_i_2_n_0 ),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .I5(B[0]),
        .O(\slv_reg_array[0][0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \slv_reg_array[0][0]_i_2 
       (.I0(addb_s_axi_awvalid),
        .I1(addb_s_axi_wvalid),
        .I2(addb_s_axi_wready),
        .I3(addb_s_axi_awready),
        .O(\slv_reg_array[0][0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEB)) 
    \slv_reg_array[0][0]_i_3 
       (.I0(axi_awaddr[1]),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[0]),
        .O(\slv_reg_array[0][0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][10]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[10]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][11]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[11]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][12]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[12]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][13]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[13]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][14]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[14]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[0][15]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[0][31]_i_3_n_0 ),
        .I2(addb_s_axi_wstrb[1]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[0][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][15]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[15]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][16]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[16]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][17]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[17]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][18]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[18]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][19]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[19]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][1]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[1]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][20]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[20]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][21]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[21]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][22]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[22]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[0][23]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[0][31]_i_3_n_0 ),
        .I2(addb_s_axi_wstrb[2]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[0][23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][23]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[23]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][24]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[24]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][25]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[25]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][26]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[26]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][27]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[27]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][28]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[28]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][29]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[29]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][2]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[2]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][30]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[30]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[0][31]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[0][31]_i_3_n_0 ),
        .I2(addb_s_axi_wstrb[3]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[0][31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][31]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[31]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEBFFFF)) 
    \slv_reg_array[0][31]_i_3 
       (.I0(axi_awaddr[0]),
        .I1(axi_awaddr[2]),
        .I2(axi_awaddr[3]),
        .I3(axi_awaddr[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][3]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[3]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][4]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[4]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][5]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[5]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][6]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[6]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[0][7]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[0][31]_i_3_n_0 ),
        .I2(addb_s_axi_wstrb[0]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[0][7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][7]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[7]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][8]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[8]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[0][9]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[9]),
        .I2(\slv_reg_array[0][0]_i_3_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[0][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFF000020000000)) 
    \slv_reg_array[1][0]_i_1 
       (.I0(addb_s_axi_wdata[0]),
        .I1(\slv_reg_array[0][0]_i_2_n_0 ),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .I5(A[0]),
        .O(\slv_reg_array[1][0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \slv_reg_array[1][0]_i_2 
       (.I0(axi_awaddr[1]),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[0]),
        .O(\slv_reg_array[1][0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][10]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[10]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][11]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[11]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][12]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[12]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][13]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[13]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][14]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[14]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[1][15]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[1][0]_i_2_n_0 ),
        .I2(addb_s_axi_wstrb[1]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[1][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][15]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[15]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][16]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[16]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][17]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[17]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][18]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[18]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][19]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[19]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][1]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[1]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][20]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[20]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][21]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[21]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][22]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[22]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[1][23]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[1][0]_i_2_n_0 ),
        .I2(addb_s_axi_wstrb[2]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[1][23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][23]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[23]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[2]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][24]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[24]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][25]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[25]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][26]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[26]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][27]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[27]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][28]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[28]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][29]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[29]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][2]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[2]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][30]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[30]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[1][31]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[1][0]_i_2_n_0 ),
        .I2(addb_s_axi_wstrb[3]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[1][31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][31]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[31]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[3]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][3]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[3]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][4]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[4]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][5]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[5]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][6]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[6]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \slv_reg_array[1][7]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(\slv_reg_array[1][0]_i_2_n_0 ),
        .I2(addb_s_axi_wstrb[0]),
        .I3(addb_aresetn),
        .O(\slv_reg_array[1][7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][7]_i_2 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[7]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[0]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][8]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[8]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \slv_reg_array[1][9]_i_1 
       (.I0(\slv_reg_array[0][0]_i_2_n_0 ),
        .I1(addb_s_axi_wdata[9]),
        .I2(\slv_reg_array[1][0]_i_2_n_0 ),
        .I3(addb_s_axi_wstrb[1]),
        .I4(addb_aresetn),
        .O(\slv_reg_array[1][9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\slv_reg_array[0][0]_i_1_n_0 ),
        .Q(B[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][10] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][10]_i_1_n_0 ),
        .Q(B[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][11] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][11]_i_1_n_0 ),
        .Q(B[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][12] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][12]_i_1_n_0 ),
        .Q(B[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][13] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][13]_i_1_n_0 ),
        .Q(B[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][14] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][14]_i_1_n_0 ),
        .Q(B[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][15] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][15]_i_2_n_0 ),
        .Q(B[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][16] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][16]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][17] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][17]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][18] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][18]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][19] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][19]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][1] 
       (.C(clk),
        .CE(\slv_reg_array[0][7]_i_1_n_0 ),
        .D(\slv_reg_array[0][1]_i_1_n_0 ),
        .Q(B[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][20] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][20]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][21] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][21]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][22] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][22]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][23] 
       (.C(clk),
        .CE(\slv_reg_array[0][23]_i_1_n_0 ),
        .D(\slv_reg_array[0][23]_i_2_n_0 ),
        .Q(\slv_reg_array_reg[0] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][24] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][24]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][25] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][25]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][26] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][26]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][27] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][27]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][28] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][28]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][29] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][29]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][2] 
       (.C(clk),
        .CE(\slv_reg_array[0][7]_i_1_n_0 ),
        .D(\slv_reg_array[0][2]_i_1_n_0 ),
        .Q(B[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][30] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][30]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[0] [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][31] 
       (.C(clk),
        .CE(\slv_reg_array[0][31]_i_1_n_0 ),
        .D(\slv_reg_array[0][31]_i_2_n_0 ),
        .Q(\slv_reg_array_reg[0] [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][3] 
       (.C(clk),
        .CE(\slv_reg_array[0][7]_i_1_n_0 ),
        .D(\slv_reg_array[0][3]_i_1_n_0 ),
        .Q(B[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][4] 
       (.C(clk),
        .CE(\slv_reg_array[0][7]_i_1_n_0 ),
        .D(\slv_reg_array[0][4]_i_1_n_0 ),
        .Q(B[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][5] 
       (.C(clk),
        .CE(\slv_reg_array[0][7]_i_1_n_0 ),
        .D(\slv_reg_array[0][5]_i_1_n_0 ),
        .Q(B[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][6] 
       (.C(clk),
        .CE(\slv_reg_array[0][7]_i_1_n_0 ),
        .D(\slv_reg_array[0][6]_i_1_n_0 ),
        .Q(B[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][7] 
       (.C(clk),
        .CE(\slv_reg_array[0][7]_i_1_n_0 ),
        .D(\slv_reg_array[0][7]_i_2_n_0 ),
        .Q(B[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][8] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][8]_i_1_n_0 ),
        .Q(B[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[0][9] 
       (.C(clk),
        .CE(\slv_reg_array[0][15]_i_1_n_0 ),
        .D(\slv_reg_array[0][9]_i_1_n_0 ),
        .Q(B[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\slv_reg_array[1][0]_i_1_n_0 ),
        .Q(A[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][10] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][10]_i_1_n_0 ),
        .Q(A[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][11] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][11]_i_1_n_0 ),
        .Q(A[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][12] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][12]_i_1_n_0 ),
        .Q(A[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][13] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][13]_i_1_n_0 ),
        .Q(A[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][14] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][14]_i_1_n_0 ),
        .Q(A[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][15] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][15]_i_2_n_0 ),
        .Q(A[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][16] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][16]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][17] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][17]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][18] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][18]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][19] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][19]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][1] 
       (.C(clk),
        .CE(\slv_reg_array[1][7]_i_1_n_0 ),
        .D(\slv_reg_array[1][1]_i_1_n_0 ),
        .Q(A[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][20] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][20]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][21] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][21]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][22] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][22]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][23] 
       (.C(clk),
        .CE(\slv_reg_array[1][23]_i_1_n_0 ),
        .D(\slv_reg_array[1][23]_i_2_n_0 ),
        .Q(\slv_reg_array_reg[1] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][24] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][24]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][25] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][25]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][26] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][26]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][27] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][27]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][28] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][28]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][29] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][29]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][2] 
       (.C(clk),
        .CE(\slv_reg_array[1][7]_i_1_n_0 ),
        .D(\slv_reg_array[1][2]_i_1_n_0 ),
        .Q(A[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][30] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][30]_i_1_n_0 ),
        .Q(\slv_reg_array_reg[1] [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][31] 
       (.C(clk),
        .CE(\slv_reg_array[1][31]_i_1_n_0 ),
        .D(\slv_reg_array[1][31]_i_2_n_0 ),
        .Q(\slv_reg_array_reg[1] [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][3] 
       (.C(clk),
        .CE(\slv_reg_array[1][7]_i_1_n_0 ),
        .D(\slv_reg_array[1][3]_i_1_n_0 ),
        .Q(A[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][4] 
       (.C(clk),
        .CE(\slv_reg_array[1][7]_i_1_n_0 ),
        .D(\slv_reg_array[1][4]_i_1_n_0 ),
        .Q(A[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][5] 
       (.C(clk),
        .CE(\slv_reg_array[1][7]_i_1_n_0 ),
        .D(\slv_reg_array[1][5]_i_1_n_0 ),
        .Q(A[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][6] 
       (.C(clk),
        .CE(\slv_reg_array[1][7]_i_1_n_0 ),
        .D(\slv_reg_array[1][6]_i_1_n_0 ),
        .Q(A[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][7] 
       (.C(clk),
        .CE(\slv_reg_array[1][7]_i_1_n_0 ),
        .D(\slv_reg_array[1][7]_i_2_n_0 ),
        .Q(A[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][8] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][8]_i_1_n_0 ),
        .Q(A[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg_array_reg[1][9] 
       (.C(clk),
        .CE(\slv_reg_array[1][15]_i_1_n_0 ),
        .D(\slv_reg_array[1][9]_i_1_n_0 ),
        .Q(A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h40)) 
    slv_reg_rden
       (.I0(addb_s_axi_rvalid),
        .I1(addb_s_axi_arvalid),
        .I2(addb_s_axi_arready),
        .O(slv_reg_rden__0));
endmodule

(* CHECK_LICENSE_TYPE = "addb_c_addsub_v12_0_i0,c_addsub_v12_0_10,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "c_addsub_v12_0_10,Vivado 2017.1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_c_addsub_v12_0_i0
   (A,
    B,
    S);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [16:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [16:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [16:0]S;

  wire [16:0]A;
  wire [16:0]B;
  wire [16:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "17" *) 
  (* c_add_mode = "0" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000" *) 
  (* c_b_width = "17" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "17" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_10 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_struct
   (S,
    A,
    B);
  output [16:0]S;
  input [15:0]A;
  input [15:0]B;

  wire [15:0]A;
  wire [15:0]B;
  wire [16:0]S;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_xladdsub addsub
       (.A(A),
        .B(B),
        .S(S));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_xladdsub
   (S,
    A,
    B);
  output [16:0]S;
  input [15:0]A;
  input [15:0]B;

  wire [15:0]A;
  wire [15:0]B;
  wire [16:0]S;

  (* CHECK_LICENSE_TYPE = "addb_c_addsub_v12_0_i0,c_addsub_v12_0_10,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "c_addsub_v12_0_10,Vivado 2017.1" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb_c_addsub_v12_0_i0 \comp0.core_instance0 
       (.A({A[15],A}),
        .B({B[15],B}),
        .S(S));
endmodule

(* CHECK_LICENSE_TYPE = "base_zynq_addb_0_0,addb,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "addb,Vivado 2017.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    addb_aresetn,
    addb_s_axi_awaddr,
    addb_s_axi_awvalid,
    addb_s_axi_wdata,
    addb_s_axi_wstrb,
    addb_s_axi_wvalid,
    addb_s_axi_bready,
    addb_s_axi_araddr,
    addb_s_axi_arvalid,
    addb_s_axi_rready,
    addb_s_axi_awready,
    addb_s_axi_wready,
    addb_s_axi_bresp,
    addb_s_axi_bvalid,
    addb_s_axi_arready,
    addb_s_axi_rdata,
    addb_s_axi_rresp,
    addb_s_axi_rvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 addb_aresetn RST" *) input addb_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi AWADDR" *) input [3:0]addb_s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi AWVALID" *) input addb_s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi WDATA" *) input [31:0]addb_s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi WSTRB" *) input [3:0]addb_s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi WVALID" *) input addb_s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi BREADY" *) input addb_s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi ARADDR" *) input [3:0]addb_s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi ARVALID" *) input addb_s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi RREADY" *) input addb_s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi AWREADY" *) output addb_s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi WREADY" *) output addb_s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi BRESP" *) output [1:0]addb_s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi BVALID" *) output addb_s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi ARREADY" *) output addb_s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi RDATA" *) output [31:0]addb_s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi RRESP" *) output [1:0]addb_s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 addb_s_axi RVALID" *) output addb_s_axi_rvalid;

  wire addb_aresetn;
  wire [3:0]addb_s_axi_araddr;
  wire addb_s_axi_arready;
  wire addb_s_axi_arvalid;
  wire [3:0]addb_s_axi_awaddr;
  wire addb_s_axi_awready;
  wire addb_s_axi_awvalid;
  wire addb_s_axi_bready;
  wire [1:0]addb_s_axi_bresp;
  wire addb_s_axi_bvalid;
  wire [31:0]addb_s_axi_rdata;
  wire addb_s_axi_rready;
  wire [1:0]addb_s_axi_rresp;
  wire addb_s_axi_rvalid;
  wire [31:0]addb_s_axi_wdata;
  wire addb_s_axi_wready;
  wire [3:0]addb_s_axi_wstrb;
  wire addb_s_axi_wvalid;
  wire clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addb inst
       (.addb_aresetn(addb_aresetn),
        .addb_s_axi_araddr(addb_s_axi_araddr),
        .addb_s_axi_arready(addb_s_axi_arready),
        .addb_s_axi_arvalid(addb_s_axi_arvalid),
        .addb_s_axi_awaddr(addb_s_axi_awaddr),
        .addb_s_axi_awready(addb_s_axi_awready),
        .addb_s_axi_awvalid(addb_s_axi_awvalid),
        .addb_s_axi_bready(addb_s_axi_bready),
        .addb_s_axi_bresp(addb_s_axi_bresp),
        .addb_s_axi_bvalid(addb_s_axi_bvalid),
        .addb_s_axi_rdata(addb_s_axi_rdata),
        .addb_s_axi_rready(addb_s_axi_rready),
        .addb_s_axi_rresp(addb_s_axi_rresp),
        .addb_s_axi_rvalid(addb_s_axi_rvalid),
        .addb_s_axi_wdata(addb_s_axi_wdata),
        .addb_s_axi_wready(addb_s_axi_wready),
        .addb_s_axi_wstrb(addb_s_axi_wstrb),
        .addb_s_axi_wvalid(addb_s_axi_wvalid),
        .clk(clk));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "17" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000" *) 
(* C_B_WIDTH = "17" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) 
(* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) (* C_VERBOSITY = "0" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* c_has_c_in = "0" *) 
(* c_has_c_out = "0" *) (* c_latency = "0" *) (* c_out_width = "17" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_10
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [16:0]A;
  input [16:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [16:0]S;

  wire \<const0> ;
  wire [16:0]A;
  wire [16:0]B;
  wire [16:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "17" *) 
  (* c_add_mode = "0" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000" *) 
  (* c_b_width = "17" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "17" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_10_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
ZxTZQ0UsS9HXL+cye8KhDHq6JjsRKdBbt7/23hG3Xv4lTOl0WgHvvGUXhuq0kWEjqS5VCl4O7cYh
glsyN2zZsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
D0MQ3ley4npGPCDj0uKNvxx120GglLBAwtK6OmuXlvAVN0AR4gZjPv9jfdRnj/KJCxgkNVaqUWhg
Egx0h1ObNRySsfchKqdWJxVp84ELTdz8SOdcwsqw3WYcma/EKO0xmVG+Dj5kh3SGzvvfDaBktFb4
bK3AFZY/+Kz6WaLMycE=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Ib/FxVN0ZG+ayfRlBompcRYBpl17xB6BG0jS3s3PNdG6pBxEZq6Py/W4j+7qAMV4uf9WBeBuwU2q
HYo5rMUEYE6wZf9jBnW23+A53JEyx5cXbckxSK688vZaeemF9wCkbeVwfHM8QNbLc51/qzlRZboH
l7C4B2YP6+l44fhzNYY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ws6JMsAbE3g94lwYREcMoC/8x4NmofYlfb9uHUEoOTvERSt6NSyR1yiG91nsEU3XfNhOQ7b/Wo+P
aa5UrHOplosBwW9O/BOPM9kStFRQfGsf8m20FxpwLUQdlNgNMPZvmEcAaEc+pN3iwPyX09CoU7cW
ox6RnElk1MI4OWVFf77mW8j6e1VlWO+Vc8LKoTynKGAP5hC4BYHQd27IInXzGdz1oVD4Bam4x0/H
sYLHZCISnOa94Q3CL6ay9xgNR41rtS98WTAttjEyFf8ILmaeESW6M4dGV3+EcdfBNzrTTc1nF75N
HxzYnCBLVG6X9yHlNRAwFRouHTyObDyWadNJzQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jKxqwTVbU6wQlQsyUl5EyNEaloyZKqOqnKP/oSoo8BbsW9jgw2GEmYOdPZbHNARjlp9P52Yzd3cJ
LczzuDU2cV2yn10WPFG38hLnucATA1ff0e8/mPzfxBEbAOPlzTkUFRukOc0zmo/tLK6cZvcaoRPu
DUI30FqzbS3M/o8XdN6yN2QOFivgXW0Xh8ycmXVtjktsm6ElnG31EW/2LkwLAyVftpL7G7j6nMnt
e+d+eKFIoGrxVI+7fida/LT0yaOYHWQh3rAG4GvE+2lORv2wy78727ZIirWNnQu8oy5qQcf7LAqd
e4MLtleFAxEV9eZP09SJZUSUNMj8waYaAU3w8A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
w06/xQMdplxMd/DX9rImvuDEyUujJNZ5bclIgCUEQ3II7s7VZNfFQwqshU6852btDf1ThZcwb360
Io2jAnYs7UKM/nRMb56sYLBX4Y1+ufAYkpkHIcZcRICnnnvtYZ47grVBHrUfGA/xC7v/201YnNS0
c/L8l8Caa3RS8dR3ZckJnLnQOdimwEUdrhOFCxXNaVvcB1qFzyeB0qRxY/SqYktIcK0cf245rT6J
ycbkjnMIhAqvfqKdgoqIvgkkVe5grJuoukmw5uvFNcNJJ4EbH5xxoUZnl8pXhFueD3O6JeklVONo
/UZlkoZ7Ymk1otUl6y3wzaGnG8SCVGGtrmKfXQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
OkKWcs67lwG1UgksEA+z2rw7NDBmvVGD8Evz9Q6Oy+fGx9jFMnWb1CGPKtQ8ezygsXpCPhcS+Gpr
SvGzlS+Kpef/L5GDh19sS4+ND+jx41TXOs3oOxK+W8TzrY5sKMc81B80PmEBXMP9B+tEVBnFMNsn
2U+ykf8je9f6aoo9bpXe+09iHq27VEqIi36r4HnmvTfSJeyQSBdIEttc7IDygoPNQdKEwRs7nhYP
Sjxmju3q+kZlXDEjMppJkdKUYASMVBARM7khp3UxZTtXg8lTmOTzuhjsTBzAGzvEIQM40JW0XXGr
aMezq6GZuV8cNrGObGOGRP8qiLy/Iuv/RkRpAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
cDPdR5QYscu1gnGXV+MYogKCJpdS1gfW2LIjmV8Q4d6YSKYkZ6gOGqw2NMIshgtHYlNmuSKNBbta
+XgTT6XEF9x+uGJezOUWwMxLdSEvJoaRXYvGTzfNscsyfKNL2Txm3IvQupdh+iRE8YMyaQn5hmcX
1LKWaddgJWErbqgdJwe3t1yO09JxHRGfpW8aJVnP/323D80BmOGE0looLmycE3XANLhm8HVpMJQ4
M/VTOJ3QmokXPFeiwuf//P40tq3PU6URbPmyLHMJ+2Ji9T1diCh6AQqvhB551i9B9cXFIiVmI21w
VjKBeAQI4ABE5G/GvcC78uluDd/YC4XPLZiCHw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9952)
`pragma protect data_block
ev35v9hdXqVKOA/O9EnJLRb5wLdbOQnUl+BdEmX4nHqHZVsqIx+bSd8sh77GxQBtPFEsLnPFvPb9
IOtCpaXJbI8bTtq5zLqY7+R+xvOrPUhAmOiXMUo8Bz2RSsT8Rf4gHd7j0eLHmDyM8lJzv4/v0owv
6o5Mt0NMMKUOe7xE1b6p+xc/zkUvpZPnGPvw/MwiuBr3IJfDrs1qpBVcfBE0htelwNBKm5ErIh2R
N/nxmdFyBjpQT/fp16zh3Tv9xmt3xfYqVeNsHPD74+WmWXX/napc/0eHYrKHGNwiBq1Lyi4WBx8M
3TjvxDIwmRmTgYg5AOj3h5H9SeY3M6lVPIB5nODaa47RBPB1dBNCARiVBe3eIxTKxGgGc4Ivo4d6
q/AQzD1SsH9dMt/Ske6BAecYrpLskP5z38P+0obvHVXz5eUsnhZSkqdj/MJA/+p+cfF64eb0iuEd
HwyOk74igTBcvqJfV5F0df5vHYij+Z6CD8qLjs2vF16g3yF/kiv6cTWQVC6KTMetesSdI9DTF2yp
SJA0WrJSUHR8YUSTzzFe25Y2AKdK/o/ZUDRLq1rKWQ0+tw49gpxM7IAsosbFQzOCTHWXy4DdtXpR
j7IJ9J2iby9pl4wzdqiYSgbDUIF1uOEenKooZJm91GPzPCX6U6RLmp0yLLJj6yTzb82280V2HedI
vc2dv4FrLjcMNaRbvNfWwrL7sj0vLaHJP7qwTIHrx4HKzceLQe83v56U0+FToE2ifbAnTPiciz4f
9/lrOdP7Z6YkM33wiFfFYbLyTmRnxJMgAECFXY+2hZ+Vjf/b6jvlBtmegS62Da9O4E1GHuh1mZyN
TsUrhMh6w3Nts9G/btPAoL42yRqy1I0CwCG1bf+3cHZtzoO6YM+Fc4rObDLynuTczboxaneRcm6o
cRTJN95a1ItRKe9+XvIPuP7HEZ8urQTvroNM/8xSVq+qguqK8xesxS1YUqRKilz0JzFxjhTRUmMj
NSRk40KtLXM6GaZqSL8cpom4Ob2LEOtQ5ar4VElN/qbqFamzhDvoMPS25C2MTzt5HBSggejBPPYQ
9dxFAW0IhLJOKq/yr31Uh34nJIEcJ1epVQCAJ2QTqj9ayCaBbuPG38qldlV6YgM7hbiEPxIo8AnN
uBXhw7lXOT9Yp1m/3Tf0vIKZHg6lMiMATPcElEXZuVQn+y1bvrcyGze+01iUkl5WLy5/prL/I8pJ
Zo0zDCRlFFfHTgDpjU+YmrY0zveKwlJAkMbShv5gFeiTNyEA5piXRe4e6zQicLTbVkvSPYIwvO5Z
QvqwNGwVUA5wGw+T79P1B1Y2UqbzGRuax/7FytbeBc/6w/UeA1j7twc1k7vHr2oZd/Y6vRzfg4Gs
1NCh9H4scjSuSjPHW6C5MvWfwmYNruT2sjccC6M+2xirYfHAQSjFvzHFAzFemWouPK2LNiN73Po1
SnmyZpGY+sY70ROWqXjaq22bKd71Wejzq5NlfjIxfCtW6iMjPdDDymwhz2MCL53bUcgpvJx3Eqgp
krjKyz5q208ePVypLd3Bzyr8UeDW0/IUnN0L+wqZ80pkhPWHpVvjbjvUM7BRX6/T0cItZA0+80e8
WDaD55gtGyXdMkJoB+mwQbQNTlMGSOcLlXLrn0ywwZTHUnsc1jDv7rlRLpESgeAEi5Y0AO2+DJJC
OB5Lni1hu3QL+tfZgo1peciZhE+lKnsMsuAoiDQV1iBsRn6e/OqD5j93mTVFp5zS4KgyJ5eOUEeY
ZspIHJr55N5S4ee9pv7l5FbuMYMEddXNe4zK06igrqgsDaUgOnXiNx0MogfnxCwFIrGR32daY6Vi
G4Or6Or7PiyAxky+Zdg9oo5Ii99wLkUH3dDdn0Nd9CEHaelYFR1Q0qcOkfopHIRr8vyatMDi3B1x
Gyo9Wsa4QH776m1kcBP6bN5c/u0IHUR4XPg+1WbZ/yJJQYAUFit9WNGInFN93PCr8AaMZ2p86saU
m3xEMcY9n9jpBmuH54FrU31NHpHCVx+NAV5qefp7Z7C0Z/U+xhnIvX5oXueSQJ65r3aLLmv98KJz
2vKTCt1dj0mYwl5xOzbFGs6Yc8CeN+hr+h2no+RfzNegPQZs96JNyDpv7ZZQTJi9RySiLTltz5+3
zVn5MaChDRuZrCNa/1Soi3Uq7tWQWEgaQzBFaQ3sD4dnsQXMo4YJA9/li+N/AscnkdoQF48zF2NA
2qqP2r5rxrcOb2ICQwt63SR5fWFupe8Gf/GVu9LrcWE+Ga+1Ez+BKCSvQ0Ok2lZyGbKjbCUP1DZh
53GyIin3hFOdi/H/m+q4Rco2LBtXeMeLG+m0TJu7/5r3b+FkhYi0o+y8oP/ZOOwKMBDdUuFF2e4x
FkVSNFKas3NYoxl9XNLf8xXcQE8+o23Pugq4tPRBpIeg0r2gr+xD/JLu1b2njP3wDyVkjF3ESU34
hCo5YArDJGiGpwzlW9D/1oe2cWn+CwoMjw33ZnXu06ymLfqX1+qL9lc7lmPfMlHuMcUXPiX5q6y9
//iVch/PjilXkOCmT7jQqcy7pyCkCkpKnacAAMZ+viyKIkmsqfZOtcHk/nDe5FRXw3olI2gL43J5
SAOLIMuh9DsU2UX0/aYvSq4v/Q+MJDEYc0UYcimludIWJsTJz4b+FO1qskIGdB1z9CHNX1fQ4s2u
8upB4JDZL9FQw9rP0dSATIE2fkLxlfgtZDscbcEJu/Agf9+xa3V7Z26uO9rgXbu6Zg9bQ5p2DFuz
dOOehqpBB5r7iPGlvgrV058A24YnkROnKxKIfaGd8zN4wXir32akm8A52bG878vR09GbFWnv2tW8
lJzKav7rEXd6HdQZNl+WR6atMGs7f8tfk6jvU+CGj0RM0hAK5AEAjoi5svwdKsME1uZS6tkRq8v5
pzoUS9tl+dEQXMH/fL7MuRqYBrl6m1woSynbyHfT1rmngy/NQACHrgPknrES8rAeovKozNgqg523
owmfgR1qiwM8xG8q7nFumqqz6V5mdZ18PMx8zf3d2FsUKj/ndflRZgS0u9sAF4Uqj/FLs4sTSpwx
Fbkc+6BkpgNR3Mz2g3O+/h7/VP82Ne8asoYnH4M4d+BVVc4odJl41zi1pf3eI6JwTdYjkh+DQQYN
jocghI0iokmP/xyK0vhXyJTQ59+etldAI3sUxCLHS6RZ4Nwl8gFPLcBP/zRKO07cde0uQd2mRx35
4ipYXnaBHVUiiAR0x0sK0MUpYJu7C9TMp1b2e1fYwTgqtui/yR2NmNMIE4DV9ajmd0J3NJD/gH1/
R3ouchoyTW+UJ7so0y2aOlX1mxBsFJV8lmJ7qxjtusR6T6buYg8KN5iv+qRHHkFqovUeiVOpuCLe
fjv4Y4X+TU5HachaBHJm5y7aA39mjVXC7sFnu5py9x0G27600ZM4CVT2V788/l96SLq91pqW/ZvE
+uKd0PUDav/q0Z8PAhIXV0vNCQCtvJSaFLaMAmsXTaUhRcTyZj4HyAJubypPagOwvtED3ol6B6rS
TgH5HAzMNiCvJwtVgxjqhr2rjqbzK6k3oqBulmux9OqyzRcqAX33laW5e7JbqqrXEQEqWDsDSsAH
ZxqdvQYqkZJuyf7RGqS6JbR1R8zJZF9D+UKvfrK+ioDeoyAuQ9Ltns2DWaSzOTgLc47Z+tOXuFqg
d3NZMrivfL09tMXx8p5UYNTidEXTS8VjLy5puf9v+dUnNY0jAxehNbsuRSvmADCipYrP1yZ6U4Lu
xqlR/y6O/XFhKtVuXVSbvGylkGxQmYCJUKKtzxpmrzpSf0JqwcH+ejSMSGZhOCpCNNi96hgccRiA
KuDXiCj5ewSyZlbJEUNNHT7OiQRSYyimV0feBcM8ZYddnpVEoKsqXlT2p1+duwn6T1h/orSt9XJ1
+zX8uEufIoMzsW4IitchoTX8zhxW2DdKAv26vho/WU/N69RAE7GSRTJZ87IgwHblpjghS3AKEE15
6ulr2Y5e31I53Fck0nhzYQ1vE8ZiRLLiM67R7gWI/vrVwdflkeRosK109RHZYNj0tRLCNEFw5rCW
cNWICjpJ3+7wyzwVvvc+EkUI58R7dvW9eWTSCt7me2MISeNpee1Ed+aSJAHefYJBwF1l+bBShY66
3YbB/DzWqicrlfhMC/RRZHTGuUJ8ugHtIzpiPGtb0mnuEhmbQppe0whf5b0/6CJZyS/wF6FnJoAk
en37taDBU7xY3DK/fn5inshfaH0fXWVeT7xAzxFbnNrJDrvpgbXABKF74VpGYHNQ6W9/oUrE7cOv
7GjpJTSwDyotr8L1cpeBovQcnOe8ECaHcTKukD77HRlJOD1jbhFUUac9JzY0dpRMpOOr0RhJJAXu
TAS7zDIskJNsxIGgqIIi1vj2tXTFVv6Xq+b3KNdQDTSGRwWryrP6AOHgA4ThxkNzwhl6/gJ4d/q2
SQt+ucNrtVqN8dFBcyg3leI+vcUttObsLPeInKkEmkPb5KS3Vm76XE2PdXQEVtp07YUmWwQhnfZv
fAt5OQHH14UjqIHVFxdZfX+EY7dREAJs54TCcE0Hgge9psY+EA0nRRzuzvU8iSkFltd6Djv2/xm3
9SC3I6a6dvCjP8mGQZvU4qLb0e4yp/MjmvPMlNOkJ33x6Uutu7Uq7ERYn2UdRvLEy+73STLaxf2i
ubGredRotLcCYg2Stfihl1EmJaXsHBNpWMYDiYpWm2c2GpLXMBJhLsKdL1j/4NZjQ+E7bT0jV2+T
svBBKxOdZWXhpyrTNLq5G7BcYewomQLPh1xHKxoee5Fo5BBhqCiAv+pDH2thc1vR91JZLtNLmMzt
CZk3qHpNm9gp+7OyzdwBP44SULhC6uhMlO9evWdDn8ZfuS+Jv39YrV3+zsEi4/+TsOuvkUAFnWSz
IemoBJF1/esAOjkH4CAApAk1w0B2iHlI0QL5JyPtoKxq3yydNzgX2tuRqpJgGx8o8eQAUWdCjQDO
z6I2FuESM9r2h8QjiCxReo4s7zEtx1nsIaC7wekB7Hvtojkoi8QHY3CtxCRO2uUTf6L2usv5oMwT
rFpFvHGpyLiiYxi7AeuXhvZ63+8cfxaE7KDL8Zh0XeGWgV6nKwH0S+Y8iM9wEFv0aZa4qj1d22US
saQvdyFflh7rjEev/l2Sf+Vle6vKfgSFojFiaKB+S9wKh7Xn7nPkvqUnlYKYWy0zgp24IePd5/q9
PS9hE6lMsfre3vImSjvTqb65fo4TwLlLY2lbp2fBIJAlaxAsfsObFDThrH1lJgMe6Z7KNy92nMwe
ph1/7voUMCckQhJG9Ze7//2Uws7EicAlsA5bx2M154mUJhruUZDnunOSej8PTq048vMp8pf2zRTV
R3aQAzzHHYLSlzy7BFtZBLFfaTJcyf+VIYJirVVFepkDC/a/MjaF69KM/Oa/T7gHGgQGDrEuxKF5
vCTO3viiXzJAPy8Rzk98z6lmghZmg8pkAVb0HUtdEcEAIOUKDbDV9BxRvRbWtOG+gDtrVc69Nqby
vdjX4D+nO23EWVNhZ8Qs5dwflj0NVC/+baFjKv2WHtP4+nTBRyn64WkGeaLHfs1h9hk9m/OKxv7g
iZcM8PT7/vaBjm29cM1DbZZmVxcRxNpFeHCMSzIhg8RONLrm+5wy/wHr9cKeiFtsma3ErQR+QPwk
7fC2IvLGDsmRfB07Z5Pax+bDR2dQvknOKCkFRgZAig+Do/MbouyS0lsZLaj9+wy5187Pb9ai3t+v
6YmBysU/GfV/UvDEPP62Bm1YuZuo4VhSoXJjTZdgsnBZhoOZrVSTzMrYCYXZH5roJ8gmDY0sUkyl
U/lEdEIpqKkpybKvaEb1duxuyV8C4Fj2T2YU9ioKq4wJSEnrvl5Wmg2m1o8kHrEeU45syipFUu5H
ks4rlaifVVencW+mg52FQrM8nJq/VmPmgKhjbaetusVggjQVjj1u2B4eXuJkx+BQjwMSNUX8l1hE
kK34ptWj61cCKyCeWRLRRlGnJQoMl2JWAtlGZ6gjPACzyNUBA6gGRtHjYuYWDCT3vbMejnVD3Hwj
PqzyWPfp3HXSscSognq7uryy4CGOH8UGjBGgOSGiOlUnUEtjZSFyJ62/9lBNQA+CdmJcJ6RcIRXb
lec8772XCR5We6tUt838cITArNof1r33Z3YTFGK4dkg9F4iPLIswl5UajYUmaCSoGboksRSOA3fY
gM7Hb9/ctax3GFslvoSJP5mkVgKJYgMvSDv2V46LgB96sD2S4KOeEnuxwXYlgW3SHJfbFYPfiE9Q
X7nHQExhNMbIWhg793pZT8kBvuUaQ/1qPUzxjr7iw7VMn5HBuQwq5xPs6ogUrm5sr0/Sq165lnbg
Z2Wd4zNBug+6l+8i1LNRVdg0bAzNysUGIQ4RhIv8GK/KV5Q9KVc2wMuAYnPodpZILvSPvaZJAIWY
RNm8DrMuN2oXS8ArEaJhEl2WFaa5+rWdh9n6NDCPIsu9bfCmzlKNG8avtsNIgf3L5WO7BEblehxp
xFQXT6gwpUIZLFD6EY0CmWIM4jBJh6Y1tw0f+3mqca5huA4e4Tm1/gZ6Jl4XAqZ1hfXYEHmv0f6R
yF6Lu3RvMHR/TBl8rgH3RGklb0K0E0Prl4EMVDc/m+bnTo40V0VCPRPhseYSqLMYavCDF6GhqQTQ
THG6+LPZ37gUyvT0r5jIbixMnoGy4SxGlxEKGfyVmzP9Gh5IrpYLBWAeBcgbTlHkU/vbRcofGJeW
TN5IsLaPG7Jc++8d1x4jziuOpxU4rKog3PjZaV22KDIF9UDUfbduaI2yBM+4J1+8K2pGcQxmxLw+
AoyKjHmtMZ/+3YnE+sGXUEhn6LbTAeQxNRiKJf8PXLHbi5eKF2BeMwVvhja1XRhotCIuGbk+9AA6
Au5Srh8WwOly+hrz7hBRQxr7JzbZrEac1C9UjgjOengEzSAVAsxe6jU7BTJLn2SGeLhsOwl2T5TA
pFzUbqc4B8Cz2v7u2paQujPCxhUD2ZJu+Vo8CW/eEx02mjryfudyQtKHBReQ9bzbx+F7RReiLcb7
z+GOqJCWsFQOamB8IPLxuyb1avLsC60nuq18BMSoFnF4cqPL2gAWWarrqUVeeRAXOvKucdu+LsSG
XFJNUY/dYtoGoYfdI1KBWtUcjH8CcOgABzmmZ4rl8B4XtAP90yy2Jfyy4Jjy+b4MsAI/A0qqmGJg
+OTKZhysvf0AB1Q0jUKHRc6kzEBt+JxYBHpWQU8AR81YZ48BYvLKe4vG5hUEfmIhQe63n3YqUbSd
w4TZzF31/9K/GNy8JX7bsrMl4G1+M3BY3mpBoJPw7u/WdfZeyIXZhpreB/Zg2AYBRQ9meX4mZz2F
C7qFm9auHXEnSQMCeEvLh/0+eZnx0zkYg1C+2TIjAQ2tToJG+iRnf8UnDgJrl8qeuCK48nFtSNpU
l3qPJcWZElUI2MiCvlXVIRQ2B7RgpOz5MQq5pktcLBNIlFKBwZwVNLuN3YpEWGOZuNK76Ir5Mg7y
qr4icupqrL4qGCTOY6IQxkx/YJA2nyEO8QRpAF5qgn8WtfIvxtTsHHSh9LkHCqP6gAVMglK0fR2o
WqqiNOttOASGjP6ae7IS7E243TnYOwzYkSi2N3bSmdRdaEnfqWddVY2eeQPpQLcfy+gVrO03HOTJ
wrz0kYtlA1eb+O2pyZL5dZJIrr47xwFhu/BYaSgKkPNoMXf3Hg4Y3CTHf14MZhAGbnJINwR/UOWo
U6byQx48E4o9fH9IOcyQ01XQnSK9gNqAqNlmhqbYcUDBksQIGlYY+BMqtUO+PFceaFL0DYvD216J
SES0kNU7PxInuT45/TEqIqlIs5EjVLH3NV5VR+n/FXYc0ZmszQtlz6cNbCGvZ+uNt6aIzceDa6xq
Umdbu2CcMBTAO8Ts4ONG+rFRLTTZp7/HI+dLmNhKiCU+EReg+GQYnnmnjcA6OGY4AtsiZAlCC7vy
Nyva193ZBRwuOkzQ6A/TAejtpAt+10ppKklZqxd6XSZsxm9BtKkCy+Qmlz9Cz8iNxtvC8/1kDi9Z
rZipFXAMyMKGFQb+V0ecXEgHGiad7TGquv/6T2kStzqTPj5Ib2hRmrIyzVPRO7Pqrry0jUMboDUC
UVHCTkzD/1ufbEYHYkTbB8m/dr74w4dEQNzqLs4oQlttj5XdP5Qz+2nZOLKUlkdKnpT+8tvfcN9C
R1LPxGdcQ+kuO05+4hhjatZsoZ5+v2JK9ZgLx8tC1CwMlnWmFF9lLmuqnxz/UCuH60pAAB0fHk/d
unJq4iApddj3zqhsfupVb6mPTHZhGJrmchZ/bgZpFPX8nOXoRJPN/miAbBYaGdgsEZGfKJnoEKJL
hZfe1ZH13ojOqnEBtJUXhihfpKHjMycB6uiRqrEiteyRlhqoK/sa71k4oINDgGTyFFFlExWWCbzz
jRTkC+74e3FrCLTLxvsvsFEG3t27sPZWyMB9/27cjOT01Re5rY0NGp3GyR7wDx7Q5nq03N8aL/TG
yxfqP+YiFWuD+wzp99789/ABB3igz49gan4JjavUnAhOzpUmjrK0gSaU1lImxHYoYkEpKy4OTX28
zIysGhs+gngXgeY9jvkvCkImrwDwKC1/d5L//lJB8eyxMhGCU7NrhVwQFuxMWUeSGiBQWjNCCc5s
JEXne0TwrgxOBkopxKYiMQqUgA8ILyUjcLNwGvof5m/j78WUtHGCOdr/72DJiGmU00xVVLvTF6Kk
Caa4sXiGEV17cc0JC0NlQDMCDP/4j902WRxjRaTVOK6t0/pmBGiF9uAe9rmo94SSmvfX1E9RqS2r
diRS/O1D0IfFbZoePEn1adaNlYu1QxOK/InIHhaqO8snTmJ+0z5J9j85SpnxBLssfzAJuHta4ZJ4
J3PkmJ3jZa8BWCK0lc/+fNxMv7zuL/ZvaWWjuC2d3dJxckS405n22wAOyOrC6yUNH+Vcyd2exhgo
9cFCP2CGbZYZ5ec2H9h+47CanvXWTXChsYXx2Qg7Av1VsXUotmycaEoaT11zya3veycPoULxJmh3
gTg05CGdyqb36WhYuGSh+hL17yFU/wmZHjM/ngGixFfchzWC4gu3A62qtDOyGcA9X2SSIV4KonLq
Hbd6nu0t42GHRr7OpMyPXQqgPpEKHJLqY+YjfBBEBaqpH+z7smOWfo7zicfN6DSIYBqoDQ//MuVa
XyasVw6gURSphuN8s7KOS1dLofGUMknFE5WA1stuDRvSmn5iRRHraZSLmJ4lmDDUUEgK17k+KXxK
0U34/xJO0FZ4yVTeWkqgGYjVpkFGdsbllxOg6WAnGv7e9nwD4PA+ihc3Ly+fkb9CI3ZlEiZ5NhQ+
DlAnG2G5pWTRTkjTuHH2Ieb98sUhIXSbuxVsBhXbDtbwnxk0uZvRLgeokeUu2+AgxcPKWBDSeN+V
nkmVNxbmV3mnjXiA4nDHv40sj6Pja22rvRZlRLl5S+3vgnG7NSEUI/pXloqPQ32xWFyIlpmNr58S
vm7wYzCLMSG+flmWFllRhYbhCFxbsUEf1tYhFpDn6rOvHs7P/RkGk11YAnd2JjGN7yHttyZJuoDb
j0fMEKsozqnOuDruDyZ4fQFrvQ+Nr8r9jfPMH1wamgTElX1amqvCNQmNpyZyEUB/KDquAPcs2SOC
l+bL+EtQ4z0S2cvyv/LhHOill8O9ziiZTfLRKjc16iJlRoOnninOrUYBRvCFuvlnKb11E597qmom
YDtb7GEiXFE0nl+QmBy04V8VYXDNTbfvoMn3Dufn3EWAfg4emyrbkED84byEbHlHOknJjvs+/J5C
F4sDMlK+vD4OwTV3Nxn10c9Wh7x9wkSMGpiEnFg6Xvtq5aJb29woUoKF3EAabt6md1/8qZdRQZCA
qnlnu0JFSSojIUHqCRvbJZLjwbrr63FRH2n6q8LONN4gSASu4WOiNuRwE2cOaayjI5oB+mjSaxfc
cUwV2M2NoyMpdnOYhciDWydozRXoqPvmgVyYhqcuyDQdgYZgDe1xnj50a5ymr+sFXwPkyls0XeKe
7ISPsI3SPzW4SqTP6AdlwHpiXXqVNsD3NZ789HRowWXeVgwSzU4f8ogCkj34dIV+5UapGi4tRWaO
iEvy2thcMpDCelSMfXeaz92WbvpDsLkx9wVYgjq8K+yODOybU2eoh/hCXeOeTsjC48Nmk3dKYdBw
s4OZfS7Cakie15l93A4ZAhZL+WbSZloDumPunsVSYdzmy1nvFdKIa7cGTuOnbjUVNItLeP3JWiFq
d/aLAWUUvqfNwFtFtImtr1ePYme4mMgMZ28dj6QfKkp9cC79Bo2JI66OEhyoWLwyDjYNErQ4vcho
PmABGmV7LOyPyAGNiOatYaYaBDOz30JKdHtO/8tCYsbC+bx+Iu6FMCnAJq/nHQxji9n2YTvbYpMc
PKs9HBNeTDuK9vdAkr7fY+Z8g8WdWCfm0EzIY1yBnhitWVgM/bfK29O1nRl7+8ga/XsoA9Os2hvN
GzsOWo9N++Sj75aMExtv+kaayp9me8CtmkPw4J6kW4Bs/CRXqv8rglqcQgTozS+0hOg1WYw2tUTu
RooSrQZuGc6s+yBlLGWTQcJUmF+ZXBq+YGjhT61OZICB/89muhTs2h+r8VQXnU0hy4eEe903yxwR
nRkMIKENaE+Cv5UBhu6ABc/AfVl+fAXrRwSFXCD3vBA2c0H7RdeAUWH9FHSPVIG/jbCwqgkad60Z
QpMeTXVAclAN6mnzdE/dmogeLzCrpfPG2I35TEnAJPJkKde+kDXQJ+ny7z2AeeFCk5+AzgsFVrFQ
AQzSV1yXNVu+ojPJXw2C/m8nC7hvcU74N+N2EOiA4agib+l/Z0/1XoNox2lwpnaDhnIiNvDvdvQO
qIDYsRZG0XJkY2PX7QVb24CurZL5UH6lYMO6NAhaTQNXWDDcWP8WJuSDbY5REyrUCBjS6SHjdgyU
kcozHjKga+y5cLv4Mbmip4FM5FvptK7iFbG4TQBw5BZdm/vXrOcbmdyt/ntYJlu6MIqjwmxwH6/e
dPEV6CwpzV5cnOBgGd/2JHeqqRVz8O+5okSBQqx+0g7NvEaytGznwwu0rsgoa0DGwuTNDCEumu8R
1kRrVEQqK9nUOSHM0yWPmvZ2BjNhpxq2g3gBttgVo98EypKXt0dLUcgAyVdLynylg+8SkwdaQqHa
qzx1K3wuq7o+rG/tUsPDgKkvI6yCVtt4jKk7nnQ3bwf2gF4WtRCfeduMXs3bfs8kgaA/qRRenwhf
UDPOW94N8LiRE9BbV2LgffBbc8CV865ckOieXhnbKADws+oDxi1QNW/52DZ2Sx6uc0ScbxMYi+1W
Kekp+iCQk2WbTW/MwgBQspWFHt0C1Wq4DwZle40fGwLeQdEoC/ZwcIRZQn6ZLnA3OWvy12KSKb/x
9ntfBLD/0toJw7k8Wyph0moO5wM4lbSzABXtS3dy4+Rz6pYEHIvlNho3Mt2rIo1YdLRdfBFJ5kZy
VpowNd/qnsd5M8QuCua78+Ov2+y/CHl3oK58c+pFwEAlB5fHMHpdtqiqK0VkhNYLN0x6J2uLkfAM
I5jY2jYrKvdTRTVV1C2gbHtJh8jQreZGDVeORkunPKfTeGjHTTwNQIfeGqydO48ur7pIKnXsZiBu
ZJaBp2FUErR2crUzwR4Ainz/dAcRMyvmQKF6yr7jrVFC+EZ+mRnlk5nt3FrKrxfSrrbra73Frg8p
mM3cZZMWcj3YDDjMIsxhIecgFFzs9nQuvtppmxkHztJ4C6CsPUuh9ayW/zbTOw8pfxOl85uLzf3S
FB16h7NQ3Qysa8GwAwKTyRexBK1l/jIHi4LXVPUGvnuOSuFsMWp1mj2YB/yHExS1EMePECodEtvL
QCxB9fJA9bvsMsqah5ZBEtqNeZMzGP7bFt8rC71INQxepIk31UuPRvo5vgDr/zkakhinX1e6J3RS
g1lKQ9RVk3KxJIINHA6opEKA8Deqd8bdbs7p3Wz5jCPlmIfqHu0PAA+X9JbrxTHfkP9UzjPuC+0y
aH8mnkcA33LyDH8Czmo9bvoVUtucxTOB/yx+thzIvbqLupneUvk7llwC8OOWeE7931ecXplernWt
KqUTozZc7YQmQaXkBPbleKzDlaw322FVO2kPU+M3/3oSn3BjksfFTT42TZgCo/nc9v71Gs06Ftxj
gNdb7nxT2WdsmrV8yq29DDb8sSBhB9HRZcZw9H4BFR9LTHvFUby0ty9vC/Qff6RjQI/nWqdnI3dA
O+lksQA2oivHlpSGtAKVUp4VpSEL60TYjPImvQ5YQUZr9WzGsGJjB6K3zJR6mFRdqYCePGiGlm09
IbhPbBypLOidZ2HWyc9cKnckEjbD+r4URUot2qAWg6eDjwo9S7Hh6PkUnVKl4loH3ABDLZgtQ4zo
0NktyGAggQGV7KvTibq5N8TishUYmkc9iT4ysI6JhH5In7PyAmDnOgzSlZ7F6RoefN+H5t5Lq84b
G921rwa82utdUkM1rLXh5lYnOaWURDO4pTTpwaVa2gOfGTCjCgLzGLz7u26WJam+cPbv9DfaxnKR
QrFTDxscjNf3fux0JxNFINhcO0jQii48EfZjKe5MYHT0wyjTF3RluvxGSuEtc+gagCH0sabEedGD
QtYHiMnOWhuk1VHw1rBvfUTE7eLvo3R16z3C5bT/JFN7hs6vsv6I3LWfERN+uvSpR9aqD2uMaW4Z
sgeQcpU2DvLNMgL5okVBMkR3Wt2CHEdzBBX0jCJUHxdtbGrQoscv8U4uzpXOijC9M4RlZmZ1QzNR
X+sD1hvKZruzbGXJ3bZpOlguif0PZ/MlvISiToGUF1mf3i5+TR0rYUf/sDeNv5+jkry8EguZyT6b
c2l6h4TxNE7QmiLrBljFrmy43/fTBvhp3q1VAu0ZrbhTDfFR7xgAbVcFXRmL36dcjSBdzG2zJozl
kgCNU2Vq5l35DzcYOCY5t9IBmuH2Jy80pzXFnXZhFg0h+vQK6PeQjVSDWk2AcY5ssRF9EAFdeVwg
nF1YKq66jXRzb9H0fwrfPvN73erSHYocziaWKXQdBxASxjHIb9AkWCN5FpM597AaW746v4cyRTFr
R4wgn67Z83ns6dAsv1PJZ5dpdIE8lXyFXE4aMqbl1JB7m/D4gkzaSurQVKuT1YAwxQaqXu2Rj3N2
LIzZ5bJ6f+gWZ7KswJpGKBTu3tvoQ8J5hZa8Ei7ArTAVkIRdwOKCGL0z4Iukvq2qLoY4pvgxByaY
9xPmuOFch9U+BizD5CPvS+AsPI0OSag9khWccR3jLBThGV6Bhy9hroL9R89ZX46V+9E/eu8USdaj
QO3x+O+YC529wTd7Zdc9WF3lSVOhdQTIo5EXKw7CfkZGgg==
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
