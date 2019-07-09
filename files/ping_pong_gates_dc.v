/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Oct 26 12:51:46 2018
/////////////////////////////////////////////////////////////


module ping_pong ( reset_n, clk, ball, spy );
  input reset_n, clk, ball;
  output spy;
  wire   n5, n6, n7, n9, n10, n11, n16, n17, n18, n19, n20;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFFASRX1 state_reg_0_ ( .D(next_state[0]), .CLK(clk), .RSTB(n17), .SETB(n19), 
        .Q(state[0]), .QN(n16) );
  DFFASRX1 state_reg_1_ ( .D(next_state[1]), .CLK(clk), .RSTB(n18), .SETB(n20), 
        .Q(state[1]), .QN() );
  AO22X1 U19 ( .IN1(spy), .IN2(ball), .IN3(state[1]), .IN4(n10), .Q(
        next_state[1]) );
  AO221X1 U20 ( .IN1(ball), .IN2(state[1]), .IN3(spy), .IN4(n9), .IN5(n7), .Q(
        next_state[0]) );
  INVX0 U21 ( .INP(next_state[1]), .ZN(n5) );
  INVX0 U22 ( .INP(next_state[0]), .ZN(n6) );
  INVX0 U23 ( .INP(ball), .ZN(n9) );
  INVX0 U24 ( .INP(n11), .ZN(n7) );
  NAND2X1 U25 ( .IN1(ball), .IN2(n11), .QN(n10) );
  NOR2X0 U26 ( .IN1(n16), .IN2(state[1]), .QN(spy) );
  NAND2X1 U27 ( .IN1(state[1]), .IN2(state[0]), .QN(n11) );
  OR2X1 U28 ( .IN1(reset_n), .IN2(next_state[0]), .Q(n17) );
  OR2X1 U29 ( .IN1(reset_n), .IN2(next_state[1]), .Q(n18) );
  OR2X1 U30 ( .IN1(reset_n), .IN2(n6), .Q(n19) );
  OR2X1 U31 ( .IN1(reset_n), .IN2(n5), .Q(n20) );
endmodule

