`include "../rtl/Controle.v"

module tb_controle();

	Controle controle(

		.op(op),
		.fn(fn),
		.rt(rt),
	
		.selwsource(selwsource),
		.selregdest(selregdest),
		.writereg(writereg),
		.writeov(writeov),
		.selimregb(selimregb),
		.selsarega(selsarega),
		.selalushift(selalushift),
		.aluop(aluop),
		.unsig(unsig),
		.shiftop(shiftop),
		.mshw(mshw),
		.lshw(lshw),
		.msm(msm),
		.msl(msl),
		.readmem(readmem),
		.writemem(writemem),
		.selbrjumpz(selbrjumpz),
		.seltipopc(seltipopc),
		.compop(compop)

	);

	reg clock, reset;
	reg [5:0] op;
	reg [5:0] fn;
	reg [4:0] rt;

	wire [2:0] selwsource;		// Seleciona fonte de dados para WB realizar escrita
	wire [1:0] selregdest;			// Local do registrador de destino
	wire       writereg;			// Grava registro ?
	wire       writeov;			// Grava overflow ?
	wire       selimregb;		// Seleciona (Im || RegB)
	wire       selsarega; 		// Seleciona (Shift Amount || RegA)
	wire       selalushift; 		// Seleciona resultado Alu || Shifter
	wire [2:0] aluop;			// Operacao da ALU
	wire       unsig;            // Informa se é uma operaçãom sem sinal
	wire [1:0] shiftop;			// Operacao do Shifter
	wire       mshw;
	wire       lshw;
	wire [2:0] msm;
	wire [2:0] msl;
	wire       readmem;			// Le memoria
	wire       writemem;			// Escreve memoria
	wire [1:0] selbrjumpz;		// Seleciona se é branch, jump ou instr. normal (zero)
	wire [1:0] seltipopc;     	// Seleciona o tipo do pc para próxima instrução
	wire [2:0] compop;			// Operação da unidade de comparação

	reg [7:0] contador_tst;
	
	always #1 clock = ~clock;
	
	always@(negedge clock or posedge reset)
	begin
	  if(reset)
	  	begin
	  		contador_tst = 8'b0;	      
	  	end
	 	else
	 	  begin
	 	  	if(contador_tst <= 8'd49)
	 	  		begin
	 	  			contador_tst = contador_tst + 8'b1;
	 	  		end
	 	  	else
				begin
					contador_tst = 8'bx;
					$finish;
				end

			case(contador_tst)

				 1:  begin $display("SLL    "); op=6'b000000;fn=6'b000000;rt=5'bXXXXX; end
				 2:  begin $display("SRL    "); op=6'b000000;fn=6'b000010;rt=5'bXXXXX; end
				 3:  begin $display("SRA    "); op=6'b000000;fn=6'b000011;rt=5'bXXXXX; end
				 4:  begin $display("SLLV   "); op=6'b000000;fn=6'b000100;rt=5'bXXXXX; end
				 5:  begin $display("SRLV   "); op=6'b000000;fn=6'b000110;rt=5'bXXXXX; end
				 6:  begin $display("SRAV   "); op=6'b000000;fn=6'b000111;rt=5'bXXXXX; end
				 7:  begin $display("JR     "); op=6'b000000;fn=6'b001000;rt=5'bXXXXX; end
				 8:  begin $display("JALR   "); op=6'b000000;fn=6'b001001;rt=5'bXXXXX; end
				 9:  begin $display("ADD    "); op=6'b000000;fn=6'b100000;rt=5'bXXXXX; end
				 10: begin $display("ADDU   "); op=6'b000000;fn=6'b100001;rt=5'bXXXXX; end
				 11: begin $display("SUB    "); op=6'b000000;fn=6'b100010;rt=5'bXXXXX; end
				 12: begin $display("SUBU   "); op=6'b000000;fn=6'b100011;rt=5'bXXXXX; end
				 13: begin $display("AND    "); op=6'b000000;fn=6'b100100;rt=5'bXXXXX; end
				 14: begin $display("OR     "); op=6'b000000;fn=6'b100101;rt=5'bXXXXX; end
				 15: begin $display("XOR    "); op=6'b000000;fn=6'b100110;rt=5'bXXXXX; end
				 16: begin $display("NOR    "); op=6'b000000;fn=6'b100111;rt=5'bXXXXX; end
				 17: begin $display("SLT    "); op=6'b000000;fn=6'b101010;rt=5'bXXXXX; end
				 18: begin $display("SLTU   "); op=6'b000000;fn=6'b101011;rt=5'bXXXXX; end
				 19: begin $display("BLTZ   "); op=6'b000001;fn=6'bXXXXXX;rt=5'b00000; end
				 20: begin $display("BGEZ   "); op=6'b000001;fn=6'bXXXXXX;rt=5'b00001; end
				 21: begin $display("BLTZAL "); op=6'b000001;fn=6'bXXXXXX;rt=5'b10000; end
				 22: begin $display("BGEZAL "); op=6'b000001;fn=6'bXXXXXX;rt=5'b10001; end
				 23: begin $display("J      "); op=6'b000010;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 24: begin $display("JAL    "); op=6'b000011;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 25: begin $display("BEQ    "); op=6'b000100;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 26: begin $display("BNE    "); op=6'b000101;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 27: begin $display("BLEZ   "); op=6'b000110;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 28: begin $display("BGTZ   "); op=6'b000111;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 29: begin $display("ADDI   "); op=6'b001000;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 30: begin $display("ADDIU  "); op=6'b001001;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 31: begin $display("SLTI   "); op=6'b001010;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 32: begin $display("SLTIU  "); op=6'b001011;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 33: begin $display("ANDI   "); op=6'b001100;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 34: begin $display("ORI    "); op=6'b001101;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 35: begin $display("XORI   "); op=6'b001110;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 36: begin $display("LUI    "); op=6'b001111;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 37: begin $display("LB     "); op=6'b100000;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 38: begin $display("LH     "); op=6'b100001;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 39: begin $display("LWL    "); op=6'b100010;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 40: begin $display("LW     "); op=6'b100011;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 41: begin $display("LBU    "); op=6'b100100;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 42: begin $display("LHU    "); op=6'b100101;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 43: begin $display("LWR    "); op=6'b100110;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 44: begin $display("SB     "); op=6'b101000;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 45: begin $display("SH     "); op=6'b101001;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 46: begin $display("SWL    "); op=6'b101010;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 47: begin $display("SW     "); op=6'b101011;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 48: begin $display("SWR    "); op=6'b101110;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 49: begin $display("LL     "); op=6'b110000;fn=6'bXXXXXX;rt=5'bXXXXX; end
				 50: begin $display("SC     "); op=6'b111000;fn=6'bXXXXXX;rt=5'bXXXXX; end

//				 37: begin $display("Indef1 "); op=6'b010000;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 38: begin $display("Indef2 "); op=6'b010001;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 39: begin $display("Indef3 "); op=6'b010010;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 40: begin $display("Indef4 "); op=6'b010011;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 41: begin $display("Indef5 "); op=6'b010100;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 42: begin $display("Indef6 "); op=6'b010101;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 43: begin $display("Indef7 "); op=6'b010110;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 44: begin $display("Indef8 "); op=6'b010111;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 45: begin $display("Indef9 "); op=6'b011000;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 46: begin $display("Indef10"); op=6'b011001;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 47: begin $display("Indef11"); op=6'b011010;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 48: begin $display("Indef12"); op=6'b011011;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 49: begin $display("Indef13"); op=6'b011100;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 50: begin $display("Indef14"); op=6'b011101;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 51: begin $display("Indef15"); op=6'b011110;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 52: begin $display("Indef16"); op=6'b011111;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 60: begin $display("Indef17"); op=6'b100111;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 65: begin $display("Indef18"); op=6'b101100;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 66: begin $display("Indef19"); op=6'b101101;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 68: begin $display("Indef20"); op=6'b101111;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 70: begin $display("Indef21"); op=6'b110001;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 71: begin $display("Indef22"); op=6'b110010;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 72: begin $display("Indef23"); op=6'b110100;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 73: begin $display("Indef24"); op=6'b110101;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 74: begin $display("Indef25"); op=6'b110110;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 75: begin $display("Indef26"); op=6'b110111;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 77: begin $display("Indef27"); op=6'b111001;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 78: begin $display("Indef28"); op=6'b111010;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 79: begin $display("Indef29"); op=6'b111011;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 80: begin $display("Indef30"); op=6'b111100;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 81: begin $display("Indef31"); op=6'b111101;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 82: begin $display("Indef32"); op=6'b111110;fn=6'bXXXXXX;rt=5'bXXXXX; end
//				 83: begin $display("Indef33"); op=6'b111111;fn=6'bXXXXXX;rt=5'bXXXXX; end

			endcase

	 	  end
	end

	always@(posedge clock)
	begin
		if(contador_tst >= 1 && contador_tst <= 83)
		begin
			$display("selwsource  : %d", selwsource);			
			$display("selregdest  : %d", selregdest);		
			$display("writereg    : %b", writereg);		
			$display("writeov     : %b", writeov);			
			$display("selimregb   : %b", selimregb);		
			$display("selsarega   : %b", selsarega); 		
			$display("selalushift : %b", selalushift); 	
			$display("aluop       : %d", aluop);			
			$display("unsig       : %b", unsig);           
			$display("shiftop     : %d", shiftop);			
			$display("mshw        : %b", mshw);
			$display("lshw        : %b", lshw);
			$display("msm         : %d", msm);
			$display("msl         : %d", msl);
			$display("readmem     : %b", readmem);			
			$display("writemem    : %b", writemem);		
			$display("selbrjumpz  : %d", selbrjumpz);		
			$display("seltipopc   : %d", seltipopc);     	
			$display("compop      : %d", compop);			
			$display;
		end
	end

	initial
	begin
		#1 reset = 0;
		#1 reset = 1;
		#1 reset = 0;
		
		#1 clock = 0;
	end

endmodule
