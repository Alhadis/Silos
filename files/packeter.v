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

module packeter(packeterOut, dataIn, op, commsize, rank, root, index, algtype, src, dst);
input [31:0]dataIn;
input [4:0]op;
input [3:0]commsize;
input [2:0]rank;
input [2:0]root;
input [3:0]index;
input [1:0]algtype;
input [2:0]src;
input [2:0]dst;
output [63:0]packeterOut;
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

assign packeterOut[31:0] = dataIn;
assign packeterOut[36:32] = op;
assign packeterOut[39:37] = rank;
assign packeterOut[42:40] = root;
assign packeterOut[45:43] = commsize;
assign packeterOut[49:46] = index;
assign packeterOut[51:50] = algtype;
assign packeterOut[55:52] = 0; //packet type
assign packeterOut[58:56] = dst;
assign packeterOut[61:59] = src;
assign packeterOut[62] = 1; //reductiontype
assign packeterOut[63] = 1; //valid


endmodule
