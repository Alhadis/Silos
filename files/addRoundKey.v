module addRoundKey(clock, cipher, state, round, out);
  
  input clock;
  input wire[127:0] cipher;
  input wire[31:0] round;
  input wire[127:0] state;
  
  output reg[127:0] out;
  
  wire[127:0] key1;
  wire[127:0] key2;
  wire[127:0] key3;
  wire[127:0] key4;
  wire[127:0] key5;
  wire[127:0] key6;
  wire[127:0] key7;
  wire[127:0] key8;
  wire[127:0] key9;
  wire[127:0] key10;
    
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
                      
  
  always @(posedge clock) begin
  
	// for the specified round xor the 
	// round key with the state
    case (round)
			32'd1 : out <= key1^state;
			32'd2 : out <= key2^state;
			32'd3 : out <= key3^state;
			32'd4 : out <= key4^state;
			32'd5 : out <= key5^state;
			32'd6 : out <= key6^state;
			32'd7 : out <= key7^state;
			32'd8 : out <= key8^state;
			32'd9 : out <= key9^state;
			32'd10 : out <= key10^state;
			default : out <= 128'h0^state;
		endcase
  end


endmodule