// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Mon Mar 26 10:37:43 2018
// Host        : debian running 64-bit Debian GNU/Linux 9.3 (stretch)
// Command     : write_verilog -force -mode funcsim
//               /home/lsriw/sr/SynowiecKacper/operations/operations.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_13,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [10:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [9:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [20:0]P;

  wire [10:0]A;
  wire [9:0]B;
  wire CE;
  wire CLK;
  wire [20:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "10" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "20" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_13 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "11" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "10" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "20" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_13
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [10:0]A;
  input [9:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [20:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [10:0]A;
  wire [9:0]B;
  wire CE;
  wire CLK;
  wire [20:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "10" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "20" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_13_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
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
CvmaYyJzAT4gGJRlCkE1yXt5Lv9gJbr2gC0wBzixkhI3TupXRLTg9s4Z9WVWp43QDkUuM3VRZjAj
RVnqESt3JA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hHyS2uxRkJ6sHR79RwG8dxYfMwySDoNzo0ZpVSoiAp/93R212I5J1LxM+7EujDw/cO/x9djlyxbz
erzC6/tIqQ2nS2hUZANmmER9YkiA1RlXlIqDOWo8pOFHNj1c4jf7Zdq7OJMDPvKF+fLgmk5Lu9Y0
15oIyfQw7L+gXpW1qEU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Cfhh7YIOGyVJiZpd5j8xa2ugbHZdDDpkNcw6vvVCCgnGCfzlen3wlGk0omzzJqyVapnfg0aPFCVf
eH/noQVGu1bQkowx0JKcNE5x1v5DKH//UNI+lq09SNF0WKlMcTAGlNSUzO8kgVv9uNbKUHDXodcD
5iGh6bHMhVPSu1QKpTfJlIMd2CMz0JfDQiVbfTaAGKvrQhaqVte7pYpnqiXM7povPwt/ntWHBH4s
XSF4J4eDVLMuQmQNy3vrqFdEUqmQFtLWgNRpG2fwo19Y2lRzT3ux5SiA0Iv55uR6x7AG21x8BZlD
JC102ufirdrREfWUzlClY8zmr+TUHpTF/SgPMw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UWceDgHVHZAg17Yudaw03bncVn75AJ6y0RYlYeqdZU3kMG9E1W6q5REaQAI7sMZSrC2g0zavsx4w
utskoq80P2avoebtdvBfjr/nBCQqUN3AvM3GSk85froboZgk4fCQ8UtEj2Qk7ob+ox/md7d9P9dw
2YULi+eG04dUc1g45wwF0ZoZdARk7Ml+fXMnm7zxmvqVieAEsVq6ETZN/P0pwvIpAakLTayKriGC
qcrb1S28bOuV+Na/FX9rxN6hM5aK7vSdFqja5GGs32r9UVRIkX6i7uqS9pWQDR0Qa31W3z6wrRrT
+2wzEwNMDKYuWVIM1FQo/Tp0NKa1Y+kyjahSGA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tLsJPLnIUk5FSxPTGLkNhAFldHrP7oFH8h39nfqyEmnC/AmGzR3fePfCEcee3I4TYySABpWhyXIf
m1jGiCuHfIpFkF2EJqjWmBev0bD33cbw1av2xtJRFa5gaQjxChO9URfjedFvCQWWwjlxejc9nD0N
O0V2XUDQxd573YmSBuByzshlxt3bujEd6Xeeb8N8NI8c2ZsfY4693LGdb3k6gtY9ZEoo4XuYVt6n
S2tNFVJTfQjyBEXbuCPqpwGf6bPdy2SKvTE/s4rSIVTO08J6bXDaEOBUGg13XVoJJqrayiJRVuQL
LhoiPzgOqS6ude1uUaMHE/SN9X/vt/6uOsOl2w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jgk19ieS+ZYiySHKvgAHMus0OAx0HPJ59p64LMaYK8CyW0wSM8LIn++sFz9tsOBdLj2gb8IKpSVr
SOX9XXXM2pQFSME7x8q0m+EPg9m1+ghIpW4bU/w4zVq4NBjYydZCI0Hpy+X3op0a3+eENVEw5SoK
4R/zOL7aV/2nZ//wkaw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L/BPRr/PHH5da1O06dKRr5ST8eskM6lzR1UPuTvZQ6RCsFEjTD1HgyqjW7/ypnIq7V5TYDC553+Y
rJnEENzDc6RSpzenrYxw7NrURpUedIWlCc/PEf5Zq9gu1ESkpND7t98rc+uiAz7zsn/pHD/K50NR
q9l/gcWkOCgArmADo1Lw9usrfZ8ECIPKY2kLxeTYbh4fsrCpPQsQUk4NxX3N1Q0h3RRUCdHSFc0O
lvGip/vd24OK8zXDMaQv4fPmgToFQMUvLrJXErEUeRlkpxkcX6g6Zu4RMWwwmkNIfZHpc5K8Q3RL
MMc5rARUSXbNbpf28H3iyAMZ0y+EgI0CrKwooA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lE0tAqXONCahbF4WrqT/gyvTkVsOZI5ZLbMbYXg4t/DJy2fqolDksynfMrOOgpgMFcY9Gbewq9c5
NTUx7EsH/jfoeyNsGrJuCe/thKfkNHVEUMmsKH8XFPjhACyhr/ZdWxD7IGBmYOlxFcgDqaZevcPc
uBJL2RLllWh32d/GzG1ZJcbKJD4EJ7/CRQyF3Wj1Ifgm1v3BmkDiop4nG4FfWUyXgS8Mj6W/ypZm
6AFa30rBfAASroKm9SGNxT29zQX73Vg4M2IlQ8pd9JRr8GlXtRJ09HpAtFqgDpRuM10RMWIDBVsW
uv+NS/P28r5hqtehbHWK0UpakFWDHOlNU0XnYQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LT1MjxHzYhzdj2Og49X4InZJefFWcW+VjTsVi2NPsm43mDXU3j8gNNFzXP3gf/f04NhYF0TZxJhC
005zAJqpXQxrsDlOcIfqM7igkQ5dietpztJBItUMlDBh59w0flDwfo/xvpbODse+Dwwsr1Zfboh/
Ww3cw71X+vz2C2MX76v9Jpx/BnJEzjoeFoubs2CsmDrpNJXlDl8U/mPJ7en7o4XItHo1fes8YX3O
rH9qNH8354gidC9tMFLghd3v1bJn15OC18rsGEQpTzFf0vxI8+KSsMeW/NbTn3ZLhJRMknsWDIAc
UrgRJQDcOwyYS/E6I8L9SBFzc+hurAOD9IhAJQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7344)
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
