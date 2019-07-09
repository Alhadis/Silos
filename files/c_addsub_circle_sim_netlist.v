// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun Jun  3 23:02:46 2018
// Host        : kacper-pc running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_addsub_circle_sim_netlist.v
// Design      : c_addsub_circle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_circle,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [9:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [9:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [9:0]S;

  wire [9:0]A;
  wire [9:0]B;
  wire CLK;
  wire [9:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "1" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "10" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "0000000000" *) 
  (* C_B_WIDTH = "10" *) 
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
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "10" *) 
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
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "10" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "0000000000" *) 
(* C_B_WIDTH = "10" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "10" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  output [9:0]S;

  wire \<const0> ;
  wire [9:0]A;
  wire ADD;
  wire [9:0]B;
  wire CLK;
  wire [9:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "1" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "10" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "0000000000" *) 
  (* C_B_WIDTH = "10" *) 
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
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "10" *) 
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
        .CE(1'b0),
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
F+CaHmwjCD7EG1pOPYXgjpx5K1gSKc0Tlxhlibmyop6m3/cr8QXY1Vtg6LWz8g1AZjk9DcHX6XD3
TERV0y0QiUl/QFnWYn32s9PhSG+OanCD6So25G5Xepiemo4YmanhLw0qWwAVdh2T8jH1ZFdtBp9W
fpmAP09lBw0+TWMl8hB6wlzRpN7HwfDd49uny1yybul+8Xsdi+GA8ZUasfikIF1VlZT6LhUnmQPf
hrJT/PZwvgvbCewMdnaX/jGSb+kT0pIdvHGH6ozVHMs6JReGxs+W15JuRJ5UPmX/gDDbesuB/MTr
SY0hvpXfv4Av+h/57QCR086ZygL8vMS/DuIOhA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
O5VgJDQilNL/yNUMoY9DbEw9LOCpNF252cXHU1Db3ocS2jzN7lYrCKPqfjQ9Q+sufJsKcQHSJAYT
Ma3nqS76BeIv0Fzy8qC57hZSNr6X9nzdwjXY5fn8H+7O8rAWhVIXMIweWa+XZj8F+ukU3w2ADGDQ
PWfLE2Dubyyn5j79CSTZzp7+WsV2NsW3z3ggGhsFuPb0UKt7+CAwYEs33Kj+Ao51uSRPPjFC8ywW
1+OFKhesUWly9RggdWdHJAz5AH+XHITZKN65DhB5lO8O9bIenMz/0kUjShGMzOSvL6iKUVOU3b7K
xsV1GJL5vAQoFP631yi5B1E+2YbRaoaij9q/Fw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12688)
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
