//Verilog HDL for "lyt_9160734", "KC_ADD_C_B_X1" "functional"

`timescale 1ns / 100ps
module KC_ADD_C_B_X1 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
//assign Y = AB && AC && BC;

assign Y = (A && B) || (A && C) || (B && C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_ADD_C_X1" "functional"

`timescale 1ns / 100ps
module KC_ADD_C_X1 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
//assign Y =  ~(AB && AC && BC) ;

assign Y = ~((A && B) || (A && C) || (B && C));

endmodule
//Verilog HDL for "lyt_9160734", "KC_ADDH_X1" "functional"

`timescale 1ns / 100ps
module KC_ADDH_X1 ( S, Co, A, B );

  output S;
  output Co;
  input A;
  input B;

wire S, Co;

assign S = A ^ B; 

assign Co = (A && B);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AND2BB_X1" "functional"

`timescale 1ns / 100ps
module KC_AND2BB_X1 ( Y, AN, BN );

  output Y;
  input AN;
  input BN;

wire Y;
//assign Y = AN && BN ;

assign Y = (~AN) && (~BN);

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND2B_X1" "functional"

`timescale 1ns / 100ps
module KC_AND2B_X1 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
//assign Y = ~A && B ;

assign Y = ~(B && ~A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND2B_X2" "functional"

`timescale 1ns / 100ps
module KC_AND2B_X2 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
//assign Y = A && ~B ;

//assign Y = ~(B || ~A);
assign Y = (~B) & A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND2_X1" "functional"

`timescale 1ns / 100ps
module KC_AND2_X1 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND2_X2" "functional"

`timescale 1ns / 100ps
module KC_AND2_X2 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND2_X3" "functional"

`timescale 1ns / 100ps
module KC_AND2_X3 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND2_X4" "functional"

`timescale 1ns / 100ps
module KC_AND2_X4 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND3_X1" "functional"

`timescale 1ns / 100ps
module KC_AND3_X1 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
assign Y = A && B && C;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND4B_X1" "functional"

`timescale 1ns / 100ps
module KC_AND4B_X1 ( Y, AN, B, C, D );

  input C;
  output Y;
  input AN;
  input D;
  input B;

wire Y;
assign Y = (~AN) && B && C && D;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND4_X1" "functional"

`timescale 1ns / 100ps
module KC_AND4_X1 ( Y, A, B, C, D );

  input C;
  output Y;
  input A;
  input D;
  input B;

wire Y;
assign Y = A && B && C && D;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AND4_X2" "functional"

`timescale 1ns / 100ps
module KC_AND4_X2 ( Y, A, B, C, D );

  input C;
  output Y;
  input A;
  input D;
  input B;

wire Y;
assign Y = A && B && C && D;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AO112BB_X1" "functional"

`timescale 1ns / 100ps
module KC_AO112BB_X1 ( Y, A, B, C, D );

  input A;
  output Y;
  input B;
  input C;
  input D;

wire Y;
//assign Y = ~((A && B) || ~C || ~D);

assign Y = A && B || ~C && ~D;

endmodule
//Verilog HDL for "LYT_9160734", "KC_AO12B_X1" "functional"

`timescale 1ns / 100ps
module KC_AO12B_X1 ( Y, A, B, C );

  input B;
  output Y;
  input A;
  input C;

wire Y;
assign Y = A && B || (~C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_AO12B_X2" "functional"

`timescale 1ns / 100ps
module KC_AO12B_X2 ( Y, A, B, C );

  input B;
  output Y;
  input A;
  input C;

wire Y;
assign Y = A && B || (~C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_AO21_X1" "functional"

`timescale 1ns / 100ps
module KC_AO21_X1 ( Y, A0, A1, B );

  input B;
  output Y;
  input A0;
  input A1;
wire Y;

assign Y = (A0 && A1) || B;
endmodule
//Verilog HDL for "lyt_9160734", "KC_AO21_X2" "functional"

`timescale 1ns / 100ps
module KC_AO21_X2 ( Y, A0, A1, B );

  input B;
  output Y;
  input A0;
  input A1;
wire Y;

assign Y = (A0 && A1) || B;
endmodule
//Verilog HDL for "lyt_9160734", "KC_AO2222_X1" "functional"

`timescale 1ns / 100ps

module KC_AO2222_X1 ( Y, A0, A1, B0, B1, C0, C1, D0, D1 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;
  input C0;
  input C1;
  input D0;
  input D1;

wire Y;

assign Y =  ((A0 && A1) || (B0 && B1) || (C0 && C1) || (D0 && D1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AO2222_X2" "functional"

`timescale 1ns / 100ps

module KC_AO2222_X2 ( Y, A0, A1, B0, B1, C0, C1, D0, D1 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;
  input C0;
  input C1;
  input D0;
  input D1;

wire Y;

assign Y =  ((A0 && A1) || (B0 && B1) || (C0 && C1) || (D0 && D1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AO222_X1" "functional"

`timescale 1ns / 100ps
module KC_AO222_X1 ( Y, C1, C0, B1, B0, A1, A0 );

  input B1;
  input A1;
  output Y;
  input C1;
  input C0;
  input A0;
  input B0;
wire Y;

//assign Y = ~( (A0 && A1) || (B0 && B1) || ( C0 && C1));

//assign Y = A0 && A1 || B0 && B1 || C0 && C1 || D0 && D1;
assign Y = A0 && A1 || B0 && B1 || C0 && C1 ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_AO22BB_X1" "functional"

`timescale 1ns / 100ps

module KC_AO22BB_X1 ( Y, A, B, C, D );

  input A;
  input B;
  output Y;
  input C;
  input D;

wire Y;

assign Y =  (A && B) || (~C && ~D);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AO22_X1" "functional"

`timescale 1ns / 100ps

module KC_AO22_X1 ( Y, A0, A1, B0, B1 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y =  (A0 && A1) || (B0 && B1);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AO22_X2" "functional"

`timescale 1ns / 100ps

module KC_AO22_X2 ( Y, A0, A1, B0, B1 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y =  (A0 && A1) || (B0 && B1);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AO22_X3" "functional"

`timescale 1ns / 100ps

module KC_AO22_X3 ( Y, A0, A1, B0, B1 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y =  (A0 && A1) || (B0 && B1);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI112B_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI112B_X1 ( Y, C0, C1N, A, B );

  input A;
  output Y;
  input C0;
  input C1N;
  input B;

wire Y;
assign Y = ~((C0 && ~C1N) || B || A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI211_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI211_X1 ( Y, C0, C1, A, B );

  input A;
  output Y;
  input C0;
  input C1;
  input B;

wire Y;
assign Y = ~((C0 && C1) || B || A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI21BB_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI21BB_X1 ( Y, A1N, BN, A0 );

  input A0;
  output Y;
  input BN;
  input A1N;
wire Y;

assign Y = ~((A0 && ~A1N) || ~BN);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI21B_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI21B_X1 ( Y, A1, B, A0N );

  input A0N;
  output Y;
  input B;
  input A1;
wire Y;

assign Y = ~((~A0N && A1) || B);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI21B_X2" "functional"

`timescale 1ns / 100ps
module KC_AOI21B_X2 ( Y, A1, BN, A0 );

  input A0;
  output Y;
  input BN;
  input A1;
wire Y;

assign Y = ~((A0 && A1) || ~BN);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI21_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI21_X1 ( Y, A1, B, A0 );

  input A0;
  output Y;
  input B;
  input A1;
wire Y;

assign Y = ~((A0 && A1) || B);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI222_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI222_X1 ( Y, C1, C0, B1, B0, A1, A0 );

  input B1;
  input A1;
  output Y;
  input C1;
  input C0;
  input A0;
  input B0;
wire Y;

//assign Y = ( (A0 && A1) || (B0 && B1) || ( C0 && C1));

assign Y = ~( (A0 && A1) || (B0 && B1) || ( C0 && C1));


endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI22BB_X1" "functional"

`timescale 1ns / 100ps

module KC_AOI22BB_X1 ( Y, A0N, A1, B0N, B1 );

  input B1;
  input A1;
  output Y;
  input A0N;
  input B0N;

wire Y;

assign Y =  ~((~A0N && A1) || (~B0N && B1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI22B_X1" "functional"

`timescale 1ns / 100ps

module KC_AOI22B_X1 ( Y, A0N, A1, B0, B1 );

  input B1;
  input A1;
  output Y;
  input A0N;
  input B0;

wire Y;

assign Y =  ~((~A0N && A1) || (B0 && B1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI22B_X2" "functional"

`timescale 1ns / 100ps

module KC_AOI22B_X2 ( Y, A0N, A1, B0, B1 );

  input B1;
  input A1;
  output Y;
  input A0N;
  input B0;

wire Y;

assign Y =  ~((~A0N && A1) || (B0 && B1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI22_X1" "functional"

`timescale 1ns / 100ps

module KC_AOI22_X1 ( Y, A0, A1, B0, B1 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y =  ~((A0 && A1) || (B0 && B1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI22_X2" "functional"

`timescale 1ns / 100ps

module KC_AOI22_X2 ( Y, A0, A1, B0, B1 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y =  ~((A0 && A1) || (B0 && B1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI31_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI31_X1 ( Y, A, B2, B1, B0 );

  input B1;
  output Y;
  input B0;
  input A;
  input B2;
wire Y;

assign Y = ~((B0 && B1 && B2) || A);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI31_X2" "functional"

`timescale 1ns / 100ps
module KC_AOI31_X2 ( Y, A, B2, B1, B0 );

  input B1;
  output Y;
  input B0;
  input A;
  input B2;
wire Y;

assign Y = ~((B0 && B1 && B2) || A);
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI32_X1" "functional"

`timescale 1ns / 100ps
module KC_AOI32_X1 ( Y, A0, A1,  A2, B1, B0 );

  input B1;
  output Y;
  input B0;
  input A0;
  input A1;
  input A2;
wire Y;

assign Y = ~((A0 && A1 && A2) || (B0 && B1));
endmodule
//Verilog HDL for "lyt_9160734", "KC_AOI32_X2" "functional"

`timescale 1ns / 100ps
module KC_AOI32_X2 ( Y, A, B, C, D, E );

  input A;
  output Y;
  input B;
  input C;
  input D;
  input E;
wire Y;

assign Y = ~((A && B && C) || (D && E));
endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X1" "functional"

`timescale 1ns / 100ps
module KC_BUF_X1 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X10" "functional"

`timescale 1ns / 100ps
module KC_BUF_X10 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X12" "functional"

`timescale 1ns / 100ps
module KC_BUF_X12 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X13" "functional"

`timescale 1ns / 100ps
module KC_BUF_X13 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X14" "functional"

`timescale 1ns / 100ps
module KC_BUF_X14 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X15" "functional"

`timescale 1ns / 100ps
module KC_BUF_X15 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X16" "functional"

`timescale 1ns / 100ps
module KC_BUF_X16 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X2" "functional"

`timescale 1ns / 100ps
module KC_BUF_X2 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X3" "functional"

`timescale 1ns / 100ps
module KC_BUF_X3 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X4" "functional"

`timescale 1ns / 100ps
module KC_BUF_X4 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X5" "functional"

`timescale 1ns / 100ps
module KC_BUF_X5 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X6" "functional"

`timescale 1ns / 100ps
module KC_BUF_X6 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X7" "functional"

`timescale 1ns / 100ps
module KC_BUF_X7 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X8" "functional"

`timescale 1ns / 100ps
module KC_BUF_X8 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_BUF_X9" "functional"

`timescale 1ns / 100ps
module KC_BUF_X9 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFHQ_X1" "functional"

`timescale 1ns / 100ps
module KC_DFFHQ_X1 ( Q, D, CK );

  input CK;
  input D;
  output Q;

reg Q_reg;

always@(posedge CK)

	Q_reg <= D;



wire Q;

assign #1 Q = Q_reg;
endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFHQ_X2" "functional"

`timescale 1ns / 100ps
module KC_DFFHQ_X2 ( Q, D1, D2,  CK );

  input CK;
  input D1;
  input D2;
  output Q;

reg Q_reg;

//always@(posedge CK)

////	Q_reg <= D1 or D2;
//always @ (CK or D1 or D2)
// if (!CK)
//  Q_reg <= (D1 || D2);
always @ (posedge CK)
    Q_reg <= (D1 || D2);
wire Q;

assign #1 Q = CK & Q_reg;

endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFHQ_X3" "functional"

`timescale 1ns / 100ps
module KC_DFFHQ_X3 ( Q, D, CK );

  input CK;
  input D;
  output Q;

reg Q_reg;

//always@(posedge CK)

//	Q_reg <= D;

//always @ (CK or D)
// if (!CK)
//  Q_reg <= D ;
always @ (posedge  CK )
  Q_reg <= D ;

wire Q;

assign #1 Q = CK & Q_reg;

endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFRNHQ_X1" "functional"

`timescale 1ns / 100ps
module KC_DFFRNHQ_X1 ( Q, D, CK, RN );

  input CK;
  input RN;
  input D;
  output Q;

reg Q_reg;
always@(posedge CK or negedge RN)
begin
   if (RN == 1'b0)
      Q_reg <= 1'b0 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;
endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFRNHQ_X2" "functional"

`timescale 1ns / 100ps
module KC_DFFRNHQ_X2 ( Q, D, CK, RN );

  input CK;
  input RN;
  input D;
  output Q;

reg Q_reg;
always@(posedge CK or negedge RN)
begin
   if (RN == 1'b0)
      Q_reg <= 1'b0 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;
endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFRNHQ_X3" "functional"

`timescale 1ns / 100ps
module KC_DFFRNHQ_X3 ( Q, CK, D, RN);
  
  input CK;
  input RN;
  input D;
  output Q;

reg Q_reg;

always @ (negedge RN or posedge CK)
 begin
    if (RN == 1'b0)
     Q_reg <= 1'b0;
    else
     Q_reg <= D;
 end

wire Q;

assign #1 Q = Q_reg;

endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFRNHQ_X4" "functional"

`timescale 1ns / 100ps
module KC_DFFRNHQ_X4 ( Q, D, CK, CK1, RN );

  input CK1;
  input CK;
  input RN;
  input D;
  output Q;

reg Q_reg;
always@(posedge CK or negedge RN)
begin
   if (RN == 1'b0)
      Q_reg <= 1'b0 ;
   else if (CK1)
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;
endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFRNHQ_X5" "functional"

`timescale 1ns / 100ps
module KC_DFFRNHQ_X5 ( Q, D, CK, RN );

  input CK;
  input RN;
  input D;
  output Q;

reg Q_reg;
always@(posedge CK or negedge RN)
begin
   if (RN == 1'b0)
      Q_reg <= 1'b0 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;
endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFSNHQ_X1" "functional"
`timescale 1ns / 100ps
module KC_DFFSNHQ_X1 (D,CK ,SN, Q);
input D,CK ,SN;
output Q;

reg Q_reg;
always@(posedge CK or negedge SN)
begin
   if (SN == 1'b0)
      Q_reg <= 1'b1 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;
endmodule

/*
module KC_DFFSNHQ_X1 (D, CK, SN, Q );

input D;
input CK;
input SN;

output Q;

reg Q_reg;

always @ (posedge CK)
  begin
    if(SN == 1'b0)
	Q_reg <= 1'b1;
    else
	Q_reg <= D;
  end

wire Q;

assign #1 Q = Q_reg;

endmodule
*/

//Verilog HDL for "lyt_9160734", "KC_DFFSNHQ_X2" "functional"
`timescale 1ns / 100ps
module KC_DFFSNHQ_X2 (D,CK ,SN, Q);
input D,CK ,SN;
output Q;

reg Q_reg;
always@(posedge CK or negedge SN)
begin
   if (SN == 1'b0)
      Q_reg <= 1'b1 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;
endmodule

/*
module KC_DFFSNHQ_X2 (D, CK, SN, Q );

input D;
input CK;
input SN;

output Q;

reg Q_reg;

always @ (posedge CK)
  begin
    if(SN == 1'b0)
	Q_reg <= 1'b1;
    else
	Q_reg <= D;
  end

wire Q;

assign #1 Q = Q_reg;

endmodule
*/

//Verilog HDL for "lyt_9160734", "KC_DFFSNHQ_X3" "functional"

`timescale 1ns / 100ps
module KC_DFFSNHQ_X3 ( Q, CK, D, SN );

  input SN;
  input CK;
  input D;
  output Q;

reg Q_reg;

always @ (negedge SN or posedge CK)
  begin
    if(SN == 1'b0)
	Q_reg <= 1'b1;
    else
	Q_reg <= D;
  end

wire Q;

assign #1 Q = Q_reg;



endmodule
//Verilog HDL for "lyt_9160734", "KC_DFFSNHQ_X4" "functional"
`timescale 1ns / 100ps
module KC_DFFSNHQ_X4 (D,CK ,SN, Q);
input D,CK ,SN;
output Q;

reg Q_reg;
always@(posedge CK or negedge SN)
begin
   if (SN == 1'b0)
      Q_reg <= 1'b1 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;
endmodule

/*
module KC_DFFSNHQ_X4 (D, CK, SN, Q );

input D;
input CK;
input SN;

output Q;

reg Q_reg;

always @ (posedge CK)
  begin
    if(SN == 1'b0)
	Q_reg <= 1'b1;
    else
	Q_reg <= D;
  end

wire Q;

assign #1 Q = Q_reg;

endmodule
*/

//Verilog HDL for "lyt_9160734", "KC_INV_X1" "functional"

`timescale 1ns / 100ps
module KC_INV_X1 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_INV_X2" "functional"

`timescale 1ns / 100ps
module KC_INV_X2 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_INV_X3" "functional"

`timescale 1ns / 100ps
module KC_INV_X3 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_INV_X4" "functional"

`timescale 1ns / 100ps
module KC_INV_X4 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_INV_X5" "functional"

`timescale 1ns / 100ps
module KC_INV_X5 ( Y, A );

  output Y;
  input A;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_INV_X6" "functional"


`timescale 1ns / 100ps
module KC_INV_X8 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "lyt_9160734", "KC_MX2_X1" "functional"

`timescale 1ns / 100ps
module KC_MX2_X1 ( Y, A, B, S0 );

  input S0;
  output Y;
  input A;
  input B;

wire Y;

assign   Y = S0 ? B : A;
endmodule
//Verilog HDL for "lyt_9160734", "KC_MX2_X2" "functional"

`timescale 1ns / 100ps
module KC_MX2_X2 ( Y, A, B, S0 );

  input S0;
  output Y;
  input A;
  input B;

wire Y;

assign   Y = S0 ? B : A;
endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2B_X1" "functional"

`timescale 1ns / 100ps
module KC_MXI2B_X1 ( Y, A, S0, BN );

  input S0;
  output Y;
  input A;
  input BN;

wire Y;
assign   Y =  (S0 ? BN :((~BN & ~A) ? 1'bx : ~A));

//S0  BN  A   Y
//// 0  0   0   x
//// 0  0   1   0
//// 0  1   0   1   
//// 0  1   1   0
//// 1  0   x   0
//// 1  1   x   1
//
//assign   Y = ~ (S0 ? ~BN : A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2B_X2" "functional"

`timescale 1ns / 100ps
module KC_MXI2B_X2 ( Y, A, S0, BN );

  input S0;
  output Y;
  input A;
  input BN;

wire Y;

assign   Y =  ~(S0 ? ~BN : A);
endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2B_X3" "functional"

`timescale 1ns / 100ps
module KC_MXI2B_X3 ( Y, AN, S0, B );

  input S0;
  output Y;
  input AN;
  input B;

wire Y;

//assign   Y =  ~(S0 ? ~AN : B);

assign Y = ~(S0 ? B : ~AN);

endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2B_X4" "functional"

`timescale 1ns / 100ps
module KC_MXI2B_X4 ( Y, A, S0, BN );

  input S0;
  output Y;
  input A;
  input BN;

wire Y;
//assign   Y = ~ (S0 ? ~BN : A);

assign Y = ~(S0 ? A : ~BN);

endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2B_X5" "functional"

`timescale 1ns / 100ps
module KC_MXI2B_X5 ( Y, A, S0, BN );

  input S0;
  output Y;
  input A;
  input BN;

wire Y;
assign   Y = ~ (S0 ? ~BN : ((BN&A) ? 1'bx : A));

endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2B_X6" "functional"

`timescale 1ns / 100ps
module KC_MXI2B_X6 ( Y, A, S0, BN );

  input S0;
  output Y;
  input A;
  input BN;

wire Y;
assign   Y = ~ (S0 ? ((BN & A) ? 1'bx : A) : ~BN );

endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2_X1" "functional"

`timescale 1ns / 100ps
module KC_MXI2_X1 ( Y, A, S0, B );

  input S0;
  output Y;
  input A;
  input B;

wire Y;

//assign   Y =  ~(S0 ? A : B);

assign Y = ~(S0 ? B : A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2_X2" "functional"

`timescale 1ns / 100ps
module KC_MXI2_X2 ( Y, A, B, S0 );

  input S0;
  output Y;
  input A;
  input B;

wire Y;

assign   Y = ~(S0 ? B : A);
endmodule
//Verilog HDL for "lyt_9160734", "KC_MXI2_X3" "functional"

`timescale 1ns / 100ps
module KC_MXI2_X3 ( Y, A, S0, B );

  input S0;
  output Y;
  input A;
  input B;

wire Y;

//assign   Y =  ~(S0 ? A : B);

assign Y = ~(S0 ? B : A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND2B_X1" "funcational"

`timescale 1ns / 100ps
module KC_NAND2B_X1 ( Y, AN, B );

  output Y;
  input B;
  input AN;

wire Y;
assign Y = ~(~AN && B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND2B_X2" "funcational"

`timescale 1ns / 100ps
module KC_NAND2B_X2 ( Y, AN, B );

  output Y;
  input B;
  input AN;

wire Y;
assign Y = ~(~AN && B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND2_X1" "funcational"

`timescale 1ns / 100ps
module KC_NAND2_X1 ( Y, A, B );

  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND2_X2" "funcational"

`timescale 1ns / 100ps
module KC_NAND2_X2 ( Y, A, B );

  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND2_X3" "funcational"

`timescale 1ns / 100ps
module KC_NAND2_X3 ( Y, A, B );

  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3BB_X1" "functional"

`timescale 1ns / 100ps
module KC_NAND3BB_X1 ( Y, A, BN, CN );

  input CN;
  output Y;
  input BN;
  input A;

wire Y;
assign Y = ~(A && (~BN) && ~CN);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3B_X1" "functional"

`timescale 1ns / 100ps
module KC_NAND3B_X1 ( Y, A, B, CN );

  input CN;
  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B && ~CN);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3B_X2" "functional"

`timescale 1ns / 100ps
module KC_NAND3B_X2 ( Y, A, B, CN );

  input CN;
  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B && ~CN);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3_X1" "functional"

`timescale 1ns / 100ps
module KC_NAND3_X1 ( Y, A, B, C );

  input C;
  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3_X2" "functional"

`timescale 1ns / 100ps
module KC_NAND3_X2 ( Y, A, B, C );

  input C;
  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3_X3" "functional"

`timescale 1ns / 100ps
module KC_NAND3_X3 ( Y, A, B, C );

  input C;
  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3_X4" "functional"

`timescale 1ns / 100ps
module KC_NAND3_X4 ( Y, A, B, C );

  input C;
  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND3_X5" "functional"

`timescale 1ns / 100ps
module KC_NAND3_X5 ( Y, A, B, C );

  input C;
  output Y;
  input B;
  input A;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND4B_X1" "functional"

`timescale 1ns / 100ps
module KC_NAND4B_X1 ( Y, A, B, C, DN );

  input C;
  output Y;
  input A;
  input DN;
  input B;

wire Y;
assign Y = ~(A && B && C && ~DN);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND4_X1" "functional"

`timescale 1ns / 100ps
module KC_NAND4_X1 ( Y, A, B, C, D );

  input C;
  output Y;
  input A;
  input D;
  input B;

wire Y;
assign Y = ~(A && B && C && D);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND4_X2" "functional"

`timescale 1ns / 100ps
module KC_NAND4_X2 ( Y, A, B, C, D );

  input C;
  output Y;
  input A;
  input D;
  input B;

wire Y;
assign Y = ~(A && B && C && D);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NAND4_X3" "functional"

`timescale 1ns / 100ps
module KC_NAND4_X3 ( Y, A, B, C, D );

  input C;
  output Y;
  input A;
  input D;
  input B;

wire Y;
assign Y = ~(A && B && C && D);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2B_X1" "functional"

`timescale 1ns / 100ps
module KC_NOR2B_X1 ( Y, AN, B );

  output Y;
  input B;
  input AN;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2B_X2" "functional"

`timescale 1ns / 100ps
module KC_NOR2B_X2 ( Y, AN, B );

  output Y;
  input B;
  input AN;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2B_X3" "functional"

`timescale 1ns / 100ps
module KC_NOR2B_X3 ( Y, AN, B );

  output Y;
  input B;
  input AN;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2B_X4" "functional"

`timescale 1ns / 100ps
module KC_NOR2B_X4 ( Y, AN, B );

  output Y;
  input B;
  input AN;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2B_X5" "functional"

`timescale 1ns / 100ps
module KC_NOR2B_X5 ( Y, AN, B );

  output Y;
  input B;
  input AN;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2_X1" "functional"

`timescale 1ns / 100ps
module KC_NOR2_X1 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2_X2" "functional"

`timescale 1ns / 100ps
module KC_NOR2_X2 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2_X3" "functional"

`timescale 1ns / 100ps
module KC_NOR2_X3 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2_X4" "functional"

`timescale 1ns / 100ps
module KC_NOR2_X4 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR2_X5" "functional"

`timescale 1ns / 100ps
module KC_NOR2_X5 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR3B_X1" "functional"

`timescale 1ns / 100ps
module KC_NOR3B_X1 ( Y, A, B, CN );

  input CN;
  output Y;
  input A;
  input B;

wire Y;
assign Y = ~((~CN) || B || A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR3B_X2" "functional"

`timescale 1ns / 100ps
module KC_NOR3B_X2 ( Y, A, B, CN );

  input CN;
  output Y;
  input A;
  input B;

wire Y;
assign Y = ~((~CN) || B || A);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR3_X1" "funcational"

`timescale 1ns / 100ps
module KC_NOR3_X1 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A || B || C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR3_X2" "funcational"

`timescale 1ns / 100ps
module KC_NOR3_X2 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A || B || C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR3_X3" "funcational"

`timescale 1ns / 100ps
module KC_NOR3_X3 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A || B || C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR3_X4" "funcational"

`timescale 1ns / 100ps
module KC_NOR3_X4 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A || B || C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_NOR4_X1" "functional"

`timescale 1ns / 100ps
module KC_NOR4_X1 ( Y, A, B, C, D );

  input C;
  output Y;
  input A;
  input D;
  input B;

wire Y;
assign Y = ~(A || B || C || D);

endmodule
//Verilog HDL for "lyt_9160734", "KC_OA12B_X1" "functional"

`timescale 1ns / 100ps
module KC_OA12B_X1 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
assign Y = (A || B) && (~C);

//assign Y = ~(~(A || B) || C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_OA21_X1" "functional"

`timescale 1ns / 100ps
//module KC_OA21_X1 ( Y, A, B1, B0 );

//  input B1;
//  input B0;
//  output Y;
//  input A;

//wire Y;

//assign Y = ((B0 || B1) && A);
//endmodule

module KC_OA21_X1( Y, A0, A1, B );

input A0;
input A1;
output Y;
input B;

wire Y;

assign Y = (A0 || A1) && B;

endmodule

//Verilog HDL for "lyt_9160734", "KC_OA22_X1" "functional"

`timescale 1ns / 100ps

module KC_OA22_X1 ( Y, B1, B0, A1, A0 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y = (A0 || A1) && (B0 || B1);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI112BB_X1" "functional"

`timescale 1ns / 100ps
module KC_OAI112BB_X1 ( Y, C1, B, C0N, AN );

  output Y;
  input C1;
  input C0N;
  input AN;
  input B;

wire Y;

assign Y = ~((~C0N || C1) && B && ~AN);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI112B_X1" "functional"

`timescale 1ns / 100ps
module KC_OAI112B_X1 ( Y, C1, BN, C0, A );

  output Y;
  input C1;
  input C0;
  input A;
  input BN;

wire Y;

assign Y = ~((C0 || C1) && ~BN && A);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI112B_X2" "functional"

`timescale 1ns / 100ps
module KC_OAI112B_X2 ( Y, C1, B, C0, AN );

  output Y;
  input C1;
  input C0;
  input AN;
  input B;

wire Y;

assign Y = ~((C0 || C1) && B && ~AN);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI112_X1" "functional"

`timescale 1ns / 100ps
module KC_OAI112_X1 ( Y, C1, B, C0, A );

  output Y;
  input C1;
  input C0;
  input A;
  input B;

wire Y;

assign Y = ~((C0 || C1) && B && A);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI112_X2" "functional"

`timescale 1ns / 100ps
module KC_OAI112_X2 ( Y, C1, B, C0, A );

  output Y;
  input C1;
  input C0;
  input A;
  input B;

wire Y;

assign Y = ~((C0 || C1) && B && A);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI13_X1" "functional"

`timescale 1ns / 100ps
module KC_OAI13_X1 ( Y, B0, A, B1, B2 );

  input B1;
  output Y;
  input A;
  input B0;
  input B2;


wire Y;

assign Y = ~((B0 || B1 || B2) && A);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI13_X2" "functional"

`timescale 1ns / 100ps
module KC_OAI13_X2 ( Y, B0, A, B1, B2 );

  input B1;
  output Y;
  input A;
  input B0;
  input B2;


wire Y;

assign Y = ~((B0 || B1 || B2) && A);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI13_X3" "functional"

`timescale 1ns / 100ps
module KC_OAI13_X3 ( Y, B0, A, B1, B2 );

  input B1;
  output Y;
  input A;
  input B0;
  input B2;


wire Y;

assign Y = ~((B0 || B1 || B2) && A);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI211B_X1" "functional"

`timescale 1ns / 100ps
module KC_OAI211B_X1 ( Y, C1, B, C0N, A );

  output Y;
  input C1;
  input C0N;
  input A;
  input B;

wire Y;

assign Y = ~((~C0N || C1) && B && A);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI211B_X2" "functional"

`timescale 1ns / 100ps
module KC_OAI211B_X2 ( Y, C1, B, C0, AN );

  output Y;
  input C1;
  input C0;
  input AN;
  input B;

wire Y;

assign Y = ~((C0 || C1) && B && ~AN);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI211B_X3" "functional"

`timescale 1ns / 100ps
module KC_OAI211B_X3 ( Y, C1, B, C0N, A );

  output Y;
  input C1;
  input C0N;
  input A;
  input B;

wire Y;

assign Y = ~((~C0N || C1) && B && A);


endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI21BB_X2" "functional"

`timescale 1ns / 100ps
module KC_OAI21BB_X2 ( Y, A0, A1N, BN );

  input A1N;
  input BN;
  output Y;
  input A0;

wire Y;

assign Y = ~((A0 || ~A1N) && ~BN);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI21B_X1" "functional"

`timescale 1ns / 100ps
module KC_OAI21B_X1 ( Y, A0N, A1, B );

  input A1;
  input B;
  output Y;
  input A0N;

wire Y;

assign Y = ~((~A0N || A1) && B);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI21B_X2" "functional"

`timescale 1ns / 100ps
module KC_OAI21B_X2 ( Y, A0, A1, BN );

  input A1;
  input BN;
  output Y;
  input A0;

wire Y;

assign Y = ~((A0 || A1) && ~BN);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI21B_X3" "functional"

`timescale 1ns / 100ps
module KC_OAI21B_X3 ( Y, A0, A1, BN );

  input A1;
  input BN;
  output Y;
  input A0;

wire Y;

assign Y = ~((A0 || A1) && ~BN);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI21B_X4" "functional"

`timescale 1ns / 100ps
module KC_OAI21B_X4 ( Y, A0N, A1, B );

  input A1;
  input B;
  output Y;
  input A0N;

wire Y;

assign Y = ~((~A0N || A1) && B);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI21_X1" "functional"

`timescale 1ns / 100ps
module KC_OAI21_X1 ( Y, A1, B, A0 );

  input A1;
  input B;
  output Y;
  input A0;

wire Y;

assign Y = ~((A0 || A1) && B);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI21_X2" "functional"

`timescale 1ns / 100ps
module KC_OAI21_X2 ( Y, A1, B, A0 );

  input A1;
  input B;
  output Y;
  input A0;

wire Y;

assign Y = ~((A0 || A1) && B);
endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI22B_X1" "functional"

`timescale 1ns / 100ps

module KC_OAI22B_X1 ( Y, B1N, B0, A1, A0 );

  input B1N;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y = ~( (A0 || A1) && (B0 || ~B1N) );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI22_X1" "functional"

`timescale 1ns / 100ps

module KC_OAI22_X1 ( Y, B1, B0, A1, A0 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y = ~( (A0 || A1) && (B0 || B1) );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI22_X2" "functional"

`timescale 1ns / 100ps

module KC_OAI22_X2 ( Y, B1, B0, A1, A0 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y = ~( (A0 || A1) && (B0 || B1) );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OAI22_X3" "functional"

`timescale 1ns / 100ps

module KC_OAI22_X3 ( Y, B1, B0, A1, A0 );

  input B1;
  input A1;
  output Y;
  input A0;
  input B0;

wire Y;

assign Y = ~( (A0 || A1) && (B0 || B1) );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OR2_X1" "functional"

`timescale 1ns / 100ps
module KC_OR2_X1 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OR2_X2" "functional"

`timescale 1ns / 100ps
module KC_OR2_X2 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OR2_X3" "functional"

`timescale 1ns / 100ps
module KC_OR2_X3 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OR2_X4" "functional"

`timescale 1ns / 100ps
module KC_OR2_X4 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = (A || B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_OR3_X1" "funcational"

`timescale 1ns / 100ps
module KC_OR3_X1 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

wire Y;
assign Y = (A || B || C);

endmodule
//Verilog HDL for "lyt_9160734", "KC_OR4_X1" "functional"

`timescale 1ns / 100ps
module KC_OR4_X1 ( Y, A, B, C, D );

  output Y;
  input A;
  input B;
  input C;
  input D;

wire Y;
assign Y = A || B || C || D;

endmodule
//Verilog HDL for "lyt_9160734", "KC_OR4_X2" "functional"

`timescale 1ns / 100ps
module KC_OR4_X2 ( Y, A, B, C, D );

  output Y;
  input A;
  input B;
  input C;
  input D;

wire Y;
assign Y = A || B || C || D;

endmodule
//Verilog HDL for "lyt_9160734", "KC_SDFFRNHQ_X1" "functional"

`timescale 1ns / 100ps
module KC_SDFFRNHQ_X1 (D,CK ,RN, SI,SE,Q);
input D,CK ,RN,SI,SE;
output Q;

reg Q_reg;
always@(posedge CK or negedge RN)
begin
   if (RN == 1'b0)
      Q_reg <= 1'b0 ;
   else
//      Q_reg <= SE ? SI : D;

	Q_reg <= SE ? D : SI;

end

wire Q;
assign #1 Q = Q_reg;

endmodule


//Verilog HDL for "lyt_9160734", "KC_TIEH_X1" "functional"

`timescale 1ns / 100ps
module KC_TIEH_X1 ( Y );

  output Y;

wire Y;

assign Y = 1'B1;
endmodule
//Verilog HDL for "lyt_9160734", "KC_TIELO_X1" "functional"

`timescale 1ns / 100ps
module KC_TIELO_X1 ( Y );

  output Y;

wire Y;

assign Y = 1'B0;
endmodule
//Verilog HDL for "lyt_9160734 "KC_TINV_X1" "functional"

`timescale 1ns / 100ps
module KC_TINV_X1 ( Y, A, OE );

  output Y;
  input OE;
  input A;
 
wire Y;

assign Y = ~A;
//assign Y = OE ? (~A) : 1'Bz;
endmodule

//Verilog HDL for "lyt_9160734 "KC_TINV_X2" "functional"

`timescale 1ns / 100ps
module KC_TINV_X2 ( Y, A, B );

  output Y;
  input B;
  input A;
 
wire Y;

assign Y = A;
endmodule
//Verilog HDL for "lyt_9160734", "KC_TLAT_X1" "functional"

`timescale 1ns / 100ps
module KC_TLAT_X1 ( Q, A, B, CK );

  input CK;
  input A;
  input B;
  output Q;

reg Q_reg;

//always@(CK or A or B)
//   begin
//	if(CK== 1'b0)
//	    Q_reg <= (A || B) ;
//   end

always @ (posedge CK )
Q_reg <= (A || B);

wire Q;
assign #1 Q = CK & Q_reg;

endmodule
//Verilog HDL for "lyt_9160734", "KC_TLAT_X2" "functional"

`timescale 1ns / 100ps
module KC_TLAT_X2 ( Q, D, CK );

  input CK;
  input D;
  output Q;

reg Q_reg;
//always@(CK or D)
//   begin
//	if(CK== 1'b0)
//	    Q_reg <= D ;
//   end

always @ (posedge CK )
Q_reg <= D ;

wire Q;
assign #1 Q = CK & Q_reg;

endmodule
//Verilog HDL for "lyt_9160734", "KC_TLAT_X3" "functional"

`timescale 1ns / 100ps

module KC_TLAT_X3 ( Q, D, G );

  input G;
  input D;
  output Q;


wire Q;

assign Q = G ? D : ~D ;

//assign #1 Q = Q_reg;
endmodule
//Verilog HDL for "lyt_9160734", "KC_XNOR2_X1" "functional"

`timescale 1ns / 100ps
module KC_XNOR2_X1 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XNOR2_X2" "functional"

`timescale 1ns / 100ps
module KC_XNOR2_X2 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XNOR2_X3" "functional"

`timescale 1ns / 100ps
module KC_XNOR2_X3 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XNOR2_X4" "functional"
`timescale 1ns / 100ps

module KC_XNOR2_X4 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A ^ B) ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_XNOR2_X5" "functional"

`timescale 1ns / 100ps
module KC_XNOR2_X5 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XNOR2_X6" "functional"

`timescale 1ns / 100ps
module KC_XNOR2_X6 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
//assign Y = ~(A ^ B );
assign Y = (A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XNOR2_X8 "functional"

`timescale 1ns / 100ps
module KC_XNOR2_X8 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = ~(A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XOR2_X1" "functional"

`timescale 1ns / 100ps
module KC_XOR2_X1 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = (A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XOR2_X2" "functional"
`timescale 1ns / 100ps

module KC_XOR2_X2 ( Y, A, B );

 
  output Y;
  input A;
  input B;

wire Y;
//assign Y = (A ^ B) ;

assign Y = ~(A ^ B);

endmodule
//Verilog HDL for "lyt_9160734", "KC_XOR2_X3" "functional"
`timescale 1ns / 100ps

module KC_XOR2_X3 ( Y, A, B );

 
  output Y;
  input A;
  input B;

wire Y;
assign Y = (A ^ B) ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_XOR2_X4" "functional"
`timescale 1ns / 100ps

module KC_XOR2_X4 ( Y, A, B );

 
  output Y;
  input A;
  input B;

wire Y;
assign Y = (A ^ B) ;

endmodule
//Verilog HDL for "lyt_9160734", "KC_XOR2_X5" "functional"

`timescale 1ns / 100ps
module KC_XOR2_X5 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = (A ^ B );

endmodule
//Verilog HDL for "lyt_9160734", "KC_XOR2_X6" "functional"

`timescale 1ns / 100ps
module KC_XOR2_X6 ( Y, A, B );

  output Y;
  input A;
  input B;

wire Y;
assign Y = B ? (A ? 1'bx : 1'b1) : A ; 

endmodule
