// CSCI 320 - Computer Architecture
// Lab 3 - 9/17/13
// Author: Yifan Ge
//
// Exercise 3
// Modified the original sign_test() module.
// Take 16-bit value A and 8-bit value B. Output 16-bit sum. 

module sign_test();
	always begin: main
		reg [15:0] A;
		reg [7:0]  B;
		reg [15:0] b;
	
		A = 10;
		B = -10;
		b = {{8{B[7]}},B}; 
		$display ("%d + %d = %d", A, $signed(B), A + b);
		$finish;
		#1;
	end
endmodule
