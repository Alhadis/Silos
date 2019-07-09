//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
//Date        : Wed Dec  6 12:50:13 2017
//Host        : SC-201709270320 running 64-bit major release  (build 9200)
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=21,numReposBlks=21,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=9,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (blue_sig,
    clk,
    data_in,
    green_sig,
    hsync_sig,
    lcd_dclk,
    lcd_de,
    red_sig,
    vsync_sig);
  output [7:0]blue_sig;
  input clk;
  input [31:0]data_in;
  output [7:0]green_sig;
  output hsync_sig;
  output lcd_dclk;
  output lcd_de;
  output [7:0]red_sig;
  output vsync_sig;

  wire clk_in1_1;
  wire clk_wiz_0_clk_9Mhz;
  wire [5:1]data_combine_module_1_rom_0_addr;
  wire [5:1]data_combine_module_1_rom_1_addr;
  wire [5:1]data_combine_module_1_rom_2_addr;
  wire [5:1]data_combine_module_1_rom_3_addr;
  wire [5:1]data_combine_module_1_rom_4_addr;
  wire [5:1]data_combine_module_1_rom_5_addr;
  wire [5:1]data_combine_module_1_rom_6_addr;
  wire [5:1]data_combine_module_1_rom_7_addr;
  wire [5:1]data_combine_module_1_rom_8_addr;
  wire [5:1]data_combine_module_1_rom_9_addr;
  wire [5:1]data_combine_module_1_rom_C_addr;
  wire [5:1]data_combine_module_1_rom_L_addr;
  wire [5:1]data_combine_module_1_rom_R_addr;
  wire [16:1]data_combine_module_1_rom_data_0;
  wire [16:1]data_combine_module_1_rom_data_1;
  wire [16:1]data_combine_module_1_rom_data_2;
  wire [16:1]data_combine_module_1_rom_data_3;
  wire [16:1]data_combine_module_1_rom_data_4;
  wire [16:1]data_combine_module_1_rom_data_5;
  wire [32:1]data_combine_module_1_rom_data_6;
  wire [5:1]data_combine_module_1_rom_equal_addr;
  wire [5:1]data_combine_module_1_rom_mH_addr;
  wire [5:1]data_combine_module_1_rom_nF_addr;
  wire [5:1]data_combine_module_1_rom_omega_addr;
  wire [31:0]data_in_1;
  wire [7:0]lcd_control_module_1_blue_sig;
  wire lcd_control_module_1_char_ready_0;
  wire lcd_control_module_1_char_ready_1;
  wire lcd_control_module_1_char_ready_2;
  wire lcd_control_module_1_char_ready_3;
  wire lcd_control_module_1_char_ready_4;
  wire lcd_control_module_1_char_ready_5;
  wire lcd_control_module_1_char_ready_6;
  wire [7:0]lcd_control_module_1_green_sig;
  wire [7:0]lcd_control_module_1_red_sig;
  wire [5:1]lcd_control_module_1_rom_addr_0;
  wire [5:1]lcd_control_module_1_rom_addr_1;
  wire [5:1]lcd_control_module_1_rom_addr_2;
  wire [5:1]lcd_control_module_1_rom_addr_3;
  wire [5:1]lcd_control_module_1_rom_addr_4;
  wire [5:1]lcd_control_module_1_rom_addr_5;
  wire [5:1]lcd_control_module_1_rom_addr_6;
  wire [15:0]rom_0_spo;
  wire [15:0]rom_1_spo;
  wire [15:0]rom_2_spo;
  wire [15:0]rom_3_spo;
  wire [15:0]rom_4_spo;
  wire [15:0]rom_5_spo;
  wire [15:0]rom_6_spo;
  wire [15:0]rom_7_spo;
  wire [15:0]rom_8_spo;
  wire [15:0]rom_9_spo;
  wire [15:0]rom_C_spo;
  wire [15:0]rom_L_spo;
  wire [15:0]rom_R_spo;
  wire [15:0]rom_equal_spo;
  wire [31:0]rom_mH_spo;
  wire [31:0]rom_nF_spo;
  wire [31:0]rom_omega_spo;
  wire [10:0]sync_module_1_column_addr_sig;
  wire sync_module_1_hsync_sig;
  wire sync_module_1_lcd_dclk;
  wire sync_module_1_ready_sig;
  wire [10:0]sync_module_1_row_addr_sig;
  wire sync_module_1_vsync_sig;

  assign blue_sig[7:0] = lcd_control_module_1_blue_sig;
  assign clk_in1_1 = clk;
  assign data_in_1 = data_in[31:0];
  assign green_sig[7:0] = lcd_control_module_1_green_sig;
  assign hsync_sig = sync_module_1_hsync_sig;
  assign lcd_dclk = sync_module_1_lcd_dclk;
  assign lcd_de = sync_module_1_ready_sig;
  assign red_sig[7:0] = lcd_control_module_1_red_sig;
  assign vsync_sig = sync_module_1_vsync_sig;
  system_clk_wiz_0_0 clk_wiz_0
       (.clk_9Mhz(clk_wiz_0_clk_9Mhz),
        .clk_in1(clk_in1_1));
  system_data_combine_module_1_0 data_combine_module_1
       (.char_ready_0(lcd_control_module_1_char_ready_0),
        .char_ready_1(lcd_control_module_1_char_ready_1),
        .char_ready_2(lcd_control_module_1_char_ready_2),
        .char_ready_3(lcd_control_module_1_char_ready_3),
        .char_ready_4(lcd_control_module_1_char_ready_4),
        .char_ready_5(lcd_control_module_1_char_ready_5),
        .char_ready_6(lcd_control_module_1_char_ready_6),
        .clk(clk_in1_1),
        .data_in(data_in_1),
        .rom_0_addr(data_combine_module_1_rom_0_addr),
        .rom_0_data(rom_0_spo),
        .rom_1_addr(data_combine_module_1_rom_1_addr),
        .rom_1_data(rom_1_spo),
        .rom_2_addr(data_combine_module_1_rom_2_addr),
        .rom_2_data(rom_2_spo),
        .rom_3_addr(data_combine_module_1_rom_3_addr),
        .rom_3_data(rom_3_spo),
        .rom_4_addr(data_combine_module_1_rom_4_addr),
        .rom_4_data(rom_4_spo),
        .rom_5_addr(data_combine_module_1_rom_5_addr),
        .rom_5_data(rom_5_spo),
        .rom_6_addr(data_combine_module_1_rom_6_addr),
        .rom_6_data(rom_6_spo),
        .rom_7_addr(data_combine_module_1_rom_7_addr),
        .rom_7_data(rom_7_spo),
        .rom_8_addr(data_combine_module_1_rom_8_addr),
        .rom_8_data(rom_8_spo),
        .rom_9_addr(data_combine_module_1_rom_9_addr),
        .rom_9_data(rom_9_spo),
        .rom_C_addr(data_combine_module_1_rom_C_addr),
        .rom_C_data(rom_C_spo),
        .rom_L_addr(data_combine_module_1_rom_L_addr),
        .rom_L_data(rom_L_spo),
        .rom_R_addr(data_combine_module_1_rom_R_addr),
        .rom_R_data(rom_R_spo),
        .rom_addr_0(lcd_control_module_1_rom_addr_0),
        .rom_addr_1(lcd_control_module_1_rom_addr_1),
        .rom_addr_2(lcd_control_module_1_rom_addr_2),
        .rom_addr_3(lcd_control_module_1_rom_addr_3),
        .rom_addr_4(lcd_control_module_1_rom_addr_4),
        .rom_addr_5(lcd_control_module_1_rom_addr_5),
        .rom_addr_6(lcd_control_module_1_rom_addr_6),
        .rom_data_0(data_combine_module_1_rom_data_0),
        .rom_data_1(data_combine_module_1_rom_data_1),
        .rom_data_2(data_combine_module_1_rom_data_2),
        .rom_data_3(data_combine_module_1_rom_data_3),
        .rom_data_4(data_combine_module_1_rom_data_4),
        .rom_data_5(data_combine_module_1_rom_data_5),
        .rom_data_6(data_combine_module_1_rom_data_6),
        .rom_equal_addr(data_combine_module_1_rom_equal_addr),
        .rom_equal_data(rom_equal_spo),
        .rom_mH_addr(data_combine_module_1_rom_mH_addr),
        .rom_mH_data(rom_mH_spo),
        .rom_nF_addr(data_combine_module_1_rom_nF_addr),
        .rom_nF_data(rom_nF_spo),
        .rom_omega_addr(data_combine_module_1_rom_omega_addr),
        .rom_omega_data(rom_omega_spo));
  system_lcd_control_module_1_0 lcd_control_module_1
       (.blue_sig(lcd_control_module_1_blue_sig),
        .char_ready_0(lcd_control_module_1_char_ready_0),
        .char_ready_1(lcd_control_module_1_char_ready_1),
        .char_ready_2(lcd_control_module_1_char_ready_2),
        .char_ready_3(lcd_control_module_1_char_ready_3),
        .char_ready_4(lcd_control_module_1_char_ready_4),
        .char_ready_5(lcd_control_module_1_char_ready_5),
        .char_ready_6(lcd_control_module_1_char_ready_6),
        .clk(clk_wiz_0_clk_9Mhz),
        .column_addr_sig(sync_module_1_column_addr_sig),
        .green_sig(lcd_control_module_1_green_sig),
        .ready_sig(sync_module_1_ready_sig),
        .red_sig(lcd_control_module_1_red_sig),
        .rom_addr_0(lcd_control_module_1_rom_addr_0),
        .rom_addr_1(lcd_control_module_1_rom_addr_1),
        .rom_addr_2(lcd_control_module_1_rom_addr_2),
        .rom_addr_3(lcd_control_module_1_rom_addr_3),
        .rom_addr_4(lcd_control_module_1_rom_addr_4),
        .rom_addr_5(lcd_control_module_1_rom_addr_5),
        .rom_addr_6(lcd_control_module_1_rom_addr_6),
        .rom_data_0(data_combine_module_1_rom_data_0),
        .rom_data_1(data_combine_module_1_rom_data_1),
        .rom_data_2(data_combine_module_1_rom_data_2),
        .rom_data_3(data_combine_module_1_rom_data_3),
        .rom_data_4(data_combine_module_1_rom_data_4),
        .rom_data_5(data_combine_module_1_rom_data_5),
        .rom_data_6(data_combine_module_1_rom_data_6),
        .row_addr_sig(sync_module_1_row_addr_sig));
  system_rom_3_7 rom_0
       (.a(data_combine_module_1_rom_0_addr),
        .spo(rom_0_spo));
  system_rom_3_6 rom_1
       (.a(data_combine_module_1_rom_1_addr),
        .spo(rom_1_spo));
  system_dist_mem_gen_0_0 rom_2
       (.a(data_combine_module_1_rom_2_addr),
        .spo(rom_2_spo));
  system_rom_2_0 rom_3
       (.a(data_combine_module_1_rom_3_addr),
        .spo(rom_3_spo));
  system_rom_3_0 rom_4
       (.a(data_combine_module_1_rom_4_addr),
        .spo(rom_4_spo));
  system_rom_3_1 rom_5
       (.a(data_combine_module_1_rom_5_addr),
        .spo(rom_5_spo));
  system_rom_3_2 rom_6
       (.a(data_combine_module_1_rom_6_addr),
        .spo(rom_6_spo));
  system_rom_3_3 rom_7
       (.a(data_combine_module_1_rom_7_addr),
        .spo(rom_7_spo));
  system_rom_3_4 rom_8
       (.a(data_combine_module_1_rom_8_addr),
        .spo(rom_8_spo));
  system_rom_3_5 rom_9
       (.a(data_combine_module_1_rom_9_addr),
        .spo(rom_9_spo));
  system_rom_R_0 rom_C
       (.a(data_combine_module_1_rom_C_addr),
        .spo(rom_C_spo));
  system_rom_R_1 rom_L
       (.a(data_combine_module_1_rom_L_addr),
        .spo(rom_L_spo));
  system_rom_0_0 rom_R
       (.a(data_combine_module_1_rom_R_addr),
        .spo(rom_R_spo));
  system_rom_R_2 rom_equal
       (.a(data_combine_module_1_rom_equal_addr),
        .spo(rom_equal_spo));
  system_rom_omega_1 rom_mH
       (.a(data_combine_module_1_rom_mH_addr),
        .spo(rom_mH_spo));
  system_rom_omega_0 rom_nF
       (.a(data_combine_module_1_rom_nF_addr),
        .spo(rom_nF_spo));
  system_rom_R_3 rom_omega
       (.a(data_combine_module_1_rom_omega_addr),
        .spo(rom_omega_spo));
  system_sync_module_1_0 sync_module_1
       (.clk(clk_wiz_0_clk_9Mhz),
        .column_addr_sig(sync_module_1_column_addr_sig),
        .hsync_sig(sync_module_1_hsync_sig),
        .lcd_dclk(sync_module_1_lcd_dclk),
        .ready_sig(sync_module_1_ready_sig),
        .row_addr_sig(sync_module_1_row_addr_sig),
        .vsync_sig(sync_module_1_vsync_sig));
endmodule
