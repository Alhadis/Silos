// -------------------------------
// gpio mux tool version
// 1) gpo mux: v2.6 // generate GPO mux
// 2) gpi mux: v0.1 // generate GPI mux
// 3) post process tool: v0.1 // fix C-program output bug, and remove redundant ports
// 4) keep mux: v0.0 // add compile directive for synthesis tool to keep mux
// 5) Reg Bank gen: v1.732 // Generate the general register
// 6) RCM generate tool: v20131107 // Generate the .rcm file template
// -------------------------------
module gpio_in_mux(
  input       spi0_csn_in,
  input [4:0] spi0_csn_fn_sel,
  input       spi0_clk_in,
  input [4:0] spi0_clk_fn_sel,
  input       spi0_do_in,
  input [4:0] spi0_do_fn_sel,
  input       spi0_di_in,
  input [4:0] spi0_di_fn_sel,
  input       spi1_csn_in,
  input [4:0] spi1_csn_fn_sel,
  input       spi1_clk_in,
  input [4:0] spi1_clk_fn_sel,
  input       spi1_do_in,
  input [4:0] spi1_do_fn_sel,
  input       spi1_di_in,
  input [4:0] spi1_di_fn_sel,
  input       i2c_ap_clk_in,
  input [4:0] i2c_ap_clk_fn_sel,
  input       i2c_ap_dat_in,
  input [4:0] i2c_ap_dat_fn_sel,
  input       i2c0_clk_in,
  input [4:0] i2c0_clk_fn_sel,
  input       i2c0_dat_in,
  input [4:0] i2c0_dat_fn_sel,
  input       i2c1_clk_in,
  input [4:0] i2c1_clk_fn_sel,
  input       i2c1_dat_in,
  input [4:0] i2c1_dat_fn_sel,
  input       tck_in,
  input [4:0] tck_fn_sel,
  input       tdi_in,
  input [4:0] tdi_fn_sel,
  input       tdo_in,
  input [4:0] tdo_fn_sel,
  output      cpu_jtag_tdi_in_mux,
  output      cpu_jtag_tdo_in_mux,
  output      i2c0_clk_in_mux,
  output      i2c0_dat_in_mux,
  output      i2c1_clk_in_mux,
  output      i2c1_dat_in_mux,
  output      i2c_boot_clk_in_mux,
  output      i2c_boot_dat_in_mux,
  output      spi_ap_clk_in_mux,
  output      spi_ap_csn_in_mux,
  output      spi_ap_di_in_mux,
  output      spi_ap_do_in_mux,
  output      spi_nor_clk_in_mux,
  output      spi_nor_csn_in_mux,
  output      spi_nor_di_in_mux,
  output      spi_nor_do_in_mux,
  output      test_mode_in_mux,
  output      gpio_mux_in_dumy // dumy port, please floating it.
);
assign gpio_mux_in_dumy = 1'b0;

assign  cpu_jtag_tdi_in_mux =
          (tdi_fn_sel == 1) ? tdi_in : // cadence map_to_mux
           1'b0;

assign  cpu_jtag_tdo_in_mux =
          (tdo_fn_sel == 1) ? tdo_in : // cadence map_to_mux
           1'b0;

assign  i2c0_clk_in_mux =
          (i2c0_clk_fn_sel == 2) ? i2c0_clk_in : // cadence map_to_mux
           1'b0;

assign  i2c0_dat_in_mux =
          (i2c0_dat_fn_sel == 2) ? i2c0_dat_in : // cadence map_to_mux
           1'b0;

assign  i2c1_clk_in_mux =
          (i2c1_clk_fn_sel == 3) ? i2c1_clk_in : // cadence map_to_mux
           1'b0;

assign  i2c1_dat_in_mux =
          (i2c1_dat_fn_sel == 3) ? i2c1_dat_in : // cadence map_to_mux
           1'b0;

assign  i2c_boot_clk_in_mux =
          (i2c_ap_clk_fn_sel == 1) ? i2c_ap_clk_in : // cadence map_to_mux
           1'b0;

assign  i2c_boot_dat_in_mux =
          (i2c_ap_dat_fn_sel == 1) ? i2c_ap_dat_in : // cadence map_to_mux
           1'b0;

assign  spi_ap_clk_in_mux =
          (spi0_clk_fn_sel == 1) ? spi0_clk_in : // cadence map_to_mux
           1'b0;

assign  spi_ap_csn_in_mux =
          (spi0_csn_fn_sel == 1) ? spi0_csn_in : // cadence map_to_mux
           1'b0;

assign  spi_ap_di_in_mux =
          (spi0_di_fn_sel == 1) ? spi0_di_in : // cadence map_to_mux
           1'b0;

assign  spi_ap_do_in_mux =
          (spi0_do_fn_sel == 1) ? spi0_do_in : // cadence map_to_mux
           1'b0;

assign  spi_nor_clk_in_mux =
          (spi1_clk_fn_sel == 2) ? spi1_clk_in : // cadence map_to_mux
           1'b0;

assign  spi_nor_csn_in_mux =
          (spi1_csn_fn_sel == 2) ? spi1_csn_in : // cadence map_to_mux
           1'b0;

assign  spi_nor_di_in_mux =
          (spi1_di_fn_sel == 2) ? spi1_di_in : // cadence map_to_mux
           1'b0;

assign  spi_nor_do_in_mux =
          (spi1_do_fn_sel == 2) ? spi1_do_in : // cadence map_to_mux
           1'b0;

assign  test_mode_in_mux =
          (tck_fn_sel == 2) ? tck_in : // cadence map_to_mux
           1'b0;

endmodule
