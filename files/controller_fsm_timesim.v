////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: controller_fsm_timesim.v
// /___/   /\     Timestamp: Thu Aug 17 15:23:23 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 4 -pcf controller_fsm.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim controller_fsm.ncd controller_fsm_timesim.v 
// Device	: 3s400pq208-4 (PRODUCTION 1.39 2013-10-13)
// Input file	: controller_fsm.ncd
// Output file	: C:\Users\student\Desktop\COA Lab 1\Assignment2_toburn\Assignment2\netgen\par\controller_fsm_timesim.v
// # of Modules	: 1
// Design Name	: controller_fsm
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module controller_fsm (
  ldn, ldout, clk, ldf0, ldf1, go, Tout, ldcnt, over, Tcnt, Tn, Tf0, Tf1, B0, state, fn_sel
);
  output ldn;
  output ldout;
  input clk;
  output ldf0;
  output ldf1;
  input go;
  output Tout;
  output ldcnt;
  output over;
  output Tcnt;
  output Tn;
  output Tf0;
  output Tf1;
  input B0;
  output [3 : 0] state;
  output [2 : 0] fn_sel;
  wire Tout_OBUF_267;
  wire ldout_OBUF_268;
  wire fn_sel_0_269;
  wire Tf1_OBUF_270;
  wire ldf1_OBUF_271;
  wire fn_sel_1_272;
  wire fn_sel_2_273;
  wire go_IBUF_275;
  wire Tcnt_OBUF_276;
  wire ldcnt_OBUF_277;
  wire over_OBUF_278;
  wire state_0_279;
  wire state_1_280;
  wire ldn_OBUF_281;
  wire state_2_282;
  wire state_3_283;
  wire B0_IBUF_284;
  wire Tn_OBUF_285;
  wire Tf0_OBUF_286;
  wire ldf0_OBUF_287;
  wire clk_BUFGP;
  wire ldn_cmp_eq0001_0;
  wire ldn_cmp_eq0005_0;
  wire ldn_cmp_eq0003;
  wire \Tcnt_mux0000_SW0/O ;
  wire ldcnt_or0001_0;
  wire \state_mux0000<1>1_SW0/O ;
  wire \ldf0_mux00001_SW0/O ;
  wire ldn_cmp_eq0006_0;
  wire ldn_cmp_eq0008_0;
  wire ldn_or0001;
  wire ldn_cmp_eq0004_0;
  wire Tn_or0000_0;
  wire ldn_cmp_eq0000;
  wire N5;
  wire \Tout/O ;
  wire \ldout/O ;
  wire \fn_sel<0>/O ;
  wire \Tf1/O ;
  wire \ldf1/O ;
  wire \fn_sel<1>/O ;
  wire \fn_sel<2>/O ;
  wire \clk/INBUF ;
  wire \go/INBUF ;
  wire \Tcnt/O ;
  wire \ldcnt/O ;
  wire \over/O ;
  wire \state<0>/O ;
  wire \state<1>/O ;
  wire \ldn/O ;
  wire \state<2>/O ;
  wire \state<3>/O ;
  wire \B0/INBUF ;
  wire \Tn/O ;
  wire \Tf0/O ;
  wire \ldf0/O ;
  wire \clk_BUFGP/BUFG/S_INVNOT ;
  wire \clk_BUFGP/BUFG/I0_INV ;
  wire \fn_sel_0/DXMUX_502 ;
  wire \fn_sel_0/F5MUX_500 ;
  wire N28;
  wire \fn_sel_0/BXINV_493 ;
  wire N27;
  wire \fn_sel_0/SRINV_486 ;
  wire \fn_sel_0/CLKINVNOT ;
  wire \Tf1_OBUF/DXMUX_536 ;
  wire \Tf1_OBUF/F5MUX_534 ;
  wire N30;
  wire \Tf1_OBUF/BXINV_527 ;
  wire N29;
  wire \Tf1_OBUF/SRINV_520 ;
  wire \Tf1_OBUF/CLKINVNOT ;
  wire \Tcnt_OBUF/DXMUX_569 ;
  wire Tcnt_mux00001_566;
  wire \Tcnt_mux0000_SW0/O_pack_2 ;
  wire \Tcnt_OBUF/SRINV_552 ;
  wire \Tcnt_OBUF/CLKINVNOT ;
  wire \state_2/DXMUX_602 ;
  wire \state_mux0000<1>1_599 ;
  wire \state_mux0000<1>1_SW0/O_pack_2 ;
  wire \state_2/SRINV_585 ;
  wire \state_2/CLKINVNOT ;
  wire \ldf0_OBUF/DXMUX_635 ;
  wire ldf0_mux00001_632;
  wire \ldf0_mux00001_SW0/O_pack_2 ;
  wire \ldf0_OBUF/SRINV_618 ;
  wire \ldf0_OBUF/CLKINVNOT ;
  wire \Tout_OBUF/DYMUX_656 ;
  wire Tout_mux00001;
  wire \Tout_OBUF/SRINV_647 ;
  wire \Tout_OBUF/CLKINVNOT ;
  wire N17;
  wire \state_1/DYMUX_682 ;
  wire \state_mux0000<2>1 ;
  wire \state_1/SRINV_672 ;
  wire \state_1/CLKINVNOT ;
  wire \ldout_OBUF/DYMUX_710 ;
  wire ldout_mux00001;
  wire \ldout_OBUF/SRINV_701 ;
  wire \ldout_OBUF/CLKINVNOT ;
  wire ldcnt_or0001_736;
  wire ldn_cmp_eq0008;
  wire ldn_cmp_eq0001;
  wire Tn_or0000;
  wire \ldcnt_OBUF/DYMUX_772 ;
  wire \ldcnt_OBUF/BYINV_771 ;
  wire \ldcnt_OBUF/SRINV_770 ;
  wire \ldcnt_OBUF/CLKINVNOT ;
  wire \ldcnt_OBUF/CEINV_768 ;
  wire \ldf1_OBUF/DXMUX_806 ;
  wire ldf1_mux00001;
  wire ldn_or0001_pack_2;
  wire \ldf1_OBUF/SRINV_789 ;
  wire \ldf1_OBUF/CLKINVNOT ;
  wire \ldn_OBUF/DYMUX_820 ;
  wire \ldn_OBUF/BYINV_819 ;
  wire \ldn_OBUF/SRINV_818 ;
  wire \ldn_OBUF/CLKINVNOT ;
  wire \ldn_OBUF/CEINV_816 ;
  wire \over_OBUF/DYMUX_835 ;
  wire \over_OBUF/BYINV_834 ;
  wire \over_OBUF/SRINV_833 ;
  wire \over_OBUF/CLKINVNOT ;
  wire \over_OBUF/CEINV_831 ;
  wire \Tn_OBUF/DYMUX_850 ;
  wire \Tn_OBUF/BYINV_849 ;
  wire \Tn_OBUF/SRINV_848 ;
  wire \Tn_OBUF/CLKINVNOT ;
  wire \Tn_OBUF/CEINV_846 ;
  wire \fn_sel_1/DXMUX_884 ;
  wire \fn_sel_mux0000<1>1_881 ;
  wire N5_pack_2;
  wire \fn_sel_1/SRINV_867 ;
  wire \fn_sel_1/CLKINVNOT ;
  wire \Tf0_OBUF/DYMUX_898 ;
  wire \Tf0_OBUF/BYINV_897 ;
  wire \Tf0_OBUF/SRINV_896 ;
  wire \Tf0_OBUF/CLKINVNOT ;
  wire \Tf0_OBUF/CEINV_894 ;
  wire \state_0/DXMUX_932 ;
  wire \state_mux0000<3>1_929 ;
  wire ldn_cmp_eq0000_pack_2;
  wire \state_0/SRINV_916 ;
  wire \state_0/CLKINVNOT ;
  wire \state_3/DXMUX_965 ;
  wire \state_mux0000<0>1_962 ;
  wire ldn_cmp_eq0003_pack_2;
  wire \state_3/SRINV_950 ;
  wire \state_3/CLKINVNOT ;
  wire ldn_cmp_eq0005;
  wire ldn_cmp_eq0004;
  wire \fn_sel_2/DYMUX_1003 ;
  wire \fn_sel_2/BYINV_1002 ;
  wire \fn_sel_2/SRINV_1001 ;
  wire \fn_sel_2/CLKINVNOT ;
  wire \fn_sel_2/CEINV_999 ;
  wire ldn_cmp_eq0006;
  wire GND;
  wire VCC;
  initial $sdf_annotate("netgen/par/controller_fsm_timesim.sdf");
  X_OPAD #(
    .LOC ( "PAD51" ))
  \Tout/PAD  (
    .PAD(Tout)
  );
  X_OBUF #(
    .LOC ( "PAD51" ))
  Tout_OBUF (
    .I(\Tout/O ),
    .O(Tout)
  );
  X_OPAD #(
    .LOC ( "PAD35" ))
  \ldout/PAD  (
    .PAD(ldout)
  );
  X_OBUF #(
    .LOC ( "PAD35" ))
  ldout_OBUF (
    .I(\ldout/O ),
    .O(ldout)
  );
  X_OPAD #(
    .LOC ( "PAD47" ))
  \fn_sel<0>/PAD  (
    .PAD(fn_sel[0])
  );
  X_OBUF #(
    .LOC ( "PAD47" ))
  fn_sel_0_OBUF (
    .I(\fn_sel<0>/O ),
    .O(fn_sel[0])
  );
  X_OPAD #(
    .LOC ( "PAD37" ))
  \Tf1/PAD  (
    .PAD(Tf1)
  );
  X_OBUF #(
    .LOC ( "PAD37" ))
  Tf1_OBUF (
    .I(\Tf1/O ),
    .O(Tf1)
  );
  X_OPAD #(
    .LOC ( "PAD40" ))
  \ldf1/PAD  (
    .PAD(ldf1)
  );
  X_OBUF #(
    .LOC ( "PAD40" ))
  ldf1_OBUF (
    .I(\ldf1/O ),
    .O(ldf1)
  );
  X_OPAD #(
    .LOC ( "PAD78" ))
  \fn_sel<1>/PAD  (
    .PAD(fn_sel[1])
  );
  X_OBUF #(
    .LOC ( "PAD78" ))
  fn_sel_1_OBUF (
    .I(\fn_sel<1>/O ),
    .O(fn_sel[1])
  );
  X_OPAD #(
    .LOC ( "PAD62" ))
  \fn_sel<2>/PAD  (
    .PAD(fn_sel[2])
  );
  X_OBUF #(
    .LOC ( "PAD62" ))
  fn_sel_2_OBUF (
    .I(\fn_sel<2>/O ),
    .O(fn_sel[2])
  );
  X_IPAD #(
    .LOC ( "PAD169" ))
  \clk/PAD  (
    .PAD(clk)
  );
  X_BUF #(
    .LOC ( "PAD169" ))
  \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD48" ))
  \go/PAD  (
    .PAD(go)
  );
  X_BUF #(
    .LOC ( "PAD48" ))
  go_IBUF (
    .I(go),
    .O(\go/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD38" ))
  \Tcnt/PAD  (
    .PAD(Tcnt)
  );
  X_OBUF #(
    .LOC ( "PAD38" ))
  Tcnt_OBUF (
    .I(\Tcnt/O ),
    .O(Tcnt)
  );
  X_OPAD #(
    .LOC ( "PAD50" ))
  \ldcnt/PAD  (
    .PAD(ldcnt)
  );
  X_OBUF #(
    .LOC ( "PAD50" ))
  ldcnt_OBUF (
    .I(\ldcnt/O ),
    .O(ldcnt)
  );
  X_OPAD #(
    .LOC ( "PAD34" ))
  \over/PAD  (
    .PAD(over)
  );
  X_OBUF #(
    .LOC ( "PAD34" ))
  over_OBUF (
    .I(\over/O ),
    .O(over)
  );
  X_OPAD #(
    .LOC ( "PAD72" ))
  \state<0>/PAD  (
    .PAD(state[0])
  );
  X_OBUF #(
    .LOC ( "PAD72" ))
  state_0_OBUF (
    .I(\state<0>/O ),
    .O(state[0])
  );
  X_OPAD #(
    .LOC ( "PAD33" ))
  \state<1>/PAD  (
    .PAD(state[1])
  );
  X_OBUF #(
    .LOC ( "PAD33" ))
  state_1_OBUF (
    .I(\state<1>/O ),
    .O(state[1])
  );
  X_OPAD #(
    .LOC ( "PAD49" ))
  \ldn/PAD  (
    .PAD(ldn)
  );
  X_OBUF #(
    .LOC ( "PAD49" ))
  ldn_OBUF (
    .I(\ldn/O ),
    .O(ldn)
  );
  X_OPAD #(
    .LOC ( "PAD63" ))
  \state<2>/PAD  (
    .PAD(state[2])
  );
  X_OBUF #(
    .LOC ( "PAD63" ))
  state_2_OBUF (
    .I(\state<2>/O ),
    .O(state[2])
  );
  X_OPAD #(
    .LOC ( "PAD32" ))
  \state<3>/PAD  (
    .PAD(state[3])
  );
  X_OBUF #(
    .LOC ( "PAD32" ))
  state_3_OBUF (
    .I(\state<3>/O ),
    .O(state[3])
  );
  X_IPAD #(
    .LOC ( "PAD41" ))
  \B0/PAD  (
    .PAD(B0)
  );
  X_BUF #(
    .LOC ( "PAD41" ))
  B0_IBUF (
    .I(B0),
    .O(\B0/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD39" ))
  \Tn/PAD  (
    .PAD(Tn)
  );
  X_OBUF #(
    .LOC ( "PAD39" ))
  Tn_OBUF (
    .I(\Tn/O ),
    .O(Tn)
  );
  X_OPAD #(
    .LOC ( "PAD36" ))
  \Tf0/PAD  (
    .PAD(Tf0)
  );
  X_OBUF #(
    .LOC ( "PAD36" ))
  Tf0_OBUF (
    .I(\Tf0/O ),
    .O(Tf0)
  );
  X_OPAD #(
    .LOC ( "PAD31" ))
  \ldf0/PAD  (
    .PAD(ldf0)
  );
  X_OBUF #(
    .LOC ( "PAD31" ))
  ldf0_OBUF (
    .I(\ldf0/O ),
    .O(ldf0)
  );
  X_BUFGMUX #(
    .LOC ( "BUFGMUX0" ))
  \clk_BUFGP/BUFG  (
    .I0(\clk_BUFGP/BUFG/I0_INV ),
    .I1(GND),
    .S(\clk_BUFGP/BUFG/S_INVNOT ),
    .O(clk_BUFGP)
  );
  X_INV #(
    .LOC ( "BUFGMUX0" ))
  \clk_BUFGP/BUFG/SINV  (
    .I(1'b1),
    .O(\clk_BUFGP/BUFG/S_INVNOT )
  );
  X_BUF #(
    .LOC ( "BUFGMUX0" ))
  \clk_BUFGP/BUFG/I0_USED  (
    .I(\clk/INBUF ),
    .O(\clk_BUFGP/BUFG/I0_INV )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y59" ))
  \fn_sel_0/DXMUX  (
    .I(\fn_sel_0/F5MUX_500 ),
    .O(\fn_sel_0/DXMUX_502 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X36Y59" ))
  \fn_sel_0/F5MUX  (
    .IA(N27),
    .IB(N28),
    .SEL(\fn_sel_0/BXINV_493 ),
    .O(\fn_sel_0/F5MUX_500 )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y59" ))
  \fn_sel_0/BXINV  (
    .I(state_1_280),
    .O(\fn_sel_0/BXINV_493 )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y59" ))
  \fn_sel_0/SRINV  (
    .I(ldn_cmp_eq0001_0),
    .O(\fn_sel_0/SRINV_486 )
  );
  X_INV #(
    .LOC ( "SLICE_X36Y59" ))
  \fn_sel_0/CLKINV  (
    .I(clk_BUFGP),
    .O(\fn_sel_0/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y60" ))
  \Tf1_OBUF/DXMUX  (
    .I(\Tf1_OBUF/F5MUX_534 ),
    .O(\Tf1_OBUF/DXMUX_536 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X31Y60" ))
  \Tf1_OBUF/F5MUX  (
    .IA(N29),
    .IB(N30),
    .SEL(\Tf1_OBUF/BXINV_527 ),
    .O(\Tf1_OBUF/F5MUX_534 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y60" ))
  \Tf1_OBUF/BXINV  (
    .I(state_2_282),
    .O(\Tf1_OBUF/BXINV_527 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y60" ))
  \Tf1_OBUF/SRINV  (
    .I(ldn_cmp_eq0005_0),
    .O(\Tf1_OBUF/SRINV_520 )
  );
  X_INV #(
    .LOC ( "SLICE_X31Y60" ))
  \Tf1_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\Tf1_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y60" ))
  \Tcnt_OBUF/DXMUX  (
    .I(Tcnt_mux00001_566),
    .O(\Tcnt_OBUF/DXMUX_569 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y60" ))
  \Tcnt_OBUF/YUSED  (
    .I(\Tcnt_mux0000_SW0/O_pack_2 ),
    .O(\Tcnt_mux0000_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y60" ))
  \Tcnt_OBUF/SRINV  (
    .I(ldn_cmp_eq0003),
    .O(\Tcnt_OBUF/SRINV_552 )
  );
  X_INV #(
    .LOC ( "SLICE_X32Y60" ))
  \Tcnt_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\Tcnt_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y56" ))
  \state_2/DXMUX  (
    .I(\state_mux0000<1>1_599 ),
    .O(\state_2/DXMUX_602 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y56" ))
  \state_2/YUSED  (
    .I(\state_mux0000<1>1_SW0/O_pack_2 ),
    .O(\state_mux0000<1>1_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y56" ))
  \state_2/SRINV  (
    .I(ldcnt_or0001_0),
    .O(\state_2/SRINV_585 )
  );
  X_INV #(
    .LOC ( "SLICE_X35Y56" ))
  \state_2/CLKINV  (
    .I(clk_BUFGP),
    .O(\state_2/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y61" ))
  \ldf0_OBUF/DXMUX  (
    .I(ldf0_mux00001_632),
    .O(\ldf0_OBUF/DXMUX_635 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y61" ))
  \ldf0_OBUF/YUSED  (
    .I(\ldf0_mux00001_SW0/O_pack_2 ),
    .O(\ldf0_mux00001_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y61" ))
  \ldf0_OBUF/SRINV  (
    .I(ldn_cmp_eq0005_0),
    .O(\ldf0_OBUF/SRINV_618 )
  );
  X_INV #(
    .LOC ( "SLICE_X30Y61" ))
  \ldf0_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\ldf0_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y57" ))
  \Tout_OBUF/DYMUX  (
    .I(Tout_mux00001),
    .O(\Tout_OBUF/DYMUX_656 )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y57" ))
  \Tout_OBUF/SRINV  (
    .I(ldn_cmp_eq0006_0),
    .O(\Tout_OBUF/SRINV_647 )
  );
  X_INV #(
    .LOC ( "SLICE_X36Y57" ))
  \Tout_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\Tout_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y59" ))
  \state_1/DYMUX  (
    .I(\state_mux0000<2>1 ),
    .O(\state_1/DYMUX_682 )
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y59" ))
  \state_1/SRINV  (
    .I(state_3_283),
    .O(\state_1/SRINV_672 )
  );
  X_INV #(
    .LOC ( "SLICE_X37Y59" ))
  \state_1/CLKINV  (
    .I(clk_BUFGP),
    .O(\state_1/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y59" ))
  \ldout_OBUF/DYMUX  (
    .I(ldout_mux00001),
    .O(\ldout_OBUF/DYMUX_710 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y59" ))
  \ldout_OBUF/SRINV  (
    .I(ldn_cmp_eq0001_0),
    .O(\ldout_OBUF/SRINV_701 )
  );
  X_INV #(
    .LOC ( "SLICE_X35Y59" ))
  \ldout_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\ldout_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y58" ))
  \ldcnt_or0001/XUSED  (
    .I(ldcnt_or0001_736),
    .O(ldcnt_or0001_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y58" ))
  \ldcnt_or0001/YUSED  (
    .I(ldn_cmp_eq0008),
    .O(ldn_cmp_eq0008_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y57" ))
  \ldn_cmp_eq0001/XUSED  (
    .I(ldn_cmp_eq0001),
    .O(ldn_cmp_eq0001_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y57" ))
  \ldn_cmp_eq0001/YUSED  (
    .I(Tn_or0000),
    .O(Tn_or0000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y57" ))
  \ldcnt_OBUF/DYMUX  (
    .I(\ldcnt_OBUF/BYINV_771 ),
    .O(\ldcnt_OBUF/DYMUX_772 )
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y57" ))
  \ldcnt_OBUF/BYINV  (
    .I(1'b0),
    .O(\ldcnt_OBUF/BYINV_771 )
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y57" ))
  \ldcnt_OBUF/SRINV  (
    .I(ldcnt_or0001_0),
    .O(\ldcnt_OBUF/SRINV_770 )
  );
  X_INV #(
    .LOC ( "SLICE_X37Y57" ))
  \ldcnt_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\ldcnt_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y57" ))
  \ldcnt_OBUF/CEINV  (
    .I(ldn_or0001),
    .O(\ldcnt_OBUF/CEINV_768 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y59" ))
  \ldf1_OBUF/DXMUX  (
    .I(ldf1_mux00001),
    .O(\ldf1_OBUF/DXMUX_806 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y59" ))
  \ldf1_OBUF/YUSED  (
    .I(ldn_or0001_pack_2),
    .O(ldn_or0001)
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y59" ))
  \ldf1_OBUF/SRINV  (
    .I(ldn_cmp_eq0001_0),
    .O(\ldf1_OBUF/SRINV_789 )
  );
  X_INV #(
    .LOC ( "SLICE_X34Y59" ))
  \ldf1_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\ldf1_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y60" ))
  \ldn_OBUF/DYMUX  (
    .I(\ldn_OBUF/BYINV_819 ),
    .O(\ldn_OBUF/DYMUX_820 )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y60" ))
  \ldn_OBUF/BYINV  (
    .I(1'b0),
    .O(\ldn_OBUF/BYINV_819 )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y60" ))
  \ldn_OBUF/SRINV  (
    .I(ldn_cmp_eq0000),
    .O(\ldn_OBUF/SRINV_818 )
  );
  X_INV #(
    .LOC ( "SLICE_X36Y60" ))
  \ldn_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\ldn_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y60" ))
  \ldn_OBUF/CEINV  (
    .I(ldn_or0001),
    .O(\ldn_OBUF/CEINV_816 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y58" ))
  \over_OBUF/DYMUX  (
    .I(\over_OBUF/BYINV_834 ),
    .O(\over_OBUF/DYMUX_835 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y58" ))
  \over_OBUF/BYINV  (
    .I(1'b0),
    .O(\over_OBUF/BYINV_834 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y58" ))
  \over_OBUF/SRINV  (
    .I(ldn_cmp_eq0008_0),
    .O(\over_OBUF/SRINV_833 )
  );
  X_INV #(
    .LOC ( "SLICE_X32Y58" ))
  \over_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\over_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y58" ))
  \over_OBUF/CEINV  (
    .I(ldn_or0001),
    .O(\over_OBUF/CEINV_831 )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y58" ),
    .INIT ( 1'b1 ))
  over_400 (
    .I(\over_OBUF/DYMUX_835 ),
    .CE(\over_OBUF/CEINV_831 ),
    .CLK(\over_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\over_OBUF/SRINV_833 ),
    .SRST(GND),
    .O(over_OBUF_278)
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y61" ))
  \Tn_OBUF/DYMUX  (
    .I(\Tn_OBUF/BYINV_849 ),
    .O(\Tn_OBUF/DYMUX_850 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y61" ))
  \Tn_OBUF/BYINV  (
    .I(1'b0),
    .O(\Tn_OBUF/BYINV_849 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y61" ))
  \Tn_OBUF/SRINV  (
    .I(ldn_cmp_eq0003),
    .O(\Tn_OBUF/SRINV_848 )
  );
  X_INV #(
    .LOC ( "SLICE_X33Y61" ))
  \Tn_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\Tn_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y61" ))
  \Tn_OBUF/CEINV  (
    .I(ldn_or0001),
    .O(\Tn_OBUF/CEINV_846 )
  );
  X_LUT4 #(
    .INIT ( 16'hCCFC ),
    .LOC ( "SLICE_X37Y56" ))
  \fn_sel_mux0000<1>_SW0  (
    .ADR0(VCC),
    .ADR1(ldn_cmp_eq0005_0),
    .ADR2(fn_sel_1_272),
    .ADR3(Tn_or0000_0),
    .O(N5_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFC ),
    .LOC ( "SLICE_X37Y56" ))
  \fn_sel_mux0000<1>1  (
    .ADR0(VCC),
    .ADR1(ldn_cmp_eq0000),
    .ADR2(N5),
    .ADR3(ldn_cmp_eq0006_0),
    .O(\fn_sel_mux0000<1>1_881 )
  );
  X_SFF #(
    .LOC ( "SLICE_X37Y56" ),
    .INIT ( 1'b1 ))
  fn_sel_1 (
    .I(\fn_sel_1/DXMUX_884 ),
    .CE(VCC),
    .CLK(\fn_sel_1/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\fn_sel_1/SRINV_867 ),
    .SRST(GND),
    .O(fn_sel_1_272)
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y56" ))
  \fn_sel_1/DXMUX  (
    .I(\fn_sel_mux0000<1>1_881 ),
    .O(\fn_sel_1/DXMUX_884 )
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y56" ))
  \fn_sel_1/YUSED  (
    .I(N5_pack_2),
    .O(N5)
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y56" ))
  \fn_sel_1/SRINV  (
    .I(ldn_cmp_eq0008_0),
    .O(\fn_sel_1/SRINV_867 )
  );
  X_INV #(
    .LOC ( "SLICE_X37Y56" ))
  \fn_sel_1/CLKINV  (
    .I(clk_BUFGP),
    .O(\fn_sel_1/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y60" ))
  \Tf0_OBUF/DYMUX  (
    .I(\Tf0_OBUF/BYINV_897 ),
    .O(\Tf0_OBUF/DYMUX_898 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y60" ))
  \Tf0_OBUF/BYINV  (
    .I(1'b0),
    .O(\Tf0_OBUF/BYINV_897 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y60" ))
  \Tf0_OBUF/SRINV  (
    .I(ldn_cmp_eq0004_0),
    .O(\Tf0_OBUF/SRINV_896 )
  );
  X_INV #(
    .LOC ( "SLICE_X34Y60" ))
  \Tf0_OBUF/CLKINV  (
    .I(clk_BUFGP),
    .O(\Tf0_OBUF/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y60" ))
  \Tf0_OBUF/CEINV  (
    .I(ldn_or0001),
    .O(\Tf0_OBUF/CEINV_894 )
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ),
    .LOC ( "SLICE_X37Y58" ))
  ldn_cmp_eq00001 (
    .ADR0(state_2_282),
    .ADR1(state_3_283),
    .ADR2(state_0_279),
    .ADR3(state_1_280),
    .O(ldn_cmp_eq0000_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'hFA00 ),
    .LOC ( "SLICE_X37Y58" ))
  \state_mux0000<3>1  (
    .ADR0(ldn_cmp_eq0008_0),
    .ADR1(VCC),
    .ADR2(ldn_cmp_eq0000),
    .ADR3(go_IBUF_275),
    .O(\state_mux0000<3>1_929 )
  );
  X_SFF #(
    .LOC ( "SLICE_X37Y58" ),
    .INIT ( 1'b1 ))
  state_0 (
    .I(\state_0/DXMUX_932 ),
    .CE(VCC),
    .CLK(\state_0/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\state_0/SRINV_916 ),
    .SRST(GND),
    .O(state_0_279)
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y58" ))
  \state_0/DXMUX  (
    .I(\state_mux0000<3>1_929 ),
    .O(\state_0/DXMUX_932 )
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y58" ))
  \state_0/YUSED  (
    .I(ldn_cmp_eq0000_pack_2),
    .O(ldn_cmp_eq0000)
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y58" ))
  \state_0/SRINV  (
    .I(N17),
    .O(\state_0/SRINV_916 )
  );
  X_INV #(
    .LOC ( "SLICE_X37Y58" ))
  \state_0/CLKINV  (
    .I(clk_BUFGP),
    .O(\state_0/CLKINVNOT )
  );
  X_LUT4 #(
    .INIT ( 16'hECA0 ),
    .LOC ( "SLICE_X35Y58" ))
  \state_mux0000<0>1  (
    .ADR0(go_IBUF_275),
    .ADR1(ldn_cmp_eq0003),
    .ADR2(ldn_cmp_eq0008_0),
    .ADR3(B0_IBUF_284),
    .O(\state_mux0000<0>1_962 )
  );
  X_LUT4 #(
    .INIT ( 16'h0004 ),
    .LOC ( "SLICE_X35Y58" ))
  ldn_cmp_eq00031 (
    .ADR0(state_3_283),
    .ADR1(state_2_282),
    .ADR2(state_0_279),
    .ADR3(state_1_280),
    .O(ldn_cmp_eq0003_pack_2)
  );
  X_SFF #(
    .LOC ( "SLICE_X35Y58" ),
    .INIT ( 1'b1 ))
  state_3 (
    .I(\state_3/DXMUX_965 ),
    .CE(VCC),
    .CLK(\state_3/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\state_3/SRINV_950 ),
    .SRST(GND),
    .O(state_3_283)
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y58" ))
  \state_3/DXMUX  (
    .I(\state_mux0000<0>1_962 ),
    .O(\state_3/DXMUX_965 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y58" ))
  \state_3/YUSED  (
    .I(ldn_cmp_eq0003_pack_2),
    .O(ldn_cmp_eq0003)
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y58" ))
  \state_3/SRINV  (
    .I(ldn_cmp_eq0006_0),
    .O(\state_3/SRINV_950 )
  );
  X_INV #(
    .LOC ( "SLICE_X35Y58" ))
  \state_3/CLKINV  (
    .I(clk_BUFGP),
    .O(\state_3/CLKINVNOT )
  );
  X_LUT4 #(
    .INIT ( 16'h0020 ),
    .LOC ( "SLICE_X34Y58" ))
  ldn_cmp_eq00051 (
    .ADR0(state_2_282),
    .ADR1(state_0_279),
    .ADR2(state_1_280),
    .ADR3(state_3_283),
    .O(ldn_cmp_eq0005)
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y58" ))
  \ldn_cmp_eq0005/XUSED  (
    .I(ldn_cmp_eq0005),
    .O(ldn_cmp_eq0005_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y58" ))
  \ldn_cmp_eq0005/YUSED  (
    .I(ldn_cmp_eq0004),
    .O(ldn_cmp_eq0004_0)
  );
  X_LUT4 #(
    .INIT ( 16'h0200 ),
    .LOC ( "SLICE_X34Y58" ))
  ldn_cmp_eq00041 (
    .ADR0(state_2_282),
    .ADR1(state_3_283),
    .ADR2(state_1_280),
    .ADR3(state_0_279),
    .O(ldn_cmp_eq0004)
  );
  X_SFF #(
    .LOC ( "SLICE_X39Y56" ),
    .INIT ( 1'b1 ))
  fn_sel_2 (
    .I(\fn_sel_2/DYMUX_1003 ),
    .CE(\fn_sel_2/CEINV_999 ),
    .CLK(\fn_sel_2/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\fn_sel_2/SRINV_1001 ),
    .SRST(GND),
    .O(fn_sel_2_273)
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y56" ))
  \fn_sel_2/DYMUX  (
    .I(\fn_sel_2/BYINV_1002 ),
    .O(\fn_sel_2/DYMUX_1003 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y56" ))
  \fn_sel_2/BYINV  (
    .I(1'b0),
    .O(\fn_sel_2/BYINV_1002 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y56" ))
  \fn_sel_2/SRINV  (
    .I(ldcnt_or0001_0),
    .O(\fn_sel_2/SRINV_1001 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y56" ))
  \fn_sel_2/CLKINV  (
    .I(clk_BUFGP),
    .O(\fn_sel_2/CLKINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y56" ))
  \fn_sel_2/CEINV  (
    .I(Tn_or0000_0),
    .O(\fn_sel_2/CEINV_999 )
  );
  X_LUT4 #(
    .INIT ( 16'h0800 ),
    .LOC ( "SLICE_X36Y56" ))
  ldn_cmp_eq00061 (
    .ADR0(state_1_280),
    .ADR1(state_2_282),
    .ADR2(state_3_283),
    .ADR3(state_0_279),
    .O(ldn_cmp_eq0006)
  );
  X_BUF #(
    .LOC ( "SLICE_X36Y56" ))
  \ldn_cmp_eq0006/XUSED  (
    .I(ldn_cmp_eq0006),
    .O(ldn_cmp_eq0006_0)
  );
  X_SFF #(
    .LOC ( "SLICE_X34Y60" ),
    .INIT ( 1'b1 ))
  Tf0_426 (
    .I(\Tf0_OBUF/DYMUX_898 ),
    .CE(\Tf0_OBUF/CEINV_894 ),
    .CLK(\Tf0_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\Tf0_OBUF/SRINV_896 ),
    .SRST(GND),
    .O(Tf0_OBUF_286)
  );
  X_SFF #(
    .LOC ( "SLICE_X33Y61" ),
    .INIT ( 1'b1 ))
  Tn_407 (
    .I(\Tn_OBUF/DYMUX_850 ),
    .CE(\Tn_OBUF/CEINV_846 ),
    .CLK(\Tn_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\Tn_OBUF/SRINV_848 ),
    .SRST(GND),
    .O(Tn_OBUF_285)
  );
  X_BUF #(
    .LOC ( "PAD48" ))
  \go/IFF/IMUX  (
    .I(\go/INBUF ),
    .O(go_IBUF_275)
  );
  X_BUF #(
    .LOC ( "PAD41" ))
  \B0/IFF/IMUX  (
    .I(\B0/INBUF ),
    .O(B0_IBUF_284)
  );
  X_LUT4 #(
    .INIT ( 16'hD858 ),
    .LOC ( "SLICE_X36Y59" ))
  \fn_sel_mux0000<2>1_F  (
    .ADR0(state_2_282),
    .ADR1(fn_sel_0_269),
    .ADR2(state_0_279),
    .ADR3(state_3_283),
    .O(N27)
  );
  X_LUT4 #(
    .INIT ( 16'hCAC0 ),
    .LOC ( "SLICE_X36Y59" ))
  \fn_sel_mux0000<2>1_G  (
    .ADR0(state_0_279),
    .ADR1(fn_sel_0_269),
    .ADR2(state_3_283),
    .ADR3(state_2_282),
    .O(N28)
  );
  X_SFF #(
    .LOC ( "SLICE_X36Y59" ),
    .INIT ( 1'b1 ))
  fn_sel_0 (
    .I(\fn_sel_0/DXMUX_502 ),
    .CE(VCC),
    .CLK(\fn_sel_0/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\fn_sel_0/SRINV_486 ),
    .SRST(GND),
    .O(fn_sel_0_269)
  );
  X_LUT4 #(
    .INIT ( 16'hE200 ),
    .LOC ( "SLICE_X31Y60" ))
  Tf1_mux00001_F (
    .ADR0(state_0_279),
    .ADR1(state_3_283),
    .ADR2(Tf1_OBUF_270),
    .ADR3(state_1_280),
    .O(N29)
  );
  X_LUT4 #(
    .INIT ( 16'hC0E2 ),
    .LOC ( "SLICE_X31Y60" ))
  Tf1_mux00001_G (
    .ADR0(state_0_279),
    .ADR1(state_3_283),
    .ADR2(Tf1_OBUF_270),
    .ADR3(state_1_280),
    .O(N30)
  );
  X_SFF #(
    .LOC ( "SLICE_X31Y60" ),
    .INIT ( 1'b1 ))
  Tf1_287 (
    .I(\Tf1_OBUF/DXMUX_536 ),
    .CE(VCC),
    .CLK(\Tf1_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\Tf1_OBUF/SRINV_520 ),
    .SRST(GND),
    .O(Tf1_OBUF_270)
  );
  X_LUT4 #(
    .INIT ( 16'hC8CD ),
    .LOC ( "SLICE_X32Y60" ))
  Tcnt_mux0000_SW0 (
    .ADR0(state_1_280),
    .ADR1(Tcnt_OBUF_276),
    .ADR2(state_2_282),
    .ADR3(state_0_279),
    .O(\Tcnt_mux0000_SW0/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hCC00 ),
    .LOC ( "SLICE_X32Y60" ))
  Tcnt_mux00001 (
    .ADR0(VCC),
    .ADR1(state_3_283),
    .ADR2(VCC),
    .ADR3(\Tcnt_mux0000_SW0/O ),
    .O(Tcnt_mux00001_566)
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y60" ),
    .INIT ( 1'b1 ))
  Tcnt_299 (
    .I(\Tcnt_OBUF/DXMUX_569 ),
    .CE(VCC),
    .CLK(\Tcnt_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\Tcnt_OBUF/SRINV_552 ),
    .SRST(GND),
    .O(Tcnt_OBUF_276)
  );
  X_LUT4 #(
    .INIT ( 16'hF5F5 ),
    .LOC ( "SLICE_X35Y56" ))
  \state_mux0000<1>1_SW0  (
    .ADR0(state_2_282),
    .ADR1(VCC),
    .ADR2(state_3_283),
    .ADR3(VCC),
    .O(\state_mux0000<1>1_SW0/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'h030D ),
    .LOC ( "SLICE_X35Y56" ))
  \state_mux0000<1>1  (
    .ADR0(B0_IBUF_284),
    .ADR1(state_0_279),
    .ADR2(\state_mux0000<1>1_SW0/O ),
    .ADR3(state_1_280),
    .O(\state_mux0000<1>1_599 )
  );
  X_SFF #(
    .LOC ( "SLICE_X35Y56" ),
    .INIT ( 1'b1 ))
  state_2 (
    .I(\state_2/DXMUX_602 ),
    .CE(VCC),
    .CLK(\state_2/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\state_2/SRINV_585 ),
    .SRST(GND),
    .O(state_2_282)
  );
  X_LUT4 #(
    .INIT ( 16'hFAFA ),
    .LOC ( "SLICE_X30Y61" ))
  ldf0_mux00001_SW0 (
    .ADR0(state_1_280),
    .ADR1(VCC),
    .ADR2(state_2_282),
    .ADR3(VCC),
    .O(\ldf0_mux00001_SW0/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'h8580 ),
    .LOC ( "SLICE_X30Y61" ))
  ldf0_mux00001 (
    .ADR0(\ldf0_mux00001_SW0/O ),
    .ADR1(ldf0_OBUF_287),
    .ADR2(state_3_283),
    .ADR3(state_0_279),
    .O(ldf0_mux00001_632)
  );
  X_SFF #(
    .LOC ( "SLICE_X30Y61" ),
    .INIT ( 1'b1 ))
  ldf0_323 (
    .I(\ldf0_OBUF/DXMUX_635 ),
    .CE(VCC),
    .CLK(\ldf0_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\ldf0_OBUF/SRINV_618 ),
    .SRST(GND),
    .O(ldf0_OBUF_287)
  );
  X_LUT4 #(
    .INIT ( 16'hDCDC ),
    .LOC ( "SLICE_X36Y57" ))
  Tout_mux000011 (
    .ADR0(ldn_or0001),
    .ADR1(ldn_cmp_eq0008_0),
    .ADR2(Tout_OBUF_267),
    .ADR3(VCC),
    .O(Tout_mux00001)
  );
  X_SFF #(
    .LOC ( "SLICE_X36Y57" ),
    .INIT ( 1'b1 ))
  Tout_331 (
    .I(\Tout_OBUF/DYMUX_656 ),
    .CE(VCC),
    .CLK(\Tout_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\Tout_OBUF/SRINV_647 ),
    .SRST(GND),
    .O(Tout_OBUF_267)
  );
  X_LUT4 #(
    .INIT ( 16'h5A5A ),
    .LOC ( "SLICE_X37Y59" ))
  \state_mux0000<2>11  (
    .ADR0(state_1_280),
    .ADR1(VCC),
    .ADR2(state_0_279),
    .ADR3(VCC),
    .O(\state_mux0000<2>1 )
  );
  X_SFF #(
    .LOC ( "SLICE_X37Y59" ),
    .INIT ( 1'b0 ))
  state_1 (
    .I(\state_1/DYMUX_682 ),
    .CE(VCC),
    .CLK(\state_1/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\state_1/SRINV_672 ),
    .O(state_1_280)
  );
  X_LUT4 #(
    .INIT ( 16'h0302 ),
    .LOC ( "SLICE_X37Y59" ))
  \state_mux0000<3>_SW0  (
    .ADR0(state_2_282),
    .ADR1(state_3_283),
    .ADR2(state_0_279),
    .ADR3(state_1_280),
    .O(N17)
  );
  X_LUT4 #(
    .INIT ( 16'hBBAA ),
    .LOC ( "SLICE_X35Y59" ))
  ldout_mux000011 (
    .ADR0(ldn_cmp_eq0004_0),
    .ADR1(ldn_or0001),
    .ADR2(VCC),
    .ADR3(ldout_OBUF_268),
    .O(ldout_mux00001)
  );
  X_SFF #(
    .LOC ( "SLICE_X35Y59" ),
    .INIT ( 1'b1 ))
  ldout_351 (
    .I(\ldout_OBUF/DYMUX_710 ),
    .CE(VCC),
    .CLK(\ldout_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\ldout_OBUF/SRINV_701 ),
    .SRST(GND),
    .O(ldout_OBUF_268)
  );
  X_LUT4 #(
    .INIT ( 16'h0040 ),
    .LOC ( "SLICE_X36Y58" ))
  ldn_cmp_eq00081 (
    .ADR0(state_1_280),
    .ADR1(state_0_279),
    .ADR2(state_3_283),
    .ADR3(state_2_282),
    .O(ldn_cmp_eq0008)
  );
  X_LUT4 #(
    .INIT ( 16'h0018 ),
    .LOC ( "SLICE_X36Y58" ))
  ldcnt_or0001 (
    .ADR0(state_1_280),
    .ADR1(state_0_279),
    .ADR2(state_3_283),
    .ADR3(state_2_282),
    .O(ldcnt_or0001_736)
  );
  X_LUT4 #(
    .INIT ( 16'h3277 ),
    .LOC ( "SLICE_X34Y57" ))
  Tn_or00001 (
    .ADR0(state_1_280),
    .ADR1(state_3_283),
    .ADR2(state_0_279),
    .ADR3(state_2_282),
    .O(Tn_or0000)
  );
  X_LUT4 #(
    .INIT ( 16'h0002 ),
    .LOC ( "SLICE_X34Y57" ))
  ldn_cmp_eq00012 (
    .ADR0(state_1_280),
    .ADR1(state_3_283),
    .ADR2(state_0_279),
    .ADR3(state_2_282),
    .O(ldn_cmp_eq0001)
  );
  X_SFF #(
    .LOC ( "SLICE_X37Y57" ),
    .INIT ( 1'b1 ))
  ldcnt_374 (
    .I(\ldcnt_OBUF/DYMUX_772 ),
    .CE(\ldcnt_OBUF/CEINV_768 ),
    .CLK(\ldcnt_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\ldcnt_OBUF/SRINV_770 ),
    .SRST(GND),
    .O(ldcnt_OBUF_277)
  );
  X_LUT4 #(
    .INIT ( 16'h3737 ),
    .LOC ( "SLICE_X34Y59" ))
  ldn_or00011 (
    .ADR0(state_1_280),
    .ADR1(state_3_283),
    .ADR2(state_2_282),
    .ADR3(VCC),
    .O(ldn_or0001_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'hFF0A ),
    .LOC ( "SLICE_X34Y59" ))
  ldf1_mux000011 (
    .ADR0(ldf1_OBUF_271),
    .ADR1(VCC),
    .ADR2(ldn_or0001),
    .ADR3(ldn_cmp_eq0006_0),
    .O(ldf1_mux00001)
  );
  X_SFF #(
    .LOC ( "SLICE_X34Y59" ),
    .INIT ( 1'b1 ))
  ldf1_386 (
    .I(\ldf1_OBUF/DXMUX_806 ),
    .CE(VCC),
    .CLK(\ldf1_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\ldf1_OBUF/SRINV_789 ),
    .SRST(GND),
    .O(ldf1_OBUF_271)
  );
  X_SFF #(
    .LOC ( "SLICE_X36Y60" ),
    .INIT ( 1'b1 ))
  ldn_393 (
    .I(\ldn_OBUF/DYMUX_820 ),
    .CE(\ldn_OBUF/CEINV_816 ),
    .CLK(\ldn_OBUF/CLKINVNOT ),
    .SET(GND),
    .RST(GND),
    .SSET(\ldn_OBUF/SRINV_818 ),
    .SRST(GND),
    .O(ldn_OBUF_281)
  );
  X_BUF #(
    .LOC ( "PAD51" ))
  \Tout/OUTPUT/OFF/OMUX  (
    .I(Tout_OBUF_267),
    .O(\Tout/O )
  );
  X_BUF #(
    .LOC ( "PAD35" ))
  \ldout/OUTPUT/OFF/OMUX  (
    .I(ldout_OBUF_268),
    .O(\ldout/O )
  );
  X_BUF #(
    .LOC ( "PAD47" ))
  \fn_sel<0>/OUTPUT/OFF/OMUX  (
    .I(fn_sel_0_269),
    .O(\fn_sel<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD37" ))
  \Tf1/OUTPUT/OFF/OMUX  (
    .I(Tf1_OBUF_270),
    .O(\Tf1/O )
  );
  X_BUF #(
    .LOC ( "PAD40" ))
  \ldf1/OUTPUT/OFF/OMUX  (
    .I(ldf1_OBUF_271),
    .O(\ldf1/O )
  );
  X_BUF #(
    .LOC ( "PAD78" ))
  \fn_sel<1>/OUTPUT/OFF/OMUX  (
    .I(fn_sel_1_272),
    .O(\fn_sel<1>/O )
  );
  X_BUF #(
    .LOC ( "PAD62" ))
  \fn_sel<2>/OUTPUT/OFF/OMUX  (
    .I(fn_sel_2_273),
    .O(\fn_sel<2>/O )
  );
  X_BUF #(
    .LOC ( "PAD38" ))
  \Tcnt/OUTPUT/OFF/OMUX  (
    .I(Tcnt_OBUF_276),
    .O(\Tcnt/O )
  );
  X_BUF #(
    .LOC ( "PAD50" ))
  \ldcnt/OUTPUT/OFF/OMUX  (
    .I(ldcnt_OBUF_277),
    .O(\ldcnt/O )
  );
  X_BUF #(
    .LOC ( "PAD34" ))
  \over/OUTPUT/OFF/OMUX  (
    .I(over_OBUF_278),
    .O(\over/O )
  );
  X_BUF #(
    .LOC ( "PAD72" ))
  \state<0>/OUTPUT/OFF/OMUX  (
    .I(state_0_279),
    .O(\state<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD33" ))
  \state<1>/OUTPUT/OFF/OMUX  (
    .I(state_1_280),
    .O(\state<1>/O )
  );
  X_BUF #(
    .LOC ( "PAD49" ))
  \ldn/OUTPUT/OFF/OMUX  (
    .I(ldn_OBUF_281),
    .O(\ldn/O )
  );
  X_BUF #(
    .LOC ( "PAD63" ))
  \state<2>/OUTPUT/OFF/OMUX  (
    .I(state_2_282),
    .O(\state<2>/O )
  );
  X_BUF #(
    .LOC ( "PAD32" ))
  \state<3>/OUTPUT/OFF/OMUX  (
    .I(state_3_283),
    .O(\state<3>/O )
  );
  X_BUF #(
    .LOC ( "PAD39" ))
  \Tn/OUTPUT/OFF/OMUX  (
    .I(Tn_OBUF_285),
    .O(\Tn/O )
  );
  X_BUF #(
    .LOC ( "PAD36" ))
  \Tf0/OUTPUT/OFF/OMUX  (
    .I(Tf0_OBUF_286),
    .O(\Tf0/O )
  );
  X_BUF #(
    .LOC ( "PAD31" ))
  \ldf0/OUTPUT/OFF/OMUX  (
    .I(ldf0_OBUF_287),
    .O(\ldf0/O )
  );
  X_ZERO   NlwBlock_controller_fsm_GND (
    .O(GND)
  );
  X_ONE   NlwBlock_controller_fsm_VCC (
    .O(VCC)
  );
endmodule


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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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

