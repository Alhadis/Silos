`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
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

module reduce_instr(packetOut, packetIn, clk, rst);
input [63:0] packetIn;
input clk, rst;
output [66:0] packetOut;

parameter DataWidth = 64;
parameter ReductionTableWidth = 73;
parameter ReductionTableSize = 2;
parameter AdderLatency = 14;
parameter PayloadLen=32;
parameter opPos = 32;
parameter opWidth = 5;
parameter RankPos = 37;
parameter RankWidth = 3;
parameter RootPos = 40;
parameter RootWidth = 3;
parameter IndexPos=46;
parameter IndexWidth = 4;
parameter AlgtypePos=50;
parameter AlgtypeWidth=2;
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
parameter lg_numprocs = 3;
parameter numchildren = 1 << lg_numprocs;

reg [DstWidth-1:0]dst;
reg [RankWidth-1:0]Rank;
reg [ChildrenWidth-1:0]children;
reg ValidBit;
reg ReductionBit;
reg [SrcWidth-1:0]Src;
reg [PacketTypeWidth-1:0]PcktType;
reg [1:0] AlgType;
reg [IndexWidth-1:0]Index;
reg [2:0]Commsize;
reg [2:0]Root;
reg [opWidth-1:0]Op;
reg [PayloadLen-1:0]Payload;



always @(posedge clk)
begin
 
 /*
 if rst, set everything to 0
 */
 if (rst)
 begin
  children <= numchildren-1;
  dst <= 0;
  ValidBit<=0;
  ReductionBit<=0;
  Src<=0;
  PcktType<=0;
  AlgType<=0;
  Index<=0;
  Commsize<=0;
  Root<=0;
  Op<=0;
  Payload<=0;
  Rank<=0;
 end
 
 else begin
 
  children <= lg_numprocs;
  dst <= packetIn[RootPos+RootWidth-1:RootPos];

 
  ValidBit<=packetIn[ValidBitPos];
  ReductionBit<=packetIn[ReductionBitPos];
  Src<=packetIn[SrcPos+SrcWidth-1:SrcPos];
  PcktType<=packetIn[PacketTypePos+PacketTypeWidth-1:PacketTypePos];
  AlgType<=packetIn[51:50];
  Index<=packetIn[IndexPos+IndexWidth-1:IndexPos];
  Commsize<=packetIn[45:43];
  Root<=packetIn[42:40];
  Op<=packetIn[opPos+opWidth-1:opPos];
  Rank<=packetIn[39:37];
  Payload<=packetIn[PayloadLen-1:0];
  
end //end else not rst

end //end always

//set the output packet contents to the register values
assign packetOut[DstPos+DstWidth-1:DstPos] = dst;
assign packetOut[RankPos+RankWidth-1:RankPos] = Rank;
assign packetOut[ValidBitPos] = ValidBit;
assign packetOut[ReductionBitPos] = ReductionBit;
assign packetOut[SrcPos+SrcWidth-1:SrcPos] = Src;
assign packetOut[PacketTypePos+PacketTypeWidth-1:PacketTypePos] = PcktType;
assign packetOut[51:50] = AlgType;
assign packetOut[IndexPos+IndexWidth-1:IndexPos] = Index;
assign packetOut[45:43] = Commsize;
assign packetOut[42:40] = Root;
assign packetOut[39:37] = Rank;
assign packetOut[opPos+opWidth-1:opPos] = Op;
assign packetOut[PayloadLen-1:0] = Payload;
assign packetOut[ChildrenPos+ChildrenWidth-1:ChildrenPos] = children;
endmodule
