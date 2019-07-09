// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Mon Jan 21 15:54:33 2019
// Host        : zkq-Precision-3630-Tower running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/zkq/Xilinx/svd_rtl/svd_rtl.srcs/sources_1/ip/mult_gen_1/mult_gen_1_sim_netlist.v
// Design      : mult_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu9p-fsgd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_1,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mult_gen_1
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [26:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [26:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [26:0]P;

  wire [26:0]A;
  wire [26:0]B;
  wire CLK;
  wire [26:0]P;
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
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "51" *) 
  (* C_OUT_LOW = "25" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_1_mult_gen_v12_0_14 U0
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
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "51" *) 
(* C_OUT_LOW = "25" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtexuplus" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_1_mult_gen_v12_0_14
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
  output [26:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [26:0]A;
  wire [26:0]B;
  wire CLK;
  wire [26:0]P;
  wire [47:0]PCASC;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

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
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "51" *) 
  (* C_OUT_LOW = "25" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_1_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
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
CaWa25Yw3FlJSmrl2py2j2Exi4eyg9uKk4ZMFCvkVgUkjaMHhF3tI60Qd9Xnaulx+unoZIUF91Da
mB2UnMfd6TavhlXzEsJuxBf8AiTTAltVLGevTOp+E7eGcLoWjJAOgAULIixTzamWAOOmGGKku0uh
EcgpyOEet1Vmg99jMphqgdMdJ/vc3m4DmUEoHO7wcVq50M7OLIz8shSIioJ89GkuHAzFa61lCmeP
3q5YQ5mWvWGwYz4GvBELOkkUHO+WHeY/DhE3pFpQO8gQpNtNcjk+ivkL8ycFF9BeQXiahAQ2lKhj
/DnwqRrcGLQYrI/XjHYXbVUbmBm2xE49TT2TPg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eaVOI4mqukX2IwFpPXe2uufVU6nwbyaIQU8Vk0hbczwNvE7yQLnyOOKlsBvuBdHj47QswYDhDWeH
neK6E21rjpFoQ/CtUawG7DHf9GsovWvO5th4wFgTTescSpLoVo2HuX7dwvsLIQDH8ZpLK1NnR/Uh
DKIYAQ8M08JyHd3gLn3T5v0Lgi8U9fkPcpIEeQFlBO9V94p2cJ8ECmiamI5y7ADnUg3hibtpiN03
E5FZK/QVNcL/LWVYdaP+hq08L8vypeWaeXP9zgedIMYIGYaVUG97NNv1C6rF741bOWAn7I15I/9X
Lk6xlcY9uS2GERhziDcwJrpRJtlBTHiJgbO5Wg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12336)
`pragma protect data_block
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
2ZKHP59v2njM2RxD52IhAa6oL1D96ID6
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
