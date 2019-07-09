module mux4_2_1_struct (A, B, C, D, S, T, O);
  input A, B, C, D, S, T;
  output O;

  not i0 (Sn, S);
  not i1 (Tn, T);
  and i2 (P1, Sn, Tn, A);
  and i3 (P2, Sn,  T, B);
  and i4 (P3,  S, Tn, C);
  and i5 (P4,  S,  T, D);
  or  i6 (O, P1, P2, P3, P4);
endmodule



module mux4_2_1_equations (A, B, C, D, S, T, O);
  input A, B, C, D, S, T;
  output O;

  assign O = A&(~S)&(~T) | B&(~S)&T | C&S&(~T) | D&S&T;
endmodule


module mux4_2_1_behavioral (A, B, C, D, S, T, O);
  input A, B, C, D, S, T;
  output O;

  assign O = (~S) ? (~T) ? A : B : (~T) ? C : D ;
endmodule



module testall ();
  reg A, B, C, D;
  reg S, T;
  wire O1, O2, O3;

  mux4_2_1_struct     i0 (A, B, C, D, S, T, O1);
  mux4_2_1_equations  i1 (A, B, C, D, S, T, O2);
  mux4_2_1_behavioral i2 (A, B, C, D, S, T, O3);

  initial begin A=0; B=0; C=0; D=0; S=0; T=0; end

  always # 20 A=~A;
  always # 40 B=~B;
  always # 80 C=~C;
  always #160 D=~D;
  
  always #1000 T=~T;
  always #2000 S=~S;

endmodule
