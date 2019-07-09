// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 16:32:49 2018
// Host        : DESKTOP-BUPH9QF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_2_sim_netlist.v
// Design      : mult_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_2,mult_gen_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_13,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [18:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [19:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [38:0]P;

  wire [18:0]A;
  wire [19:0]B;
  wire CE;
  wire CLK;
  wire [38:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "19" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "20" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "38" *) 
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

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "19" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "20" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "38" *) 
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
  input [18:0]A;
  input [19:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [38:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [18:0]A;
  wire [19:0]B;
  wire CE;
  wire CLK;
  wire [38:0]P;
  wire [47:0]PCASC;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "19" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "20" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "38" *) 
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
U3raI+gQIybt/N39j6YiPqAUWwqeNWhDYByFDmEFP35DibZt87wxSv4sffaQ8gfIJbxPTHiDmp1C
Dd6ink2Ed0Z6CdLScpUDnm+y8Gi68KPGn1dg8pUgZXYlTHcg+cOnRRHsp+sv1/jO9m3NHvBSGjj3
aFXOKPMK5r40Z/D30g7SdO5QZoM6sUKorwYSLev5UAkQdst8JxmG0Yb+Dy+BYgkBB/MKjVEMdWjb
bKtxgQc9EfsCtyZPuLcZQsFuxjNYcUMsY4BNrAmf8e6D8CF7yu8K/ftLPmg1xO8N7gvtOTjE74xm
0npxcP7+7HQCnxCOObXfLwMiNSWKPQmcnQ0SHA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R0Oj8K6BEoWN5lPqC6GDVE2wFcVqN7+tbMvq5IRCaZLqLefhXZUaaE9S9nahMtS5z30Rc5vfd0KQ
wE7n/OQi408VacIJ2xvgV9tXglf31CJpORORV1p//vku43WV0YXIieNexeWQB7cxv5dpzMln6Qdu
IeyU52hkLx9435v8v2XANHWMop8y1IM4kZY/0hPNKe7aOtsagAoKIhmmEs6lWD3epKNiQwY3I6fi
zVh8yJcwHDTRPSkVxgCbwumfVgkswRDxTn3FVM7CDX1jR3hKFF4LGV+b2I7Ymsd3g/MSasAJNJcE
eAhAklZxa10z6RyRUdKnNSn9zaTaP0FYQA9kVA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14336)
`pragma protect data_block
SP4azkZjFvDv1pYsO5gyLR54vGv70pDIWBYy0QlhkDllJjYMfi6/rRzqeP/L0aKpfsSF3fEX1Ai9
8Pcy1sZGr2PWEhtykEjVm1uZOV/K/Y0iPkKXGG7AJVTOZE7bUS8XoCgUxSEbCzrc5xpKB02kgvVE
4sgOITcR0kS9RB/Ch4sLQBXLPB7yHnVmNth/fIWNIl6LDBxd09mOp5zy85is/F2Q0ZFlS6WV69v+
rNoG3XDyGlRKjMstRDnLcO95xp6fndDTJ/CqDS3zoOE3A5d1juOXE9R8UrpSIN0vOlq/Wppp6IsP
+GmicEzSIMCwcz1+APhBcdcEr7LvWFWPBGOjwNCkUDu02pWRkUGspveZksH/E7gPAF1WGEJwch+x
qnDkJ0tx7NOY9MoylVZAc3BgyVrnDRt7PrLE7mF+HS++Txeq+z9H6aqRdUTDx8EpSq8nQCdo7OkD
NKR19VR/oL0ZYoEo3lqQc3w1Czv2WWwJP6Xu7wDnt+UUDDRgrZ3QyA17FmL4wNPcn9tB/mmbVmrE
w/w0MJHMWYwYQApVQVyrGdWwiH9h9xphFmljUE1s+CFpB/G/+OARwl7nk0LTNPbA+PBL9gT9a/Ty
DfCcw3IqADJCFMqLhiEyaDYfIYFLjCDaqFCrTxM9vZeDymnN6x4uC0R/NQpgaDW4CM8V7dqDMmsQ
leJaxkYnNkCq1lChWUm4uRc9rwodJJa7AF4J6fAa2wih11H3yXgvQnzcm/CtY80d44TfAbUAyew+
mcAXOIw9DH0GA6ENQU0EXAXeMLYXCDhus78ZR6DkoLQPmNZYRULjHWP2eQ+tO/EHBl+DMlPh+PdR
f0aEIqVxbt1amEn56tK5TbZwgPf0eHpdLJXQzY9Up9zq4jFPf2C5R+VNd5V/a1wOyswCzVPcfZ4I
1ylB5az4LQ0ofhVUFhjPUjQHErJXF4heb/ceEaZbg42gGDLdLP7FxJ1mN8pzViKx8l1Ffx/8Fs/c
cXHKGxN9I5nx+DSrj0CtrpDxq5iRm7NMudiOEFO9j4xWEqyPn3vCMvyxF5LN4nkY0swuqdsFO3zp
e2GPiPDwkaQio136KGUz4KjHtrTMkK5s/7hsaY6ZGClyWy0CS477Augh4CGZXHEZt2lbnA1m/GtY
E0Aut+oIL2Mh9V0Yofa/npl/j3iadGq44CoGYZKHGaE7vFkRB8WvOunrJ3YxbIea8J+ZKqbmz242
H79Gqw/VFh1Gnvn2ohFG41Q5Hfs0Gg3hOiA557nKD2ERgMDDNwQ76soSIJ0c7iTmAT5nirJ4wr/u
j+tfEm3DYevrDRotbspA04GNLxiPBvOM6dhfBGRAGljavOVeVPHzVK2XEUXa2SADufyeXCSBdf2W
QwSpccvCG+pMiBn5OsCtNRPblPH/1YcdxmmpYaU8lcsCUJ97+jeOqn1nDhd60Z18y2OFP/ItVS07
5Ih+7uoh3XQArQJ29gxB9yD9ydVZJcXogcmXHpNvMPsOZGBUKBel3sedl7ri10eXL/pdkB1iCnBs
X4AykPy2m3noqLZzUEZ/s/AFSsa59zRtd3uC3rC+JJiOT00ROkQ5wouseUBLA55mNB3U6Q5MHPro
oFkZGzPp6Y7zTJquVcOG+jgHJZJI5v93TJOP8q3RNlWvghJsFz70QPV3lXkynGMBhqhI/81KPjpV
tp/3qODDmotVpgEb6NUKt1m6SP0lRYYAv2ES9xNuIYkvmnZInYSjgcnlkOwJWiZi6QwqX/8+kCzL
hwhTSYb787Cifk5V8m9fOEN+fUtI1k71/iogNoaeug5yMoT8LPtJ1DZXRdUJFH/g+rC+sJl+70KE
arqW8UYsuYlv7m2doAHmxEuYqs2g9NzuiseDZVekAFIewGEKtryA8z6qOLe8/a5caug5/ulcAv1j
38wjAg2p3XshmVJiAIvKw6Iu9P8gPpmPdHk7IsTO9WUyIEgEkSQNVm4KcCOsK+Dv6YwVavyTSGXy
S3A+lkPWk/h4OnSullIThDxPqW2QwEtSdru3xLhuqt50SPUmx7jMtQSNFQLif4h9TGq2rZ+ahkGI
NF9yOrfplzAxk4KRkpZvPbJmStXdGFZjcH0f7Lr2QEE+bdZox8+8oL12dZSXSUm40LvX7cuHcgP3
YdZ+Sg1qqNWBOY6W6SYL0qtrTqiSRTYLq7Dr2EmeMNlYcTPiTlE6wTue6E+9a2THe4vDGjQ9vxRS
aPjbZXOSAFFYqI3uGbZ1xQDzjEI6uBgNtV9JrAtP2huk9leN5JeX8CquO7CskZpCigKvYCqtKnJ7
bFwB81IdgExq8BeN1IvpXuZg9J1tOTx0sNmpue1SsVFtPtXx+twqQsrb6uBrpvmSHjkpMDe8wi+4
BX646GTC14ZAzmgxcSHilq/sDOB3uYgSB/d/KRm65MMEHXg8dZDaVmOdTa1vgo8/NkcbjL0GdOwk
Tee8g7KxQr9JTnoK/eCOcBT5kh/UY01OqfiPv82r64Icc5LPsfpYGisVniUeBKL/GhHep2oemM2E
e64m0rLZ291a/WJN0GApr+1i5sc5gZlZS54rVzeb4IpupVS3YZbZAJ+BCsqrLl8QYRR38h/lZmuC
ntkp4dExStcAK5J8xS6yLJmaAWtgFdzkSL4TaKIQ9ehI6W/X0xOuKarVWAKnMWIl5G8NQwq5s74R
AjNpikz/ujfgC4cSawm0hC4M9FYNhWNo+gArO8sN9qQdLx7p8X53QC/aCrcndU9IaFkEbY66eydu
LmZdkWjVqYi+zwAKYaX7W6gj4x+mb3TiI8N5/JdVz+Kcqxu6PNA3cdtB/IEUxld9Z5tj+Bkl4RRG
e9R4sZeIY/SZbAC+Zj7Zi5wF28hwXR5pHCXaL27NLcUZr2qzuEIUKchQIFmEwMJ18SUaV3+LTu83
Ab7fH0B+xaSGJfCNKLVpq+SPwLnghpubu5I1j5bSas/nhy5E2+apHWYHdrhufJdyGULRxHk8n9pv
XhzQVJHLVyMbLa7juOKBresdTKgTuKsjtUB8UkyaviGd6E7Gh1HwjUWZqKuJnSE/zXO/2Tjx887C
uvl1g12960gweJexvHzsJ/wNZU6KC3pBEKvH1tN0lMX9uB71Wwn0BHNdnWU1gpORwFnEEMIJRwRB
6+zQqimuHVa8P5imZr1laG2qFHuxwZg6w3kszCtNqNiZCfU2zXDYuGzBEYWKoa7xH3oVOSCGUVur
JdMrmKfkwdHwOySfi7Rf2BO4yaIrGqtqJWAm4ZiMGCrVqOjdKccI069nOoFF0CgqpXWlErXInjsM
l3MpVL2lLwTLGTY6VVgJHbLzuKiwbFyuojJ3yzEly3xi7dvWiZIJY7V34r+P5JxCfv4Wow8HbDzm
L9an2QlS1ZDWafaNsLtS9HRQ9vHlXCuMnSRxJntCf7AH+5tCGjI4ehjfn8b0F4rwwvwDKcq88dvV
jrM53StJkqygY1K7ardLCwHd259fgOZ/b4juzt2C2iGYx1BXvHslYFK+J63e82Ob5zlBrsr1Gzlg
IW89ZOwSsZcba7mU39bG8RZWQJxVrSAHJcKH+oPGcd5ZILwtD1ZtQ1tqBoZ6+Wp4h3i7axiCsiBS
J/Tfi1hIw//arVUT0YXy9eIr6Pak1tv/admIb82oS/c8IbWl9CuZxmjnrVucO0pa6gKQAWC/oG+T
VHEJJL82dLT2bWElHVdO3lKNpSs5dnp0Qm8tMZGR1+wsznCJ09it5oNWEQN5oLIDf3dn1S0LkKHL
aY1/j0FZCwjGlGeglfDJvlp2bQFvnRR+one9BqSrKiXxNHh4wQFkkSTp2Mk1FOAGAx7mY5bMhlx8
YcFWOJo3LklVlYuUoPhm+h3hUdG43kUc4hahkl3rNCgA8mv301AOttlzMuwfr0sZcuzKFIhAEmuK
ZbntkqXlklvTOK4879h4QraLsfasvxcLaBuTlO4uplfDwzIGa5PVkWT3tOpH/B5w5QoOLyZHldmK
b7sSK/PD+Nfu42n9YKAhfwno+OB+1SFxB3ER+oM5KK+14/E05bt7fk9uSJ1HgGD922ryc8zZdubG
vpIj75iuZTuns6kqfrmDYE/eSjkWqUZXqn+rwxhnS0pEJxbV4sS6X2iK9uOVuDPbBum1Y+XwaU7K
2hEOLWn2/7pdEo7vztlCoAbFcpf8acvcJcPvfkXjVGCYYWQO8lM96OFLyKCCyxd/nIFnqaJ9ZhQQ
p/B8c/7+XeSDjTD7UvdPcKwYy0pZ/UwA4A9WHNz4adRMmh5Q/bJZc5zyqBMsuwiUnqbLRb7ZVONf
iAEFvHR1AHuSX3ukHicK1/+zAvZvcIa/EtW59uSQO/exO0zR5VLC68dcp/TWZazW+BqDOEnGwKI7
R95EwWr1oGf2dNJtp2KCpmwm4rpoQw5iccolMtHPufGOiJ+t3mVbKQAw3/iMUmJ/W7v7MbWjFhSx
6XhdvaPCBX54/Yotk/AJNySGWeQKJIWOCPRZUM9BYI32XDEHmbP3GhSzWV6xl9oQJ8pKTsKVV9G4
YCgD1JTNsYuh9ut1kLC3GURYiVCMB7JhPs4W7SAWZTL1ND/Nl6/ZstT89vb9cTUyRSDnAUS3k7OP
t7qTv0h6BLJA7H1NCIPrqGsJiLuV/RawINxT6deFArycTIBeYV9plX7OSO6f1NT+zpgd6/Z3aPsi
Zwe2dPczbMG/xDMCF6CGhKrQ38gbYALO5liJB+EXMffIDl3rJH/M8cww5HWePL/Ikc5/cKu9mAoa
ipm5B7OJuy3y+fg1ymkJ514IxCmN/1MHVYNAVzSQzljHp0Mg6RbxcuTmU5h88xjioOplxHnmqKy7
6FXz0vpbMhHO8Az5zPm7UZkWqcNAPg1B0iha3pQwpJPFaNDim5Jk5BDmt1knzvkfUJIT4QZbVm99
RW7T8TMKyoM4mt86doiPPeSO+Y5+9ZgJmBfEvE1udyD8iG+V0lhNukkVuF7ALFlpTMgdle+FqdZD
xyTKGGnd2gHi8SymKT9Inbj5L1JIqo7JLaVhGBGI4BBjPKGnezEiTHokRAtEydxObIJhGhel1/Oy
yGTM/xi1mee0zR7Kf8eLsqRrbrhHrznneuhIU4rF+kbbxPTAFFfsbhfzPlk7/o5ww0NRULJ1Nod+
i784V+jQplv6jVWQbb2Mlcjec5LhQ9c7wOGEpl/q8dj0dLzAnxspi3i70FAhKAKTRFZI7qNUhQSC
ledyRS4NrTV3VFeSAH85QoHYzOJrUNK/Wm8gG4joNgSRgT+RCHUAOkW6BzQrk5hSrgWmEl8KntCW
qo2zgt05oNBFyZTzb1kpNwopchz//RnFGhNKT8v/tQlq1nUtX+ATBmyy+7TQKEJiD1XoQl4MjOuz
SaHtuxlOF+EeVDQ7EgGc+sXuR1ITFLML8UfT5wHq5NSEFzJ/xFn2gJZQtVchQZe6Y5W4Jwy/kS+k
v1c2UAdVn0fcG3wOWZpSKGeY8MNiNSPhWNEDxVYyYCxEMtaEeNoH2+V7689kQ4yB/KEK9snPd1vc
ZsLPGER1HFbpfcYLQNzIWWfo7CJr8zcyPNnuuWfV0uTLWjh45T99IYoWeRNjcEn682+YNLoHPUvD
PJoHQnhoD/OhcmHaAl8YhLPP6UTqYK8YSYA+jLSUVVZBUadBF9iFFza5viGuz9wREWBkFQwtuD5o
spwMdJ86Vb8n8r4eDWko1c91WhzWyz306pf31DPSVeEFt+GvKWEueDHRYI7xkxCWaZR2fuyoHTcT
0eP/VOVfC88/NtJAuTyfHEf4RJWwWkQGgwjmdAu4ZF/aTzcGA5M+CgJQy358xYCpxVsHF6pq80c4
QFf+cdlVQjzc60WkJxxJyvaL9bDzBbm99mSDnrLS24qvRHmZzenbYjcUJQA188XwfZMPIq42pLAa
DBCHOIKV3EnlYhCO1JBIXYprzzTHOsxKeSZHwVALo6q+GIJToy7wWBBo4g4IMxlizamh1bWnoSUa
UY2FSC7xffFRzBRzZ0+sErQB9zKtSudphtl6fgysX0BLhtD8m+ickUModVYZE9/TDWWuhpW8EwgF
z1m4edMsv0eWGPR86sb7PMiVPdxTwkmmsi51Zk9YaUvtEZ/salbz2bnqrLLC4/gcfAySWQ/wrRbM
lgOaRdzA4w/ibhmPecUVk3159U9FCe1+aBhrBAgT/ET1LPnsL5Q0MYur5f5zcItrCcrAEFjZqmCe
rcNVYdb8TGxoTyaG7/hetbxJLsnhYwFCa6e/jjufpi8CT0iroL97BJQhtryRHXeZi8PBKZ4S5u6m
guo8ACEh1xzESYBGB0q9/zkq5s7018DmoXPsWuKS3YZsFniGXSLDfGD0fj7vvvjgDx9V9EtQ8O0g
Z+hajaeer2EJIs8hWiULqBQ4DlERZUOgRQVBwKWrcHboc6YDzRQgYwEa5tOty8cnIIO+ZO+qaksN
BwBilOgUx1gJ17Y5PEY56wibAeYjIfZByyynHEB1IJjp74lMIepC2SMNZIZz+jdnmskeZPSra4K0
eD5aEIdTwQryW4asXAlu5ROggI12KyVgc/+cy1y6flQC4rAUL+vLLTCtSF9BS3OTxeRMKNE2hvf/
0cCC4Rlef7dfGi4qbG0PpHaoJFPl8ygJWjkESbf0+lihjoN10ik4FiKHNhoVqPRYso0gG6SM6w5r
Qow8bv6ZB1S0FTZ3k4TlWhFCEhdkRAsGqK4UQzhn6Fc9eqOmFc36cTsbuvPcjLP6X8tcyxyH+vCK
LyRUo/TvsgsC1dJUOXmOTyYzugd32WGKbJklNF3HlIkp6EvfYgiEm5FcsQlMssgg1QhLCxfxc0+b
O/XDsRLPfHefBxojpHF//uoDVPjF8g7XQlnIwKZL1F6qIl3aZVPh+6HpSiA5wA0m7Me8DdqMyAnL
2vSZuOIW0Z/ZGP9zgGXu99NQQ1PfgmMQkmv7qwCtTp07R5CyXaBewm16Bh4vNOY0eT/E7z/mVNCq
EJrAisia/VRdtNXUGWxZsjaNRkJScb0ULnyKXNPq2kD4r4uzXJj7KgAYfC2j/wu5gHCD2ctJIENd
eHcpapb8bNGba1ZisgDP0WzhOC4Hi9Np7Ur+S+w0XSrDZO3cuV6CQZh/FiGO+laIwVCMa71NbEMq
ZOJ2grBmgGZNaTEiw6LWtsjw2EMfyXd2nVllGvpxxuiMjzeZakReRW+mFZEifRG53cWupXfQm9vw
i8SX1xQw2tl+XvS49DCPHZN5xGbk1kp0mEbcDQs+yxmqN4HwqCY4tbELkoHeBlCR8hLYvYCblJ5g
XXzacunBQxPkDF5NPIZeprCKZQ67YvdY+Rurh7IJAALeY6RlBhccX7btH2ikrh6/9cJ89AEY4M11
MwDTg8S3YKFvPngz1XzLRKxk0rb15Nx6JEyWsFqPvyGQjsVuBZWTSWXV4EuzHF9eJoYTJ9CtxgOT
k9XvAXDdqiM7vweuo7auuPvTqhI0RF7Krm9CniWQT4g+3iM1MZYzmqNCB9LNeD0pPn+x2bJDQso8
HEvTm16BYOjU1/5otgqno27qnwKD49eHJci0D0tBwP7GM3J3yMCsuzorbHlpVWCffCYikKUDhzdV
cVP1KcjHhsA27UrGsczoBTLsr3wm1v0DqyJMObgrAj4NiY1CqhI2zHvFSEPgTXNAOOOH0b7YlaDk
00//Hpum/mtKb1uqYBML1dXWT8YpR47hjesZDI6G/AxzxW07Fb1yzij6olhPwbmA3/SCSfYNjUFJ
pfa8wkqIzByPm2GRY2nHThPN3jomIR6qMjHaodArA6H+hcGYpz5/b0qyFUcl4iOKFNtxPNrTfO1p
LfH/q1haH0ls9pFVM5goeJkaOV5mtdYeiiMImITmYouPed+LrSwP58FX7t+SV6my/9mKArL34T3Z
nw+pzbeWOJFPi3cRqkw8jCuvN8hbED26zYnNqScK76QE8SeF2MX4/d7l366itvy0/bEv4eEFii2z
/ooOHYMkrOh99SLIJQxHpZ6GLDQjmiCU+GSMDWCGRIzVXGqjAFQHsYHnNX7p4XppGYw8NcNc7Jsp
UVCZ1rGYmpsD+lfCVP2n8GsyFZ0KHaQFffqImWFVnNxA2DX+F8ngJlCR52J9lvY/UkaPOAqZhwWG
LBEFUMyEDURvmM794zx2SGABU373AYBw4o0rPcpaON9HjZDSMIhmT/F6sqVuxmDINf3ovJ4zJIkR
NvCCEoEEZkUcP+4yWFWUOW/zks48LHS2LiOOqV2poe4LaT5QIm+xqEkmGAiH4H21FVQyv031aJwx
8BJMLxeqWv/bflXjwV4auHNILOEI7jRsuQQ3qMf1wO5lmuknG+/VaJS1y4R5pVBvj/81/YfBug6X
BRmzwTzaTkYoz33JGMv95QdygVfaXU6ymDTJsNPvgZdlWP7r7VZGxnzypJLB8LUwyCiAdopPn5t1
eyJVCcGm5t0Z4ihOml/YP0cNBIFcKx9mcv66Kp3sA0EDL5qxt90dtmxJD3DszjtNcsrDARVEBC+3
PB8qXmm8kGgEPzACJdRW07slqDIMEDKv+62TTtmZwgSxf32b//bXAKIQv7vQQ8EsrJq5WzxnPiaZ
upFo3Pr7EMhocX2z2wT64Pp0pkwpv84PQpr/QIQXTc4yTIRnhuot03ktf+Fa6Dj+HYdWnFHBaxf9
4nVvu982/nP8uYbTY307TcahXdypfONlqrWW0yqvnwzJUdp5ZipTUMABP0igBinEYiQWnQQkv884
SEN3MudaPZpbQ2Q/DKB3WwH2VfpOhUAPrz99F+WvUIv2WalAF9Xm64TvohoRo4hkqyooZrjMojLr
VT2T4+IsMdkA3NjUiPH0blbF2Ny7hmQZ3dHXI5M8spMJFZsZaFFZNVAerizhCWS4KTwMHZHkpy2J
5v0xtlALi1ysnLullltFxTqp8c4E7hyriWaZnIr4pOuTNVJxyMm1rEQzYdy4aIJGCrhpIP/G9YcZ
R2jSGPX/YKE8kJcPvlDhKP31MrzZywEH49JVj5dZR5lMv5+Q6ZnE05OWynOndEoOUniH1bWEwzC7
advwWVzEY/INVEP3sFeFn93SAi/lM1vskk3I/Kn8rsqvQq5o+IHSTNiFjmR4z6ktrSFtAB7f1lHA
bNnI3nFFaDdSWXuM4zrKirQnRGQKGL1KWz3T/blxaciMAry5GGzh/0LFNEHFppO6P2VkiluDcnDA
0FJBy7FNLcN2201+/r6ZAMdEEsdf0GshhXrzCYiaKebtTxIPB+vemYKF5lbe77G8RPexibk3GBMT
LN1PsW2Xh6uJ53dWbxboj/MQ8GKoKgqmSI3Sz8a0ySbsFn8syeGV44I14xftwhCTEi9MvIeRtlAz
OVGt+stwN4wNIkmC6QIVS8T6juG5IcUCjDqifSG0heGw6AcUzkaRdHeOggF5ULOj3sxOb5a3/Mdg
oOjHnWPPElGIXYk4UI1ohIYACOQhNkHfLiAjFhcoVQ/BKvV1GiivRlvDKL5ckoDQOsabTnb6tw7G
vWNf04zALX59fPrDXMmPTnsjAw23MNzfVfE/rAgO6txyOrJB/1RL+w0J0nB175HHoD4FVwyacO1U
RL9z737PCgs4ZjC5l/LxFyPlPyFhTizxPbmm9a62bSHi6SVk5Shsfo0x5Eea4dPgYczFEp56NnWD
swV/N0ls4OQYZwhLQt8ahZcMrvM2LOiiRFpgDyl+tdIn93cHrorZ3Lhcoi7cgSXddaSWypp3eDv/
iBFjuRHNeuZLIaV03YRmHfx+KWiP81ySQ8rYNCu3UIkf5xkiAIqLHfOyhLmbtjkChJ20pDoU4dA2
kueNvCmCk80ThXO9zzBvKamLSnExeFKydGPYLggilMLtm3F4u1+mIxnDhwaouJU6zluZjAxUf04W
r1DDaxj+zOaMBaHVS2DKFi6tGR9vIkg2/izHLBgoLGe3Rx1CPKpPKEDNX2JfHXWQAtLm0YqZm/wK
5gcbIYuTHmuMP0/sq9KtwXlVAYRolw9tTF/7zs54GwrX73rVzMsfYim8RDtjp9ZXPnsiHLxLGk6q
UP71FYzjw0sMYR54xxTK8SKHIeK+AOQsdBHucKnWqv9vjmCyIY/wFSjVN9NxXVcphKbEcn+UN8Uh
Tt5R209C6r73r3V1C8quMmZFAy8wDnUulihsd7yxzRvAq6ME7YJ+ViP0l9111N0JgiqwQRjbq2p0
mDwbhUmCXMovUP1KzmY4UyJZJFQjJDjEEGlFFuiIVCWvUzl3qxvIUTypKXj0vC1FFnWWJyaabh4t
Cc+ebLhQuTO+sOWKTzJnH01Ktfr5RJ0FlD4oy96LC+/brV51z0bKdXCOPd6eNzDSaLMq0KFD9Rc2
ulcXdO/DXhDIf9+4YwBAOzkaYK6h/YDP+3fvtIKMKV03RpmXJcLxU4WOXH3rhhIHXkVNVtq/Go+V
jPtKk4ZpOw9uhfA36gwKiG7OdTHkK9FsenfVh86/mASkBCYsiCKgptdyFx+qd6WDR/h0hk7IYosM
pbEpNXWj2XatLt9BhHMkRzsQOVzuxXnQeTB6Jybi1Ie9wct9BvT7p/AgZu0LUB0hCycSVq6Y5rh+
dU9VUYpDsC2IITeP54jSPSaVmgQqhD06mfReIQtFHYuXOoEK7zb4qt0W5SbNFo/70p2cc/zG+fvP
TIbK0lyNuUsn40l4dl3U+QsMiSIamHy6v9s2hzXFcsTlw2b5C8Ki/kMgnq99H0Z1cgwZJoY4Baxf
OGwYf8g0gt/NXxDF0AM5zQAdsR4OGzM/EDQif5aMI0wWpZSBLfYqPrt0k2imsExKE5aH8cj/SSpd
EOeG8P0T9LD7pZO8aryJo1M5QQfF7myXFVFaD7ysG896l8wH2DRJ/96qtuu8MwykSVF9ltW/Z6p5
OsjxAAMC6XwewPzym0wtRsc6sWHvnEzPU7Ea+B+sjwtXvtnX5w1pG+LJUn5zDH7y2F6ut4gdm392
zY+Hm6WLcr5M7tZHMaef5oUrbZF5PSwrzPWbHp2xpVlku5qT2hoGdDinp4q2xDfforR1FRkS0Pu+
WNWVswF5n1/0xjWnBRye3iR09b4WArGZ1ler0iBzuzJ8QfCQ7/1dqxNQBAO6HUVpS2eZrQSwcWMi
W4EQvF9qEFSWYEX5PcnaYxhrzljYNPxDhsUmGNEKHRAmyucKvdCLXXyuIOvwOh/2LD8WmnGH3SN2
1GH3SgTaSaCi4OTb+y5do4USi1Hle3+EnyqK7YRuGVXEWuWeI9sP+IUCp0qqLdvjYB/cxsJBZgNH
if/VJPWbFiMUAu1SJSXxco0J+9qK4rWcW1PEecnDYB/qDWLz4otKJ2JrBSl/+p96S9H47JvjTkm/
8w1yfC7CcAqhg2stzB2vZAoK3/XePDbggKDu7nVRtcheZy2LMGF8spyFRa+cf6s7SYR5tMIt5rJ+
mhAx1MCdX/VemXOTSZo7hmtUttxW7xY5lVgXqrcPpCsmAAaSOloYATCFYFqOvrwsLUmIrl66o01t
5M+a71yI8bEpsfflOk1qz3qvhqje/DmQc/L7dP6jflOPUdXAAgDRz+HmIXOKXin21Hk/E+OXs4Hf
FupEX6bZYYAybaQh/uwGrV9N8IJE6ZZXwTKf3uipSv1BT0+cMn/VRz2752P8Vio8N1/cwGEf37Zt
7NL7DsjAg6sB6HYXXmqAmqnKcL5NkQmy4+vQJ19cnycNxJg5YzAwpiOJMyyHrtFh64n5MjWk3Wg7
zdlfUsZfsEAE9gL5MsxqPR8Z5xnBVHEvQgugemQF0Y7iviQYHkml4BWuJ+yh4zaIa2D8BwmjSDzq
z2JwnjYoYZyw31HEoSCdQIiQ50SCptDqqNfAD7y/NxYYIu3tVMk31eGFepPND3Rq70yf6Lqns6gR
juIIyJKY6r/zGQ8L8dJ4e41UIYaXcW/mlR239jgBt0tBHJzhi3FsOw4mWAm51kaqD7AQB8jf0oY+
Q81BtI5yMJpgF5dXZx/A4Q3mxzeBdctRKMD2gV9ZcoTmFehTLAP8vd0MQLhyQuM5ctUQ0vjvDSJM
7uNr3widSALfNTUnPqTRrS3Onq5rQmwlaHi3wj+aH4536yGwBzv5dIvKxnmbxcgbG0UCmeFJ5E+l
JhwOaUc0jmzehfpctp7H7xLdgBH2hXi7oQePdODTJfH4gXyWHT1NZXZQrAicml5zc+BhTZ22HO0h
ZrgOK3tNdfpu6xPJbFPI7R1t9vm0AZFvSI+4u3cIlxbz4rabpozpLFCzc1/erJvoE6bHPKtDYzWp
j/AU54OMoZvkpx0r6KBDY8RJeWv7HFV42Glk9g45XXv7xH2LBIRy5skwL/ZoxgudrTwNcMZIxPbS
EpZPGGCPJr28DDCcd/m8TJhZFKZ1hjQJnanco9T1ASsq3/lcFkj4ymnNjs9laKwJj3wP0Yk0yogp
u03yU7MzcO61OtwMDyfomuBiSgsz1FPGJ2ptuToCdG+Es3UvLWi05UwK9H7NI4mCZL8gzit/1uNg
PoyWnptYLEeBzzttCcpn2kZqYj0hwZaMDwTsnfbrw30aORhydEhGHBlgK2Yh2gRaKDSEBeEYUNZM
cVND3Luc3iGAcxbu9P2lUhxX66T3UbGkAr/AEcA8CDjjgb0VQyS/gz6RhVAbxOVlSxEvhwLOf21i
coQUjZcmJXeC12F5g/6jzKJgmavOkZ8ITfvG0oDMTvrhvmPh6k/GvfookxcP4uLrC16HVxztNPRP
GKvS6hUWNZ7Ier+GEyqe7CSp2sRv0/hRu2VAKfvkWC41jxAAxq11GxNy/Uuvkr7MxsfvhrFQxf3x
I132AeO+Mk1o7jkpaX5Vxjtvj9rnbW+U9jYSvg3fjmbMYigt/fRqCz9fXG9r2aB99J6vJnWzGv/C
iavQ0MnUSN8qp3ThfnB7GEArgieHC+Qr4PRF4Y9LZ9CXZAm5MInkr871rsF97h8TmStLd8xEOok7
LTiyzTtr39Xye2fKa3Ptglk35CJNjJMYjTgepYv4YgTL+syxB74l+zIC0YSeUW+6bUn4FrRxpBHz
/8BBTGbYhVvKatkwhNfIkjXQHrKZE+rEyNNMiWa2w6G8EyQZYJpxE+5zkgCNGt11HObMIZCxGEp9
oWSq3lBXg/3iAcejXG4Es0daDEXYLylfWRfTaBz9ilbpnBNyJEPdIHTiSWlAz4ES1f2DJvT38cR4
aumnYsPa4LWLhmvbKCFgOv856RIQCWvo9+92J/6W2fvzR+B66OSndWZeEqnMeiZUM/gzv9d6yh1X
+l3qLmgtgV0Q6Q5ajpdr91XoDB1qomUhjxww6Da7f+s3mrHFrh+fnGmf8PYvNWtkU4djeCt5XOGj
fpH67FTrXQnIx5WmgyWhU5qWraW42JskWRMRzXPv8+1Nu1pm6KP1Al88p5vYV7qRcyAKfJx7f/sE
Vyk3gU3dc1MyLsw4tnNJ9ujOzv2rVKPPF0FJPhWxY2U7BJBvMlUxgt/Yl55yQ1zOwKtDHN6QvRjn
PUkkR2y4wgnrRqvgz5uerU4Yf3KUgrPlaMt1WgTJJskcwUFdPKxlcm9SJomkAvqo6s9ve/Qj85yP
D1DPAJdYpKz3NKKHq3Q2vUDTuNBfuoF8Xcb45IvzsHYHFhi2c3l+XfAxg/49WbuPiI42O7KGl9Kj
6aICJINElrjwunF3wl9g0RJnYvtOiM97Sh6YzfCnhB9VZ4XKZPorNC9DkF4jykuDqAd8BZdm0HJB
2Dmk64Pnf5eQ3y+UKXnDOTE8CS64QJVIjCgElgauI+urGZQrt2O6sL1KjLncX/5GwAjimTXUytkc
u4tnhm1Fdt1H99Uuh+RFUNyz5eY0UVgyuufMDBp3DjXuXIMSFVbqzyGdHZTdjTtYqYKvk1WA0Ux0
HXZ0Y0BajQ8BkrtKPm+cbglVGdYXkqcx3bI7tOUFwAvRKPtS1QmWnEBVlGGY6O07uAkbxbef0YK0
8/G/kabMkdrKUQYGXUiKW8gJGCab+A+HJs3OWbGc9WnxXyj40YsL1HeFnum70ToPgbiiB/UPmoEB
8Dt8o5w9XvE0DJ9e2IFA9bREVNRVkWNyMzBIj3TJDgSjcPsVmWWiGJx3Jrv2nFySU7UvLNmglEi8
KIqx+ji9l6ZlY+un0YmZ3DKsFdzKT/0lJtEUSkZk0y6vG/XeTUYKfwxLbQXtvjkGDMYrYTnIeSmW
OG7fiNil7S+/k0p7W1hHQpHcvIMPWAaVUZLB9+SpFnKMhaNjkNjRjVFd5aCIo7+gmnTyhEelOaYl
WhheV7ZU5OaT8V8pSr1jNhYjxETpTxf7xR/vi2KptX1mGEwZzedLUpoXIpSRAaiPjLuciG0PdrzS
4rEH/NPYsQELG2bkJJ0OjgQ4ORA1+lyVRwrN/7KfrZeq8MqZP7jhpTliSCVYO66ECB/oCV6pgejg
R31jPPuyYyC80UIallxlMSrZfBkDEgB9R3OvhUdly54m7GS1vm2I69+bcCbNtE5xBUCv81YfkIOs
1UTcaY4/gK4iBTsLCVVPiWNivEvkBDpdPY4Y38R6pTSKNGPXVDq0Y6r1cKR12gOIltkoQ+SsQhOd
HV1nWXAct1latmHRWH86jK5xCK3hhmIXaBjMLeYDuEUHZ57Qg9pq25aBtAzDgVXY60vKbXcRw7Nt
Ll/fPgewu4tYQvIkdUSZolBlNdzQd4R8CdyToSA2jPDHnKJAokBL9c+BBcNWQCI27RI0Jx8uP19b
CkWtewXa+QRQl0LJRPyDM/j88Y8zUi2y/bXIZV+m5uedl7ZkzVBOOzzbmlBCGFuVPooUU7sOImXT
711qlrxqDTRvyzZ5JyAsDoClGScpXtIBnTR077M85+1WDnXZlP2GJCRUcnQm1xmKGR5C0Uhws1N/
iCxzUDzquK8P17jeUTmB3vwkHqeYxWLV8VWAQrWdLfnn3/40UIuEOwdchmgW3c5hsMnX7nKl7Ufw
5knkRdtq19jh9RBIZL5/vx2gnFjriOFPPVH4E3yzoDn0xC+Sdfw2PWXbVRgzMDrsJC2ylNS7X2EX
EMaGE7qb96huFm6gNbETKbrmK6kBqTpbMz4BRWKpIxjzSXT6RZtZK17OUJazFOc5Eaj5g/C1XwBS
Iawk2grZaMX03XPhgkGg5LYuWSzJVd4/1YW3l6w1WVNlC9Bu2XAo9kvMpZr4ndHx6KNa0U0kxsP0
ng0gbe90rDGQuUjl3PEizWmoxFFVoVqYHWXk0j/rBWg0cY6UrwyczU393lYLWjmcp+EnTVjyrjRi
VfrpTad13/WvMqHluukfHn8uHm2wgTW6Ua8SC347+B368eESpbR3TVFK75hOtvtlPBlXTKHeolnU
KHYo3szp3zZ2nlf5b/TgW0Zgmyu6MU6E51/BCBfgpvJsfs+vywCtTXf6USMfpxU09VcfS/RZWson
/fWTxNyVC3dU5ljcULWFMrmMHXbZNwyd8k1NxRxzcP5EUe3v9kg7pkLiuOLdGBb71H+XVAPcSzA9
ur9xMjbrqturW3czakW2hMjVm29smOu52THTT7bAv5m2wdSgd+gbF7nPZnZPs+7nXdwczCxu2qzH
HeVtclRwrRtmPFz10gOYd9eo31EMq+uPvjyUcX/e21FOXajrPKgpKj43SMLDP3UlGZpsSQsqriTq
5bP9ndcsbEn75Pk/Gz3vlUUD9ghT4m7c5COIV2eEqbGR3q8nii3xT4iWy9KXGKgGOHn7HEr01r+E
Q3N+6lM1KWdwyGJ6Dt7R4H9XlaQue50SPLfbWdkd7UYlpAa3O4HPX5gR81tOutsv9gZvkQPTvW0Z
xqGTNZmXPaRVQCr9MlhoKjjCwkNZlrJkyXSeC/n6rsWGe7rS/xA2Imdk8dEiO7wdKycsXeoWR16y
Z2/5HhpXxqe9NvTz7eSzTwFyRXVVNmLCxJNfY81vMpLwboUcqjWZ1fYKloCPGqrV1+2IZZRydQSo
TyHm6vOwyf6DzcFF6wKF3txSiW/EZhcu/VbyXQZvZ5k0h8q1PnT+zUKZ7XBQNvkYUqg7zNOmpaiY
v7zeE6qYMjYnCkYN6Gfv7mVEoo8d8hTKlekhcmx5BxhYcQvPcVST1eCX0sCmCF4jool5AmiCqAOF
pxNmzBH1Cy9Mx45KmZ6TB8+MkWov20Us/qd6vU7IOQ0AKFPEGwKWtv6oEQleD8lC3NYnKsVbmQ6W
2N62ssj6ME3d+aOeeoRNaTjeshvYVm7irIVlp+KD1uHAY9artrezb3ikd5GS96GNY3yioPr7aAzn
Cn79PtnRjFxK1Xv0zZBD3a1eedg0PDsVqBXywyhcsJbhWfQGwn7kbtdC3vloKz52rD/xCOng/wuy
3zWYah6YNH9Wx3f/100/oxv5FcM/v47eMOwM48/ucWI9U1whmabo+YMcjxfK00Omq1ynMfwJd/AZ
Tk3YlwMBKln3F/FEnDHCQhUkDcWhoV3KmO/O1bA8CF7kQ0SqnOPElOg5Azd/2wN1/Xvr9zv8Ivs5
yNgYrvnGdHK7VPEfAfnbtjxp/H4DlDaYkX+qrbgHUo0l8AlTg5u+Vw4LHlQGV5nz/9rmG/lRH7ap
36swuCOqi1pzvXOO0TYJ/ZQp4v2R4yeLJBvXPOiW3S3++ACL/4s7mGsVGuFT9QiU0CvT0zaHc1Cl
3Ne50voKzzt+n/GH8xlBbsGK36xd/udONQmtn8SNVRa7GQW7FHpHt5KPJGIukl1ZCZ5wIg5GOjpd
RC7CfvQ3X/cufAgATnYJim9wfn7BIi1FWXg/aCVudxCEr9flfo8IN57flmyHh2Hv8/LZ2K8xHohA
4M7S79rwvkR+ZuLFWOVzbY0iAOEjxJiQ3HIl3tBqgJ7KWeDdILJ8E48txBGtq2cl9ZNgnXb/e+TC
8ITnSsLgWHLpfD7HSX/Nw5JMdUJwDc8tRElt/O0VqfpyZBQIjoDvHXKLVxg5SwvCz4zvMNCeYhnm
zFBMw4skD8svpnNdnt+1K1x75T7LlGCJPhLqtJrlOztGkkxe9VCICIWqwBVHNqSTYg7kOSWVnj9n
+TbMA14/qgmT94Z8Mk5ThCfQNv+evuNbClGVM4fMVe9dRQXjvbmih7phDND/eDGomyXh1zTInphg
hbVyZjhSSBPFOdxcVakPOGmO+43loFk15bpyS6A2f0ivD4rHEo4E/X/8AhCIpsKTTT6ME8OQ50qq
Y9CpKxMVHl8MrJ6szD7YpZ98xDx6RQq6zBsEND9LWDSkVigT+SRZjfWuU7j8nL1ern1GMz81cFen
Mq/Ddv1Z1OYXPEWwO/IpJTtdzXUdnSMdN++1Izu237b57bazaQUUSiv6eYYd1i/C3ifHX1O07KpK
cb5iUElTCqNBWrcwMNmlQqQWAlEw1e6KLrp0ga0kbZiIgi+XwHJy7AlGyN+WC8Yo8jyPtOsk5unM
C1Z3LQvtnL37JxPQV2pe9HOKe/bHRSPnls39lC2JoQoxVDu9I8ORrG6F+NYQgzsapFEXvEXNXCVl
PaTJV8mCrGSvUKiLjJ4eDig792G0AtyIxBMpuBkKqEmk8AnoZ1UbvjsZys24CVnJQZTN5ZCvQtli
Ac/TYTrHMPEQjRXX7ZvzToYhOLDSYi1Kt0BXR/kJzxJclr6AfqWBrq5Rd6mo4TyKmL3gnSxhX9R+
3WBbz77Q7b3UHRU3amau8qkxVuHF5C1Zlsv8X4f5l7p5kFBpSLyO8D4ceVEhwYnxzlwhDb2HIYbs
+OZvZLvGlV9crdyFFKMvN6TNO5nClH91cXclxWT+UvTxivwY8vz+IETP5UXye61r8Eds/UvTmQ8m
/R6uupb6we0KaWZGol35Wr3/079cdf+d1dv9cthNpo4nfvHgsj6lz9+P2DsNpykldzmXbDAkVDyT
jt3FqkY4IGPloSrTAMcsP1TKYBKNAQXptm80wrUDepVvP+6Lj+6vppmC3GKZUNWOLPdANOjmj8t2
p5Q+9x+sgfjFWNKlPVM2P1cx9e4XSV20fsPRCe2Gru1Rx0575i7Xj36/IaS0/xUWQteC6uffrXC2
H/vOWpuS2jvYUMrXIZMfvZkTTswEwGroEj/SnY/XMs5CuJ8RL5GN8b1e7vkJPKh1kVgaxGlAvXmM
dp36E6EQkUEVzUUMbnXBuG5H8S6xpjm9DuhO/StXigU9UeBa2Cqmwcl8vVMDVC5MBpyay3IpI1LA
Og58RQ/6w88giiuvJMvqR4sII6++M3oDDE9FYw4RBDzsNNTMx5E1CKpE992wHeCv5lE4vNzL1LFL
Ucbb0oXnFqpmSKC3OBwRVexJCbETQmuR95BarUyiHnI4OvjrtbJMPrGwiceHXP6VV2/zbQuKR769
zNMrhZQ6wKOtrxHDtqaHXRClm13eDxek2RH3EiEXP5EDwm3nra9aVHS+wUSWFyrrdc/9TC6i+Kis
OW1gFllMB3cz4AnYUTHBFBtb2Zq6kqaEbc592wWGKdkrZxlzXtlu5xMhTBH+jxUhUKQg61DEo3KA
kC60rJo3J9qmrHy+gJdCJKaPtDjNM+o1Ag7zgF3doxgNV9P6HNly+waC3RlDXqwEVBd0WwWlhZU0
7rUPvGFed2n9s2W6b7rHCvEbNoXQJlPJIhqbYwsZaeDSgfzH2FwRndzZ/PzEmDGNJMIVRo8Egnqt
trbfdJY1Pufas1j7JTWxwrILlcHcS6LpYD7s3g2yx766Or326OJFCIHThzoJjhxM/MZAV/jA7A0d
JPRC4vQWkIuEDzsOCPHmFqR/TLed6xQIAm2F0emkyJC0i8tuuKrgJuwX7wTo1dgb39TgJaODqjSg
sBg/qoPYFzJVKBZfTPmmXCa/3rBkINelFjXbIcaEverUjhXDJcICCPDsqv8rEVnenrJ/HBzThTQV
deJoHWvaQUd4QSoQ16xHw4KlYew1tC7uG9/nvJ79KYXGZgI3luL0dT8UPoUATXTfr+8BbxQhGk7Z
+6yIBvLHSuSW7WpObax0JICE47L1fLBOmxjexv9XokT2kX4Laf9uZUg78PrnWJRI0kGR18o1qHYi
W0K+G67ZRcVTKwV9N1J3eVobNX2t078DlqyCMo0AuKYjoc2UD/uqIF5MrXYj9qU9Bld93Af/E2tD
sm9n38M0MXW2scR+m83usBElY10RSrM3B4k6EneljI77GHOjszSBrodpbmw1VXdDgOHF7VADczfz
r0TviYpmg15RMx4PROsT7BHi91Mw11hXRlz/j5C6VEwauDpKKLARTpDc3VUMclGA6eKRgT8awkpX
hrMiowkBOV5ab3YRK8aqebglON3CZ7Aipkxdr0E=
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
