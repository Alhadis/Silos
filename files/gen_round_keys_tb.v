`timescale 1ns / 1ns
module tb_gen_round_keys();
  //declare inputs as rags and outputs as wires
  
  // inputs
  reg clock;
  reg [127:0] cipher;
  
  // outputs  
  wire [127:0] key1;
  wire [127:0] key2;
  wire [127:0] key3;
  wire [127:0] key4;
  wire [127:0] key5;
  wire [127:0] key6;
  wire [127:0] key7;
  wire [127:0] key8;
  wire [127:0] key9;
  wire [127:0] key10;
  
  genRoundKeys grk( clock, 
                    cipher,
                    key1,
                    key2,
                    key3,
                    key4,
                    key5,
                    key6,
                    key7,
                    key8,
                    key9,
                    key10);
  
  always begin
    clock <= 0;
    #10;
    clock <= 1;
    #10;
  end

  initial begin
    cipher <= 128'h2b28ab097eaef7cf15d2154f16a6883c;
    #1;
  end

        
endmodule
