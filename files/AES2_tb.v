`timescale 1ns / 1ns
module AES2_tb();
  
  // inputs
  reg clock;
  reg encrypt;
  reg [127:0] cipher;
  reg [127:0] in;
  
  // outputs
  wire [127:0] out;
  
  AES2 aes2(clock, encrypt, cipher, in, out);
  
  always begin
    clock <= 0;
    #10;
    clock <= 1;
    #10;
  end

  initial begin
    cipher  <= 128'h2b7e151628aed2a6abf7158809cf4f3c;

	// for encrypt
    //in      <= 128'h3243f6a8885a308d313198a2e0370734;
    //encrypt <= 1;

	// for decrypt
    in      <= 128'h3925841d02dc09fbdc118597196a0b32;
    encrypt <= 0;
    #4;
  end

        
endmodule