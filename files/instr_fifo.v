`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Boston University Computer Architecture and Automated Design Lab
// Joshua Stern

/*
	*| 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |     	
	*|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|
 
inside the fifo
	
	*| 84-82  | 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |   	
	*|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|

//reduction table entry 
 
	*|   90  |     89     |  88-85  | 84-82  | 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |      	
	*|LeafBit|ExtraWaitBit|waitcount|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|
	
//leaf bit is for if the operation's children count == 0, because then the input is also the output 
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/

module instr_fifo( clk, rst, buf_in, buf_out, wr_en, rd_en, buf_empty, buf_full, fifo_counter);

//////////////////////////////////////////
//current rank, root, and world size
parameter cur_rank = 9'b0;
parameter root = 9'b0;
parameter rank_z = 3'b0;
parameter rank_y = 3'b0;
parameter rank_x = 3'b0;
parameter root_z = 3'b0;
parameter root_y = 3'b0;
parameter root_x = 3'b0;

parameter lg_numprocs = 3;
parameter num_procs = 1 << lg_numprocs;

///////////////////////////////////////////
//packet structure
parameter PayloadWidth=32;
parameter opPos = PayloadWidth;
parameter opWidth = 4;
parameter AlgTypePos = opPos+opWidth;
parameter AlgTypeWidth = 2;
parameter TagPos=AlgTypePos+AlgTypeWidth;
parameter TagWidth = 8;
parameter ContextIdPos = TagPos+TagWidth;
parameter ContextIdWidth = 8;
parameter RankPos = ContextIdPos + ContextIdWidth;
parameter RankWidth = 9;
parameter Src_XPos = RankPos+RankWidth;
parameter Src_XWidth = 3;
parameter Src_YPos = Src_XPos+Src_XWidth;
parameter Src_YWidth = 3;
parameter Src_ZPos = Src_YPos+Src_YWidth;
parameter Src_ZWidth = 3;
parameter Dst_XPos = Src_ZPos+Src_ZWidth;
parameter Dst_XWidth = 3;
parameter Dst_YPos = Dst_XPos+Dst_XWidth;
parameter Dst_YWidth = 3;
parameter Dst_ZPos = Dst_YPos+Dst_YWidth;
parameter Dst_ZWidth = 3;
parameter SrcPos = Src_XPos;
parameter SrcWidth = Src_XWidth+Src_YWidth+Src_ZWidth;
parameter DstPos = Dst_XPos;
parameter DstWidth = Dst_XWidth+Dst_YWidth+Dst_ZWidth;
parameter ValidBitPos = Dst_ZPos+Dst_ZWidth;
parameter FlitWidth = ValidBitPos + 1;


/////////////////////////////////////////
//children and countdown
parameter ChildrenPos=ValidBitPos+1;
parameter ChildrenWidth=lg_numprocs;
parameter WaitPos = ChildrenPos+ChildrenWidth;
parameter WaitWidth = 4;
parameter ExtraWaitPos=WaitPos+WaitWidth;
parameter LeafBitPos=ExtraWaitPos+1;

 
//////////////////////////////////////////
//reduce unit table and adder
parameter ReductionTableWidth = LeafBitPos+1;
parameter ReductionTableSize = 2;
parameter AdderLatency = 14;
parameter ReductionBitPos=opPos+opWidth-1;


///////////////////////////////////////
//fifo
parameter fifo_lg_size = 12;
parameter FifoSize = 1<<fifo_lg_size;

/////////////////////////////////////
//communicator table
parameter CommTableWidth = (lg_numprocs+2)*DstWidth + lg_numprocs*2+2;
parameter CommTableSize = 4;
parameter lgCommSizePos = lg_numprocs*DstWidth;
parameter CommChildrenPos = lgCommSizePos+lg_numprocs+1;
parameter LocalRankPos = CommChildrenPos + lg_numprocs;
parameter NewCommWidth = CommTableWidth+ContextIdWidth;

////////////////////////////////////
//algorithmic opcodes
parameter Scan = 4'b0011;
parameter AlltoAll = 4'b0100;
parameter LargeBcast = 4'b0101;
parameter MediumBcast = 4'b0110;
parameter ShortBcast = 4'b0111;
parameter Scatter = 4'b1000;
parameter LargeAllGather = 4'b1001;
parameter ShortAllGather = 4'b1010;
parameter Gather = 4'b1011;
parameter ShortReduce = 4'b1100;
parameter LargeReduce = 4'b1101;
parameter ShortAllReduce = 4'b1110;
parameter LargeAllReduce = 4'b1111;

////////////////////////////////////

input rst, clk, wr_en, rd_en;  
input [FlitWidth-1:0] buf_in;              	 
output[FlitWidth-1:0] buf_out;      	 
output buf_empty, buf_full; 	 
output[fifo_lg_size:0] fifo_counter;   
     	 
reg[FlitWidth-1:0] buf_out;
reg buf_empty, buf_full;
reg[fifo_lg_size :0]	fifo_counter;
reg[fifo_lg_size-1:0] rd_ptr, wr_ptr;     
reg[FlitWidth-1:0] buf_mem[FifoSize-1:0]; 
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
   end
   else if( rd_en && !buf_empty )begin
     	buf_out <= buf_mem[rd_ptr];
   end
   else begin
     	buf_out <= buf_out;
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



