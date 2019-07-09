module controller (init_signal, clock, allBits, Zero, CarryOut, regFileWriteDataSel, selectR2, AluInputBSel, ALUfunction,
	STM, LDM, /*enablePC,*/ enableZero, enableCarry, pcAdderInputASel, push, pop, pcInputSel, stall);

	input clock, init_signal;
	input[18:0]allBits;
	input Zero, CarryOut;
	output reg stall;
	output reg selectR2, AluInputBSel, STM, LDM/*, enablePC*/, enableZero, enableCarry, push, pop;
	output reg [1:0] pcInputSel;
	output reg pcAdderInputASel;
	output reg regFileWriteDataSel;
	output reg[3:0]ALUfunction;  //TODO: it should be 3 bits and add shiftrotate operation upcodes

	// always @(posedge clock)
	// 	enablePC <= 1'b1;

	wire[1:0]lasttwoBits;
	assign lasttwoBits = allBits[18:17];
	wire[2:0]threeBitFn;
	assign threeBitFn = allBits[16:14];
	wire[2:0]lastthreeBits;
	assign lastthreeBits = allBits[18:16];
	wire[1:0]twoBitFn;
	assign twoBitFn = allBits[15:14];
	wire[4:0]lastfiveBits;
	assign lastfiveBits = allBits[18:14];
	wire[11:0]Adress;
	assign Adress = allBits[11:0];
	wire[5:0]lastsixBits;
	assign lastsixBits = allBits[18:13];

	always @(init_signal, allBits, CarryOut) begin
		LDM <= 1'b0; STM <= 1'b0;
		enableCarry <= 1'b0;
		enableZero <= 1'b0;
		ALUfunction <= 4'b1000;
		push <= 1'b0; pop <= 1'b0; pcInputSel <= 2'b00; pcAdderInputASel <=1'b1;
		stall <= 1'b0;

		case(lasttwoBits)
			2'b 00 : begin 
				LDM <= 1'b1;
				ALUfunction <= {1'b1, threeBitFn};
				AluInputBSel <= 1'b0; // with 1 signal the mux choses usual 
				selectR2 <= 1'b0; // with 1 signal the mux choses[7:5]
				regFileWriteDataSel <= 1'b1; // with 00 signal the mux choses result of ALU
				enableCarry<= 1'b1;
				enableZero <= 1'b1;
				end
			2'b 01 : begin 
				LDM <= 1'b1;
				ALUfunction <= {1'b1, threeBitFn};
				AluInputBSel <= 1'b1; //with 0 signal the mux choses immediate 
				selectR2 <= 1'b1; // with 1 signal the mux choses[7:5]
				regFileWriteDataSel <= 1'b1; // with 00 signal the mux choses result of ALU 
				enableCarry <= 1'b1;
				enableZero <= 1'b1;
				end
		endcase

		case(lastthreeBits)
			3'b 110: begin
				ALUfunction <= {1'b0, 1'b0, twoBitFn};
				regFileWriteDataSel <= 1'b1; // with 01 signal the mux choses result of shift_rotate
				LDM <= 1'b1;
				enableCarry <= 1'b1;
				end
			3'b 100: begin
				if(twoBitFn == 2'b00) begin
					LDM <= 1'b1;
					ALUfunction <= 4'b1000;
					regFileWriteDataSel <= 1'b0; // with 01 signal the mux choses result of dataMemory
					AluInputBSel <= 1'b1;
				end

				if(twoBitFn == 2'b01) begin
					STM <= 1'b1;
					selectR2 <= 1'b1; // with 0 signal the mux choses[13:11]
					AluInputBSel <= 1'b1;
				end
			end 
		endcase

		case(lastthreeBits)
			3'b 101: begin
				// if ({twoBitFn , Zero} == 3'b 001) begin pcAdderInputASel <= 2'b00; end

				if ({twoBitFn , Zero} == 3'b 001) begin pcAdderInputASel <= 1'b0; stall <= 1'b1; end

				// if ({twoBitFn , Zero} == 3'b 010) begin pcAdderInputASel <= 2'b00; stall <= 1'b1; end

				if ({twoBitFn , Zero} == 3'b 010) begin pcAdderInputASel <= 1'b0; stall <= 1'b1; end

				// if ({twoBitFn , CarryOut} == 3'b 101) begin pcAdderInputASel <= 2'b00; stall <= 1'b1; end

				if ({twoBitFn , CarryOut} == 3'b 101) begin pcAdderInputASel <= 1'b0; stall <= 1'b1; end

				// if ({twoBitFn , CarryOut} == 3'b 110) begin pcAdderInputASel <= 2'b00; stall <= 1'b1; end

				if ({twoBitFn , CarryOut} == 3'b 110) begin pcAdderInputASel <= 1'b0; stall <= 1'b1; end
			end
		endcase 

		case(lastfiveBits)
			5'b 11100: begin
				pcInputSel <= 2'b10;
				stall <= 1'b1;
				end

			5'b 11101: begin
				pcInputSel <= 2'b10;
				stall <= 1'b1;
				push <= 1'b1;
				//TODO: is pc value in this clock, the correct pc value?
			end
		endcase 

		case(lastsixBits)
			6'b 111100: begin
				pop <= 1'b1;
				pcInputSel <= 2'b10;
				stall <= 1'b1;
			end
		endcase

	end

endmodule
