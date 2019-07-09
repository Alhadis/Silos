
module TOP(		   		   
		   );
   wire a;
   
   
   Sub001 sub001(.a(a));
   OutModule out_mod(.OutSignal(),.OutSignal0());   
   
   InModule in_mod0 (.InSignal(3'b0),.InSignal0(1'b0));
   InModule in_mod1 (.InSignal(3'b0),.InSignal0(1'b0));

endmodule // TOP

module Sub001(a);
   output a;
   wire   a;
   wire   c;
   
   OutModule2 out_mod(.OutSignal(),.OutSignal2());   
   
   Sub002 sub002(.b(c));   
endmodule // Sub001

module Sub002(b);
   output b;
   wire   e;   
   Sub003 sub003(.c(b), .d(e));
endmodule // Sub002

module Sub003(c,d);
   output c;
   output d;
   wire   [2:0] xxx;
   
   Sub004 sub004(.y(),.xxx(xxx));
endmodule // Sub002


module Sub004(y,xxx);
   output y;
   wire c;
   output [2:0] xxx;
   
   wire [2:0] xxx;
   wire [2:0] KKK;
   wire [2:0] addKKK;
   
   
   
   Sub005 sub005(.d(c),.f(xxx[2]));
   Connect con(.DDD(c));

   wire [2:0]	  UUU;
   InModule in_mod(.InSignal(UUU),.InSignal0(1'b0));
   OutModule out_mod(.OutSignal(UUU),.OutSignal0());
   
   InModule in_mod2 (.InSignal(KKK),.InSignal0(addKKK[2]));
   OutModule out_mod2 (.OutSignal(KKK),.OutSignal0(addKKK[2]));

   InModule in_mod3 (.InSignal(KKK),.InSignal0(1'b0));
   
endmodule // Sub003

module Sub005(d,f);
   output d;
   output f;   
endmodule // Sub005


module Connect(DDD);
   input DDD;   
endmodule // Connect


module InModule(InSignal,InSignal0);   
   input [2:0] InSignal;
   input 	   InSignal0;   
endmodule // InModule

module OutModule(OutSignal,OutSignal0);
   output [2:0] OutSignal;
   output 		OutSignal0;   
endmodule // OutModule

module OutModule2(OutSignal,OutSignal2);
   output [2:0] OutSignal;
   output 		OutSignal2;   
endmodule // OutModule
