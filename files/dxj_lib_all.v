//Verilog HDL for "du_9160734", "KC_ADDF_X1" "functional"

`timescale 1ns / 100ps
module KC_ADDF_X1 (A,B,Ci, S);
input A,B,Ci;
output S;

wire S;
//assign S = A ^ B ^ Ci;

assign S = ~(A && B || (A || B) && Ci);

endmodule
//Verilog HDL for "du_9160734", "KC_ADDF_X3" "functional"

`timescale 1ns / 100ps

module KC_ADDF_X3 (A,B,Ci,Co);
input A,B,Ci;
output Co;

wire Co;
//assign Co = ((A ^ B) && Ci ) || (A && B);

assign Co = A && B || (A || B) && Ci;

endmodule
//Verilog HDL for "du9160734", "KC_AND2BB_X1" "functional"


`timescale 1ns / 100ps
 
module KC_AND2BB_X1 (AN,BN, Y);
input AN,BN;
output Y;

wire Y;
assign Y = (~AN) && (~BN) ;

endmodule
//Verilog HDL for "du9160734", "KC_AND2B_X1" "functional"


`timescale 1ns / 100ps
 
module KC_AND2B_X1 (A,B, Y);
input A,B;
output Y;

wire Y;
//assign Y = ~A && B ;

assign Y = ~A || B;

endmodule
//Verilog HDL for "du9160734", "KC_AND2B_X2" "functional"


`timescale 1ns / 100ps
 
module KC_AND2B_X2 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~A && B ;

endmodule
//Verilog HDL for "du9160734", "KC_AND2_X1" "functional"


`timescale 1ns / 100ps
 
module KC_AND2_X1 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "du9160734", "KC_AND2_X2" "functional"


`timescale 1ns / 100ps
 
module KC_AND2_X2 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "du9160734", "KC_AND2_X3" "functional"


`timescale 1ns / 100ps
 
module KC_AND2_X3 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "du9160734", "KC_AND2_X4" "functional"


`timescale 1ns / 100ps
 
module KC_AND2_X4 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "du9160734", "KC_AND2_X5" "functional"


`timescale 1ns / 100ps
 
module KC_AND2_X5 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = A && B ;

endmodule
//Verilog HDL for "du9160734", "KC_AND2_X6" "functional"


`timescale 1ns / 100ps
 
module KC_AND2_X6 (A,B, Y);
input A,B;
output Y;

wire Y;
//assign Y = A && B ;

assign Y = A || B ;

endmodule
//Verilog HDL for "du9160734", "KC_AND3_X1" "functional"


`timescale 1ns / 100ps
module KC_AND3_X1 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = A && B && C;

endmodule
//Verilog HDL for "du9160734", "KC_AND4B_X1" "functional"


`timescale 1ns / 100ps
module KC_AND4B_X1 (AN,B, C,D,Y);
input AN,B,C,D;
output Y;

wire Y;
assign Y = (~AN) && B && C && D;

endmodule
//Verilog HDL for "du9160734", "KC_AND4_X1" "functional"


`timescale 1ns / 100ps
module KC_AND4_X1 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = A && B && C && D;

endmodule
//Verilog HDL for "du9160734", "KC_AND4_X2" "functional"


`timescale 1ns / 100ps
module KC_AND4_X2 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = A && B && C && D;

endmodule
//Verilog HDL for "du9160734", "KC_AO21_X1" "functional"


`timescale 1ns / 100ps
module KC_AO21_X1(A0,A1,B,Y);
input A0,A1,B;
output Y;

wire Y;
assign Y = (A0 && A1) || B;

endmodule
//Verilog HDL for "du9160734", "KC_AO21_X2" "functional"


`timescale 1ns / 100ps
module KC_AO21_X2 (A0,A1,B,Y);
input A0,A1,B;
output Y;

wire Y;
assign Y = (A0 && A1) || B;

endmodule
//Verilog HDL for "du9160734", "KC_AO21_X3" "functional"


`timescale 1ns / 100ps
module KC_AO21_X3 (A0,A1,B,Y);
input A0,A1,B;
output Y;

wire Y;
//assign Y = (A0 && A1) || B;

assign Y = A0 && (B || A1);

endmodule
//Verilog HDL for "du9160734", "KC_AO222_X1" "functional"


`timescale 1ns / 100ps
module KC_AO222_X1 ( Y,C1, C0, B1, B0, A1, A0 );

  input B1;
  input A1;
  output Y;
  input C0;
  input C1;
  input A0;
  input B0;

wire Y;
//assign Y = (A0 && A1) || (B0 && B1) || (C0 && C1) ;

assign Y = ((A0 && A1) || (B0 && B1) || (C0 && C1)) ;

endmodule
//Verilog HDL for "du9160734", "KC_AO22_X1" "functional"


`timescale 1ns / 100ps
module KC_AO22_X1 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = (A0 && A1) || (B0 && B1);

endmodule
//Verilog HDL for "du9160734", "KC_AO22_X2" "functional"


`timescale 1ns / 100ps
module KC_AO22_X2 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = (A0 && A1) || (B0 && B1);

endmodule
//Verilog HDL for "du9160734", "KC_AOI211_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI211_X1 (C0,C1,B,A,Y);
input C0,C1,B, A;
output Y;

wire Y;
assign Y = ~((C0 && C1) || B || A);

endmodule
//Verilog HDL for "du9160734", "KC_AOI21B_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI21B_X1 (AN,B1,B0,Y);
input AN,B1,B0;
output Y;

wire Y;
assign Y = ~((B0 && B1) || ~(AN));

endmodule
//Verilog HDL for "du9160734", "KC_AOI21B_X2" "functional"


`timescale 1ns / 100ps
module KC_AOI21B_X2 (A0N,A1,B,Y);
input A0N,A1,B;
output Y;

wire Y;
assign Y = ~((~(A0N) && A1) || B);

endmodule
//Verilog HDL for "du9160734", "KC_AOI21_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI21_X1 (A,B1,B0,Y);
input A,B1,B0;
output Y;

wire Y;
assign Y = ~((B0 && B1) || A);

endmodule
//Verilog HDL for "du9160734", "KC_AOI222_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI222_X1 (A0,A1,B0,B1,C0,C1,Y);
input A0,A1,B0,B1,C0,C1;
output Y;

wire Y;
assign Y = ~( (A0 && A1) || (B0 && B1) || ( C0 && C1));

endmodule
//Verilog HDL for "du9160734", "KC_AOI22B_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI22B_X1 (A0N,A1,B0,B1,Y);
input A0N,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( ((~A0N) && A1) || (B0 && B1) );

endmodule
//Verilog HDL for "du9160734", "KC_AOI22_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI22_X1 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 && A1) || (B0 && B1) );

endmodule
//Verilog HDL for "du9160734", "KC_AOI22_X2" "functional"


`timescale 1ns / 100ps
module KC_AOI22_X2 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 && A1) || (B0 && B1) );

endmodule
//Verilog HDL for "du9160734", "KC_AOI22_X3" "functional"


`timescale 1ns / 100ps
module KC_AOI22_X3 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 && A1) || (B0 && B1) );

endmodule
//Verilog HDL for "du9160734", "KC_AOI22_X4" "functional"


`timescale 1ns / 100ps
module KC_AOI22_X4 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 && A1) || (B0 && B1) );

endmodule
//Verilog HDL for "du9160734", "KC_AOI22_X5" "functional"


`timescale 1ns / 100ps
module KC_AOI22_X5 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
//assign Y = ~( (A0 && A1) || (B0 && B1) );


assign Y = ~( (B0 && B1) || (B1 && A0 && A1) );

endmodule
//Verilog HDL for "du9160734", "KC_AOI31_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI31_X1 (A,B1,B2,B0,Y);
input A,B1,B2,B0;
output Y;

wire Y;
assign Y = ~((B0 && B1 && B2) || A);

endmodule
//Verilog HDL for "du9160734", "KC_AOI31_X2" "functional"


`timescale 1ns / 100ps
module KC_AOI31_X2 (A,B1,B2,B0,Y);
input A,B1,B2,B0;
output Y;

wire Y;
assign Y = ~((B0 && B1 && B2) || A);

endmodule
//Verilog HDL for "du9160734", "KC_AOI32_X1" "functional"


`timescale 1ns / 100ps
module KC_AOI32_X1 (A0,A1,A2,B0,B1,Y);
input A0,A1,A2,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 && A1 && A2) || (B0 && B1) );

endmodule
//Verilog HDL for "du9160734", "KC_AOI32_X2" "functional"


`timescale 1ns / 100ps
module KC_AOI32_X2 (A0,A1,A2,B0,B1,Y);
input A0,A1,A2,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 && A1 && A2) || (B0 && B1) );

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X1" "functional"


`timescale 1ns / 100ps
module KC_BUF_X1 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X10" "functional"


`timescale 1ns / 100ps
module KC_BUF_X10 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X11" "functional"


`timescale 1ns / 100ps
module KC_BUF_X11 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X12" "functional"


`timescale 1ns / 100ps
module KC_BUF_X12 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X13" "functional"


`timescale 1ns / 100ps
module KC_BUF_X13 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X14" "functional"


`timescale 1ns / 100ps
module KC_BUF_X14 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X15" "functional"


`timescale 1ns / 100ps
module KC_BUF_X15 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X16" "functional"


`timescale 1ns / 100ps
module KC_BUF_X16 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X2" "functional"


`timescale 1ns / 100ps
module KC_BUF_X2 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X3" "functional"


`timescale 1ns / 100ps
module KC_BUF_X3 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X4" "functional"


`timescale 1ns / 100ps
module KC_BUF_X4 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X5" "functional"


`timescale 1ns / 100ps
module KC_BUF_X5 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X6" "functional"


`timescale 1ns / 100ps
module KC_BUF_X6 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X7" "functional"


`timescale 1ns / 100ps
module KC_BUF_X7 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X8" "functional"


`timescale 1ns / 100ps
module KC_BUF_X8 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_BUF_X9" "functional"


`timescale 1ns / 100ps
module KC_BUF_X9 (A,Y);
input A;
output Y;

wire Y;
assign Y = A;

endmodule
//Verilog HDL for "du9160734", "KC_CELL_X1" "functional"

// DFFSNHQ
module KC_CELL_X1 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

reg Q_reg;

always @ (negedge C or posedge B)
 begin
    if (C == 1'b0)
     Q_reg <= 1'b1;
    else
     Q_reg <= A;
 end

wire Y;

assign #1 Y = Q_reg;


endmodule
//Verilog HDL for "du9160734", "KC_CELL_X2" "functional"

// DFFRNHQ
module KC_CELL_X2 ( Y, A, B, C );

  input C;
  output Y;
  input A;
  input B;

reg Q_reg;

always @ (negedge C or posedge B)
 begin
    if (C == 1'b0)
     Q_reg <= 1'b0;
    else
     Q_reg <= A;
 end

wire Y;

assign #1 Y = Q_reg;

endmodule
//Verilog HDL for "du9160734", "KC_DFFHQ_X1" "functional"


`timescale 1ns / 100ps
module KC_DFFHQ_X1 (D,CK, Q );
input D,CK;
output Q;

reg Q_reg;
always@(posedge CK)
	Q_reg <= D;

wire Q;
assign #1 Q = Q_reg;

endmodule
//Verilog HDL for "du9160734", "KC_DFFRNHQ_X1" "functional"


`timescale 1ns / 100ps
module KC_DFFRNHQ_X1 (D,CK ,RN, Q  );
input D,CK ,RN;
output Q ;

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
//Verilog HDL for "du9160734", "KC_DFFRNHQ_X2" "functional"


`timescale 1ns / 100ps
module KC_DFFRNHQ_X2 (D,CK ,RN, Q  );
input D,CK ,RN;
output Q ;

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
//Verilog HDL for "du9160734", "KC_DFFRNHQ_X3" "functional"


`timescale 1ns / 100ps
module KC_DFFRNHQ_X3 (D,S0,CK ,RN, Q  );
input D,S0,CK ,RN;
output Q ;

reg Q_reg;
//always@(posedge CK or negedge RN)
//begin
//   if (RN == 1'b0)
//      Q_reg <= 1'b0 ;
//  else
//      Q_reg <= D;
//end

always @ (posedge CK or negedge RN)
begin
 if (RN == 1'b0)
   Q_reg <= 1'b0;
 else if ( S0 == 1'b1)
   Q_reg <= D;
end


wire Q;
assign #1 Q = Q_reg;
 
endmodule
//Verilog HDL for "du9160734", "KC_DFFSNHQ_X1" "functional"


`timescale 1ns / 100ps
module KC_DFFSNHQ_X1  (D,CK ,SN,  Q  );
input D,CK ,SN ;
output Q ;

reg Q_reg;
always@(posedge CK  or negedge SN)
begin
   if (SN == 1'b0)
      Q_reg <= 1'b1 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;

endmodule
//Verilog HDL for "du9160734", "KC_DFFSNHQ_X2" "functional"


`timescale 1ns / 100ps
module KC_DFFSNHQ_X2  (D,CK ,SN,  Q  );
input D,CK ,SN ;
output Q ;

reg Q_reg;
always@(posedge CK  or negedge SN)
begin
   if (SN == 1'b0)
      Q_reg <= 1'b1 ;
   else
      Q_reg <= D;
end

wire Q;
assign #1 Q = Q_reg;

endmodule
//Verilog HDL for "du9160734", "KC_INV_X1" "functional"


`timescale 1ns / 100ps
module KC_INV_X1 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "du9160734", "KC_INV_X2" "functional"


`timescale 1ns / 100ps
module KC_INV_X2 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "du9160734", "KC_INV_X3" "functional"


`timescale 1ns / 100ps
module KC_INV_X3 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "du9160734", "KC_INV_X4" "functional"


`timescale 1ns / 100ps
module KC_INV_X4 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "du9160734", "KC_INV_X6" "functional"


`timescale 1ns / 100ps
module KC_INV_X6 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "du9160734", "KC_INV_X7" "functional"


`timescale 1ns / 100ps
module KC_INV_X7 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "du9160734", "KC_INV_X8" "functional"


`timescale 1ns / 100ps
module KC_INV_X8 (A,Y);
input A;
output Y;

wire Y;
assign Y = ~A;

endmodule
//Verilog HDL for "du9160734", "KC_MX2_X1" "functional"


`timescale 1ns / 100ps
module KC_MX2_X1 (A,B,S0,Y);
input A, B,S0 ;
output Y ;

wire Y;
assign   Y = S0 ? B : A;

endmodule
//Verilog HDL for "du9160734", "KC_MX2_X2" "functional"


`timescale 1ns / 100ps
module KC_MX2_X2 (A,B,S0,Y);
input A, B,S0 ;
output Y ;

wire Y;
assign   Y = S0 ? B : A;

endmodule
//Verilog HDL for "du9160734", "KC_MX2_X3" "functional"


`timescale 1ns / 100ps
module KC_MX2_X3 (A,B,S0,Y);
input A, B,S0 ;
output Y ;

wire Y;
//assign   Y = S0 ? B : A;


assign Y = (S0 ^ A) ? (~B) : B;

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X1" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X1 (A,BN,S0,Y);
input A, BN,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? ~BN : A);

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X10" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X10 (AN,B,S0,Y);
input AN, B,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? B : ~(AN));

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X2" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X2 (A,B,S0,Y);
input A, B,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? B : A);

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X3" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X3 (A,B,S0,Y);
input A, B,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? B : A);

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X4" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X4 (A,B,S0,Y);
input A, B,S0 ;
output Y ;

wire Y;
//assign   Y = ~ (S0 ? B : A);

assign Y = ~(B ? ~S0 : ((S0 ^ A) ? 1'bx : A ));

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X5" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X5 (A,B,S0,Y);
input A, B,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? B : A);

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X6" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X6 (AN,B,S0,Y);
input AN, B,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? B : ~AN);

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X7" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X7 ( Y, A, S0, BN );

  input S0;
  output Y;
  input A;
  input BN;

wire Y;
assign   Y = ~ (S0 ? ~BN : ((BN&A) ? 1'bx : A));

endmodule


//Verilog HDL for "du9160734", "KC_MXI2_X8" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X8 (A,BN,S0,Y);
input A, BN,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? ~(BN) : ((~BN & ~A) ? 1'bx : A));

endmodule
//Verilog HDL for "du9160734", "KC_MXI2_X9" "functional"


`timescale 1ns / 100ps
module KC_MXI2_X9 (A,BN,S0,Y);
input A, BN,S0 ;
output Y ;

wire Y;
assign   Y = ~ (S0 ? ((BN & A) ?  1'bx : A)   :  ~(BN));


//assign  Y = ~(~(BN) && (A || ~(S0)));

endmodule
//Verilog HDL for "du9160734", "KC_NAND2B_X1" "functional"


`timescale 1ns / 100ps
module KC_NAND2B_X1 (AN,B, Y);
input AN,B;
output Y;

wire Y;
assign Y = ~ ((~AN) && B );

endmodule
//Verilog HDL for "du9160734", "KC_NAND2_X1" "functional"


`timescale 1ns / 100ps
module KC_NAND2_X1 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A && B );

endmodule
//Verilog HDL for "du9160734", "KC_NAND2_X2" "functional"


`timescale 1ns / 100ps
module KC_NAND2_X2 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A && B );

endmodule
//Verilog HDL for "du9160734", "KC_NAND2_X3" "functional"


`timescale 1ns / 100ps
module KC_NAND2_X3 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A && B );

endmodule
//Verilog HDL for "du9160734", "KC_NAND2_X4" "functional"


`timescale 1ns / 100ps
module KC_NAND2_X4 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A && B );

endmodule
//Verilog HDL for "du9160734", "KC_NAND2_X5" "functional"


`timescale 1ns / 100ps
module KC_NAND2_X5 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A && B );

endmodule
//Verilog HDL for "du9160734", "KC_NAND2_X6" "functional"


`timescale 1ns / 100ps
module KC_NAND2_X6 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A && B );

endmodule
//Verilog HDL for "du9160734", "KC_NAND3B_X1" "functional"


`timescale 1ns / 100ps
module KC_NAND3B_X1 (CN,B,A, Y);
input CN,B,A;
output Y;

wire Y;
assign Y = ~ ((~CN) && B && A);

endmodule
//Verilog HDL for "du9160734", "KC_NAND3_X1" "functional"


`timescale 1ns / 100ps
module KC_NAND3_X1 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "du9160734", "KC_NAND3_X2" "functional"


`timescale 1ns / 100ps
module KC_NAND3_X2 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "du9160734", "KC_NAND3_X3" "functional"


`timescale 1ns / 100ps
module KC_NAND3_X3 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = ~(A && B && C);

endmodule
//Verilog HDL for "du9160734", "KC_NAND4B_X1" "functional"


`timescale 1ns / 100ps
module KC_NAND4B_X1 (DN,B, C,A,Y);
input DN,B,C,A;
output Y;

wire Y;
assign Y = ~((~DN) && C && B && A);

endmodule
//Verilog HDL for "du9160734", "KC_NAND4_X1" "functional"


`timescale 1ns / 100ps
module KC_NAND4_X1 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = ~(A && B && C && D);

endmodule
//Verilog HDL for "du9160734", "KC_NAND4_X3" "functional"


`timescale 1ns / 100ps
module KC_NAND4_X3 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = ~(A && B && C && D);

endmodule
//Verilog HDL for "du9160734", "KC_NAND4_X4" "functional"


`timescale 1ns / 100ps
module KC_NAND4_X4 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = ~(A && B && C && D);

endmodule
//Verilog HDL for "du9160734", "KC_NOR2B_X1" "functional"


`timescale 1ns / 100ps
module KC_NOR2B_X1 (AN,B, Y);
input AN,B;
output Y;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR2B_X2" "functional"


`timescale 1ns / 100ps
module KC_NOR2B_X2 (AN,B, Y);
input AN,B;
output Y;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR2B_X4" "functional"


`timescale 1ns / 100ps
module KC_NOR2B_X4 (AN,B, Y);
input AN,B;
output Y;

wire Y;
assign Y = ~ ((~AN) || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR2_X1" "functional"


`timescale 1ns / 100ps
module KC_NOR2_X1 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR2_X2" "functional"


`timescale 1ns / 100ps
module KC_NOR2_X2 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR2_X3" "functional"


`timescale 1ns / 100ps
module KC_NOR2_X3 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR2_X4" "functional"


`timescale 1ns / 100ps
module KC_NOR2_X4 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR2_X5" "functional"


`timescale 1ns / 100ps
module KC_NOR2_X5 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = ~ (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_NOR3B_X1" "functional"


`timescale 1ns / 100ps
module KC_NOR3B_X1 (CN,B, A,Y);
input CN,B,A;
output Y;

wire Y;
assign Y = ~((~CN) || B || A);

endmodule
//Verilog HDL for "du9160734", "KC_NOR3B_X2" "functional"


`timescale 1ns / 100ps
module KC_NOR3B_X2 (CN,B, A,Y);
input CN,B,A;
output Y;

wire Y;
assign Y = ~((~CN) || B || A);

endmodule
//Verilog HDL for "du9160734", "KC_NOR3_X1" "functional"


`timescale 1ns / 100ps
module KC_NOR3_X1 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = ~(A || B || C);

endmodule
//Verilog HDL for "du9160734", "KC_NOR3_X2" "functional"


`timescale 1ns / 100ps
module KC_NOR3_X2 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = ~(A || B || C);

endmodule
//Verilog HDL for "du9160734", "KC_NOR3_X3" "functional"


`timescale 1ns / 100ps
module KC_NOR3_X3 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = ~(A || B || C);

endmodule
//Verilog HDL for "du9160734", "KC_NOR4_X1" "functional"


`timescale 1ns / 100ps
module KC_NOR4_X1 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = ~(A || B || C || D);

endmodule
//Verilog HDL for "du9160734", "KC_OA21_X1" "functional"


`timescale 1ns / 100ps
module KC_OA21_X1 (A0,A1,B,Y);
input A0,A1,B;
output Y;

wire Y;
assign Y = (A0 || A1) && B;

endmodule
//Verilog HDL for "du9160734", "KC_OA22_X1" "functional"


`timescale 1ns / 100ps
module KC_OA22_X1 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = (A0 || A1) && (B0 || B1);

endmodule
//Verilog HDL for "du9160734", "KC_OAI211B_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI211B_X1 (A,B,C0,C1N,Y);
input A,B,C0, C1N;
output Y;

wire Y;
//assign Y = ~((C0 || C1N) && B && A);

assign Y = ~((C0 || ~C1N) && B && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI211B_X2" "functional"


`timescale 1ns / 100ps
module KC_OAI211B_X2 (A,B,C0N,C1,Y);
input A,B,C0N, C1;
output Y;

wire Y;
assign Y = ~((~(C0N) || C1) && B && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI211_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI211_X1 (A,B,C0,C1,Y);
input A,B,C0, C1;
output Y;

wire Y;
assign Y = ~((C0 || C1) && B && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI211_X2" "functional"


`timescale 1ns / 100ps
module KC_OAI211_X2 (A,B,C0,C1,Y);
input A,B,C0, C1;
output Y;

wire Y;
assign Y = ~((C0 || C1) && B && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI211_X3" "functional"


`timescale 1ns / 100ps
module KC_OAI211_X3 (A,B,C0,C1,Y);
input A,B,C0, C1;
output Y;

wire Y;
assign Y = ~((C0 || C1) && B && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI21BB_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI21BB_X1 (A,B,C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = ~(~(A && B) && C);

endmodule
//Verilog HDL for "du9160734", "KC_OAI21BB_X2" "functional"


`timescale 1ns / 100ps
module KC_OAI21BB_X2 (A1N,A0,BN,Y);
input A0,A1N,BN;
output Y;

wire Y;
//assign Y = ~(((~A1N) || A0) && BN);


assign Y = ~(((~A1N) || A0) && ~BN);

endmodule
//Verilog HDL for "du9160734", "KC_OAI21B_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI21B_X1 (A0N,A1,B,Y);
input A0N,A1,B;
output Y;

wire Y;
assign Y = ~(((~A0N) || A1) && B);

endmodule
//Verilog HDL for "du9160734", "KC_OAI21B_X2" "functional"


`timescale 1ns / 100ps
module KC_OAI21B_X2 (A0,A1,BN,Y);
input A0,A1,BN;
output Y;

wire Y;
assign Y = ~((A0 || A1) && (~BN));

endmodule
//Verilog HDL for "du9160734", "KC_OAI21_X2" "functional"


`timescale 1ns / 100ps
module KC_OAI21_X2 (B0,B1,A,Y);
input B0,B1,A;
output Y;

wire Y;
assign Y = ~((B0 || B1) && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI21_X3" "functional"


`timescale 1ns / 100ps
module KC_OAI21_X3 (A0,A1,B,Y);
input A0,A1,B;
output Y;

wire Y;
assign Y = ~((A0 || A1) && B);

endmodule
//Verilog HDL for "du9160734", "KC_OAI21_X4" "functional"


`timescale 1ns / 100ps
module KC_OAI21_X4 (A0,A1,B,Y);
input A0,A1,B;
output Y;

wire Y;
assign Y = ~((A0 || A1) && B);

endmodule
//Verilog HDL for "du9160734", "KC_OAI22BB_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI22BB_X1 (A,B,C,D,Y);
input A,B,C,D;
output Y;

wire Y;
//assign Y = ~(~(C && D) && (A || B));


assign Y = ~(~(A && B) && (C || D));

endmodule
//Verilog HDL for "du9160734", "KC_OAI22B_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI22B_X1 (A0,A1,B0,B1N,Y);
input A0,A1,B0,B1N;
output Y;

wire Y;
assign Y = ~( (A0 || A1) && (B0 || (~B1N)) );

endmodule
//Verilog HDL for "du9160734", "KC_OAI22_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI22_X1 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 || A1) && (B0 || B1) );

endmodule
//Verilog HDL for "du9160734", "KC_OAI22_X2" "functional"


`timescale 1ns / 100ps
module KC_OAI22_X2 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 || A1) && (B0 || B1) );

endmodule
//Verilog HDL for "du9160734", "KC_OAI22_X3" "functional"


`timescale 1ns / 100ps
module KC_OAI22_X3 (A0,A1,B0,B1,Y);
input A0,A1,B0,B1;
output Y;

wire Y;
assign Y = ~( (A0 || A1) && (B0 || B1) );

endmodule
//Verilog HDL for "du9160734", "KC_OAI31_X1" "functional"


`timescale 1ns / 100ps
module KC_OAI31_X1 (B0,B1,B2,A,Y);
input B0,B1,B2,A;
output Y;

wire Y;
assign Y = ~((B0 || B1 || B2) && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI31_X2" "functional"


`timescale 1ns / 100ps
module KC_OAI31_X2 (B0,B1,B2,A,Y);
input B0,B1,B2,A;
output Y;

wire Y;
assign Y = ~((B0 || B1 || B2) && A);

endmodule
//Verilog HDL for "du9160734", "KC_OAI31_X3" "functional"


`timescale 1ns / 100ps
module KC_OAI31_X3 (A0,A1,A2,B,Y);
input A0,A1,A2,B;
output Y;

wire Y;
assign Y = ~((A0 || A1 || A2) && B);

endmodule
//Verilog HDL for "du9160734", "KC_OR2_X1" "functional"


`timescale 1ns / 100ps
module KC_OR2_X1 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_OR2_X2" "functional"


`timescale 1ns / 100ps
module KC_OR2_X2 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_OR2_X3" "functional"


`timescale 1ns / 100ps
module KC_OR2_X3 (A,B, Y);
input A,B;
output Y;

wire Y;
assign Y = (A || B );

endmodule
//Verilog HDL for "du9160734", "KC_OR3_X1" "functional"


`timescale 1ns / 100ps
module KC_OR3_X1 (A,B, C,Y);
input A,B,C;
output Y;

wire Y;
assign Y = (A || B || C);

endmodule
//Verilog HDL for "du9160734", "KC_OR4_X1" "functional"


`timescale 1ns / 100ps
module KC_OR4_X1 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = (A || B || C || D);

endmodule
//Verilog HDL for "du9160734", "KC_OR4_X2" "functional"


`timescale 1ns / 100ps
module KC_OR4_X2 (A,B, C,D,Y);
input A,B,C,D;
output Y;

wire Y;
assign Y = (A || B || C || D);

endmodule
//Verilog HDL for "du9160734", "KC_SDFFRNHQ_X1" "functional"


`timescale 1ns / 100ps
module KC_SDFFRNHQ_X1 (SI, SE, D,CK ,RN, Q  );
input SI,SE;
input D,CK ,RN;
output Q ;

reg Q_reg;
always@(posedge CK or negedge RN)
begin
   if (RN == 1'b0)
      Q_reg <= 1'b0 ;
   else
//      Q_reg <= SE ? SI : D;
        Q_reg <= SE ? D  : SI;

end

wire Q;
assign #1 Q = Q_reg;

endmodule 
//Verilog HDL for "du9160734", "KC_TIEHI_X1" "functional"


`timescale 1ns / 100ps
module KC_TIEHI_X1 (   Y);
output Y;

wire Y;
assign Y = 1'B1;

endmodule
//Verilog HDL for "du9160734", "KC_TIELO_X1" "functional"


`timescale 1ns / 100ps
module KC_TIELO_X1 (   Y);
output Y;

wire Y;
assign Y = 1'B0;

endmodule
//Verilog HDL for "du9160734", "KC_TINV_X1" "functional"


`timescale 1ns / 100ps

module KC_TINV_X1 ( Y, A, OE );

  output Y;
  input OE;
  input A;

wire Y;
//assign Y = OE ? (~A) : 1'Bz;

assign Y = OE ? (~A) : A;

endmodule
//Verilog HDL for "du9160734", "KC_TINV_X2" "functional"


`timescale 1ns / 100ps

module KC_TINV_X2 ( Y, A, OE );

  output Y;
  input OE;
  input A;

wire Y;
//assign Y = OE ? (~A) : 1'Bz;

assign Y = OE ? (~A) : A;

endmodule
//Verilog HDL for "du9160734", "KC_TINV_X3" "functional"


`timescale 1ns / 100ps

module KC_TINV_X3 ( Y, A, OE );

  output Y;
  input OE;
  input A;

wire Y;
//assign Y = OE ? (~A) : 1'Bz;

assign Y = OE ? (A) : ~A;

endmodule
//Verilog HDL for "du9160734", "KC_TINV_X4" "functional"


`timescale 1ns / 100ps

module KC_TINV_X4 ( Y, A, OE );

  output Y;
  input OE;
  input A;

wire Y;
//assign Y = OE ? (~A) : 1'Bz;

assign Y = OE ? (A) : ~A;

endmodule

`timescale 1ns / 100ps
module KC_TINV_X5 ( Y, A, OE );

  input OE;
  output Y;
  input A;

wire Y;
assign   Y = ~A;

//OE  A  Y
//// 0  0  1
//// 0  1  0
//// 1  0  1
//// 1  1  0
endmodule


`timescale 1ns / 100ps
module KC_TINV_X6 ( Y, A, OE );

  input OE;
  output Y;
  input A;

wire Y;
assign   Y = OE;

//OE  A  Y
//// 0  0  0
//// 0  1  0
//// 1  0  1
//// 1  1  1
endmodule




//Verilog HDL for "du9160734", "KC_TLATHQN_X1" "functional"
//
//
`timescale 1ns / 100ps
module KC_TLATHQN_X1 ( QN, D1,D2, GN );

  input GN;
    input D1;
      input D2;
        output QN;

        reg Q_reg;

//        always @ (GN or D1 or D2)
//          begin
//               if (GN ==1'b0)
//                  Q_reg <= D1 || D2;
//          end
always @ (posedge GN )
Q_reg <= D1 || D2;
                    wire QN;
                    assign #1 QN = GN & Q_reg;

                    // GN = 0, QN = 0
                    // GN = 0-->1, QN = (D1 | D2)

endmodule




//Verilog HDL for "du9160734", "KC_TLATHQN_X1" "functional"
//
//
`timescale 1ns / 100ps
module KC_TLATHQ_X3 ( Q, D, GN );

  input GN;
    input D;
        output Q;

        reg Q_reg;

//        always @ ( GN or D )
//          begin
//               if(GN ==1'b0)
//                  Q_reg <= D;
//                    end
always @ (posedge GN )
Q_reg <= D ;


wire Q;
assign #1 Q = GN & Q_reg;

                    // GN = 0, QN = 0
                    // GN = 0-->1, QN = (D1 | D2)

endmodule




//Verilog HDL for "du9160734", "KC_XNOR2_X1" "functional"


`timescale 1ns / 100ps
module KC_XNOR2_X1 (A,B,Y);
input A,B  ;
output Y;

wire Y;
assign Y = ~(A ^ B );

endmodule
//Verilog HDL for "du9160734", "KC_XNOR2_X2" "functional"


`timescale 1ns / 100ps
module KC_XNOR2_X2 (A,B,Y);
input A,B  ;
output Y;

wire Y;
assign Y = ~(A ^ B );

endmodule
//Verilog HDL for "du9160734", "KC_XOR2_X1" "functional"


`timescale 1ns / 100ps
module KC_XOR2_X1 (A,B,   Y);
input A,B  ;
output Y;

wire Y;
assign Y = (A ^ B );

endmodule
//Verilog HDL for "du9160734", "KC_XOR2_X2" "functional"


`timescale 1ns / 100ps
module KC_XOR2_X2 (A,B,   Y);
input A,B  ;
output Y;

wire Y;
assign Y = (A ^ B );

endmodule
//Verilog HDL for "du9160734", "KC_XOR2_X3" "functional"


`timescale 1ns / 100ps
module KC_XOR2_X3 (A,B,   Y);
input A,B  ;
output Y;

wire Y;
assign Y = (A ^ B );

endmodule
//Verilog HDL for "du9160734", "KC_XOR2_X4" "functional"


`timescale 1ns / 100ps
module KC_XOR2_X4 (A,B,   Y);
input A,B  ;
output Y;

wire Y;
assign Y = (A ^ B );

endmodule
//Verilog HDL for "du9160734", "KC_XOR2_X5" "functional"


`timescale 1ns / 100ps
module KC_XOR2_X5 (A,B,   Y);
input A,B  ;
output Y;

wire Y;
assign Y = B ? (A ? 1'bx : 1'b1 ) :  A ;

endmodule
