// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Mon Jan 21 19:19:50 2019
// Host        : zkq-Precision-3630-Tower running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/zkq/Xilinx/svd_rtl/svd_rtl.srcs/sources_1/ip/c_shift_ram_2/c_shift_ram_2_sim_netlist.v
// Design      : c_shift_ram_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu9p-fsgd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_shift_ram_2,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module c_shift_ram_2
   (D,
    CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [16:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [16:0]Q;

  wire CLK;
  wire [16:0]D;
  wire [16:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "11111111111111111111" *) 
  (* c_default_data = "11111111111111111111" *) 
  (* c_depth = "3" *) 
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
  (* c_sinit_val = "00000000000000000" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "17" *) 
  (* c_xdevicefamily = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_shift_ram_2_c_shift_ram_v12_0_12 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "11111111111111111111" *) (* C_DEFAULT_DATA = "11111111111111111111" *) 
(* C_DEPTH = "3" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "00000000000000000" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "17" *) 
(* C_XDEVICEFAMILY = "virtexuplus" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_shift_ram_2_c_shift_ram_v12_0_12
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [16:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [16:0]Q;

  wire CLK;
  wire [16:0]D;
  wire [16:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "11111111111111111111" *) 
  (* c_default_data = "11111111111111111111" *) 
  (* c_depth = "3" *) 
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
  (* c_sinit_val = "00000000000000000" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "17" *) 
  (* c_xdevicefamily = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_shift_ram_2_c_shift_ram_v12_0_12_viv i_synth
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
OH4dEQq/6AsVQn6YSlOqMief9f2h8Y+90JqPLLtl9vGQ+5C4996l/979YSYwkyX6FUD2YugJmyur
ulgVSG8M3f7Qz1dZHUqNAEhW7a61UV8LUM8IPM3VLS9yMpB27NHV77aTZBPKAd12Bjs+JX+mU+4A
b0XFMEIURX4KTNbGegvPebnot055RjL1md8u01keCCCWP1rVwql/AfMX7l+h93zm0jj9fMdAqHyQ
bnLSzlTkGEdScG7cH15DI0dm2QhnywxJ9cGZ8ZSnOrJiT/hf5ocooD9F+jxvssQio1Wlr5ses7CF
t0yf4+/xe+Y7Pzc8zq0HCYYDu/EZxiyiMOUZ5Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KFnkjhuvxcHw8npM2gQIEPmmKM6QN6TbsoAkxvWDdBo+WggOfRHnfbBiaWrZviVICEjiw4J3daK0
lnddIvw/0990wirymjxH1T2pX1z4aIgY9d2zC1SvaJ98lBdk3TTFkJJFCa+lojvmFl12nX1sd7r9
iMeUHzWcPmZs791++IDjA+bJv6NJ5ifk1UKdpZrFt/IxDgtR6sH1wdowp1e7Jhuyp4ASfiqj144g
B5ihF5cnixnvJOq2ZmP8bIPCwUAot//xnfPePd1AN5nsPZc6vJwHVXTuR65MAuJCZDkHXg8wrIse
RkL+vOlBqGkhN0Z81+egENkjAK41kHBDE02/rw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12880)
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
