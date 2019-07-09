// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Fri Jun 21 18:35:43 2019
// Host        : bluewater01.localdomain running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /home/tmitsuhashi/bin/vivado_h30/UDP_Image/UDP.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [13:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [28:0]P;

  wire [13:0]A;
  wire CLK;
  wire [28:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "14" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "1111000000" *) 
  (* C_B_WIDTH = "10" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "28" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_14 U0
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "14" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "1111000000" *) (* C_B_WIDTH = "10" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "2" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "2" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "28" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
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
  input [13:0]A;
  input [9:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [28:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [13:0]A;
  wire CLK;
  wire [23:6]\^P ;
  wire [28:0]NLW_i_mult_P_UNCONNECTED;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign P[28] = \<const0> ;
  assign P[27] = \<const0> ;
  assign P[26] = \<const0> ;
  assign P[25] = \<const0> ;
  assign P[24] = \<const0> ;
  assign P[23:6] = \^P [23:6];
  assign P[5] = \<const0> ;
  assign P[4] = \<const0> ;
  assign P[3] = \<const0> ;
  assign P[2] = \<const0> ;
  assign P[1] = \<const0> ;
  assign P[0] = \<const0> ;
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
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "14" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "1111000000" *) 
  (* C_B_WIDTH = "10" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "28" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
        .CLK(CLK),
        .P({NLW_i_mult_P_UNCONNECTED[28:24],\^P ,NLW_i_mult_P_UNCONNECTED[5:0]}),
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
TvNAk+dzefmJC5/xfGEoXo1v1zzw15yvf2w3I+7pl9weHnOYLTwk2CtA6qQwUdiv+KPlR09XyHxt
UocEiAlS9g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ccd1Kr3IgmbU3Zd5R5UGhugxe9OUvTTk5M/+YDzRXyTvXIMaUxHB5fv7SuuebIYqGrGlL5seA2Sg
zO1i2uQFXVFn4M1DHS2E7BwirWBP5gmU/RaWKyEfTu3E5ZGbc1lvK67CCG8szRwdrvmY+Z8CpiC4
+fKoXg6GREReZgylTmE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4OySXRBGdK3bWTwoBJnna9JJTCfjtow8OCB97TMc0CHJtgWscKG0sA6JP+WmQu+g/St8V3dnWCm
Z/oL2u8esW79WhsyQGAkuc2zUGutMTiH5JtlsxfFXreCjsbpfiQ4cOTSVV8RKFLaZCW+eXj7qQwk
WUd+Rk2Kp6kViZmb9GfGDSBc1qKbMuYuGLGiO+UVYNdt7dkYg9aAhJYx3c/Tx4m6BAZTpzEs9xzl
Mg0Plk7PRG/v5PXojT+9MvJ80iSqd3ejpG6kEE1mYBAhD1zmHQfbte6ipINFibjTuluuS5i0pIbf
HaA/nmULSj1xFBTfeEdDhm4CrFUWEdYvrJoOhg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YmbWYAZhC3ayB3FdtHMbSkvV5OWWIi6gmohNfeiL3hZEqSlPd2B43zehv3FM2BA2v3N0HlGO0TL6
neUbRccVG37R0aVoXEjetzHP+ZMpVpr2wNRYoVv9EAzvD7YjPAyiMQMLJO1wmw/LJVkGpP4UCg4g
tgMS7M+LmVgeot1Fmcwa4mDyquYpShDC0ZhYtWL3VmO204ubc1HcI1fEQiMp+tBP7rYU0jIyGMtz
dXGUYS7PdIYkz5ApCjSfCCueqmWeZf9/KXMkoo9udSh2ZyT9uNr+GM8fH8rcz5nZjN4ShPghIUSN
XIZbR6KJ/+WqugC6B6ULpEZUxft3AS1vxij4dA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pRgO0aX5waanQk0eZ4W7Q+LVxiXC+tf9hFRN9nsdM6xbA9apyUI0wd0pRjkzt/X5yvazLViQDSfS
Bm9cP+mYh23I891gOC2bMeto93RQUYlDhWmKA2HAuokJj6wKo/vk9LA0e/rAjHMWD7cTXHkdXPdz
d92x8sSRX6Z5gz0YOJ8hU+X3aLkMrr/d+Rs3UcELF+MTGSf53SzTuIbnaw08EsHUObyFusQxXlt6
ZuByaRiPP1ofEvMk+UCLRZThOA7sR6SIfjXOTF55TQgss4/Mf30sm+t84LW+xNBWIqVfiQ671PZF
CQ8K4qBj3nTT9D0FTUvfHdTmLtywWgV65+5W3A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
d38DScsESf/yIfST5KEEwSUvjI+Km/dbua2xenGdzq3rgc/diAWKNIN11lcJIPDVBe6fB9J2TqbT
eXC+WnYP2YB9QXYlwKxLW7HOYcLC6Ivx9uoTg503B1azg5yB52W8iAwxelCieuRZ3qo4CxwOJ4w3
kwV+F675PsE0hWvEwTA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bf4H+OH1vHHXYQ0B+xvr52Pkbk3t9R17gzpbDdSPXjerF+p1mOwTJrxL3jQRkm9rUtVIgJGiq2/s
crniU3gwf/UiAzOrNxcIp9eKlLwDNsxSMYn+mkUQWlDdifqNNVK+YFJD0ZFE6pzyWAfSd99uwvf2
B/+VXkZFAWz3devN4zOqXGE5+OZKTJNNH2fm+gcI0n7V4lPByrga5xMdlx99MQZZRprmMts+yOHQ
eVL2q0jneXaC7j4j8aSjRtpPAjf6aWk9xkdj2iVGAqs6TlpdNPyA9bKumNf3XCjAnjbNwxHWWAao
tHbBrxiXF1qQUoAzJ9mjy31tCjRX+JQOzKafLw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GXI+W2rXNgn3WBCe5EKSQutclBn9ScjlMz2HZXB2CUjOemGZQmFG1wGgxNATQ16pnoHiwc81cpv1
2XD+Zwj5Lff+pz8DfVijSMTxj2ExEs2TeCWyX0Y5IhQh3gsUO28JfGvtvlZKRAvdM3sVExFkeiTD
HONY6kCt1LGdXk5OTtjfuUrg/E2XDG9Myrw2gPbG22Baa46cK2UPssj0fMqZX9mst0FdOGS29PrK
3rcaxYj/vEZHYWIMCoRqHeni1Aki30T8CZqmrUFSLHFfmCsZkbW1e2EzsVZyPjgp0jZunlqzt2LM
WGThoaA0WtFlGgxJL1oKyWn6/X5pTh7lWBaNEg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wlCNsd+2aT0QmWr1IajTAPO36RrC+58rfcA297o8vu0rtwUfgAYww/myxF32qhQIFmGZdNaSQDGi
mH4T1qjRpQ1OgojdPbg85KPQAZl9Q3Fik6U06bAQxFkD56Y1r5LotAZ72yLKu80eIhghPuwolUwh
/WfjNqvD4NIFkfvanRK/a74d1u2Negka2ef7z0Wnz7xNMZjyZTLV/FPBYDIk17sW5i8clir5dqB2
zZ7JbcO6MjcZG8z9+rbnYxqpqyymBr+y6N5uZWAhMWevtPJkpd6nbb7fN/7Zz2FO12xfW/gUsKNP
7Ve1SKN7eRqfWTXqHOQLo7/+ctiWrYUjj0Joeg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28544)
`pragma protect data_block
MF8BDz7imj4/3+rAQP/9zdh+szpOijj2wJ+fJY6/U9KGNriYw6uAB8HBBq0a7vqblcOpGcOje+W0
tY9B4YG6WfeOuCAyK0CFFPqICz4wfq8qj6IBRUn7YUxMP7lx2mkQVnNvdtPctZlqFke+GmoyN6MU
xr1yqlz9qrrdkmnufUPkgBBGIYrOh5fuEKkfLRtjnEaRljNXWgw+O+rJgDZIKgijdGsVP3IauKPQ
1ZelT99hyP0KggWTrWaqu4Y0n5o4IXAVKp4R+nhjHo0JD+Jcs0eP1sazc8P1NkGoiEYs9NBVo9ve
vIgfz64UgkFOzMpk/Yv3fGwJqY/qDRqQDoe/oOnLm7qs9Zh4vEOWOCTYIhEfevxAfQD0LigXyCNy
tL8N0xVK21/6GmXjJfPllE9t1La0IxmTLo6tgWa8vcJ0HnL39dMCl3iKpZjTPGN09HEVvjIeU9MN
lPsl+biRj7qcJDmLT+zMn0dAtTA6s94yY3z6yhGcHZJ2bfqIgmruElzEiPx7s8VyplTgSDzZyQ6N
cXVLL8N1D6iNUDXOnWC2aSJSSLZ5XvTMNTGbiJpMHu5cVxtnH8J0Psj6Pllhb9gMhYrqoQkdWn3D
plLQSA0414tdT6IHS1TcrvfqrcV8B5L5NfCUVAS/Mxffl4NgMgr/AHr1YreRSN6YgpwljIB5iaFd
Bpcd7Zm46fb/9p51VVEmliKf4ytiDq3ctJawSnqiH+hE/1hJtdEMcI50rFanWK5WiBcKa7Bw2wWy
7Ye8iaboROsaacZvxMEUxUSu1iQVVG7CCH3Lcb1VDBJwyQyHswChgvyWFZMtbtTftAo7AtDPgdqh
MMRpJBZr337v9HIWUY6vsmIGQ/YOQmeEqi/DZWCWx5yNrBY5O1ghjHkNbkOxu12kU+QR1tOBzLAC
WPNnjOw9fMz4tFCthNQulDLUwjWI4iKyAmqQ/ibowMpqNuibB06n3/NjjyqnYeYEo9uvaCNgz4Z/
lth4ja0abrbZa5XQRAQt1VHZGQJhuekgudp+YwEwcwUN/DRhKNTi9Tk4VmtZ2KEXYvDSnUqQslqc
xEMYQ3M8PEvKk0unVMSeOxScmH9GlgudNzoTMXKgV9PR2yNw3iTOLbh6LWHV/AotfjwyfHXppjC7
i3uju/i45iVuEUZ4+HG1BpvY/s0mDQbXw9aIpdtB/XlX7oaFnFTgiHGYoovwEsZkvfdGiOGm5jtk
g16PsIKrFqj5PYTr7+cjwgkZzgWhjPj2+fCa/h6PgVClWqvAJwlqAXO2QdWHMYDON5/mGhxp/OZp
iAhAhp9polprl1oAV6NSZbOUySFqiqENnGPYSi+uD71MaZeS5YdW1fB7/3s/X33lkfWM3EOjHYT2
FRvMuKEhOUfrkUWnhGsZQ7Aevd1eZ2AfCLGaKjpI0ybSc5fk0LalJQK4L1Vpm6Csi3EoBUCb1lYU
aI0RIMtpyyNq9PaYUmsDChOlCr88g7uGdf3ue3jdp5w99FJeGOPvW2rMVcc7JHIgHgIwSoPK11c8
5U7R6AG5yo2QqetvzsSXAT+AthXabzmx45QvQJQlWnzq6nvVAPc96l8ocMWOzfB/qZsSHbYW1xvY
sn9CDikAMaMwds2+Fl9+hUwBQ6b+DGK5HGgV3XydqZUlmHLAo36/00TACbCS3wRejcLgT68808ux
bBs2+4/j7NWrRvOlPw5KolbZ5U/Eizvqb6w7gzIunY/YtDnt2saMbD7o3RUsPuYs59y5N/mmq9FA
qSLZ4tvRqcEBPUuQOKK5W+MXKT34K+sKFquRp3t8ndWpSmUaefx2zGemjIxRpxoG54jUAwJiiQrA
byhQJnZbQHR5kD4yMGp03Vyq0LCKmZ+AcCPM4bDqvbXAxCLLW5HMACRxDg5vbS2pTLa56eNkumcH
xHikmKrf2RFBfexbFfTwjnyHAibj6XHiefZx2VTtBx2YSLK+k/De8J1QTWdzb9ABtXSj1FeHJVLv
3/LQvFi7GYmNAL15BKY0rSaTj5C53KGp9S7ckb6SYX913f+tUORU20XzPh2adzqeYEwyOm/iORph
yXBBKzleh6ML+XYL9qaKsAPiQLPOnmgFpG7lfMEX+Qp2JBN+MZTttGFB0Ku7McMHjVHxjUHT3bcm
0KuoOyzga7iyvg8SjD3hFsdSzm2C0k8Bb6BuOAjCuAbB1akQ9CLxpENF5IlAXNnfWL2TQK4NQoNG
CFTz0fV5BAW3Q1QOLtsW6k/gguXhhUL7igPgB/JrLVm8YXmNHZwdAMc5JFmzy09enniGt73FtRS/
DPXid/N419JRf8KqXdohKQ7hC7JUvR8ft/yURIn7Osxr9qoJPE5+5hZy+R7+Ini+DTvk0kxt7/eu
aFP8ibajZCRTa5XVlZE5H1SBpx3Xl15h4jgwzkSoXlkOjnxKPwiCwi9JBEz6gKMPML6bZOlptWU8
wV6hNOpTSImjsdY9WmeOyX90Cso88xV7RZvXnyTBmpxdr8xLyQn5Yn8CM1zewwO2ZHqeyBDj46bf
LabJf3s1e1cro3Y0tGhHWSDK9l9Q8ffOboD8KEiV5PouGhVFJwN9TLh4uRCRbWWk3UfnXm71f03z
CZLRmch7D5DOMeLnNc81hF5tJjGYOMswgEkv8QcsEx0ilnir1NkarZk1Tm/Njct++xaLp9++tfT7
/ytXsAlYjfVlUr1KmXQ+zq8xkOCkQm2ml7Uju/o2JZ4xQBIWxE/EQbunM6oYHQDEAEHTIbwOhDxK
dtIPBQCuXoG5VQ89ri+3D7LxX8/SapSqFm8P09/CvzoXSRL+eYe3PGiqO7+4jdytdWEQsvVtm4XG
tK3GfnjVMbESKEbQ1o5m3TLY7eBRo05YrS848N1ED8OIZ8+rIQ/PBMbT95gx39yl40eVrJDIFvm1
Cyp/MW1h00xhlCpkm+Xf3Z/bydQcavhIoLwWIG9VjKqEyjfXCBrAa9obNSjmeja/6i+VC/fP8x6f
S7xPDTEeNYFPPn82KjLfxK87x76m5Pj/PV/VyPtjQCwauqr3cI0E3Dounk7/LHcRdcSBF7SYfB+Q
CAW2mguVUDUoTWtbx9tqO1vlbPQEq8b0NRB7Vdl6AoIUT6n264MtK1V+P+pNB9U8kYK9HmAadNrL
2XV0V4eVDYWKz/kXoAAEhSFX48rsAbWm9IV0vqxcrUj7dCazJJcgE4AM59mIYcItU0GselvpCbkw
pZzCe2oaNqW3zDndv6MZ3oJcL3ACYQFto2i4rW+vnhq3UQWv4e3WqqUjGcEZqDFdVMBJ7NaPxtc8
F6GmLv28+54y+ZKmI6FfgpzjECJQErNvQ2nV9z5CSAUW7cQFgUygUtM+SAyWIv1k7pYfmCi1T+7f
y8fPFPpFmDJ6hciYp9Jpc3Q7v8iW7B6CCQVKOM6cjQEVql7O0gUMIOoeoytia49VWyS1g/LJWT/t
DcZAIokRxAxq7RTmc6PY/AGEAj2WqhmioYuyg0a/dwCDJnSaF3cGKhP+E8viD4Pe7fyrCCrrZepF
6CcES4FbL+p1h2V/zY8BHI1oVQ4zj/Zpo+tQdKEql+Kp1U7cZOOkru4RNBZbFpUKJyoTFCjRcpD+
hmFVoTNUsR0CHPPAdAy+cs2QZykTVIjubppMtsFlol3zMnJ60T8jcAwwSQesBBDzhJKWzgqavmqM
P6z4r/8IczLFjC7Gl4+N4ytSZhfDJBvb0cL8K5INsyEououBfsYUeuNOJGZH9CNeOoj2Bp06gcod
r4VOpJY1H3FnHKogSjrf+Ynb0WsM3rbJgIa9GYKBp+BHJbmK1IBMA8dIc9SaD5yLoTOpjCP/FY/r
4GVzYGbjaYPcmGqPZSAlT46M2Dqwtqhn/k1nXWuk0V2GPKNvcOOrxl12cAopA9uo2OXkbkngGpJK
8/K/grpmr8Se5lwX5OoSvxX1sXlhoqv/90VDRX9PIPXiFnlE1m0gFRMRF3VLVSS4dBO3PcfgZ8QK
Fu5gKtoSMbtvE3OXF0U3hgqmd3DxXeU4N3PtVtorYK+4DDKHctSEpC5xkSloWZfIV/cIEmojyG15
WVFSPmMzpVWCrPsRevdSoCWS6M9BTqD7nX5YKnlKfVVYvs217WVoSEEaSlR+1ojfdqPvbZaEWZCz
bMjoS7wr55IwID1+E0OjWNzv+sfhdkbGuIr8l0Ak7KAqwwVAhy60+C3fpQAeBExqi12LBpAXHXP6
R0eLbBT0YKcxlb06FqeyC/sCbsKqmwQ3bD6N108Mh7XNtCwuw+ly+2kD9E6Nh8mDn9atZn7kcvzB
C759zgF0wlqnK4Zwea5YexjMksidTs7qQvwwGprR6UyQlRA71D+4URa4dApUTzVvS40HRymKbhzR
T0dzoyB3bWShpVU07VEnRxfUqgqDnLtDvSSfUHIiMN44J3exWkNYyFUATSouzOCDpoFckiwUgSv2
T3GZRnAyLnqlJIu+z3jevLkOQ+TMCRpTa3AcXjZn8kR1M1aoOv7xWiRd105tYypoWL/rZpAUKRKw
VBRNbDiLZcW0Rm3Upro7Uf2P2ZMtUHiE/0BVdN9p2jL/xr+Bd8xWQoY5R8V2DdPLPMFWirWbbp59
KIOdJ7SKDXTcr5JnUCw/zqmdMiy3EvVisMt1hHjCBLOBIATRbfjhpnAjdsQ/KkO0NJ/sgxzhGH4F
8FqxHsULf4z5PlctQ58HKkszCHdLNB8mVPniIXhd8A4dY099LZrLGwfUZ0pT0t5tBLwRZVhKA8Mn
kGa/pFykQZcFe0I2YJpogI/ff2aNwOjIRn2QJzwLPwNtvFs6TfKT6Sg5L3oFCasn8rSx6F+4Up3v
MsuG6i2GRFK0r/MKjEQhhT0qrdLWfT6LCgHdxKILwV3A2me4zUgGc1Mz64+qBvdRtAHE4X2dV/T4
mxk4Oab3+/f59xiJwIP0IHOJaNrJYudOdfgzGrm3PfK4yDVhCD4PH0S6yasxo1lr72urBP3IcmIL
L4KHJW+xgMtDQxhEZqvq7qzpPJ0Wycft60VSNUDPd5C+dPlc4jHWuMY8kZA+P6Zbvk6/ga/WwxXY
1bwsHWcF51cwsTGIHcZaNe3f7a4RM0/MDMeRQwdiJ+hOspE4UIHNo7xrlswMCz/T/dvo2tYKv5Bb
Eu5MIQeWITvk52csGqHoXbFmMcVl5TyBPLc6yGEH9jdTFEFRuQj3tr5wfkOxMj60N/0j7EQOZdlS
4tc6nhAGzXKWAuVmQEccUQSjq3P+sJweACYT2ZrTu5JMrMcme+I9iSUM2rw9ZVGvHPVPGIhSAbvz
nvZ9Hm6LOvWbwxEgKbWPFLwij++QOT12hfPlT/dmVWTIZfshaedu21BOKcWralrMsvXz1lFoqw5m
p44ERUttyBbb6z4BbC0s3bbd8hPHIlKZ7kCSqoLV0oc8GVottOXNLZCzSLqzcRYxm/Q/9aEFT7xH
AJLD8R36yUp/hAMTq9YJoiCWUxtWgw3eAzAKSIFC3nDdxuTEGtrPH2VmQDnuhxxtNbRnKmU0R97z
18AAU/odvKjXc480erdWPK+7MoOjEW9NmOx4ebuKNmfOQxBgD98Hd7f9pvo9uz5r8xV07/GsO9XV
lNAKtcSMjmu4kIDnJLUGuUB7/wxLr7NK6EAS9QzSVnrKzB5xvPyRfHKULc/UMzjnXTGJ/1l+jj5y
Pq4nCMO2r0IrhZQW8y9Ydz6R/0vw0LKOQX3kOY48aL/jZRCwg95lZP47fOmU5n+tcViOwwqmllAK
4frXyE57KOeQNHGqL1ncaD9Dw5BORH7KTek2/TMEI/TYP3gPnhD13kF/78hMedL5gsEM6BIbwOTv
ioUXFCZDBgVJ0FC7jslNRbnMkM/QgTjx+VbrgRZpQ6QJnqmMePG5ABk9feN+p1tsp5CvbgyBzTPS
teF2V+Q8xsfPh3AE+s+Mg5N6Bs91RP6XFLn88HAz30lZBdjgf72CjEbgpcve+j0KxlzoIlkCfuQM
Vruh/t5ZVQDM4KsjzwGNHNg9sFjMFEc2pw2chJQm7tJruP3LpfXVSKqLmpOosOkj7hduW/40BJk7
ITanDSyAl14c8onShlQDjZoSclzaheiNvOA8t5+hulDtfrHAfNsFHFGzXha62tkeiBc7a260tq3u
tt5ZJOmp25xpDbUTwUdhV0KB8N778wsjJF75NkadEO4Y47d3dNeMaPmn2rBmmu9RQAHwJhT0Z4iA
jJ3GIeWFdr8nH5IQYInAmpNu0GG0fNtzzKIVmSujgztniE0iISFURQs7/FAGI075rFjDfiml09SG
QUtkFsjPm0DOhHTnDEj0kLWmJSZhKS+dDgV8WBPm5tcxs67RD7cAkBfjBdPvhPf+xP0U9V1lsYuG
/QhMLiMCXJ9/TypBYP8SvncOT+Py8zDmRQeSjMr2Czbnqh4dujNbPOC68YCdEk/6LkY3vg8y/rLV
w6p7h2gZxt81KyCygkTtvnZb40SH2kr+C3pfi5K9NT11T/R2ZxYR9wCjg31j9zReZc9Vn7meKkiV
fwapAAGKtkijwVxfygyWCD0wvCyTNRBsVeTBlrf77G3lZJ34KaBARNC7dXxycyAgcvt9STJhOyCt
YJTHKASXwi4WzIR7oPvK2p1jF6hDscN7Z4XmEtiJgR8Rc9oAfMOIf9HdOOM4Bm5UHSm/8Y2r1jAo
3dZuMyG1IaNU0uN/TLomNTUf6QBKZ21PXhQ44CfG4SVHFcDZKFLr6Vf5MhJAjcYsb8EBjzSdWCQT
VqGo90/6GPznymmqSJmQUPaCbLZYU5sfkdRhZJEEPDlVC1YJitKFumOx3OAmzGSPDPOjSwljvk36
VWavlQ5vy4M247RWmDIWbeVZrop8Tqxyjb2CuLBc3lHQeHy/04XhswmJevaZDlMeOP3PMl7nEws9
pDZtt/Lf3zl9BItLhcdtiIYIbd3paBIJoVp+0C7B5O9VdnDuNWLZE+zqCqhaXQlqB6MSK5BeXRUh
KIC0dvS6NGZtfgBX9ILhsS1Z0nt3X2O8AWVJxGit0okA6RLvb1iW7aD+bCYuebHXkGoiNHWPkn0m
JnvsfVeetMjFUQ73K373W8b/vHB8e1acBIee05UQrnVy4i8sbml0ZUk+T/rCWvTJzon43t3bzuzS
/D0qJlgZd1iVMiIngq4YE55pOsVnyqImdLcdTajTKRbZUIDDnsr+AGsmcV7QKhjPMLGOWr8/oEFt
m4JdaqJqpDrth+ym8ud+p06GoYDyVgJ30VOJXFVTo/aia+LSEB3nl2EqBuPWivJtN+bXlClM9lRF
cIF4ctkLLrNzBG4HPWIvUyWx0LSA66yahi4TAVQQZse8T7FemO9GJlOm+GOd0euep2IWB7vvLzc0
zRYG5cTq2R7EzU3HK8Zg5RH+Lrt2rGQc+6K31FnLi8RtgI3Vx9ZTWpuqa9BRF8q1AJ+Z2qFrXrsX
T6XjxPwldzC6Mwxxau6PGGlvff8xrtKcA80KlLOd7kheMAA/T9ZQW/bCTUZJQqdlwOhuGCJdDT4s
83Qoh6LrDuYRYIdzdU9n+TjGGfELkEdXdsLodq+29daJki+rHrKEKVM2BV+8Lki0+Nn09KoYHolP
2N7nQgOlbG/cOtfbGtmjF9X3YKrpk9fnqIMC3x9H0YcWvbrh+EyaalpalxwwD6v0cjv3k/1AUSKy
EQvKgD8DdFx5Rqdlz2DsqFGgea12CMUwKY2eZzWoJ3cSBaGMHULgEZi6KsQeaopVC61O7RNstAIA
wv0k2Vsr+0ZBGvPMUFWu60TRalZtUTiXx2fzwmjUD5NprT5l48mmep1smqLVRHLK6BzLecZNEwch
jyIZF/rCDL6kuowha9kXmMBVWVpUtXJaa1YC3iOPDM94lFw83wjfDy94ZeDoNk/KqA+OOTDA3cRo
XMgBDpYvsP45Ovol/NfCFaCtg/CxDfHNhYhqzNv3bcJctmK2Zst1h6VyHOnaqR9aWG3ANRZywn63
OmK6RVEzhBe6ix3ClrmnmjsqT9EUt8y72GZk80LqGjwz0R2OyaIrahs6W7qoWasZEI9kWpLYbogK
KEvRxo2JookJItuEBbYvF9FLnnQGs5ixfYQxwYPh6pKyk6ogmq5jdvc7/2pzHoB0sOSsWkzxyqkH
Stv1J8T0vQ3YGTOdRMaFcrg1gexUjYFoylqvftvJzYq6iqjVB4OHaLXmsn5XqdH9JNYLrpbA5Lvv
jxxUquTpPwwbCmF5cRaqmhlpVYvhyYRee7LuCBjyyMaJao52yQA/RpomVzvuZWzNjpA6dM7/7/58
1+w0Y9BACByLBj0DSil5560zLW1tRGz0mYZDizA1R0TVj3OEvNyA1ubxfX+mJ1/5Hkvr48X7XS7d
Y0Vl+/MmZ/IaLNGEdoctQUinuJlWqKHng3Fyg3kHK4XGHlTgy5E3bmAPNwfiRQUfa1STF7+xEG1k
Wa/sDjqh1h2yvo9jEhpGgIQasDMu6uktWOSGTt4q8kFV3X2dNK/MA2NUPTyUAOFRS4zqYiB845nJ
PsLT6JXKPx21rZfSO0iz2WaT+RMF0pttcNJBiqnqvuOoKkwG+IQDTQSK+/CbdtAHsJ1k/ay9bAlX
Q+iM1f18qL0qz+ZAZPTGk/ct7Jhlc1hg7JlODufKei4/92b8rhO5GaqQa2cmpFVzGs2PlsDOzeX3
ybknxSHsITB2YPrL6f9nYw1mXPRIpP3XM2cmcbtKkHFvVJKAasqYm56w1ZSx6w7AKQpT7YLTjd3l
fF8XwAH8XrdEg7wkYuxlnLppNR89Mb/CBRHcjuXkngYPIAH0EyukNmOF2/fvG8WVg9R/PRHU+YiT
/7+ikDEki1g08b2Qqw1YgF08ieOZksC5Ow6Y8AU3EKAaFy0eWcGW3cZEfFKInv227MdcF4hRKpEW
VNcU8EW/GirtTn85EKSKRjuz3E/RaVR1Tscn3yGj4BYH46yRRNNiM8lNS3TMuRKZXSqvAC7z8DtH
YXszrtM7V1d2AC6bJBU7UbFOZiofw8pVuFqcpHgcgRs8mQXou3U6QjIf32zt3uOFnic3nXp1x84E
qJMUhduKAh0daFXaXlVyiDrokcQ1yKNSz+Wf5Jt4Y4nBW6x4WckPRcEc1iicr2uviL68N+txdX9t
oJmb5wRGwI6Glw4xyoYW5omoLFtCa2VZl6wRdu3NiYXFMVGh0liUo9lvopYCQSFsxrpeRu0KimqY
kE79fmq08skrteMPrcRXhh7Cn0eOiiy+3fyf3NamihQM87goW+dJA2MNAiLWh8cs6CDxCrirz62c
SuASZn7xVHQy3RiZ5IIY1bFuYb8ePCmclY45s8pIx9asJgCToKPxeu2kYcHR+fMmrvBs6gckMft9
RGAmo2qfgElOdpXBj+LcywXpNj+PqmwdVlkU5Icsx0P2/rlo22l6hy6H1rF2Ye9lwL0P7vZ5VT93
ElCfGz8yLE9t0UYEmROz0omVS1ygAtPtKx5y+D+SYYoW+DDI1VXZ2v4uH+a4XkQ0siv/0S02cTNr
mu92LSUNcOOhn3DZl4o8h/LdlRAkZrp0g62KO8l5r76kR4lWmXw1gmm21kxykGNil8KFKKT/KVQU
GE9XnoXbdZ/cipXyxt/39Ovpp6juxFQE4aw24jmzvUla/YI/TrjC5y3cMMHf9AKQvlfKNFvJ2wZ3
R+faU/3t2EON2Sk/NFYoqDNHJflGzrBD+wBDxbkbTKj/M7drcTVE0JgJnmR+J26Jg6WIdSFDjRMq
FEBorPwwqNPW/pm6u+AYJ4zKi++Nekxu2UaZPKvkNXgYbXHgBzmci0LmqnozXnMX4Zidb1jXG5YM
APhEvI1qTbSowJEy+UeVbDjPYNtUDZUCzSnKwW7MMTQgTW78lX8D2P1sDP3vnumWnhZ9kd589MHW
VHyxZVu6Lp7M3/HZd+ZJ/l0xp9arT+0g3JCI2161cDGWn938kAch8hGpG3Ccrk9qKgYCIx06OdEo
RQ9AG99qZlYWfOhpucbLToaPaWCkxcTg17oZAGeY1CzF2nvA2LmLj2QIwqKhMP2bz9xJy0S1mfg7
+65p7ORvOsc6dsI14xv1+1DTft4tu0Obh2Wb2dvZgt1ltGQWP3IkW1FmEm6isDnA4My5/8Mn6UPJ
AQVQY6j3RL+7LEDYMEmlMM32IgkqTzSnp/Piq249/LTm4GEi7IDGvyzts6mPMnfJcOLzdskbtzgV
aQBBGRe0capCk8N4hmpgIxAmxy9WzsfdPr5nYw4tMH1FgyiAaEMRNziQZXSX+o8BKF4pnCudMM3/
nASUNf8fbiceig0lD0esduLWKoTXbvuOqFu4Ms/lUJAPPl+6/LsX9Y6sJWUEXKDu0wKA688iuTVk
coBI1HV+F1PuIn/gwPA48Iq7VSuGASY/3tBqY/fVbFRBjOqcpPTTH+9patA4TTZBx4s1oXVJhe8V
nmnYugOOkLgzDS2Rp9nkyYpyb7yfECTAhS1p3uLN/7gw67MzhOjOOMlrSywi4B8UQNy5WmC9qogr
+JG1Ci3i3qAUh2rY83ud/jzvvPJLhABfMksPUj9dgdl9Lt4gWwTvpJ62dhParAR/yD+48RtSl4tj
ASWsuhKBcHzRg4RsnpqsFjjHBMv7GIMsLLIqiqP7J6f6Xh7bh5S9fWHKOcNlpLwsArrIFPBoSJgQ
WzAoTseBpVYdnqBg7HhE7Dsm9MxIdrnjTjiV+wdrh3VjOrd4Kt5fX4F9gQruv5pWUAaHewY5Utla
sZeSR/bDt7t/MdkLiiJ6qhjLz+jxadrdUNHBkNun6QinwzKGP+HzNy0HJ4WcTi+xo0rCX02ydYH7
GSvel9uXlGZ9TknLRXbBaBrsL5o0aR5kWP07344BPBG4TCQzAThzqcXfmbSjzanE2BEP4TlSTxO2
lFXG58RdzIhcdO8skc01C/2mw8Zf9fk9Yjk9E+k3YByqXg0hP9Y2JFMDi0yKvOquKpNDrSVuDecy
wXaUDhF2plJUPseeadELmO0rC/hy75EmMF5qfSvpwg1I/zrwMGrOHYQKl1l3aSe42ggYRRn31kgk
3hm4949U+lyCUpwRvkxQXQ2n0sG2mfsf9l3u3tKg8idG+qACuzUjvhL1V0xb7Tc2NBYqEBbbNwfu
A2+FwZaQG4DstbV+ceQhMfXBgYiNEaBjtR8TOvXJSCjnVGiax33JLq5mYdq2vz9PaGYCjAKZYZC2
2a+T9k87nYGPPtrlBZi+ta7+aYUfFfyrRoRCJCSqhSvQXCtBmp9JAmtdBC5wxgqEcTMxRWhqxXJm
Zd42TizFWxj0ZtqjAVEJaWXhggl9s3r2alnGOJjC1Akpt5Gavyqnsr4kutJSw9jBG1hTCqioMyxJ
faF8RTl0BGyMkXwHy6EdP9G+hGFspFly2RgSKZKTAP1YU4Jj/D5tMQ387Kcfql0VQyl8aXF+z2Ou
G5JlemtvCFtmPKwuApb4AdmBGourKqX5fqiUsJp/GZ8cnkE7fAduYyj+VrAVHxle7mSxKDQMsj+i
De+/6OtNjMygfVD9IbujQGvXUgFJaM4oykv1VKCoLPL3/tSIrcRbrYw3y59ngTpj0VWhF6qJleGo
Gyz3rV6Ywjj7PKVE/XsyHLB9IxAcwIJNlvDXp+xQ0+ofQYypt8NlmZjiOJ/BHUFQFCSlbUkgWfbz
Tw1GphK5lfq52WVsuFv8V24tWJDdDkr3vDMHr6gwQ8Pgtvewl4H0XCmj9aHFc/7BY8t6j7SPNrNh
Cp9EqBZVkH6nVC1UN09DuHzf1lrrRErrzgugmX3k3s3zuDwZQg/NtkUdoT+O3flL0979x0oCMBF8
quergrfl1dFZLejjPR+2yf5k3WPZqIFo8PaUTGfrQjdPVcCYythBcbSVXsxxGFUAJpxfE3lnCmSE
DPqjGcKpZfD2hJgmhgZ6A6af1gDldtuGLTDyLH26oF86mwChVDBy9KDGCUs7mqisNk3j7/zl1v5L
Ced0vz3GaNfDgx52wcS6XEDHEuJigpXQnnA1omRi+ro9CISithRY62ZT3fSwb0gh8lYt8/Pr6+Vn
t0bIPDhqUnBbmZ/pGbQC4xg/cTTfcHKSnJC7bRrlKY52HnRAuSi0L+s8ex2jYaGY9dvjs9eR6We+
EmCBPkZ9MNbZVqTZbFZFAUxT+nsQOZcraV4llccqIW2jUsmq3EryfD9Q0dVamqxiv0yuu2vpsuqu
QHVQKJqpZo6RWDfDr2myaswmQhdNwzcs+lYelznu20rmM1tIgZnQtmg5o3vRk1fR6SRDv7qHRAuU
asCm6Mhcxl3kN8FanfVyzkGRF78skm0izMHaWbH9DjcK7vcH7Ue7qbEM3Ed+tP0CObHkVwYiNeF9
KkzjKN6EYJqgB/C6Kgtv2tnnRVqLLokjL2niBY0KUPtcwSbfKphgE3O7xf2z5gYACv0LlMF3v3pz
kQLx0ObJp2QRF1XwQtQKGSstHoNiDVttxfhyx35acS8+BlNq15cRiF5PTYSNfJ+xpqLWAjgZE9//
82E7g6u452/eVvLKvawKC9kvr9Yi8IVnvKi1oxtjnoI8Oy02VnI+9NHyFRUiKbsriomOc0QL3fqW
mCE8Kes77On99fkDgjfVLmrlXI3ZlU5MXPK3Ft9CfpqkJJl7z384vJBpzR+97iYYgnhrGNrRg4iz
QV4TwzAgwDxYf109zYNu6Fv3rx5JpEfpU31TvcWK4HS40D+2rQNqvT1d51UgSdqTvsWaBLyPJo17
aBmL3f0WO6vvmBuz/zZXD61GJ/sDiw4zCWsyQMyCTbX9+BOEEamgLoIMo/mB6fJaIWDjkRfngnRd
Le2TOLkAS7cQ0KaD62pJDvJOaam7GajZfHMIU8+RFWfiBLP03FcsMYZwe0FELsJWee9fH1Gj+hCA
iD3FpYj9qw7Q1VZPLgKa2guLr9PyW5KRI9X8tZ1E4M5axkhck4pv7StGvG2bOM/YTlVuE1l9Qod2
hoOdqVY8sCt4QOPyd9ZdtkZo6pB3WE08x0zKJNSuGJYk/9CutFEkqZ5wM130twlZYj2JasW0AMHF
y3nXob0PQWGgFEfixM5Vep+i3jxIQVVQzg2J4yh8RqOMX743QJ8SDKiD4sUZ200JP90JdwouQNDj
0+eEJMxbEHrbBCtkX5Fyf04OH4563QJKdznZH7A1GFOckt4bCZQklgC2DK5HjwrgoORwZBi/0flc
P34YgveivaNUg8YZbOGEfybmt6+pFs+mfsbkmp6zSLG8445fOpLNti5wIz7pnsbWjqzJIk8zsyCo
4K3ONHf1eNuWqddxwTIG3f9qN4yx3QB5avXd0EqXYNY1fe/w/ZV3iy/iz2JjWRdQLdfWSekASf+t
SnsE3G6l4BoG1ubU8JIR51Sr8TOSAG8RkwtatJyo9HIG+f3fNR/LPA+CaAta7UKrLszXWGAiaUPa
12RBfM4N6k1R5wPUnLRiN8aGBl8PT/vq1gKUFRSqg9YDWbutyzvcp07tkKeIEvSb2Otk8nU54t83
/aI6YRd1x/rkn0TcRr3ofiVv2TIiGY1sNj7x1DePRBi8w2Csmbz8c9fYZHeQ7/YhxesWyp/NXE4C
SFFu4s758cbDHuSBdNiV2hZLnhYPb9kdSdgpNLq44u/AZqAq1c2HDMNTI9n+PeP3s9Ss39KfNcyV
F1sN5M+dpk4eZgID63E3OcXPx874+/xXxlp7lf/ZYBa81c/+j+L+PK3bqxC1sZ4m8pDMLkdPObnr
WePVl4AMBzmEH3W0+ieIOYcm4WJhj+u2fKX5pyZuVPaKDaBKxMzqYO6uKLMBC4gzvSTePw8pxY8V
+yjqirL3MLHo2oDW0w+ODT36AlXCiMbrISRVrI8kOng5i5CYrRfhXqC0f+wcNun+N8u3KD4X7RRE
fuQUCbovBDh0Hdcz5oUFl4bzTd9II3qwPbaxmpX8GDGeKOarH5w1TvOK9b49jYK8/2Sy8HAOGS5B
PIp/8W7y7veHSE1TmFoT1CEJcIxE7MLtpCgNNKg9jfLrQGinvJ6rXW/RxZKuUyQ4tZ7EKhNYvFAR
dA3GXCVkM1lIbLpFvA3LUQe6M/ZqwcjOvdrg1u1wGfZEOulOfTYieHbiSXWmI1mnh8Zf9BS8zfAC
2i2ZqV/xueRtEcrfK8BiCD8UTLGTBKk0rpm7B+7JqTWongAKRQA9HsVMv1DvBKBsKCffue5/145a
x87NE/EpyorqUbHB/qekIx99B/DhsiS4PNrW+dJU151zXcOobIonGfrqX9z00vJILxWeOe9wVZ2j
v1GtXD5GYCWyCbmgLrSl4lwhfv01myejIM1BlWi7tws0CWsLAnIei2qoVy9lKjLhwZjhAjWPVF6F
Ftn3v4Ffsc9KJbgC8RN+kVNRMopWY6NInGMgS9iKhmNQ2SmeNTIEacNzr32lI5w6k7XNsueIJEYx
cRi8ITFsKWnWxJzbjcc7ahYb399u03L3IVsyMsWBO50mvs0ieHU+WMfJ46h8P4e8ttAwpSFb0Znm
VWhQWnvc1RDtusDDYF3ZhJsrGJLTi0fygltmIVXFVlpM1Ynliq2xfV16PrdU3DbCy7ZlttdWXd2V
nERXgCtzxhneLJjf5MX2Z06q/0K6wVI4vQxn85TKxk+0QKwOgXPAH1yG8wQzA4HlCWNbBr8tm0BG
isWsK06ARJX9KCxGpuZkeUJuuNy2es0HTp3RQNDXSi5XFNjHZ2pL9++m98/crhNMiYJN2m3PGMKm
bAagfMBCuU69M6q7pvyUFZ4RZ30fxa6g1vrhEYdp6vWo5NFfiKjvgkTSP5cmHxLOeHYoW9jj/QjC
oD1myn6eSYeU9UfXltgH8EYnbe2DVkt6MZ+Lr4MnaLgxx2yY76wfgQaNq/BJkyxZHz9YZBr+LXaR
NLbHl1bbliB7Zq5iqgg5DF4dJLHJQ6BuQIDND+t/56NB18uoPgtazGUnA7ja24x+IFUMFlt5G1+4
28XBFpqbo4QgLmhOpkmWaFea3vkSriEKYRhm8uiHLQXjWamT58z8XwR9zBd06bIlkf9zolpOLsoV
pVc1WD0OgvsdvAVIVcjJa8VyvLQQa7nZqSpkO9thZ9CikjpHwKYB+FI767hHpHb/uD9eKUZmEI0p
WOxQGVWhrILINOawROf7gAvZrOc+lcq6vOvePY6ZSzWIcZ5H75XpI8LRb7bGa3KhxdsMyoI5urDt
jsP+4Oq0ydui5OwTEyRH563hb++vI5/JQqIhpJ34Ym2tgoeSwTm3xETiwjNIIK5a5P8umB1Z24uC
ouLEm/WUQa1X5zaLxKSY8lH4lkMUU5jN0PzDBFW9sIyIqH238L0XhgFpadLW0ONhoPxp1qTEagrr
R7E1xW6RKRzMfkE/wQ2Hwe/OrHAjWXflEZVaCBO8rNj9fxFKTZpNSpOPcQNUVUMGqlzZJo8X0yKG
gii9uHl3KhEVudrqhCGpe2vkinoTHL+C/JUFNK/xXxv0W4hOnqBerAfK2VCAZGxdDGWbwUdFhHTn
pGjbopPy/t3gCBD0tNAJq9naA1oAN5P+dwT/NoMWx500cNy9Nwgz3gJ03SEKCHFDkZwy/1I74z+J
se+wXCActIxJy/rL5QvQPq8eNK0LUyQP5VwOHAOE8D0iozNeV0TNmzwPhU8R9YimKnfGYxPseeTm
WxxK1Y99P8bARrSsrCgnu9vkYAd6zYHhF3M4ae5h6ongbycLNP5FwTbyNbJU2b/S+N+uGtz7Al6f
p2/VHkInkkQVx1jFrPq4X/DXzo4Jr/72Flnc4yZS5uGKvcCwxoEDrklfvPjdZtfjDUnl1JTj2sZi
vpxFDRqYkjbORvYAcTnu5ADXuxQ8dw9opRufQDwNhFY/ORebeqTOa+1uz9vDcmcYH/XFao1LDUHE
9paxuaGvJY4LSWnPWz0AhNQ/aUPCYs/W2KGallzvzCOgOaeun9UI8yu8ih6p5+pSpQ6sqkmYSB86
QqUy3S/rQ0rq+zlJQRL0zQK5QWCXUep/q25XsYqI7vrk63BfpLF3NTmJDuCDN7s8yTllCRKlOLd6
eJkUnBK5wha5JXNBtOBayFgedGThyNmlN8NYokqmg5yFtdVGBLbyI8qn5luPW2CaWQ7R3n+LGBgn
UjggSLGTHmeiOyB5PegD+CKQ/49ca5ubsKpQEMJg7muBIOOInLGqeqjQr7JhBLEaeKk9hahrY/aR
PoraYd6v0rSyWezcBMHegB/C5ajEI2YYbTz1pBTefrFeCPIHkq+bgO7D/cE38Cu6lATvxNeF88r4
OHThc/TFxWjpHpC1MW+838QelYQ9MG4VP46ctMcPQ4nDdPaP7Vf+ZIQIVG6Cv9c8YFr9Z78fb1Px
Y83LR+NJQ/yZnTvwncKwSAQ578FJliHScxUFKp/72v10BOMZIVORGe2JB6SX7Hx/Cmadb9z7oHrA
3PrtW7Xp/icdP1tv4sdsbuHOTet+48iNN/Iks6/QIjafcYPD9TV4OQ16RXDagYbsNKNJDP+LLW+1
wTPOAp/rXzgKeaCZq455ED9OJkdpSN4A0MczSDQuUiXpSoMh3dE8GjNIA1hstpuNyaJauX2tSubF
OXrwbocL1X1Izx6VQKxMQqEAIUqMcap/yagZ2lGYFJlA6Sx4RlVv+bOVsBXJqoOqdva0meB5+weQ
TtuIJIUzELG+Dc9tRwcYVFmA/5rtCmBmZ4hW+g2NM72PZfFqnwMrxqYy4dDjNWgOzgNtzU1QF64+
pr8LDX0Fs5oHJR1e3+nMZCmJV2nDxbF4L9bIcjToSET2A3fzysFVhYbVNYBH5gMkHfIGlwsK8h9i
NmDDX34uYMJQ7rzhIC0ztQ+XviMzfNh1mgAwRhMKJYrlX99lhw3hqKp53MpgIRC5Z9zolN+ts8G2
w5Z94krmUssZRnQTSbYbWQHr0uu4ogGFHF2NrR0pCylf2sO+xggO2GwKIumom4/Bb5q7roAxS04Y
VAleuJ5b60RhCDS20A3cra7L7Izs9t6ZeSIJDBqNLJDlqD6rnIGFWhqsJwePmYT32vh1ANdHaB6C
kmzLIaKfPS5LUEgDIe7+Xj8PXVq4Cx+PjbreXGaTLHit50bghm8ZHAODx3qoHP0hnpGAJadRFp1Q
wbWjB2ogrlhdnX1Y41oz1iElQ6ZpeyZKRBv4Ox0hQPPibD1PYxvP1MoUrHIZn3V0gNhotVge6Sp5
W1KaH/8nGUumXVM2vVSUcG42gU4k87nw+wYcHqdPP9R7gK7OClBufpL2vlKYnKVdIMxv02J6SwXv
HG7xjLrgHSl8YU1yZCQEoSkAj6qLrQ9P2JqBQ0G6eE9u/VpylPrFCFPQHZ1Or92tncNCwlX9c7zk
euHiiO7cZX1Oq9G2YpVdPrJffxfBJxBGCgkq+S7+euBlqDQZXspfRq/7yLN5TVSb8wiFZ2s+GkwY
7S2DgGuCUuXWprOfSRXYcFRAGojuhhomQq8ih6klp1F+7fBiuJ186hWvc5vlgQs8bjSQRbuVif8Y
P5+OfmGhNnTDMIfDPNPiIQVBbsuvJTDIpRg4wTrs4dysa9bwN7uMt0JBv+ufYuL/S85oKVuXWIkr
xekxHShuOMsaYrzc+G1DBdwpVZB79Boqnb1BThC9nrXlq2XAP2GlTxN2aMbDR5J3F6PZJoz4Lg9f
PwvZiATruMsZLvYyZjXs8T3tLC2uqaI9xnPBnS01sDtIC2QzpK5/wOXoC1ZOsik1GdNcDmC19mk3
YSng92po1q6k81io4erAygVy0muBysBZ6/uk3XB8WEUNhSXj2ASi3TjmBDMQBOOh1xxqcQ4NGy0w
A2dBAikEbqA4iM7WMlVH8dl0cXEareYVwqxQIfwkNviyBLGLG7o9lQnbtKJu1e9pxtpS3wzBK8K8
SmA0MufmCCOKW0jkucXh/Yids4Yh5CPRKp/hxkOTXtf4gV6nJykzLn0Q/agP6jmeuSEyNMhA5Kk6
zveITOBtt0aRYQ+t7V6DKShVoFH42yZ6EEP6/VVjFM7IC7J7Fr1YWh167gPY+PF3JhoxSXGOOrcq
jtPi3/HK8a9y+H1A8UtVC2Di2WTQUoza6osYZzALZ5h+Vdxcdyuh8phuBQ7iaaHJvL2EtcDsUdBu
I4xX5ftQVMBpiDlMM/PR679Y0dCF6egAerkV8MZivEeSQeHJDWn/K8P35qqgZ93CMqPZluKyWPUV
F0wHEAGZhdScoTkd+qODhIoBvcWaYGRx1uh8ZEB7BeTdXNFV8oKK7mGTCMjYYzJWJdKg4BOFwj2y
/oy8gkAoKCok7AfktTx2Jfm3M5sjGz7lYilIv8bATpp0syEmjxAkR+j6vftSzLoUKoOcfwVM2A4u
kFEJmyuRvdjhXkf2Y6hvKxLEvBMS25EURal4EuQWJKsPRD/BTXZqwwJGblMqPkZgk0RDYuXhCEOJ
nmxO4EHj2GsQ2HyfT0p9kXOvSa83EPIP3+d0G40V0lo8fnMGDAl1k8nrxMuvEMG2QmAULX8jd6JX
Rp8wvLqhD/+C9hpVcM1J6tTO4Le1SeIh1Qlfrj8Ee8eAR1bjmhn9fZZchl91rlRxlZxKFJ+l8hRK
/Ou19+Vaz+d99i8fa2LJgb5Ua1DPAN3lK+wRqTR6muGHaUVloS7fn5kSWWKe69zr66TpYuRWfSn5
dGcg9ui8ZnsWvS/CbOHtaJIokVWLdHjASKf9K+gI1dprZe+9/pM4t0h0FEXC0EeNuB+s5/EK/7aj
17nIiFldNHsHGgu91XtOrTwAfHOtNzEGf7+4RhflVZuxmHXoftqs4GRhgBITYJaARvWVzOq7iyNG
wmYjw9deWxj6V+9ojM8DegsOf0RJnibmKgEZfkYKkogk3ZWaBr5VpQoIcFU7qHmlvkEE4H8btO8Q
YEwl59vt5cHRj1cYWDlACjPUDDVC+VO8UXWPo0s3Y5hnc2IiXCHG8lwfPn6noCb6ZmkLttQF8fNp
fiTcpgeEOGn5ho62MJ9Ku2vsj/1R9f1lGABNoVWdji4yMsWxjHW5fpgiVcE1STR7Fue+Z1K+ZX87
Z7tr2oJWB0sgQul8GjZd/2kJyEzasi8pmi7/ZNDNSRhRSf02+HFOtzGDur8FLa1iLI/6OHNRm8A5
E8TL4o9illgLDsrnvQMpbSkaCs8zsPLSP7Jvvl8L75QGWWsWENdybLTd8ZFK43OeIq2AdpwtsDJ3
8yhkNNzks3QxfMvIg1o/D/hBVlYTj9bPNL0Kj5irU52yPg/MxYT+4DkxXXWexq3e/UNtVUGb12aV
1RnfnxiZtxyBFRtsTzQPYQshYsgPvgmzM0X6BWmdGj05RJMhREBuW6AxxaWgym1btSdmJkLnlbaY
omaW5MZe0uMbCjg51Ql+xPaHyPdYJrdMrKuoUhJ7aaRjISCicDeAib3SNkrnFjTBm+B+CcOV6Buh
ZpbRMserPmIe/OvAfozFh8/laQ7za2wQVMIddcMcJODRYkxB2hMP3khYxffJCPPyRaEes2xMUs7R
NFa9FWPM2Wup/PEp/4aocqT1gJD2qirIO+ATynqXrZWT9TmeP/FjHnHoQxqvIlD0SDQmUqN6Hp/y
TvlIqzzC7yT7oo4k4alOkfaW/+vrW4Td5X/aOvK8cbT4MdVqisBAe1S07B86oF5Fu3nRKcRxStL2
Jmy+fwjou2DTAxcZTSGphVXdahsvkQXy6fJb+gGEhQhlXZUdJRvVZf63SBmzkLe6GWECQvovFuGw
QWv+JBdpH8SXckKQiNmk2B1JL2FE0Afk2hwn0XFzGDXQpzfeGec+iflJmCYMF+cm/WcH4g42Vpoo
gjtlvlBiQT00LzDpQu/UPCa1PihIjrfcqYI6WfLS9X55orqvqDVr1AlUiIAbBH8XqLzqWvz17gmi
yL/o7z5Ey/CPoE+a59K3Dj6zgQbUih4dEaQexN5z/fbw/x6GKBIsF8jTb1g41e+S8WLzJiFDLXrW
wKH8YVVzPMmiLlBGSfQFHIu0AKzye5gvOVw0lOpTdFFbPN1ECKKzpL+Ds9xoMNj+ZEDz9fwu1gJL
wL4SW7zJKCCLj5vUeXU2pXOrL4qRPUuB8/sCwoyOs+2z0wYl+XIoO4jrhPc6MWf1gHUr3nI19ZLP
OC4Z1GGM2S8eRSDIZX9itqn2q1fUkB+oSPCuMZFkin/V8lfiHrGLE5c98qFCdB3Verwh9+pTBaJU
tz7aVY9kAb8VcFDtMuDHg0VVzfGwkVK8gdxi3MlXzsudZJKLOA9sRKpXO6JRney78AHH+as41xXj
C2OY/0vR8v3EfEzrw4Qk0bNf4v+TXj/2Uqcj17y+9BaYwKL3ZAqHU40LbW0EDjHn4N8vVbqcx1mc
RdVBqzAfNtVj6CTr+hYwVAbrdkqHJUs8FZaKUmUF7KuSMT8QXOT2zrhBfXlltKkfOboj95hPPYK8
fbz1NADJka33oGBxSVWxRbmmm7fa0+tlHlLXxCWfrLD9nqAVhPKwrYJvE47a0Wn5n7RQ/GDqV9/E
bVPdaOEWYmAFauXlPsT/92p2yGTVqomcqx3kvwU1ax+uvu3gfsUDNvnoABjHH2s6P84SXCyAr7Kl
0YHA00qd7WTGGomW1EJZEg+yunacU6rn0b7dJ38m8W0tABh6uiSoRgPqh/WyRbKMyzTUyKjRJjqy
zyqyGjLwiw0EKEK5baStlxZEC9nbo83IcYfkFvW/jtBWzhUCP02CrE6Usg0YQt4bWi9yxZYv4WBL
oGouuDMRs6Xp14qZWda7jJ33L2DnvXMnX3Ibe7zjj6HeNmPcABzZx17W0hZvziypqZ9yiAQiKHqT
gJoOSqL/9cvOHhSV1tzwXIHAarv1OqR1q+gx5nanL6fnpMTAWpUwZSExcnyN6BDA+dQrGIkC2Dav
hCyBJk/tDunUinzv6sOpLq1hJT9jB9vQnD0Vrx4Xnfr7bpWDazrsjJ7fbGSYIX5WIQfdGWtHFeE3
05R0Kwoj2SbiziyN7EfzoWQ5qNpM7bz6qig3W4AR1n6PGBDlWJ0iOe/z+dqktjE8H6YBzCZ0DWfm
urBvw2AVaykxiv1o+Zf185FrkogfT4wH/uCMQDqEtWssSN48/lFmvBqF8BlJ8fOz4Qkc8JR337gl
zF47VMJOnYrbIy5aD5pck0pIyrVHA7TzPLEte3XivdZtrxcDrYAoSz6f1mJ7zCGrtlP8rm1XHBBB
f2nvCi3z9/2McAskeTToVR16VBMLHmpNg2D8eH2p0UJL7+764dU1Hu3nOybvrs6feFWNrsWIqhOk
ptAcclnv4r2rEaIGLkAcStWpHc5U3ZNdTpzq5EWB1xgsBK5dPOu/dZgT5Ial6MILcrmg0crxyg81
z2txtet14R+fnBe+O/Q0AGioeQH7h4yERb4BwEwcDHW6XqjmZG+EAqS/ALXPzjyxeXlWzSo9anJ+
xgyxVsTyQKrk7ltJXs2rO9ZWSZvh7BGYbRS9WTSEOOsMeUkLrqekPhn4TeURD68+g2CR35DWSh1V
5RXnx4PRrHcrJkmS7nk1FnuMdrfq3S8i09Dh0PcnxRlcSdOJMz9xwIqgAZUyxvcMretrNY44i084
cfYMERzQdxkkjR6HVeR+pijT43B4+ATfRWBjxcKucEw4abYKDg5J6Q7J1UyJ6G8IV3D0zuqiyhNv
uo1a7M8PugrqVEKc++6LMZ1yfokKuNhIjlOrSYmhbL4ovXUYwne0XY+wrdxysKxJQgsu11PySinr
CtWX99NiMnX0i0Gb0ku6Is2DwgR+Q5j7LZjoXD9Tij9KLUM0lI34uIQNrRKkr9WZmjkrfZypnK+p
esHIl+9giEddK4cRwWimBcFCKKPwezNtzgFAfR6Q+HG0P2kQEHcfa+hCgF3lsTBGLCjUC1OGhulG
gXFA2C2yiBLyH/EErmZu7rfz/KjWT2uKIpuHecW/WhLIYPrykGErl0H36XDB+A1wYdQx03lgl0Dg
UH17pEBfBIrvJ8Hgombxg6vubSwMn3/luW1/MRK4Wd42FpjK+6P1Bv4D4wC3ZQRxfcg5tSGH9fjC
eCztinxzikDZuFIm6LOMVwVBzVhLbGlgZ+mrx/yJ3hX49DBN3LjWi6xYytpPi5pqb4O+tREkiF4h
pSAHx4mnNc+qCFRMXZPjDeIl3cvmHT4zc1f8ia2aF0DUAwps0b1RKdhMxGkbH6CIxEnpjmG6D7xy
9Ay/RQV78JFTkQBKcRecZSDXbTAx6xFOxBEwDHPn38ZcWdBzHDdTs/oWWo8r5v2RROWErZh2ATD6
Ap84qg4/TH6pKyqvpOhrHKksnrB4vAZi3ZI2WHkqCOZj5SbNHejaPoWCgnENgcVtK4Au1X8RKOZy
b+60p7yQ6vdbwG5Otppgd7Ayk0jjk/9Sw/Acof9rNoCU7KPwlF4snMkFlB4vZhIGbjPsk1GIRk4X
MriRaxWnao7ymmrqKTvMPgK3J9rYPezu6+EoUyHY4fn34bxrVsUCsZH+ay0BpQy2/3U2GTRap0a7
FXTbszAQkZLNZ/QHsURV2hvL6m9ne8pxi2+S4Vq5KSiDEzbBz2O1wK5sJ296IWFim0ZLlOECinEq
F8tKG/0C5vHz2CQx/ff8cTmKpV4JkpiC+fnrKy5ZU3PfzDEzuk3xc8JlM8IICXxhjPEs4QQlG7th
AJBAC1N8oDzyHvsupC3qVO0zTFLNV1KY/ISLMBQ+cZbJi6ZJ9ZHQ/dKEL+6KbHeSDp36GmbxAWhf
R6GthUTHYnGg2a7o6whGegEHO1PMhSJDBvrzcXmrJPbhjWOmgEbugcDvN9gLt2CDg6ofWC7qh/lO
FhTEHIxYxetuW9rqxzLTTbBstPpNjE0OOLP4nw+P8/cxNwDENvc75clwviSyq8rVyvqgfHT7Q8hj
XYIjbS0H8YvaQQp3wBHe4sNyR18KIS/Sn0VlPHQfCpiGY2cW5bSQbkbOpP01WNwNvP0SV5t81seQ
Dfwq34yYhsIeiQ6CwEXKYFIEPu5kMLfp66XKDkqccbCvI7+tbCERdjEDv6GTxIrXSs9taMC1dm/B
m3J+bcyAyOTYMeXXbICix9wn48Es8HVoKbIcm43qeOswjhGILNocLSxkzyPc49+ms3MLjIfUhOCO
GFYh/2DGiWrH6JrLVSHd2ZwSIUmrod1uFeuh+8ShVB1OCZmY8ZwLcSoKUeOOyE1UsUendK3vx2yy
PW1BQqD04tBT137xGLTVWKBpSEITrH1A6c/5FC7Mn9AbsXkAR0sxAhxj8qpUzsJo6N2Q/8XHhaB7
GZUrCgC/KJ7B1AazfV4ya3zwsWxICndLGNn3DJiRDsQHgDkT5N9ELQJkBwSBObJBl6jBZ2qLqTxP
Ts3nZREW3bfvyL8EbtsIefniz4yUnbpdbDWeap1kPhPmODn5j0uAvwFRyDNyxBo6LE5LHPLJIeom
P+N5r/09ug1GYnt09ZYra/MbAyW/wZVc23HbkeNnFkSsJOFuPsq16+RDpnV44R6ZW+vhccmJW5JX
2/5orJn0C3Hz/q9Tisd7nRAkZ3BEu8qQfvpa+MLHqkOwAtTq/EL2P6HdPRwaTGsf0u+AlfUlpLa7
ve9EMDMaOcNVcMMwSRtXGsrG7LPuFVgcVfk+qv+DVOGjaZdhrFKaZigOqL3T+jUQ62QWBXguMrJZ
Mrkyzcig9gPw0SPEOUpla4DzczGxtvDjm754m9a5SbTuw5Z8JOtgUMN6sGn3okt1aFKNC7411Uyb
geDEXsYfTt8So+HShLcKQS8cnXIEdvqMkhAyJw50tEk1M60WZwpNMhJ59JWP6x2uxQndy6D2BaIw
QH84f9xOK0pAGtsjH4Jiso3gvHnU4ozw/ggYOIWOlRa+gIaugqbIuZMRlZcWlOGprl4Wvwt7g8vn
YkhfevSgTrgnIJxvG12cdPSeaIoILpOMMGlNp/cruC1t0EcLb6kyR0wQqAuT00ID4R/7g6jZ9VL5
3FDa0hsjzKtuKvEcorBNiLDTBnjqhhSj1dfWroo4WlYlzQXaB2vpkBXKYGq21iJhvcJ8l6Laa0i4
vKy82cFI+xTVD87wZfM5hbCFeChb5UDbnP9Po2JWwbmm04wJBW6y2VFR4g+dNfECeWtnO0eMdAP1
yz2J/aNXWxNFvyF/MrCeV9nBDdExeyudEVGO02UCWOpp0of+NnO2MEj0Jn+nuP/FoKOSQpYoirvb
gQXpKUKShPj+jdxdtLlY2878X1CJrw5xSF8hrZAarkgxVnriEGLRUPFsX+1pX4NcpylkjBvlH0Zw
NQz/TACLAwaL0HOKprR8uk+1CZWT0k8Mp9yQa7Dx3F/i/I/FedcrxnylH0XuxGlFSoPGCzSL7e/G
jKQ6OgkjzO/s6ZF9ts1XBuaDb0wnlzQvjm6nCJuPKkmq4ML+bwSh6J9qBU8Rx8zMZvqMATr/w8kg
+OFN6MmHv1z3hFvFugTIa/KF5LX2JbNj81RSHya5qKyHlFrg/7VFRvepFKPegltFBqhmZI/BhsTr
6xMfQSw6skEh1P8+noRcovTBZ90r/w8HoqR8gewYfqtbWKBBJdhl7lfmnqnIXdmpfgnM/pny1YK3
fhIuyD/AVZBEQC2YN3MzQmlcvvpyT4/CWdQmXbsmG6bUNoZuMSyLSvIB/F36ox/eZPZ87sYwmAWq
iAmvSnMd6gVqo0YGkURYpAKUsqto3qXJ66KCpSFJJYy/nnnvoZ05JMFJ64UiD2Kjru9MDvvnsVjS
1wFNhGcCPGkp5Y+HDMrC+dpPe+SZsT4936KNrRG7p6ZR5ZPk6m4Yp8auHX0oQ9P/nSpF6k8DPfiZ
1u1gPHXAOPd8wo6yNYhwSpHQuaqu0tN4oSq9j9RlWAyUlDd3xfj9j5MRE/5k66xk3jPHH9C8Wioi
J72bo3IH+o+Rhx7NQDhqHUh78APZD1zG8tH0hTF3ukARcOP6H9w5HT42JFebjE0/5BTLl7C4t83C
A6Z+g98/Txp25Xy3qEZM9DqgRFioHqi2nSpJnq4H54TWYQLh/HNqH8shUqQd7F3xUQhk146Oi5tQ
S5rvhOjJXfZlOKPcDwXSgkrfX1ghJD+ZmIOG0U5FUtWXk93x9CF29ogwNxjE/YYGVdxlVAVEe2Xk
qqxStFb7FNYgjfOkUpnKu5MIUdIzucdSK0x7woaHPw0udRoxabSlh/VRQjlyNPkWzVzlePeDuovu
ibrKi59Uf7rPoMK8RgH3Uy4Qe9tFG9+F7Kc3nc72Snl3b4wzghI4w85WKuoELmA6tWshF5v+ghnc
j7hdrDHezQRoDu1v4VF4l0nu1F0jkcOP+pha63lY3h6KwNKsmiWbV1R1pVGxD+uGdTNqptVxbZ9r
gevB+Bks+A7TnL9ABA1ptSgbTvoTT0uec5gtZcmgDF2w7eBErD5j0nsxsrXUj2dfNr+SChtaBy75
F1/phiEf/AkBsTQMQZwKw/8XXTceUtmY5LL505i3rVHWjaOXORC45ZEJ/o7pY2fpE7tFcXqlXg3A
vM/bM+zTSarMYATRv3kc9N4pnrMhWBDUugk9psKfUl/rojbWWLkHo6g8nWMkhU/+2z1SXl0QZ6Mt
LvaVVgnE8iI7EMVcQTafhbHaES73Oc2jTveYcSfD5jN6p88Nm1GQOjRTtos6X0wtzC5e4OF6hwRC
cCrDIuXM0gvF0OkaUMmlz20d/yMs2+VhDjeTvWcxST6mwCuLclyoKc/uLGzUnzjVi6z8Khmvs72r
T7XhiLTB3j40ioEQIdwyDH0yO7XqIFUAAoInK1fdjipbmpiJ2Y/iM1u+kIgAWnyqHBNpz1htTMlM
hXCasG9T1zoGqduMZefpOyNytu6TZGirUYDKdB7n9lqwqF6A+zcqqLhu4IXaKBS77lDDeGUEjO52
nTVkBjqUv1vGPdotZ9imEpVNknarlBff+BQteTigkhpfHfJ3VnHFjpGrDslw/P29LXhpidNoO6Om
fhBbDabYMJzNxI3DCqQgZlQvHhZ4O9NCPbXIe6FfPbH9wHY9qeF+V0A4Qyr/dZA/QpiBlF67IjW6
gB0prPrc8Sq1WLYeZVXlrpx58uXzSVVxa0jo2U9qkDTR2tqkAjH3BEgiAsVShnCHqoXn8MWW8e00
Wak4OkIU1IAAThw0yIUmCJ0DXLlqhhh7bfZN4chO8mI5YdwHenM4w6GhTBXeQH+EBLDszGY9KyvX
C+EvxxSMhqKfT/5T1OHOhiG7uFjrLxNbwXwcC5/bUjI8UCuFnE31w+rSE8ye1/L2HYauWYsGiJHC
ZixI34HlbEJhQDs9ZR2F4StkXAVydZoYzpQhGogWHS6UISB9PMoaRNF4Hn7+Zg1oJPGDonqlGUnP
FqE8Lym/qWNUJZNCg7Mf9IcKV+Cz2b0LWmb05rcp1F0sBlUULnWfdd3a75fuB03a8Qk5vR3A9ctf
0f1N4qlS7W6r+scgOAmPk3tQFP/gBp9Q3PjxMjQ5DrfimoogoWZLA/SS8elYDiGF2FysFuFfqyAA
iR0ESb7pNzlkwoJQHPXB5ZWX9q9tRXhhgAjyaIf0CkinNh8lvxsb4CJHdQDqHMc9Gc1HDdprUGhJ
5NNwq16kAvMDN4up6RdiL/isPaZxEfpNMZI8Z7tiZbjMGvG8BXxwndKsnMIY1b1fg29Wat3l44o2
HqelYc+Z6FYeKcJ1+sLXgEqmvjFco/YNc9S8/51qM5BGwSdV8DiVAui67mMRmqEwkQK/NtpP4Lra
Yl2MvfGvLwVlAclc3QnkBrNShdqMuBCPyySH5601dQCtQOOt+c+rvdLbzWSgCVkKYlP2fjhA+olv
r6bL3OHaXhlRAKfAR4ITkZsXT+8j9jTZYhNHjswiFs9KEGRHcN8kJ+U2LEIFXBUsNMU6JuU8RItX
VzHUwQCLMSW+CAZlxJiP7d70JvblO9f9CCR1vPo4m8RFvT6HRSwO+2KhafJeZV2GsatmNSAEvWBl
Tesq0HJvzVw3x5FeKJr1WBaCWss6WXFSZCwcP7ZXom0yZ7UOJyvUan+x0jTUOL5ywzeW8fKdk2Z7
P46KBbuHsTQDa7WirVJDCQ0Dq7VnxhdgrskfvSF8sNpDUiYemDCBKmunbo2upV8U1f84pn6fqaeK
vlH0mUOqmUGVSrnVdif+z6gr5Qd66dTydpdBV32tU8y7qAAg3ZgI9k/MkVtfy0vLkgN330T/S1q5
iUoYMAFdl7wi7XfpIareAThKja7fS0tvvGjKyzkHMWoTtaPwYE/P+SNtTf0NnMsDLcrIbsViumFS
qci3G31oABmiIoZwRJf5o3MXKWOsgFBMmN6KGMJvjyMhF7OlbsFivs7MyKLHXvciRQ7U86eG5l3r
5jOeXBQKsOsa+h8Iw7Khbu1Dd347f/NJlT/Oacgkm3Fb4R5Cwt3TGXWPS3xvPrOYbNqgOIN890ro
Z44wpt9aUGlht+pKSJSSRY2rj8EqGLV9oe8C/dH7ALWsUurruz9jd6j0KVhumU1mA5cMXIBN6THe
q2TOMOi+0g1Lf6deVLBEq5P4YkQp7+8WpwV2yo9tqQPARSCqycnfUKuf7qGOGMKH+ZxTHl/BZb0T
BSSz+QzZV/NzbKciGhL4snwML8H9bVjKxQK0PkSA31uzTGo/gQKVPcLEeQvdNI9cq5LQS1RXQzfQ
XLsabkLwXdTJ/FMW98VWKwxjLPO86vh1fK06vEJJX3Kia5Twlg3keoF9WDNFzKpyFqmO5vFz7tRb
c8S/qm3PWMgPTtcsFa6v2K5KZX3CFhR9WEnUNEwffEdlbkYlFGCRHK1/dxEak+p7kUOStCe4l7Fl
95E3W8bYuaouvhtdiCfq9vTgzQCROIRjXsZ92TFDMUN6VsibMUscnN8yCDxlvVtoMFdvO9dlxn50
lOZycFOMKDjsCnaoNsbYzS3mcjTFEHwdSsmTBhCZ1WvXyOU4gvr4ExUwpg0DXVBahnsS0Lojzfsy
zxZnzVnWoOA7L/DcCcsx+DS+JNk4ugGlEpFMCIR11yH6PE5Nv4VSDf9eQWWET3FHpX2JDGSuZBzc
AZW9knTXq6d68uTJEgDz7ieE1X6fs39+E+P86vDzleceZoZtM4surAxodr1uGsJvPGTGRmddR3JX
bFm0JWXUobAvh5cMSXvYbFG788zSUQZOcxExFfzHmQwrShsM8utL5oGcCejvlRcIjDIXrOyZrama
qaVqqbpKpOrMx8zLwT4Au8b+HpzxZwVVgA75jVIRh/ah1kxHN4/D0LsQp40MIt5T7FvLwohNmGSq
HNgorHNTXQEiKX5ZA03HOUhgxoOB1jU4DjTKtNj+KA2myFLwbBjlUhyUVOuMRcLupINVBKI72577
5vlZP+G9jPBMD1zyfQorEUZCV9ajY6PyTNpcBH89tIo3wqf0mIClT7UBJ4vs4DwDZccWVeV9uTLy
HP+pJTZcYVH/4QP0LETw9C0iREP/FCF1Ai6+RQhZo35Uz+CyxCf2Fb83asZnJ5RPj/FzMCPKKDuN
2n90/OOGZyEUVzsUFbgY0Rju4f01One4q1nIIg82mDxZI/Wi2j6Xvdz7v/MefuQzh6X4CMxOb76x
MqFQZwoqBssSGdSewUFCb6/JXdu1hI8b+x7kHZw6DOofnkJ8fq83+DuVP6C9pwP9bw6plbZzj0eP
bBZ8FT4AYvEOwZqvher7POuid05m0dTcx96+gohyybPqcQh4UUDcHF8V3oJVvSL6lNRXAkJEfh16
tJ252nLhQLsugbb5OESSP2l9WbDxKBW4Eq0UZp9pTrngzAIYFzC67q4TSYDiqlLYzMUK+BxoaIvd
LH4eFMdph8/CaLETNJ2/sPIcIEZLEuRg4T9NGW4PjUtZ8OIKR8TPR8AYY6Ati/GOAlcAnoN6A7Oz
SL6y5FZ3SJEQrtGWXxi8SsavwB12LdWm23ivtAD/Y7hmi+3hqBG16bPXGF1fjzYuH2rJbUcLOM8r
TLzm7hAAzgTCt9Zpunk4cxWvyAw3I/NQh+5hXQCFQolm3cihVMo9S9jw+nDNrJPgXPKMkwYKP1yS
xyHCkB1Wc7iv3+lY6a/4bAWmmJGwvY8ToeNQfsQD/XgkdqUQjEKEG8bSYr7XyccwK7CopreB+ilg
yP2ycQJceYjF6ECizu02gnTMNlMg4RdI5o1/eKFLLGezdLIC0lDhrHgfH+uyK24o4w2oWLzN/L9h
LQXkqshq8EGQwmj2LQU2m70l1RCfZcdV1MmBVJAaohY0c78mTY23fhrL20uMEXLcX12YNcPlfxI2
x2EHD9SlsS8nYHncIYBRbjPWKcAt5lmCJteF/OmrV3tJNSu65uy34J9qXsJZ1PGTe3hV2iVb9HzJ
FUuculmmACz+o+W268Y3eGf4hHaPWx3kHwRiEL9vpLI1tbmhiE0ULz6nJSd+Fmhgcby4fLA7EFeB
gfYL5gT+72+CpJukPnJ7590FQ1f6emhIJHx7+ehP55e3cC6ShiHFxv7EodEeeww0wZq5LDtjGtOR
ereQFeeC4bSG7HHiPAmdyQNj2D6tKhZQO4M0BifbPNsvIW0J5Yvwxm8QNjIu83Mp92NeDlXk/zPy
xu7EryUZmxp2lnpjK/gQ93fUesC4LvEAMgOoCq2eBea0jnZ/jPfDps6/ymhnG1ZAFW1g+x5jrKs3
48XXxMnSrbOZ72JQWZhUw1vh7fad7JIodfikYZR+nQuTRdY2IDGGYOL6uT7E5+8nC00h8qYgXUOM
VT85saqCVHIybcLNmCB8KP0TNE7pXldfemYUx4JEJP0PKrWEMEZzuQgyKHcot6FtDoMh/1tPESGc
Wk2UrcroWZre38vHLZsOEG5PMkTY528Zqey3c1lAX/x7DA56e3VB81dTj0YI/LXJiO8kOPDs4Rzd
TKuXdiUNxCUMr1OGNHwsbl8sayRb24JJMlv/B6mlL+G8MVD4lwExG87f9bGJTBZXwh81/oxqFyQk
VSXmcm9mikaZQ/1HXE2F/RzLOliCmmELeMHfRQiRqf+VeM/K0ofMVoUmZ0yuJrwd5ept+0oNaTOH
9pcRZDjhdcDiYOuguTu+Tqk5mlUDviFstQd+3kD3UGC8flCN9HXKdT+Els609q/CG5zUXdyT5KlG
MOhJrTE+ocodw9Dn3RqBJha1EzGBhfmzz/vG0uv++T3pS16Vhum6vhUAX89i5niczTics+EUBfXK
Pn+J/kHPQsmPEobdygNx3oltkUVe+je5y6rGMy1ugwFjCbsz04UsL7UEydnwdL1veKht+CI5jDzR
syh6ewFRI4ySWKjNbOrYk98L45iYxQtDnN33YKGC1FqZDVxbekI8CoiuSn1BESBDsS5N1+nl4Cfn
TO5ub6IzBucgemrPgzzFBLQsBYx9K0EHQAO3Zq6KxkFS5sA5Kd5VXV4X5J7pWmGh72x9ELb7qZBc
1uebd91YDCdC8AcdcVuA98iynkI8HC4kkV7XB3B4G/wrWtESSpLia+KzrFgqIs3pVgsogaEr3nsQ
ygW03RtvQUuzyEztqG4IU4EXSwKJUaTAQv2glaLFDldttj6VPlika+DhwBUzlV/OUIF0ZUS+b8bl
YScGfcKb/kXZkUPuJlcA6wok8udQdiOle/34yW/o9A0v6yDYwmGJTOzb6mmFsrIACkF5ZkPs174c
U7uij2+8PmYUPDaeqB8hcgteTSebdU8L9DowkgTNxImfcu8hGGyRJSwMqu4Npm1g1WDcmYYRB8kg
Da915iqYqXXE3KMpGEESLRXy63nPMorsvBtzBnEVC65zzXo+zOuMkKUrV/kbr077KJ7FYVpsenZt
rg3rESM2zhq1V3737mG4XYc9v1V7CpVTxFiVpmBKV/66aeoB1M/mZMgwx1b3D2E39+XU5RMZBb81
IoJH7XfXI9H9RhLjIsbBh+NISweCzvRJ8ldB7+bZLaneZVdjFPK7Z9IHI026woreusWmScsZAsun
NBsUrYcE12VhpY2oCNgSl6cySrD4WQ9KpShYvOGwW7edx7zsWugEUmjEdehbx/CImQeM8SwbKfy0
uf19aGqGg6Xt/Yh0C4BiGYNtfYtCjx3mKoVn5eCNQpYJ7cBfH3QETaGq/HtwZq/Z1cPYZOEsl32G
JoxxdUhRmRey7jdFKaLEgB0manzNIxuRZ+Tl35StKxiaQySuikgVB89Vi+RJiTJtUx1Qwsson202
iVed6OLZ65Br6C0VZVgNLPw9t4v2vXFWDoNjHaiFFnR20mwBj2MefGKBe/u57F79nImWjw7L7pP1
D/DJ2QUjCny8jeQf2Yo8FdBkCpPr9Ayt/FjWpjO3x0nug3TKQQW5Fcvz7xmTtQhuGosDUQXO/sAB
DMaZU5En/swS9JX1TXKwdQBhERixHRKadPToAo6FTUEXxweSQc9PLYUgEUEwMiS3F3QjRNKGgQ2D
/1B2axifSgzRF5Wn6IqQUAr36C/6yxCiaSwlqwECwDjXOmoxCaqIdoZ0WYcSnScDINd7Tfbi5HiB
ZiLhYfu8KmwP34O1mvJaRuZvb4y+BaFQIRbBmVW8pwdDyJZK+eCKBAiFr90kGt57PENbJ2aqyG6q
b3E1poOxCjtjHLkeo2hqfVwng563P9Wwi4t6Kf7oVDYMyPAK+RtmAnudDG5fKxHF0qvdsKaDh/yt
PmaaOGNPPGu6P8yGfFvEO2jJpfCZKaBmlPL8cxdl8tkJtdCzOm5zq221RhyJJaJVZl8BM7Wfk1n7
mJ8hzlpc0nqtmoB/iKrzbHEAXQkz00euul0OhwWigFsxjSLZunENZPPXfqPDodljGwcnOtTHqRCF
5uH9gjP3iBfixJCzikQsHyrKkaxvFr7QJKqwEoEJ+GVZ2AfRS2vcEd/Qh8bcacC1wcJTrEdjlI/Q
fcJ0HOpBB5vZrPkPKLbOQK5yQTwmo1pPAqg1KZMQGtuNNIYe0adejmJ4bAXA3w054kjdaS2/0xZr
qocu2iCi1CZv6+TqbYIWJoERabe5qMBbT6L0TlC0ZR4M+hPPBZptDWsvSsmCHRQHGc7FBD5DGZK6
pR0ygy1JihrqV+hAvHZ4/JqsY6mAflf7lXLKCUGU2L/msuALEInyakOY/4P1Gc0hye9aCo96/NyE
imbuld2DjWMHXIGx+/kGQ/5pe09uE1zudyxCUMsCSjvaQGxpCtnmEChh0Fk1EAs9u0TdFAcq5crq
HxBHTi7cHS+6axQWeYk4mJKmhfsvHtuZ8hcoXn4kWi7oIGqyf9gt+hfdsK8XfMLnq5VgonX5fdtP
gJs/CAofvx5RfMxwVnzSTsP7UKRQH3VfwPGjxJE9HWgTb/dmqhkqKpud7zMdRTQZznobZ9mKS7Nv
iIeoV+jIVaTT1LKiuux0jZ5qoZyDK9XvTM/W+cxFnQbeGQ1mm23SWIwHxuZNhFj9LWAiEjZmXV5V
YCX0HVdrPZ4dEfUO8rNHxAtn5ZxDNhJamVs8t/aEz4gaRTKm8ifIzCBDYLDKHlsQsr/bfk4tLCbZ
qQw1WZHYGIRKndHF1iH7YiRb8ywzjurTDSZupu6vZZG4BzRy/H/eoP+dNIkSIBmLX2a01m8wh2f7
xL1cThqv812+d8Dr57PVAlqLynkEwBHfC3z5Pj75rmyoqfLX/AcqqJbp210lmrB4bPP0cGfXs8sd
XytlNfc4aabSz7mc5z2Ya3VgmlxtZ0/GzqcGLMeWmGW+GXybUZ2FIs+4M3MKCIeGHBW+GlDjDwoG
gaPMPKlYYmeKr1w02w0beZuWcgHtNc0jvPYz7n8zooLxXXg5i12M+5SFGcv3fKhd3vpKSvLaj37Z
nXkwor8eO52R0Yqq5M5mZPc0PzrUs4TjIjZixKpwF2JhAlmiOO+h0EO12KBg8FKQ3W+R1ItP4zVF
qLbx+JJPou28Sv4JGAV2JDQWYzo9oGYjGMLCC6XRNvfEGOCdu9N9t9Ik55qB84GVjHAuEG63+HOE
y87K2dHog3T9ueLGOhdQMP+CNSvJVerE9Jh7nvnzcICDtfC4yoL8kMcWL84ErablcGUS4FFA0L8U
sE7cwOwxDIpDFnekhp3TaibXc9v8JiwMBMgnSvuJuKTrBqGzEPZKaJ+8UCaiGBCrKind2RZeqN45
SjclyLnlkwfnQfnYB7DfCD7fBISarXlXutiUeYqDvYuA9OcSdlofgJ5eKQiBPLuNe++5rmroXB4u
5XHz5Zecdj4CFN3TktMUFNz5mdZRGAvArY0MyTN9NBaxe/zdOJudfPEb1Zahf3zLwaHNe04iJfxV
T8A+IxaRPJSB/ML4KWD+0/aRz3cR4kg6f+uX8ny45EVAioMBhe2awBJ9PCsfXV6Iy4YW22wq2wUK
JaHfUQHOdZSm+UgT28TOzleJWSMAPHqCPv1hsU+EInbQIJQaGGx7bV5Wlds3QCyAOXeGkUa+4Wnb
0XvI2HqrtskNmU3T+a2OruUG72RCNaIfBwu8FW1tAXBAcO3YErzqc+5Q1LaNI8GOvGm2bkZar+ee
FdY6vhXgcpLx8XjSklaYku3ra3T0dK7gx3D8+nWIQz4xYuzC8X6X/2vS5NGuLQyIQZok7tSyKZRd
HbDjshkcaEK68bwqNi4nXk+UMMQrB/K0oZffnKYlIKEbjtWLGn1WMyFiBfS6axv3hWw4NxbWm3V3
itn/kvHWa/qMr9i3Yz1UEtwrDko1FGgFVBIkue1hgNNYPKTaCR2Nlgx6fUcZI8NA0b5E2Pj/PjZ+
iWqlgQeNzo8z5L5IZOG7e0rt+xMdobva0nruHN14umMJ6irOL1rSGPV4JHEZLNYh+yIzej7qsXdX
xHlpXhTa75Rha8AZkMvzO/i1hVT2812NIttiQF2vkDZ7RIRGa95r+f7PIWEzh83TDC1NvqTmSkri
XhGEh1pXXGlxqx3vmYm2ToLUYJx6bb2rnGypG6CybzNR8Dz/ZwXIHlNsjUytNelqS+JRZ8V4KPKX
/EY50caMjPD0rPjAUcM1xHyi0QatiJuUiAAsUGGyky5AHpr5B4Lm35lEPTZafMwUF60nxW1qtJlB
ch1P7pAbQf7c6zrnMRmJOCjBBS5JwqHhj0zqzSJRDx7HwSeelS1JiYCi7GQslNo4K6WghmiCYNyG
3rRlN2EMj86StAfuvvy3cyKUiIlhnFhkLPvkrNYdiM6jWNEIT47rqRW0PpyWpKuizF5ovXq8Vgkr
/fn4nMEjP7C9NqRhooSD40KkOaullkVBlxuH4oI2eNwxxw8RqfICpzk55vNah9fl1+oN/FfxjbcZ
drmNGFivW1ckXFazryvi0SHKPb/JbOhlH1x/JATgScC8aau8ncctiQaMvOyppSyf3wqL6J8UbnTg
XVV5utZmElBYch0MiCDfV5GRVihJqJN4JlcJE10qlRF94Pk99LzEvM1ZfntThSA7KewTfGTr+XiE
jy+ZNTrojF55u041I4jTWsqEmDga87wDMC0Hx7q2kUJxNHpwyYstqAMiaxP1jlmaexAkoJLrc880
llO6DxJV86SL0/R9wpZbXmo/H/QH1/tbb92uBGttjLbw0ljHqz55CWLUNrFDVGHYfy5iF97ZZ/DT
OnqCDZqid4IVDWaGTIylPH3+vYK6hreBcRoysBaqU+O72MLLfuttrPpSgywt1O9ipaRz8XViECn1
bGHt9tm9IXxepwyGhX1NDavFos+7pHNjI5erpJfblJgc3Bhg5jUsnR4QOb+EXuS799xGq4y9eSE4
WZgNaEdO3aMQpkIrKBZYUOsBgSqkyW06r1atun8zUbvtrHzFooh9yC0PdHBL33vIDtzY686TpLP1
+PW/cmN0fJ6jQW/AMxe4y0ezP4OYhTk923hcPf/Vlsk/ppeevSsb+PGoQ4EWNRWfj7D1NemSqicH
dK5euX3l1zwlGV3dgXo+YdvGdWbewdDCELsXyKAS4+Zm04rckIBxGTfKnQ+PQJtkNPK7aose39v4
RqmiNVVHmc/s0NID/Wr1OP7qeqiH3mqMjpH1UkXywrq3KM2uOUmZHCl3UNUK8B2DmvVk/vg/uvpB
5LgKNk716oAheVwgTGwYN+F6CNOoWLTOdLWaqC2avMQFqbCkw+KjSYe75PTZEvF2N1ObZZgXAX3v
0ODT9Xw9FIKyicAIIv38YDXY/+eQ/MQKPUfIaEBAS/LV4L78ZgiLDo3NZe2mMiokroMrSHMllhA2
N+8NhWRPwZTevefz8L/k1qZ6QkHddiwREsiSsUcnNHLtysBaY5bDL02u46lFSgQt5q0eP+N/JSSI
Ld4mm6CbawvFoYkAjWPI6VF9sAyDekCiSH/o8R7GHcuekZcLiYF4BBrbyIIhVKqv2Cf9MB5yFk7h
VHj34LzELegdcHS727xbjNOJCnb+WS6H91So4bX6fa/iopbyOpDoCZcaiK89GyJDvjTVY3QzuEdL
2gJ06mRqhbDIiv/W2mD9vqSlqoT/UhHHW6pV8sd9gE4FCxlrOz1Pxa4RXpYAeWNkxdCp61CiHbzO
iWJEBLnL4zvngPH6EKEr78XA4ZnC32BqfjK+R2UKWFyTRZwcPvFSGxWgQk/QBWkdz37cwvwPwtqk
jFIGb0pLToLbz1yfSrVn3ErXeJTgcYkP764zIg45clJP6PUHQZuD5etGZF6nIsGSKfESudbusjfh
L5nvt2d48PMHq6SqRl1whWL7Lvc1FJdhQ5RN4Ns+wPwFn14ujKWXy64taLcGHw1thkKaFqBu/Ec4
4K4IdZwKBJJksY6sofiDVqeNSNjsMis4n+SxwozecoeGbNwr8cXis9T1TqSdd69yBohVminYzozE
1mDoIBqSq4YyI+ON8wq5qynLHfE7CPd9oSMSriGcoRdfhryBnOTbDSn13TOHSYaE+YLsdLpH//3I
gRUQbr1BmQZa2hbKUD4dh96wKqNNsrFBTiZiXI4EhOTCaRIDxpwcNCmiz7McwoGyEkKIl3NagjSs
/NgsZPt1x/hCwXteqFiIshxWzKCrNRUDtbiWRO6XZQmTtEvgYFY9LuKk+j/JQoEyQ9nW6xky83JG
0pRiXfFXg+LUdWSHQMlNW4mCYoTgmKyPqobJRozbtMwrR0l0O5ajHB9r4z3M5krAIVB5LZS+jTsJ
4rF/GGzpDjWK9mmFO4u9tjBtIavBGSigGxBjrgKp7+IAJk1T9TPvdZtoulB5455tz0AHLNxe9+jt
5h2rD5bgEAYCL9UU085todoLW1lXqJcg8ynVavn1Q4uk+LbJ+YQ5+4EubYrZTc1kRI7IK6TzBJjL
efEG6KT96YnLACt4qeIHph4zlZL1Qlsl7m+jDBsDv1Ak+DnfZ20dxHTGybHc30jrq81j/3TBS4ZO
aR8GgKtUamcmEhdSwWNxl4pB77AFefuDWz6JdXx6rJ4XmFGLGZUn3yJX+pRHEXyB+s65MhnYl9UU
rn6kJFp5TV5DWksSfjyXIUKhLPuxStcdQr1RKtd9mR9eTeGtDEOLMf8YUdtBMQoHcvgfUUWargrp
5iYLg3k9qHptIdHUXAmmxNoHOgPtSCBLnfC/P9k6j+1WTTWIRmN+RMI5ottgK0lU3Q1N9vRPHXk5
S2X0maa0JHOCn1M3yurVdMQhFHkgn9yvJoW0D/CN2QxIGgpERxQje0zhh6p+NsjTiDiw1boMaYVy
YdUN1bo48a7y3Jq49UVB9QbdiOKGOtv4r8/u62OJkPQJaImm8D3mmbHboZEDl33EoUPtKfS0xvQs
rKQEweKGb806mi/YOU+6ta+r0YvHxm4IvU68FPGd1h+NCillByAjFJDtl9URYN5RpwCIk9zZQzKX
7zuVNcBA/FniOIexXOs83Z3ipPPM4d49ziTZdhUvFO8qdagxTJgcwdNcYOE6/G8MmpwLySSeOxwG
8B8eguPrHdW+B458/WwABB5/ebUqf050lzYY5HqyrmHB+CdyuMrjYZEhrf71gXfpVd2sghxoOcYD
99p64OI+g3NSducQaeIq5y/wBDz8wFezrg8dUkFYazQnt9e7+3ow9SwISl8fFfaCKOQGdS0hRBod
CgjzSECJ0/ol1xBa5EONXGNbT8lInHU3SPe5uPjxJQ2KBW0b0TARxW3gAUGIwejDbhtqQmV4rOO+
yW0u+wWPL0eWFPh/FgxZWA2FLnUnDF2eSyUGc+2CdGQAMfEE72plL08gaJaJImq4W1UNYmUBxxGW
6/EboIDnpT3cxZAPwh5XvPSWOTTb9ZTQw8HyxFIEchw4+P9dy+PNx+vEgR7+ffRbChejilxrK9KO
vnehBrTXXv+7rf0wgjVv3eEDicqhDuQ7xj0fFmESFyiHgvk7cHKCv5b5ltnr/P0uYKvH7AvBY+tF
+mxhVXaFw7HokLLjjiDZSenMJeftflkSNoWBAa2Hr2NGTeM9SYVRPSoyja2Qrs6xPoYNrt8odvFs
2LjX11sN9hiX+mz8ZPyGQhZ7ROrIziaIm6tJEKcRpKQj0rKaRNgGr6ez/gzpTMwSVLEfPF2QQrxz
A8A9WBuxkG8QaBnmzvuNiIOtDbrZwrKnD6B5zdfqeGidP0RomI4RG4+vYUjfmGDugKSRZnAZhA6s
/s6oTbXtmh+3QzaQyKMntIGZtoVVhpEWfkSpyyL5tgzky/UvvY/SmRSBg+rI1Q3ZCYQwU99SJ9t5
jrA+FL30YUBcIwy1aDNSR1cB9+LyoKuRBHStM7sUVvme2QgmJlOxFLTR/FDhfyIJ7HKoPFp6cAoF
T4WRRJMwNkNzjIbmE5bBZ8gSfQREoLoVxN5rGC+rs7TrfmN5QILHcqHEfMzEf4jCkRR0BicX5iLO
4xSoKw9yc/vBlRYagh7Wndcb/Q1dmOufEujOXmfytKGloEgAypXzBcRYjrUWArWk4s0eLs875lmv
qHRRLg+Uaqbo9e0LtWtJAnpu7snKDDDwD2c20sjd6/c9At4MDHmIsq9ghins0yBmrsoQnFhUbYbo
z6AEUx1WgwcCH/v7rVi9iurOI0JdAKjquoRBOvAyPmF6V8tvsVnAh3TwgGP0BN49sModT1Olyv+Y
+reyY+fFTkRZ0MS7rVBagZF9p4xgsX3TaIvEPF0BU6nqsRmCnxkvy+/1SzH1nID4izTtR/xeThQY
h4v/8N9grxyNsHNDpeHnM0rCproY+4d7wvDnWaW5hlE5MS37rTMAto7XScO1jZPCEAp/Pzp5x16c
uWIuFbxnLmnUeEzXCl4HgRxaIHMRnhMP07w5TJKowS7g2LBuK+paFl6h5Sw/FgwwIzObazJlA/5/
3+FkhpFNNMrmzkhDN1jYAkpdZ0gEUOctWKDIS+5xdOw9B1b16YlaDb4KZmxZ944xyGVEycuD15IT
3xYSVqHqQaleHKPKPvoUDXHWgC3rdFktNuGtDP4bCEqZfbYJDt2Ca0s9lgwvjC9hZ7LVtD1LA93U
HDtbFOyJ2cTUSSif9lXUkAIu87a8vN1FTvBA+XwsmGHKi/SZmvIKgTh5W/E=
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
