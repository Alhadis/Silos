// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun Apr 15 20:25:14 2018
// Host        : kacper-pc running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim
//               /home/kacper/SystemyRekonfigurowalne/accumulator/accumulator.srcs/sources_1/ip/c_addsub_0/c_addsub_0_sim_netlist.v
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
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [12:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [20:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [20:0]S;

  wire [12:0]A;
  wire [20:0]B;
  wire [20:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "13" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "000000000000000000000" *) 
  (* C_B_WIDTH = "21" *) 
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
  (* C_OUT_WIDTH = "21" *) 
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
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "000000000000000000000" *) 
(* C_B_WIDTH = "21" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "21" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  input [12:0]A;
  input [20:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [20:0]S;

  wire \<const0> ;
  wire [12:0]A;
  wire [20:0]B;
  wire [20:0]S;
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
  (* C_B_VALUE = "000000000000000000000" *) 
  (* C_B_WIDTH = "21" *) 
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
  (* C_OUT_WIDTH = "21" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_0_c_addsub_v12_0_11_viv xst_addsub
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
VvRyvqNEbrwtC8ttpSX3CriXaV9JiwSbZADalgUGrNu9n8mm2EbRh7ReNsQDmUXS8k3I1yyRIvwr
Rul7rqs0Gf90pGCmplLYSB8oXZkIVf0AHjIU2rSv3N1D2Jr2oIAApmYTV1hMBOB3HChEYjR1R/oG
q1z1jAzbuWGXG+i3XGEYtWHG6W42zIAIwo57LG8AAGOrQVTtVivUb3XwNPMBs3vmGjliP4vX7xEZ
2+W6VTl2LpGNtSPCCfbn9jyYDGsDQucaizpVG9lAOzZPPr7vRddjT5nI+9gD4qMC++PMcmZjNXd6
ZhHPxjuWECzPD8es00X4nQJrx7NcVSaKNJ7mJw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Wkf3WLVfGe4leFPGlMQfq3gY+e9guRiXWuPbh5ufaUZVKQTDdci2oUR3keW/x3nCjed4h6DrfJ7/
/KiYs6mIA6G8QUzj8MP9wgn2lW39oY+G8zGVsTwhubXkw8sFTR/qdXI6fA3wgP3yp1UPnctmQ5Wn
QjD3B5PDQdG5o2LjmsF/i3Hj18wVJVC48Hr8hR6nA4Hy3y6STYfWe1tIgy80BY/u3Nm4JQI7X4va
yN7LnhX9TIHl3gokd/g1ufxadO9p+aYFLPjvoaJVSXHLPhC/w6RW6YC76juj5GIJ5skkHzcB/yPp
i2fw8jQWH69O26uoiPru/lQJkcE8UQA16Q3beA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11552)
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
