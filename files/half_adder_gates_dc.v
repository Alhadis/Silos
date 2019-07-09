/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Oct 26 12:17:25 2018
/////////////////////////////////////////////////////////////


module half_adder ( a, b, s, cout );
  input a, b;
  output s, cout;


  XOR2X1 U3 ( .IN1(b), .IN2(a), .Q(s) );
  AND2X1 U4 ( .IN1(b), .IN2(a), .Q(cout) );
endmodule

