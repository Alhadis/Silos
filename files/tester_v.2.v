`include "../../src/verilog/f8.v"
module tester_v_f8;
    // inputs
    reg clk;
    reg [1023:0] state_in;
    // output
    wire [1023:0] state_out;

    F8 uut(
        .clk(clk),
        .state_in(state_in),
        .state_out(state_out)
    );

    initial begin
        clk = 0;
        state_in = 1024'd2500;
    end

    always begin
        #1 clk = ~clk;
    end

endmodule 