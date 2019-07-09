// DESCRIPTION: Verilator: Verilog Test module 
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2003 by Wilson Snyder.

`timescale 1 ns/ 1ns

module top (/*AUTOARG*/
   // Outputs
   passed, out_small, out_quad, out_wide,
   // Inputs
   clk, fastclk, reset_l, in_small, in_quad, in_wide
   );

   output passed;
   input  clk;
   input  fastclk;
   input  reset_l;

   output [1:0] out_small;
   output [39:0] out_quad;
   output [69:0] out_wide;
   input [1:0] 	 in_small;
   input [39:0]  in_quad;
   input [69:0]  in_wide;

   wire [1:0] 	 out_small = in_small | {2{reset_l}};
   wire [39:0] 	 out_quad = in_quad | {40{reset_l}};
   wire [69:0] 	 out_wide = in_wide | {70{reset_l}};

   initial begin
      $write("Hello World!\n");
   end

   // Example sub module
   t t (/*AUTOINST*/
	// Outputs
	.passed				(passed),
	// Inputs
	.clk				(clk),
	.fastclk			(fastclk),
	.reset_l			(reset_l));

   // try sys v bus nameing
//   abus Xbus();
   abus Xbus;
//package design_types;
   typedef struct  packed
		  { 
		     logic [ 3:0] GFC; 
		     logic [ 7:0] VPI; 
		     logic [15:0] VCI; 
		     logic        CLP; 
		     logic [ 2:0] T; 
		     logic [ 7:0] HEC; 
//		     logic [ 7:0] Payload [48]; 
		  } uni_t; // UNI cell definition 
//endpackage; // design_types

   typedef enum  logic[15:0]
	     {
	      ADD = 16'h0000,
	      SUB = 16'h0001
	      } my_opcode_t;
   
   typedef enum logic[15:0]
		{
		 REG = 16'h0000,
		 MEM = 16'h0001
		 } my_dest_t;
   
   typedef struct    packed
		     {
			my_opcode_t  opcode; // 16-bit opcode, enumerated type
			my_dest_t    dest; // 16-bit destination, enumerated type
			logic [15:0] opA;
			logic [15:0] opB;
		     } my_opcode_struct_t;
   
   my_opcode_struct_t cmd1;

   my_opcode_struct_t tryoneD[9:0];

   my_opcode_struct_t trytwoD[27:0][9:0];

   my_opcode_struct_t trytwoDa[28][10];
     
   initial begin
      // Access fields by name
      cmd1.opcode = ADD;
      cmd1.dest = REG;
      cmd1.opA = 16'h0001;
      cmd1.opB = 16'h0002;
      
      // Access fields by bit position
      cmd1[63:48] = 16'h0000;
      cmd1[47:32] = 16'h0000;
      cmd1[31:16] = 16'h0003;
      cmd1[15: 0] = 16'h0004;

      // Assign fields at once
      cmd1 = '{SUB, REG, 16'h0005, 16'h0006};
   end // initial begin

   
   
// abus foo[3][4];
   
   cpu one0(Xbus);
   mem two0(Xbus);

   always @*
     $display("Xbus addr %x, data %x",Xbus.addr, Xbus.data);

   genvar i,j;
   generate
      for (i=1; i<=10; i=i+1) begin : memgenx // <-- example block name
	 for (j=1; j<=5; j=j+1) begin : memgeny // <-- example block name
	    mem memx ( .bus(Xbus)   );
	 end
      end
      endgenerate
   

endmodule
