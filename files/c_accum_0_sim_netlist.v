// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Jun  3 19:49:07 2019
// Host        : DESKTOP-OB4CG3B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_accum_0_sim_netlist.v
// Design      : c_accum_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_accum_0,c_accum_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (B,
    CLK,
    ADD,
    CE,
    BYPASS,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME add_intf, LAYERED_METADATA undef" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 bypass_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME bypass_intf, LAYERED_METADATA undef" *) input BYPASS;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [7:0]Q;

  wire ADD;
  wire [3:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire [7:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_add_mode = "2" *) 
  (* c_b_type = "0" *) 
  (* c_b_width = "4" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "1" *) 
  (* c_has_c_in = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "8" *) 
  (* c_scale = "0" *) 
  (* c_verbosity = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_12 U0
       (.ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "2" *) (* C_AINIT_VAL = "0" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "1" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_OUT_WIDTH = "8" *) 
(* C_SCALE = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_12
   (B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output [7:0]Q;

  wire ADD;
  wire [3:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire [7:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_add_mode = "2" *) 
  (* c_b_type = "0" *) 
  (* c_b_width = "4" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "1" *) 
  (* c_has_c_in = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "8" *) 
  (* c_scale = "0" *) 
  (* c_verbosity = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_12_viv i_synth
       (.ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
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
R2WRfNM7iQfVezffU9mXj7DNae56tUQw2KSdDdI4OGMYB65JnERrwsR2dRInx7o7wH1Brw7ehdso
AxemvL19bQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
umbbDadnux1HIv/f5nt3od0S8xUq+jhzaSGi+5TlPeW6L931zufNZnEKGpZodz45bXX8TxhW8JI3
J12xUnskyRF5krUTBcSoqcMJr8/06+d4nJHedF3WjWnW1gHzNmrJoEUYRigH104FnWzebk1isRIr
uCSdAzalikXhTX0SEiY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aTp1eCjrnU1khDqTWy5d+cZDPSAuxQwnTycBPO6Y1aMzqpnXGjhvaNSjYXFh2XSlHbf4EwbDRXqU
K1fW9WBj/U213OBYmro12wgQzjA1GAmNMXMBq4GK1HGbW169XARW9nfzhl95a9jV6qi506hsEK67
g67p6VIHSrgUnhkZ7ez3DpVagtvsGEae3GAFNgKRL9EVO49cxteh3tlOPfgwheDs9USfBIdfa+yB
QV+scaeiQVLOFvXl8t/kTdLx9lEicWLFzNKOE2sVSGZgPvd7fUwZ+y8EtoKTrXzK44aVJvVOiD6m
vTmmSUPCpRj5wl+f0jclvvc86ycqX4gvC3iA9g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XM69JFnplXxalOK99DHcsVHn16k5x1wa/VRdDOR58eYORKM0EfVwK0CqBgG8xVMVulfojxFdppHa
yGzaeL+A8AqbG1w70JWFTru1upLFxJuozxX2AsOo3ewr3ws7tRDZVMoI+uwVgZ+8VyIB/p71YZL7
rWcStJAJWwPmo7JMDVGi7O7lywBtA5r9pDxBRPh6eYRuaLxSllrJAj4FkFA7JbGriJzj3vSrW+sP
7Zs9EBsxbXI75gcdVEvJbPoDfHmbsViPVMyQOXi7zo5w4MNf/nCnJadJLRYnPM6TgOZRxGY9i6Bu
y7FVhmgG241mQi5/8FcBdJy6U+4iQZJHbfZXYQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
h7a3PoBXWVyoTzWRLpoXTe52cvA8XSFHzkgYj56I8Df/WDYXD99No7bXQK2NnBnU2QTR0UtLY1nm
c3Ca0F55BQ2WArsbuUl9g6xAtyCfQkQrh3iw3CCTKKVgac4/wGTyWAL71gLKQ/587QYPX1oiFHop
E1F8SfYj739DqBTi/GIHwLA5G+XRYBT9KgQMBbliiHiRNCD35p7ZrngSX7j5x5Zyef78BbsLpSN6
nfBLa5KhSRE+anTpxCjDOtMId/PIp8ggvAFfA96aXOGMlF9WOfoTzYIHSU56BvDQJlUYzJzWD8vZ
HdQZe6g1qfOyVcETeM9SLE9f18G/ypg/cJO46Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hcaOEOxV9amYvmRV9jFkhRHpbu8mNofSGci7o22h0i4J4+5anRkzdXz5ihgmJJ70fzRge/ZpF33A
xGQdRLzSOJnx/0BXHpYpJZmNIHZSMZ623YSrTvEuvaf9YdF7lNT2gUcY1z138BwEKukso1UEBSoj
d5NwAziWrdV5rD1He1s=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
X2Xllt9uFeKr6FIBXnJCIzB/ea5RHsUZWPGsJj5FMTHs70YYPxMdlvhX5fMq+3zwRnGLBh2AXlMP
62zwKGikYjtmAJgWsxVxeIAfmLNIoWeJDb3CXVosgoqn1IqFssNWNDKdTGYe9MYTkqRd6QW6R2GX
BnNBdOhSsi2zKr2+y+xqOwoH7yi8jopYEdPIrgHJT58LYcR3uUtM88nga0M2yiwOK20+2btxZLos
JeF6J82bC9r9xvEViWwuspHvhE8eSkL6x7eqB+OIOpF3PFLbV8OmAoKkOBmTuulR3Jj8MFacFgZM
Bvy/68az8+wRddG+v+zCI368BrObIO1JMPpnGw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bf2fP2st8X2cBOvrAiQx1pgVBASvG9u0vmEaXPrlXAHKFqjVe3QcrCJotnhuA+xXsG+KITafJn1y
Ntf7jUf00zC3KAb3lK5DHl12gkxAS+hDc7td4KlZrls/WvV0ep9scvMEb5e7h0u5dl53P9ZeG84g
bd7AM8fp+g0aTMexhZqPend5wvzHZ3oT1Ngw5A8/bIkCmDyRnI9QJsJa8jvgChBtlT/NvmNISGek
MROFfoKMi6SYUoDF1njb1547MYQv16QCsIVeRL72uW+/SsbUsT6usMOMqMsa30wDbHbc2m9lGQ3p
IxJPHdDSyAOOT6cb1EaxF9ANOm3T+dWIEHpHAg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BxT2IAWtEgnU6KZcERcUhRNBYdy9So/yxR5pJTP8xO0OEZ0HyDzvMRIEEhXOHK29shi7L7rYJvZt
tcf4QEi+skclG6VexpZ2Oxt1A+u1pks8dUY+2vEDgiTuk9mVf0aXI7yCeLdMHgN4CB65pkkTOsfS
ikTKF0JaYI3xQXUZmHFixWRD2TDcGqlvcMbjH/0j02uStaowFxIFcUE7ljUcsNY8/g48Q0N86U3R
W9jzBKqjcUUGEyBaqi3cd12DeFjaFgKYYo8JOwMurbgyeuSjq7bjFqsDU/ZjxF6m6iJx+rXntcoo
WqHKtm4Dwci9XZ1qwxlpzfh0gacAu7GZ91ZkWQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14112)
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
