/* Edge detector */
module test(in,clk,out);
 input  in,clk;
 output out;
 reg    out_flipflop;
 reg    in_flipflop;
 reg    reg_out;

 initial
 begin
        out_flipflop = 0;
        in_flipflop  = 0;
        reg_out = 0;
 
 end

 always @(posedge clk)
  begin
        in_flipflop   <= in;
        out_flipflop  <= in_flipflop;
        reg_out <= in_flipflop & ~out_flipflop;
  end

 assign out = reg_out;
endmodule
