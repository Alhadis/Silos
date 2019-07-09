//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Tue Dec  4 22:26:08 2018
//Host        : DESKTOP-PTNOPEH running 64-bit major release  (build 9200)
//Command     : generate_target driver_block_design.bd
//Design      : driver_block_design
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "driver_block_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=driver_block_design,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=14,numReposBlks=14,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "driver_block_design.hwdef" *) 
module driver_block_design
   (GPIO_IN,
    clk_0,
    data_in_0_addr,
    data_in_0_clk,
    data_in_0_dout,
    data_in_0_en,
    data_in_0_rst,
    data_in_10_addr,
    data_in_10_clk,
    data_in_10_dout,
    data_in_10_en,
    data_in_10_rst,
    data_in_1_addr,
    data_in_1_clk,
    data_in_1_dout,
    data_in_1_en,
    data_in_1_rst,
    data_in_2_addr,
    data_in_2_clk,
    data_in_2_dout,
    data_in_2_en,
    data_in_2_rst,
    data_in_3_addr,
    data_in_3_clk,
    data_in_3_dout,
    data_in_3_en,
    data_in_3_rst,
    data_in_4_addr,
    data_in_4_clk,
    data_in_4_dout,
    data_in_4_en,
    data_in_4_rst,
    data_in_5_addr,
    data_in_5_clk,
    data_in_5_dout,
    data_in_5_en,
    data_in_5_rst,
    data_in_6_addr,
    data_in_6_clk,
    data_in_6_dout,
    data_in_6_en,
    data_in_6_rst,
    data_in_7_addr,
    data_in_7_clk,
    data_in_7_dout,
    data_in_7_en,
    data_in_7_rst,
    data_in_8_addr,
    data_in_8_clk,
    data_in_8_dout,
    data_in_8_en,
    data_in_8_rst,
    data_in_9_addr,
    data_in_9_clk,
    data_in_9_dout,
    data_in_9_en,
    data_in_9_rst,
    enable_0,
    gsclk_0,
    gsclk_1,
    gsclk_2,
    gsclk_3,
    gsclk_4,
    gsclk_5,
    gsclk_6,
    gsclk_7,
    gsclk_8,
    gsclk_9,
    latch_0,
    latch_1,
    latch_2,
    latch_3,
    latch_4,
    latch_5,
    latch_6,
    latch_7,
    latch_8,
    latch_9,
    reset_0,
    sclk_0,
    sclk_1,
    sclk_2,
    sclk_3,
    sclk_4,
    sclk_5,
    sclk_6,
    sclk_7,
    sclk_8,
    sclk_9,
    sout_0,
    sout_1,
    sout_2,
    sout_3,
    sout_4,
    sout_5,
    sout_6,
    sout_7,
    sout_8,
    sout_9);
  input [2:0]GPIO_IN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET reset_0, CLK_DOMAIN driver_block_design_clk_0, FREQ_HZ 50000000, PHASE 0.000" *) input clk_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_0, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_0_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 CLK" *) output data_in_0_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 DOUT" *) input [31:0]data_in_0_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 EN" *) output data_in_0_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 RST" *) output data_in_0_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_10 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_10, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_10_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_10 CLK" *) output data_in_10_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_10 DOUT" *) input [31:0]data_in_10_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_10 EN" *) output data_in_10_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_10 RST" *) output data_in_10_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_1, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_1_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 CLK" *) output data_in_1_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 DOUT" *) input [31:0]data_in_1_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 EN" *) output data_in_1_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 RST" *) output data_in_1_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_2 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_2, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_2_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_2 CLK" *) output data_in_2_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_2 DOUT" *) input [31:0]data_in_2_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_2 EN" *) output data_in_2_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_2 RST" *) output data_in_2_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_3 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_3, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_3_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_3 CLK" *) output data_in_3_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_3 DOUT" *) input [31:0]data_in_3_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_3 EN" *) output data_in_3_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_3 RST" *) output data_in_3_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_4 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_4, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_4_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_4 CLK" *) output data_in_4_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_4 DOUT" *) input [31:0]data_in_4_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_4 EN" *) output data_in_4_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_4 RST" *) output data_in_4_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_5 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_5, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_5_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_5 CLK" *) output data_in_5_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_5 DOUT" *) input [31:0]data_in_5_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_5 EN" *) output data_in_5_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_5 RST" *) output data_in_5_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_6 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_6, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_6_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_6 CLK" *) output data_in_6_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_6 DOUT" *) input [31:0]data_in_6_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_6 EN" *) output data_in_6_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_6 RST" *) output data_in_6_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_7 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_7, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_7_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_7 CLK" *) output data_in_7_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_7 DOUT" *) input [31:0]data_in_7_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_7 EN" *) output data_in_7_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_7 RST" *) output data_in_7_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_8 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_8, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_8_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_8 CLK" *) output data_in_8_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_8 DOUT" *) input [31:0]data_in_8_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_8 EN" *) output data_in_8_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_8 RST" *) output data_in_8_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_9 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_9, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_9_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_9 CLK" *) output data_in_9_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_9 DOUT" *) input [31:0]data_in_9_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_9 EN" *) output data_in_9_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_9 RST" *) output data_in_9_rst;
  input enable_0;
  output gsclk_0;
  output gsclk_1;
  output gsclk_2;
  output gsclk_3;
  output gsclk_4;
  output gsclk_5;
  output gsclk_6;
  output gsclk_7;
  output gsclk_8;
  output gsclk_9;
  output latch_0;
  output latch_1;
  output latch_2;
  output latch_3;
  output latch_4;
  output latch_5;
  output latch_6;
  output latch_7;
  output latch_8;
  output latch_9;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, POLARITY ACTIVE_HIGH" *) input reset_0;
  output sclk_0;
  output sclk_1;
  output sclk_2;
  output sclk_3;
  output sclk_4;
  output sclk_5;
  output sclk_6;
  output sclk_7;
  output sclk_8;
  output sclk_9;
  output sout_0;
  output sout_1;
  output sout_2;
  output sout_3;
  output sout_4;
  output sout_5;
  output sout_6;
  output sout_7;
  output sout_8;
  output sout_9;

  wire [2:0]GPIO_IN_1;
  wire clk_0_1;
  wire enable_0_1;
  wire interrupt_0_buf_select;
  wire interrupt_0_next_section;
  wire interrupt_0_setup;
  wire [10:0]mean_machine_module_0_bit_num;
  wire [1:0]mean_machine_module_0_buf_select;
  wire mean_machine_module_0_gsclk;
  wire mean_machine_module_0_latch;
  wire mean_machine_module_0_latch_select;
  wire mean_machine_module_0_ready;
  wire mean_machine_module_0_sclk;
  wire reset_0_1;
  wire [31:0]sout_module_0_data_in_ADDR;
  wire sout_module_0_data_in_CLK;
  wire [31:0]sout_module_0_data_in_DOUT;
  wire sout_module_0_data_in_EN;
  wire sout_module_0_data_in_RST;
  wire sout_module_0_sout;
  wire [31:0]sout_module_10_data_in_ADDR;
  wire sout_module_10_data_in_CLK;
  wire [31:0]sout_module_10_data_in_DOUT;
  wire sout_module_10_data_in_EN;
  wire sout_module_10_data_in_RST;
  wire sout_module_10_sout;
  wire [31:0]sout_module_1_data_in_ADDR;
  wire sout_module_1_data_in_CLK;
  wire [31:0]sout_module_1_data_in_DOUT;
  wire sout_module_1_data_in_EN;
  wire sout_module_1_data_in_RST;
  wire sout_module_1_sout;
  wire [31:0]sout_module_2_data_in_ADDR;
  wire sout_module_2_data_in_CLK;
  wire [31:0]sout_module_2_data_in_DOUT;
  wire sout_module_2_data_in_EN;
  wire sout_module_2_data_in_RST;
  wire sout_module_2_sout;
  wire [31:0]sout_module_3_data_in_ADDR;
  wire sout_module_3_data_in_CLK;
  wire [31:0]sout_module_3_data_in_DOUT;
  wire sout_module_3_data_in_EN;
  wire sout_module_3_data_in_RST;
  wire sout_module_3_sout;
  wire [31:0]sout_module_4_data_in_ADDR;
  wire sout_module_4_data_in_CLK;
  wire [31:0]sout_module_4_data_in_DOUT;
  wire sout_module_4_data_in_EN;
  wire sout_module_4_data_in_RST;
  wire sout_module_4_sout;
  wire [31:0]sout_module_5_data_in_ADDR;
  wire sout_module_5_data_in_CLK;
  wire [31:0]sout_module_5_data_in_DOUT;
  wire sout_module_5_data_in_EN;
  wire sout_module_5_data_in_RST;
  wire sout_module_5_sout;
  wire [31:0]sout_module_6_data_in_ADDR;
  wire sout_module_6_data_in_CLK;
  wire [31:0]sout_module_6_data_in_DOUT;
  wire sout_module_6_data_in_EN;
  wire sout_module_6_data_in_RST;
  wire sout_module_6_sout;
  wire [31:0]sout_module_7_data_in_ADDR;
  wire sout_module_7_data_in_CLK;
  wire [31:0]sout_module_7_data_in_DOUT;
  wire sout_module_7_data_in_EN;
  wire sout_module_7_data_in_RST;
  wire sout_module_7_sout;
  wire [31:0]sout_module_8_data_in_ADDR;
  wire sout_module_8_data_in_CLK;
  wire [31:0]sout_module_8_data_in_DOUT;
  wire sout_module_8_data_in_EN;
  wire sout_module_8_data_in_RST;
  wire sout_module_8_sout;
  wire [31:0]sout_module_9_data_in_ADDR;
  wire sout_module_9_data_in_CLK;
  wire [31:0]sout_module_9_data_in_DOUT;
  wire sout_module_9_data_in_EN;
  wire sout_module_9_data_in_RST;
  wire sout_module_9_sout;
  wire [1:0]xlconstant_0_dout;

  assign GPIO_IN_1 = GPIO_IN[2:0];
  assign clk_0_1 = clk_0;
  assign data_in_0_addr[31:0] = sout_module_0_data_in_ADDR;
  assign data_in_0_clk = sout_module_0_data_in_CLK;
  assign data_in_0_en = sout_module_0_data_in_EN;
  assign data_in_0_rst = sout_module_0_data_in_RST;
  assign data_in_10_addr[31:0] = sout_module_10_data_in_ADDR;
  assign data_in_10_clk = sout_module_10_data_in_CLK;
  assign data_in_10_en = sout_module_10_data_in_EN;
  assign data_in_10_rst = sout_module_10_data_in_RST;
  assign data_in_1_addr[31:0] = sout_module_1_data_in_ADDR;
  assign data_in_1_clk = sout_module_1_data_in_CLK;
  assign data_in_1_en = sout_module_1_data_in_EN;
  assign data_in_1_rst = sout_module_1_data_in_RST;
  assign data_in_2_addr[31:0] = sout_module_2_data_in_ADDR;
  assign data_in_2_clk = sout_module_2_data_in_CLK;
  assign data_in_2_en = sout_module_2_data_in_EN;
  assign data_in_2_rst = sout_module_2_data_in_RST;
  assign data_in_3_addr[31:0] = sout_module_3_data_in_ADDR;
  assign data_in_3_clk = sout_module_3_data_in_CLK;
  assign data_in_3_en = sout_module_3_data_in_EN;
  assign data_in_3_rst = sout_module_3_data_in_RST;
  assign data_in_4_addr[31:0] = sout_module_4_data_in_ADDR;
  assign data_in_4_clk = sout_module_4_data_in_CLK;
  assign data_in_4_en = sout_module_4_data_in_EN;
  assign data_in_4_rst = sout_module_4_data_in_RST;
  assign data_in_5_addr[31:0] = sout_module_5_data_in_ADDR;
  assign data_in_5_clk = sout_module_5_data_in_CLK;
  assign data_in_5_en = sout_module_5_data_in_EN;
  assign data_in_5_rst = sout_module_5_data_in_RST;
  assign data_in_6_addr[31:0] = sout_module_6_data_in_ADDR;
  assign data_in_6_clk = sout_module_6_data_in_CLK;
  assign data_in_6_en = sout_module_6_data_in_EN;
  assign data_in_6_rst = sout_module_6_data_in_RST;
  assign data_in_7_addr[31:0] = sout_module_7_data_in_ADDR;
  assign data_in_7_clk = sout_module_7_data_in_CLK;
  assign data_in_7_en = sout_module_7_data_in_EN;
  assign data_in_7_rst = sout_module_7_data_in_RST;
  assign data_in_8_addr[31:0] = sout_module_8_data_in_ADDR;
  assign data_in_8_clk = sout_module_8_data_in_CLK;
  assign data_in_8_en = sout_module_8_data_in_EN;
  assign data_in_8_rst = sout_module_8_data_in_RST;
  assign data_in_9_addr[31:0] = sout_module_9_data_in_ADDR;
  assign data_in_9_clk = sout_module_9_data_in_CLK;
  assign data_in_9_en = sout_module_9_data_in_EN;
  assign data_in_9_rst = sout_module_9_data_in_RST;
  assign enable_0_1 = enable_0;
  assign gsclk_0 = mean_machine_module_0_gsclk;
  assign gsclk_1 = mean_machine_module_0_gsclk;
  assign gsclk_2 = mean_machine_module_0_gsclk;
  assign gsclk_3 = mean_machine_module_0_gsclk;
  assign gsclk_4 = mean_machine_module_0_gsclk;
  assign gsclk_5 = mean_machine_module_0_gsclk;
  assign gsclk_6 = mean_machine_module_0_gsclk;
  assign gsclk_7 = mean_machine_module_0_gsclk;
  assign gsclk_8 = mean_machine_module_0_gsclk;
  assign gsclk_9 = mean_machine_module_0_gsclk;
  assign latch_0 = mean_machine_module_0_latch;
  assign latch_1 = mean_machine_module_0_latch;
  assign latch_2 = mean_machine_module_0_latch;
  assign latch_3 = mean_machine_module_0_latch;
  assign latch_4 = mean_machine_module_0_latch;
  assign latch_5 = mean_machine_module_0_latch;
  assign latch_6 = mean_machine_module_0_latch;
  assign latch_7 = mean_machine_module_0_latch;
  assign latch_8 = mean_machine_module_0_latch;
  assign latch_9 = mean_machine_module_0_latch;
  assign reset_0_1 = reset_0;
  assign sclk_0 = mean_machine_module_0_sclk;
  assign sclk_1 = mean_machine_module_0_sclk;
  assign sclk_2 = mean_machine_module_0_sclk;
  assign sclk_3 = mean_machine_module_0_sclk;
  assign sclk_4 = mean_machine_module_0_sclk;
  assign sclk_5 = mean_machine_module_0_sclk;
  assign sclk_6 = mean_machine_module_0_sclk;
  assign sclk_7 = mean_machine_module_0_sclk;
  assign sclk_8 = mean_machine_module_0_sclk;
  assign sclk_9 = mean_machine_module_0_sclk;
  assign sout_0 = sout_module_1_sout;
  assign sout_1 = sout_module_2_sout;
  assign sout_2 = sout_module_3_sout;
  assign sout_3 = sout_module_4_sout;
  assign sout_4 = sout_module_5_sout;
  assign sout_5 = sout_module_6_sout;
  assign sout_6 = sout_module_7_sout;
  assign sout_7 = sout_module_8_sout;
  assign sout_8 = sout_module_9_sout;
  assign sout_9 = sout_module_10_sout;
  assign sout_module_0_data_in_DOUT = data_in_0_dout[31:0];
  assign sout_module_10_data_in_DOUT = data_in_10_dout[31:0];
  assign sout_module_1_data_in_DOUT = data_in_1_dout[31:0];
  assign sout_module_2_data_in_DOUT = data_in_2_dout[31:0];
  assign sout_module_3_data_in_DOUT = data_in_3_dout[31:0];
  assign sout_module_4_data_in_DOUT = data_in_4_dout[31:0];
  assign sout_module_5_data_in_DOUT = data_in_5_dout[31:0];
  assign sout_module_6_data_in_DOUT = data_in_6_dout[31:0];
  assign sout_module_7_data_in_DOUT = data_in_7_dout[31:0];
  assign sout_module_8_data_in_DOUT = data_in_8_dout[31:0];
  assign sout_module_9_data_in_DOUT = data_in_9_dout[31:0];
  driver_block_design_interrupt_0_0 interrupt_0
       (.GPIO_IN(GPIO_IN_1),
        .buf_select(interrupt_0_buf_select),
        .clk(clk_0_1),
        .next_section(interrupt_0_next_section),
        .ready(mean_machine_module_0_ready),
        .reset(reset_0_1),
        .setup(interrupt_0_setup));
  driver_block_design_mean_machine_module_0_0 mean_machine_module_0
       (.bit_num(mean_machine_module_0_bit_num),
        .buf_select(mean_machine_module_0_buf_select),
        .buf_selected(interrupt_0_buf_select),
        .clk(clk_0_1),
        .enable(enable_0_1),
        .gsclk(mean_machine_module_0_gsclk),
        .latch(mean_machine_module_0_latch),
        .latch_select(mean_machine_module_0_latch_select),
        .next_section(interrupt_0_next_section),
        .ready(mean_machine_module_0_ready),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .setup(interrupt_0_setup));
  driver_block_design_sout_module_0_0 sout_module_0
       (.b_addr(sout_module_0_data_in_ADDR),
        .b_clk(sout_module_0_data_in_CLK),
        .b_d_out(sout_module_0_data_in_DOUT),
        .b_en(sout_module_0_data_in_EN),
        .b_rst(sout_module_0_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(xlconstant_0_dout),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(xlconstant_0_dout[0]),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_0_sout));
  driver_block_design_sout_module_1_0 sout_module_1
       (.b_addr(sout_module_1_data_in_ADDR),
        .b_clk(sout_module_1_data_in_CLK),
        .b_d_out(sout_module_1_data_in_DOUT),
        .b_en(sout_module_1_data_in_EN),
        .b_rst(sout_module_1_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_1_sout));
  driver_block_design_sout_module_9_0 sout_module_10
       (.b_addr(sout_module_10_data_in_ADDR),
        .b_clk(sout_module_10_data_in_CLK),
        .b_d_out(sout_module_10_data_in_DOUT),
        .b_en(sout_module_10_data_in_EN),
        .b_rst(sout_module_10_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_10_sout));
  driver_block_design_sout_module_1_1 sout_module_2
       (.b_addr(sout_module_2_data_in_ADDR),
        .b_clk(sout_module_2_data_in_CLK),
        .b_d_out(sout_module_2_data_in_DOUT),
        .b_en(sout_module_2_data_in_EN),
        .b_rst(sout_module_2_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_2_sout));
  driver_block_design_sout_module_2_0 sout_module_3
       (.b_addr(sout_module_3_data_in_ADDR),
        .b_clk(sout_module_3_data_in_CLK),
        .b_d_out(sout_module_3_data_in_DOUT),
        .b_en(sout_module_3_data_in_EN),
        .b_rst(sout_module_3_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_3_sout));
  driver_block_design_sout_module_3_0 sout_module_4
       (.b_addr(sout_module_4_data_in_ADDR),
        .b_clk(sout_module_4_data_in_CLK),
        .b_d_out(sout_module_4_data_in_DOUT),
        .b_en(sout_module_4_data_in_EN),
        .b_rst(sout_module_4_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_4_sout));
  driver_block_design_sout_module_3_1 sout_module_5
       (.b_addr(sout_module_5_data_in_ADDR),
        .b_clk(sout_module_5_data_in_CLK),
        .b_d_out(sout_module_5_data_in_DOUT),
        .b_en(sout_module_5_data_in_EN),
        .b_rst(sout_module_5_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_5_sout));
  driver_block_design_sout_module_3_2 sout_module_6
       (.b_addr(sout_module_6_data_in_ADDR),
        .b_clk(sout_module_6_data_in_CLK),
        .b_d_out(sout_module_6_data_in_DOUT),
        .b_en(sout_module_6_data_in_EN),
        .b_rst(sout_module_6_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_6_sout));
  driver_block_design_sout_module_4_0 sout_module_7
       (.b_addr(sout_module_7_data_in_ADDR),
        .b_clk(sout_module_7_data_in_CLK),
        .b_d_out(sout_module_7_data_in_DOUT),
        .b_en(sout_module_7_data_in_EN),
        .b_rst(sout_module_7_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_7_sout));
  driver_block_design_sout_module_5_0 sout_module_8
       (.b_addr(sout_module_8_data_in_ADDR),
        .b_clk(sout_module_8_data_in_CLK),
        .b_d_out(sout_module_8_data_in_DOUT),
        .b_en(sout_module_8_data_in_EN),
        .b_rst(sout_module_8_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_8_sout));
  driver_block_design_sout_module_6_0 sout_module_9
       (.b_addr(sout_module_9_data_in_ADDR),
        .b_clk(sout_module_9_data_in_CLK),
        .b_d_out(sout_module_9_data_in_DOUT),
        .b_en(sout_module_9_data_in_EN),
        .b_rst(sout_module_9_data_in_RST),
        .bit_num(mean_machine_module_0_bit_num),
        .buf_num(mean_machine_module_0_buf_select),
        .clk(clk_0_1),
        .latch_select(mean_machine_module_0_latch_select),
        .pass_through_bit(sout_module_0_sout),
        .reset(reset_0_1),
        .sclk(mean_machine_module_0_sclk),
        .sout(sout_module_9_sout));
  driver_block_design_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
