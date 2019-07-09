// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 16:28:08 2018
// Host        : DESKTOP-BUPH9QF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_addsub_EF_sim_netlist.v
// Design      : c_addsub_EF
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_EF,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [18:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [19:0]S;

  wire [17:0]A;
  wire [18:0]B;
  wire CE;
  wire CLK;
  wire [19:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000000000000" *) 
  (* C_B_WIDTH = "19" *) 
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
  (* C_OUT_WIDTH = "20" *) 
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
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000000" *) 
(* C_B_WIDTH = "19" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "20" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  input [18:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [19:0]S;

  wire \<const0> ;
  wire [17:0]A;
  wire ADD;
  wire [18:0]B;
  wire CE;
  wire CLK;
  wire [19:0]S;
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
  (* C_B_VALUE = "0000000000000000000" *) 
  (* C_B_WIDTH = "19" *) 
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
  (* C_OUT_WIDTH = "20" *) 
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
MgnVj/qi9VCA3ewAamC0e8i4YOq0dBpd+loWqpZduZ+2DlRVFfMzTwZxG6k1F3JJ48kgRFFvpCY1
NLbaKHN/rP3IiD2YpnPXKefqGviXSyB2vGh2iUTaeSjXLv32V7Bo7j204qFg1FjbWVh/v2NVfYEJ
0TKm4mGudtZ67ajbr9UobDW/T79BhE0XcvBjcl8HMfoxhY70ibk9i8uzAD4/8pZsLZ3h8D3KfqXH
WTddhwTF+C1fprlAg3ad00frhoR1hISCc+ewPdhOzxWRXxl6oUD/COK07ecHqKwE6ahGUuw0sizO
zZTFDvp+sPN8KCrAZ/yy3h8klpLhs3P26IdNfQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
B1aUH1l+VCZw49Vxl95v1bPj9yDofOcP1aRtLHw+Yh3fjqTdVEF7TWE23spLDpzYVgKfm5NAyWOB
3fHwuo1osfLtkEIgpKUdyOeDmiXDQhNRhozl2VYUZ/PcOhd5xUfRgkfFyH0XYWYOT5JkIzs+D3EC
qIrTH7FHZqXHk+ExLAzlZf1qTffjuX15TvGFYBDwWAs/Keu0gnYuC7ukJOGQxEyOfpglPqwX638k
oxNpdx63X0CcGB2RzFw+kAeMTHSVRKiYD2sXrBIAbV5diHFBNqaNktqoB1Mr2ZV9AZNZBtl2SfAU
DQaHIqdNv4zq+GGmTelGb9ATv6GW/7NE9z9VCQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12768)
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
