`timescale 1ns / 1ns
module AES2(clock, encrypt, cipher, in, out);
    
    input clock;
    input encrypt;
    input wire[127:0] cipher;
    input wire[127:0] in;
    output reg[127:0] out;
    
    wire[127:0] encrypt_out, decrypt_out;
    
	// top level modules 
    encrypt e(clock, encrypt, cipher, in, encrypt_out);
    decrypt d(clock, encrypt, cipher, in, decrypt_out);
    
    always @(posedge clock) begin
			// multiplex the modules based
			// on the encryption bit
			if(encrypt == 1'b1) begin
			  out <= encrypt_out; 
			end
			else begin
			  out <= decrypt_out;
			end		
    end
endmodule

/**************** ENCRYPTION MODULE **********************/
module encrypt(clock, encrypt, cipher, in, out);
    input clock;
    input encrypt;
    input wire[127:0] cipher;
    input wire[127:0] in;
    wire done;
    output reg[127:0] out;
    
    wire[127:0] state [10:0];
    
    wire[127:0] sub_out[10:0];
    wire[127:0] shift_out[10:0];
    wire[127:0] mix_out[10:0];
    wire[127:0] key_out[10:0];
    
	
	
    genvar i;
    generate        
		//initial round
        initRound ir(clock,encrypt,cipher,in,state[0]);
        
		// generate modules for each round 
		// with connecting wires so that the 'state'
		// in fed through
        for(i=0; i<9; i=i+1) begin // rounds 1-9
          subBytes sub(clock, encrypt, state[i], sub_out[i]);
          shiftRows shift(clock, encrypt, sub_out[i], shift_out[i]);
          mix_columns mix(shift_out[i],mix_out[i],1'b1,done,encrypt,clock,1'b0);
          addRoundKey key(clock, cipher, mix_out[i], i+1, state[i+1]);
        end
		
		// final round
        subBytes sub(clock, encrypt, state[9], sub_out[10]);
        shiftRows shift(clock, encrypt, sub_out[10], shift_out[10]);
        addRoundKey key(clock, cipher,shift_out[10], 10, state[10]);        
    endgenerate
    
    always @(posedge clock) begin
	  // the tenth state wire feeds out the encrypted data
      out <= state[10]; 
    end
    
endmodule
/**************** END OF ENCRYPTION MODULE **********************/

/**************** DECRYPTION MODULE *****************************/
module decrypt(clock, encrypt, cipher, in, out);
    input clock;
    input encrypt;
    input wire[127:0] cipher;
    input wire[127:0] in;
    
    output reg[127:0] out;
    
    wire[127:0] state [11:0];
    
    wire[127:0] sub_out[10:0];
    wire[127:0] shift_out[10:0];
    wire[127:0] mix_out[10:0];
    wire[127:0] key_out[10:0];
    
    genvar i;
    generate    

		//initial round
        addRoundKey key(clock, cipher, in, 10, state[11]);
        shiftRows shift(clock, encrypt, state[11], shift_out[10]);
        subBytes sub(clock, encrypt, shift_out[10], state[10]);
        
		// generate modules for each round 
		// with connecting wires so that the 'state'
		// in fed through
        for(i=9; i > 0; i=i-1) begin
          addRoundKey key(clock, cipher, state[i+1], i, key_out[i]);
		  mix_columns mix(key_out[i],mix_out[i],1'b1,done,encrypt,clock,1'b0);
          shiftRows shift(clock, encrypt, mix_out[i], shift_out[i]);
          subBytes sub(clock, encrypt, shift_out[i], state[i]);
        end
		// final round (reuse initRound() because it's
		// just an xor gate
        initRound ir(clock, encrypt, cipher, state[1], state[0]); 
    endgenerate
    
    always @(posedge clock) begin
      out <= state[0]; 
    end
    
endmodule
/**************** END OF DECRYPTION MODULE **********************/

module initRound(clock, encrypt, cipher, in, out);
  input clock;
  input encrypt;
  input wire[127:0] cipher;
  input wire[127:0] in;
    
  output reg[127:0] out;
  
  always @(posedge clock) begin
    out <= cipher^in;
  end
endmodule


