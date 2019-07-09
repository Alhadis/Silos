`include "../../src/verilog/jh-final.v"
module tester_v_jh_final;
    
    reg [1023:0] state_in;
    wire [1023:0] state_out;

    jh_final jh_f(state_in,state_out);

    initial begin
        state_in = 1024'd84006;
    end

endmodule