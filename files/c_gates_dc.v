/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Oct 26 11:44:46 2018
/////////////////////////////////////////////////////////////


module A_1 ( a1, a2, s );
  input a1, a2;
  output s;


  AND2X1 U1 ( .IN1(a2), .IN2(a1), .Q(s) );
endmodule


module B ( reset_n, clock, b1, b2, s );
  input reset_n, clock, b1, b2;
  output s;
  wire   N0;

  DFFARX1 s_reg ( .D(N0), .CLK(clock), .RSTB(reset_n), .Q(s), .QN() );
  XOR2X1 U3 ( .IN1(b2), .IN2(b1), .Q(N0) );
endmodule


module A_0 ( a1, a2, s );
  input a1, a2;
  output s;


  AND2X1 U1 ( .IN1(a2), .IN2(a1), .Q(s) );
endmodule


module C_1 ( reset_n, clk, in_d, in_e, out_f );
  input reset_n, clk, in_d, in_e;
  output out_f;
  wire   s2, s1;

  A_1 inst_a_1 ( .a1(in_d), .a2(in_e), .s(s2) );
  A_0 inst_a_2 ( .a1(in_d), .a2(in_e), .s(s1) );
  B inst_b_1 ( .reset_n(reset_n), .clock(clk), .b1(s1), .b2(s2), .s(out_f) );
endmodule

