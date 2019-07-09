module ALU( // @[:@3.2]
  input  [5:0] io_a, // @[:@6.4]
  input  [5:0] io_b, // @[:@6.4]
  output [5:0] io_y // @[:@6.4]
);
  wire [6:0] arith_result; // @[ALU.scala 26:26:@17.6]
  assign arith_result = io_a + io_b; // @[ALU.scala 26:26:@17.6]
  assign io_y = arith_result[5:0]; // @[ALU.scala 28:10:@23.6 ALU.scala 32:10:@35.8 ALU.scala 34:10:@41.10 ALU.scala 36:10:@47.12 ALU.scala 38:10:@53.14 ALU.scala 40:10:@59.16 ALU.scala 42:10:@62.16]
endmodule
module Register( // @[:@78.2]
  input        clock, // @[:@79.4]
  input  [5:0] io_in, // @[:@81.4]
  output [5:0] io_out // @[:@81.4]
);
  reg [5:0] reg$; // @[Reg.scala 11:16:@83.4]
  reg [31:0] _RAND_0;
  assign io_out = reg$; // @[Register.scala 15:10:@87.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[5:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    reg$ <= io_in;
  end
endmodule
module Fibonacci( // @[:@100.2]
  input        clock, // @[:@101.4]
  input        reset, // @[:@102.4]
  input  [5:0] io_f0, // @[:@103.4]
  input  [5:0] io_f1, // @[:@103.4]
  output [5:0] io_fn // @[:@103.4]
);
  wire [5:0] alu_io_a; // @[Fibonacci.scala 14:19:@105.4]
  wire [5:0] alu_io_b; // @[Fibonacci.scala 14:19:@105.4]
  wire [5:0] alu_io_y; // @[Fibonacci.scala 14:19:@105.4]
  wire  v1_clock; // @[Fibonacci.scala 16:18:@109.4]
  wire [5:0] v1_io_in; // @[Fibonacci.scala 16:18:@109.4]
  wire [5:0] v1_io_out; // @[Fibonacci.scala 16:18:@109.4]
  wire  v2_clock; // @[Fibonacci.scala 17:18:@112.4]
  wire [5:0] v2_io_in; // @[Fibonacci.scala 17:18:@112.4]
  wire [5:0] v2_io_out; // @[Fibonacci.scala 17:18:@112.4]
  ALU alu ( // @[Fibonacci.scala 14:19:@105.4]
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_y(alu_io_y)
  );
  Register v1 ( // @[Fibonacci.scala 16:18:@109.4]
    .clock(v1_clock),
    .io_in(v1_io_in),
    .io_out(v1_io_out)
  );
  Register v2 ( // @[Fibonacci.scala 17:18:@112.4]
    .clock(v2_clock),
    .io_in(v2_io_in),
    .io_out(v2_io_out)
  );
  assign io_fn = v2_io_out; // @[Fibonacci.scala 38:9:@130.4]
  assign alu_io_a = reset ? io_f0 : v1_io_out; // @[Fibonacci.scala 21:12:@117.4 Fibonacci.scala 27:14:@123.6]
  assign alu_io_b = reset ? io_f1 : v2_io_out; // @[Fibonacci.scala 22:12:@118.4 Fibonacci.scala 28:14:@124.6]
  assign v1_clock = clock; // @[:@110.4]
  assign v1_io_in = reset ? io_f0 : v2_io_out; // @[Fibonacci.scala 25:14:@121.6 Fibonacci.scala 30:14:@127.6]
  assign v2_clock = clock; // @[:@113.4]
  assign v2_io_in = reset ? io_f1 : alu_io_y; // @[Fibonacci.scala 26:14:@122.6 Fibonacci.scala 31:14:@128.6]
endmodule
