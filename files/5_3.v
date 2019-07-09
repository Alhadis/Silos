module mux8_2_1_beh (I, S, O);
  input [7:0] I; // οι πηγές μας σχηματίζουν μια αρτηρία 8 σημάτων
  input [2:0] S; // τα 3 σήματα επιλογής της πηγής
  output      O;
  reg         O;

  always @(I or S)
    case (S)
      0 : O = I[0];
      1 : O = I[1];
      2 : O = I[2];
      3 : O = I[3];
      4 : O = I[4];
      5 : O = I[5];
      6 : O = I[6];
      7 : O = I[7];
    endcase
endmodule



module mux4_2_1_behavioral (I0, I1, I2, I3, S1, S0, F);
  input I0, I1, I2, I3, S1, S0;
  output F;

  assign F = (~S1) ? (~S0) ? I0 : I1 : (~S0) ? I2 : I3 ;
endmodule



module mux8_2_1_mixed (I, S, O);
  input [7:0] I; // οι πηγές μας σχηματίζουν μια αρτηρία 8 σημάτων
  input [2:0] S; // τα 3 σήματα επιλογής της πηγής
  output      O;
  wire        F_S2_0, F_S2_1;

  mux4_2_1_behavioral cp0 (I[0], I[1], I[2], I[3], S[1], S[0], F_S2_0);
  mux4_2_1_behavioral cp1 (I[4], I[5], I[6], I[7], S[1], S[0], F_S2_1);
  assign O = S[2] ? F_S2_1 : F_S2_0;
endmodule



module mux2_2_1_behavioral (I0, I1, S0, F);
  input I0, I1, S0;
  output F;

  assign F = (~S0) ? I0 : I1;
endmodule



module mux8_2_1_struct (I, S, O);
  input [7:0] I; // οι πηγές μας σχηματίζουν μια αρτηρία 8 σημάτων
  input [2:0] S; // τα 3 σήματα επιλογής της πηγής
  output      O;

// Oι παρακάτω 4 πολυπλέκτες ανάλογα με τη τιμή του S[0] αποφασίζουν αν θα επιλεγεί μια πηγή
// δεδομένων με άρτια ή περιττή τιμή
  mux2_2_1_behavioral cp0 (I[0], I[1], S[0], even_odd_0);
  mux2_2_1_behavioral cp1 (I[2], I[3], S[0], even_odd_1);
  mux2_2_1_behavioral cp2 (I[4], I[5], S[0], even_odd_2);
  mux2_2_1_behavioral cp3 (I[6], I[7], S[0], even_odd_3);

// Οι παρακάτω 2 πολυπλέκτες ανάλογα με τη τιμή του S[1] αποφασίζουν ποια από τις πηγές που
// προκρίθηκαν από το προηγούμενο στάδιο θα συνεχίσουν να είναι υποψήφιες. Όταν S[1] = 0 
// θέλουμε κάποια από τις (0,1) και (4,5) ενώ όταν S[1] =1 κάποια από τις (2,3) ή (6,7). Εντός 
// της δυάδας η επιλογή έχει γίνει στο προηγούμενο στάδιο.
  mux2_2_1_behavioral cp4 (even_odd_0, even_odd_1, S[1], can_0);
  mux2_2_1_behavioral cp5 (even_odd_2, even_odd_3, S[1], can_1);

// H τελική επιλογή βάσει του S[2]
  mux2_2_1_behavioral cp6 (can_0, can_1, S[2], O);
endmodule



module decoder2_2_4 (S1, S0, O0, O1, O2, O3);
  input S1, S0;
  output O0, O1, O2, O3;

  assign O0 = ~S1 & ~S0;
  assign O1 = ~S1 & S0;
  assign O2 = S1 & ~S0;
  assign O3 = S1 & S0;
endmodule



module mux4_2_1_decoder_based (A, B, C, D, S, T, O);
  input A, B, C, D, S, T;
  output O;
  wire D0, D1, D2, D3;

  decoder2_2_4 i0 (S, T, D0, D1, D2, D3);
  and          i1 (P1, D0, A);
  and          i2 (P2, D1, B);
  and          i3 (P3, D2, C);
  and          i4 (P4, D3, D);
  or           i5 (O, P1, P2, P3, P4);
endmodule



module mux8_2_1_too_many_levels (I, S, O);
  input [7:0] I; // οι πηγές μας σχηματίζουν μια αρτηρία 8 σημάτων
  input [2:0] S; // τα 3 σήματα επιλογής της πηγής
  output      O;
  wire        F_S2_0, F_S2_1;

  mux4_2_1_decoder_based cp0 (I[0], I[1], I[2], I[3], S[2], S[1], F_S2_0);
  mux4_2_1_decoder_based cp1 (I[4], I[5], I[6], I[7], S[2], S[1], F_S2_1);

  mux2_2_1_behavioral cp2 (F_S2_0, F_S2_1, S[2], O);
endmodule



module test_them_all ();
  reg [7:0] DataSource;
  reg [2:0] Select;

  mux8_2_1_beh             CUT1 (DataSource, Select, O1);
  mux8_2_1_mixed           CUT2 (DataSource, Select, O2);
  mux8_2_1_struct          CUT3 (DataSource, Select, O3);
  mux8_2_1_too_many_levels CUT4 (DataSource, Select, O4);

  initial begin DataSource=0; Select=0; end
  always   #10 DataSource=DataSource+1;
  always #2000 Select=Select+1;
  always    #5 if ((O1!= O2) | (O1!= O3) | (O1!= O4) | (O2!= O3) | (O2!= O4) | (O3!= O4)) $stop();
endmodule
