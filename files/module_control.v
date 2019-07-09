`timescale 1ns / 1ps

module module_control( control, clk, reset_n,
		       module_en, module_mode );
   
   input [1:0]	control;
   input 	clk;
   input 	reset_n;

   output 	module_en;
   output [1:0] module_mode;
   
   reg 		module_en;
   reg [1:0] 		module_mode;
   
   
   parameter ZERO = 2'b00;
   parameter LOW  = 2'b01;
   parameter HIGH = 2'b10;
   parameter NORM = 2'b11;

   always @ ( posedge clk or negedge reset_n )
     begin
	if ( !reset_n )
	  begin
	     module_en <= 1'b0;
	     module_mode[1:0] <= 2'b0;
	  end
	else
	  begin
	     case ( control )
	       ZERO: 
		 begin
		    module_en <= 1'b0;
		    module_mode[1:0] <= ZERO;
		 end
	       LOW:  
		 begin
		    module_en <= 1'b1;
		    module_mode[1:0] <= LOW;
		 end
	       HIGH:
		 begin
		    module_en <= 1'b1;
		    module_mode[1:0] <= HIGH;
		 end
	       NORM:
		 begin
		    module_en <= 1'b1;
		    module_mode[1:0] <= NORM;
		 end
	     endcase // case ( control )
	  end // else: !if( !reset_n )
     end // always @ ( posedge clk or negedge reset_n )
   
endmodule // data_control

  
