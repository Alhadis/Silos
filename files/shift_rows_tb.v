`timescale 1ns / 1ns
module tb_shift_rows();
  //declare inputs as rags and outputs as wires
  
  // inputs
  reg clock;
  reg encrypt;
  reg [127:0] in_state;
  
  // outputs
  wire [127:0] out;
  
  shiftRows sr(clock, encrypt, in_state, out);
  
  always begin
    clock <= 0;
    #10;
    clock <= 1;
    #10;
  end

  initial begin
    encrypt <= 1;
    in_state <= 128'hd4e0b81e27bfb44111985d52aef1e530;

    #10;
    
/*    #1 $display("****** BLOCK ********");
    #1 $display("| %h | %h | %h | %h |",out[127:120], out[119:112], out[111:104], out[103:96]);
    #1 $display("| %h | %h | %h | %h |",out[95:88], out[87:80], out[79:72], out[71:64]);
    #1 $display("| %h | %h | %h | %h |",out[63:56], out[55:48], out[47:40], out[39:32]);
    #1 $display("| %h | %h | %h | %h |",out[31:24], out[23:16], out[15:8], out[7:0]);
    #1 $display("*********************");*/
    
    encrypt <= 0;
    in_state <= 128'hd4e0b81ebfb441275d52119830aef1e5;
    
    #10;
  

  end

        
endmodule