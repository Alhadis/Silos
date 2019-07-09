//memory commands
`define MREAD 		2'b00		//read from memory
`define MWRITE		2'b01		//write to memory

//IO memory locations
`define SW_BASE 	9'h140		//switches memory locations
`define LEDR_BASE	9'h100		//LED memory locations

//hex macros
`define zero   	7'b1000000
`define one    	7'b1111001
`define two    	7'b0100100
`define three  	7'b0110000
`define four   	7'b0011001
`define five   	7'b0010010
`define six   	7'b0000010
`define seven 	7'b1111000
`define eight  	7'b0000000
`define nine   	7'b0011000
`define A		7'b0001000
`define b		7'b0000011
`define C		7'b1000110
`define d 		7'b0100001
`define E		7'b0000110
`define F		7'b0001110

//top level module for the lab 7 iteration of the simple RISC Machine. This includes our CPU with MOV, ALU, HALT, LDR 
//and STR instructions. It also includes a RAM module, with 8-bit address bus and 16-bit data bus. It also includes 
//the I/O module, which allows it to write and read from switches/LEDs
//inputs:
//	KEY 		- push buttons 
//	SW[7:0]		- inputs to the I/O
//  SW[9] 		- controls whether HEX0-3 displays read_data(0) or write_data(1)
//outputs:
// 	LEDR[7:0]	- LEDs on the DE1
//	LEDR[9]		- on when accessing I/O, off when accessing RAM
//	HEX0-3		- displays read_data or write_data
// 	HEX4-5		- displays the mem_address, the point in memory we're accessing
module lab8_top(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5, CLOCK_50);
	parameter filename = "data.txt";
	input CLOCK_50; 
	input [3:0] KEY;
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	wire [8:0] mem_addr;
	
	wire [1:0] m_cmd;
	wire [15:0] read_data, write_data, dout, hexOut, ramData;
	wire  write, msel, e, clk, reset, h;

	//simple RISC CPU, KEY[0], KEY[1] is reset
	cpu CPU(clk,reset,read_data,write_data,mem_addr,m_cmd, h);

	//System memory for the simple RISC machine 
	RAM #(16, 8, filename)MEM(clk,mem_addr [7:0],mem_addr [7:0],write,write_data,dout);
	
	//Input and output for the simple RISC machine
	IO io(m_cmd, mem_addr, read_data, write_data, SW[7:0], LEDR[7:0], clk, reset);

	//hexdisplay drivers 
	sseg2 	H0(hexOut[3:0],   HEX0);   						//first digit of RAM
	sseg2 	H1(hexOut[7:4],   HEX1);						//second digit of RAM
	sseg2 	H2(hexOut[11:8],  HEX2);						//third digit of RAM
	sseg2	H3(hexOut[15:12], HEX3);						//four digit of RAM
	sseg2   H4(mem_addr[3:0], HEX4);						//first digit of the memory address
	sseg2   H5(mem_addr[7:4], HEX5);						//second digit of the memory address
	
	assign clk =  CLOCK_50;   //~KEY[0];									//invert the button, as it is normally high
	assign reset = ~KEY[1];									//invert the button, as it is normally high
	
	//assign LEDR[8] 		= 1'b0;								//LED8 should always be off
	//assign LEDR[9] 		= mem_addr[8];			           //LED9 should be on when accessing I/O
	assign LEDR[8] = h;                                      //LEDR[8] should indicate the halt state
	assign LEDR[9] = 1'b0;   								 //to avoid complaints
	
	assign msel 		= 1'b0		== mem_addr [8:8];		//memory select, allows selecting between RAM and I/O
	assign write 		= (`MWRITE 	== m_cmd) & msel;		//write, high when M_cmd is write and msel is high
	assign e 		= (`MREAD 	== m_cmd) & msel;		//read, high when M_cmd is read and msel is high

	//tristate driver
	assign read_data	= e 	? dout 		: 16'bzzzzzzzzzzzzzzzz;
	assign hexOut		= SW[9] ? read_data	: write_data;	//select between displaying read and write data with switch 9
	
	
	
endmodule 

//I/O module for the simple RISC machine. ALlows the RISC CPU to read data from switches and write to LEDS
//inputs:
//	write_data 	- Data output to the RAM
//	mem_addr	- Memory address to read/write to
//	m_cmd		- memory command to use(read/write)
//	SW			- the first 7 switches on the DE1
//	clk 		- clock signal, LED register updates on rising edge
// 	reset		- returns LED register to all 0s when high
//outputs:
//	read_data 	- outputs the state of of the switches when the cpu tries to access it 
//				  otherwise output is Hi-Z
//	LEDR		- LEDs on the DE1, controlled by LEDregister
module IO(m_cmd, mem_addr, read_data, write_data, SW, LEDR,clk, reset);
	input[15:0] write_data;									
	input[8:0] mem_addr;
	input[7:0] SW;
	input[1:0] m_cmd;
	input clk, reset;
	
	output[15:0] read_data;
	output[7:0] LEDR;
	
	wire[7:0] nextState;
	wire getSwitches, setLEDs;
	
	assign getSwitches 		= (m_cmd == `MREAD)&(mem_addr == `SW_BASE);				//when high, value of switches is outputted to read_data
	assign setLEDs			= (m_cmd == `MWRITE)&(mem_addr == `LEDR_BASE);			//when high, the value of write_data is copied to LED register
	
	assign read_data	 	= getSwitches?{8'b00000000, SW}:16'bzzzzzzzzzzzzzzzz;	//tristate driver, only allows value of switches through when you read from h140

	assign nextState 		= reset ? 8'b00000000 : write_data[7:0];						//LED register reset
	
	LoadRegister #(8) LEDregister (nextState, LEDR, setLEDs, clk);					//takes in the value from memory and outputs to the LEDS on the DE1
	
endmodule

//pass in a 4 bit bus and outputs the hex value on the seven segment display of the DE1
//inputs:
//	in 		- 4 bit input, value of this us is display in hex
//outputs:
//	segs	- Bus drives the 7-segment display
module sseg2(in,segs);
	input [3:0] in;
	output reg [6:0] segs;
	
	always @(*) begin
		//assign segs to display the hex value of in
		case(in)
			0:  segs = `zero;
			1:  segs = `one;
			2:  segs = `two;
			3:  segs = `three;
			4:  segs = `four;
			5:  segs = `five;
			6:  segs = `six;
			7:  segs = `seven;
			8:	segs = `eight;
			9:	segs = `nine;
			10:	segs = `A;
			11: segs = `b;
			12: segs = `C;
			13: segs = `d;
			14: segs = `E;
			15: segs = `F;
		endcase
	end
endmodule




