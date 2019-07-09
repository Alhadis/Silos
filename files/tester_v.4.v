`include "../../src/verilog/jh-init.v"
module tester_v_jh_init;

    reg [1023:0] state_in;
    wire [1023:0] state_out;

    jh_init jh_i(state_in,state_out);

    initial begin
        state_in = 1024'd589647;
    end

endmodule 