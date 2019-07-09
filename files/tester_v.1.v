`include "../../src/verilog/jh-round-b.v"
module tester_v_b;

    reg [255:0] round_in;
    wire [255:0] round_out;

    jh_round_b jh_b(round_in,round_out);

    initial begin
        round_in = 256'd1000;
    end

endmodule