module Synchronize(
	input clk,
	input rst_n,
	input Manin,
	input [15:0]divclk,
	input rxd_flag,
	output syn
);

reg [15:0]count;
reg Manin_r,code_edge;
reg [15:0]divclk_reg;
/********************边沿检测*********************/
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		code_edge <= 0;
	end
	else begin
	 	Manin_r <= Manin;
	 	code_edge <= Manin ^ Manin_r;
	end
end

/*********************边沿计数************************/
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		count <= 0;
	end
	else if (Manin) begin
		count <= count + 1;
	end
	else count <= 0;
end


reg [15:0]cnt;
reg sym;
reg [1:0]status;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		sym <= 0;
		status <= 0;
		cnt <= 0;
	end
	else  begin
		case(status)
		2'd0:begin
			if(rxd_flag)begin
				status <= 2'd1;
				divclk_reg <= divclk;
				end
			end
		2'd1:begin
			if(code_edge)begin
				status <= 2'd2;
				end
			end
		2'd2:begin
			cnt <= cnt + 1;
			if(cnt == divclk_reg )
			begin
				sym <= ~sym;
			end
			else if(cnt == divclk_reg * 2)
			begin
				sym <= ~sym;
			end
			else if(cnt == divclk_reg *3)
			begin
				sym <= ~sym;
			end
			else if(cnt >= divclk_reg * 4 - 100 && cnt <= divclk_reg * 4 + 10)
			begin
				if(code_edge)	begin
					sym = ~sym;
					cnt <= 0;
				end
			end
			else if(cnt > divclk_reg *4 + 10) begin
				status <= 2'd0;
				cnt <= 0;
			end
		end
		endcase
	end
end

/*
reg [15:0]cnt;
reg sym;
reg [1:0]status;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		sym <= 0;
		status <= 0;
	end
	else  begin
		case(status)
		2'd0:begin
			if(flag & code_edge)
				status <= 1;
				cnt <= 0;
			end
		2'd1:begin
			cnt <= cnt + 1;
			if(cnt >= divclk)
			begin
				sym <= ~sym;
				cnt <= 0;
			end
			else if(rxd_flag)
			begin
				status <= 0;
			end
		end
		endcase
	end
end
*/

assign syn = sym;

endmodule

