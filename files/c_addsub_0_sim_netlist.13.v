// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 13:17:50 2018
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [12:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [17:0]S;

  wire [17:0]A;
  wire [12:0]B;
  wire CE;
  wire CLK;
  wire [17:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
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
  (* C_OUT_WIDTH = "18" *) 
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
(* C_A_WIDTH = "18" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000" *) 
(* C_B_WIDTH = "13" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "18" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  input [17:0]A;
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
  output [17:0]S;

  wire \<const0> ;
  wire [17:0]A;
  wire ADD;
  wire [12:0]B;
  wire CE;
  wire CLK;
  wire [17:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
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
  (* C_OUT_WIDTH = "18" *) 
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
l777y7GraIWLtib3gKDXeZkE4/yEyLOgd5k9r2psMZHzBeN3RNBoBU7DkjR/Vfia5/egiWPuFzqm
fv5mK11ogNX5XQAuvZt/zwWNXg/6xQEalso6CSxo2Bb0g0ITPepS65IfumGj8HyeCvuLFoAE7bcE
SpstSIrIsVyf/2Xo26030+5rcuRjL5tb5XWvfahI12cFn6aMhcKi21xlse3jdAdQRDMdAFXM+3y3
10aTC5zSKzFqIZRam57JN+VWO4DsfNaz6aIfNQdqHQwXtI6CX7yxViY0igmhEv0b2aE0OMVO0jUb
JqbhbLCgU4RJe5BTs2zcPo/w3DPoy/bvcMJT4g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WiHQr3wrci6uPswK932oG9qNnNduzboTDGsXLrTEkflQtYJrdfrj6nFYY1XEuKrhxchXhBv6YHUZ
rmy547FaH01iH0fEpfvicWJ2C6k8nG4PfM687kOD6NyLTO2Hj9m29wPSuKcGF5Ajo4YWC3voijpD
Z501An7tomvWwYAwUNZTxLdiVF/mmcrvBbf+hsV4NqwsAe60aj9VfrvW6hAAuL7/HosKgIAInNKA
AJQP6OUelOegffcUERWMNrnZ4K9dufq7EHMfAZNehNZdiKso1zGAztpNhZu1O+LXId4deN/CfBcz
bpp2t37VgAg7M98r8nZVm+pte5xBAYStZ8nDMw==

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
