// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 13:19:02 2018
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [18:0]S;

  wire [17:0]A;
  wire [12:0]B;
  wire CE;
  wire CLK;
  wire [18:0]S;
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
  (* C_OUT_WIDTH = "19" *) 
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
(* C_OUT_WIDTH = "19" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  output [18:0]S;

  wire \<const0> ;
  wire [17:0]A;
  wire ADD;
  wire [12:0]B;
  wire CE;
  wire CLK;
  wire [18:0]S;
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
  (* C_OUT_WIDTH = "19" *) 
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
ICTuRsbwCmCOfuZ4enxyydXDW+zLUu1db1Gktm7no6aui+s2hvpMOP0LsAxHs1sFymjDXCj95GPE
gUe4GLXkBRbMvPTsxN8KuXDTTw20O/CnvqfF29lC4vT927UKp3o0OGyK8Poxo3Q+ZXCcHAfjvi4Y
jbWSOGVHkozy8xSl7hEtZ8VTo9qYEIbhPXPoJ09dr8sKolXHral4T8vxDuz0KaZZ38cdE0lk4/9N
UtQL/FBsRPfCrd2P1jjz14z+TKiEa5I7BH3etJx541tXDXcrqNw0ZKLQCz94zudb5IMqP9iZnD/2
UGzUPtaSCDdXKo0RpTBsZicpnJ4T5VM6EfoTJw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
x06+xDSasHcJc0gc4MPg2yU7u2EWKIlQJJZNAItsfK86ha3HFlOElozE9/n0PQ9v4VFHSFqxqkun
MB/ymq2lYRl4tQk114LKCVxB+uI2hOmwN5g/A3RUJm+5ly8dZOwtuoC7Xn70YswsxdUvKiQ1i45Q
3R7/Xs0IF/p2Aa0fvl2yMlpD1VwO48T1IFVoxOBymUc13N6LFtq1jrh4HLeWeX/gJpIvjEeb7JtU
sXgStWX5QQNNX022vkJAi6b+A2+tYzY/2hZviW7UVC1zpNo2EbMGGkiRJwxGYfiRRjYfyU1vx46a
h46lJn/x4dDPbUBrT+l91GgEMGSppdcF1yOPVw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12832)
`pragma protect data_block
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
aVV1WTUYxA==
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
