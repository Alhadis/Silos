module deClock(
	input clk,
	input code,
	input rst_n,
	output reg clkout,
	output reg clkout2,
	output reg [15:0] declk,
	output reg ready
);

wire code_pos,code_neg;
reg code_r0,code_r1;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        code_r0 <= 1'b1;   //sck of the idle state is high 
        code_r1 <= 1'b1;
    end
    else
    begin
        code_r0 <= code;
        code_r1 <= code_r0;
    end
end

assign code_neg = (~code_r0 & code_r1)? 1'b1:1'b0;   //capture the sck negedge
assign code_pos = (~code_r1 & code_r0)? 1'b1:1'b0;   //capture the sck posedge

reg [15:0]cnt;
reg [15:0]temp;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		cnt <= 0;	
		temp <= 0;
	end
	else if (code) begin
		cnt <= cnt + 1;
	end
	else if(code_neg)begin
		temp <= cnt;
		cnt <= 0;
	end
end


reg [15:0]tempclk;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		declk <= 0;	
		tempclk <= 0;
		ready <= 0;
	end
	else begin
		tempclk <= temp;
		ready <= 0;
		if(temp <= (tempclk)/2+5 && temp >100) begin
			declk <= temp;
			ready <= 1;
		end
	end
end

reg [15:0]cnt_r;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		cnt_r <= 0;
		clkout <= 0;
	end
	else if (cnt_r >= declk-1) begin
		clkout <= ~clkout;
		cnt_r <= 0;
	end
	else begin
		cnt_r <= cnt_r + 1;
	end
end


/**********************产生2倍时钟*************************/
reg [31:0] clkcnt;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		clkcnt <= 0;	
	end
	else begin
		clkcnt <= clkcnt + 32'hFFFF_FFFF / declk * 2;
	end
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		clkout2 <= 0;
	end
	else if (clkcnt <= 32'h7FFF_FFFF) begin
		clkout2 <= 1'b0;
	end
	else clkout2 <= 1'b1;
end
/*
reg [15:0]cnt_rr;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		cnt_rr <= 0;
		clkout2 <= 0;
	end
	else if (cnt_rr >= declk/2-1) begin
		clkout2 <= ~clkout2;
		cnt_rr <= 0;
	end
	else begin
		cnt_rr <= cnt_rr + 1;
	end
end
*/

endmodule
