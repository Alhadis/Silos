// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Tue Apr 04 19:53:14 2017
// Host        : Inator running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top ex3_top_c_addsub_0_0 -prefix
//               ex3_top_c_addsub_0_0_ ex3_top_c_addsub_0_0_sim_netlist.v
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
  (* c_b_value = "0010" *) 
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
(* C_B_CONSTANT = "1" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0010" *) 
(* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "4" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
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
  (* c_b_value = "0010" *) 
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
cUxETHjLOGsnRsY/coDInxbZcUgeDkd+YSu4umvIK2gNFxmzESYd9lBK+5pJZ5Q8HzYTYghFLRgL
NfCmLZlZNEcCspzuwSh3ziG+9GOswiA6yJ28PMgVW8tD8eqUyBoetPN0mBDdnAZC1I5IILNtRnFQ
a09ezRkxeWxR1DFO5nZW4BkrJpX4iBw7QEclObZSmOlFW97HPwYurymeP6bZ8PkypwoqYNZmWc8d
DpdAmwPwIv1oNfK0WtMTpyTtRpTrXL03pylx90UTID0qpZI/FF2WRyPiLqAaRDz8MeJ/02iimGgq
mFSAP8U4TOf260QcfADsGHjpClREdkLR1Gm7Ng==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
pcvhctNtndTwwR06v+2gOH8bqhmp2Jyj3Hvt1GhdKsyzv1mQ8ZdEooH4QvegUeOzUS0+V9UK+YaY
VYZPPE2JgVPIScWy91uYe84yYCtcBb5rouxg1kL5kQ0YeuzjikDUHlnnlhlA4AvF/6OXYMUjGyEw
e+PrBN3RgjaazJfrs0sSRYHBAZlz7uD4BW1qticgpGSLypRgPDmr7ZOFB6r3UPtZjfsiE6VvPthH
LDFiyPYmmCPb7eY7VKxavopkw/8X4bcvxuP5EylQTBV0DUVRzChhlfI8Q/w1HAAj5G2/FBa0M3hw
gAnFeKOtHSWXpxoxYaj4zY9M1HkuPuuCn/SFnw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 3296)
`pragma protect data_block
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
et3xje6Y/BFRkVQ0xUp5BSo=
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
