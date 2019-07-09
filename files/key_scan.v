module key_scan (
	clk, // 开发板上输入时钟: 50Mhz
	key_in, // 输入按键信号(Reset, KEY1~KEY3)
	//fre_word
	clk_out,
	clk_out_2,
	rst_n
);

parameter fre_inter = 32'd429496;
parameter fre_comp = 32'd4294967;
//========================================================
// PORT declarations
//========================================================
input clk;
input [3:0] key_in;
//output [31:0]fre_word;
output reg clk_out;
output reg clk_out_2;
input rst_n;

reg [31:0]fre_word;

//寄存器定义
reg [19:0] count;  //延时寄存器
reg [1:0] key_scan; //按键扫描值 KEY
//==============================================
// 采样按键值， 20ms 扫描一次,采样频率小于按键毛刺频率，相当于滤除掉了高频毛刺信号。
//==============================================
always @(posedge clk or negedge rst_n) //检测时钟的上升沿和复位的下降沿
begin
	if(!rst_n) //复位信号低有效
		count <= 20'd0; //计数器清 0
	else
		begin
		if(count ==20'd999_999) //20ms 扫描一次按键,20ms 计数(50M/50-1=999_999)
			begin
				count <= 20'b0; //计数器计到 20ms，计数器清零
				key_scan <= key_in; //采样按键输入电平
			end
		else
			count <= count + 20'b1; //计数器加 1
		end
end
//==================================================== 
// 按键信号锁存一个时钟节拍 
//====================================================
reg [1:0] key_scan_r;
always @(posedge clk)
	key_scan_r <= key_scan;

wire [1:0] flag_key = key_scan_r[1:0] & (~key_scan[1:0]); //当检测到按键有下降沿变化时，代表该按键被按下，按键有效
always @ (posedge clk or negedge rst_n) //检测时钟的上升沿和复位的下降沿
begin
	if (!rst_n) //复位信号低有效
		fre_word <= fre_inter;
	else if(fre_word >= fre_comp)
		 fre_word <= fre_inter;
	else begin
		if(flag_key[0])  fre_word <= fre_word + fre_inter;
		if(flag_key[1])  fre_word <= fre_word - fre_inter;
	end
end

reg [31:0] cnt;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		cnt <= 0;	
	end
	else begin
		cnt <= cnt + fre_word;
	end
end


always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		clk_out <= 0;
	end
	else if (cnt <= 32'h7FFF_FFFF) begin
		clk_out <= 1'b0;
	end
	else clk_out <= 1'b1;
end

reg [31:0] r_cnt;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		r_cnt <= 0;	
	end
	else begin
		r_cnt <= r_cnt + fre_word * 4;
	end
end


always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		clk_out_2 <= 0;
	end
	else if (r_cnt <= 32'h7FFF_FFFF) begin
		clk_out_2 <= 1'b0;
	end
	else clk_out_2 <= 1'b1;
end

endmodule


