//vDFF
//module is an n bit register, based on a d flip flop
//code is based on slideset 5, Verilog for FSM by Dr. Tor Aamodt
//inputs:
//	in 		- next state of the register, copied on rising edge of clk
//	clk 	- clock signal for register
//outputs:
//	out		- current state of the register
//parameters:
//	n 		- how many bits the register can store
module vDFF(clk, in, out) ;

	parameter n = 1;  		// width
	input clk ;				//clock
	input [n-1:0] in ;		//input of 
	output [n-1:0] out ;	//outputs the current state of the register
	reg [n-1:0] out ;		

	//update on rising edge of clk
	always @(posedge clk)
		out = in ;			//assign out to  in, which updates the state on rising edge
		
endmodule //vDFF

module RArb(r, g) ;

	parameter n=8 ;
	input  [n-1:0] r ;
	output [n-1:0] g ;
	wire   [n-1:0] c = {1'b1,(~r[n-1:1] & c[n-1:1])} ;
	assign g = r & c ;
  
endmodule // RArb

module ArbStage(r, cin, g, cout) ;
	
	input  r, cin ;
	output g, cout ;
	
	assign cout = ~r & cin ;
	assign g = r & cin ;

endmodule//ArbStage

//Decoder
//n to m binary to one hot decoder module
//inputs:
// 	a - binary input   (n bits wide)
//outputs:
//	b - one hot output (m bits wide)
//parameters:
//	n - width of the binary input bus
//	m - width of the one hot output bus

module Decoder(a, b) ;
	parameter n=2 ;
	parameter m=4 ;

	input  [n-1:0] a ;				//input, in binary code
	output [m-1:0] b ;				//output, in one hot code

	wire [m-1:0] b = 1 << a ;		//shift a single one a times
	
endmodule//Decoder

// 3:1 multiplexer with binary select (arbitrary width)
module Muxb3(a2, a1, a0, sb, b) ;

	parameter k = 1 ;
	
	input [k-1:0] a0, a1, a2 ;  		// inputs
	input [1:0]   sb ;         			// binary select
	output[k-1:0] b ;
	wire  [2:0]   s ;
  
	Decoder #(2,3) d(sb,s) ; 				// Decoder converts binary to one-hot   
	Mux3 #(k)  m(a2, a1, a0, s, b) ; 	// multiplexer selects input 

endmodule//Muxb3

module Muxb4(a3, a2, a1, a0, sb, b) ;

	parameter k = 1 ;
	
	input [k-1:0] a0, a1, a2, a3;  		// inputs
	input [1:0]   sb ;         			// binary select
	output[k-1:0] b ;
	wire  [3:0]   s ;
  
	Decoder #(2,4) d(sb,s) ; 				// Decoder converts binary to one-hot   
	Mux4 #(k)  m(a3, a2, a1, a0, s, b) ; 	// multiplexer selects input 

endmodule//Muxb4
//Muxb8
//8:1 multiplexer with binary select and arbitrary width
//inputs:
//	a0-a7 	- inputs are select from
//	Sb 		- binary select code, controls which input is copied to output
//outputs:
//	b 		- output of the multiplexer, equal to the select input
//parameters:
//	k 		- width of the input and output buses
module Muxb8(a7, a6, a5, a4, a3, a2, a1, a0, sb, b) ;

	parameter k = 1 ;
	
	input [k-1:0] a0, a1, a2, a3, a4, a5, a6, a7 ; 			// inputs
	input [2:0]   sb ;   //should this be [2:0] ? -JB     	// binary select
	output[k-1:0] b ;										// output
	wire  [7:0]   s ;										// one hot select
  
	Decoder #(3,8) d(sb,s) ; 								// Decoder converts binary to one-hot   
	Mux8 #(k)  m(a7, a6, a5, a4, a3, a2, a1, a0, s, b) ; 	// multiplexer selects input 

endmodule//Muxb8

//Mux8
//1:8 multiplexer with one hot select
//inputs:
//	a0-a7	- inputs are selected from
//	s 		- one hot select code, controls which 
//			  input is copied to output
//outputs:
// 	b 		- output of the multiplexer, equal to the selected input
//parameter:
//	k		- width of the input and output buses
module Mux8(a7, a6, a5, a4, a3, a2, a1, a0, s, b) ;
  parameter k = 1 ;
  input [k-1:0] a0, a1, a2, a3, a4, a5, a6, a7 ; 	// inputs
  input [7:0]   s ; 								// one-hot select
  output[k-1:0] b ;									// output
  wire [k-1:0] b = ({k{s[0]}} & a0) | 				// and each input with its one hot select
                   ({k{s[1]}} & a1) |				// or them together to get the output
                   ({k{s[2]}} & a2) |
				   ({k{s[3]}} & a3) |
				   ({k{s[4]}} & a4) |
				   ({k{s[5]}} & a5) |
				   ({k{s[6]}} & a6) |
				   ({k{s[7]}} & a7) ;
endmodule//Mux8

module Mux3(a2, a1, a0, s, b) ;
  parameter k = 1 ;
  input [k-1:0] a0, a1, a2 ;		// inputs
  input [2:0]   s ; 					// one-hot select
  output[k-1:0] b ;
  wire [k-1:0] b = ({k{s[0]}} & a0) | 
                   ({k{s[1]}} & a1) |
                   ({k{s[2]}} & a2) ;
endmodule//Mux3

module Mux4( a3, a2, a1, a0, s, b) ;
  parameter k = 1 ;
  input [k-1:0] a0, a1, a2, a3;		// inputs
  input [3:0]   s ; 					// one-hot select
  output[k-1:0] b ;
  wire [k-1:0] b = ({k{s[0]}} & a0) | 
                   ({k{s[1]}} & a1) |
                   ({k{s[2]}} & a2) |
				   ({k{s[3]}} & a3);
endmodule//Mux3

module Mux2(a1, a0, s, b) ;
  parameter k = 1 ;
  input [k-1:0] a0, a1 ;  // inputs
  input [2:0]   s ; // one-hot select
  output[k-1:0] b ;
  wire [k-1:0] b = ({k{s[0]}} & a0) | 
                   ({k{s[1]}} & a1);
endmodule//Mux2


//AddSub
//module add a+b or subtract a-b, check for overflow
//based on code from slideset 6, building blocks, by Dr. Tor Aamodt 
//inputs:
//	a 		- first input to be added or subtracted
//	b 		- second input to be added or subtracted
//  sub 	- controls wether the cicuit adds(1'b0) or subtracts(1'b1)
//outputs:
//	s	 	- the sum or difference of a and b
// 	ovf		- 1'b1 if the operation caused an overflow, otherwise 1'b0
//parameters:
//	n		- how many bits the circuit inputs/outputs

module AddSub(a,b,sub,s,ovf) ;
  parameter n = 8 ;
  input [n-1:0] a, b ;		// inputs to be added or subbed
  input sub ;           	// subtract if sub=1, otherwise add
  output [n-1:0] s ;		// sum or difference of a and b
  output ovf ;          	// 1 if overflow
  wire c1, c2 ;         	// carry out of last two bits
  wire ovf = c1 ^ c2 ;  	// overflow if signs don't match

  // add non sign bits
  Adder #(n-1) ai(a[n-2:0],b[n-2:0]^{n-1{sub}},sub,c1,s[n-2:0]) ;
  // add sign bits
  Adder #(1)   as(a[n-1],b[n-1]^sub,c1,c2,s[n-1]) ;
endmodule//AddSub

//AddSubNoC
//module add a+b or subtract a-b, no check for overflow
//based on code from slideset 6, building blocks, by Dr. Tor Aamodt 
//inputs:
//	a 		- first input to be added or subtracted
//	b 		- second input to be added or subtracted
//  sub 	- controls wether the cicuit adds(1'b0) or subtracts(1'b1)
//outputs:
//	s	 	- the sum or difference of a and b
//parameters:
//	n		- how many bits the circuit inputs/outputs
module AddSubNoC(a,b,sub,s) ;
  parameter n = 8 ;
  input [n-1:0] a, b ;		// inputs to be added or subbed
  input sub ;           	// subtract if sub=1, otherwise add
  output [n-1:0] s ;		// sum or difference of a and b
  wire c1, c2 ;         	// carry out of last two bits

  // add non sign bits
  Adder #(n-1) ai(a[n-2:0],b[n-2:0]^{n-1{sub}},sub,c1,s[n-2:0]) ;
  // add sign bits
  Adder #(1)   as(a[n-1],b[n-1]^sub,c1,c2,s[n-1]) ;
endmodule//AddSubNoC

//Adder
//module is a multi-bit ripple adder using gates
//based on code from slideset 6, building blocks, by Dr. Tor Aamodt 
//inputs:
//	a 		- first input to be added
//	b 		- second input to be added
// 	cin 	- carry in(typically 0 for normal addition)
//outputs:
//	s	 	- the sum of a and b
// 	cout	- carry output(useful for chaining and overflow detection)
//parameters:
//	n		- how many bits the circuit inputs/outputs

module Adder(a,b,cin,cout,s) ;
  parameter n = 8 ;
  
  input [n-1:0] a, b ;							//inputs to be added
  input cin ;									//carry in
  output [n-1:0] s ;							//sum of a and b
  output cout ;									//carry out

  wire [n-1:0] p = a ^ b ;						
  wire [n-1:0] g = a & b ;
  wire [n:0]   c = {g | (p & c[n-1:0]), cin} ;	//internal carry bus
  wire [n-1:0] s = p ^ c[n-1:0] ;				//output
  wire         cout = c[n] ;					//carry out the MSB of the carry bud
endmodule//Adder

//LoadRegister
//module is a register that only allows its state to be updated if load = 1
//inputs:
//	in 		- input of the register, copied to state on rising edge if load = 1
// 	load 	- controls whether the register allows the state to be changed
//	clk 	- clock signal for the register
//outputs:
//	out 	- outputs the current state of the register
//parameters:
//	n 		- how many bits the load register can store

module LoadRegister(in, out, load, clk);
	parameter  n = 1;
	
	input[n-1:0] in;		//input of the load register
	input load, clk;		//load control signal and clock for the vDFF
	output[n-1:0] out;		//outputs state of the register
	wire[n-1:0] regInput;	//input of the vDFF
	
	//multiplexer, assigns the register input to in. 
	//otherwise it keeps the registers state the same
	assign regInput = load ? in : out;			
	
	//creates an n-bit register
	vDFF #(n) register(clk, regInput, out);

endmodule

module counter(out, load, reset, clk);
	parameter n = 1;

	input load, reset, clk;
	output[n-1:0] out;
	wire[n-1:0] nextState, state, statePlus1;
	
	assign statePlus1 = state+1;
	assign nextState = reset ? 0:statePlus1;
	assign out = state;
	
	LoadRegister #(n) register(nextState, state, load, clk);
	
endmodule

module RAM(clk,read_address,write_address,write,din,dout);
  parameter data_width = 32; 
  parameter addr_width = 4;
  parameter filename = "lab8fig2.txt";

  input clk;
  input [addr_width-1:0] read_address, write_address;
  input write;
  input [data_width-1:0] din;
  output [data_width-1:0] dout;
  reg [data_width-1:0] dout;

  reg [data_width-1:0] mem [2**addr_width-1:0];

  initial $readmemb(filename, mem);

  always @ (posedge clk) begin
    if (write)
      mem[write_address] <= din;
    dout <= mem[read_address]; // dout doesn't get din in this clock cycle 
                               // (this is due to Verilog non-blocking assignment "<=")
  end 
endmodule