///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///																									  ///
///																									  ///
///  Company (Team):		IC5355																  ///
///  Engineers: 			Ujjawal Soni, Sasi Kiran										  ///
/// 																									  ///
///  Create Date:    	15:12:58 11/06/2014 												  ///
///  Submission Date:   23:55:00 11/13/2014 												  ///
///  Design Name: 		Ghost Processor													  ///
///  Module Name:    	main 																	  ///
///  Project Name: 	 	Ghost Processor													  ///
///  Target Devices: 	Xilinx ISIM															  ///
///																									  ///
///																									  ///
///  Description: 		A CPU which performs following operations:				  ///
///							MOV R1 K			MOV R1 R2										  ///
///							INC R1    		DEC R1 K			INC R1 K						  ///
///							ADD R1 R2 R3	SUB R1 R2 R3	MUL R1 R2 R3				  ///
///							AND R1 R2 R3 	OR R1 R2 R3		NOT R1						  ///
///							SL R1 K			SR R1 K											  ///
///							SLC R1 K			SRC R1 K											  ///
///																									  ///
///																									  ///
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

`include "counter.v"
`include "Decoder_4_16.v"
`include "Decoder_2_4.v"
`include "register.v"
`include "Tri_State_Buffer_4_bit.v"
`include "encoder_4_2.v"
`include "increment_by_1.v"
`include "decrement_by_1.v"
`include "increment_by_k.v"
`include "booth_multiplication.v"
`include "and_4bit.v"
`include "or_4bit.v"
`include "not_4bit.v"
`include "left_shift.v"
`include "right_shift.v"
`include "circular_left_shift.v"
`include "circular_right_shift.v"
`include "mux_16_1_4bit.v"
`include "mux_16_1.v"


module main(

	input [9:0] data,
	input reset, w, clock,

	output [3:0] reg01_value,
	output [3:0] reg02_value,
	output [3:0] reg03_value,
	output [3:0] reg04_value,
	
	output [1:0] count,
	output carry,
	output overflow

);


	wire [15:0] I, Fn;
	wire clear, extern_2, extern_4, Ain, Gin, Gout, addsub, done;
	wire [3:0]  T, X, Y, Z, Rin, Rout, InBus, OutBus;

	counter count_cycles (clear, clock, count);
	Decoder_2_4 decTimer (count, 1'b1, T);

	assign clear = reset | done | (~w & T[0]);

	Decoder_4_16 decIn (data[9:6], 1'b1, I);
	Decoder_2_4 decX (data[5:4], 1'b1, X);
	Decoder_2_4 decY (data[3:2], 1'b1, Y);
	Decoder_2_4 decZ (data[1:0], 1'b1, Z);

	assign addsub = I[6];
	assign extern_2 = ( I[11] | I[12] | I[13] | I[14] ) & T[1];
	assign extern_4 = ( I[0] | I[4] ) & T[1];
	
	assign done = T[2] & ( I[0] | I[1] | I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14] )
						| T[3] & ( I[8] | I[9] ) ;//| T[3] & ( I[5] | I[6] | I[7] );

	assign Ain = T[1] & (I[5] | I[6] | I[7] | I[8] | I[9]);
	assign Gin = T[2] & (I[5] | I[6] | I[7]);
	assign Gout = T[3] & (I[5] | I[6] | I[7]);

	assign Rin[0] = ( I[0] | I[1] | I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14]) & T[1] & X[0] 
						| ( I[5] | I[6] | I[7] ) & T[3] & X[0] | ( I[8] | I[9] ) & T[2] & X[0];

	assign Rin[1] = ( I[0] | I[1] | I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14]) & T[1] & X[1] 
						| ( I[5] | I[6] | I[7] ) & T[3] & X[1] | ( I[8] | I[9] ) & T[2] & X[1];

	assign Rin[2] = ( I[0] | I[1] | I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14]) & T[1] & X[2] 
						| ( I[5] | I[6] | I[7] ) & T[3] & X[2] | ( I[8] | I[9] ) & T[2] & X[2];

	assign Rin[3] = ( I[0] | I[1] | I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14]) & T[1] & X[3] 
						| ( I[5] | I[6] | I[7] ) & T[3] & X[3] | ( I[8] | I[9] ) & T[2] & X[3];

	assign Rout[0] = ( I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14] ) & T[1] & X[0] 
						| ( I[1] | I[5] | I[6] | I[7] | I[8] | I[9] ) & T[1] & Y[0] 
						| ( I[5] | I[6] | I[7] | I[8] | I[9] ) & T[2] & Z[0];

	assign Rout[1] = ( I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14] ) & T[1] & X[1] 
						| ( I[1] | I[5] | I[6] | I[7] | I[8] | I[9] ) & T[1] & Y[1] 
						| ( I[5] | I[6] | I[7] | I[8] | I[9] ) & T[2] & Z[1];

	assign Rout[2] = ( I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14] ) & T[1] & X[2] 
						| ( I[1] | I[5] | I[6] | I[7] | I[8] | I[9] ) & T[1] & Y[2] 
						| ( I[5] | I[6] | I[7] | I[8] | I[9] ) & T[2] & Z[2];

	assign Rout[3] = ( I[2] | I[3] | I[4] | I[10] | I[11] | I[12] | I[13] | I[14] ) & T[1] & X[3] 
						| ( I[1] | I[5] | I[6] | I[7] | I[8] | I[9] ) & T[1] & Y[3] 
						| ( I[5] | I[6] | I[7] | I[8] | I[9] ) & T[2] & Z[3];

	assign Fn[0] = I[0] & T[1];
	assign Fn[1] = I[1] & T[1];
	assign Fn[2] = I[2] & T[1];
	assign Fn[3] = I[3] & T[1];
	assign Fn[4] = I[4] & T[1];
	
	assign Fn[5] = I[5] & T[2];
	assign Fn[6] = I[6] & T[2];
	assign Fn[7] = I[7] & T[2];
	assign Fn[8] = I[8] & T[2];
	assign Fn[9] = I[9] & T[2];
	
	assign Fn[10] = I[10] & T[1];
	assign Fn[11] = I[11] & T[1];
	assign Fn[12] = I[12] & T[1];
	assign Fn[13] = I[13] & T[1];
	assign Fn[14] = I[14] & T[1];
	
	wire [3:0] reg_out0, reg_out1, reg_out2, reg_out3;
	
	register reg_R0 ( .value_in(InBus), .reset(reset), .R_in(Rin[0]), .clk(clock), .R_out(Rout[0]),
		.stored_value(reg01_value), .value_out(reg_out0) );
	
	register reg_R1 ( .value_in(InBus), .reset(reset), .R_in(Rin[1]), .clk(clock), .R_out(Rout[1]),
		.stored_value(reg02_value), .value_out(reg_out1) );
	
	register reg_R2 ( .value_in(InBus), .reset(reset), .R_in(Rin[2]), .clk(clock), .R_out(Rout[2]),
		.stored_value(reg03_value), .value_out(reg_out2) );
	
	register reg_R3 ( .value_in(InBus), .reset(reset), .R_in(Rin[3]), .clk(clock), .R_out(Rout[3]),
		.stored_value(reg04_value), .value_out(reg_out3) );

	//A temporary register A
	wire [3:0] reg_a_out;
	register reg_A ( .value_in(OutBus), .reset(reset), .R_in(Ain), .clk(clock), .R_out(1'b1),
		.stored_value(), .value_out(reg_a_out) );
	
	//A tempporary register G
	wire [3:0] reg_g_in, reg_g_out;
	register reg_G ( .value_in(reg_g_in), .reset(reset), .R_in(Gin), .clk(clock), .R_out(Gout),
		.stored_value(), .value_out(reg_g_out) );

	
	wire [1:0] selected_out;
	encoder_4_2 encode_reg (Rout, selected_out);

	mux_4_1_4bit decide ( .a(reg_out0), .b(reg_out1), .c(reg_out2), .d(reg_out3), 
		.s(selected_out), .out(OutBus) );
	
	//external input
	wire [3:0] ex_input_4bit;
	Tri_State_Buffer_4_bit ex_in_4 ( .enable(extern_4), .in(data[3:0]), .out(ex_input_4bit) );
	
	wire [1:0] ex_input_2bit;
	Tri_State_Buffer ex_in_2a ( .enable(extern_2), .in(data[3]), .out(ex_input_2bit[1]) );
	Tri_State_Buffer ex_in_2b ( .enable(extern_2), .in(data[2]), .out(ex_input_2bit[0]) );
	

	//MOVK R1
	wire [3:0] Fout0;
	Tri_State_Buffer_4_bit Mod0 ( .enable(Fn[0]), .in(ex_input_4bit), .out(Fout0) );
	
	//MOVR R1 R2
	wire [3:0] Fout1;
	Tri_State_Buffer_4_bit Mod1 ( .enable(Fn[1]), .in(OutBus), .out(Fout1) );
	
	//INC R1
	wire [3:0] Fout2, Fin2;
	wire c2,o2;
	increment_by_1 ib1 ( .x(OutBus), .s(Fin2), .carry(c2), .overflow(o2));
	Tri_State_Buffer_4_bit Mod2 ( .enable(Fn[2]), .in(Fin2), .out(Fout2) );
	
	//DEC R1
	wire [3:0] Fout3, Fin3;
	wire c3,o3;
	decrement_by_1 db1 ( .x(OutBus), .s(Fin3), .carry(c3), .overflow(o3) );
	Tri_State_Buffer_4_bit Mod3 ( .enable(Fn[3]), .in(Fin3), .out(Fout3) );
	
	//INC R1 K
	wire [3:0] Fout4, Fin4;
	wire c4,o4;
	increment_by_k ibk ( .x(OutBus), .k(ex_input_4bit), .s(Fin4), .carry(c4), .overflow(o4) );
	Tri_State_Buffer_4_bit Mod4 ( .enable(Fn[4]), .in(Fin4), .out(Fout4) );


	//ADD, SUB R1 R2 R3
	wire [3:0] Fout5, Fin5;
	wire cas, oas;
	Addition_Subtraction addition ( .a(reg_a_out), .b(OutBus), .addsub(addsub), .out(Fin5),
		.carry(cas) , .overflow(oas) );
	Tri_State_Buffer_4_bit Mod5 ( .enable(Fn[5]|Fn[6]), .in(Fin5), .out(Fout5) );
	
	//MUL R1 R2 R3
	wire [3:0] Fout7, Fin7;
	wire c7;
	booth_multiplication multiply ( .a(reg_a_out), .b(OutBus), .out(Fin7), .cout(c7) );
	Tri_State_Buffer_4_bit Mod7 ( .enable(Fn[7]), .in(Fin7), .out(Fout7) );

	mux_2_1_4bit gfactor ( .a(Fout7), .b(Fout5), .s(Fn[5]|Fn[6]), .out(reg_g_in) );


	//AND R1 R2 R3
	wire [3:0] Fout8, Fin8;
	and_4bit ander ( .a(reg_a_out), .b(OutBus), .out(Fin8) );
	Tri_State_Buffer_4_bit Mod8 ( .enable(Fn[8]), .in(Fin8), .out(Fout8) );
	
	//OR R1 R2 R3
	wire [3:0] Fout9, Fin9;
	or_4bit orer ( .a(reg_a_out), .b(OutBus), .out(Fin9) );
	Tri_State_Buffer_4_bit Mod9 ( .enable(Fn[9]), .in(Fin9), .out(Fout9) );
	
	//NOT R1
	wire [3:0] Fout10, Fin10;
	not_4bit nott ( .in(OutBus), .out(Fin10) );
	Tri_State_Buffer_4_bit Mod10 ( .enable(Fn[10]), .in(Fin10), .out(Fout10) );


	//SL R1 K
	wire [3:0] Fout11, Fin11;
	wire c11;
	left_shift lsft ( .in(OutBus), .k(ex_input_2bit), .out(Fin11), .carry(c11) );
	Tri_State_Buffer_4_bit Mod11 ( .enable(Fn[11]), .in(Fin11), .out(Fout11) );

	//RL R1 K
	wire [3:0] Fout12, Fin12;
	right_shift rsft ( .in(OutBus), .k(ex_input_2bit), .out(Fin12) );
	Tri_State_Buffer_4_bit Mod12 ( .enable(Fn[12]), .in(Fin12), .out(Fout12) );

	//SLC R1 K
	wire [3:0] Fout13, Fin13;
	circular_left_shift lcsft ( .in(OutBus), .k(ex_input_2bit), .out(Fin13) );
	Tri_State_Buffer_4_bit Mod13 ( .enable(Fn[13]), .in(Fin13), .out(Fout13) );

	//RL R1 K
	wire [3:0] Fout14, Fin14;
	circular_right_shift rcsft ( .in(OutBus), .k(ex_input_2bit), .out(Fin14) );
	Tri_State_Buffer_4_bit Mod14 ( .enable(Fn[14]), .in(Fin14), .out(Fout14) );



	mux_16_1_4bit temp_4bit ( .a0(Fout0), .a1(Fout1), .a2(Fout2), .a3(Fout3), .a4(Fout4), .a5(reg_g_out),
								.a6(reg_g_out), .a7(reg_g_out), .a8(Fout8), .a9(Fout9), .a10(Fout10), .a11(Fout11),
								.a12(Fout12), .a13(Fout13), .a14(Fout14), .a15(4'bzzzz), .s(data[9:6]), .out(InBus) );
								
	
	mux_16_1 final_carry ( .i1(1'b0), .i2(1'b0), .i3(c2&T[1]), .i4(c3&T[1]), .i5(c4&T[1]), .i6(cas&T[2]),
								.i7(cas&T[2]), .i8(c7&T[2]), .i9(1'b0), .i10(1'b0), .i11(1'b0), .i12(c11&T[1]),
								.i13(1'b0), .i14(1'b0), .i15(1'b0), .i16(1'b0),
								.s1(data[9]), .s2(data[8]), .s3(data[7]), .s4(data[6]), .o(carry) );
	
	mux_16_1 final_oflow ( .i1(1'b0), .i2(1'b0), .i3(o2&T[1]), .i4(o3&T[1]), .i5(o4&T[1]), .i6(oas&T[2]),
								.i7(oas&T[2]), .i8(1'b0), .i9(1'b0), .i10(1'b0), .i11(1'b0), .i12(1'b0),
								.i13(1'b0), .i14(1'b0), .i15(1'b0), .i16(1'b0),
								.s1(data[9]), .s2(data[8]), .s3(data[7]), .s4(data[6]), .o(overflow) );

endmodule


////////////////////////////////////////////// THE END ////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////