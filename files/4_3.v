module dec2_2_4_struct (E, S1, S0, O0, O1, O2, O3);
  input E, S1, S0;
  output O0, O1, O2, O3;

  not n0 (S0n, S0);
  not n1 (S1n, S1);
  and a0 (O0, S1n, S0n, E);
  and a1 (O1, S1n, S0,  E);
  and a2 (O2,  S1, S0n, E);
  and a3 (O3,  S1, S0,  E);
endmodule



module dec2_2_4_equat (E, S1, S0, O0, O1, O2, O3);
  input E, S1, S0;
  output O0, O1, O2, O3;

  assign O0 = E & ~S1 & ~S0;
  assign O1 = E & ~S1 & S0;
  assign O2 = E &  S1 & ~S0;
  assign O3 = E &  S1 & S0;
endmodule



module dec2_2_4_beh (E, S1, S0, O0, O1, O2, O3);
  input E, S1, S0;
  output O0, O1, O2, O3;
  reg O0, O1, O2, O3;

  always@(E or S1 or S0)
    if (E)
      case ({S1, S0})
        0 : {O3, O2, O1, O0} = 1;
        1 : {O3, O2, O1, O0} = 2;
        2 : {O3, O2, O1, O0} = 4;
        3 : {O3, O2, O1, O0} = 8;
      endcase 
     else {O3, O2, O1, O0} = 0;
endmodule



module test_all_dec();
  reg S1, S0, E;
  wire O0_1, O1_1, O2_1, O3_1;
  wire O0_2, O1_2, O2_2, O3_2;
  wire O0_3, O1_3, O2_3, O3_3;


dec2_2_4_struct m0 (E, S1, S0, O0_1, O1_1, O2_1, O3_1);
dec2_2_4_equat  m1 (E, S1, S0, O0_2, O1_2, O2_2, O3_2);
dec2_2_4_beh    m2 (E, S1, S0, O0_3, O1_3, O2_3, O3_3);

initial begin E=0; S1=0; S0=0; end
initial 
  begin
    #100 S0 = 1;
    #100 S1 = 1;
    #100 S0 = 0;
    #100  E = 1;
    #100 S1 = 0; 
    #100 S0 = 1;
    #100 S1 = 1;
  end
endmodule