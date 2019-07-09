/*********************************************
 *	Memmory Elements
 *********************************************/


/*	
 *	D Flip-Flop
 *	Size: 18
 */
module DFF (Q, D, clk);
	output Q;
	input D, clk;
	reg Q;
	always @ (posedge clk)
		Q <= #3 D;

	specify
	$setup (D, posedge clk, 1.0);
	$hold	(posedge clk, D, 0.4);
	endspecify
endmodule


/*	
 *	D Flip-Flop with Clear 
 *	"clr" asserted high
 *	Size: 22
 */
module DFF_C (Q, D, clr, clk);
	output Q;
	input D, clr, clk;
	reg Q;
	always @ (posedge clk) begin
		Q <= #3.2 (clr) ? 1'b0 : D;
	end
	

	specify
	$setup (D, posedge clk, 1.0);
	$hold	(posedge clk, D, 0.4);
	endspecify
	
endmodule

/*	
 *	Simple Latch
 *	Size: 10
 */
module LATCH (Q, D, clk);
	output Q;
	input D, clk;
	reg Q;
	always @ (clk or D)
		Q <= #2.2 (clk) ? D : Q;

		
endmodule

/*	
 *	Scan Flip-Flop
 *	When "tst" asserted low, then equivalent
 *	to a DFF.
 *	When "tst" asserted high, acts as DFF
 *	with "SCIN" as the input and Q as the output.
 *	Size: 28
 */
module SDFF (Q, D, SCIN, tst, clk);
	output Q;
	input D, SCIN, tst, clk;
	reg Q;
	always @ (posedge clk) begin
		Q <= #4 (tst) ? SCIN : D;
	end
	
	specify
	$setup (SCIN, posedge clk, 1.0);
	$hold	(posedge clk, SCIN, 0.4);
	$setup (D, posedge clk, 1.0);
	$hold	(posedge clk, D, 0.4);
	endspecify

endmodule

/*
 *	Scan Flip-Flop as above, but with clearing
 *	ability with "clr" asserted high.
 *	Size: 32
 */
module SDFF_C (Q, D, SCIN, tst, clr, clk);
	output Q;
	input D, SCIN, tst, clr, clk;
	reg Q;
	always @ (posedge clk) begin
		if (clr) 
			Q <= # 4 (tst) ? SCIN : D;
		else
			Q <= #3 1'b0;
	end
	specify
	$setup (SCIN, posedge clk, 1.0);
	$hold	(posedge clk, SCIN, 0.4);
	$setup (D, posedge clk, 1.0);
	$hold	(posedge clk, D, 0.4);
	endspecify
endmodule

/***********************
 * Basic Logic Gates
 **********************/

module THRU (Y, A);
	output Y;
	input A;
	assign Y=A;
endmodule

/* Size: 4
*/
module BUF (Y,A);
	output Y;
	input A;
	buf #(0.5, 0.5) g(Y,A);
endmodule

/* Size: 2
*/
module INV (Y,A);
	output Y;
	input A;
	not #(0.3, 0.3) g(Y,A);
endmodule

/* Size: 4
*/
module INV2X (Y,A);
	output Y;
	input A;
	not #(0.5, 0.5) g(Y,A);
endmodule

/* Size: 8
*/
module INV4X (Y,A);
	output Y;
	input A;
	not #(1.1, 1.1) g(Y,A);
endmodule

/*Size: 4*/
module NOR2 (Y, A, B);
	output Y;
	input A, B;
	nor #(1.3, 1.0)g(Y, A, B);
endmodule

/*Size: 6*/
module NOR3 (Y, A, B, C);
	output Y;
	input A, B, C;
	nor #(1.8, 1.5) g( Y, A, B, C );
endmodule

/*Size: 8*/
module NOR4 (Y, A, B, C, D);
	output Y;	
	input A, B, C, D;
	nor #(3.7, 3.2) g( Y, A, B, C, D );
endmodule

/*Size: 4*/
module NAND2 (Y, A, B);
	output Y;
	input A, B;
	nand #(1.2, 1.1)g(Y, A, B);
endmodule

/*Size: 6*/
module NAND3 (Y, A, B, C);
	output Y;
	input A, B, C;
	nand #(1.8, 1.5) g( Y, A, B, C );
endmodule

/*Size: 8*/
module NAND4 (Y, A, B, C, D);
	output Y;
	input A, B, C, D;
	nand #(3.5, 3.1)g( Y, A, B, C, D );
endmodule

/*Size: 6*/
module OR2 (Y, A, B);
	output Y;
	input A, B;
	or #(1.5, 1.2) g(Y, A, B);
endmodule

/*Size: 8*/
module OR3 (Y, A, B, C);
	output Y;
	input A, B, C;
	or # (2.2, 2.0) g(Y, A, B, C);
endmodule

/*Size: 6*/
module AND2 (Y, A, B);
	output Y;
	input A, B;
	and # (1.4, 1.1) g(Y, A, B);
endmodule

/*Size: 8*/
module AND3 (Y, A, B, C);
	output Y;
	input A, B, C;
	and # (2.1, 2.0) g( Y, A, B, C );
endmodule

/*Size: 8*/
module XOR2 (Y, A, B);
	output Y;
	input A, B;
	xor #(2.6, 2.4) g(Y,A, B);
endmodule

/*Size: 8*/
module XNOR2 (Y, A, B);
	output Y;
	input A, B;
	xnor #(2.6, 2.4) g(Y,A, B);
endmodule


/**************************************
 * 	Less Popular but Very Useful Logic 
 **************************************/

/* Tri-State Buffer
 * Much like a transmition gate, 
 * by asserting "EN", the value of 
 * "A" goes to "Y". Otherwise, a floating
 * output is kept.
 * Size: 6
 */
module TRIBUF (Y, A, EN);
	output Y;
	input A, EN;
	bufif1 #(1.0, 0.8) g(Y,A,EN);
endmodule

/*	Tri-State Inverter
 *	Acts as the tri-state buffer described above,
 *	only when "EN" is asserted, Y = A_bar.
 *	Size: 4
 */
module TRIINV (Y, A, EN);
	output Y;
	input A, EN;
	bufif1 #(1.0, 0.8) g(Y,~A,EN);
endmodule

/*	2-input Multiplexer
 *	When 
 *		sel=0, Y = A
 *		sel=1, Y = B
 *	Size: 10
 */
module MUX2 (Y, sel, A, B);
	output Y;
	input A, B, sel;
	reg Y1;
	always @ (sel or A or B)
		Y1 = (sel) ? B : A;
	buf #(2.7,2.5) g(Y,Y1);
endmodule

/*	And-Or-Inverter
 *	Y = ~ ( (A+B)*C )
 *	Size: 6
 */
module OAI21 (Y, A, B, C);
	output Y;
	input A, B, C;
	reg Y1;
	always @ (A or B or C)
		Y1 = ~((A|B)&C);
	buf #(2.2, 1.9) g(Y,Y1);	
endmodule

/*	Or-And-Inverter
 *	Y = ~ (AB + C)
 *	Size: 6
 */
module AOI21 (Y, A, B, C);
	output Y;
	input A, B, C;
	reg Y1;
	always @ (A or B or C)
		Y1 = ~ ( (A&B) | C );
	buf #(2.3, 1.9) g(Y, Y1);	
endmodule

/*	And-Or-Inverter
 *	Y = ~( (A+B)(C+D) )
 *	Size: 8
 */
module OAI22 (Y, A, B, C, D);
	output Y;
	input A, B, C, D;
	reg Y1;
	always @ (A or B or C or D)
		Y1 = ~ ( (A|B) & (C|D) );
	buf #(2.5,2.3) g(Y,Y1);	
endmodule

/*	And-Or-Inverter
 *	Y = ~ (AB + CD)
 *	Size: 8
 */
module AOI22 (Y, A, B, C, D);
	output Y;
	input A, B, C, D;
	reg Y1;
	always @ (A or B or C or D)
		Y1 = ~ ( (A&B) | (C&D) );
	buf #(2.5, 2.3) g(Y,Y1);	
endmodule

/*	And-Or-Inverter
 *	Y = ~ ( (A+B)*CD )
 *	Size: 8
 */
module OAI211 (Y, A, B, C, D);
	output Y;
	input A, B, C, D;
	reg Y1;
	always @ (A or B or C or D)
		Y1 = ~ ( (A|B) & C & D );
	buf #(2.5, 2.4) g(Y,Y1);	
endmodule	

/*	And-Or-Inverter
 *	Y = ~ (AB + C + D)
 *	Size: 8
 */
module AOI211 (Y, A, B, C, D);
	output Y;
	input A, B, C, D;
	reg Y1;
	always @ (A or B or C or D)
		Y1 = ~ ( (A&B) | C | D);
	buf #(2.7, 2.5) g(Y,Y1);	
endmodule



