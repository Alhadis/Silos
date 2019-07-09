`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University Computer Architecture and Automated Design Lab
// Engineer: Joshua Stern

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

module top(dataIn, clk, rst, Outpacket, src, dst, rank, root, op, commsize, algtype, index, done);
input [31:0]dataIn;
input clk;
input rst;
input [4:0] op;
input [3:0] index;
input [2:0] src;
input [2:0] dst;
input [2:0] rank;
input [2:0] root;
input [1:0] algtype;
input [3:0] commsize;
output done;
output[63:0]Outpacket;

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

reg [8:0]counter;
reg done;
reg done_index;
reg[ReductionTableWidth-1:0] reduction_table[ReductionTableSize-1:0];
reg [IndexWidth-1:0] reduction_table_index;
reg [ReductionTableSize-1:0]i;
reg [ReductionTableSize-1:0]j;
reg [ReductionTableSize-1:0]k;

wire [DataWidth+ChildrenWidth-1:0]packetA;
wire [DataWidth-1:0]packeterOut;
wire [ChildrenWidth-1:0]children_count;
wire[ReductionTableWidth-1:0] reduction_table_entry;
wire reductiontype;
wire [PayloadLen-1:0] dataC;
wire [PayloadLen-1:0] sum;
wire buf_empty;
wire buf_full;
wire [12:0]fifo_counter;
wire [WaitWidth-1:0]spy_lock;
wire spec_lock;
wire rd_en;
wire wr_en;
wire [DataWidth+ChildrenWidth-1:0]nextPacket;
wire [DataWidth+ChildrenWidth-1:0]instr_out;
wire [IndexWidth-1:0]packetIndex;
wire [SrcWidth-1:0]packetSrc;
wire [IndexWidth-1:0]nextIndex;
wire [WaitWidth-1:0]WaitCount;

/*
these locks determine read enable signal.  They look at the incoming packet and see if the reduction table
is ready to accept it
*/

assign spy_lock = ((nextPacket==0) || (nextIndex == packetIndex))? WaitCount : (reduction_table[nextIndex][WaitPos+WaitWidth-1:WaitPos]); //check this change

assign spec_lock = ((children_count == 0) && ((nextPacket==0) || (nextIndex == packetIndex)) && (packetA[ValidBitPos]) &&  ((WaitCount>0)||(reduction_table[packetIndex][ValidBitPos]==0)));
		 //||(done && (done_index==packetIndex)) ;
assign rd_en =  !(spec_lock || spy_lock);

//write enable signal just needs to wait for a small startup period
//assign wr_en = counter<(AdderLatency+3);
assign wr_en = 1'b1;

packeter P1 (
 .packeterOut(packeterOut),
 .dataIn(dataIn),
 .op(op),
 .commsize(commsize),
 .rank(rank),
 .root(root),
 .index(index),
 .algtype(algtype),
 .src(src),
 .dst(dst)
);
 
reduce_instr R1 (
 .packetOut(instr_out),
 .packetIn(packeterOut),
 .clk(clk),
 .rst(rst)
);


fifo F1 (
 .clk(clk),
 .rst(rst),
 .buf_in(instr_out),
 .buf_out(packetA),
 .wr_en(wr_en),
 .rd_en(rd_en),
 .buf_empty(buf_empty),
 .buf_full(buf_full),
 .fifo_counter(fifo_counter),
 .nextPacket(nextPacket)
);

assign packetIndex = packetA[IndexPos+IndexWidth-1:IndexPos];
assign packetSrc = packetA[SrcWidth+SrcPos-1:SrcPos];
assign children_count = packetA[ChildrenPos+ChildrenWidth-1:ChildrenPos];
assign reductiontype = packetA[ReductionBitPos];
assign nextIndex = nextPacket[IndexPos+IndexWidth-1:IndexPos];
assign WaitCount = reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos];

/*
ip core that performs floating point single precision addition. dont forget to make this double precision if possible
*/
addy A1(
  .a(reduction_table[packetIndex][PayloadLen-1:0]),
  .b(packetA[PayloadLen-1:0]),
  .clk(clk),
  .s(sum)
);

/*
the following assignment statements are responsible for creating the output packet.
they combine the results of the reduction table such as the payload, destination, etc.
dataC is just used for simulation and analysis.  
*/
assign reduction_table_entry= reduction_table[done_index];
assign Outpacket[ValidBitPos] = 1;
assign Outpacket[ReductionBitPos] = 1;
assign Outpacket[DstPos+DstWidth-1:0] = reduction_table_entry[DstPos+DstWidth-1:0];
assign Outpacket[SrcPos+SrcWidth-1:SrcPos] = reduction_table_entry[RankPos+RankWidth-1:RankPos];
assign dataC = Outpacket[PayloadLen-1:0];

/*
below is the logic for the reduction table.  every instruction is nonblocking and
changes on the positive edge of the clock.
*/


always@(posedge clk) begin
  /*
  if the rst is set, set everything in the reduction table to 0.
  the rst must always be set and then turned off before any reductions
  can take place.
  */
   if (rst)begin	
		for(k=0;k<ReductionTableSize;k=k+1)begin
			reduction_table[k]<=73'b0;
		end		
		counter<=0;
		done<=0;
		done_index<=0;		
   end
   
	else begin//else if the rst is not set
	  //counter is just used for startup period and is used by write enable signal to fifo
		if((counter>=0)&&(counter<=AdderLatency+2))begin
			counter<=counter+1;
		end     
  
   /*
  if the incoming packet is to be placed in a reduction table slot that is either empty or invalid,
  the parameters of the incoming packet (packetA) are placed in its table slot.
   */
  
		if (reductiontype && (reduction_table[packetIndex][ValidBitPos] ==0 ))begin //if slot is empty
			reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]<=children_count+1;
			reduction_table[packetIndex][ValidBitPos]<=1;
			reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
			
			/* if the reduction requires 0 children, then we set the LeafBit to 1 which indicates a special
			case (that being 0 children), this leafbit will be used later */
			if(children_count == 0)begin
			 reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
			 reduction_table[packetIndex][ExtraWaitPos]<=1;
			 reduction_table[packetIndex][LeafBitPos]<=1;
			end
		end
  
  /*
  if a reduction was just completed, then that reduction's corresponding reduction table slot must
  be cleared. 
  */
		if (done)begin
			//reduction_table[done_index][ValidBitPos]<=0;
			if (reductiontype)begin
    /*
    if the incoming packet needs to be placed in the same reduction table slot as the reduction
    operation that was just completed, then the valid bit is set and the contents of the incoming
    packet are copied into the reduction table.
    */
				if (done_index==packetIndex)begin
					reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]<=children_count+1;
					reduction_table[packetIndex][ValidBitPos]<=1;
					reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
					
					/* if the reduction requires 0 children, then we set the LeafBit to 1 which indicates a special
					case (that being 0 children), this leafbit will be used later */
					if(children_count == 0)begin
					 reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
					 reduction_table[packetIndex][ExtraWaitPos]<=1;
					 reduction_table[packetIndex][LeafBitPos]<=1;
					end
				end
   
   
				//if incoming packet needs to be placed in a different slot than the reduction that was just completed
				else if (done_index!=packetIndex)begin
					reduction_table[done_index]<=73'b0; //clear out reduction table slot that just completed
     
     /*
     check to make sure that the incoming packet to the reduction table was not already received.  if the incoming
     packet has the same index and src, then it should not be copied into the table.  if it is a new packet, copy its
     contents into the reduction table
     */
				 /* if(reductiontype && !((reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] == packetSrc) &&
				  (reduction_table_index==packetIndex))  && (reduction_table[packetIndex][ValidBitPos] ==1)) begin
					 reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] <= packetSrc;
					 reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos] <= reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]-1;
				  end*/
				  
				  if(reductiontype && !((reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] == packetSrc) &&
				  (reduction_table_index==packetIndex))  && (reduction_table[packetIndex][ValidBitPos] ==1))	begin
						reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] <= packetSrc;
						reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos] <= reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]-1;
						reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
						reduction_table[packetIndex][ExtraWaitPos]<=1;
				  end

     
     /*
     the WaitCount is used as a countdown.  each reduction table slot has a WaitCount.  Because the ip core operations
     take several cycles, the reduction table entries must wait out these cycles until their outputs are ready.
     the wait count is initially set to the latency of these ip cores.  The extrawait bit is used to tell
     if the waitcount was ever used.
     */
     
				/*  if(WaitCount==0)begin
					 reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
					 reduction_table[packetIndex][ExtraWaitPos]<=1;
				  end*/
				  
				end //end if different slot
				
			end //end if reductiontype
			done<=0; //turn off the ready signal
		end //end if done
   
   
	  /* else if the incoming packet is going into a valid and existing table index and a reduction operation
	  was not just completed and the incoming packet is not a repeat, update and start waiting */
	   
		else if(reductiontype && !((reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] == packetSrc) &&
		(reduction_table_index==packetIndex)) && (reduction_table[packetIndex][ValidBitPos])) begin
			reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] <= packetSrc;
			reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos] <= reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]-1;
			reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
			reduction_table[packetIndex][ExtraWaitPos]<=1;
		end
  
  
		reduction_table_index<=packetIndex;
  
  
  /* the following logic is used for a special case.  When a reduction table entry receives its first packet
  in a reduction operation, the waitcount must be set to 1 so that is not immediately overwritten by
  the next incoming packet. */
  
  if((reductiontype)&&(packetA[ValidBitPos])&&(WaitCount==0))begin
    if((children_count>0)&&(reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]!=1))begin
     reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]<=1;
    end
  end
  
   
  /* the following logic is a continuation of the previous special case logic.  If a reduction
  table index receives its first packet but it still under threat to be overwritten, the
  wait count must be set to 1. */
  
  if((nextPacket[ReductionBitPos]) && (nextIndex!=packetIndex))begin
		if((reduction_table[nextIndex][ValidBitPos]==1)&&(reduction_table[nextIndex][WaitPos+WaitWidth-1:WaitPos]==0))begin
			if((nextPacket[ChildrenPos+ChildrenWidth-1:ChildrenPos]>0)&&(reduction_table[nextIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]!=1))begin
				reduction_table[nextIndex][WaitPos+WaitWidth-1:WaitPos]<=1;
			end
		end
  end
  
  
  /* the following loop checks all reduction table entry to see if their wait count has fallen to 0,
  meaning the reduction table entry's corresponding ip core output is ready to be copied into
  the reduction table.  A mux is used with the op input serving as the select variable.
  so far, this module supports addition, multiplication, maximum, minimum, logical or,
  logical and, bitwise and, bitwise or.  every ip core produces a result, but only one
  is copied into the reduction table. */
  
  for(i=0;i<ReductionTableSize;i=i+1)begin  
   if ((reduction_table[i][WaitPos+WaitWidth-1:WaitPos]==0)&&(reduction_table[i][ValidBitPos]==1)&&(reduction_table[i][ExtraWaitPos]==1))begin
     if((reduction_table[i][LeafBitPos]==0)&&(counter>AdderLatency))begin
      case(reduction_table[i][opPos+opWidth-1:opPos])
      5'b00000: reduction_table[i][PayloadLen-1:0] <= sum;
      endcase
     end
     reduction_table[i][ExtraWaitPos]<=0;
     reduction_table[i][LeafBitPos]<=0;
    
    /* if any of the reduction table entries has received data from all of their children,
    once they have their alu output, the reduction is completed and ready to be sent
    to the next node, or to the host.  The done_index signal is used to record which
    reduction table entry is completed.  On any given cycle, only one reduction
    table entry can be ready to be sent out. */
    
	  if(((reduction_table[i][ChildrenPos+ChildrenWidth-1:ChildrenPos] == 1))&&!(done && done_index==i))begin
		done<=1;
		done_index<=i;
		reduction_table[i][ValidBitPos]<=0;
	  end
   end //end if condition
  end //end for loop

  
  /* the following for loop is used to decrementing the wait counts in all of the reduction table entries.
  if the wait count is greater than 0, decrement it by 1.  We have a special case for the reduction
  table entry that is currently receiving a packet, because we only want to decrement its wait count
  after it is properly set. */
 
  for(j=0;j<ReductionTableSize;j=j+1)begin
   if((reduction_table[j][WaitWidth+WaitPos-1:WaitPos]>0) && (j != packetIndex)) begin
    reduction_table[j][WaitWidth+WaitPos-1:WaitPos] <= reduction_table[j][WaitWidth+WaitPos-1:WaitPos] - 1;
   end
  end
  
  
  if (((reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]!=1) || (reduction_table[packetIndex][ExtraWaitPos]==1))&&(reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]>0))begin
    reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]<=reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]-1;
  end 
   
  
 end //end if !rst
 
end  //end always

endmodule
