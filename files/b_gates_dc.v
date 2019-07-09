/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Oct 26 12:31:17 2018
/////////////////////////////////////////////////////////////


module B ( reset_n, clock, b1, b2, s );
  input reset_n, clock, b1, b2;
  output s;
  wire   N0;

  DFFARX1 s_reg ( .D(N0), .CLK(clock), .RSTB(reset_n), .Q(s), .QN() );
  XOR2X1 U4 ( .IN1(b2), .IN2(b1), .Q(N0) );
endmodule

