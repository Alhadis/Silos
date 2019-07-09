module lcd_controller (dataa, datab, result, clk, clk_en, start, reset, done, bl, rs, rw, en, db);

	input [31:0] dataa;
	input [31:0] datab;
	input clk;
	input clk_en;
	input start;
	input reset;
	
	output reg [31:0] result;
	output reg done;
	output bl;
	output reg rs;
	output rw;
	output reg en;
	output reg[7:0] db;

	assign rw = 1'b0;
	
	reg [16:0] contador;
	
	localparam idle = 0, working = 1, finish = 2;
	
	reg [1:0] state;

	assign bl = 1'b1; //liga o fundo do LCD
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			contador <= 17'd0;
			rs       <= 1'b0;
			en       <= 1'b0;
			db       <= 8'b0;
			state    <= 1'b0;
		end else begin
			if (clk_en) begin
				case (state)
					idle:begin
						done <= 1'b0;
						if (start) begin
							state <= working;
							rs <= dataa[0];
							db <= datab[7:0];
							contador <= 17'd0;
							en <= 1'b1;
						end else begin
							state <= idle;
						end
					end
					working:begin
						done <= 1'b0;
						if (contador == 17'd100_000) begin
							state <= finish;
							en    <= 1'b0;
						end else begin
							contador <= contador + 1'd1;
							state <= working;
						end
					end
					finish:begin
						done <= 1'b1;
						result <= 1'b1;
						state <= idle;
					end
				endcase
			end
		end
	end
endmodule