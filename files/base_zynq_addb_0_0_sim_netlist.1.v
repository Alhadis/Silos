// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Wed Jun 26 18:30:29 2019
// Host        : ACER_7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/hls_proj_2/vivado/addb/addb.srcs/sources_1/bd/base_zynq/ip/base_zynq_addb_0_0/base_zynq_addb_0_0_sim_netlist.v
// Design      : base_zynq_addb_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "base_zynq_addb_0_0,addb,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "addb,Vivado 2017.1" *) 
(* NotValidForBitStream *)
module base_zynq_addb_0_0
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

  base_zynq_addb_0_0_addb inst
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

(* ORIG_REF_NAME = "addb" *) 
module base_zynq_addb_0_0_addb
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
  base_zynq_addb_0_0_addb_axi_lite_interface addb_axi_lite_interface
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
  base_zynq_addb_0_0_addb_struct addb_struct
       (.A(gateway_in),
        .B(gateway_in1),
        .S(gateway_out));
endmodule

(* ORIG_REF_NAME = "addb_axi_lite_interface" *) 
module base_zynq_addb_0_0_addb_axi_lite_interface
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

  base_zynq_addb_0_0_addb_axi_lite_interface_verilog inst
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

(* ORIG_REF_NAME = "addb_axi_lite_interface_verilog" *) 
module base_zynq_addb_0_0_addb_axi_lite_interface_verilog
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

(* CHECK_LICENSE_TYPE = "addb_c_addsub_v12_0_i0,c_addsub_v12_0_10,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "addb_c_addsub_v12_0_i0" *) 
(* X_CORE_INFO = "c_addsub_v12_0_10,Vivado 2017.1" *) 
module base_zynq_addb_0_0_addb_c_addsub_v12_0_i0
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
  base_zynq_addb_0_0_c_addsub_v12_0_10 U0
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

(* ORIG_REF_NAME = "addb_struct" *) 
module base_zynq_addb_0_0_addb_struct
   (S,
    A,
    B);
  output [16:0]S;
  input [15:0]A;
  input [15:0]B;

  wire [15:0]A;
  wire [15:0]B;
  wire [16:0]S;

  base_zynq_addb_0_0_addb_xladdsub addsub
       (.A(A),
        .B(B),
        .S(S));
endmodule

(* ORIG_REF_NAME = "addb_xladdsub" *) 
module base_zynq_addb_0_0_addb_xladdsub
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
  base_zynq_addb_0_0_addb_c_addsub_v12_0_i0 \comp0.core_instance0 
       (.A({A[15],A}),
        .B({B[15],B}),
        .S(S));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "17" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000" *) 
(* C_B_WIDTH = "17" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) 
(* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) (* C_VERBOSITY = "0" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "c_addsub_v12_0_10" *) 
(* c_has_c_in = "0" *) (* c_has_c_out = "0" *) (* c_latency = "0" *) 
(* c_out_width = "17" *) 
module base_zynq_addb_0_0_c_addsub_v12_0_10
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
  base_zynq_addb_0_0_c_addsub_v12_0_10_viv xst_addsub
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
G9eX1alo/VppMUFfs9EK8rjqxhyD1sMADpRrGqp60R4tCJaAG/LAaiyRky3Xjt0yRR+k2Xkluuv9
CDrefJXBDGLLgpLmU7aYGWwnZWFaZT0zcX7xf8BAIi1xjnaBS2Zk8zz5wNmwYYyROMTgh3Zdossa
iftR+I9yt3sQBJP9an+ovXnjOyk8zSjTYinyjQLDSwhArc/bMhjWU2eITASUmm9+L6sizWrgJoDo
bCNrMrG7abnA2/AdtENtuK0MoOG+eUiku+Yin/eyhtEZJbB/bnZXdeq6ohYIm8hgOIgOPzzev9x/
DPM8JEuJRUQh9i9eH65W70GmPWUn1DbKr50/hw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
4DRSfF+Wyu1nqbnAMoVcZ8MQw3hq/1wjazlUEaKoyCNMWxPXcc63NdZWfH0dJ3SrovOCcjh3XQOF
G8TM1XADIRLjs1ngs3xTZM7j1MIF1AL41WB2Ad5k5IgcInYYYnC+Q4L1n0Hinr/m444tqCjBvK54
jv3mIra6WPaLsRiFhs65vCyWq4lei0mtn7nTUcYBwc+0i659aXu0ElrUktdvE8uvnhWT1KAHT/di
9hfVh5Ig0Y8xlU7Q2oJjS/hZvp0lYgizYbdd8RpJr+Gknob+HiNNMoHXLkT5xJ7NI9yAbU8RUdfi
smj4f4byqIC1cVLvHEbtz//wWswGkR05VNPMlQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10000)
`pragma protect data_block
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
7nRL0b+qHUzTTMmNxQst/MW78Suw8SNd2A==
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
