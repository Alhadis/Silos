module lcd_controller (dataa, datab, result, clk, clk_en, start, reset, done, bl, rs, rw, en, db);

	input [31:0] dataa;
	input [31:0] datab;
	input clk;  // 50mhz
	input clk_en;
	input start;
	input reset;
	
	output reg [31:0] result;
	output reg done;
	output bl;
	output reg rs;
	output rw;
	output reg en;
	output reg[7:0] db; //Dados de saido do Display

	assign rw = 1'b0; //Atribui a rw, como sempre escrita
	
	reg [16:0] contador;
	
	localparam idle = 0, working = 1, finish = 2; //Parametros para delimitar a maquina de estados
	
	reg [1:0] state; // Guarda parametro de cada estado

	assign bl = 1'b1; //liga o fundo do LCD
	
	always @ (posedge clk or posedge reset) begin // Cada periodo de subida de clock é P = 1/f = 1/50000000 = 0,000000020uF
		if (reset) begin
			contador <= 17'd0; // 17 casas binarias para representar 100000
			rs       <= 1'b0;
			en       <= 1'b0;
			db       <= 8'b0;
			state    <= 1'b0;
		end else begin
			if (clk_en) begin // Se tiver en = true
				case (state)  // Recebe o estado da maquina
					idle:begin // Estado: Oscioso
						done <= 1'b0;
						if (start) begin // Quando o dado recebido, ele inicia
							state <= working;
							rs <= dataa[0];
							db <= datab[7:0];
							contador <= 17'd0;
							en <= 1'b1;
						end else begin
							state <= idle;
						end
					end
					working:begin // Estado: Trabalhando
						done <= 1'b0;
						if (contador == 17'd100_000) begin //Assim 100000 x 0.000000020uf = 0.000020mS = 20mS 
							state <= finish;
							en    <= 1'b0;
						end else begin
							contador <= contador + 1'd1;
							state <= working;
						end
					end
					finish:begin // Estado: Finalizado
						done <= 1'b1;
						result <= 1'b1;
						state <= idle; // Volta para o Estado: Ocioso
					end
				endcase
			end
		end
	end
endmodule