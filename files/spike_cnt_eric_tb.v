`timescale 1ns / 10ps
/************************************************************************
* Date: 
* File: 
*
* Testbench to generate some stimulus and display the results 
* 
************************************************************************/
//*********************************************************
module spike_cnt_tb;
//*********************************************************
wire [31:0] int_cnt_out, cnt; //use wire data type for outputs from instantiated module
wire t1, t2, read; 
wire [1:0] wait_for_one_more_spike;
reg spike, reset;
reg slow_clk, clk; 


spikecnt DUT(spike, int_cnt_out, clk, slow_clk, reset, clear_out, cnt, t1, t2, read);
//spike_counter DUT1(spike, int_cnt_out, slow_clk, reset, clear_out, cnt, read, wait_for_one_more_spike);

//This block generates a clock pulse with a 20 ns period

reg [3:0] a=32'd5, b=32'd7;
wire [3:0] out;
mult_signed gain(.a(a), .b(b), .out32(out));

    //This initial block will provide values for the inputs
    // of the mux so that both inputs/outputs can be displayed
initial begin
    $timeformat(-9, 1, " ns", 6);
	 #1000
    slow_clk = 1'b0; clk = 1'b0; reset = 1; spike = 0;
    #1000 reset = 0; a = 32'd0; b=32'd0;
    #1000000
    a = 32'd5; b = 32'd7;
//    $display("1. a=%d, b=%d, out =%d", a, b, out);
     #500
     a = 32'd8; b= 32'd9;
//    #1000
//    $display("2. a=%d, b=%d, out =%d", a, b, out);
    #30000000
    $finish; // to shut down the simulation
	end //initial
// this block is sensitive to changes on ANY of the inputs and will
// then display both the inputs and corresponding output

always
	#5 clk = ~clk;  // 200Mhz base clk

always
  #1000000 slow_clk = ~slow_clk; // 1ms slow clock

always 
    begin
        #1789 spike = 1;  // spike rate in Mhz range
        #1000   spike = 0;
    end

always @(posedge slow_clk)
     $display("At t=%t int_cnt_out=%d", $time, int_cnt_out);
    

endmodule



module mult_signed(
    input  wire signed [3:0] a,
    input  wire signed [3:0] b,
    output wire signed [3:0] out32
    );
    wire signed [7:0] out64;
    //wire signed [31:0] out32;
    assign out64= a * b;
    assign out32 = (a==32'd0)? 32'd0: out64[3:0];
    
endmodule


//wire signed [63:0] I_synapse_gainAdjusted64;
//    wire signed [31:0] I_synapse_gainAdjusted32;
//    assign I_synapse_gainAdjusted64 = each_I_synapse * i_gain_syn;
//    assign I_synapse_gainAdjusted32 = I_synapse_gainAdjusted64[31:0];


//
//
//module spike_counter(spike, int_cnt_out, slow_clk, reset, clear_out, cnt, read, wait_for_one_more_spike);
//    input   spike, slow_clk, reset;
//    output  reg    [31:0]  int_cnt_out;
//    output reg     [31:0]  cnt;
//	 //reg slow_clk_up; 
//    output clear_out, read;
//	 output reg [1:0] wait_for_one_more_spike;
//    //assign clear_out = slow_clk_up;
//	 
//    always @(posedge reset or posedge slow_clk or posedge spike) begin
//        if (reset) begin 
//            //slow_clk_up <= 1'b0;
//				wait_for_one_more_spike <= 2'd0;
//        end 
//		  else if (slow_clk) begin
//			if (wait_for_one_more_spike == 2'd2) begin
//				wait_for_one_more_spike <= wait_for_one_more_spike - 1;
//			end
//			else
//			   //slow_clk_up <= 1'b1;
//				wait_for_one_more_spike <= 2'd2;
//		  end
//		  else begin//if (spike) begin
//				//slow_clk_up <= 1'b0;
//				if (wait_for_one_more_spike > 0) 
//					wait_for_one_more_spike <= (wait_for_one_more_spike - 1'b1);
//		  end
//    end 
//	 
	 //wire read;
    //assign read = slow_clk ^ slow_clk_up;
	 
	 // spike and slow_clk_up are not mutually exclusive in ISIM env. 
	 // Try make intermediate variable to wait for two spikes (lose one spike count) 
	 
//    always @(posedge reset or posedge spike) begin
//	  if (reset) begin
//			cnt <= 32'd0;
//			int_cnt_out <= 32'd0;
//						
//	  end
//	  else if (wait_for_one_more_spike == 2'd1) begin
//	  		int_cnt_out <= cnt;
//			cnt <= 32'd0;     
//	  end
//	  else begin //if (spike) begin //   SPIKE HIGH ONLY
//			int_cnt_out <= int_cnt_out;
//			cnt <= cnt + 32'd1;
//	  end
//
////	  else if (!slow_clk_up && (spike == 1'b0)) begin  // SLOW CLK UP, NO SPIKE
////			int_cnt_out <= cnt;
////			cnt <= 32'd0;    // count being renewed at every posedge of slow clock = read.
////	  end
//
//  end  
  
//      always @(posedge reset or posedge spike or posedge slow_clk) begin
//	  if (reset) begin
//			cnt <= 32'd0;
//			int_cnt_out <= 32'd0;
//						
//	  end
//	  else if (wait_for_one_more_spike == 2'd1) begin
//	  		int_cnt_out <= cnt;
//			cnt <= 32'd0;     
//	  end
//	  else begin //if (spike) begin //   SPIKE HIGH ONLY
//			int_cnt_out <= int_cnt_out;
//			cnt <= cnt + 32'd1;
//	  end

//	  else if (!slow_clk_up && (spike == 1'b0)) begin  // SLOW CLK UP, NO SPIKE
//			int_cnt_out <= cnt;
//			cnt <= 32'd0;    // count being renewed at every posedge of slow clock = read.
//	  end

//  end  
  

//endmodule	 
   