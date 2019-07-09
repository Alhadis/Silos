// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Feb 19 13:47:52 2019
// Host        : zkq-Precision-3630-Tower running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/zkq/Xilinx/svd_rtl/svd_rtl.srcs/sources_1/ip/c_shift_ram_0/c_shift_ram_0_sim_netlist.v
// Design      : c_shift_ram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu9p-fsgd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_shift_ram_0,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module c_shift_ram_0
   (D,
    CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [0:0]Q;

  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "4" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_shift_ram_0_c_shift_ram_v12_0_12 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "0" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DEPTH = "4" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "0" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "1" *) 
(* C_XDEVICEFAMILY = "virtexuplus" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_shift_ram_0_c_shift_ram_v12_0_12
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [0:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [0:0]Q;

  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "4" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_shift_ram_0_c_shift_ram_v12_0_12_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
        .CLK(CLK),
        .D(D),
        .Q(Q),
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
R80NnScBgIZD14acGTeYZyZzlDoMDRJH97QvrM1z3/BPxjYOI5xO+RmLRE3ogivikKxeQqDB3hYo
CtT6MXJE8w==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pzFf5UkhQCihEthT9/vXIu9qyyEco3ugn72RSG7p68vod9TXq7nS9azLrnGkzXHs3PQFBkq+3+ZG
PNN41vDN58/lK8pIjiAlp2V0xXr8ZRf/QoS3nU9pnZ3CEwxt9CGwUMks2MBnm+VSjWWRxbkUaTxZ
+kjzVWvQpUuyFFsOEs8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xDcafb3KrEW7vk1Eyiww/9CKbzlKF9C0uKrVBz5bHy5+6GMNsnwfCSkgxU14+VriR3jhdDN7viwB
M3a2pKPouTEOz066rknyw5X/sQ4hniBD3iUl4NQWkHTGym3kv31ZUeZYdl5ODPvzfUJOWUvkAXp/
gf4rtgV5FBbGm8qJS4jxuFSsv4rhcb7t+cae5sULvX9h7Uh0lEoAlNX3YmEW0fWj4bhIgTdzT2gk
C1ytdGU/UAnitwmujc/k+32KWV0i/o3dHRhIc31iawLLSmuBJYefDEaLG6KE8nGHeuho45Se0dhe
7kIaZp4SW1wGf7C0xxqwh1cgZ7+6eWgYBqVY1g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OrzITnToGC+ryHZVkpDHCj6CgE4vEVrPZ7Z829783FsE2zjugDCdpipuFZ7ikbeX4Bc52TEJ4mFm
0OxylPcCXPIE74pJ186gBXkmldW4bGFMhTmUHJ94bRAsyJjr329fm+j77y2NmfbHMVOsljahWWK4
OMppytgOrZcnsnsORsbXvvikZALiCB2t+Qc4RdHc3/98o+DDvRf+gwTZNX0GMOitJmVVvqxqw6No
K3aHL26WS+5291/TUz7aF7ySSp+k84h+0omwPrcy0Xc3URWaoYbqLrWiEi22RgQYitI1tEsa+afh
tv3h9WNr+65gWTbdbwWyOz1NeXJSaNV/mc+/Lg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
riYGAyaVfIXieMgcJVFsucQ9kUNBkyzgx5CLlDibSmqSJjCaDvK63ymwoZpsGDT9Rugub8H1Y8xX
XUpLlzZGCXrlWs6NgjXfNxVpLlkmz7GswYkQ6KhUkZhRuPh0HrpJPt1ne+1pTM6fzi5LXsyTv6sn
TisWpJPdsnmBDHgM6jupb4Iv3OG7/q/NPck9K59oFLN+AyKeQ/8pEy2j7xpMiFTRlE1OTJj2mjHF
yWQWyURMafr1KK5t9Wu7YuocfKiTo0f6okHNafEo/nNpObW1D/liUJlS5GVguNNbnFjSuun9SM4T
MXhUoU0rVPqSkeCGnTpMMYK0MY5IwmbyZXn/fQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
HyAIbEI1uxEAA90t6+VWFTmyUje1JDZQZoMv6A5VyFWA8tJ80b/Pwhc93aHby8xZos0WjlEANrxF
3hJ/l8XJYMVZWlVytBIRAZYGbhnMBOGo/5sjE6O2Ap0308iwfA50rb1ZITdKRqNiW+PlWkaGC+3R
QMUfNUa7cSm841V7mmc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GUEL70ZQ78wO25wq2V+5JNZcUKzj485nYHAlIxulC+dFYZ1T3bS7X0juNGn/cdIyRbeWgA5z1viA
KyiSR064Z0BmWFsIYHfLEP1CENE6B/DkEgUM//4pBnGxH0CUe8wWHQBcyJQAxQHemECYQ5/QfTqT
96OTv0jwZ8yRjX1vKXS1qZKREGwNAsV3Kgrd9M5oaNz3PuISlyOOLoxPx9Qvu0Z0QYAzZbksLAI6
oekHTbR7CXs/P7+GCnbyf0lD6RFUyKASz8PAAvPi/+knG0A5BGQv9W8rEQ1GlCyJMbWqS7UMYIM5
Aany0Gd6zUtHqzCJMTpR0Gv6o8IS9bMCD8CICQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q0MoSuv0cW/at15G7W4h5TarnkLBcHOqb0xCeEW8IoRGjnF36t86vW5ddqXMd9dFeN+m93edXXOd
jOkjML+jEXeYxAJyayBgXg08Gzu+iYN0h3aECh9/JP3mKr9X8jT/YttVsWhoIWMtfIobY66Qo9gl
occzS/rGqsGXQVSYnhEMWlNuw9R6T3pX9E7Mc1IlwVqhFnkZMWq6cF9DdGooRRrxYKOpv7ZBUJ+j
+PdHTRwxbIioewF0a8DbUuzuEnBmFpzofYJkO42FPyQPW0PQy0MyHQlC5P4lFLHsdLLm/nroIvGx
W4OMsfSALVHMYz2XnBK1sNTydHRRozDWcF0csw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TNpDwy+Dw7O9abVz0sJwhQayUgi+Qrkl7Qqx8i/QnCg/UoSXFXSOz5JtIn2E66vpJjossgZF5V99
Spq8I0/MDlxAAL1AA0yx/wV4eXr+9n4jiqJwfguDtKw1sF4hzDvVXQE+rbSqwBfbdFmLYiXx3GNI
wqGUZy7gOPMo6kYQIex18ndWbdLOQJZc3w7uaTzA0C11vFroE4aY6tAIlZCySiPXs3USrwF1sQSe
4cchsc0xMhcsSoYAbSnajSiW4VXeQmQe/5znMvgDwYDsob9260qFeX5RTCSpt8WSwWs1hVUbcAdY
pjVSMDLNn5IEqazldKS9H8Yame75aPsDX05VmA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4512)
`pragma protect data_block
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
AUgMiCrHK0Nl
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
