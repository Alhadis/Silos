module CU(Address, miss, mem_rdy, clk, rst, cache_we, mem_re, ready);
	input miss, mem_rdy, clk, rst;
	input[14:0] Address;
	output reg cache_we, mem_re, ready;
	localparam READY = 0, READ = 1, HIT = 2, WRITE = 3;
	reg [1:0] ps, ns;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			ps <= 0;
			ns <= 0;
		end
		else begin
			ps <= ns;
		end
	end
	always @(ps, miss, mem_rdy) begin
		ns = 0;
		case(ps)
			READY: begin
				ns = miss ? READ : HIT;
			end
			HIT: begin
				ns = READY;
			end
			READ: begin
				ns = mem_rdy ? WRITE : READ;
			end
			WRITE: begin
				ns = mem_rdy ? WRITE : READY;
			end
		endcase
	end
	always @(ps) begin
		{cache_we, mem_re, ready} = 0;
		if(!rst) begin
			case(ps)
				READY: begin
					ready = 1;
				end
				READ: begin
					mem_re = 1;
				end
				WRITE: begin
					cache_we = 1;
				end
			endcase
		end
	end
endmodule 