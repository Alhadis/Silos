// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 16:00:48 2018
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [18:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [19:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [20:0]S;

  wire [18:0]A;
  wire [19:0]B;
  wire CE;
  wire CLK;
  wire [20:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "19" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000" *) 
  (* C_B_WIDTH = "20" *) 
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
(* C_A_WIDTH = "19" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000" *) 
(* C_B_WIDTH = "20" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
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
  input [18:0]A;
  input [19:0]B;
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
  wire [18:0]A;
  wire ADD;
  wire [19:0]B;
  wire CE;
  wire CLK;
  wire [20:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "19" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000" *) 
  (* C_B_WIDTH = "20" *) 
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
  (* C_OUT_WIDTH = "21" *) 
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
N7UBaTpZ2hrO7yJ0CdsgNVZIWuDK/eADrMvMPQfEsptGOeSViZ6rnODi1wxkH9YYbj7ipnTY0PYb
69K7+mK6NZr91NO/P8dGfnhFCOv6QcIzO4GnPWiRANysSFuzQUEXdSOSo2nttguPm8ktU3UiS8Sk
Nbszli1VSRuHx6P+trib3cstbWaaYdeaQNoTI8xRp+wXnem7LQ/OTYKcZFYMp3QNim2gYrfiwC3Q
k20K6u6C6qrLO35+Il3cOZYtQ2xq5H2nTr9dyFjOqb3Y5BXGjKhynaI0pJBrQe9ozR2ghDezSc0o
CQaYbErtfEWIe4lYnh7IMlCkIR5t67jeGPWc1Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yK4kgZYMDqWF2GCr1ClICEgQbkpjvHJdkApEQpfW1/4OGa7ItveVLv22by6BAQH0HYeTUQXJ+Qv5
lu+5G9MeMaZdMV7ZeFve0VsXErO+E6l3zCk7/G6ltLcgq8cOzwWP1Njr7g8CFet0LTY9J2IpzIfO
XdYRdVEHOA8LNvGS5tToWSNZsUNE+AdXULXMVrT1qNQ5B8RTA8Cz7ohncpWvmXvpxc6eUuQcNJyW
L2YRcFqgCJhSivoR6tbpWCZt9pfoXW2zzu4As5IRHCwnLUFUSKajk/Jo5JESjqLNvMoLLFNlwjRn
2z8h/qCtQXKrd1IXy8zKuRE1kODBL8OsqKtgVQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12720)
`pragma protect data_block
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
HFMGHCu2QGTR
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
