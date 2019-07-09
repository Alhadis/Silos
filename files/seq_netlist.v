
module Add_half_0 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_511 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_0 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_0 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_511 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_510 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_509 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_255 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_510 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_509 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_508 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_507 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_254 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_508 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_507 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_506 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_505 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_253 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_506 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_505 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_0 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n4, n1, n2;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n4), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n4), .Z(c_out2) );
  Add_full_0 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_255 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_254 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_253 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n4) );
  CIVX2 U4 ( .A(n4), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_504 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_503 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_252 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_504 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_503 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_502 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_501 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_251 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_502 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_501 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_500 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_499 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_250 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_500 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_499 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_498 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_497 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_249 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_498 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_497 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_63 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_252 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_251 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_250 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_249 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_496 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_495 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_248 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_496 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_495 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_494 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_493 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_247 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_494 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_493 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_492 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_491 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_246 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_492 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_491 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_490 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_489 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_245 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_490 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_489 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_62 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_248 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_247 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_246 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_245 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_488 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_487 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_244 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_488 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_487 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_486 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_485 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_243 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_486 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_485 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_484 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_483 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_242 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_484 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_483 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_482 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_481 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_241 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_482 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_481 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_61 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_244 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_243 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_242 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_241 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_0 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n4, n1, n2;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n4), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n4), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n4), .Z(c_out4) );
  bit2_0 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_63 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_62 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_61 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n4) );
  CIVX2 U4 ( .A(n4), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_480 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_479 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_240 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_480 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_479 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_478 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_477 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_239 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_478 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_477 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_476 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_475 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_238 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_476 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_475 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_474 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_473 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_237 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_474 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_473 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_60 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_240 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_239 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_238 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_237 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_472 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_471 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_236 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_472 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_471 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_470 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_469 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_235 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_470 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_469 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_468 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_467 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_234 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_468 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_467 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_466 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_465 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_233 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_466 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_465 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_59 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_236 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_235 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_234 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_233 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_464 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_463 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_232 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_464 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_463 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_462 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_461 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_231 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_462 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_461 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_460 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_459 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_230 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_460 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_459 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_458 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_457 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_229 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_458 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_457 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_58 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_232 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_231 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_230 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_229 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_456 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_455 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_228 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_456 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_455 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_454 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_453 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_227 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_454 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_453 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_452 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_451 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_226 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_452 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_451 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_450 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_449 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_225 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_450 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_449 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_57 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_228 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_227 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_226 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_225 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_15 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_60 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_59 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_58 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_57 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_448 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_447 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_224 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_448 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_447 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_446 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_445 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_223 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_446 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_445 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_444 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_443 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_222 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_444 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_443 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_442 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_441 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_221 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_442 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_441 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_56 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_224 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_223 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_222 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_221 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_440 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_439 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_220 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_440 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_439 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_438 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_437 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_219 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_438 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_437 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_436 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_435 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_218 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_436 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_435 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_434 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_433 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_217 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_434 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_433 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_55 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_220 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_219 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_218 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_217 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_432 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_431 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_216 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_432 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_431 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_430 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_429 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_215 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_430 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_429 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_428 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_427 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_214 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_428 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_427 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_426 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_425 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_213 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_426 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_425 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_54 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_216 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_215 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_214 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_213 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_424 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_423 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_212 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_424 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_423 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_422 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_421 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_211 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_422 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_421 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_420 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_419 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_210 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_420 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_419 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_418 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_417 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_209 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_418 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_417 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_53 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_212 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_211 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_210 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_209 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_14 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_56 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_55 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_54 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_53 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_416 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_415 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_208 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_416 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_415 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_414 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_413 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_207 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_414 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_413 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_412 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_411 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_206 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_412 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_411 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_410 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_409 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_205 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_410 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_409 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_52 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_208 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_207 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_206 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_205 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_408 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_407 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_204 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_408 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_407 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_406 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_405 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_203 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_406 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_405 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_404 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_403 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_202 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_404 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_403 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_402 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_401 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_201 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_402 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_401 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_51 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_204 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_203 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_202 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_201 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_400 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_399 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_200 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_400 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_399 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_398 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_397 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_199 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_398 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_397 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_396 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_395 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_198 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_396 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_395 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_394 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_393 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_197 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_394 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_393 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_50 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_200 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_199 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_198 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_197 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_392 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_391 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_196 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_392 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_391 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_390 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_389 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_195 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_390 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_389 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_388 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_387 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_194 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_388 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_387 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_386 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_385 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_193 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_386 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_385 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_49 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_196 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_195 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_194 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_193 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_13 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_52 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_51 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_50 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_49 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module bit8_0 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n4, n1, n2;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  CAOR2X1 U6 ( .A(s84[3]), .B(n1), .C(s83[3]), .D(n4), .Z(sum8[7]) );
  CAOR2X1 U7 ( .A(s84[2]), .B(n1), .C(s83[2]), .D(n4), .Z(sum8[6]) );
  CAOR2X1 U8 ( .A(s84[1]), .B(n1), .C(s83[1]), .D(n4), .Z(sum8[5]) );
  CAOR2X1 U9 ( .A(s84[0]), .B(n1), .C(s83[0]), .D(n4), .Z(sum8[4]) );
  CAOR2X1 U10 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n2), .Z(sum8[3]) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n2), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n2), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n2), .Z(sum8[0]) );
  CAOR2X1 U14 ( .A(c_out811), .B(n1), .C(c_out810), .D(n4), .Z(c_out8) );
  bit4_0 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_15 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_14 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_13 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CANR2X1 U3 ( .A(c_out801), .B(c_in8), .C(c_out800), .D(n2), .Z(n4) );
  CIVX2 U4 ( .A(n4), .Z(n1) );
  CIVX2 U5 ( .A(c_in8), .Z(n2) );
endmodule


module Add_half_384 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_383 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_192 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_384 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_383 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_382 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_381 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_191 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_382 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_381 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_380 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_379 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_190 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_380 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_379 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_378 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_377 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_189 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_378 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_377 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_48 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_192 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_191 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_190 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_189 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_376 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_375 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_188 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_376 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_375 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_374 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_373 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_187 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_374 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_373 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_372 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_371 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_186 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_372 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_371 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_370 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_369 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_185 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_370 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_369 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_47 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_188 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_187 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_186 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_185 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_368 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_367 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_184 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_368 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_367 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_366 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_365 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_183 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_366 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_365 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_364 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_363 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_182 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_364 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_363 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_362 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_361 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_181 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_362 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_361 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_46 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_184 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_183 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_182 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_181 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_360 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_359 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_180 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_360 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_359 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_358 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_357 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_179 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_358 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_357 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_356 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_355 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_178 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_356 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_355 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_354 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_353 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_177 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_354 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_353 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_45 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_180 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_179 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_178 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_177 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_12 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_48 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_47 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_46 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_45 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_352 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_351 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_176 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_352 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_351 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_350 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_349 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_175 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_350 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_349 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_348 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_347 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_174 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_348 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_347 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_346 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_345 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_173 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_346 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_345 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_44 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_176 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_175 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_174 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_173 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_344 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_343 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_172 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_344 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_343 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_342 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_341 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_171 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_342 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_341 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_340 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_339 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_170 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_340 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_339 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_338 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_337 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_169 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_338 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_337 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_43 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_172 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_171 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_170 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_169 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_336 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_335 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_168 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_336 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_335 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_334 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_333 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_167 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_334 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_333 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_332 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_331 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_166 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_332 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_331 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_330 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_329 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_165 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_330 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_329 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_42 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_168 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_167 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_166 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_165 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_328 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_327 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_164 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_328 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_327 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_326 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_325 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_163 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_326 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_325 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_324 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_323 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_162 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_324 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_323 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_322 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_321 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_161 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_322 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_321 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_41 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_164 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_163 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_162 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_161 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_11 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_44 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_43 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_42 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_41 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_320 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_319 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_160 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_320 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_319 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_318 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_317 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_159 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_318 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_317 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_316 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_315 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_158 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_316 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_315 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_314 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_313 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_157 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_314 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_313 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_40 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_160 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_159 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_158 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_157 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_312 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_311 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_156 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_312 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_311 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_310 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_309 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_155 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_310 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_309 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_308 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_307 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_154 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_308 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_307 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_306 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_305 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_153 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_306 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_305 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_39 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_156 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_155 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_154 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_153 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_304 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_303 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_152 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_304 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_303 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_302 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_301 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_151 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_302 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_301 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_300 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_299 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_150 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_300 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_299 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_298 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_297 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_149 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_298 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_297 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_38 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_152 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_151 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_150 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_149 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_296 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_295 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_148 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_296 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_295 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_294 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_293 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_147 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_294 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_293 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_292 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_291 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_146 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_292 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_291 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_290 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_289 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_145 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_290 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_289 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_37 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_148 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_147 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_146 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_145 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_10 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_40 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_39 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_38 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_37 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_288 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_287 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_144 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_288 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_287 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_286 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_285 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_143 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_286 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_285 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_284 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_283 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_142 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_284 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_283 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_282 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_281 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_141 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_282 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_281 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_36 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_144 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_143 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_142 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_141 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_280 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_279 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_140 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_280 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_279 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_278 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_277 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_139 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_278 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_277 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_276 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_275 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_138 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_276 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_275 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_274 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_273 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_137 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_274 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_273 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_35 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_140 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_139 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_138 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_137 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_272 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_271 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_136 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_272 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_271 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_270 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_269 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_135 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_270 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_269 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_268 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_267 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_134 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_268 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_267 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_266 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_265 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_133 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_266 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_265 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_34 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_136 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_135 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_134 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_133 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_264 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_263 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_132 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_264 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_263 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_262 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_261 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_131 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_262 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_261 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_260 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_259 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_130 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_260 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_259 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_258 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_257 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_129 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_258 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_257 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_33 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_132 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_131 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_130 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_129 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_9 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_36 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_35 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_34 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_33 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module bit8_3 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  CAOR2X1 U6 ( .A(s84[3]), .B(n1), .C(s83[3]), .D(n3), .Z(sum8[7]) );
  CAOR2X1 U7 ( .A(s84[2]), .B(n1), .C(s83[2]), .D(n3), .Z(sum8[6]) );
  CAOR2X1 U8 ( .A(s84[1]), .B(n1), .C(s83[1]), .D(n3), .Z(sum8[5]) );
  CAOR2X1 U9 ( .A(s84[0]), .B(n1), .C(s83[0]), .D(n3), .Z(sum8[4]) );
  CAOR2X1 U10 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n2), .Z(sum8[3]) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n2), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n2), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n2), .Z(sum8[0]) );
  CAOR2X1 U14 ( .A(c_out811), .B(n1), .C(c_out810), .D(n3), .Z(c_out8) );
  bit4_12 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_11 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_10 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_9 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CANR2X1 U3 ( .A(c_out801), .B(c_in8), .C(c_out800), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in8), .Z(n2) );
endmodule


module Add_half_256 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_255 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_128 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_256 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_255 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_254 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_253 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_127 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_254 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_253 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_252 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_251 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_126 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_252 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_251 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_250 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_249 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_125 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_250 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_249 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_32 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_128 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_127 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_126 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_125 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_248 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_247 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_124 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_248 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_247 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_246 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_245 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_123 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_246 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_245 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_244 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_243 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_122 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_244 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_243 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_242 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_241 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_121 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_242 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_241 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_31 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_124 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_123 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_122 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_121 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_240 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_239 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_120 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_240 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_239 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_238 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_237 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_119 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_238 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_237 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_236 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_235 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_118 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_236 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_235 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_234 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_233 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_117 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_234 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_233 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_30 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_120 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_119 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_118 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_117 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_232 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_231 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_116 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_232 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_231 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_230 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_229 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_115 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_230 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_229 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_228 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_227 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_114 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_228 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_227 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_226 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_225 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_113 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_226 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_225 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_29 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_116 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_115 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_114 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_113 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_8 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_32 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_31 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_30 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_29 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_224 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_223 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_112 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_224 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_223 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_222 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_221 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_111 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_222 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_221 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_220 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_219 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_110 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_220 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_219 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_218 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_217 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_109 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_218 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_217 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_28 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_112 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_111 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_110 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_109 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_216 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_215 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_108 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_216 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_215 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_214 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_213 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_107 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_214 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_213 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_212 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_211 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_106 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_212 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_211 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_210 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_209 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_105 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_210 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_209 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_27 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_108 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_107 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_106 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_105 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_208 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_207 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_104 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_208 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_207 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_206 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_205 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_103 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_206 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_205 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_204 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_203 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_102 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_204 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_203 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_202 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_201 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_101 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_202 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_201 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_26 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_104 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_103 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_102 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_101 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_200 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_199 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_100 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_200 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_199 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_198 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_197 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_99 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_198 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_197 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_196 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_195 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_98 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_196 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_195 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_194 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_193 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_97 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_194 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_193 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_25 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_100 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_99 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_98 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_97 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_7 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_28 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_27 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_26 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_25 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_192 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_191 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_96 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_192 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_191 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_190 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_189 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_95 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_190 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_189 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_188 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_187 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_94 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_188 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_187 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_186 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_185 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_93 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_186 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_185 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_24 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_96 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_95 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_94 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_93 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_184 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_183 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_92 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_184 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_183 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_182 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_181 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_91 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_182 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_181 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_180 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_179 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_90 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_180 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_179 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_178 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_177 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_89 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_178 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_177 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_23 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_92 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_91 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_90 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_89 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_176 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_175 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_88 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_176 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_175 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_174 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_173 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_87 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_174 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_173 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_172 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_171 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_86 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_172 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_171 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_170 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_169 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_85 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_170 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_169 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_22 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_88 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_87 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_86 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_85 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_168 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_167 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_84 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_168 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_167 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_166 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_165 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_83 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_166 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_165 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_164 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_163 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_82 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_164 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_163 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_162 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_161 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_81 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_162 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_161 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_21 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_84 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_83 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_82 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_81 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_6 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_24 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_23 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_22 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_21 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_160 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_159 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_80 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_160 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_159 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_158 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_157 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_79 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_158 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_157 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_156 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_155 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_78 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_156 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_155 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_154 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_153 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_77 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_154 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_153 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_20 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_80 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_79 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_78 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_77 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_152 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_151 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_76 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_152 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_151 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_150 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_149 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_75 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_150 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_149 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_148 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_147 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_74 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_148 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_147 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_146 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_145 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_73 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_146 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_145 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_19 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_76 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_75 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_74 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_73 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_144 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_143 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_72 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_144 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_143 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_142 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_141 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_71 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_142 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_141 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_140 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_139 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_70 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_140 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_139 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_138 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_137 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_69 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_138 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_137 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_18 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_72 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_71 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_70 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_69 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_136 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_135 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_68 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_136 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_135 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_134 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_133 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_67 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_134 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_133 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_132 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_131 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_66 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_132 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_131 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_130 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_129 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_65 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_130 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_129 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_17 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_68 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_67 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_66 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_65 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_5 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_20 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_19 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_18 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_17 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module bit8_2 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  CAOR2X1 U6 ( .A(s84[3]), .B(n1), .C(s83[3]), .D(n3), .Z(sum8[7]) );
  CAOR2X1 U7 ( .A(s84[2]), .B(n1), .C(s83[2]), .D(n3), .Z(sum8[6]) );
  CAOR2X1 U8 ( .A(s84[1]), .B(n1), .C(s83[1]), .D(n3), .Z(sum8[5]) );
  CAOR2X1 U9 ( .A(s84[0]), .B(n1), .C(s83[0]), .D(n3), .Z(sum8[4]) );
  CAOR2X1 U10 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n2), .Z(sum8[3]) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n2), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n2), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n2), .Z(sum8[0]) );
  CAOR2X1 U14 ( .A(c_out811), .B(n1), .C(c_out810), .D(n3), .Z(c_out8) );
  bit4_8 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_7 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_6 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_5 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CANR2X1 U3 ( .A(c_out801), .B(c_in8), .C(c_out800), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in8), .Z(n2) );
endmodule


module Add_half_128 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_127 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_64 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_128 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_127 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_126 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_125 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_63 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_126 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_125 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_124 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_123 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_62 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_124 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_123 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_122 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_121 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_61 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_122 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_121 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_16 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_64 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_63 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_62 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_61 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_120 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_119 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_60 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_120 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_119 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_118 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_117 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_59 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_118 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_117 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_116 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_115 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_58 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_116 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_115 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_114 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_113 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_57 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_114 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_113 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_15 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_60 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_59 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_58 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_57 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_112 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_111 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_56 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_112 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_111 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_110 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_109 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_55 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_110 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_109 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_108 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_107 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_54 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_108 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_107 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_106 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_105 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_53 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_106 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_105 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_14 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_56 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_55 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_54 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_53 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_104 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_103 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_52 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_104 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_103 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_102 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_101 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_51 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_102 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_101 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_100 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_99 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_50 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_100 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_99 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_98 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_97 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_49 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_98 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_97 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_13 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_52 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_51 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_50 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_49 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_4 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_16 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_15 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_14 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_13 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_96 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_95 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_48 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_96 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_95 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_94 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_93 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_47 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_94 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_93 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_92 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_91 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_46 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_92 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_91 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_90 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_89 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_45 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_90 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_89 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_12 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_48 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_47 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_46 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_45 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_88 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_87 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_44 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_88 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_87 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_86 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_85 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_43 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_86 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_85 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_84 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_83 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_42 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_84 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_83 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_82 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_81 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_41 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_82 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_81 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_11 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_44 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_43 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_42 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_41 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_80 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_79 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_40 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_80 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_79 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_78 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_77 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_39 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_78 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_77 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_76 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_75 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_38 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_76 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_75 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_74 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_73 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_37 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_74 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_73 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_10 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_40 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_39 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_38 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_37 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_72 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_71 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_36 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_72 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_71 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_70 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_69 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_35 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_70 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_69 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_68 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_67 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_34 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_68 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_67 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_66 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_65 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_33 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_66 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_65 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_9 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_36 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_35 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_34 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_33 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_3 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_12 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_11 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_10 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_9 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_64 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_63 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_32 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_64 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_63 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_62 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_61 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_31 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_62 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_61 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_60 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_59 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_30 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_60 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_59 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_58 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_57 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_29 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_58 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_57 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_8 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_32 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_31 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_30 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_29 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_56 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_55 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_28 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_56 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_55 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_54 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_53 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_27 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_54 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_53 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_52 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_51 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_26 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_52 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_51 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_50 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_49 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_25 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_50 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_49 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_7 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_28 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_27 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_26 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_25 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_48 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_47 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_24 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_48 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_47 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_46 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_45 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_23 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_46 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_45 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_44 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_43 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_22 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_44 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_43 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_42 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_41 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_21 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_42 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_41 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_6 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_24 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_23 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_22 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_21 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_40 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_39 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_20 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_40 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_39 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_38 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_37 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_19 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_38 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_37 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_36 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_35 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_18 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_36 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_35 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_34 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_33 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_17 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_34 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_33 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_5 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_20 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_19 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_18 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_17 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_2 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_8 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_7 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_6 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_5 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_32 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_31 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_16 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_32 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_31 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_30 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_29 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_15 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_30 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_29 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_28 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_27 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_14 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_28 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_27 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_26 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_25 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_13 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_26 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_25 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_4 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_16 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_15 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_14 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_13 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_24 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_23 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_12 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_24 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_23 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_22 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_21 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_11 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_22 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_21 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_20 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_19 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_10 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_20 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_19 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_18 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_17 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_9 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_18 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_17 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_3 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_12 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_11 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_10 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_9 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_16 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_15 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_8 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_16 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_15 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_14 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_13 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_7 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_14 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_13 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_12 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_11 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_6 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_12 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_11 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_10 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_9 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_5 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_10 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_9 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_2 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_8 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_7 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1)
         );
  Add_full_6 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0)
         );
  Add_full_5 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_8 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_7 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_4 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_8 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_7 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_6 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_5 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_3 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_6 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_5 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_4 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_3 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_2 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_4 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_3 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_2 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_1 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_2 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_1 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_4 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_3 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1)
         );
  Add_full_2 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0)
         );
  Add_full_1 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_1 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  bit2_4 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_3 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_2 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_1 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in4), .Z(n2) );
endmodule


module bit8_1 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  CAOR2X1 U6 ( .A(s84[3]), .B(n1), .C(s83[3]), .D(n3), .Z(sum8[7]) );
  CAOR2X1 U7 ( .A(s84[2]), .B(n1), .C(s83[2]), .D(n3), .Z(sum8[6]) );
  CAOR2X1 U8 ( .A(s84[1]), .B(n1), .C(s83[1]), .D(n3), .Z(sum8[5]) );
  CAOR2X1 U9 ( .A(s84[0]), .B(n1), .C(s83[0]), .D(n3), .Z(sum8[4]) );
  CAOR2X1 U10 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n2), .Z(sum8[3]) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n2), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n2), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n2), .Z(sum8[0]) );
  CAOR2X1 U14 ( .A(c_out811), .B(n1), .C(c_out810), .D(n3), .Z(c_out8) );
  bit4_4 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_3 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_2 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_1 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CANR2X1 U3 ( .A(c_out801), .B(c_in8), .C(c_out800), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in8), .Z(n2) );
endmodule


module bit16 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   c_out1600, c_out1601, c_out1610, c_out1611, n4, n1, n2, n3, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35;
  wire   [7:0] s161;
  wire   [7:0] s162;
  wire   [7:0] s163;
  wire   [7:0] s164;

  CAOR2X1 U6 ( .A(s164[1]), .B(n34), .C(s163[1]), .D(n4), .Z(sum16[9]) );
  CAOR2X1 U7 ( .A(s164[0]), .B(n34), .C(s163[0]), .D(n4), .Z(sum16[8]) );
  CAOR2X1 U8 ( .A(s162[7]), .B(c_in16), .C(s161[7]), .D(n35), .Z(sum16[7]) );
  CAOR2X1 U9 ( .A(s162[6]), .B(c_in16), .C(s161[6]), .D(n35), .Z(sum16[6]) );
  CAOR2X1 U10 ( .A(s162[5]), .B(c_in16), .C(s161[5]), .D(n35), .Z(sum16[5]) );
  CAOR2X1 U11 ( .A(s162[4]), .B(c_in16), .C(s161[4]), .D(n35), .Z(sum16[4]) );
  CAOR2X1 U12 ( .A(s162[3]), .B(c_in16), .C(s161[3]), .D(n35), .Z(sum16[3]) );
  CAOR2X1 U13 ( .A(s162[2]), .B(c_in16), .C(s161[2]), .D(n35), .Z(sum16[2]) );
  CAOR2X1 U14 ( .A(s162[1]), .B(c_in16), .C(s161[1]), .D(n35), .Z(sum16[1]) );
  CAOR2X1 U15 ( .A(s164[7]), .B(n34), .C(s163[7]), .D(n4), .Z(sum16[15]) );
  CAOR2X1 U16 ( .A(s164[6]), .B(n34), .C(s163[6]), .D(n4), .Z(sum16[14]) );
  CAOR2X1 U17 ( .A(s164[5]), .B(n34), .C(s163[5]), .D(n4), .Z(sum16[13]) );
  CAOR2X1 U18 ( .A(s164[4]), .B(n34), .C(s163[4]), .D(n4), .Z(sum16[12]) );
  CAOR2X1 U19 ( .A(s164[3]), .B(n34), .C(s163[3]), .D(n4), .Z(sum16[11]) );
  CAOR2X1 U20 ( .A(s164[2]), .B(n34), .C(s163[2]), .D(n4), .Z(sum16[10]) );
  CAOR2X1 U21 ( .A(s162[0]), .B(c_in16), .C(s161[0]), .D(n35), .Z(sum16[0]) );
  CAOR2X1 U22 ( .A(c_out1611), .B(n34), .C(c_out1610), .D(n4), .Z(c_out16) );
  bit8_0 A161 ( .sum8(s161), .c_out8(c_out1600), .a8({n25, n24, n23, n22, n21, 
        n20, n19, n18}), .b8({n9, n8, n7, n6, n5, n3, n2, n1}), .c_in8(1'b0)
         );
  bit8_3 A162 ( .sum8(s162), .c_out8(c_out1601), .a8({n25, n24, n23, n22, n21, 
        n20, n19, n18}), .b8({n9, n8, n7, n6, n5, n3, n2, n1}), .c_in8(1'b1)
         );
  bit8_2 A163 ( .sum8(s163), .c_out8(c_out1610), .a8({n33, n32, n31, n30, n29, 
        n28, n27, n26}), .b8({n17, n16, n15, n14, n13, n12, n11, n10}), 
        .c_in8(1'b0) );
  bit8_1 A164 ( .sum8(s164), .c_out8(c_out1611), .a8({n33, n32, n31, n30, n29, 
        n28, n27, n26}), .b8({n17, n16, n15, n14, n13, n12, n11, n10}), 
        .c_in8(1'b1) );
  CNIVX1 U3 ( .A(b16[0]), .Z(n1) );
  CNIVX1 U4 ( .A(b16[1]), .Z(n2) );
  CNIVX1 U5 ( .A(b16[2]), .Z(n3) );
  CNIVX1 U23 ( .A(b16[4]), .Z(n6) );
  CNIVX1 U24 ( .A(b16[5]), .Z(n7) );
  CNIVX1 U25 ( .A(b16[3]), .Z(n5) );
  CNIVX1 U26 ( .A(b16[8]), .Z(n10) );
  CNIVX1 U27 ( .A(b16[10]), .Z(n12) );
  CNIVX1 U28 ( .A(b16[12]), .Z(n14) );
  CNIVX1 U29 ( .A(b16[11]), .Z(n13) );
  CNIVX1 U30 ( .A(b16[6]), .Z(n8) );
  CNIVX1 U31 ( .A(b16[7]), .Z(n9) );
  CNIVX1 U32 ( .A(b16[9]), .Z(n11) );
  CNIVX1 U33 ( .A(b16[14]), .Z(n16) );
  CNIVX1 U34 ( .A(b16[13]), .Z(n15) );
  CNIVX1 U35 ( .A(b16[15]), .Z(n17) );
  CNIVX1 U36 ( .A(a16[0]), .Z(n18) );
  CNIVX1 U37 ( .A(a16[1]), .Z(n19) );
  CNIVX1 U38 ( .A(a16[5]), .Z(n23) );
  CNIVX1 U39 ( .A(a16[3]), .Z(n21) );
  CNIVX1 U40 ( .A(a16[8]), .Z(n26) );
  CNIVX1 U41 ( .A(a16[2]), .Z(n20) );
  CNIVX1 U42 ( .A(a16[4]), .Z(n22) );
  CNIVX1 U43 ( .A(a16[10]), .Z(n28) );
  CNIVX1 U44 ( .A(a16[12]), .Z(n30) );
  CNIVX1 U45 ( .A(a16[11]), .Z(n29) );
  CNIVX1 U46 ( .A(a16[14]), .Z(n32) );
  CNIVX1 U47 ( .A(a16[6]), .Z(n24) );
  CNIVX1 U48 ( .A(a16[7]), .Z(n25) );
  CNIVX1 U49 ( .A(a16[9]), .Z(n27) );
  CNIVX1 U50 ( .A(a16[13]), .Z(n31) );
  CNIVX1 U51 ( .A(a16[15]), .Z(n33) );
  CIVX2 U52 ( .A(n4), .Z(n34) );
  CANR2X1 U53 ( .A(c_out1601), .B(c_in16), .C(c_out1600), .D(n35), .Z(n4) );
  CIVX2 U54 ( .A(c_in16), .Z(n35) );
endmodule


module seq_adder_DW01_dec_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;

  COR2X1 U1 ( .A(n6), .B(A[27]), .Z(n1) );
  COR2X1 U2 ( .A(n27), .B(A[3]), .Z(n2) );
  CIVX1 U3 ( .A(n35), .Z(n25) );
  CIVX1 U4 ( .A(n43), .Z(n8) );
  CNR2XL U5 ( .A(n27), .B(A[3]), .Z(n3) );
  CIVX1 U6 ( .A(n39), .Z(n27) );
  COR2X1 U7 ( .A(A[1]), .B(A[0]), .Z(n4) );
  CNR2XL U8 ( .A(n6), .B(A[27]), .Z(n5) );
  CIVX1 U9 ( .A(n41), .Z(n6) );
  CIVX2 U10 ( .A(n42), .Z(n7) );
  CIVX2 U11 ( .A(n44), .Z(n9) );
  CIVX2 U12 ( .A(n45), .Z(n10) );
  CIVX2 U13 ( .A(n46), .Z(n11) );
  CIVX2 U14 ( .A(n47), .Z(n12) );
  CIVX2 U15 ( .A(n48), .Z(n13) );
  CIVX2 U16 ( .A(n50), .Z(n14) );
  CIVX2 U17 ( .A(n51), .Z(n15) );
  CIVX2 U18 ( .A(n52), .Z(n16) );
  CIVX2 U19 ( .A(n53), .Z(n17) );
  CIVX2 U20 ( .A(n54), .Z(n18) );
  CIVX2 U21 ( .A(n55), .Z(n19) );
  CIVX2 U22 ( .A(n56), .Z(n20) );
  CIVX2 U23 ( .A(n57), .Z(n21) );
  CIVX2 U24 ( .A(n32), .Z(n22) );
  CIVX2 U25 ( .A(n33), .Z(n23) );
  CIVX2 U26 ( .A(n34), .Z(n24) );
  CIVX2 U27 ( .A(n36), .Z(n26) );
  CIVX2 U28 ( .A(A[0]), .Z(SUM[0]) );
  CIVX2 U29 ( .A(A[10]), .Z(n29) );
  CIVX2 U30 ( .A(A[29]), .Z(n30) );
  CAOR1X1 U31 ( .A(n22), .B(A[9]), .C(n31), .Z(SUM[9]) );
  CAOR1X1 U32 ( .A(n23), .B(A[8]), .C(n32), .Z(SUM[8]) );
  CAOR1X1 U33 ( .A(n24), .B(A[7]), .C(n33), .Z(SUM[7]) );
  CAOR1X1 U34 ( .A(n25), .B(A[6]), .C(n34), .Z(SUM[6]) );
  CAOR1X1 U35 ( .A(n26), .B(A[5]), .C(n35), .Z(SUM[5]) );
  CAOR1X1 U36 ( .A(n2), .B(A[4]), .C(n36), .Z(SUM[4]) );
  CAOR1X1 U37 ( .A(n27), .B(A[3]), .C(n3), .Z(SUM[3]) );
  CEOX1 U38 ( .A(A[31]), .B(n37), .Z(SUM[31]) );
  CNR2X1 U39 ( .A(A[30]), .B(n38), .Z(n37) );
  CENX1 U40 ( .A(n38), .B(A[30]), .Z(SUM[30]) );
  CAOR1X1 U41 ( .A(n4), .B(A[2]), .C(n39), .Z(SUM[2]) );
  COND1XL U42 ( .A(n40), .B(n30), .C(n38), .Z(SUM[29]) );
  CND2X1 U43 ( .A(n40), .B(n30), .Z(n38) );
  CAOR1X1 U44 ( .A(n1), .B(A[28]), .C(n40), .Z(SUM[28]) );
  CNR2X1 U45 ( .A(n1), .B(A[28]), .Z(n40) );
  CAOR1X1 U46 ( .A(n6), .B(A[27]), .C(n5), .Z(SUM[27]) );
  CAOR1X1 U47 ( .A(n7), .B(A[26]), .C(n41), .Z(SUM[26]) );
  CNR2X1 U48 ( .A(n7), .B(A[26]), .Z(n41) );
  CAOR1X1 U49 ( .A(n8), .B(A[25]), .C(n42), .Z(SUM[25]) );
  CNR2X1 U50 ( .A(n8), .B(A[25]), .Z(n42) );
  CAOR1X1 U51 ( .A(n9), .B(A[24]), .C(n43), .Z(SUM[24]) );
  CNR2X1 U52 ( .A(n9), .B(A[24]), .Z(n43) );
  CAOR1X1 U53 ( .A(n10), .B(A[23]), .C(n44), .Z(SUM[23]) );
  CNR2X1 U54 ( .A(n10), .B(A[23]), .Z(n44) );
  CAOR1X1 U55 ( .A(n11), .B(A[22]), .C(n45), .Z(SUM[22]) );
  CNR2X1 U56 ( .A(n11), .B(A[22]), .Z(n45) );
  CAOR1X1 U57 ( .A(n12), .B(A[21]), .C(n46), .Z(SUM[21]) );
  CNR2X1 U58 ( .A(n12), .B(A[21]), .Z(n46) );
  CAOR1X1 U59 ( .A(n13), .B(A[20]), .C(n47), .Z(SUM[20]) );
  CNR2X1 U60 ( .A(n13), .B(A[20]), .Z(n47) );
  CAOR1X1 U61 ( .A(A[0]), .B(A[1]), .C(n49), .Z(SUM[1]) );
  CAOR1X1 U62 ( .A(n14), .B(A[19]), .C(n48), .Z(SUM[19]) );
  CNR2X1 U63 ( .A(n14), .B(A[19]), .Z(n48) );
  CAOR1X1 U64 ( .A(n15), .B(A[18]), .C(n50), .Z(SUM[18]) );
  CNR2X1 U65 ( .A(n15), .B(A[18]), .Z(n50) );
  CAOR1X1 U66 ( .A(n16), .B(A[17]), .C(n51), .Z(SUM[17]) );
  CNR2X1 U67 ( .A(n16), .B(A[17]), .Z(n51) );
  CAOR1X1 U68 ( .A(n17), .B(A[16]), .C(n52), .Z(SUM[16]) );
  CNR2X1 U69 ( .A(n17), .B(A[16]), .Z(n52) );
  CAOR1X1 U70 ( .A(n18), .B(A[15]), .C(n53), .Z(SUM[15]) );
  CNR2X1 U71 ( .A(n18), .B(A[15]), .Z(n53) );
  CAOR1X1 U72 ( .A(n19), .B(A[14]), .C(n54), .Z(SUM[14]) );
  CNR2X1 U73 ( .A(n19), .B(A[14]), .Z(n54) );
  CAOR1X1 U74 ( .A(n20), .B(A[13]), .C(n55), .Z(SUM[13]) );
  CNR2X1 U75 ( .A(n20), .B(A[13]), .Z(n55) );
  CAOR1X1 U76 ( .A(n21), .B(A[12]), .C(n56), .Z(SUM[12]) );
  CNR2X1 U77 ( .A(n21), .B(A[12]), .Z(n56) );
  CAOR1X1 U78 ( .A(n58), .B(A[11]), .C(n57), .Z(SUM[11]) );
  CNR2X1 U79 ( .A(n58), .B(A[11]), .Z(n57) );
  COND1XL U80 ( .A(n31), .B(n29), .C(n58), .Z(SUM[10]) );
  CND2X1 U81 ( .A(n31), .B(n29), .Z(n58) );
  CNR2X1 U82 ( .A(n22), .B(A[9]), .Z(n31) );
  CNR2X1 U83 ( .A(n23), .B(A[8]), .Z(n32) );
  CNR2X1 U84 ( .A(n24), .B(A[7]), .Z(n33) );
  CNR2X1 U85 ( .A(n25), .B(A[6]), .Z(n34) );
  CNR2X1 U86 ( .A(n26), .B(A[5]), .Z(n35) );
  CNR2X1 U87 ( .A(n2), .B(A[4]), .Z(n36) );
  CNR2X1 U88 ( .A(n4), .B(A[2]), .Z(n39) );
  CNR2X1 U89 ( .A(A[1]), .B(A[0]), .Z(n49) );
endmodule


module seq_adder ( clock, start, valid, mlier, mcand, prodt_end, reset );
  input [15:0] mlier;
  input [15:0] mcand;
  output [32:0] prodt_end;
  input clock, start, reset;
  output valid;
  wire   wcout, add, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49,
         N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63,
         N64, N65, N66, N67, N68, N69, N70, N214, N215, n12, n13, n21, n22,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299;
  wire   [15:0] a;
  wire   [15:0] wsum;
  wire   [1:0] states;
  wire   [31:0] count;
  wire   [15:0] b;
  assign prodt_end[32] = 1'b0;

  CAOR1X1 U173 ( .A(prodt_end[0]), .B(n255), .C(n98), .Z(n183) );
  CAOR2X1 U174 ( .A(n254), .B(a[15]), .C(n274), .D(mcand[15]), .Z(n184) );
  CAOR2X1 U175 ( .A(n254), .B(a[14]), .C(n274), .D(mcand[14]), .Z(n185) );
  CAOR2X1 U176 ( .A(n254), .B(a[13]), .C(n274), .D(mcand[13]), .Z(n186) );
  CAOR2X1 U177 ( .A(n254), .B(a[12]), .C(n274), .D(mcand[12]), .Z(n187) );
  CAOR2X1 U178 ( .A(n254), .B(a[11]), .C(n274), .D(mcand[11]), .Z(n188) );
  CAOR2X1 U179 ( .A(n254), .B(a[10]), .C(n274), .D(mcand[10]), .Z(n189) );
  CAOR2X1 U180 ( .A(n254), .B(a[9]), .C(n274), .D(mcand[9]), .Z(n190) );
  CAOR2X1 U181 ( .A(n254), .B(a[8]), .C(n274), .D(mcand[8]), .Z(n191) );
  CAOR2X1 U182 ( .A(n254), .B(a[7]), .C(n274), .D(mcand[7]), .Z(n192) );
  CAOR2X1 U183 ( .A(n254), .B(a[6]), .C(n274), .D(mcand[6]), .Z(n193) );
  CAOR2X1 U184 ( .A(n254), .B(a[5]), .C(n274), .D(mcand[5]), .Z(n194) );
  CAOR2X1 U185 ( .A(n254), .B(a[4]), .C(n274), .D(mcand[4]), .Z(n195) );
  CAOR2X1 U186 ( .A(n254), .B(a[3]), .C(n274), .D(mcand[3]), .Z(n196) );
  CAOR2X1 U187 ( .A(n254), .B(a[2]), .C(n274), .D(mcand[2]), .Z(n197) );
  CAOR2X1 U188 ( .A(n254), .B(a[1]), .C(n274), .D(mcand[1]), .Z(n198) );
  CAOR2X1 U189 ( .A(n254), .B(a[0]), .C(n274), .D(mcand[0]), .Z(n199) );
  CAOR2X1 U190 ( .A(n254), .B(b[14]), .C(mlier[14]), .D(n274), .Z(n201) );
  CAOR2X1 U191 ( .A(n254), .B(b[13]), .C(mlier[13]), .D(n274), .Z(n202) );
  CAOR2X1 U192 ( .A(n254), .B(b[12]), .C(mlier[12]), .D(n274), .Z(n203) );
  CAOR2X1 U193 ( .A(n254), .B(b[11]), .C(mlier[11]), .D(n274), .Z(n204) );
  CAOR2X1 U194 ( .A(n254), .B(b[10]), .C(mlier[10]), .D(n274), .Z(n205) );
  CAOR2X1 U195 ( .A(n254), .B(b[9]), .C(mlier[9]), .D(n274), .Z(n206) );
  CAOR2X1 U196 ( .A(n254), .B(b[8]), .C(mlier[8]), .D(n274), .Z(n207) );
  CAOR2X1 U197 ( .A(n254), .B(b[7]), .C(mlier[7]), .D(n274), .Z(n208) );
  CAOR2X1 U198 ( .A(n254), .B(b[6]), .C(mlier[6]), .D(n274), .Z(n209) );
  CAOR2X1 U199 ( .A(n254), .B(b[5]), .C(mlier[5]), .D(n274), .Z(n210) );
  CAOR2X1 U200 ( .A(n254), .B(b[4]), .C(mlier[4]), .D(n274), .Z(n211) );
  CAOR2X1 U201 ( .A(n254), .B(b[3]), .C(mlier[3]), .D(n274), .Z(n212) );
  CAOR2X1 U202 ( .A(n254), .B(b[2]), .C(mlier[2]), .D(n274), .Z(n213) );
  CAOR2X1 U203 ( .A(n254), .B(b[1]), .C(n274), .D(mlier[1]), .Z(n214) );
  CAOR2X1 U204 ( .A(count[31]), .B(n255), .C(N70), .D(n276), .Z(n217) );
  CAOR2X1 U205 ( .A(count[30]), .B(n255), .C(N69), .D(n276), .Z(n218) );
  CAOR2X1 U206 ( .A(count[29]), .B(n255), .C(N68), .D(n276), .Z(n219) );
  CAOR2X1 U207 ( .A(count[28]), .B(n255), .C(N67), .D(n276), .Z(n220) );
  CAOR2X1 U208 ( .A(count[27]), .B(n255), .C(N66), .D(n276), .Z(n221) );
  CAOR2X1 U209 ( .A(count[26]), .B(n255), .C(N65), .D(n276), .Z(n222) );
  CAOR2X1 U210 ( .A(count[25]), .B(n255), .C(N64), .D(n276), .Z(n223) );
  CAOR2X1 U211 ( .A(count[24]), .B(n255), .C(N63), .D(n276), .Z(n224) );
  CAOR2X1 U212 ( .A(count[23]), .B(n255), .C(N62), .D(n276), .Z(n225) );
  CAOR2X1 U213 ( .A(count[22]), .B(n255), .C(N61), .D(n276), .Z(n226) );
  CAOR2X1 U214 ( .A(count[21]), .B(n255), .C(N60), .D(n276), .Z(n227) );
  CAOR2X1 U215 ( .A(count[20]), .B(n255), .C(N59), .D(n276), .Z(n228) );
  CAOR2X1 U216 ( .A(count[19]), .B(n255), .C(N58), .D(n276), .Z(n229) );
  CAOR2X1 U217 ( .A(count[18]), .B(n255), .C(N57), .D(n276), .Z(n230) );
  CAOR2X1 U218 ( .A(count[17]), .B(n255), .C(N56), .D(n276), .Z(n231) );
  CAOR2X1 U219 ( .A(count[16]), .B(n255), .C(N55), .D(n276), .Z(n232) );
  CAOR2X1 U220 ( .A(count[15]), .B(n255), .C(N54), .D(n276), .Z(n233) );
  CAOR2X1 U221 ( .A(count[14]), .B(n255), .C(N53), .D(n276), .Z(n234) );
  CAOR2X1 U222 ( .A(count[13]), .B(n255), .C(N52), .D(n276), .Z(n235) );
  CAOR2X1 U223 ( .A(count[12]), .B(n255), .C(N51), .D(n276), .Z(n236) );
  CAOR2X1 U224 ( .A(count[11]), .B(n255), .C(N50), .D(n276), .Z(n237) );
  CAOR2X1 U225 ( .A(count[10]), .B(n255), .C(N49), .D(n276), .Z(n238) );
  CAOR2X1 U226 ( .A(count[9]), .B(n255), .C(N48), .D(n276), .Z(n239) );
  CAOR2X1 U227 ( .A(count[8]), .B(n255), .C(N47), .D(n276), .Z(n240) );
  CAOR2X1 U228 ( .A(count[7]), .B(n255), .C(N46), .D(n276), .Z(n241) );
  CAOR2X1 U229 ( .A(count[6]), .B(n255), .C(N45), .D(n276), .Z(n242) );
  CAOR2X1 U230 ( .A(count[5]), .B(n255), .C(N44), .D(n276), .Z(n243) );
  CAOR2X1 U231 ( .A(count[3]), .B(n255), .C(N42), .D(n276), .Z(n245) );
  CAOR2X1 U232 ( .A(count[2]), .B(n255), .C(N41), .D(n276), .Z(n246) );
  CAOR2X1 U233 ( .A(count[1]), .B(n255), .C(N40), .D(n276), .Z(n247) );
  CAOR2X1 U234 ( .A(count[0]), .B(n255), .C(N39), .D(n276), .Z(n248) );
  CAOR2X1 U235 ( .A(n278), .B(n104), .C(n276), .D(n282), .Z(N215) );
  CAN4X1 U236 ( .A(n145), .B(n146), .C(n147), .D(n148), .Z(n117) );
  CNR8X1 U237 ( .A(count[31]), .B(count[3]), .C(count[4]), .D(count[5]), .E(
        count[6]), .F(count[7]), .G(count[8]), .H(count[9]), .Z(n152) );
  CNR8X1 U238 ( .A(count[24]), .B(count[25]), .C(count[26]), .D(count[27]), 
        .E(count[28]), .F(count[29]), .G(count[2]), .H(count[30]), .Z(n151) );
  CNR8X1 U239 ( .A(count[17]), .B(count[18]), .C(count[19]), .D(count[1]), .E(
        count[20]), .F(count[21]), .G(count[22]), .H(count[23]), .Z(n150) );
  CNR8X1 U240 ( .A(n22), .B(count[10]), .C(count[11]), .D(count[12]), .E(
        count[13]), .F(count[14]), .G(count[15]), .H(count[16]), .Z(n149) );
  bit16 Ad16 ( .a16(prodt_end[31:16]), .b16(a), .sum16(wsum), .c_out16(wcout), 
        .c_in16(1'b0) );
  seq_adder_DW01_dec_0 sub_72 ( .A(count), .SUM({N70, N69, N68, N67, N66, N65, 
        N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, N51, 
        N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39}) );
  CFD1QXL \prodt_end_reg[0]  ( .D(n183), .CP(clock), .Q(prodt_end[0]) );
  CFD1QXL \prodt_end_reg[1]  ( .D(n249), .CP(clock), .Q(prodt_end[1]) );
  CFD1QXL \prodt_end_reg[14]  ( .D(n170), .CP(clock), .Q(prodt_end[14]) );
  CFD1QXL \prodt_end_reg[13]  ( .D(n171), .CP(clock), .Q(prodt_end[13]) );
  CFD1QXL \prodt_end_reg[12]  ( .D(n172), .CP(clock), .Q(prodt_end[12]) );
  CFD1QXL \prodt_end_reg[11]  ( .D(n173), .CP(clock), .Q(prodt_end[11]) );
  CFD1QXL \prodt_end_reg[10]  ( .D(n174), .CP(clock), .Q(prodt_end[10]) );
  CFD1QXL \prodt_end_reg[9]  ( .D(n175), .CP(clock), .Q(prodt_end[9]) );
  CFD1QXL \prodt_end_reg[8]  ( .D(n176), .CP(clock), .Q(prodt_end[8]) );
  CFD1QXL \prodt_end_reg[7]  ( .D(n177), .CP(clock), .Q(prodt_end[7]) );
  CFD1QXL \prodt_end_reg[6]  ( .D(n178), .CP(clock), .Q(prodt_end[6]) );
  CFD1QXL \prodt_end_reg[5]  ( .D(n179), .CP(clock), .Q(prodt_end[5]) );
  CFD1QXL \prodt_end_reg[4]  ( .D(n180), .CP(clock), .Q(prodt_end[4]) );
  CFD1QXL \prodt_end_reg[3]  ( .D(n181), .CP(clock), .Q(prodt_end[3]) );
  CFD1QXL \prodt_end_reg[2]  ( .D(n182), .CP(clock), .Q(prodt_end[2]) );
  CFD1QXL \prodt_end_reg[15]  ( .D(n169), .CP(clock), .Q(prodt_end[15]) );
  CFD1QXL \b_reg[7]  ( .D(n208), .CP(clock), .Q(b[7]) );
  CFD1QXL \b_reg[6]  ( .D(n209), .CP(clock), .Q(b[6]) );
  CFD1QXL \b_reg[5]  ( .D(n210), .CP(clock), .Q(b[5]) );
  CFD1QXL \b_reg[4]  ( .D(n211), .CP(clock), .Q(b[4]) );
  CFD1QXL add_reg ( .D(n250), .CP(clock), .Q(add) );
  CFD1QXL \count_reg[25]  ( .D(n223), .CP(clock), .Q(count[25]) );
  CFD1QXL \count_reg[26]  ( .D(n222), .CP(clock), .Q(count[26]) );
  CFD1QXL \count_reg[27]  ( .D(n221), .CP(clock), .Q(count[27]) );
  CFD1QXL \count_reg[28]  ( .D(n220), .CP(clock), .Q(count[28]) );
  CFD1QXL \count_reg[29]  ( .D(n219), .CP(clock), .Q(count[29]) );
  CFD1QXL \count_reg[31]  ( .D(n217), .CP(clock), .Q(count[31]) );
  CFD1QXL \count_reg[30]  ( .D(n218), .CP(clock), .Q(count[30]) );
  CFD1QXL \b_reg[14]  ( .D(n201), .CP(clock), .Q(b[14]) );
  CFD1QXL \b_reg[13]  ( .D(n202), .CP(clock), .Q(b[13]) );
  CFD1QXL \b_reg[12]  ( .D(n203), .CP(clock), .Q(b[12]) );
  CFD1QXL \b_reg[11]  ( .D(n204), .CP(clock), .Q(b[11]) );
  CFD1QXL \b_reg[10]  ( .D(n205), .CP(clock), .Q(b[10]) );
  CFD1QXL \b_reg[9]  ( .D(n206), .CP(clock), .Q(b[9]) );
  CFD1QXL \b_reg[8]  ( .D(n207), .CP(clock), .Q(b[8]) );
  CFD1QXL \b_reg[3]  ( .D(n212), .CP(clock), .Q(b[3]) );
  CFD1QXL \b_reg[2]  ( .D(n213), .CP(clock), .Q(b[2]) );
  CFD1QXL \b_reg[1]  ( .D(n214), .CP(clock), .Q(b[1]) );
  CFD1XL \b_reg[15]  ( .D(n200), .CP(clock), .QN(n12) );
  CFD1XL \b_reg[0]  ( .D(n215), .CP(clock), .QN(n13) );
  CFD1QXL \count_reg[24]  ( .D(n224), .CP(clock), .Q(count[24]) );
  CFD1QXL \count_reg[23]  ( .D(n225), .CP(clock), .Q(count[23]) );
  CFD1QXL \count_reg[22]  ( .D(n226), .CP(clock), .Q(count[22]) );
  CFD1QXL \count_reg[21]  ( .D(n227), .CP(clock), .Q(count[21]) );
  CFD1QXL \states_reg[1]  ( .D(N215), .CP(clock), .Q(states[1]) );
  CFD1QXL valid_reg ( .D(n216), .CP(clock), .Q(valid) );
  CFD1QXL \prodt_end_reg[31]  ( .D(n153), .CP(clock), .Q(prodt_end[31]) );
  CFD1QXL \count_reg[18]  ( .D(n230), .CP(clock), .Q(count[18]) );
  CFD1QXL \count_reg[19]  ( .D(n229), .CP(clock), .Q(count[19]) );
  CFD1QXL \count_reg[20]  ( .D(n228), .CP(clock), .Q(count[20]) );
  CFD1QXL \a_reg[15]  ( .D(n184), .CP(clock), .Q(a[15]) );
  CFD1QXL \prodt_end_reg[30]  ( .D(n154), .CP(clock), .Q(prodt_end[30]) );
  CFD1QXL \prodt_end_reg[29]  ( .D(n155), .CP(clock), .Q(prodt_end[29]) );
  CFD1QXL \prodt_end_reg[28]  ( .D(n156), .CP(clock), .Q(prodt_end[28]) );
  CFD1QXL \prodt_end_reg[27]  ( .D(n157), .CP(clock), .Q(prodt_end[27]) );
  CFD1QXL \prodt_end_reg[26]  ( .D(n158), .CP(clock), .Q(prodt_end[26]) );
  CFD1QXL \prodt_end_reg[25]  ( .D(n159), .CP(clock), .Q(prodt_end[25]) );
  CFD1QXL \prodt_end_reg[23]  ( .D(n161), .CP(clock), .Q(prodt_end[23]) );
  CFD1QXL \prodt_end_reg[22]  ( .D(n162), .CP(clock), .Q(prodt_end[22]) );
  CFD1QXL \count_reg[17]  ( .D(n231), .CP(clock), .Q(count[17]) );
  CFD1QXL \count_reg[16]  ( .D(n232), .CP(clock), .Q(count[16]) );
  CFD1QXL \count_reg[15]  ( .D(n233), .CP(clock), .Q(count[15]) );
  CFD1QXL \a_reg[14]  ( .D(n185), .CP(clock), .Q(a[14]) );
  CFD1QXL \a_reg[13]  ( .D(n186), .CP(clock), .Q(a[13]) );
  CFD1QXL \a_reg[12]  ( .D(n187), .CP(clock), .Q(a[12]) );
  CFD1QXL \a_reg[11]  ( .D(n188), .CP(clock), .Q(a[11]) );
  CFD1QXL \a_reg[10]  ( .D(n189), .CP(clock), .Q(a[10]) );
  CFD1QXL \a_reg[9]  ( .D(n190), .CP(clock), .Q(a[9]) );
  CFD1QXL \a_reg[6]  ( .D(n193), .CP(clock), .Q(a[6]) );
  CFD1QXL \a_reg[5]  ( .D(n194), .CP(clock), .Q(a[5]) );
  CFD1QXL \a_reg[3]  ( .D(n196), .CP(clock), .Q(a[3]) );
  CFD1QXL \a_reg[7]  ( .D(n192), .CP(clock), .Q(a[7]) );
  CFD1QXL \prodt_end_reg[24]  ( .D(n160), .CP(clock), .Q(prodt_end[24]) );
  CFD1QXL \prodt_end_reg[21]  ( .D(n163), .CP(clock), .Q(prodt_end[21]) );
  CFD1QXL \prodt_end_reg[20]  ( .D(n164), .CP(clock), .Q(prodt_end[20]) );
  CFD1QXL \prodt_end_reg[19]  ( .D(n165), .CP(clock), .Q(prodt_end[19]) );
  CFD1QXL \prodt_end_reg[18]  ( .D(n166), .CP(clock), .Q(prodt_end[18]) );
  CFD1QXL \prodt_end_reg[17]  ( .D(n167), .CP(clock), .Q(prodt_end[17]) );
  CFD1QXL \prodt_end_reg[16]  ( .D(n168), .CP(clock), .Q(prodt_end[16]) );
  CFD1QXL \count_reg[11]  ( .D(n237), .CP(clock), .Q(count[11]) );
  CFD1QXL \count_reg[14]  ( .D(n234), .CP(clock), .Q(count[14]) );
  CFD1QXL \count_reg[12]  ( .D(n236), .CP(clock), .Q(count[12]) );
  CFD1QXL \count_reg[13]  ( .D(n235), .CP(clock), .Q(count[13]) );
  CFD1QXL \a_reg[8]  ( .D(n191), .CP(clock), .Q(a[8]) );
  CFD1QXL \a_reg[4]  ( .D(n195), .CP(clock), .Q(a[4]) );
  CFD1QXL \a_reg[2]  ( .D(n197), .CP(clock), .Q(a[2]) );
  CFD1QXL \a_reg[1]  ( .D(n198), .CP(clock), .Q(a[1]) );
  CFD1QXL \a_reg[0]  ( .D(n199), .CP(clock), .Q(a[0]) );
  CFD1QXL \count_reg[9]  ( .D(n239), .CP(clock), .Q(count[9]) );
  CFD1QXL \count_reg[8]  ( .D(n240), .CP(clock), .Q(count[8]) );
  CFD1QXL \count_reg[7]  ( .D(n241), .CP(clock), .Q(count[7]) );
  CFD1QXL \count_reg[10]  ( .D(n238), .CP(clock), .Q(count[10]) );
  CFD1XL \count_reg[4]  ( .D(n244), .CP(clock), .Q(count[4]), .QN(n21) );
  CFD1QXL \count_reg[5]  ( .D(n243), .CP(clock), .Q(count[5]) );
  CFD1QXL \count_reg[6]  ( .D(n242), .CP(clock), .Q(count[6]) );
  CFD1QXL \count_reg[3]  ( .D(n245), .CP(clock), .Q(count[3]) );
  CFD1QXL \count_reg[2]  ( .D(n246), .CP(clock), .Q(count[2]) );
  CFD1X1 \count_reg[0]  ( .D(n248), .CP(clock), .Q(count[0]), .QN(n22) );
  CFD1QXL \count_reg[1]  ( .D(n247), .CP(clock), .Q(count[1]) );
  CFD1XL \states_reg[0]  ( .D(N214), .CP(clock), .Q(states[0]), .QN(n280) );
  CIVX2 U241 ( .A(n81), .Z(n275) );
  CIVX2 U242 ( .A(n84), .Z(n276) );
  CIVX2 U243 ( .A(n100), .Z(n274) );
  COND1XL U244 ( .A(n62), .B(n267), .C(n69), .Z(n157) );
  CANR2X1 U245 ( .A(prodt_end[28]), .B(n64), .C(wsum[12]), .D(n65), .Z(n69) );
  COND1XL U246 ( .A(n62), .B(n268), .C(n68), .Z(n156) );
  CANR2X1 U247 ( .A(prodt_end[29]), .B(n64), .C(wsum[13]), .D(n65), .Z(n68) );
  COND1XL U248 ( .A(n62), .B(n269), .C(n67), .Z(n155) );
  CANR2X1 U249 ( .A(prodt_end[30]), .B(n64), .C(wsum[14]), .D(n65), .Z(n67) );
  COND1XL U250 ( .A(n62), .B(n270), .C(n66), .Z(n154) );
  CANR2X1 U251 ( .A(prodt_end[31]), .B(n64), .C(wsum[15]), .D(n65), .Z(n66) );
  COND1XL U252 ( .A(n62), .B(n271), .C(n63), .Z(n153) );
  CND2X1 U253 ( .A(wcout), .B(n65), .Z(n63) );
  CND3XL U254 ( .A(n62), .B(n278), .C(n279), .Z(n81) );
  CND2X1 U255 ( .A(n254), .B(n105), .Z(n62) );
  CIVX2 U256 ( .A(n251), .Z(n254) );
  CND2X1 U257 ( .A(n280), .B(n284), .Z(n111) );
  CND2X1 U258 ( .A(n281), .B(n278), .Z(n84) );
  CNR2X1 U259 ( .A(n299), .B(n84), .Z(n65) );
  CND2X1 U260 ( .A(n101), .B(n278), .Z(n100) );
  COND1XL U261 ( .A(n62), .B(n259), .C(n77), .Z(n165) );
  CANR2X1 U262 ( .A(prodt_end[20]), .B(n64), .C(wsum[4]), .D(n65), .Z(n77) );
  COND1XL U263 ( .A(n62), .B(n260), .C(n76), .Z(n164) );
  CANR2X1 U264 ( .A(prodt_end[21]), .B(n64), .C(wsum[5]), .D(n65), .Z(n76) );
  COND1XL U265 ( .A(n62), .B(n261), .C(n75), .Z(n163) );
  CANR2X1 U266 ( .A(prodt_end[22]), .B(n64), .C(wsum[6]), .D(n65), .Z(n75) );
  COND1XL U267 ( .A(n62), .B(n262), .C(n74), .Z(n162) );
  CANR2X1 U268 ( .A(prodt_end[23]), .B(n64), .C(wsum[7]), .D(n65), .Z(n74) );
  COND1XL U269 ( .A(n62), .B(n263), .C(n73), .Z(n161) );
  CANR2X1 U270 ( .A(prodt_end[24]), .B(n64), .C(wsum[8]), .D(n65), .Z(n73) );
  COND1XL U271 ( .A(n62), .B(n264), .C(n72), .Z(n160) );
  CANR2X1 U272 ( .A(prodt_end[25]), .B(n64), .C(wsum[9]), .D(n65), .Z(n72) );
  COND1XL U273 ( .A(n62), .B(n265), .C(n71), .Z(n159) );
  CANR2X1 U274 ( .A(prodt_end[26]), .B(n64), .C(wsum[10]), .D(n65), .Z(n71) );
  COND1XL U275 ( .A(n62), .B(n266), .C(n70), .Z(n158) );
  CANR2X1 U276 ( .A(prodt_end[27]), .B(n64), .C(wsum[11]), .D(n65), .Z(n70) );
  COND3X1 U277 ( .A(n81), .B(n272), .C(n82), .D(n83), .Z(n169) );
  CND2X1 U278 ( .A(prodt_end[15]), .B(n255), .Z(n82) );
  CANR2X1 U279 ( .A(prodt_end[16]), .B(n64), .C(wsum[0]), .D(n65), .Z(n83) );
  COND1XL U280 ( .A(n62), .B(n256), .C(n80), .Z(n168) );
  CANR2X1 U281 ( .A(prodt_end[17]), .B(n64), .C(wsum[1]), .D(n65), .Z(n80) );
  COND1XL U282 ( .A(n62), .B(n257), .C(n79), .Z(n167) );
  CANR2X1 U283 ( .A(prodt_end[18]), .B(n64), .C(wsum[2]), .D(n65), .Z(n79) );
  COND1XL U284 ( .A(n62), .B(n258), .C(n78), .Z(n166) );
  CANR2X1 U285 ( .A(prodt_end[19]), .B(n64), .C(wsum[3]), .D(n65), .Z(n78) );
  COR2X1 U286 ( .A(n101), .B(reset), .Z(n251) );
  CNR2X1 U287 ( .A(n111), .B(valid), .Z(n101) );
  COND3X1 U288 ( .A(n62), .B(n21), .C(n108), .D(n81), .Z(n244) );
  CND2X1 U289 ( .A(N43), .B(n276), .Z(n108) );
  COND1XL U290 ( .A(n62), .B(n298), .C(n109), .Z(n249) );
  CANR2X1 U291 ( .A(mlier[1]), .B(n275), .C(prodt_end[2]), .D(n276), .Z(n109)
         );
  COND1XL U292 ( .A(n62), .B(n297), .C(n97), .Z(n182) );
  CANR2X1 U293 ( .A(mlier[2]), .B(n275), .C(prodt_end[3]), .D(n276), .Z(n97)
         );
  COND1XL U294 ( .A(n62), .B(n296), .C(n96), .Z(n181) );
  CANR2X1 U295 ( .A(mlier[3]), .B(n275), .C(prodt_end[4]), .D(n276), .Z(n96)
         );
  COND1XL U296 ( .A(n62), .B(n295), .C(n95), .Z(n180) );
  CANR2X1 U297 ( .A(mlier[4]), .B(n275), .C(prodt_end[5]), .D(n276), .Z(n95)
         );
  COND1XL U298 ( .A(n62), .B(n294), .C(n94), .Z(n179) );
  CANR2X1 U299 ( .A(mlier[5]), .B(n275), .C(prodt_end[6]), .D(n276), .Z(n94)
         );
  COND1XL U300 ( .A(n62), .B(n293), .C(n93), .Z(n178) );
  CANR2X1 U301 ( .A(mlier[6]), .B(n275), .C(prodt_end[7]), .D(n276), .Z(n93)
         );
  COND1XL U302 ( .A(n62), .B(n292), .C(n92), .Z(n177) );
  CANR2X1 U303 ( .A(mlier[7]), .B(n275), .C(prodt_end[8]), .D(n276), .Z(n92)
         );
  COND1XL U304 ( .A(n62), .B(n291), .C(n91), .Z(n176) );
  CANR2X1 U305 ( .A(mlier[8]), .B(n275), .C(prodt_end[9]), .D(n276), .Z(n91)
         );
  COND1XL U306 ( .A(n62), .B(n290), .C(n90), .Z(n175) );
  CANR2X1 U307 ( .A(mlier[9]), .B(n275), .C(prodt_end[10]), .D(n276), .Z(n90)
         );
  COND1XL U308 ( .A(n62), .B(n289), .C(n89), .Z(n174) );
  CANR2X1 U309 ( .A(mlier[10]), .B(n275), .C(prodt_end[11]), .D(n276), .Z(n89)
         );
  COND1XL U310 ( .A(n62), .B(n288), .C(n88), .Z(n173) );
  CANR2X1 U311 ( .A(mlier[11]), .B(n275), .C(prodt_end[12]), .D(n276), .Z(n88)
         );
  COND1XL U312 ( .A(n62), .B(n287), .C(n87), .Z(n172) );
  CANR2X1 U313 ( .A(mlier[12]), .B(n275), .C(prodt_end[13]), .D(n276), .Z(n87)
         );
  COND1XL U314 ( .A(n62), .B(n286), .C(n86), .Z(n171) );
  CANR2X1 U315 ( .A(mlier[13]), .B(n275), .C(prodt_end[14]), .D(n276), .Z(n86)
         );
  COND1XL U316 ( .A(n62), .B(n285), .C(n85), .Z(n170) );
  CANR2X1 U317 ( .A(mlier[14]), .B(n275), .C(prodt_end[15]), .D(n276), .Z(n85)
         );
  COND2X1 U318 ( .A(n84), .B(n298), .C(n81), .D(n273), .Z(n98) );
  COND2X1 U319 ( .A(reset), .B(n111), .C(n282), .D(n84), .Z(N214) );
  CAN8X1 U320 ( .A(n112), .B(n113), .C(n114), .D(n115), .E(n116), .F(n117), 
        .G(n118), .H(n119), .Z(n104) );
  CENX1 U321 ( .A(mcand[8]), .B(a[8]), .Z(n112) );
  CENX1 U322 ( .A(mlier[6]), .B(b[6]), .Z(n113) );
  CENX1 U323 ( .A(mlier[5]), .B(b[5]), .Z(n116) );
  CND4X1 U324 ( .A(n149), .B(n150), .C(n151), .D(n152), .Z(n106) );
  COND2X1 U325 ( .A(N214), .B(n299), .C(n277), .D(n110), .Z(n250) );
  CANR2X1 U326 ( .A(prodt_end[1]), .B(n281), .C(mlier[0]), .D(n279), .Z(n110)
         );
  CNR3XL U327 ( .A(n136), .B(states[0]), .C(n284), .Z(n126) );
  CEOX1 U328 ( .A(mcand[7]), .B(a[7]), .Z(n136) );
  CND2X1 U329 ( .A(states[0]), .B(n284), .Z(n105) );
  CENX1 U330 ( .A(mcand[12]), .B(a[12]), .Z(n131) );
  CENX1 U331 ( .A(mcand[4]), .B(a[4]), .Z(n123) );
  CENX1 U332 ( .A(mlier[11]), .B(b[11]), .Z(n140) );
  CENX1 U333 ( .A(mlier[3]), .B(b[3]), .Z(n148) );
  CENX1 U334 ( .A(mcand[0]), .B(a[0]), .Z(n135) );
  CENX1 U335 ( .A(mcand[11]), .B(a[11]), .Z(n130) );
  CENX1 U336 ( .A(mcand[3]), .B(a[3]), .Z(n122) );
  CENX1 U337 ( .A(mlier[10]), .B(b[10]), .Z(n139) );
  CENX1 U338 ( .A(mcand[15]), .B(a[15]), .Z(n134) );
  CENX1 U339 ( .A(mlier[14]), .B(b[14]), .Z(n143) );
  CENX1 U340 ( .A(mcand[14]), .B(a[14]), .Z(n133) );
  CENX1 U341 ( .A(mcand[6]), .B(a[6]), .Z(n125) );
  CENX1 U342 ( .A(mlier[13]), .B(b[13]), .Z(n142) );
  CEOX1 U343 ( .A(mlier[15]), .B(n12), .Z(n144) );
  COND1XL U344 ( .A(n102), .B(n283), .C(n103), .Z(n216) );
  COND3X1 U345 ( .A(n104), .B(n281), .C(n102), .D(n278), .Z(n103) );
  COND3X1 U346 ( .A(n105), .B(n106), .C(n278), .D(n107), .Z(n102) );
  CAN8X1 U347 ( .A(n128), .B(n129), .C(n130), .D(n131), .E(n132), .F(n133), 
        .G(n134), .H(n135), .Z(n127) );
  CENX1 U348 ( .A(mcand[9]), .B(a[9]), .Z(n128) );
  CENX1 U349 ( .A(mcand[13]), .B(a[13]), .Z(n132) );
  CENX1 U350 ( .A(mcand[10]), .B(a[10]), .Z(n129) );
  CAN8X1 U351 ( .A(n120), .B(n121), .C(n122), .D(n123), .E(n124), .F(n125), 
        .G(n126), .H(n127), .Z(n119) );
  CENX1 U352 ( .A(mcand[1]), .B(a[1]), .Z(n120) );
  CENX1 U353 ( .A(mcand[5]), .B(a[5]), .Z(n124) );
  CENX1 U354 ( .A(mcand[2]), .B(a[2]), .Z(n121) );
  CAN8X1 U355 ( .A(n137), .B(n138), .C(n139), .D(n140), .E(n141), .F(n142), 
        .G(n143), .H(n144), .Z(n118) );
  CENX1 U356 ( .A(mlier[8]), .B(b[8]), .Z(n137) );
  CENX1 U357 ( .A(mlier[12]), .B(b[12]), .Z(n141) );
  CENX1 U358 ( .A(mlier[9]), .B(b[9]), .Z(n138) );
  CNR2X1 U359 ( .A(n84), .B(add), .Z(n64) );
  CEOX1 U360 ( .A(mlier[0]), .B(n13), .Z(n145) );
  CENX1 U361 ( .A(mlier[1]), .B(b[1]), .Z(n146) );
  CENX1 U362 ( .A(mlier[2]), .B(b[2]), .Z(n147) );
  COND2X1 U363 ( .A(n251), .B(n13), .C(n273), .D(n100), .Z(n215) );
  COND2X1 U364 ( .A(n251), .B(n12), .C(n272), .D(n100), .Z(n200) );
  CENX1 U365 ( .A(mlier[4]), .B(b[4]), .Z(n115) );
  CENX1 U366 ( .A(mlier[7]), .B(b[7]), .Z(n114) );
  CND2X1 U367 ( .A(states[1]), .B(n280), .Z(n107) );
  CIVX1 U368 ( .A(n62), .Z(n255) );
  CIVX1 U369 ( .A(prodt_end[16]), .Z(n256) );
  CIVX1 U370 ( .A(prodt_end[17]), .Z(n257) );
  CIVX1 U371 ( .A(prodt_end[18]), .Z(n258) );
  CIVX1 U372 ( .A(prodt_end[19]), .Z(n259) );
  CIVX1 U373 ( .A(prodt_end[20]), .Z(n260) );
  CIVX1 U374 ( .A(prodt_end[21]), .Z(n261) );
  CIVX1 U375 ( .A(prodt_end[22]), .Z(n262) );
  CIVX1 U376 ( .A(prodt_end[23]), .Z(n263) );
  CIVX1 U377 ( .A(prodt_end[24]), .Z(n264) );
  CIVX1 U378 ( .A(prodt_end[25]), .Z(n265) );
  CIVX1 U379 ( .A(prodt_end[26]), .Z(n266) );
  CIVX1 U380 ( .A(prodt_end[27]), .Z(n267) );
  CIVX1 U381 ( .A(prodt_end[28]), .Z(n268) );
  CIVX1 U382 ( .A(prodt_end[29]), .Z(n269) );
  CIVX1 U383 ( .A(prodt_end[30]), .Z(n270) );
  CIVX1 U384 ( .A(prodt_end[31]), .Z(n271) );
  CIVX2 U385 ( .A(mlier[15]), .Z(n272) );
  CIVX2 U386 ( .A(mlier[0]), .Z(n273) );
  CIVX2 U387 ( .A(N214), .Z(n277) );
  CIVX2 U388 ( .A(reset), .Z(n278) );
  CIVX2 U389 ( .A(n111), .Z(n279) );
  CIVX2 U390 ( .A(n105), .Z(n281) );
  CIVX2 U391 ( .A(n106), .Z(n282) );
  CIVX2 U392 ( .A(valid), .Z(n283) );
  CIVX2 U393 ( .A(states[1]), .Z(n284) );
  CIVX2 U394 ( .A(prodt_end[14]), .Z(n285) );
  CIVX2 U395 ( .A(prodt_end[13]), .Z(n286) );
  CIVX2 U396 ( .A(prodt_end[12]), .Z(n287) );
  CIVX2 U397 ( .A(prodt_end[11]), .Z(n288) );
  CIVX2 U398 ( .A(prodt_end[10]), .Z(n289) );
  CIVX2 U399 ( .A(prodt_end[9]), .Z(n290) );
  CIVX2 U400 ( .A(prodt_end[8]), .Z(n291) );
  CIVX2 U401 ( .A(prodt_end[7]), .Z(n292) );
  CIVX2 U402 ( .A(prodt_end[6]), .Z(n293) );
  CIVX2 U403 ( .A(prodt_end[5]), .Z(n294) );
  CIVX2 U404 ( .A(prodt_end[4]), .Z(n295) );
  CIVX2 U405 ( .A(prodt_end[3]), .Z(n296) );
  CIVX2 U406 ( .A(prodt_end[2]), .Z(n297) );
  CIVX2 U407 ( .A(prodt_end[1]), .Z(n298) );
  CIVX2 U408 ( .A(add), .Z(n299) );
endmodule

