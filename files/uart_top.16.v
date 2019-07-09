module uart_top (/*AUTOARG*/
   // Outputs
   o_tx, o_tx_busy, o_rx_data, o_rx_valid,
   // Inputs
   i_rx, i_tx_data, i_tx_stb, clk, rst
   );

`include "seq_definitions.v"
   
   output                   o_tx; // asynchronous UART TX
   input                    i_rx; // asynchronous UART RX
   
   output                   o_tx_busy;
   output [7:0]             o_rx_data;
   output                   o_rx_valid;
   
   input [seq_dp_width-1:0] i_tx_data;
   input                    i_tx_stb;
   
   input                    clk;
   input                    rst;

   parameter stIdle = 0;
   parameter stNib1 = 1;
   parameter stNL   = uart_num_nib+1;
   parameter stCR   = uart_num_nib+2;
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 tfifo_empty;            // From tfifo_ of uart_fifo.v
   wire                 tfifo_full;             // From tfifo_ of uart_fifo.v
   wire [7:0]           tfifo_out;              // From tfifo_ of uart_fifo.v
   // End of automatics

   reg [7:0]            tfifo_in;
   wire                 tx_active;
   wire                 tfifo_rd;
   reg                  tfifo_rd_z;
   reg [seq_dp_width-1:0]  tx_data;
   reg [4:0]               state;

   assign o_tx_busy = (tx_active);
   
   always @ (posedge clk)
     if (rst)
       state <= stIdle;
     else
       case (state)
         stIdle:
           if (i_tx_stb)
             begin
                state   <= stNib1;
                tx_data <= i_tx_data;
             end
         stCR:
           if (~tfifo_full) state <= stIdle;
         default:
           if (~tfifo_full)
             begin
                state   <= state + 1;
                tx_data <= {tx_data,8'b0000};
             end
       endcase // case (state)

   function [7:0] fnNib2ASCII;
      input [7:0] din;
      begin
         case (din)
           8'h0: fnNib2ASCII = "0";
           8'h1: fnNib2ASCII = "1";
           8'h2: fnNib2ASCII = "2";
           8'h3: fnNib2ASCII = "3";
           8'h4: fnNib2ASCII = "4";
           8'h5: fnNib2ASCII = "5";
           8'h6: fnNib2ASCII = "6";
           8'h7: fnNib2ASCII = "7";
           8'h8: fnNib2ASCII = "8";
           8'h9: fnNib2ASCII = "9";
           8'hA: fnNib2ASCII = "A";
           8'hB: fnNib2ASCII = "B";
           8'hC: fnNib2ASCII = "C";
           8'hD: fnNib2ASCII = "D";
           8'hE: fnNib2ASCII = "E";
           8'hF: fnNib2ASCII = "F";
		       8'h10: fnNib2ASCII = "G";
           8'h11: fnNib2ASCII = "H";
           8'h12: fnNib2ASCII = "I";
           8'h13: fnNib2ASCII = "J";
           8'h14: fnNib2ASCII = "K";
           8'h15: fnNib2ASCII = "L";
           8'h16: fnNib2ASCII = "M";
           8'h17: fnNib2ASCII = "N";
           8'h18: fnNib2ASCII = "O";
		       8'h19: fnNib2ASCII = "P";
           8'h1A: fnNib2ASCII = "Q";
           8'h1B: fnNib2ASCII = "R";
           8'h1C: fnNib2ASCII = "S";
           8'h1D: fnNib2ASCII = "T";
           8'h1E: fnNib2ASCII = "U";
           8'h1F: fnNib2ASCII = "V";
           8'h20: fnNib2ASCII = "W";
           8'h21: fnNib2ASCII = "X";
		       8'h22: fnNib2ASCII = "Y";
           8'h23: fnNib2ASCII = "Z";
			     8'h24: fnNib2ASCII = "a";
           8'h25: fnNib2ASCII = "b";
           8'h26: fnNib2ASCII = "c";
           8'h27: fnNib2ASCII = "d";
           8'h28: fnNib2ASCII = "e";
           8'h29: fnNib2ASCII = "f";
           8'h2A: fnNib2ASCII = "g";
           8'h2B: fnNib2ASCII = "h";
           8'h2C: fnNib2ASCII = "i";
           8'h2D: fnNib2ASCII = "j";
           8'h2E: fnNib2ASCII = "k";
           8'h2F: fnNib2ASCII = "l";
           8'h30: fnNib2ASCII = "m";
           8'h31: fnNib2ASCII = "n";
           8'h32: fnNib2ASCII = "o";
           8'h33: fnNib2ASCII = "p";
           8'h34: fnNib2ASCII = "q";
           8'h35: fnNib2ASCII = "r";
           8'h36: fnNib2ASCII = "s";
           8'h37: fnNib2ASCII = "t";
           8'h38: fnNib2ASCII = "u";
           8'h39: fnNib2ASCII = "v";
           8'h3A: fnNib2ASCII = "w";
           8'h3B: fnNib2ASCII = "x";
           8'h3C: fnNib2ASCII = "y";
           8'h3D: fnNib2ASCII = "z";
           8'h3E: fnNib2ASCII = "?";
           8'h3F: fnNib2ASCII = "!";
        
		 default : fnNib2ASCII = "P";
         endcase // case (char)
      end
   endfunction // fnNib2ASCII

   always @*
     case (state)
       stNL:    tfifo_in = "\n";
       stCR:    tfifo_in = "\r";
       default: tfifo_in = fnNib2ASCII(tx_data[seq_dp_width-1:seq_dp_width-8]);
     endcase // case (state)
   
   assign tfifo_rd = ~tfifo_empty & ~tx_active & ~tfifo_rd_z;

   assign tfifo_wr = ~tfifo_full & (state!=stIdle);
   
   uart_fifo tfifo_ (// Outputs
                     .fifo_cnt          (),
                     .fifo_out          (tfifo_out[7:0]),
                     .fifo_full         (tfifo_full),
                     .fifo_empty        (tfifo_empty),
                     // Inputs
                     .fifo_in           (tfifo_in[7:0]),
                     .fifo_rd           (tfifo_rd),
                     .fifo_wr           (tfifo_wr),
                     /*AUTOINST*/
                     // Inputs
                     .clk               (clk),
                     .rst               (rst));

   always @ (posedge clk)
     if (rst)
       tfifo_rd_z <= 1'b0;
     else
       tfifo_rd_z <= tfifo_rd;

   uart uart_ (// Outputs
               .received                (o_rx_valid),
               .rx_byte                 (o_rx_data[7:0]),
               .is_receiving            (),
               .is_transmitting         (tx_active),
               .recv_error              (),
               .tx                      (o_tx),
               // Inputs
               .rx                      (i_rx),
               .transmit                (tfifo_rd_z),
               .tx_byte                 (tfifo_out[7:0]),
               /*AUTOINST*/
               // Inputs
               .clk                     (clk),
               .rst                     (rst));
   
endmodule // uart_top
// Local Variables:
// verilog-library-flags:("-y ../../osdvu/")
// End:
