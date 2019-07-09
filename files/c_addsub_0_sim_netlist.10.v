// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Thu Apr  5 15:52:32 2018
// Host        : kacper-pc running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim
//               /home/kacper/SystemyRekonfigurowalne/operations/operations.srcs/sources_1/ip/c_addsub_0/c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module c_addsub_0
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
  c_addsub_0_c_addsub_v12_0_11 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_0_c_addsub_v12_0_11
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
  c_addsub_0_c_addsub_v12_0_11_viv xst_addsub
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
G3Yfpi5LsE+REEWopVppPQKc9Rbm2WC2kBI8gyNFyxz+OwXAo9FFi63RLpY4X8qySaKVAcct5gNt
5mk2l4QHPuFPEpYvMS12ZylSJI7jBCMYjeT8PNk15x46NpOGf0RtTmUcUvIJ+S0oTRiDJQ2QXyFm
gF803dehjq0FDeI+eP9vEKTqzyxOSZKxFu/4wk3XHfvLGurQlSEiFCd2kwYwLsewdTG8KBZSeLwc
vPDNb/M4XSW3n0H0RUagQpRQf+88J26cqud/UXCh9lukax+V9X04B96SrByOlix5M/CZ7h07Qc3O
qN/lLwv93OwpNq6/REMMmAU4kdc6Ink3GltOqA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lcI57kU/NagQEhk2u2e1Z3FodIrnD8HmIVWjOQv9rjekCCMcwzsaHo0WC59lUc+UVWDJvRaCuX3B
EluDOHPA0ZqL1pQqSnX18sTHYf1r/0MjOaGYyfq+yr5/cFQpqBb0t37hGaBtEAW0Q42tdJxvNEeK
B2+Z3S3LumyaMWCxLgomTaXLKOS5eUhVyf6OCHGwLLBWlXcM0oeSrUT5OBZiEKdYt+3ONWpRU1C8
Q0MJe8aFhiO6rZm6H3JzaHovjco3QkduFZJ9pkJH6KCO1uZJ6mrXJWoUbAvbEsZeiv58nlxa+P4Z
ZsXsPOG4/Xfypjvt0iWySYVHlEyL4o0w6NfYkw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13088)
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
