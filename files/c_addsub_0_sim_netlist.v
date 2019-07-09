// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Apr  7 00:12:45 2018
// Host        : DESKTOP-BUPH9QF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [12:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [12:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [12:0]S;

  wire [12:0]A;
  wire [12:0]B;
  wire CE;
  wire CLK;
  wire [12:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "13" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000000" *) 
  (* C_B_WIDTH = "13" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "13" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "13" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000" *) 
(* C_B_WIDTH = "13" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "13" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11
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
  input [12:0]A;
  input [12:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [12:0]S;

  wire \<const0> ;
  wire [12:0]A;
  wire ADD;
  wire [12:0]B;
  wire CE;
  wire CLK;
  wire [12:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "13" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000000" *) 
  (* C_B_WIDTH = "13" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "13" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
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
iO2Bdkfy0dqqValMR4KhTWXpD0gDQF+kyoly3tZBTZTVs0CbWJ4Owhu4jxMCf8X2gbWR6iweF6Ks
B5dmLHZTDA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dbcEbgyZfx3YLmYpvjegvD9sRQCV1qBv0GqFBvCakC3SMR/H82zqo5uv5MZldBGUVmNHnxF3Vejx
zSqxUKfTNc90CS6quuoQe0eeq3T5XSdgwbNtjPZKvJuJTmQKT96yB3CfQOz13fGjaLrn/8NBUBBh
I7OEoGGg7ADph9V3vRg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bD3a4YgAnaoJx9/hljj2C1rODcUhawTVE1gtdPkNj8/YjemaFM6/sF7Q0CXbDJ7a+OBrB5pUgj3O
Vesi4yVmFp+mGmFarftWat5KmZiP3RVWrXwdzMj+f8T7p+lE3iD4njqUxIUz0TsUaNvFeW0xVNNb
OwTEX04nyt5HrU82dltJCclpFxE6yrP9YvI7l328bphwnC63xxk8T3yXwCrvj3VrIYuDT2yMRxrB
TBCv/Fe2f07JQyV73J7+DGAeJG0B1dTHeu48auQT63g1HsYaUXREihEUKgZe70QlOqlPbrr6Quhx
2LXE8LSdCA+FbJ7LlQc/Sgasj3ZYjM5lhEKleQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GCfR7acMSeEtOw1DhZKkUXjh9Uw/vUar7CGDRG9rZcB9NFDtQTltJeuKjFg8eaeKH9HFBMryuX72
/tmzhtFaiSTjr2na4ncL2XV3QRXe7nQaiHdc7cKBcZDvdSSMzOSYcIxLunwLwQTLC7sCvINmlxO1
NXnYzJVL1xb9HP8QVnSYpo1p+gCXcRBZzrOjZjCUnl7F2t3ZZStSGjBEyXVLnV+ouU3+247oJAOa
kC7v+pOtG2ho4KclIg0MGijjPs+jyOFU+b5C+ufQp/zL9GiZ5waCjb/0Y1vkBc9jZKR7YRnv+ASG
ju1uP8oqEXR9742kXRnW4HkMKkCK1MLDgWYdqw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L+AGKmFZ1zoRJFd2cA+zxJhkgQ1R0aEjGQCGRFLNNhLHZXpzGDIjdSLjralBVRJ2rD6UcJutapF5
YaMoV9kphGGG2B07dxBuIimVjOxS3ZQJ7ru59ddfGBxUe9EHrv00Q5hTwoxig0lxqnmjSSnfsDeF
weTIqNnXkG5kqqezKC8a2FvUD5QWQBibhK69OAdmhhIOwZmpfvQKbEKgLX70BzcNlmLnttRL7G+q
XZ3fabZ42+JJHDLiIfveB3Gp2Lf2tzTH1u2xx5aEUr9154pnC9PWIwL3y3VBAT1oHR7ScdoGDOEy
HoYUiDibldOidIeKW0KrTeAIuBNmtM4R0R+RSA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
V5ClnklUs5Wo++EDemG/KeowZlAfqB8SUrvSxPQGrdIwGfUvoCajhuABAWdS/L/pQl7Eyz51aiuw
KzPMrWtQozAEITf1xzvzgKbWZqoi4PQD3rThywFsFq60u8DdvHYM/kEvit0cZVFvG8rAbtlseHLu
0vU1kbrNgxb3bxjOovg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cRqAgScIUeXUwYGfCC0XDtpcc+mFNm3p8oTcFdtIU1nnlMagpBMqRm5ELc+m/Yw8jBwvcvt4tUFv
u/ypEEw+y12B+5Pr6SmnLJ+NVB3Q3Eyh4Q/d7p3jReIIsUxrlENpCTi4PVXMKr1B1Htzm8F8mXDq
y2UV+0SC+4yrBIntsdS0S8jPBERhfJhzNC5z38pPHANtM4wGGIUuKxIALLz1aq+2AjLbEgFHNrzw
2bJiDwRSTwrY4Yx2MSzYJk3O+cQBUe8nJDPx+aGEvDzQ4ZdJMNg2z+iaiE7OTaqK492Jb/1jvU0j
wlI+n35s2rrnc9QgfljdOJuueruPuYDi5vTTxA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
J5TuD/XFn+xkpgw6M2+FymZQ10Nv/lQxovKPdL1fxLJdzV3Np6Sq4/eQnKBnlzXFTcAtSwmlXSXG
fnmIXiAS49d9aeKe4bt4XHEMee9X1WEXYGex/h1dFLlm0pi3Gl993KbHN5Nv4CTwu9crQhGxyiK9
bzjH6deqbjkQwNun4Z6uWeBv4Z875KnSPsXmPh9IEm6qyedBwIquNccK+vDX7suA9zqYjFBnnL7E
TfVvc35OxeX7nqrvugL3qL9h4h+jFSd7Oiy8IeZoqRlR0596Ol/fefUz+++23M8BwvPsnvDjViIk
qIQ9uParshhhbD3P4AYoa1p+vhZFBQp+u9DoQw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zlCVTUb7Af3z+9lQhqJKTycltdYt4P5DSHDlEUteAS3HDLIhuaKQjYky6zhFCkaBpQIgyTYxnTSe
r7OP9+DqTi3i7Zkhr8PI6nun+q7E2+63dEVBx8pAv9FDHr+RRBNIXh9dS3pEjXKe0rFIyqLwfGFw
B2eSQt7HhEmHniogqruBc3Gt6R+pqx0yejBfwX1kwQNf5peRq8dDqNY3rkMmmcYvKT/HhCKtNc5W
mTG3dOyFFpAZZRqVBBII36hb1Zw1k5kd/S55dB/D1TtlNt1O36zQtCO3ytxUI8gSXy3tjqw7N4Ch
DvC/vob5x3DQ/7q97wBDce9KWJ/gdT78pKyx+w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13120)
`pragma protect data_block
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
f15l1mlYYhfcIw==
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
