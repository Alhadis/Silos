module MUX2(A, B, Sel, Out);
  parameter SIZE = 8;
  input [SIZE-1:0] A, B;
  input Sel;
  output [SIZE-1:0] Out;
  assign Out = Sel ? B : A;
endmodule
   
