//键盘输出模块，即有4x4键盘的扫描输出，又有普通按键的消抖输出
module keyboard4x4(row,clk,start,column,dout,key);
	output[3:0] row;//列扫描信号
	output reg[7:0] dout;//第四位为标志位，有效为1，无效为0
	input clk,start;//扫描时钟信号、开始信号(实际上是复位信号），高电平有效
	input[6:0] key;
	input[3:0] column;//行扫描信号
	reg[3:0] row;
	reg[1:0] count;//计数器
	reg[1:0] sta;//数据选择器
	reg[7:0] dat,dat1;//寄存器
	reg[20:0] div=0;//div用于对时钟分频
	reg fn,cp=0;
	wire[6:0] key_pulse;
	
	initial dout=5'b00000;
	always @(posedge clk)
		begin
			div=div+1;
			if(div==21'd500000)//将扫描时间间隔降为20ms
			begin
				cp=~cp;
				div=0;
			end
		end
		
	always@(posedge clk)
		begin
			case(key_pulse)
				7'b1000000:dat1<='b00000001;
				7'b0100000:dat1<='b00000010;
				7'b0010000:dat1<='b00000011;
				7'b0001000:dat1<='b00000100;
				7'b0000100:dat1<='b00000101;
				7'b0000010:dat1<='b00000110;
				7'b0000001:dat1<='b00000111;
				default:dat1<='b00000000;
			endcase
		end

	//循环扫描计数器
	always @(posedge cp)
		begin
		if(start==0)
			begin dat<='b00000000; end
		else
			begin
				count<=count+1;
				case(count)
				2'b00:begin row<='b1110;sta<='b00;end
				2'b01:begin row<='b1101;sta<='b01;end
				2'b10:begin row<='b1011;sta<='b10;end
				2'b11:begin row<='b0111;sta<='b11;end
				endcase
			//行扫描译码
				case(sta)
				2'b00:begin
					case(column)
					4'b1110:dat<='b00100111;//(4,4)
					4'b1101:dat<='b00100011;//(3,4)
					4'b1011:dat<='b00010111;//(2,4)
					4'b0111:dat<='b00010011;//(1,4)
					default:dat<='b00000000;
					endcase
					end
				2'b01:begin
					case(column)
					4'b1110:dat<='b00100110;//(4,3)
					4'b1101:dat<='b00100010;//(3,3)
					4'b1011:dat<='b00010110;//(2,3)
					4'b0111:dat<='b00010010;//(1,3)
					default:dat<='b00000000;
					endcase
					end
				2'b10:begin
					case(column)
					4'b1110:dat<='b00100101;//(4,2)
					4'b1101:dat<='b00100001;//(3,2)
					4'b1011:dat<='b00010101;//(2,2)
					4'b0111:dat<='b00010001;//(1,2)
					default:dat<='b00000000;
					endcase
					end
				2'b11:begin
					case(column)
					4'b1110:dat<='b00100100;//(4,1)
					4'b1101:dat<='b00100000;//(3,1)
					4'b1011:dat<='b00010100;//(2,1)
					4'b0111:dat<='b00010000;//(1,1)
					default:dat<='b00000000;
					endcase
					end
				default:dat<='b00000000;
				endcase
			end
		end	

		
		//产生按键标志位，用于存储按键信息		
		always
			fn<=(dat[0]||dat[1]||dat[2]||dat[3]||dat[4]||dat[5]||dat[6]||dat[7])||(dat1[0]||dat1[1]||dat1[2]||dat1[3]||dat1[4]||dat1[5]||dat1[6]||dat1[7]); 
			
		always@(posedge fn)
			if(dat1==7'b0000000)
				begin dout[7:0]<=dat[7:0]; end
			else
				begin dout[7:0]<=dat1[7:0]; end
		
		fd W1(.cp(clk),.rst(start),.key(key),.key_pulse(key_pulse));
endmodule
