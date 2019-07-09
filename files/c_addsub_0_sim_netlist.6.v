// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun May 27 20:30:59 2018
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
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [10:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [19:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [19:0]S;

  wire [10:0]A;
  wire [19:0]B;
  wire [19:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000" *) 
  (* C_B_WIDTH = "20" *) 
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
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "20" *) 
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
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "11" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "00000000000000000000" *) 
(* C_B_WIDTH = "20" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "20" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
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
  output [19:0]S;

  wire \<const0> ;
  wire [10:0]A;
  wire [19:0]B;
  wire [19:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000" *) 
  (* C_B_WIDTH = "20" *) 
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
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "20" *) 
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
TNvJfZ/O1gxErCIlHuATux5bqD/2gm0tvKZJRHWv4hBT3xu+BdXMKSpL4QoRH7XqSxRYrXzqh2I+
BgDujpL49Vu6f2LS35MMnsFLSU/36w5209c4UKoB592ocRRJbhHTfyZJLZl2cpCm3kGNESXigaYZ
+zQZQOKdZrd+zivaEZFaYBH8ma4NL5UrbG9CwUUtwtHcrWsWeBLXqs4pUSVEdcyLCM3bK+X2JVpq
l6vYWRC4NekoNwc3Re/fXz2BlAwdeIQxBpzFDS87ucBdUUPb0YPx9ZhGzWyFYALCUwg3ZIWU0Brq
xdew1o3yeQY+4wGpTuCcyvzUF/HEYbvlVHsRaQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uI3ZtIjFBHR/+8PJFb5/WZYWYuZviTaJQkrT/XzFLEWmJpOq2fwmKXaPy2Q82KHdc2XoTXojzNsL
dAdz/j1K3ddX+7HM/Qo3CURGSC2GeYjSgwkPZ5gOld21zjgfC63H/QkMpByuCQIHpjWLcg84KhcX
bURRBqBM4aQIs7da5sejATrkrjoExK42Xvq6kJpQF4JViaA6Q9IxvIDlY4PA2eJosgRQY7IHk4UP
hVGyVFbQAwoKGxSHwhHeGweSYz81web9z1UYGXVx3UnmC2jf1PTm8ZaSiHYEGbt0TMsPEcWlQ8JW
+4mQxBd06tGgyrEDrIrB9sNrFvhi1g/CR4r3KA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11584)
`pragma protect data_block
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
aNTXdrsw9gRrRJOwJA==
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
