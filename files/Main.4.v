// full final wrapper
module Main;
  integer it;

	// wires
	reg			clk;
	reg			rst;
	wire	[5:0]	Instruction;

  MIPS mips(
   .clk(clk),
   .rst(rst),
   .Instruction(Instruction)
  );

  initial begin
      it = 0;

      rst = 1;
      clk = 1;
      #100;
      clk = 0;
      #100;
      clk = 1;
      #100;
      clk = 0;
      rst = 0;

      while(it < 90) begin
          clk = 1;
          #100
          clk = 0;
          #100

          it = it + 1;
      end
  end
endmodule
