module FA_struct (/*AUTOARG*/
   // Outputs
   Sum, Cout,
   // Inputs
   A, B, Cin
   ) ;
   input  A, B, Cin;
   output Sum, Cout;
   wire   S1, T1, T2, T3;

   xor x1(S1, A, B);
   xor x2(Sum, S1, Cin);
   and a1(T1, A, B);
   and a2(T2, A, Cin);
   and a3(T3, B, Cin);
   or  o1(Cout, T1, T2, T3);  
     
endmodule // FA

module FA_test (/*AUTOARG*/) ;
   reg pa, pb, pcin;
   wire pcout, psum;
   
   FA_struct fa(psum, pcout, pa, pb, pcin);
   initial begin
      $dumpfile("fa_test.vcd");
      $dumpvars(0, pa);
      $dumpvars(0, pb);
      $dumpvars(0, pcin);
      $dumpvars(0, psum);
      $dumpvars(0, pcout);
      
      pa = 0;
      pb = 0;
      pcin = 0;

      #5 pcin = 1;
      #5 pb = 1;
      #5 pcin = 0;
      #5 pa = 1;
      #5 pcin = 1;
      #5 pb = 0;
      #5 pcin = 0;      
   end
   initial
   $monitor("time=%t, a=%b, b=%b, cin=%b, sum=%b,cout=%b", $time, pa, pb, pcin, psum, pcout);
        
endmodule // FA_test
