//Alex Johnson ECEN 2350 Spring 2018 Project 1
//top module to decode inputs into different modules and select the appropriate outputs
module Project_1( input [1:0]KEY,
						input [9:0]SW,input CLK,
						output [9:0]LED,
						output [7:0]HEXOUT_0,output [7:0]HEXOUT_1, output [6:0]HEXOUT_2, output [6:0]HEXOUT_3);
	reg [3:0]module_select;
	
	wire [7:0]arithmetic_out;
	wire [9:0]math_carry;
	Arithmetic math_block(SW[9:8],SW[7:0],math_carry[9],arithmetic_out[7:0]);
	
	wire [9:0]logical_out;
	Logical logic_block(SW[9:8],SW[7:0],logical_out[7:0]);
	
	wire [3:0]compare_out;
	Comparison compare_block(SW[9:8],SW[7:0],compare_out[3:0]);
	
	wire [9:0]magic_output;
	Magic(CLK, magic_output[9:0]);
	
	//display what the sub-module selection is on HEX_2
	SevenSegment HEX2({1'b0,1'b0,SW[9],SW[8]},HEXOUT_2[6:0]);
	
	//display what module number the user is in on HEX_3
	SevenSegment HEX3(module_select[3:0],HEXOUT_3[6:0]);
	//Use the first button to cycle one way through the different modules
	always@(posedge KEY[0],posedge KEY[1])
	begin
			module_select = (module_select + 1) % 4;
	end
	
	//use multiplexors to switch between the different outputs on the first two HEX displays depending on the module selection
	wire [3:0]HEX0_in;
	MUX HEX0_MUX({4'b0000,compare_out[3:0],logical_out[3:0],arithmetic_out[3:0]},module_select[1:0],HEX0_in[3:0]);
	defparam HEX0_MUX.n = 4;
	SevenSegment HEX0(HEX0_in[3:0],HEXOUT_0[6:0]);
	
	wire [3:0]HEX1_in;
	MUX HEX1_MUX({4'b0000,4'b0000,logical_out[7:4],arithmetic_out[7:4]},module_select[1:0],HEX1_in[3:0]);
	defparam HEX1_MUX.n = 4;
	SevenSegment HEX1(HEX1_in[3:0],HEXOUT_1[6:0]);
	
	//if the processor is in arithmetic mode, have the most significant decimal point match the multiplication carry,
	//and least significant match the division carry
	assign HEXOUT_0[7] = ~(~module_select[0] & ~module_select[1] & SW[9] & SW[8] & math_carry[9]);
	assign HEXOUT_1[7] = ~(~module_select[0] & ~module_select[1] & SW[9] & ~SW[8] & math_carry[9]);
	
	//use a 10 bit multiplexor to switch between the different outputs of the LEDs depending on the module selection
	MUX LED_MUX({magic_output[9:0],10'b0000000000,logical_out[9:0],math_carry[9:0]},module_select[1:0],LED[9:0]);
	defparam LED_MUX.n = 10;
	
endmodule

