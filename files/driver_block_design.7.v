//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Thu Nov 29 15:57:52 2018
//Host        : DESKTOP-PTNOPEH running 64-bit major release  (build 9200)
//Command     : generate_target driver_block_design.bd
//Design      : driver_block_design
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "driver_block_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=driver_block_design,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "driver_block_design.hwdef" *) 
module driver_block_design
   (GPIO_IN,
    bitnum_0,
    clk_0,
    data_in_0_addr,
    data_in_0_clk,
    data_in_0_dout,
    data_in_0_en,
    data_in_0_rst,
    data_in_1_addr,
    data_in_1_clk,
    data_in_1_dout,
    data_in_1_en,
    data_in_1_rst,
    enable_0,
    gsclk_0,
    latch_0,
    reset_0,
    sclk_0,
    sout_0);
  input [2:0]GPIO_IN;
  output [10:0]bitnum_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET reset_0, CLK_DOMAIN driver_block_design_clk_0, FREQ_HZ 50000000, PHASE 0.000" *) input clk_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_0, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_0_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 CLK" *) output data_in_0_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 DOUT" *) input [31:0]data_in_0_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 EN" *) output data_in_0_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_0 RST" *) output data_in_0_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in_1, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32" *) output [31:0]data_in_1_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 CLK" *) output data_in_1_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 DOUT" *) input [31:0]data_in_1_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 EN" *) output data_in_1_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 data_in_1 RST" *) output data_in_1_rst;
  input enable_0;
  output gsclk_0;
  output latch_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, POLARITY ACTIVE_HIGH" *) input reset_0;
  output sclk_0;
  output sout_0;

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
  wire [31:0]sout_module_1_data_in_ADDR;
  wire sout_module_1_data_in_CLK;
  wire [31:0]sout_module_1_data_in_DOUT;
  wire sout_module_1_data_in_EN;
  wire sout_module_1_data_in_RST;
  wire sout_module_1_sout;
  wire [1:0]xlconstant_0_dout;

  assign GPIO_IN_1 = GPIO_IN[2:0];
  assign bitnum_0[10:0] = mean_machine_module_0_bit_num;
  assign clk_0_1 = clk_0;
  assign data_in_0_addr[31:0] = sout_module_0_data_in_ADDR;
  assign data_in_0_clk = sout_module_0_data_in_CLK;
  assign data_in_0_en = sout_module_0_data_in_EN;
  assign data_in_0_rst = sout_module_0_data_in_RST;
  assign data_in_1_addr[31:0] = sout_module_1_data_in_ADDR;
  assign data_in_1_clk = sout_module_1_data_in_CLK;
  assign data_in_1_en = sout_module_1_data_in_EN;
  assign data_in_1_rst = sout_module_1_data_in_RST;
  assign enable_0_1 = enable_0;
  assign gsclk_0 = mean_machine_module_0_gsclk;
  assign latch_0 = mean_machine_module_0_latch;
  assign reset_0_1 = reset_0;
  assign sclk_0 = mean_machine_module_0_sclk;
  assign sout_0 = sout_module_1_sout;
  assign sout_module_0_data_in_DOUT = data_in_0_dout[31:0];
  assign sout_module_1_data_in_DOUT = data_in_1_dout[31:0];
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
  driver_block_design_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
