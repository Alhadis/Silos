// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 15:55:47 2018
// Host        : DESKTOP-BUPH9QF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_addsub_DE_sim_netlist.v
// Design      : c_addsub_DE
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_DE,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [10:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [13:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [14:0]S;

  wire [10:0]A;
  wire [13:0]B;
  wire CE;
  wire CLK;
  wire [14:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000" *) 
  (* C_B_WIDTH = "14" *) 
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
  (* C_OUT_WIDTH = "15" *) 
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
(* C_A_WIDTH = "11" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000" *) 
(* C_B_WIDTH = "14" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "15" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  input [13:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [14:0]S;

  wire \<const0> ;
  wire [10:0]A;
  wire ADD;
  wire [13:0]B;
  wire CE;
  wire CLK;
  wire [14:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000" *) 
  (* C_B_WIDTH = "14" *) 
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
  (* C_OUT_WIDTH = "15" *) 
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
HsN4Ti4xOebbj62ToUMjKj0eoPeoBgQD72hCz9mRmMUCnT4VBOuULZy1BCu6UWAF7obq9gMaLIlz
mijluB5qFgF1Jl1/oVpXsMbmQ3VxbM2HCeuNiPPxvndO//gYkS25JVigsq/BRZbn0jrHnnHsz45o
3hGu4r/tszN925f1EkrCRke+CGrtJLOxfeDmi4bal9RNesxoi0ASk+ND4rQJkhdyBmBChTuvVJyp
+IKiWglnrxpWI8TZhbDMMffPScteXuj+rf2+OPnjpcTulGNkEjRs8IG71BwAD6KY7ZDCG732RpnR
fZkLmteDUESI1BmDCUHAC6gJJ1Xc9PzhnI1M4g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xMq0qGk98AnIOL4dgqLJggh0XTr1l3WKr2KOeZVDXu6U7d5f2jjkIwCFtDcGT0XlNa71VrKFm0mR
TvZBEWV6YaqCh9Ykc7YFMQBoSa4aNEY/pRyiaDrq04dfG1Hga0IAZG9+/MHu10Qk9cPkBCNVCKWi
1F+6XiHVH2PbB7Y3068u4F9073MbsrqtNFVqaCY9NJRfPc7OcNUwdA6bFuGzM+exzkiuiUmegsYo
QX7hW0YQq6aOWhjHqjAGVdGTb29UxqPvNFGMWJM6Ri93HbERzE4gpuHbck2IzCjkR0AZZMxm7aAB
YFOTs0Lz7XZgGjl0bh6+ep9BKnMtFxxgMfKfEw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13040)
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
