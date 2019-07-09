// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Tue Apr 04 19:20:21 2017
// Host        : Inator running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/jduarte/Documents/GitHub/CR/Aula6/ex3/ex3.srcs/sources_1/bd/ex3_top/ip/ex3_top_c_addsub_0_0/ex3_top_c_addsub_0_0_sim_netlist.v
// Design      : ex3_top_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ex3_top_c_addsub_0_0,c_addsub_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_10,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module ex3_top_c_addsub_0_0
   (A,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [3:0]S;

  wire [3:0]A;
  wire [3:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "4" *) 
  (* c_add_mode = "1" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "1" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000" *) 
  (* c_b_width = "4" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "4" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  ex3_top_c_addsub_0_0_c_addsub_v12_0_10 U0
       (.A(A),
        .ADD(1'b1),
        .B({1'b0,1'b0,1'b0,1'b0}),
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

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "4" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "1" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000" *) 
(* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "4" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_10" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module ex3_top_c_addsub_0_0_c_addsub_v12_0_10
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
  input [3:0]A;
  input [3:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [3:0]S;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]S;
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
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "4" *) 
  (* c_add_mode = "1" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "1" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000" *) 
  (* c_b_width = "4" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "4" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  ex3_top_c_addsub_0_0_c_addsub_v12_0_10_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B({1'b0,1'b0,1'b0,1'b0}),
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
fgcHMpDB8YeTXYpoTsmWZ+EpGtmp4ttE4rhLnGC39GZlQ/zJoTz5jsPoaLlJ4UWaOu8wsqCjidiH
ybd7UHh7Iw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Ce9yJwkNvACWlmAFVwVRYhOdCIZZzBisSiZXBvx+NUYf+lxZv1vyZmKRIRYhYQFaRqRT7XkpC1Ec
t+dZjN7MGpN15tip1+lCNk6nbQTIhD1RPmDELP6pl456iOpiQ/ZN6oyRQX4m6uADI4VCap54SPA7
xDAZ2Ihv8VRQzQqKu2s=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
yzmtZb9/BZ4O/Gzgyl5TFGS/WtQ6cUQXqy/uOVfW7wlrbPwEqT6tWciKofSv+CyJbJIVPzK8DKFI
WQJqQsaQvwHoiKvvvszZkqgvpH3DwEqS4ynnWHOJwHB19GcoOlPWiy5xKdCVGPEiN2a3E1iFT033
EH5wjBAeJPtvdeyOkLI=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CczA2H+PI5anFc9KY7UKsIXFVNBdxrwuLyvm1R1kZm0IbddJ4LwKIbI7KyLLLLbAYBBP7wxcLmqe
F9t3HL4MVpwq4k/EpCH4FZDSvMDxPR4bzVAo6o1yJxQXLW3+NZAmPCzXZqtSSPYLsiDU+W9GQY7+
1HWJeXGRV4YcEBFMrw/6x47O9rznZwcpvN7ClnZOjFMV6qkda3BftQcnNwgtp2N+BsKgboXbAHKV
zExUhY74xU/ifF/nfy2HapVTvKKx6cjozDkWbYKX6BcnoM4cdYRte+0OO03Cf6J1WNNEdLgK4TLC
xfJwAliutWUOQcBc87pWvMgPIGLJ8vlUAFdzRw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XUGyGZ3f6ddj79v8VJz6tFeEU1K7Q7eXpxBZjIxiM9EM6yeIzUyNcfTtjPmDnlZ+RUHPbdJfKXo/
vqrH8/IP17g81z0rmYCYrrLWAiXXZVnF33Sby5XqXm99P3kbjtJRUqQHubpP9lxi/BwNEM2b+PmB
MKEcRy3QhkDyijUSVDevumkng5ROIwALCPIoFsnDOvu87+q48wG4+JVioc576FSFqZ3zKH+xln5a
0tGbwFbo8dlg6OZgf95UN2jhgacGA/kl7qJB8Iq/75yAi5qhWYQjCPA9zQ2g0VZuIoCqrY5Pz1/d
5FX25JIJkfhGP0833RpKbY6Iszo7lIM1Sha3sw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sY1OhSYlEri9JAkBv9M84SAJcAs2KDpaHeB2dfqS3s74ysd3frt6CyyFk6hNda0+culDUsAjRUVs
x11BMQ4Oo7lonjFlIt6y+8rL2UDn4GB+aEZFgEeAaV6hVtqs+l5mrUc4tqz0ovbu6bKxjVkhrpr9
3LZPe0AWv46dj3Mj7RdMEOaFBpgrDS7uox/mmIiEy3WXfqMlwahcqdRCOkGRbxZDtQPSXfHTdMia
rbflvAE/8GSkcXysduuffU6QTMADbxxBxy1skDfog0aCf/7pXE/cMgAqJn0d/nI9LN6/w/OjZCaV
itzFnyqX9yNrnz11rwDQtSNe9wLD5gUpgOeQrQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
fAV1VwJETb+Zb37NZPqaxlkcIFlXybxZd5gDXAbYLGEWkUbOjjhn/woqrHgnacJ6unYc8ts499C/
BxYuLotOo4Bc7Dkp3FH5m1ERUiG1F20av6bs5v6blSzfyHQqojoGIHXeoG81iuXdpc5NfM+n4cin
QZU7GLSH5qlsyqocjNGf2BHD6L1XXl0RyGdout6qd7mBTL08lrDVloPMwLNJMRRNcac9epdXffpa
QxfUfWCeMFXUcza6eaPijq+WoaKfuv29/dDOjiZVU7JifyVraBLxgKcOI/BlZ5hszm17nHdfedRA
x/JD46JjDJoOcxEwWTj9Jb8VL9VU5zDQYIelOQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
Wg+eLL3mXIFSBg/YmbnyjXkGVrIIT+B84kUgLhdU3DIskOzGpAerCjib+QOavo6zRIxINmIkKmYX
l1aFeSIDdjHn0QknnfP1l5e59+D4cHWdgtKZO9fa4CQ9dvnHUet53DYufbk342D4mRvAikORPdYb
jITPEJOmfL0kj/wDvDW3sZ4seQvNoaFB2rTrSuB/QYr4WW+N1iXC4dD0AzWsRqIbNbTvEgtPMrI4
vfKgQ5lwiRI9Q5E3zXwIxcCTBz+BnH/XKtPEPQcNaMsnd4fATofevFdsE6cEMamy3116eyLdmWd1
iLJWtzNqPSwryu4yFqIj3nPgr53jtk2q7zLfkg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 3664)
`pragma protect data_block
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
e96AqVOurRXn3b4YplZQhA==
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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
