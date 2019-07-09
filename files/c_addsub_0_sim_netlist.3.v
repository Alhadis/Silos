// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Apr  7 12:23:16 2018
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [12:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [12:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [12:0]S;

  wire [12:0]A;
  wire [12:0]B;
  wire CE;
  wire CLK;
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
  (* C_LATENCY = "1" *) 
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
(* C_A_WIDTH = "13" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000" *) 
(* C_B_WIDTH = "13" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "1" *) 
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
  wire ADD;
  wire [12:0]B;
  wire CE;
  wire CLK;
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
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "13" *) 
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
eixR6Sw4jPtvL1SsE/2GeKcTmMukj8b612AF07GAoAoRwezzyjvOr+Man8NCs1z6oJ5tlJu5bPjP
jBe4wywGsZ5hgsF6uskvZyOLS+062bcvMmDcyIgqKTOn4Y9PcnVHtntJ9XCPp5wErDN6Vn0mCkyc
IkVt5xT4ShqNKNPyPNlPJpGHRYS8Jon4FYW+eYFNS4hvCP7nDhDke511njVkh6hdLkfSGKyCUjKM
y+2doYJ1mYdOzjNHweNpH2SyzfeZFr5tDIJ8YiGZjP+puCPewZFkTg+bLGrvQwB7S6zy8ULH7QDC
NB8Tex9E+FSdJH/P5vtJ/WXw4kUgPB/Bw8Z/ww==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a2PfHTpLKpgaQ9aLacFg+s2VQp8SFe/mR5/R9AmG/AjbcVLLMhTzYdiRznE9jQ7Zkl5mllGT8tw3
TJhuhTl6F8K2X9co6ITjbUNfZ6CPSKl82IsdN9AbwaVruaZzrPj4ZGxuZuZXUfFzbyzpx6fBOUUl
nzwjHh32GZMWm+UQ5pj7pLAVY3UGfmeNNGt0PjAn0Mucn+FOBGWgnZPmUcwCkUT9CUKpAjjxiWAc
UybUYTBNk6R3cwdeeDHdYMs0729OOtazohpOdbEhgMOLOYL+/L6gq3k9OYak/APxqCM3Rd9YNLlG
obVOhWF41C0FeGT/zoD7MMn2JmNTG3UN9bGjNA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13184)
`pragma protect data_block
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
RNCe38u6ifVSQwgcguUXOlk=
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
