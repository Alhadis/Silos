// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Apr  7 16:30:53 2018
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
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [12:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [12:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [12:0]S;

  wire [12:0]A;
  wire [12:0]B;
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
  (* C_LATENCY = "0" *) 
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
        .CE(1'b0),
        .CLK(1'b0),
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
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
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
  wire [12:0]B;
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
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "13" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
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
G7eHnjBszcl2PR3NH9NM4N2uCjXf7th3zgzp5aolRkpPWw/HfDt30xgcxb3Y0WgKVu2WrNkF8SsH
6ag4B2QIFYT02boBZSJhTw0iF4lN6GWhbSaQ6vrkeqJfacxGQgYKMNujX8zRmmAKwfyiut2z5LrX
uO9BjJOIL0EVOHzsukWI0OKRuA+B3M5rR1zT1flkORIKgfGKqD5v4UWyLHjGsP7NxU9Z/oAfkENu
h8j6+xyKbmDq2dAcULpbRdVrjV5TrGweKwyIZyJLl846DH6jWtI7rX9lBqN2P/qzGYYfMu3XOZP/
4Ium0x9DLSQkceOgUndz/X2QFjzW9k2u0Iw08A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AXES6YrF7FKDL4ErViezyPbASiIKeBIRutRAmka1KRGyiz4fV04EqLW/dLe48UhS7KgGG/tSmuTP
Nj3ZOxcSI2rVfRMxTtSTLpM57MhTdiNGw0TYo0vY1t5cVDYheioMnfjKsP4v6n6MpqPo0dqSIltK
mRgPNqKo2SDFDzBu8aJavTAonbCWz/TaDzCmrN6zZdTlB4Wtn7qjWWKCKOQ7UeLXft741GwwzhCV
LoYspXdzykfIR/brzZ/2sOAmsPNV/ZhuSooRkuGQPsdkk/31M/5USjadraaBGuafF64+SiNUKVfF
evNXPZPhamhHFZsTuhuZbdLVryIFQPkkJvVDHQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11952)
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
