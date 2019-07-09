// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun May 27 21:09:33 2018
// Host        : kacper-pc running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim -rename_top c_addsub_1 -prefix
//               c_addsub_1_ c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module c_addsub_1
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
  c_addsub_1_c_addsub_v12_0_11 U0
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
module c_addsub_1_c_addsub_v12_0_11
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
  c_addsub_1_c_addsub_v12_0_11_viv xst_addsub
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
