module decoder2_2_4_struct (S1, S0, O0, O1, O2, O3);
  input S1, S0;
  output O0, O1, O2, O3;

  not n0 (S0n, S0);
  not n1 (S1n, S1);
  and a0 (O0, S1n, S0n);
  and a1 (O1, S1n, S0);
  and a2 (O2,  S1, S0n);
  and a3 (O3,  S1, S0);
endmodule



module decoder2_2_4_equat (S1, S0, O0, O1, O2, O3);
  input S1, S0;
  output O0, O1, O2, O3;

  assign O0 = ~S1 & ~S0;
  assign O1 = ~S1 & S0;
  assign O2 = S1 & ~S0;
  assign O3 = S1 & S0;
endmodule



module decoder2_2_4_ternary (S1, S0, O0, O1, O2, O3);
  input S1, S0;
  output O0, O1, O2, O3;

  assign {O3, O2, O1, O0} = S1 ? S0 ? 8 : 4 : S0 ? 2 : 1; 
endmodule



module decoder2_2_4_beh (S1, S0, O0, O1, O2, O3);
  input S1, S0;
  output O0, O1, O2, O3;
  reg O0, O1, O2, O3;

  always@(S1 or S0)
  case ({S1, S0})
    0 : {O3, O2, O1, O0} = 1;
    1 : {O3, O2, O1, O0} = 2;
    2 : {O3, O2, O1, O0} = 4;
    3 : {O3, O2, O1, O0} = 8;
  endcase 
endmodule



module decoder_test();
  reg S1, S0;
  wire O0_1, O1_1, O2_1, O3_1;
  wire O0_2, O1_2, O2_2, O3_2;
  wire O0_3, O1_3, O2_3, O3_3;
  wire O0_4, O1_4, O2_4, O3_4;

decoder2_2_4_struct  m0 (S1, S0, O0_1, O1_1, O2_1, O3_1);
decoder2_2_4_equat   m1 (S1, S0, O0_2, O1_2, O2_2, O3_2);
decoder2_2_4_ternary m2 (S1, S0, O0_3, O1_3, O2_3, O3_3);
decoder2_2_4_beh     m3 (S1, S0, O0_4, O1_4, O2_4, O3_4);

initial begin S1=0; S0=0; end
initial 
  begin
    #100 S0 = 1;
    #100 S1 = 1;
    #100 S0 = 0;
  end
endmodule