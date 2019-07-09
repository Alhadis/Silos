/* Contains:
 *     Synchronous 32b registers (used extensively)
 *     Multiplexors
 */

// Reg has clk and reset.
module reg32 (input [31:0]in, clk, rst, output reg [31:0]out);
  reg[31:0] mem;
  
  always @(posedge clk) // trigger on rising clk
  begin
    if (rst)
      mem = 32'd0;
    else
      mem = in;
    
    out = mem;
  end
endmodule

// 2 mux for 32b buses.
module twomux32 (input [31:0]a, [31:0]b, sel, output reg [31:0]out);
  always @(*)
  begin
    case(sel)
      1'd0: out = a;
      1'd1: out = b;
      default: out = 32'bx;
    endcase
  end
endmodule

// 2 mux for 16b buses.
module twomux16 (input [15:0]a, [15:0]b, sel, clk, output reg [15:0]out);
  always @(*)
  begin
    case (sel)
      1'd0: out = a;
      1'd1: out = b;
      default: out = 16'bx;
    endcase
  end
endmodule