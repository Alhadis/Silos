// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 17:24:50 2018
// Host        : DESKTOP-BUPH9QF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_test_sim_netlist.v
// Design      : mult_gen_test
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_test,mult_gen_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_13,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [25:0]P;

  wire [17:0]A;
  wire [7:0]B;
  wire CE;
  wire CLK;
  wire [25:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "25" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_13 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "25" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_13
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [17:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [25:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [17:0]A;
  wire [7:0]B;
  wire CE;
  wire CLK;
  wire [25:0]P;
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
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "25" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_13_viv i_mult
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
rBoiiDaxsTDDdBgaf7vYiE9caUxoGSU73HOdhDc1l+k0soNK/TaMDDVnanPcHvqZRpfRmno2Mg4c
oHEZ2qP/DtDMRZfJI53yXdORhRR16phG+R6CDIit12/IUEf5eXyg7FvHPbM8paYEfWFk79F2kovU
0SzVYsYNUC2BOr2RrQQB4gcr4RQ5SxqbxgcOJx4Duq8aeyJCyj1BoixVUuNIxAcwY0mq9JmN56Oz
ivjxavJHnp4PxZFld255Vm3KyoUKgukKl+5aMr3jhVnhIrE/JfZqSxsQsYJ38KsFUOuZ8GPK8qiC
SmJvxKedAfNFZpEDU9wKHhHNwYOS/8pqlO1m+A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pOP2rspgS9lfLcZBfBQRjSdg03WFBdyHOwHeij+ctqvbIMehkfQxI22NnfAc/TQ+NeLRp+3+h1Rp
4Ln83zB3JMPFLvQ3csZwI7jddXcCgOBhA5yaJHdI6Dt6O7PkvsW/8j22RP93OSNmSuYa1rLeZbI8
1SBWX3LNEJMx0q7TUtuo1PHU9Szj3kIi+jZhWmTAy9GD0HODXmA50tqenUNEO3ZSWZpfoeN7RSG7
7qX1oQFEQsPRXxMGobW9RGZkQSASW3g+hjJUfW5oy172c9kaE3DVpyul10usaDRAAq83hCVCVDF7
X//PRf8BReHCzY+kn51UMyAbwueSskzZtejJFA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7280)
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
