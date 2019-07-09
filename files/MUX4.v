module MUX4(A, B, C, D, Sel, Out);
  parameter SIZE = 32;
  input [SIZE-1:0] A, B, C, D;
  input [1:0] Sel;
  output [SIZE-1:0] Out;
  assign Out = (Sel==2'b0) ? A : 
  ( 
  	(Sel==2'b01) ? B :  
  	( 
  		(Sel==2'b10) ? C :  
  		( 
  			(Sel==2'b11) ? D : 32'b0
  		)
  	) 
  )
  	;
endmodule
   
