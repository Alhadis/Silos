// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Fri Feb  1 15:18:53 2019
// Host        : zkq-Precision-3630-Tower running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/zkq/Xilinx/svd_rtl/svd_rtl.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu9p-fsgd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [26:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [26:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [26:0]A;
  wire [26:0]B;
  wire CLK;
  wire [47:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "27" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "27" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "4" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "64" *) 
  (* C_OUT_LOW = "17" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "27" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "27" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "4" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "64" *) 
(* C_OUT_LOW = "17" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtexuplus" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [26:0]A;
  input [26:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [47:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [26:0]A;
  wire [26:0]B;
  wire CLK;
  wire [36:0]\^P ;
  wire [47:0]PCASC;
  wire [46:36]NLW_i_mult_P_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign P[47] = \^P [36];
  assign P[46] = \^P [36];
  assign P[45] = \^P [36];
  assign P[44] = \^P [36];
  assign P[43] = \^P [36];
  assign P[42] = \^P [36];
  assign P[41] = \^P [36];
  assign P[40] = \^P [36];
  assign P[39] = \^P [36];
  assign P[38] = \^P [36];
  assign P[37] = \^P [36];
  assign P[36:0] = \^P [36:0];
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "27" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "27" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "4" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "64" *) 
  (* C_OUT_LOW = "17" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P({\^P [36],NLW_i_mult_P_UNCONNECTED[46:36],\^P [35:0]}),
        .PCASC(PCASC),
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
g7azmhtm6FcP7uNFjuXJjN8Z6yccOPk3SSjzvKB27peFKmnPmQmov5+YTGwYqqN9LpdyiUExk8K6
vPnJqontvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MFrqn2K0Cr7TmQ5al162oDGiY83d+AkTWOgFyXPYrTNznygR/tx44RAp24ytphNK9p6shs2EFMg/
Qqz0l8DCWiVEoJ/T8vMpnAn7Y+poGVGS1qAR3qE2njrl81VcGBZJeFaWIudhfr/DLTuuf2T/dWDU
YpelM3KbfYNPPiPy8PU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FZca5XZouG+/BYoQ8qrJTmnJanku4IprIWRkO6VciHehE5WehR0wsZJhfKlqLEeY1oTPA4bXaxmY
NjYkrop4EOwW8t47/hj2kFLI1OKUAE/TAhCGg/aNSOViUbB3dUomG/y+TBuDt9L6g0Arj1vb/5Pt
IChc5ZdEfRr1lJMTpFfP+5qmEH6lePPdzgPZATPB4Zrj0P6EyiEsU1FKBuAKd9iYNGiLCxVomaz0
3/RwK2Nl+/l4mc7PJt5Hso+4s1qHb4s2wD+OgbIwdH26ZkEnKVFpaLiuWQKu9uhDLGnsBMPf7XDE
p29f+mrvP9Zi/3nonA2aBKrTwR7XuH+ZYoakxA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jP68OjlYJglq3zpmKrXOhq7Sex8XNW8fQKp4hUNmuw06OOoKhQASNTnjtyVjAIk/VXb64ViBu1ds
cNMJybDSWBhnChfJq4h9PNybShGJXxSm3NDOo5wUHKf10Eti3fSotB9rVks+tNdTEZo4O97kgfdD
G1FNOqlsYcQiShEGLLiEQ2yYtgJBxJ+jc8mFjIEfPhAYy1ElrvtFEpnhkNS2LfE7xdWOQdO/XoKK
ibeY08pgncTI3pvO6TMbXushf0AX2S7hgfk8ysZrT+0gktqFrJnyR6oljS6VVPLtRNW2vo/cC8XQ
Bzvwwt4cpSo5KLS4XxB6qClZipItck2AUEdIbQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o7jAZIoXlFbFtDYmtXhfRBlb07dhBb6Wp03mlT4T0FXtvccSHWhWZgc+VUNwt6TohLihOwvSipPP
XVXpGL4pUVYNdQBCVpFzhMkt6jhyUgsF5t10yI5Of6YEfQrDHigceoBukM3+/zJHPprrPQE6FUvC
wXSGhBCXnHJs1R+n4l0714w8/WftPQhlD9QGQp1qT2VARQXUKBRxcRjxe9TcLfs0P4xnN7uHu0R6
JTmV+MHmhGpetSZGx+B2Wa1MQofUPURqwE70IwBoUhdXH8+39DT5I6x2+wMY6RcVATnhNd2BCgPd
RzAhwfrcqRiU9aB+eNNdFR8ve9M2nGMmV2JxZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Cl1Dz+fZIDYEIQuUd0pSg+5jknmtX/JERd+yOZ2SRaVra/4pU/eCTjEXMzhz4VFGYB6dgUxMsGBk
nL2WNdn/uaSPpi6mNF0UHQvZik4pUkYPrnRbFveVqW8i1t95SG0RW96uD19206lWrp5U1lqc4fH7
sfKHi8ZpU3MAg0DOO0E=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qqp76m2aV9ue8Qai7QUavb+lhRYdu/txrnwYLzwTe0vS0S2OD1vxr8VeIT3bF/ZuXlTGm4S/UCSF
bgOPp7VqEOeGNfsSPK+VpQ+foQMENCQYccwKquBDSg/sLjpPK9uuoGLBLxjw2OwsRzplVFXiPcRN
LYK1/FmCP7RJBNgmhh/ti99a+WSl6i2YIIRGocNplQlG8FXq8ZTTHd/x2Gtdf/zGvJOy/fNsos6S
Oq9yJ0rMmbGeWbri5c04gZM08pUmXBsivgOHm2IVEZZFM4SBqrsi0xa52hs2kelc3iKJcWiTvU3X
0fJP9qNFuIjXBPPZvEYwhVtIh6DwiIC2viSscQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kNBh0R3LltaGSPBeT76BJt8f1dG/syWlFtMPD3EE0mGD9ThOQiz1KGQ8caUy+0fpRk5PWqH5t4XH
QH1toex1tFu+GAGVUgUZtZf3U9pZqP9hJl/jNOmuaydB11G8poYxLBFtPG43BYOPQZ9n34Vh7Zap
orxMoVvZEJAKZiXf44NtTTG5vhu6nL+M3/Khr20aGb5lpzoQJJ/uxcd/MVI23a6L4e4XxlXSqjL2
wR2qxXhHWwVjIhw7Qk5dB8wsncBF8dN9jonH6pQWjEbaZKnmIYMlyV9TfmZtZKIxqG+STLMp9Ueg
VwQ0/dxO4JQUu0quSKTiITFp2URVnhcX9NIxfg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ap+E/02DY3KPH1Wl/GL+2MaqwOW4dM2q7fGTjqdCsA217LKTYlTS2+VCALmxHpG/o0CVe7367Iw2
PyOA1JUgUrhKRCkBjJWkTMbRrZEhQuScdOyL0TvZOnYLFzuY3hLcBBxr+4bExE5g6E5aJlZPg8Fo
ayghbGO1z5oB1Yd7JFbZcSuJdzfrhngQPeii1EFbaTi0g7WTzTnSw5fSl0VbQkBMO4AWJGaozf1h
v98ftc20/8KXI0IIPUinKHRo3o1+YeMsMoHQHIGYyeRt/FBdhLlDTK+LVVGmb2pjCqYpqIS+C86x
jLQj3dx/2ebL4o9g03wTY6j+USdddJzQ0GNtsw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12688)
`pragma protect data_block
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
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
