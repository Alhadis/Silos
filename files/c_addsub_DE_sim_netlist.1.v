// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 15:55:47 2018
// Host        : DESKTOP-BUPH9QF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top c_addsub_DE -prefix
//               c_addsub_DE_ c_addsub_DE_sim_netlist.v
// Design      : c_addsub_DE
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_DE,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module c_addsub_DE
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
  c_addsub_DE_c_addsub_v12_0_11 U0
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
module c_addsub_DE_c_addsub_v12_0_11
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
  c_addsub_DE_c_addsub_v12_0_11_viv xst_addsub
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
