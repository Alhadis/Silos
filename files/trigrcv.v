`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		 ITEP
// Engineer: 		 SvirLex
// 
// Create Date:    16:26:54 04/24/2015 
// Design Name: 	 fpga_main, fpga_chan
// Module Name:    trigrcv 
// Project Name: 	 wfd125
// Revision 0.01 - File Created
// Additional Comments: 
//		recieves serial trigger with bit frequency clk/TOKEN_CLKDIV
//		pulses tok_rdy when finished
//		checks that two sequential bits in the middle of bit interval coinside,
//		that the total parity is correct and that stop bit is present, pulses tok_err accordingly
//
//////////////////////////////////////////////////////////////////////////////////
module trigrcv # (
		parameter			TOKEN_CLKDIV = 4,			// (>= 4, <= 16)
		parameter			TOKEN_LENGTH = 10			//	only token itself (<= 10), transmission will also include start/stop and par
)
(
    input 							clk,
    input 							ser_trig_in,
    output [TOKEN_LENGTH-1:0] token,
    output reg 					tok_rdy,
    output reg 					tok_err
    );

	localparam BIT_SENS = TOKEN_CLKDIV - (TOKEN_CLKDIV/2 - 1);

	reg 							ser_trig = 0;	// resampled input serial trigger
	reg [TOKEN_LENGTH+2:0]	ser_trg = 0;	// shift reg for serial token, 3 bits longer than token length
	reg [3:0]					ser_cnt = 0;	// counter of transmitted token bits
	reg [3:0]					ser_div = 0;	// conter of frq divider for token transmission
	reg							ser_err = 0;	// error flag
	wire                    parity_res;		// resulting parity
	
	assign token = {ser_trg[TOKEN_LENGTH:TOKEN_LENGTH/2+1], ~ser_trg[TOKEN_LENGTH/2:1]};
	assign parity_res = ser_trg[TOKEN_LENGTH+1] ^ (^token);
	
	always @ (posedge clk) begin
		ser_trig <= ser_trig_in;
		tok_rdy <= 0;		// default
		tok_err <= 0;		// default
		if (ser_trig & ~(|ser_cnt)) begin
			// start sending token on first trig in group if not inhibited or soft trigger
			ser_trg <= 0;
			ser_div <= TOKEN_CLKDIV - 1;
			ser_cnt <= TOKEN_LENGTH + 2;
			ser_err <= 0;
		end else begin
			if (|ser_div) begin
				if (ser_div == BIT_SENS) begin
					// memorize this sample and shift
					ser_trg <= {ser_trig, ser_trg[TOKEN_LENGTH+2:1]};
				end else if (ser_div == BIT_SENS-1) begin
					// check if the next sample is the same, memorized is in the MSB
					if (ser_trig != ser_trg[TOKEN_LENGTH+2]) ser_err <= 1;
					if (~(|ser_cnt)) begin
						// last bit sampled and shifted, check start/stop and par
						if (~ser_trg[0] | ser_trg[TOKEN_LENGTH+2] | ~parity_res | ser_err) tok_err <= 1;
						tok_rdy <= 1;
					end
				end
				ser_div <= ser_div - 1;		// dec frq divider
			end else if (|ser_cnt) begin
				// shift serial reg
				ser_div <= TOKEN_CLKDIV - 1;
				ser_cnt <= ser_cnt - 1;
			end
		end
		
	end	// posedge

endmodule
