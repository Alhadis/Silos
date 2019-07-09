// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun May 27 21:09:33 2018
// Host        : kacper-pc running 64-bit Manjaro Linux
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
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [10:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [10:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
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
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "11" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  input [10:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire \<const0> ;
  wire [10:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
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
oM33oYB9+ybWQPnceStUW+PzsAAV7p7ihopWUeC0wfS/0sPa94eg5zOjyD8mPZL/UL1E6gUo2SOo
CBK0FVWFNbqgINp01I+ve2kbS8g67X5EdRzH5Mtnl1lg00k6yG1O9vAAWGZ/s2uoF+4F01Tqt+CA
8dZPstvp6z8ixVo+ccq1wzrqh7VXkcFDC7jrcQKc6BWFcNzBPFYLLjFBnRqG4xCDYJgefEfvyzHY
//w8a4fd4bfRzwRf1Na4qpOHzDKJybZollfkRnUZUJwLcZTqvD1Yb0TvmgKkF9GtebUO/ma6soES
cB5exEk/uLXNg06fZIRjdPYEHKV5XzvnapGuHA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EsfepwZSxc5c3XrKDr++gNaTczGkM/+4GRJqmlQvzfDnNFAJFu59Htl3a+ypFeOLuNyiCU9g0nET
nw6BhxcGAS36My4/7FzqyETAuDyWp9g/ToSGQSQUOUp5gGSR9pxN8UlnRubJf8Qmp88UQ2Ggzr4o
7MKu85ZnKgtSo+9bZd5eVNMoX8nrAIcrNlfc3INRdYg++ruexftlOrgmcRNBxqWtvGnlrHQc5Uy0
+47ufelRMbi7J6lgiCB+IT9Ov3NJbP8FMmT1s5HDlZlU321nlrlwYi1tod+rkrv0orRpas1TxYZt
hsDqbr/0QFzfE4+2ky0xfYbN0Ssb8joW00qBbQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11024)
`pragma protect data_block
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
DUHmKYe75e62midiHlHaSEihu8BHAEY=
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
