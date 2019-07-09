`ifndef PARAMETERS_V
`define PARAMETERS_V

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

//communicator table

	*|	52  |51-43|	 42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	*|valid|root |local_rank|children|lg_commsize|third|second|first|
	
	//incoming communicator packet 
	
	*|	60  |  59-52  |51-43|  42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	*|valid|contextid|root |local_rank|children|lg_commsize|third|second|first|
	

/////////////////////////////////////////////////////////////////////////////////*/

module reduce_instr(packetOut, rd_en, packetIn, new_comm, clk, rst);

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

`endif
