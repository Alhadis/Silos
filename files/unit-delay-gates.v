// This is a library of unit-delay gates

//
// inverting gates have one time unit of delay
// non-inverting gates have two time units of delay
//
// conventions:
//  1. all gates are upper case
//  2. inputs are a, b, c... with outputs as last
//  3. if gate is inverting, it's name ends in "_"
//  4. initialization code sets outputs.
//
// bugs:
//  I'm not sure if initialization code is correct since it tests
//    voltage levels which may also require initialization...
//
//  *** I NEED TO FIGURE OUT HOW TO ASSIGN AN StX SIGNAL IN UNFOOTED DOM GATES!
//
//
//
// gates:
//
// INV_(a,b);
// BUF(a,b);
// NOR2_(a,b,c);
// OR2(a,b,c);
// NAND2_(a,b,c);
// AND2(a,b,c);
// NAND3_(a,b,c,d);
// AND3(a,b,c,d);
// DFPA1_(p,a,b,rst) Footed Dom: n = pa  reset HIGH
// DFPA0_(p,a,b,rst) Footed Dom: n = pa  reset LOW
// DFPAB1_(p,a,b,c,rst);  footed Dom: n = pab, reset HIGH
// DFPAB1(p,a,b,c,rst);  footed Dom: n = pab, reset HIGH

// DUPAB1_(p,a,b,c,rst); unfooted Dom: n = ab, reset HIGH
// DFOPAB1_(p,a,b,c,rst); footed Dom: n = p(a+b), reset HIGH

// C_ELEMENT_(a,b,c,rst);
// C_ELEMENT(a,b,c,rst);
// GCABpCn1_(a,b,c,d,rst) GC: p = ab, n = ac, out = d  reset HIGH
// GCABpCn0_(a,b,c,d,rst) GC: p = ab, n = ac, out = d  reset LOW
// GCABpCp1_(a,b,c,d,rst) GC: p = abc, n = a, out = d  reset HIGH
// GCABp1_(a,b,c,rst) GC: p = ab, n = a, out = c  reset HIGH
// GCABp0_(a,b,c,rst) GC: p = ab, n = a, out = c  reset LOW
// GCABCp1_(a,b,c,d,rst) GC: p = abc, n = ab, out = d  reset HIGH
// GCABCpDn1_(a,b,c,d,e,rst) GC: p=abc, n=abd, reset HIGH



////////////////////////////////////////////////////////////////////////////////
//  Artisan 65nm cells
////////////////////////////////////////////////////////////////////////////////

 
module INVX2A12TH (Y, A);
   input A;
   output Y;
   assign #1 Y = ~A;
endmodule // INVX2A12TH


module OAI22X2A12TH (Y, A0, A1, B0, B1);
   input A0, A1, B0, B1;
   output Y;
   assign #1 Y = ~((A0 | A1) & (B0 | B1));
endmodule // OAI22X2A12TH

module NOR2X2A12TH (Y, A, B);
   input A, B;
   output Y;
   assign #1 Y = ~(A | B);
endmodule // NOR2X2A12TH

module NAND2X2A12TH (Y, A, B);
   input A, B;
   output Y;
   assign #1 ~(A & B);
endmodule // NAND2X2A12TH

module AOI22X2A12TH (Y, A0, A1, B0, B1);
   input A0, A1, B0, B1;
   output Y;
   assign #1 Y = ~((A0 & A1) | (B0 & B1));
endmodule // AOI22X2A12TH


module AOI221X2A12TH (Y, A0, A1, B0, B1, C0);
   input A0, A1, B0, B1, C0;
   output Y;
   assign #1 Y = ~((A0 & A1) | (B0 & B1) | C0);
endmodule // AOI221X2A12TH

module OAI221X2A12TH (Y, A0, A1, B0, B1, C0);
   input A0, A1, B0, B1, C0;
   output Y;
   assign #1 Y = ~((A0 | A1) & (B0 | B1) & C0);
endmodule // OAI221X2A12TH

module OR2X2A12TH (Y, A, B);
   input A, B;
   output Y;
   assign #2 Y = A | B;
endmodule // NOR2X2A12TH




////////////////////////////////////////////////////////////////////////////////
//  Static Gates
////////////////////////////////////////////////////////////////////////////////




// unit delay inverter
module INV_(y, a);
   output y;
   input  a;
   assign #1 y = ~a;
endmodule // INV_



// two unit delay non-inverting buffer
module BUF(y, a);
   output y;
   input  a;
   assign #2 y = a;
endmodule // BUF


// 2 input NAND gate - 1 unit delay
module NAND2_(y, a, b);
   output y;
   input  a, b;
   assign #1 y = ~(a & b);
endmodule // NAND2_

// 2 input AND gate - 2 unit delays
module AND2(y, a, b);
   output y;
   input  a, b;
   assign #2 y = a & b;
endmodule // AND2


// 2 input NOR gate - 2 unit delay
module NOR2_(y, a, b);
   output y;
   input  a, b;
   assign #1 y = ~(a | b);
endmodule // NOR2_


// 2 input OR gate - 2 unit delay
module OR2(y, a, b);
   output y;
   input  a, b;
   assign #2 y = a | b;
endmodule // OR2

// 3 input NAND gate - 1 unit delay
module NAND3_(y, a, b, c);
   output y;
   input  a, b, c;
   assign #1 y = ~(a & b & c);
endmodule // NAND3_

// 3 input AND gate - 2 unit delays
module AND3(y, a, b, c);
   output y;
   input  a, b, c;
   assign #2 y = a & b & c;
endmodule // AND3

// 3 input NOR gate - 1 unit delay
module NOR3_(y, a, b, c);
   output y;
   input  a, b, c;
   assign #1 y = ~(a | b | c);
endmodule // NOR3_

// 3 input OR gate - 2 unit delay
module OR3(y, a, b, c);
   output y;
   input  a, b, c;
   assign #2 y = a | b | c;
endmodule // OR3


// f = ab + c
module AOI21_(y, a, b, c);
   output y;
   input  a, b, c;
   assign #1 y = ~((a & b) | c);
endmodule // AOI21_





////////////////////////////////////////////////////////////////////////////////
//  Domino Gates
////////////////////////////////////////////////////////////////////////////////




// Footed Domino Gate, n = pa  reset HIGH
// was named DFPA1_(p, a, b, rst);
module DF1_1_(y, p, a, rst);
   output y;
   input  p, a, rst;
   assign #1 y = rst | ~p | (~a & y);
endmodule // DF1_1_



// Footed Domino Gate, n = pa  reset LOW
// was named DFPA0_(p, a, b, rst);
module DF1_0_(y, p, a, rst);
   output y;
   input  p, a, rst;
   assign #1 y = ~rst & ( ~p | (~a & y));
endmodule // DF1_0_



// Footed 2-input domino NAND, reset HIGH
module DF2_1_(y, p, a, b, rst);
   output y;
   input  p, a, b, rst;
   assign #1 y = rst | ~p | (p & y & ~a) | (p & y & ~b);
endmodule // DF2_1_


// Footed 2-input domino NAND, reset LOW
module DF2_0_(y, p, a, b, rst);
   output y;
   input  p, a, b, rst;
   assign #2 y = ~rst & ( (p & a & b) | (p & y & ~a) | (p & y & ~b));
endmodule // DFPAB1



// unfooted Dom: n = ab, reset HIGH
module DU2_1_(y, p, a, b, rst);
   output y;
   input  p, a, b, rst;
// TODO: Assign StX state if (~p & a & b) !!!
   assign #1 y = rst | (~p & (~a | ~b)) | (p & (~a | ~b) & y);
endmodule // DU2_1_



// footed Dom: n = p(a+b), reset HIGH
// was named DFOPAB1_(p, a, b, c, rst);
module DF11_1_(y, p, a, b, rst);
   output y;
   input  p, a, b, rst;
   assign #1 y = rst | ~p | (p & ~a & ~b & y);
endmodule // DF11_1_



////////////////////////////////////////////////////////////////////////////////
//  Generalized C-Elements
////////////////////////////////////////////////////////////////////////////////


// unit delay inverting c-element that initializes to state 1
module C_ELEMENT_(y, a, b, rst);
   output y;
   input  a, b, rst;
   assign #1 y = rst | ~((a & b) | (a & ~c) | (b & ~c));
endmodule // C_ELEMENT_


// unit delay inverting c-element that initializes to 0
module C_ELEMENT0_(y, a, b, rst);
   output y;
   input  a, b, rst;
   assign #1 y = ~(rst | (a & b) | (a & ~c) | (b & ~c));
endmodule // C_ELEMENT0_


// 2 unit delay non-inverting c-element that initializes to state 0
module C_ELEMENT(y, a, b, rst);
   output y;
   input  a, b, rst;
   assign #2 y = ~rst & ((a & b) | (a & c) | (b & c));
endmodule // C_ELEMENT


// Generalized C: p = ab, n = a, out = y  reset HIGH
module GCABp1_(y, a, b, rst);
   output y;
   input  a, b, rst;
   assign #1 y = rst | (~a & ~b) | (~a & y);
endmodule // GCABp1_


// Generalized C: p = ab, n = a, out = y  reset HIGH
module GCABp0_(y, a, b, rst);
   output y;
   input  a, b, rst;
   assign #1 y = ~rst & ((~a & ~b) | (~a & y));
endmodule // GCABp0_


// Generalized C: p = ab, n = ac, out = y  reset HIGH
module GCABpCn1_(y, a, b, c, rst);
   output y;
   input  a, b, c, rst;
   assign #1 y = rst | (~a & ~b) | (~a & y) | (~c & y);
endmodule // GCABpCn1_


// Generalized C: p = ab, n = ac, out = y  reset LOW
module GCABpCn0_(y, a, b, c, rst);
   output y;
   input  a, b, c, rst;
   assign #1 y = ~rst & ((~a & ~b) | (~a & y) | (~c & y));
endmodule // GCABpCn0_


// Generalized C: p = abc, n = a, out = y  reset HIGH
module GCABpCp1_(y, a, b, c, rst);
   output y;
   input  a, b, c, rst;
   assign #1 y = rst | (~a & ~b & ~c) | (~a & y);
endmodule // GCABpCp1_



// Generalized C: p = abc, n = ab, out = y  reset HIGH
module GCABCp1_(y, a, b, c, rst);
   output y;
   input  a, b, c, rst;
   assign #1 y = rst | (~a & ~b & ~c) | (~a & y) | (~b & y);
endmodule // GCABCp1_



// Generalized C: p=abc, n=abd, out = y  reset HIGH
module GCABCpDn1_(y, a, b, c, d, rst);
   output y;
   input  a, b, c, d, rst;
   assign #1 y = rst | (~a & ~b & ~c) | (~a & y) | (~b & y) | (~d & y);
endmodule // GCABCpDn1_


