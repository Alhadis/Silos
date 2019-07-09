`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2019 06:16:58 PM
// Design Name: 
// Module Name: rdp_wrapper_fifo_buff_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rdp_wrapper_fifo_buff_tb #(
  parameter DATA_WIDTH = 8,
  parameter ADDRS_WIDTH = 4
);
  
  reg clkA, clkB;
  reg rst;
  reg clr_ptrs;
  reg rdn, wrn;
  reg [DATA_WIDTH-1:0] data_in;
  wire full;
  wire empty;
  wire almost_full;
  wire almost_empty;
  wire [DATA_WIDTH-1:0] data_out;
  
  integer periodA = 40, periodB = 30, i;
  
  rdp_wrapper_fifo_buff #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDRS_WIDTH(ADDRS_WIDTH)
  )uut(
    .clkA(clkA),
    .clkB(clkB),
    .rst(rst),
    .clr_ptrs(clr_ptrs),
    .rdn(rdn),
    .wrn(wrn),
    .data_in(data_in),
    .full(full),
    .empty(empty),
    .almost_full(almost_full),
    .almost_empty(almost_empty),
    .data_out(data_out)
  );
  
  initial begin
    clkA = 0;
    clkB = 0;
    rst = 1'b0;
    clr_ptrs = 1'b0;
    rdn = 1'b0;
    wrn = 1'b0;
    data_in = 8'd0;
    i = 0;
  end
  
  initial begin
  	main;
  end
  
  task main;
    fork
    	clock_genA;
      	clock_genB;
    	gen_vectors;
    	//end_sim;
    join
  endtask
  
  task clock_genA;
    forever #(periodA/2) clkA = ~clkA;
  endtask
  
  task clock_genB;
    forever #(periodB/2) clkB = ~clkB;
  endtask
  
  task gen_vectors;
    begin
        #(periodA);
        rst = 1'b1;
      
        #(periodA);
        rst = 1'b0;
        
        #(periodA);
        
        fork
            parallel_write;
            parallel_read;
//        for(i=0; i< 20; i = i+1) begin
//            data_in = i;
//            wrn = 1'b1;
//          #(periodA);
//        end
        
//        #(period);
//        wrn = 1'b0;
        
//        #(period);
//        for(i=0; i< 20; i= i + 1) begin
//            rdn = 1'b1;
//          #(period);
//        end
        join
        
        #(10*periodA);
        
        clr_ptrs = 1'b1;
        
        #(periodA);
        clr_ptrs = 1'b0;
        
        end_sim;
    end
  endtask
  
  task end_sim;
    begin
        #(100*periodA);
        $finish;
    end  
  endtask
  
  task parallel_write;
    integer j;
    begin
        for (j = 0; j< 500; j = j + 1) begin
            data_in = j;
            wrn = 1'b1;
            #(periodA);
        end
        wrn = 1'b0;
    end
  endtask
  
  task parallel_read;
    integer j;
    begin
      #(10*periodA);
      for (j = 0; j< 1000; j = j + 1) begin
            rdn = 1'b1;
          #(periodB);
      end
      rdn = 1'b0;
    end
  endtask

endmodule
