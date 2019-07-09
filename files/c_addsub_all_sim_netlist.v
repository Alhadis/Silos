// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Apr  6 16:02:32 2018
// Host        : DESKTOP-BUPH9QF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_addsub_all_sim_netlist.v
// Design      : c_addsub_all
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_all,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [30:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [35:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [36:0]S;

  wire [30:0]A;
  wire [35:0]B;
  wire CE;
  wire CLK;
  wire [36:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "31" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "000000000000000000000000000000000000" *) 
  (* C_B_WIDTH = "36" *) 
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
  (* C_OUT_WIDTH = "37" *) 
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
(* C_A_WIDTH = "31" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "000000000000000000000000000000000000" *) 
(* C_B_WIDTH = "36" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "37" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  input [30:0]A;
  input [35:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [36:0]S;

  wire \<const0> ;
  wire [30:0]A;
  wire ADD;
  wire [35:0]B;
  wire CE;
  wire CLK;
  wire [36:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "31" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "000000000000000000000000000000000000" *) 
  (* C_B_WIDTH = "36" *) 
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
  (* C_OUT_WIDTH = "37" *) 
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
AoOKxCtLhmx8eM0altud9vVeQZEqnnTKAgdE5EfUAqOI3UN6Gs/wKJsV5g9yOfnZuxl4P2aeZ0K4
ErGHsM1ZT9UWLsTdXJnVb4rjJeZk8UnqY8o/gTbaCi0CwUBs2p0vX4sO3QoozS8u6WeivZwMfEl7
jYqyLprqpyBVzwLeVMAz59mLLt6Y4nvCONqTKDRXTe81XJfvPk7p3hDyzfNqx3gVrMvFDLjw2Coh
2WmIWbImH+sSmIrKorbRUkOtLLbF+mk6g8WA16oOERBrItvlxzAcSNlCGpPdOXfw/VqLwwpB+rxQ
ZNI2RdGJYsfEYozq/XbM2db8FMzzuIE+YwQUKw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Kd/r2ZpuarLj8w1PPbd7Bpy5o7kpJD2n45t9UMeXSRXygvvJHGkIRRh23p/Igl2cvcComuYR7JPx
3yzyjL7WS+wlzkJJFDwFHp32xxzeVUTjNQCJ+7760znE4Lf72vMbMfzPPTr+TuKO6cjj8zt0kN+o
0NfoSPyvkYZ3/et+ycE1IWgTkNE0seKoiQ3jiOJ/TSlrBFmyvia3NWgJggO98vhsHuRwqFq494oq
4uBmPQQjo1qioMXx+SK7jQNMT7pnxpuDkit9kQO8b5EuB+92GOmwC6sjUBB6COt9ZVmPsvTQ1yGl
2pEpM9CFlziXKw11wVc1iFPzjS/JJgcBoeG7Mg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11904)
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
