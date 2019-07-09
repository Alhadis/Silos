`include "../../src/verilog/jh-round-a.v"
module tester_v_a;

    reg [1023:0] state_in;
    reg [255:0] round_in;

    wire [1023:0] state_out;

    jh_round_a jh_a(state_in,round_in,state_out);

    initial begin
        state_in = 1024'd25;
        round_in = 256'd800;
    end

endmodule