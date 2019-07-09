
`timescale 1ns/1ps

module DEL3 (I, Z);
    input wire I;
    output wire Z;

    assign Z = I;
    
endmodule

module CKMUX2D4 (I0, I1, S, Z);
    input wire I0, I1, S;
    output Z;
    
    reg Z;    
    always@(*) begin
        if (S==1'b0)
            Z = I0;
        else if (S==1'b1)
            Z = I1;
        else
            Z = 1'bx;
    end      

endmodule

module CKND8 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule

module BUFFD16 (I, Z);
    input wire I;
    output wire Z;

    assign Z = I;
    
endmodule


module DFQD4 (D, CP, Q);
    input D, CP;
    output reg Q = 1'b0;

    always@(posedge CP)
        Q <= D;

endmodule


module INVD24 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule

module INVD8 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule


module DFCNQD4 (D, CP, CDN, Q);
    input D, CP, CDN;
    output reg Q = 1'b0; 
    
    always@(posedge CP or negedge CDN)
        if(!CDN)
            Q <= 0;
        else
            Q <= D;
  
endmodule

module CKND4 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule


module OR2D4 (A1, A2, Z);
    input A1, A2;
    output Z;
    
    assign Z = A1 | A2;
    
endmodule

module INVD4 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule

module INVD2 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule

module INVD12 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule

module AN2D2 (A1, A2, Z);
    input A1, A2;
    output Z;
    
    assign Z = A1 & A2;
    
endmodule

module CKBD16 (I, Z);
    input wire I;
    output wire Z;
    
    assign Z = I;
    
endmodule

module CKBD12 (I, Z);
    input wire I;
    output wire Z;
    
    assign Z = I;
    
endmodule

module CKBD6 (I, Z);
    input wire I;
    output wire Z;
    
    assign Z = I;
    
endmodule


module XNR2D4 (A1, A2, ZN);
  input    A1, A2;
  output   ZN;
  
  assign ZN = A1 ~^ A2;
  
endmodule


module NR2XD4 (A1, A2, ZN);
  input    A1, A2;
  output   ZN;
  
  assign ZN = ~(A1 | A2);
  
endmodule

module DFD4 (D, CP, Q, QN);
    input D, CP;
    output reg Q = 1'b0; 
    output QN; 

    
    always@(posedge CP)
         Q <= D;
    
    assign QN = !Q;
  
endmodule

module TIEL (ZN);
  output  ZN;
  
  assign ZN = 1'b0;
endmodule

module MUX2D4 (I0, I1, S, Z);
    input wire I0, I1, S;
    output Z;
    
    reg Z;    
    always@(*) begin
        if (S==1'b0)
            Z = I0;
        else if (S==1'b1)
            Z = I1;
        else
            Z = 1'bx;
    end      

endmodule

// Already declared on line#84
// module CKND4 (I, ZN);
    // input wire I;
    // output wire ZN;
    
    // assign ZN = !I;
    
// endmodule

module CKND24 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule


module CKND6 (I, ZN);
    input wire I;
    output wire ZN;
    
    assign ZN = !I;
    
endmodule

module DFXQD4 (DA, DB, SA, CP, Q);
    input DA, DB, SA, CP;
    output reg Q = 1'b0;     

    always@(posedge CP) begin
        //if(SE)
        // Q <= SI;
        //else 
        if (SA)
         Q <= DA;
        else
         Q <= DB;
    end
    
   
  
endmodule


module AN2D4 (A1, A2, Z);
    input A1, A2;
    output Z;
    
    assign Z = A1 & A2;
    
endmodule

module MUX4D4 (I0, I1, I2, I3, S0, S1, Z);
  input I0, I1, I2, I3, S0, S1;
  output Z;
  reg Z;
    
    
    always@(*) begin
        case ({S1,S0}) 
            2'b00 : Z = I0; 
            2'b01 : Z = I1; 
            2'b10 : Z = I2; 
            2'b11 : Z = I3; 
        endcase 
    end      

endmodule


module LNQD4 (D, EN, Q);
    input D, EN;
    output reg Q = 1'b0;
    
    
    always@(*)
        if(!EN)
            Q = D;
        
endmodule


