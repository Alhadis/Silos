// -------------------------------
// gpio mux tool version
// 1) gpo mux: v2.6 // generate GPO mux
// 2) gpi mux: v0.1 // generate GPI mux
// 3) post process tool: v0.1 // fix C-program output bug, and remove redundant ports
// 4) keep mux: v0.0 // add compile directive for synthesis tool to keep mux
// 5) Reg Bank gen: v1.732 // Generate the general register
// 6) RCM generate tool: v20131107 // Generate the .rcm file template
// -------------------------------
module	gpio_out_mux	(
   input          gpio_0_clk_out_0_out,
   input          gpio_0_expo_gain_ctrl_0_int_out,
   input          gpio_0_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_0_fn_sel,
   input          gpio_0_gpio_oe_out,
   input          gpio_0_gpio_out,
   input          gpio_0_mipi_tx1_ch0_veff_out,
   input          gpio_0_mipi_tx1_ch2_veff_out,
   input          gpio_0_rx0_a_v_sync_out,
   input          gpio_0_rx0_b_v_sync_out,
   input          gpio_0_rx0_c_v_sync_out,
   input          gpio_0_rx0_d_v_sync_out,
   input          gpio_0_rx0_h_sync_out,
   input          gpio_0_rx1_a_v_sync_out,
   input          gpio_0_rx1_b_v_sync_out,
   input          gpio_0_rx1_c_v_sync_out,
   input          gpio_0_rx1_d_v_sync_out,
   input          gpio_0_rx1_h_sync_out,
   input          gpio_1_expo_gain_ctrl_0_int_out,
   input          gpio_1_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_1_fn_sel,
   input          gpio_1_gpio_oe_out,
   input          gpio_1_gpio_out,
   input          gpio_1_mipi_tx1_ch0_veff_out,
   input          gpio_1_mipi_tx1_ch2_veff_out,
   input          gpio_1_rx0_a_v_sync_out,
   input          gpio_1_rx0_b_v_sync_out,
   input          gpio_1_rx0_c_v_sync_out,
   input          gpio_1_rx0_d_v_sync_out,
   input          gpio_1_rx0_h_sync_out,
   input          gpio_1_rx1_a_v_sync_out,
   input          gpio_1_rx1_b_v_sync_out,
   input          gpio_1_rx1_c_v_sync_out,
   input          gpio_1_rx1_d_v_sync_out,
   input          gpio_1_rx1_h_sync_out,
   input          gpio_1_ssi_4_out_out,
   input          gpio_2_expo_gain_ctrl_0_int_out,
   input          gpio_2_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_2_fn_sel,
   input          gpio_2_gpio_oe_out,
   input          gpio_2_gpio_out,
   input          gpio_2_mipi_tx1_ch0_veff_out,
   input          gpio_2_mipi_tx1_ch2_veff_out,
   input          gpio_2_rx0_a_v_sync_out,
   input          gpio_2_rx0_b_v_sync_out,
   input          gpio_2_rx0_c_v_sync_out,
   input          gpio_2_rx0_d_v_sync_out,
   input          gpio_2_rx0_h_sync_out,
   input          gpio_2_rx1_a_v_sync_out,
   input          gpio_2_rx1_b_v_sync_out,
   input          gpio_2_rx1_c_v_sync_out,
   input          gpio_2_rx1_d_v_sync_out,
   input          gpio_2_rx1_h_sync_out,
   input          gpio_2_ssi_3_out_out,
   input          gpio_3_expo_gain_ctrl_0_int_out,
   input          gpio_3_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_3_fn_sel,
   input          gpio_3_gpio_oe_out,
   input          gpio_3_gpio_out,
   input          gpio_3_mipi_tx1_ch1_veff_out,
   input          gpio_3_mipi_tx1_ch3_veff_out,
   input          gpio_3_rx0_a_v_sync_out,
   input          gpio_3_rx0_b_v_sync_out,
   input          gpio_3_rx0_c_v_sync_out,
   input          gpio_3_rx0_d_v_sync_out,
   input          gpio_3_rx0_h_sync_out,
   input          gpio_3_rx1_a_v_sync_out,
   input          gpio_3_rx1_b_v_sync_out,
   input          gpio_3_rx1_c_v_sync_out,
   input          gpio_3_rx1_d_v_sync_out,
   input          gpio_3_rx1_h_sync_out,
   input          gpio_3_ssi_3_out_out,
   input          gpio_4_expo_gain_ctrl_0_int_out,
   input          gpio_4_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_4_fn_sel,
   input          gpio_4_gpio_oe_out,
   input          gpio_4_gpio_out,
   input          gpio_4_mipi_tx1_ch1_veff_out,
   input          gpio_4_mipi_tx1_ch3_veff_out,
   input          gpio_4_rx0_a_v_sync_out,
   input          gpio_4_rx0_b_v_sync_out,
   input          gpio_4_rx0_c_v_sync_out,
   input          gpio_4_rx0_d_v_sync_out,
   input          gpio_4_rx0_h_sync_out,
   input          gpio_4_rx1_a_v_sync_out,
   input          gpio_4_rx1_b_v_sync_out,
   input          gpio_4_rx1_c_v_sync_out,
   input          gpio_4_rx1_d_v_sync_out,
   input          gpio_4_rx1_h_sync_out,
   input          gpio_4_ssi_3_out_out,
   input          gpio_5_expo_gain_ctrl_0_int_out,
   input          gpio_5_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_5_fn_sel,
   input          gpio_5_gpio_oe_out,
   input          gpio_5_gpio_out,
   input          gpio_5_mipi_tx1_ch1_veff_out,
   input          gpio_5_mipi_tx1_ch3_veff_out,
   input          gpio_5_rx0_a_v_sync_out,
   input          gpio_5_rx0_b_v_sync_out,
   input          gpio_5_rx0_c_v_sync_out,
   input          gpio_5_rx0_d_v_sync_out,
   input          gpio_5_rx0_h_sync_out,
   input          gpio_5_rx1_a_v_sync_out,
   input          gpio_5_rx1_b_v_sync_out,
   input          gpio_5_rx1_c_v_sync_out,
   input          gpio_5_rx1_d_v_sync_out,
   input          gpio_5_rx1_h_sync_out,
   input          gpio_5_ssi_4_out_out,
   input          gpio_6_expo_gain_ctrl_0_int_out,
   input          gpio_6_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_6_fn_sel,
   input          gpio_6_gpio_oe_out,
   input          gpio_6_gpio_out,
   input          gpio_6_mipi_tx1_ch1_veff_out,
   input          gpio_6_mipi_tx1_ch3_veff_out,
   input          gpio_6_rx0_a_v_sync_out,
   input          gpio_6_rx0_b_v_sync_out,
   input          gpio_6_rx0_c_v_sync_out,
   input          gpio_6_rx0_d_v_sync_out,
   input          gpio_6_rx0_h_sync_out,
   input          gpio_6_rx1_a_v_sync_out,
   input          gpio_6_rx1_b_v_sync_out,
   input          gpio_6_rx1_c_v_sync_out,
   input          gpio_6_rx1_d_v_sync_out,
   input          gpio_6_rx1_h_sync_out,
   input          gpio_6_ssi_4_out_out,
   input          gpio_7_expo_gain_ctrl_0_int_out,
   input          gpio_7_expo_gain_ctrl_1_int_out,
   input[4:0]     gpio_7_fn_sel,
   input          gpio_7_gpio_oe_out,
   input          gpio_7_gpio_out,
   input          gpio_7_mipi_tx1_ch0_veff_out,
   input          gpio_7_mipi_tx1_ch2_veff_out,
   input          gpio_7_rx0_a_v_sync_out,
   input          gpio_7_rx0_b_v_sync_out,
   input          gpio_7_rx0_c_v_sync_out,
   input          gpio_7_rx0_d_v_sync_out,
   input          gpio_7_rx0_h_sync_out,
   input          gpio_7_rx1_a_v_sync_out,
   input          gpio_7_rx1_b_v_sync_out,
   input          gpio_7_rx1_c_v_sync_out,
   input          gpio_7_rx1_d_v_sync_out,
   input          gpio_7_rx1_h_sync_out,
   input          gpio_7_ssi_4_out_out,
   input[4:0]     i2c0_clk_fn_sel,
   input          i2c0_clk_gpio_oe_out,
   input          i2c0_clk_gpio_out,
   input          i2c0_clk_i2c0_clk_oe_out,
   input          i2c0_clk_i2c0_clk_out,
   input[4:0]     i2c0_dat_fn_sel,
   input          i2c0_dat_gpio_oe_out,
   input          i2c0_dat_gpio_out,
   input          i2c0_dat_i2c0_dat_oe_out,
   input          i2c0_dat_i2c0_dat_out,
   input[4:0]     i2c1_clk_fn_sel,
   input          i2c1_clk_gpio_oe_out,
   input          i2c1_clk_gpio_out,
   input          i2c1_clk_i2c1_clk_oe_out,
   input          i2c1_clk_i2c1_clk_out,
   input[4:0]     i2c1_dat_fn_sel,
   input          i2c1_dat_gpio_oe_out,
   input          i2c1_dat_gpio_out,
   input          i2c1_dat_i2c1_dat_oe_out,
   input          i2c1_dat_i2c1_dat_out,
   input[4:0]     i2c_ap_clk_fn_sel,
   input          i2c_ap_clk_gpio_oe_out,
   input          i2c_ap_clk_gpio_out,
   input          i2c_ap_clk_i2c_boot_clk_oe_out,
   input          i2c_ap_clk_i2c_boot_clk_out,
   input[4:0]     i2c_ap_dat_fn_sel,
   input          i2c_ap_dat_gpio_oe_out,
   input          i2c_ap_dat_gpio_out,
   input          i2c_ap_dat_i2c_boot_dat_oe_out,
   input          i2c_ap_dat_i2c_boot_dat_out,
   input          int_ap_ap_int_out_out,
   input[4:0]     int_ap_fn_sel,
   input          int_ap_gpio_oe_out,
   input          int_ap_gpio_out,
   output         pad_gpio_0_oe,
   output         pad_gpio_0_out,
   output         pad_gpio_1_oe,
   output         pad_gpio_1_out,
   output         pad_gpio_2_oe,
   output         pad_gpio_2_out,
   output         pad_gpio_3_oe,
   output         pad_gpio_3_out,
   output         pad_gpio_4_oe,
   output         pad_gpio_4_out,
   output         pad_gpio_5_oe,
   output         pad_gpio_5_out,
   output         pad_gpio_6_oe,
   output         pad_gpio_6_out,
   output         pad_gpio_7_oe,
   output         pad_gpio_7_out,
   output         pad_i2c0_clk_oe,
   output         pad_i2c0_clk_out,
   output         pad_i2c0_dat_oe,
   output         pad_i2c0_dat_out,
   output         pad_i2c1_clk_oe,
   output         pad_i2c1_clk_out,
   output         pad_i2c1_dat_oe,
   output         pad_i2c1_dat_out,
   output         pad_i2c_ap_clk_oe,
   output         pad_i2c_ap_clk_out,
   output         pad_i2c_ap_dat_oe,
   output         pad_i2c_ap_dat_out,
   output         pad_int_ap_oe,
   output         pad_int_ap_out,
   output         pad_spi0_clk_oe,
   output         pad_spi0_clk_out,
   output         pad_spi0_csn_oe,
   output         pad_spi0_csn_out,
   output         pad_spi0_di_oe,
   output         pad_spi0_di_out,
   output         pad_spi0_do_oe,
   output         pad_spi0_do_out,
   output         pad_spi1_clk_oe,
   output         pad_spi1_clk_out,
   output         pad_spi1_csn_oe,
   output         pad_spi1_csn_out,
   output         pad_spi1_di_oe,
   output         pad_spi1_di_out,
   output         pad_spi1_do_oe,
   output         pad_spi1_do_out,
   output         pad_tdi_oe,
   output         pad_tdi_out,
   output         pad_tdo_oe,
   output         pad_tdo_out,
   input[4:0]     spi0_clk_fn_sel,
   input          spi0_clk_gpio_oe_out,
   input          spi0_clk_gpio_out,
   input          spi0_clk_spi_ap_clk_oe_out,
   input          spi0_clk_spi_ap_clk_out,
   input[4:0]     spi0_csn_fn_sel,
   input          spi0_csn_gpio_oe_out,
   input          spi0_csn_gpio_out,
   input          spi0_csn_spi_ap_csn_oe_out,
   input          spi0_csn_spi_ap_csn_out,
   input[4:0]     spi0_di_fn_sel,
   input          spi0_di_gpio_oe_out,
   input          spi0_di_gpio_out,
   input          spi0_di_spi_ap_di_oe_out,
   input          spi0_di_spi_ap_di_out,
   input[4:0]     spi0_do_fn_sel,
   input          spi0_do_gpio_oe_out,
   input          spi0_do_gpio_out,
   input          spi0_do_spi_ap_do_oe_out,
   input          spi0_do_spi_ap_do_out,
   input[4:0]     spi1_clk_fn_sel,
   input          spi1_clk_gpio_oe_out,
   input          spi1_clk_gpio_out,
   input          spi1_clk_spi_nor_clk_oe_out,
   input          spi1_clk_spi_nor_clk_out,
   input[4:0]     spi1_csn_fn_sel,
   input          spi1_csn_gpio_oe_out,
   input          spi1_csn_gpio_out,
   input          spi1_csn_spi_nor_csn_oe_out,
   input          spi1_csn_spi_nor_csn_out,
   input[4:0]     spi1_di_fn_sel,
   input          spi1_di_gpio_oe_out,
   input          spi1_di_gpio_out,
   input          spi1_di_spi_nor_di_oe_out,
   input          spi1_di_spi_nor_di_out,
   input[4:0]     spi1_do_fn_sel,
   input          spi1_do_gpio_oe_out,
   input          spi1_do_gpio_out,
   input          spi1_do_spi_nor_do_oe_out,
   input          spi1_do_spi_nor_do_out,
   input[4:0]     tdi_fn_sel,
   input          tdi_gpio_oe_out,
   input          tdi_gpio_out,
   input          tdo_cpu_jtag_tdo_oe_out,
   input          tdo_cpu_jtag_tdo_out,
   input[4:0]     tdo_fn_sel,
   input          tdo_gpio_oe_out,
   input          tdo_gpio_out,
   output         gpio_mux_out_dumy // only for Perl process easily, please output floating it
);
assign gpio_mux_out_dumy = 1'b0;


assign	pad_spi0_csn_out	=
		(spi0_csn_fn_sel == 0) ?	spi0_csn_gpio_out: // cadence map_to_mux
		(spi0_csn_fn_sel == 1) ?	spi0_csn_spi_ap_csn_out:
		1'b0;

assign	pad_spi0_csn_oe	=
		(spi0_csn_fn_sel == 0) ?	spi0_csn_gpio_oe_out: // cadence map_to_mux
		(spi0_csn_fn_sel == 1) ?	spi0_csn_spi_ap_csn_oe_out:
		1'b0;

assign	pad_spi0_clk_out	=
		(spi0_clk_fn_sel == 0) ?	spi0_clk_gpio_out: // cadence map_to_mux
		(spi0_clk_fn_sel == 1) ?	spi0_clk_spi_ap_clk_out:
		1'b0;

assign	pad_spi0_clk_oe	=
		(spi0_clk_fn_sel == 0) ?	spi0_clk_gpio_oe_out: // cadence map_to_mux
		(spi0_clk_fn_sel == 1) ?	spi0_clk_spi_ap_clk_oe_out:
		1'b0;

assign	pad_spi0_do_out	=
		(spi0_do_fn_sel == 0) ?	spi0_do_gpio_out: // cadence map_to_mux
		(spi0_do_fn_sel == 1) ?	spi0_do_spi_ap_do_out:
		1'b0;

assign	pad_spi0_do_oe	=
		(spi0_do_fn_sel == 0) ?	spi0_do_gpio_oe_out: // cadence map_to_mux
		(spi0_do_fn_sel == 1) ?	spi0_do_spi_ap_do_oe_out:
		1'b0;

assign	pad_spi0_di_out	=
		(spi0_di_fn_sel == 0) ?	spi0_di_gpio_out: // cadence map_to_mux
		(spi0_di_fn_sel == 1) ?	spi0_di_spi_ap_di_out:
		1'b0;

assign	pad_spi0_di_oe	=
		(spi0_di_fn_sel == 0) ?	spi0_di_gpio_oe_out: // cadence map_to_mux
		(spi0_di_fn_sel == 1) ?	spi0_di_spi_ap_di_oe_out:
		1'b0;

assign	pad_spi1_csn_out	=
		(spi1_csn_fn_sel == 0) ?	spi1_csn_gpio_out: // cadence map_to_mux
		(spi1_csn_fn_sel == 2) ?	spi1_csn_spi_nor_csn_out:
		1'b0;

assign	pad_spi1_csn_oe	=
		(spi1_csn_fn_sel == 0) ?	spi1_csn_gpio_oe_out: // cadence map_to_mux
		(spi1_csn_fn_sel == 2) ?	spi1_csn_spi_nor_csn_oe_out:
		1'b0;

assign	pad_spi1_clk_out	=
		(spi1_clk_fn_sel == 0) ?	spi1_clk_gpio_out: // cadence map_to_mux
		(spi1_clk_fn_sel == 2) ?	spi1_clk_spi_nor_clk_out:
		1'b0;

assign	pad_spi1_clk_oe	=
		(spi1_clk_fn_sel == 0) ?	spi1_clk_gpio_oe_out: // cadence map_to_mux
		(spi1_clk_fn_sel == 2) ?	spi1_clk_spi_nor_clk_oe_out:
		1'b0;

assign	pad_spi1_do_out	=
		(spi1_do_fn_sel == 0) ?	spi1_do_gpio_out: // cadence map_to_mux
		(spi1_do_fn_sel == 2) ?	spi1_do_spi_nor_do_out:
		1'b0;

assign	pad_spi1_do_oe	=
		(spi1_do_fn_sel == 0) ?	spi1_do_gpio_oe_out: // cadence map_to_mux
		(spi1_do_fn_sel == 2) ?	spi1_do_spi_nor_do_oe_out:
		1'b0;

assign	pad_spi1_di_out	=
		(spi1_di_fn_sel == 0) ?	spi1_di_gpio_out: // cadence map_to_mux
		(spi1_di_fn_sel == 2) ?	spi1_di_spi_nor_di_out:
		1'b0;

assign	pad_spi1_di_oe	=
		(spi1_di_fn_sel == 0) ?	spi1_di_gpio_oe_out: // cadence map_to_mux
		(spi1_di_fn_sel == 2) ?	spi1_di_spi_nor_di_oe_out:
		1'b0;

assign	pad_i2c_ap_clk_out	=
		(i2c_ap_clk_fn_sel == 0) ?	i2c_ap_clk_gpio_out: // cadence map_to_mux
		(i2c_ap_clk_fn_sel == 1) ?	i2c_ap_clk_i2c_boot_clk_out:
		1'b0;

assign	pad_i2c_ap_clk_oe	=
		(i2c_ap_clk_fn_sel == 0) ?	i2c_ap_clk_gpio_oe_out: // cadence map_to_mux
		(i2c_ap_clk_fn_sel == 1) ?	i2c_ap_clk_i2c_boot_clk_oe_out:
		1'b0;

assign	pad_i2c_ap_dat_out	=
		(i2c_ap_dat_fn_sel == 0) ?	i2c_ap_dat_gpio_out: // cadence map_to_mux
		(i2c_ap_dat_fn_sel == 1) ?	i2c_ap_dat_i2c_boot_dat_out:
		1'b0;

assign	pad_i2c_ap_dat_oe	=
		(i2c_ap_dat_fn_sel == 0) ?	i2c_ap_dat_gpio_oe_out: // cadence map_to_mux
		(i2c_ap_dat_fn_sel == 1) ?	i2c_ap_dat_i2c_boot_dat_oe_out:
		1'b0;

assign	pad_i2c0_clk_out	=
		(i2c0_clk_fn_sel == 0) ?	i2c0_clk_gpio_out: // cadence map_to_mux
		(i2c0_clk_fn_sel == 2) ?	i2c0_clk_i2c0_clk_out:
		1'b0;

assign	pad_i2c0_clk_oe	=
		(i2c0_clk_fn_sel == 0) ?	i2c0_clk_gpio_oe_out: // cadence map_to_mux
		(i2c0_clk_fn_sel == 2) ?	i2c0_clk_i2c0_clk_oe_out:
		1'b0;

assign	pad_i2c0_dat_out	=
		(i2c0_dat_fn_sel == 0) ?	i2c0_dat_gpio_out: // cadence map_to_mux
		(i2c0_dat_fn_sel == 2) ?	i2c0_dat_i2c0_dat_out:
		1'b0;

assign	pad_i2c0_dat_oe	=
		(i2c0_dat_fn_sel == 0) ?	i2c0_dat_gpio_oe_out: // cadence map_to_mux
		(i2c0_dat_fn_sel == 2) ?	i2c0_dat_i2c0_dat_oe_out:
		1'b0;

assign	pad_i2c1_clk_out	=
		(i2c1_clk_fn_sel == 0) ?	i2c1_clk_gpio_out: // cadence map_to_mux
		(i2c1_clk_fn_sel == 3) ?	i2c1_clk_i2c1_clk_out:
		1'b0;

assign	pad_i2c1_clk_oe	=
		(i2c1_clk_fn_sel == 0) ?	i2c1_clk_gpio_oe_out: // cadence map_to_mux
		(i2c1_clk_fn_sel == 3) ?	i2c1_clk_i2c1_clk_oe_out:
		1'b0;

assign	pad_i2c1_dat_out	=
		(i2c1_dat_fn_sel == 0) ?	i2c1_dat_gpio_out: // cadence map_to_mux
		(i2c1_dat_fn_sel == 3) ?	i2c1_dat_i2c1_dat_out:
		1'b0;

assign	pad_i2c1_dat_oe	=
		(i2c1_dat_fn_sel == 0) ?	i2c1_dat_gpio_oe_out: // cadence map_to_mux
		(i2c1_dat_fn_sel == 3) ?	i2c1_dat_i2c1_dat_oe_out:
		1'b0;

assign	pad_gpio_0_out	=
		(gpio_0_fn_sel == 0) ?	gpio_0_gpio_out: // cadence map_to_mux
		(gpio_0_fn_sel == 1) ?	gpio_0_clk_out_0_out:
		(gpio_0_fn_sel == 2) ?	gpio_0_expo_gain_ctrl_0_int_out:
		(gpio_0_fn_sel == 3) ?	gpio_0_expo_gain_ctrl_1_int_out:
		(gpio_0_fn_sel == 6) ?	gpio_0_mipi_tx1_ch0_veff_out:
		(gpio_0_fn_sel == 7) ?	gpio_0_mipi_tx1_ch2_veff_out:
		(gpio_0_fn_sel == 8) ?	gpio_0_rx0_h_sync_out:
		(gpio_0_fn_sel == 9) ?	gpio_0_rx1_h_sync_out:
		(gpio_0_fn_sel == 10) ?	gpio_0_rx0_a_v_sync_out:
		(gpio_0_fn_sel == 11) ?	gpio_0_rx0_b_v_sync_out:
		(gpio_0_fn_sel == 12) ?	gpio_0_rx0_c_v_sync_out:
		(gpio_0_fn_sel == 13) ?	gpio_0_rx0_d_v_sync_out:
		(gpio_0_fn_sel == 14) ?	gpio_0_rx1_a_v_sync_out:
		(gpio_0_fn_sel == 15) ?	gpio_0_rx1_b_v_sync_out:
		(gpio_0_fn_sel == 16) ?	gpio_0_rx1_c_v_sync_out:
		(gpio_0_fn_sel == 17) ?	gpio_0_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_0_oe	=
		(gpio_0_fn_sel == 0) ?	gpio_0_gpio_oe_out: // cadence map_to_mux
		(gpio_0_fn_sel == 1) ?	1:
		(gpio_0_fn_sel == 2) ?	1:
		(gpio_0_fn_sel == 3) ?	1:
		(gpio_0_fn_sel == 6) ?	1:
		(gpio_0_fn_sel == 7) ?	1:
		(gpio_0_fn_sel == 8) ?	1:
		(gpio_0_fn_sel == 9) ?	1:
		(gpio_0_fn_sel == 10) ?	1:
		(gpio_0_fn_sel == 11) ?	1:
		(gpio_0_fn_sel == 12) ?	1:
		(gpio_0_fn_sel == 13) ?	1:
		(gpio_0_fn_sel == 14) ?	1:
		(gpio_0_fn_sel == 15) ?	1:
		(gpio_0_fn_sel == 16) ?	1:
		(gpio_0_fn_sel == 17) ?	1:
		1'b0;

assign	pad_gpio_1_out	=
		(gpio_1_fn_sel == 0) ?	gpio_1_gpio_out: // cadence map_to_mux
		(gpio_1_fn_sel == 1) ?	gpio_1_ssi_4_out_out:
		(gpio_1_fn_sel == 2) ?	gpio_1_expo_gain_ctrl_0_int_out:
		(gpio_1_fn_sel == 3) ?	gpio_1_expo_gain_ctrl_1_int_out:
		(gpio_1_fn_sel == 6) ?	gpio_1_mipi_tx1_ch0_veff_out:
		(gpio_1_fn_sel == 7) ?	gpio_1_mipi_tx1_ch2_veff_out:
		(gpio_1_fn_sel == 8) ?	gpio_1_rx0_h_sync_out:
		(gpio_1_fn_sel == 9) ?	gpio_1_rx1_h_sync_out:
		(gpio_1_fn_sel == 10) ?	gpio_1_rx0_a_v_sync_out:
		(gpio_1_fn_sel == 11) ?	gpio_1_rx0_b_v_sync_out:
		(gpio_1_fn_sel == 12) ?	gpio_1_rx0_c_v_sync_out:
		(gpio_1_fn_sel == 13) ?	gpio_1_rx0_d_v_sync_out:
		(gpio_1_fn_sel == 14) ?	gpio_1_rx1_a_v_sync_out:
		(gpio_1_fn_sel == 15) ?	gpio_1_rx1_b_v_sync_out:
		(gpio_1_fn_sel == 16) ?	gpio_1_rx1_c_v_sync_out:
		(gpio_1_fn_sel == 17) ?	gpio_1_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_1_oe	=
		(gpio_1_fn_sel == 0) ?	gpio_1_gpio_oe_out: // cadence map_to_mux
		(gpio_1_fn_sel == 1) ?	1:
		(gpio_1_fn_sel == 2) ?	1:
		(gpio_1_fn_sel == 3) ?	1:
		(gpio_1_fn_sel == 6) ?	1:
		(gpio_1_fn_sel == 7) ?	1:
		(gpio_1_fn_sel == 8) ?	1:
		(gpio_1_fn_sel == 9) ?	1:
		(gpio_1_fn_sel == 10) ?	1:
		(gpio_1_fn_sel == 11) ?	1:
		(gpio_1_fn_sel == 12) ?	1:
		(gpio_1_fn_sel == 13) ?	1:
		(gpio_1_fn_sel == 14) ?	1:
		(gpio_1_fn_sel == 15) ?	1:
		(gpio_1_fn_sel == 16) ?	1:
		(gpio_1_fn_sel == 17) ?	1:
		1'b0;

assign	pad_gpio_2_out	=
		(gpio_2_fn_sel == 0) ?	gpio_2_gpio_out: // cadence map_to_mux
		(gpio_2_fn_sel == 1) ?	gpio_2_ssi_3_out_out:
		(gpio_2_fn_sel == 2) ?	gpio_2_expo_gain_ctrl_0_int_out:
		(gpio_2_fn_sel == 3) ?	gpio_2_expo_gain_ctrl_1_int_out:
		(gpio_2_fn_sel == 6) ?	gpio_2_mipi_tx1_ch0_veff_out:
		(gpio_2_fn_sel == 7) ?	gpio_2_mipi_tx1_ch2_veff_out:
		(gpio_2_fn_sel == 8) ?	gpio_2_rx0_h_sync_out:
		(gpio_2_fn_sel == 9) ?	gpio_2_rx1_h_sync_out:
		(gpio_2_fn_sel == 10) ?	gpio_2_rx0_a_v_sync_out:
		(gpio_2_fn_sel == 11) ?	gpio_2_rx0_b_v_sync_out:
		(gpio_2_fn_sel == 12) ?	gpio_2_rx0_c_v_sync_out:
		(gpio_2_fn_sel == 13) ?	gpio_2_rx0_d_v_sync_out:
		(gpio_2_fn_sel == 14) ?	gpio_2_rx1_a_v_sync_out:
		(gpio_2_fn_sel == 15) ?	gpio_2_rx1_b_v_sync_out:
		(gpio_2_fn_sel == 16) ?	gpio_2_rx1_c_v_sync_out:
		(gpio_2_fn_sel == 17) ?	gpio_2_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_2_oe	=
		(gpio_2_fn_sel == 0) ?	gpio_2_gpio_oe_out: // cadence map_to_mux
		(gpio_2_fn_sel == 1) ?	1:
		(gpio_2_fn_sel == 2) ?	1:
		(gpio_2_fn_sel == 3) ?	1:
		(gpio_2_fn_sel == 6) ?	1:
		(gpio_2_fn_sel == 7) ?	1:
		(gpio_2_fn_sel == 8) ?	1:
		(gpio_2_fn_sel == 9) ?	1:
		(gpio_2_fn_sel == 10) ?	1:
		(gpio_2_fn_sel == 11) ?	1:
		(gpio_2_fn_sel == 12) ?	1:
		(gpio_2_fn_sel == 13) ?	1:
		(gpio_2_fn_sel == 14) ?	1:
		(gpio_2_fn_sel == 15) ?	1:
		(gpio_2_fn_sel == 16) ?	1:
		(gpio_2_fn_sel == 17) ?	1:
		1'b0;

assign	pad_gpio_3_out	=
		(gpio_3_fn_sel == 0) ?	gpio_3_gpio_out: // cadence map_to_mux
		(gpio_3_fn_sel == 1) ?	gpio_3_ssi_3_out_out:
		(gpio_3_fn_sel == 2) ?	gpio_3_expo_gain_ctrl_0_int_out:
		(gpio_3_fn_sel == 3) ?	gpio_3_expo_gain_ctrl_1_int_out:
		(gpio_3_fn_sel == 6) ?	gpio_3_mipi_tx1_ch1_veff_out:
		(gpio_3_fn_sel == 7) ?	gpio_3_mipi_tx1_ch3_veff_out:
		(gpio_3_fn_sel == 8) ?	gpio_3_rx0_h_sync_out:
		(gpio_3_fn_sel == 9) ?	gpio_3_rx1_h_sync_out:
		(gpio_3_fn_sel == 10) ?	gpio_3_rx0_a_v_sync_out:
		(gpio_3_fn_sel == 11) ?	gpio_3_rx0_b_v_sync_out:
		(gpio_3_fn_sel == 12) ?	gpio_3_rx0_c_v_sync_out:
		(gpio_3_fn_sel == 13) ?	gpio_3_rx0_d_v_sync_out:
		(gpio_3_fn_sel == 14) ?	gpio_3_rx1_a_v_sync_out:
		(gpio_3_fn_sel == 15) ?	gpio_3_rx1_b_v_sync_out:
		(gpio_3_fn_sel == 16) ?	gpio_3_rx1_c_v_sync_out:
		(gpio_3_fn_sel == 17) ?	gpio_3_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_3_oe	=
		(gpio_3_fn_sel == 0) ?	gpio_3_gpio_oe_out: // cadence map_to_mux
		(gpio_3_fn_sel == 1) ?	1:
		(gpio_3_fn_sel == 2) ?	1:
		(gpio_3_fn_sel == 3) ?	1:
		(gpio_3_fn_sel == 6) ?	1:
		(gpio_3_fn_sel == 7) ?	1:
		(gpio_3_fn_sel == 8) ?	1:
		(gpio_3_fn_sel == 9) ?	1:
		(gpio_3_fn_sel == 10) ?	1:
		(gpio_3_fn_sel == 11) ?	1:
		(gpio_3_fn_sel == 12) ?	1:
		(gpio_3_fn_sel == 13) ?	1:
		(gpio_3_fn_sel == 14) ?	1:
		(gpio_3_fn_sel == 15) ?	1:
		(gpio_3_fn_sel == 16) ?	1:
		(gpio_3_fn_sel == 17) ?	1:
		1'b0;

assign	pad_gpio_4_out	=
		(gpio_4_fn_sel == 0) ?	gpio_4_gpio_out: // cadence map_to_mux
		(gpio_4_fn_sel == 1) ?	gpio_4_ssi_3_out_out:
		(gpio_4_fn_sel == 2) ?	gpio_4_expo_gain_ctrl_0_int_out:
		(gpio_4_fn_sel == 3) ?	gpio_4_expo_gain_ctrl_1_int_out:
		(gpio_4_fn_sel == 6) ?	gpio_4_mipi_tx1_ch1_veff_out:
		(gpio_4_fn_sel == 7) ?	gpio_4_mipi_tx1_ch3_veff_out:
		(gpio_4_fn_sel == 8) ?	gpio_4_rx0_h_sync_out:
		(gpio_4_fn_sel == 9) ?	gpio_4_rx1_h_sync_out:
		(gpio_4_fn_sel == 10) ?	gpio_4_rx0_a_v_sync_out:
		(gpio_4_fn_sel == 11) ?	gpio_4_rx0_b_v_sync_out:
		(gpio_4_fn_sel == 12) ?	gpio_4_rx0_c_v_sync_out:
		(gpio_4_fn_sel == 13) ?	gpio_4_rx0_d_v_sync_out:
		(gpio_4_fn_sel == 14) ?	gpio_4_rx1_a_v_sync_out:
		(gpio_4_fn_sel == 15) ?	gpio_4_rx1_b_v_sync_out:
		(gpio_4_fn_sel == 16) ?	gpio_4_rx1_c_v_sync_out:
		(gpio_4_fn_sel == 17) ?	gpio_4_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_4_oe	=
		(gpio_4_fn_sel == 0) ?	gpio_4_gpio_oe_out: // cadence map_to_mux
		(gpio_4_fn_sel == 1) ?	1:
		(gpio_4_fn_sel == 2) ?	1:
		(gpio_4_fn_sel == 3) ?	1:
		(gpio_4_fn_sel == 6) ?	1:
		(gpio_4_fn_sel == 7) ?	1:
		(gpio_4_fn_sel == 8) ?	1:
		(gpio_4_fn_sel == 9) ?	1:
		(gpio_4_fn_sel == 10) ?	1:
		(gpio_4_fn_sel == 11) ?	1:
		(gpio_4_fn_sel == 12) ?	1:
		(gpio_4_fn_sel == 13) ?	1:
		(gpio_4_fn_sel == 14) ?	1:
		(gpio_4_fn_sel == 15) ?	1:
		(gpio_4_fn_sel == 16) ?	1:
		(gpio_4_fn_sel == 17) ?	1:
		1'b0;

assign	pad_gpio_5_out	=
		(gpio_5_fn_sel == 0) ?	gpio_5_gpio_out: // cadence map_to_mux
		(gpio_5_fn_sel == 1) ?	gpio_5_ssi_4_out_out:
		(gpio_5_fn_sel == 2) ?	gpio_5_expo_gain_ctrl_0_int_out:
		(gpio_5_fn_sel == 3) ?	gpio_5_expo_gain_ctrl_1_int_out:
		(gpio_5_fn_sel == 6) ?	gpio_5_mipi_tx1_ch1_veff_out:
		(gpio_5_fn_sel == 7) ?	gpio_5_mipi_tx1_ch3_veff_out:
		(gpio_5_fn_sel == 8) ?	gpio_5_rx0_h_sync_out:
		(gpio_5_fn_sel == 9) ?	gpio_5_rx1_h_sync_out:
		(gpio_5_fn_sel == 10) ?	gpio_5_rx0_a_v_sync_out:
		(gpio_5_fn_sel == 11) ?	gpio_5_rx0_b_v_sync_out:
		(gpio_5_fn_sel == 12) ?	gpio_5_rx0_c_v_sync_out:
		(gpio_5_fn_sel == 13) ?	gpio_5_rx0_d_v_sync_out:
		(gpio_5_fn_sel == 14) ?	gpio_5_rx1_a_v_sync_out:
		(gpio_5_fn_sel == 15) ?	gpio_5_rx1_b_v_sync_out:
		(gpio_5_fn_sel == 16) ?	gpio_5_rx1_c_v_sync_out:
		(gpio_5_fn_sel == 17) ?	gpio_5_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_5_oe	=
		(gpio_5_fn_sel == 0) ?	gpio_5_gpio_oe_out: // cadence map_to_mux
		(gpio_5_fn_sel == 1) ?	1:
		(gpio_5_fn_sel == 2) ?	1:
		(gpio_5_fn_sel == 3) ?	1:
		(gpio_5_fn_sel == 6) ?	1:
		(gpio_5_fn_sel == 7) ?	1:
		(gpio_5_fn_sel == 8) ?	1:
		(gpio_5_fn_sel == 9) ?	1:
		(gpio_5_fn_sel == 10) ?	1:
		(gpio_5_fn_sel == 11) ?	1:
		(gpio_5_fn_sel == 12) ?	1:
		(gpio_5_fn_sel == 13) ?	1:
		(gpio_5_fn_sel == 14) ?	1:
		(gpio_5_fn_sel == 15) ?	1:
		(gpio_5_fn_sel == 16) ?	1:
		(gpio_5_fn_sel == 17) ?	1:
		1'b0;

assign	pad_gpio_6_out	=
		(gpio_6_fn_sel == 0) ?	gpio_6_gpio_out: // cadence map_to_mux
		(gpio_6_fn_sel == 1) ?	gpio_6_ssi_4_out_out:
		(gpio_6_fn_sel == 2) ?	gpio_6_expo_gain_ctrl_0_int_out:
		(gpio_6_fn_sel == 3) ?	gpio_6_expo_gain_ctrl_1_int_out:
		(gpio_6_fn_sel == 6) ?	gpio_6_mipi_tx1_ch1_veff_out:
		(gpio_6_fn_sel == 7) ?	gpio_6_mipi_tx1_ch3_veff_out:
		(gpio_6_fn_sel == 8) ?	gpio_6_rx0_h_sync_out:
		(gpio_6_fn_sel == 9) ?	gpio_6_rx1_h_sync_out:
		(gpio_6_fn_sel == 10) ?	gpio_6_rx0_a_v_sync_out:
		(gpio_6_fn_sel == 11) ?	gpio_6_rx0_b_v_sync_out:
		(gpio_6_fn_sel == 12) ?	gpio_6_rx0_c_v_sync_out:
		(gpio_6_fn_sel == 13) ?	gpio_6_rx0_d_v_sync_out:
		(gpio_6_fn_sel == 14) ?	gpio_6_rx1_a_v_sync_out:
		(gpio_6_fn_sel == 15) ?	gpio_6_rx1_b_v_sync_out:
		(gpio_6_fn_sel == 16) ?	gpio_6_rx1_c_v_sync_out:
		(gpio_6_fn_sel == 17) ?	gpio_6_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_6_oe	=
		(gpio_6_fn_sel == 0) ?	gpio_6_gpio_oe_out: // cadence map_to_mux
		(gpio_6_fn_sel == 1) ?	1:
		(gpio_6_fn_sel == 2) ?	1:
		(gpio_6_fn_sel == 3) ?	1:
		(gpio_6_fn_sel == 6) ?	1:
		(gpio_6_fn_sel == 7) ?	1:
		(gpio_6_fn_sel == 8) ?	1:
		(gpio_6_fn_sel == 9) ?	1:
		(gpio_6_fn_sel == 10) ?	1:
		(gpio_6_fn_sel == 11) ?	1:
		(gpio_6_fn_sel == 12) ?	1:
		(gpio_6_fn_sel == 13) ?	1:
		(gpio_6_fn_sel == 14) ?	1:
		(gpio_6_fn_sel == 15) ?	1:
		(gpio_6_fn_sel == 16) ?	1:
		(gpio_6_fn_sel == 17) ?	1:
		1'b0;

assign	pad_gpio_7_out	=
		(gpio_7_fn_sel == 0) ?	gpio_7_gpio_out: // cadence map_to_mux
		(gpio_7_fn_sel == 1) ?	gpio_7_ssi_4_out_out:
		(gpio_7_fn_sel == 2) ?	gpio_7_expo_gain_ctrl_0_int_out:
		(gpio_7_fn_sel == 3) ?	gpio_7_expo_gain_ctrl_1_int_out:
		(gpio_7_fn_sel == 6) ?	gpio_7_mipi_tx1_ch0_veff_out:
		(gpio_7_fn_sel == 7) ?	gpio_7_mipi_tx1_ch2_veff_out:
		(gpio_7_fn_sel == 8) ?	gpio_7_rx0_h_sync_out:
		(gpio_7_fn_sel == 9) ?	gpio_7_rx1_h_sync_out:
		(gpio_7_fn_sel == 10) ?	gpio_7_rx0_a_v_sync_out:
		(gpio_7_fn_sel == 11) ?	gpio_7_rx0_b_v_sync_out:
		(gpio_7_fn_sel == 12) ?	gpio_7_rx0_c_v_sync_out:
		(gpio_7_fn_sel == 13) ?	gpio_7_rx0_d_v_sync_out:
		(gpio_7_fn_sel == 14) ?	gpio_7_rx1_a_v_sync_out:
		(gpio_7_fn_sel == 15) ?	gpio_7_rx1_b_v_sync_out:
		(gpio_7_fn_sel == 16) ?	gpio_7_rx1_c_v_sync_out:
		(gpio_7_fn_sel == 17) ?	gpio_7_rx1_d_v_sync_out:
		1'b0;

assign	pad_gpio_7_oe	=
		(gpio_7_fn_sel == 0) ?	gpio_7_gpio_oe_out: // cadence map_to_mux
		(gpio_7_fn_sel == 1) ?	1:
		(gpio_7_fn_sel == 2) ?	1:
		(gpio_7_fn_sel == 3) ?	1:
		(gpio_7_fn_sel == 6) ?	1:
		(gpio_7_fn_sel == 7) ?	1:
		(gpio_7_fn_sel == 8) ?	1:
		(gpio_7_fn_sel == 9) ?	1:
		(gpio_7_fn_sel == 10) ?	1:
		(gpio_7_fn_sel == 11) ?	1:
		(gpio_7_fn_sel == 12) ?	1:
		(gpio_7_fn_sel == 13) ?	1:
		(gpio_7_fn_sel == 14) ?	1:
		(gpio_7_fn_sel == 15) ?	1:
		(gpio_7_fn_sel == 16) ?	1:
		(gpio_7_fn_sel == 17) ?	1:
		1'b0;

assign	pad_tdi_out	=
		(tdi_fn_sel == 0) ?	tdi_gpio_out: // cadence map_to_mux
		1'b0;

assign	pad_tdi_oe	=
		(tdi_fn_sel == 0) ?	tdi_gpio_oe_out: // cadence map_to_mux
		1'b0;

assign	pad_tdo_out	=
		(tdo_fn_sel == 0) ?	tdo_gpio_out: // cadence map_to_mux
		(tdo_fn_sel == 1) ?	tdo_cpu_jtag_tdo_out:
		1'b0;

assign	pad_tdo_oe	=
		(tdo_fn_sel == 0) ?	tdo_gpio_oe_out: // cadence map_to_mux
		(tdo_fn_sel == 1) ?	tdo_cpu_jtag_tdo_oe_out:
		1'b0;

assign	pad_int_ap_out	=
		(int_ap_fn_sel == 0) ?	int_ap_gpio_out: // cadence map_to_mux
		(int_ap_fn_sel == 1) ?	int_ap_ap_int_out_out:
		1'b0;

assign	pad_int_ap_oe	=
		(int_ap_fn_sel == 0) ?	int_ap_gpio_oe_out: // cadence map_to_mux
		(int_ap_fn_sel == 1) ?	1:
		1'b0;

endmodule
