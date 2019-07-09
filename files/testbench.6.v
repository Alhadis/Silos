`timescale 1 ns / 1 ns

module testbench
# (
    parameter DATA_WIDTH = 8
);

    reg clk;
    reg rst_n;
    reg clk_en;
    reg arg_vld;
    reg  [DATA_WIDTH - 1:0]       arg;
    wire                          res_vld_sqrt_single_cycle_struct;
    wire [DATA_WIDTH/2 - 1:0] res_sqrt_single_cycle_struct;

    sqrt_pipe_cycle_struct  # (.DATA_WIDTH(DATA_WIDTH)) i_sqrt_single_cycle_struct
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_sqrt_single_cycle_struct ),
        .res     ( res_sqrt_single_cycle_struct     )
    );

    initial begin
      $dumpfile("testbench.vcd");
      $dumpvars(0, testbench);
    end

    always begin
        #5 clk = ~clk;
    end

    initial begin
 
        clk_en  <= 1'b1;
        clk     <= 1'b0;
        arg_vld <= 1'b0;

        repeat (2) @(posedge clk);
        rst_n <= 0;
        repeat (2) @(posedge clk);
        rst_n <= 1;


    //------------------------------------------------------------------------
    //
    //  Main sequence
    //
    //------------------------------------------------------------------------

        @(posedge rst_n);
        arg     <= 189;
        arg_vld <= 1;

        @(posedge clk);

        arg_vld <= 0;

        repeat (5) @(posedge clk);

        arg_vld <= 1;

        arg     <= 100; @(posedge clk);
        arg     <= 121; @(posedge clk);
        arg     <= 144; @(posedge clk);
        arg     <= 169; @(posedge clk);
        arg     <= 196; @(posedge clk);
        arg     <= 225; @(posedge clk);

        repeat (5) @(posedge clk);

        arg     <= 0; @(posedge clk);
        arg     <= 10; @(posedge clk);
        arg     <= 20; @(posedge clk);
        arg     <= 30; @(posedge clk);
        arg     <= 40; @(posedge clk);
        arg     <= 50; @(posedge clk);
        arg     <= 60; @(posedge clk);
        arg     <= 70; @(posedge clk);
        arg     <= 80; @(posedge clk);
        arg     <= 90; @(posedge clk);


        repeat (20) @(posedge clk); $finish;
    end




endmodule
