// Time Unit = 1 ns (#10 = 10 ns)
// Simulation Precision = 100 ps
`timescale 1ns/100ps 

////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_rps.v
// Author:      Jacob Abel
// Date:        19 September 2018
// Version:     1
// Description: This file contains a test bench for the rock paper scissors circuit 
//              implementations and their equivalence.

module tb_rps();
   reg   [1:0] player_a;
   reg   [1:0] player_b;
   wire        player_a_wins_struct, player_a_wins_cont, player_a_wins_equiv;
   wire        player_b_wins_struct, player_b_wins_cont, player_b_wins_equiv;
   wire        tie_game_struct, tie_game_cont, tie_game_equiv;
   
   reg   [1:0] count;

   rps_struct DUT0(player_a, player_b, player_a_wins_struct, player_b_wins_struct, tie_game_struct);
   rps_cont   DUT1(player_a, player_b, player_a_wins_cont, player_b_wins_cont, tie_game_cont);

// Evaluate Equivalence of each output wire.
    assign player_a_wins_equiv = player_a_wins_cont ^~ player_a_wins_struct;
    assign player_b_wins_equiv = player_b_wins_cont ^~ player_b_wins_struct;
    assign tie_game_equiv      = tie_game_cont ^~ tie_game_struct;

// Test input waveform - defined as an initial block (procedure)

   initial begin
      player_a = 2'b11;
      #60;
      player_a = 2'b10;
      #60;
      player_a = 2'b00;
      #60;
   end

   initial begin
      for(count = 0; count < 3; count = count + 1) begin
	    player_b = 2'b11;
        #20;
        player_b = 2'b10;
        #20;
        player_b = 2'b00;
        #20;
   	  end
   end
endmodule
