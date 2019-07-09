module buffer (A, Y);
   input A;
   output Y;
endmodule

module inv (A, Y);
   input A;
   output Y;
endmodule

module nor2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module or2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module nand2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module and2 (A, B, Y );
   input A, B;
   output Y;
endmodule


module xor2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module or3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module nor3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module and3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module nand3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module or4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module nor4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module and4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module nand4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module or5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module nor5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module and5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module nand5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module or6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module nor6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module and6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module nand6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module or7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module nor7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module and7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module nand7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module or8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module nor8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module and8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module nand8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module or9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module nor9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module and9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module nand9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module not (Y, A );
   input A;
   output Y;
endmodule

module nor (Y, A, B );
   input A, B;
   output Y;
endmodule

module or (Y, A, B );
   input A, B;
   output Y;
endmodule

module nand (Y, A, B );
   input A, B;
   output Y;
endmodule

module and (Y, A, B );
   input A, B;
   output Y;
endmodule

module dff(D,CLK,Q);
   input D, CLK;
   output Q;
endmodule