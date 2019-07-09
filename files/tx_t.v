
module tx_t(
    input MAIN_PAUSE,
    output reg clk,
    output reg RESET_L,
    output reg PUSH_MAIN,
    output reg init,
    output reg POP_D0,
    output reg POP_D1,
    output reg [5:0] DATA_IN_TX,
    output reg [4:0] main_fifo_low,
    output reg [4:0] main_fifo_high,
    output reg [4:0] Vco_low,
    output reg [4:0] Vco_high,
    output reg [4:0] Vc1_low, 
    output reg [4:0] Vc1_high,
    output reg [4:0] Do_low,
    output reg [4:0] Do_high,
    output reg [4:0] D1_low,
    output reg [4:0] D1_high
);
    
    initial begin
        $dumpfile("result_tx.vcd");
        $dumpvars;
        {clk,RESET_L,PUSH_MAIN,init,POP_D0,POP_D1} <= 0;
        {DATA_IN_TX} <= 0;
        {main_fifo_high,main_fifo_low,Vco_high,Vco_low,Vc1_high,Vc1_low} <=0;
        {D1_high,D1_low,Do_low,Do_high} <= 0;
        @(posedge clk);
        RESET_L <= 1;
        @(posedge clk);
        main_fifo_low<='h1;
        main_fifo_high<='h3;
        
        Vco_low<='h3;
        Vco_high<='hC;

        Vc1_low<='h3;
        Vc1_high<='hC;

        Do_low<='h1;
        Do_high<='h3;

        D1_low<='h1;
        D1_high<='h3;
        @(posedge clk);
        DATA_IN_TX<= 'b000000;
        PUSH_MAIN<=1;
        @(posedge clk);
        DATA_IN_TX<= 'b000001;
        @(posedge clk);
        DATA_IN_TX<= 'b000010;
        @(posedge clk);
        DATA_IN_TX<= 'b000011;
        @(posedge clk);
        DATA_IN_TX<= 'b000100;
        @(posedge clk);
        DATA_IN_TX<= 'b000101;
        @(posedge clk);
        DATA_IN_TX<= 'b000110;
        @(posedge clk);
        DATA_IN_TX<= 'b000111;
        POP_D0<=1;
        POP_D1<=1;
        @(posedge clk);
        DATA_IN_TX<= 'b001000;
        @(posedge clk);
        DATA_IN_TX<= 'b001001;
        @(posedge clk);
        DATA_IN_TX<= 'b001010;
        @(posedge clk);
        DATA_IN_TX<= 'b001011;
        @(posedge clk);
        DATA_IN_TX<= 'b001100;
        @(posedge clk);
        DATA_IN_TX<= 'b001101;
        @(posedge clk);
        DATA_IN_TX<= 'b001110;
        @(posedge clk);
        DATA_IN_TX<= 'b001111;
        @(posedge clk);
        DATA_IN_TX<='b000000;
        PUSH_MAIN<=0;
        @(posedge clk); //end algo
        repeat(10)
        @(posedge clk);
        POP_D0<=0;
        POP_D1<=0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);        
        @(posedge clk);
        @(posedge clk);
        DATA_IN_TX<= 'b110000;
        PUSH_MAIN<=1;
        @(posedge clk);
        DATA_IN_TX<= 'b010001;
        @(posedge clk);
        DATA_IN_TX<= 'b100010;
        @(posedge clk);
        DATA_IN_TX<= 'b000011;
        @(posedge clk);
        DATA_IN_TX<= 'b010100;
        @(posedge clk);
        DATA_IN_TX<= 'b100101;
        @(posedge clk);
        DATA_IN_TX<= 'b110110;
        @(posedge clk);
        DATA_IN_TX<= 'b000111;
        POP_D0<=1;
        POP_D1<=1;
        @(posedge clk);
        DATA_IN_TX<= 'b101000;
        @(posedge clk);
        DATA_IN_TX<= 'b111001;
        @(posedge clk);
        DATA_IN_TX<= 'b011010;
        @(posedge clk);
        DATA_IN_TX<= 'b101011;
        @(posedge clk);
        DATA_IN_TX<= 'b111100;
        @(posedge clk);
        DATA_IN_TX<= 'b001101;
        @(posedge clk);
        DATA_IN_TX<= 'b011110;
        @(posedge clk);
        DATA_IN_TX<= 'b011111;
        @(posedge clk);
        DATA_IN_TX<='b000000;
        PUSH_MAIN<=0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        POP_D0<=0;
        POP_D1<=0;
        repeat (8)
        @(posedge clk);

        $finish;
    end


    initial clk   <= 0;
    always #2 clk <= ~clk;

endmodule // tx_t