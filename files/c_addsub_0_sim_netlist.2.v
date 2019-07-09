// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Apr  7 12:47:29 2018
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
  (* C_LATENCY = "2" *) 
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
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
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
  (* C_LATENCY = "2" *) 
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
ogZcAIzBQhcNXb1IqqeE/kcjsaxpEY6KT7HPYarRwbFEMdK7orK6prlgV+pxKmmXEB9MeGVWH3Gk
b9gOkS+2mO8RhdJdfusAZB/Eo1rEgBXj4cGjY9LFVn1v0QcxA8+pSmpRyISIEat7ipvJTcwSFc7K
Mmpfu0Qghrq+CkwDxkc9XX6qcOPW2+Uxbs/rXxIQX9QWv73mmMNp/eUS9hPrS+8EmwFVWcnL/9z0
xjVHKpJivOeAgMTBELRH94HcjoNlSCvPfx/D0bl6GS4It+oJ+5aaP/weE3dIplLbcSjM0LbhaKod
LsYmBD1/ga3QLi63L28aqU4t3zau/vRbgtIyIA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IAkM+HhHCPMlpLDEeJaxYVdH+LmSPTUpszGI5IWBaro/kV5zFGGMvT3GnHLZyxFNm8GeGg5XnJ7f
IlE5xFcLuEmvyEWCN5r8xoDRWUe3+amJLVE4yAXtiYVXTAe99eLouopY5seqPs0DZ9OnE+VThvDr
7WUn7J3oBqhfIIaKzuWjOfOAC5ItANW0G0WBNwD8SE2IJ3tf25cEQhON5aNBM5mbbRGsnPH3nDzq
nWrih5GqhIiO6cNI+sskxmQiN38tT5+x9vGur+5RIhPPRUx+i3xU7MCOSowq7NRp+rOshcTCSHoa
LeJGr9nGYAx6UbaBLH88r8pTO1LvHl4EVX0thg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13120)
`pragma protect data_block
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
cLPKOGAMH2E3Sg==
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
