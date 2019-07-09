`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:	18:43:47 06/19/2017
// Design Name:
// Module Name:	fifo
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//inside the router, packeter, and reduce_instruction core
/*
	*|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
 
inside the fifo
	*|66-64   |63   	|62       	| 61-59  |58-56   |55-52  	|51-50     	|49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|children|valid bit|reduction bit|src node|dst node|packet type|algorithm type|index|commsize|root |rank |op   |payload|
//reduction table entry format
 
	*|72  |71       	|70-67 	|66-64         	|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|leaf|counting down|wait count|children remaining|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
//leaf bit is for if the operation's children count == 0, because then the input is also the output
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/
module fifo( clk, rst, buf_in, buf_out, wr_en, rd_en, buf_empty, buf_full, fifo_counter, nextPacket);
parameter DataWidth = 64;
parameter ReductionTableWidth = 73;
parameter ReductionTableSize = 2;
parameter AdderLatency = 14;

parameter PayloadLen=32;
parameter opPos = 32;
parameter opWidth = 5;
parameter RankPos = 37;
parameter RankWidth = 3;
parameter IndexPos=46;
parameter IndexWidth = 4;
parameter PacketTypePos = 52;
parameter PacketTypeWidth = 4;
parameter DstPos = 56;
parameter DstWidth = 3;
parameter SrcPos = 59;
parameter SrcWidth = 3;
parameter ReductionBitPos=62;
parameter ValidBitPos = 63;
parameter ChildrenPos=64;
parameter ChildrenWidth=3;
parameter WaitPos = 67;
parameter WaitWidth = 4;
parameter ExtraWaitPos=71;
parameter LeafBitPos=72;
parameter fifo_lg_size = 12;
parameter FifoSize = 1<<fifo_lg_size;
input             	rst, clk, wr_en, rd_en;  
// reset, system clock, write enable and read enable.
input [DataWidth+ChildrenWidth-1:0] buf_in;              	 
// data input to be pushed to buffer
output[DataWidth+ChildrenWidth-1:0]       	buf_out;
// port to output the data using pop.
output[DataWidth+ChildrenWidth-1:0]       	nextPacket;  
//used for sneak peak at next buf_out value            	 
output            	buf_empty, buf_full; 	 
// buffer empty and full indication
output[fifo_lg_size:0] fifo_counter;        	 
// number of data pushed in to buffer  
reg[DataWidth+ChildrenWidth-1:0]          	buf_out;
reg[DataWidth+ChildrenWidth-1:0]          	nextPacket;
reg               	buf_empty, buf_full;
reg[fifo_lg_size :0]	fifo_counter;
reg[fifo_lg_size-1:0]  rd_ptr, wr_ptr;       	// pointer to read and write addresses
reg[DataWidth+ChildrenWidth-1:0]          	buf_mem[FifoSize-1:0]; //
reg [fifo_lg_size:0]i;
reg [fifo_lg_size:0]j;
reg [fifo_lg_size:0]k;


always @(fifo_counter)
begin
   buf_empty = (fifo_counter==0);
   buf_full = (fifo_counter== FifoSize);
end


always @(posedge clk or posedge rst)
begin
   if( rst )
   	fifo_counter <= 0;
   else if( (!buf_full && wr_en) && ( !buf_empty && rd_en ) )
   	fifo_counter <= fifo_counter;
   else if( !buf_full && wr_en )
   	fifo_counter <= (buf_in[31:0]>0)?fifo_counter + 1:fifo_counter;
   else if( !buf_empty && rd_en )
   	fifo_counter <= fifo_counter - 1;
   else
  	fifo_counter <= fifo_counter;
end


always @( posedge clk or posedge rst)
begin
  if(rst)begin
   	 buf_out <= 0;
   	 nextPacket<=0;
   end
   else if( rd_en && !buf_empty )begin
     	buf_out <= buf_mem[rd_ptr];
   		 if(rd_ptr==FifoSize-1)begin
   			 nextPacket <= buf_mem[0];
   		 end
   		 else begin
   			 nextPacket <= (buf_mem[rd_ptr+1] == 0)? buf_in: buf_mem[rd_ptr+1];
   		 end
   end
   else begin
     	buf_out <= buf_out;
   		 if(buf_out==buf_mem[rd_ptr-1])begin
   			 nextPacket <= buf_mem[rd_ptr];
   		 end
   		 else begin
   			 nextPacket<=nextPacket;
   		 end
   end
end


always @(posedge clk)
begin
   if( rst ) begin
  for(i=0;i<FifoSize;i=i+1)begin
  	buf_mem[i] <= 0;
  end
  end
   else
   begin
    
     for(j=0;j<FifoSize;j=j+1)
      begin
   	 if(rd_ptr<wr_ptr)
   	 begin
   		 if((j<rd_ptr) || (j>wr_ptr))
   		 begin
   			 buf_mem[j]<=0;
   		 end
   	 end
      end



      for(k=0;k<FifoSize;k=k+1)
   	 begin
   	   if(wr_ptr<rd_ptr)
   	   begin
   		 if((k<rd_ptr)&&(k>wr_ptr))
   		 begin
   			 buf_mem[k]<=0;
   		 end
   	   end
   	 end
    
   if( wr_en && !buf_full )
  	buf_mem[ wr_ptr ] <= buf_in;
   else
  	buf_mem[ wr_ptr ] <= buf_mem[ wr_ptr ];
 end
end


always@(posedge clk or posedge rst)
begin
   if( rst )
   begin
  	wr_ptr <= 0;
  	rd_ptr <= 0;
   end
   else
   begin
  	if( !buf_full && wr_en )	wr_ptr <= wr_ptr + 1;
   	 else  wr_ptr <= wr_ptr;
   	 
  	if( !buf_empty && rd_en )   rd_ptr <= rd_ptr + 1;
  	else rd_ptr <= rd_ptr;
   	 
   end
end


endmodule
