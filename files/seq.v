`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2017 09:22:39 PM
// Design Name: 
// Module Name: top
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

module top;
    reg inp;
    wire z;
    assign z = 1'b0;
    reg rst;
    reg clk;
    
    initial
		begin
		    rst = 1'b1;
			clk = 0;
			inp = 0;
		end
    always
		begin
			#100 begin
			     clk = !clk;
			     rst = 1'b0;
			end
			
			#20 inp = !inp;
		end
		
    fsm_beh E(inp,clk,rst,z);
    //test_bench F(inp,clk);
endmodule

module fsm_beh(inp,clk,rst,z);
    input inp,clk,rst;
    output z;
	reg[1:0] st;
	wire[1:0] nst;
	wire[1:0] d;
	
	assign nst = 2'b00;
	assign d = 2'b00;
	
    stateTransFn_beh A(st,inp,clk,rst,d);
	outputFn_beh B(st,inp,clk,rst,z);
	delayElem_beh C(d,clk,rst,nst);
    
    initial
        begin
            st = 2'b00;
        end
    
    always (*)
        begin
            st = nst;
        end
    
endmodule

module stateTransFn_beh(st,inp,clk,rst,d);
    input[1:0] st;
	input inp,clk,rst;
    output[1:0] d;
	
    assign d[1] = inp;
    assign d[0] = (~st[0]) | (st[1] ^ inp);
endmodule

module outputFn_beh(st,inp,clk,rst,z);
    input[1:0] st;
	input inp,clk,rst;		
    output z;
	reg z;
	
	initial
	   begin
	       z = 1'b0;
	   end
	   
	always @(posedge clk)
	   begin
	       if(rst)
	           z = 1'b0;
	       else
	           z = ((~st[1])&(st[0]&inp)) | (st[1]&((~st[0])&(~inp)));
	   end	
endmodule

module delayElem_beh(inp,clk,rst,out);
    input[1:0] inp;
    input clk,rst;
    output[1:0] out;
    reg[1:0] out;
	
    always @(posedge clk) 
		begin
			if(rst)
				out <= 2'b00;
			else   
				out <= inp;           
		end
endmodule

module test_bench(inp,clk);
    input clk;
    output inp;
	reg inp;
	
    always @(posedge clk)
		begin
			inp = !inp;
		end
endmodule
