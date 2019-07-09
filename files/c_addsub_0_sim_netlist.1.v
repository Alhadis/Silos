// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun Apr 15 20:25:14 2018
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
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "000000000000000000000" *) 
(* C_B_WIDTH = "21" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "21" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
qVTREYW9/F0Z+rBsP3xn//1QUtY8Pl/USNzoT9UyKJUM0Je9HQlmpxC1LAuTcmPO5ow60Hv84WXN
6mFmNCmQffykiIa9RmnYmMp9MWsscwRKrQEdQIDSmXmFCQMlJaVmbAQ1USZpPnVFhB11nFoIn41Y
N79+mpzY73tL9fAqRMv7GvwiyN0rFrXXs9YjrnPc98RQZj2jHV/Y/xEsaDaOFakJ3TnLmIdG8r87
ZWPgH6yCoT0Ia6JL7NA34w1Em96v/ijjpwGuu/Pgfk+oFnzDaSQU1le/BD2lSfftG5QkhZ5VQivz
9k8e4+vNecqu5jhH6KRXeh4ir3vu/TEIB+ImnQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ylStCea0w0EyctROraI4k9N6atUfIuiRDWAa11Fan5fToM+Wl8zhLkqZot1srCYlXhRAjLWMmqYt
tCSQLiAFhJH4UbLy4zdFppGcH10AslFWadNu+ltd30FWHTMawTPNM+00rjtWiN+zGDunDqXwkzen
s/hFSkNTVDazdJwOKjkxp0DFd0LPA170BrQaJdDloT16Lcxh6L/U82TvnBRm7EYrHCLqyWI24KMv
Y1HGVjYdO2Q+kCsGDKrMpsrJOq3G0bEcIzJS4xa5sprIgrFbAFudzdYSN7az9I/hvwfof4MZOirg
1qtCiEWfrUmxMZtDO21mQVVDcmnWW8zYuXBX8Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11584)
`pragma protect data_block
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
7bH0IL0bzsh5Aqp1Kw==
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
