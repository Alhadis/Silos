/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Oct 25 17:29:35 2018
/////////////////////////////////////////////////////////////


module circuit_fsm ( reset_n, clk, e1, e2, o1 );
  input reset_n, clk, e1, e2;
  output o1;
  wire   n1, n2, n3, n4, n5, n6;
  wire   [1:0] Q;
  wire   [1:0] D;

  DFFARX1 Q_reg_0_ ( .D(D[0]), .CLK(clk), .RSTB(reset_n), .Q(Q[0]), .QN(n2) );
  DFFARX1 Q_reg_1_ ( .D(D[1]), .CLK(clk), .RSTB(reset_n), .Q(Q[1]), .QN(n1) );
  AO21X1 U7 ( .IN1(n3), .IN2(n1), .IN3(Q[0]), .Q(n5) );
  NAND3X0 U8 ( .IN1(Q[0]), .IN2(n1), .IN3(e2), .QN(n4) );
  OA22X1 U9 ( .IN1(Q[0]), .IN2(n3), .IN3(e2), .IN4(n2), .Q(n6) );
  NOR2X0 U10 ( .IN1(n4), .IN2(n3), .QN(D[1]) );
  NOR2X0 U11 ( .IN1(Q[1]), .IN2(n6), .QN(D[0]) );
  INVX0 U12 ( .INP(e1), .ZN(n3) );
  NAND2X1 U13 ( .IN1(n4), .IN2(n5), .QN(o1) );
endmodule

