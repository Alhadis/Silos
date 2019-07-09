// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Mon Mar 26 10:27:12 2018
// Host        : debian running 64-bit Debian GNU/Linux 9.3 (stretch)
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [9:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [9:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [10:0]S;

  wire [9:0]A;
  wire [9:0]B;
  wire CE;
  wire CLK;
  wire [10:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "10" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000" *) 
  (* C_B_WIDTH = "10" *) 
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
  (* C_OUT_WIDTH = "11" *) 
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
(* C_A_WIDTH = "10" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000" *) 
(* C_B_WIDTH = "10" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "11" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  input [9:0]A;
  input [9:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [10:0]S;

  wire \<const0> ;
  wire [9:0]A;
  wire ADD;
  wire [9:0]B;
  wire CE;
  wire CLK;
  wire [10:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "10" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000" *) 
  (* C_B_WIDTH = "10" *) 
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
  (* C_OUT_WIDTH = "11" *) 
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
YgT0DHQ2qNzSuBG4y66YIEzAwjMU68CNgM4V2StFx+1t8MWngnl8X7sv2QaSbGewhIU/VJPsWavo
msFGAfaEmXblYwlUWBVoXr8KEBrUDdolegfbHlh+u8sMSj2EyeCbIYp54goeL49Pxjtd/62/7Qwh
dYUmCue6emgTtFYIneydz/TcRnVGa+BkTvCWIlXxGC+6jdxAYYigJM9IE24VlOPB7dBBA3OQ0ZS6
OVMbXhTHO2gk+KPj9PHvWaev8SRrgb+fvdbOSaIdwr3qjBLnxBqKw7510mUQ1YlP5GC4OETiAc37
70OSrVkCn4fmzZR43ugRVvZ6x4HpVkmYZ4ejlg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fYEzWno+a/B8oyJ3KSMu5srP4vdw3Jus5/EN/0QMsGOKN0x0T/3LsX/FdLqk5e1UkBD3bNdRegS+
UMlA8qW+t5o/Odz4RLPb13oZOjnErERQ7ycNleQK6OVIgEq/WgEdwMeQ0QQzdWzycDJtCQMV3K2g
KMRazu97vE/87hoEH+ZZstjMRMUItJw3jWWwZzAMmgUM5/1960FaTmDLkA4M+sn0W+UUnxbMdMgY
0X7F7OtTGG5MAR05eETNjvYqO7JMnzVDKNwdENfNKzlH9QhWFC1dbyMtnX9mbGHE96C3tqCcCtMx
y1hdthr95XUefDLAKwdKVVBqqEzZD6S38Uu6TQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13136)
`pragma protect data_block
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
8bPPCXSqXQXs1xkrk8Ezfb8uqLxv26Nq/bw=
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
