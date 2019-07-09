/*----------------------------------------------------------------------------
  Copyright (c) 2004 Aoki laboratory. All rights reserved.

  Top module: Multiplier_3_0_3_000

  Number system: 2's complement
  Multiplicand length: 4
  Multiplier length: 4
  Partial product generation: Simple PPG
  Partial product accumulation: Array
  Final stage addition: Ripple carry adder
----------------------------------------------------------------------------*/

module TCDECON_3_0(TOP, R, I);
  output [2:0] R;
  output [3:3] TOP;
  input [3:0] I;
  assign TOP[3] = I[3];
  assign R[0] = I[0];
  assign R[1] = I[1];
  assign R[2] = I[2];
endmodule

module UB1BPPG_0_0(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UB1BPPG_1_0(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UB1BPPG_2_0(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module NU1BPPG_3_0(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module NUBUB1CON_3(O, I);
  output O;
  input I;
  assign O = ~ I;
endmodule

module UB1BPPG_0_1(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UB1BPPG_1_1(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UB1BPPG_2_1(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module NU1BPPG_3_1(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module NUBUB1CON_4(O, I);
  output O;
  input I;
  assign O = ~ I;
endmodule

module UB1BPPG_0_2(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UB1BPPG_1_2(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UB1BPPG_2_2(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module NU1BPPG_3_2(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module NUBUB1CON_5(O, I);
  output O;
  input I;
  assign O = ~ I;
endmodule

module UN1BPPG_0_3(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UN1BPPG_1_3(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UN1BPPG_2_3(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module NUB1BPPG_3_3(O, IN1, IN2);
  output O;
  input IN1;
  input IN2;
  assign O = IN1 & IN2;
endmodule

module UBOne_4(O);
  output O;
  assign O = 1;
endmodule

module UB1DCON_4(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UB1DCON_0(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UB1DCON_1(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UB1DCON_2(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UB1DCON_3(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBHA_1(C, S, X, Y);
  output C;
  output S;
  input X;
  input Y;
  assign C = X & Y;
  assign S = X ^ Y;
endmodule

module UBFA_2(C, S, X, Y, Z);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
endmodule

module UBFA_3(C, S, X, Y, Z);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
endmodule

module UBFA_4(C, S, X, Y, Z);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
endmodule

module UB1DCON_5(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBHA_2(C, S, X, Y);
  output C;
  output S;
  input X;
  input Y;
  assign C = X & Y;
  assign S = X ^ Y;
endmodule

module UBFA_5(C, S, X, Y, Z);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
endmodule

module UB1DCON_6(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBFA_6(C, S, X, Y, Z);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
endmodule

module UBZero_3_3(O);
  output [3:3] O;
  assign O[3] = 0;
endmodule

module UBTC1CON7_0(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBTC1CON7_1(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBTC1CON7_2(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBTC1CON7_3(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBTC1CON7_4(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBTC1CON7_5(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBTC1CON7_6(O, I);
  output O;
  input I;
  assign O = I;
endmodule

module UBTCTCONV_7_7(O, I);
  output [7:7] O;
  input [7:7] I;
  assign O = ~ I;
endmodule

module Multiplier_3_0_3_000(P, IN1, IN2);
  output [7:0] P;
  input [3:0] IN1;
  input [3:0] IN2;
  wire [7:0] W;
  assign P[0] = W[0];
  assign P[1] = W[1];
  assign P[2] = W[2];
  assign P[3] = W[3];
  assign P[4] = W[4];
  assign P[5] = W[5];
  assign P[6] = W[6];
  assign P[7] = W[7];
  MultTC_STD_ARY_RC000 U0 (W, IN1, IN2);
endmodule

module CSA_4_0_4_1_5_2 (C, S, X, Y, Z);
  output [5:2] C;
  output [5:0] S;
  input [4:0] X;
  input [4:1] Y;
  input [5:2] Z;
  UB1DCON_0 U0 (S[0], X[0]);
  UBHA_1 U1 (C[2], S[1], Y[1], X[1]);
  PureCSA_4_2 U2 (C[5:3], S[4:2], Z[4:2], Y[4:2], X[4:2]);
  UB1DCON_5 U3 (S[5], Z[5]);
endmodule

module CSA_5_0_5_2_6_3 (C, S, X, Y, Z);
  output [6:3] C;
  output [6:0] S;
  input [5:0] X;
  input [5:2] Y;
  input [6:3] Z;
  UBCON_1_0 U0 (S[1:0], X[1:0]);
  UBHA_2 U1 (C[3], S[2], Y[2], X[2]);
  PureCSA_5_3 U2 (C[6:4], S[5:3], Z[5:3], Y[5:3], X[5:3]);
  UB1DCON_6 U3 (S[6], Z[6]);
endmodule

module MultTC_STD_ARY_RC000 (P, IN1, IN2);
  output [7:0] P;
  input [3:0] IN1;
  input [3:0] IN2;
  wire [4:0] PP0;
  wire [4:1] PP1;
  wire [5:2] PP2;
  wire [6:3] PP3;
  wire [7:0] P_UB;
  wire [6:3] S1;
  wire [6:0] S2;
  TCPPG_3_0_3_0 U0 (PP0, PP1, PP2, PP3, IN1, IN2);
  UBARYACC_4_0_4_1_000 U1 (S1, S2, PP0, PP1, PP2, PP3);
  UBRCA_6_3_6_0 U2 (P_UB, S1, S2);
  UBTCCONV7_7_0 U3 (P, P_UB);
endmodule

module NUBUBCON_5_3 (O, I);
  output [5:3] O;
  input [5:3] I;
  NUBUB1CON_3 U0 (O[3], I[3]);
  NUBUB1CON_4 U1 (O[4], I[4]);
  NUBUB1CON_5 U2 (O[5], I[5]);
endmodule

module PureCSA_4_2 (C, S, X, Y, Z);
  output [5:3] C;
  output [4:2] S;
  input [4:2] X;
  input [4:2] Y;
  input [4:2] Z;
  UBFA_2 U0 (C[3], S[2], X[2], Y[2], Z[2]);
  UBFA_3 U1 (C[4], S[3], X[3], Y[3], Z[3]);
  UBFA_4 U2 (C[5], S[4], X[4], Y[4], Z[4]);
endmodule

module PureCSA_5_3 (C, S, X, Y, Z);
  output [6:4] C;
  output [5:3] S;
  input [5:3] X;
  input [5:3] Y;
  input [5:3] Z;
  UBFA_3 U0 (C[4], S[3], X[3], Y[3], Z[3]);
  UBFA_4 U1 (C[5], S[4], X[4], Y[4], Z[4]);
  UBFA_5 U2 (C[6], S[5], X[5], Y[5], Z[5]);
endmodule

module TCNVPPG_3_0_3 (O, IN1, IN2);
  output [6:3] O;
  input [3:0] IN1;
  input IN2;
  wire IN1N;
  wire [2:0] IN1P;
  wire [5:3] NEG;
  TCDECON_3_0 U0 (IN1N, IN1P, IN1);
  UN1BPPG_0_3 U1 (NEG[3], IN1P[0], IN2);
  UN1BPPG_1_3 U2 (NEG[4], IN1P[1], IN2);
  UN1BPPG_2_3 U3 (NEG[5], IN1P[2], IN2);
  NUB1BPPG_3_3 U4 (O[6], IN1N, IN2);
  NUBUBCON_5_3 U5 (O[5:3], NEG);
endmodule

module TCPPG_3_0_3_0 (PP0, PP1, PP2, PP3, IN1, IN2);
  output [4:0] PP0;
  output [4:1] PP1;
  output [5:2] PP2;
  output [6:3] PP3;
  input [3:0] IN1;
  input [3:0] IN2;
  wire BIAS;
  wire [2:0] IN2R;
  wire IN2T;
  wire [3:0] W;
  TCDECON_3_0 U0 (IN2T, IN2R, IN2);
  TCUVPPG_3_0_0 U1 (W, IN1, IN2R[0]);
  TCUVPPG_3_0_1 U2 (PP1, IN1, IN2R[1]);
  TCUVPPG_3_0_2 U3 (PP2, IN1, IN2R[2]);
  TCNVPPG_3_0_3 U4 (PP3, IN1, IN2T);
  UBOne_4 U5 (BIAS);
  UBCMBIN_4_4_3_0 U6 (PP0, BIAS, W);
endmodule

module TCUVPPG_3_0_0 (O, IN1, IN2);
  output [3:0] O;
  input [3:0] IN1;
  input IN2;
  wire IN1N;
  wire [2:0] IN1P;
  wire NEG;
  TCDECON_3_0 U0 (IN1N, IN1P, IN1);
  UB1BPPG_0_0 U1 (O[0], IN1P[0], IN2);
  UB1BPPG_1_0 U2 (O[1], IN1P[1], IN2);
  UB1BPPG_2_0 U3 (O[2], IN1P[2], IN2);
  NU1BPPG_3_0 U4 (NEG, IN1N, IN2);
  NUBUB1CON_3 U5 (O[3], NEG);
endmodule

module TCUVPPG_3_0_1 (O, IN1, IN2);
  output [4:1] O;
  input [3:0] IN1;
  input IN2;
  wire IN1N;
  wire [2:0] IN1P;
  wire NEG;
  TCDECON_3_0 U0 (IN1N, IN1P, IN1);
  UB1BPPG_0_1 U1 (O[1], IN1P[0], IN2);
  UB1BPPG_1_1 U2 (O[2], IN1P[1], IN2);
  UB1BPPG_2_1 U3 (O[3], IN1P[2], IN2);
  NU1BPPG_3_1 U4 (NEG, IN1N, IN2);
  NUBUB1CON_4 U5 (O[4], NEG);
endmodule

module TCUVPPG_3_0_2 (O, IN1, IN2);
  output [5:2] O;
  input [3:0] IN1;
  input IN2;
  wire IN1N;
  wire [2:0] IN1P;
  wire NEG;
  TCDECON_3_0 U0 (IN1N, IN1P, IN1);
  UB1BPPG_0_2 U1 (O[2], IN1P[0], IN2);
  UB1BPPG_1_2 U2 (O[3], IN1P[1], IN2);
  UB1BPPG_2_2 U3 (O[4], IN1P[2], IN2);
  NU1BPPG_3_2 U4 (NEG, IN1N, IN2);
  NUBUB1CON_5 U5 (O[5], NEG);
endmodule

module UBARYACC_4_0_4_1_000 (S1, S2, PP0, PP1, PP2, PP3);
  output [6:3] S1;
  output [6:0] S2;
  input [4:0] PP0;
  input [4:1] PP1;
  input [5:2] PP2;
  input [6:3] PP3;
  wire [5:2] IC0;
  wire [5:0] IS0;
  CSA_4_0_4_1_5_2 U0 (IC0, IS0, PP0, PP1, PP2);
  CSA_5_0_5_2_6_3 U1 (S1, S2, IS0, IC0, PP3);
endmodule

module UBCMBIN_4_4_3_0 (O, IN0, IN1);
  output [4:0] O;
  input IN0;
  input [3:0] IN1;
  UB1DCON_4 U0 (O[4], IN0);
  UBCON_3_0 U1 (O[3:0], IN1);
endmodule

module UBCON_1_0 (O, I);
  output [1:0] O;
  input [1:0] I;
  UB1DCON_0 U0 (O[0], I[0]);
  UB1DCON_1 U1 (O[1], I[1]);
endmodule

module UBCON_2_0 (O, I);
  output [2:0] O;
  input [2:0] I;
  UB1DCON_0 U0 (O[0], I[0]);
  UB1DCON_1 U1 (O[1], I[1]);
  UB1DCON_2 U2 (O[2], I[2]);
endmodule

module UBCON_3_0 (O, I);
  output [3:0] O;
  input [3:0] I;
  UB1DCON_0 U0 (O[0], I[0]);
  UB1DCON_1 U1 (O[1], I[1]);
  UB1DCON_2 U2 (O[2], I[2]);
  UB1DCON_3 U3 (O[3], I[3]);
endmodule

module UBPriRCA_6_3 (S, X, Y, Cin);
  output [7:3] S;
  input Cin;
  input [6:3] X;
  input [6:3] Y;
  wire C4;
  wire C5;
  wire C6;
  UBFA_3 U0 (C4, S[3], X[3], Y[3], Cin);
  UBFA_4 U1 (C5, S[4], X[4], Y[4], C4);
  UBFA_5 U2 (C6, S[5], X[5], Y[5], C5);
  UBFA_6 U3 (S[7], S[6], X[6], Y[6], C6);
endmodule

module UBPureRCA_6_3 (S, X, Y);
  output [7:3] S;
  input [6:3] X;
  input [6:3] Y;
  wire C;
  UBPriRCA_6_3 U0 (S, X, Y, C);
  UBZero_3_3 U1 (C);
endmodule

module UBRCA_6_3_6_0 (S, X, Y);
  output [7:0] S;
  input [6:3] X;
  input [6:0] Y;
  UBPureRCA_6_3 U0 (S[7:3], X[6:3], Y[6:3]);
  UBCON_2_0 U1 (S[2:0], Y[2:0]);
endmodule

module UBTCCONV7_7_0 (O, I);
  output [7:0] O;
  input [7:0] I;
  UBTC1CON7_0 U0 (O[0], I[0]);
  UBTC1CON7_1 U1 (O[1], I[1]);
  UBTC1CON7_2 U2 (O[2], I[2]);
  UBTC1CON7_3 U3 (O[3], I[3]);
  UBTC1CON7_4 U4 (O[4], I[4]);
  UBTC1CON7_5 U5 (O[5], I[5]);
  UBTC1CON7_6 U6 (O[6], I[6]);
  UBTCTCONV_7_7 U7 (O[7], I[7]);
endmodule

