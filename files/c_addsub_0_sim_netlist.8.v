// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Thu Apr  5 15:52:31 2018
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
(* C_A_WIDTH = "10" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000" *) 
(* C_B_WIDTH = "10" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "11" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
PVvYK3y8OHd86+XVP/vbT5AxFIj+rwUOUopVEPLz9pAGGA8gQN2HF0qDyZ+IJxaHt6A+SiwgZcx8
DyAFa+KYccdlhxYZKJHW3g+EtaPqaEFpM539n3ZqVw0pFCWC/Uw2WIK1EOdYDaclVGlhlxTm4PoS
1t6PGCrs4nPAhHzA7JSDdpN83GwLsM4Jg05ydHy3SC64+QrXibXDisUG+jf744cTsIvGwloI5LJy
4hcPub8EPpUzj2APGZY+6AWFSjgdRPkUQruTK/NFNysl1CjpGR+OHr5yp0vFmsM52/52o6MPGcd6
G4IL6WBQVikORl987zOS2LS0NRx3BjPcrgcOrQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ny1I+nfi5G3EsAd7FjTvqqdir/E6IZDGuuNwZLgojLsrpKRvKjuNdh4wcua3MYmbvo7nkKkNng7D
FHC83eW1LKsMpv4QZBCWfV6poKWyK/5orsrZcXQ3Oib/xO60BMlU11YKITK1EJHt+ski+y0ZS9Si
wa9lXg2/Y8pqymhrepxOH4BiKI7WJGr9WbGkAjn/SH1StVDKdWp+IWyAQvnqfKb+OwyuFOpK1B1O
zRnQhcZOzEq66fP4nDbBuqlDLCLBXPE2COmZB27jMkG+mp6sb3MRZyyfnZoAW0mettgkmz2KAJfE
IB3LBMZVCBTk2BlZlvVjVmxP+qI/5+crTuzlzQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13136)
`pragma protect data_block
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
XNbfOc5wGuSTYwo6fUlg2x0fKrLteulmvj8=
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
