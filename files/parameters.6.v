//`ifndef parameters
`define parameters 1
`define debug 1
// `define debugRouter 0
// `define debugTraffic 1
`define input_buffer_size 1

`define maxio 16
`define maxio_bit 4
`define maxvc 8


`define crbufsz 100

`define max_cr_delay 100

`define debugRouter 1
`define debugTraffic 1

`define in_cycle_size 16
`define op_size 3
//TODO: mem_size should check
`define mem_size 1000
`define read_word_size 20
`define NOP 0
`define LoadStaging 1
`define Phase0 2
`define Phase1 3
`define LoadRt 4
`define Init   5

//traffic states
`define PreDeque 4
//Init
`define Fill   6
`define Dequeue   7

`define CopyStaging 0
`define Range(i,siz) siz*(i+1)-1:siz*i

`define MaxCycleBitSize 20
`define VcBitSize 4
`define NumVcBitSize 5 //should one bit more 16vc for example
`define RouterBitSize 14
`define RouterSize 10
`define PortSize 6
`define PortBitSize 7 //hooman value!!
`define CreditDelayBitSize 12 //hooman value!!!
`define TotalNumTrafficBitSize 10
`define TotalNumTrafficSize 100 //TODO: check
`define CreditBitSize 8
`define IndBitSize 16

/*******************************
**      Struct Buffer        **
*******************************/
`define BufferBitSize 22 //{full[1],vc[4],flit[16]/TimeStamp[17]}
`define BufferFull [21:21]
`define BufferVc [20:17]
`define BufferFlit [15:0]
`define BufferTimeStamp [16:0]

/*******************************
**      Struct Flit           **
*******************************/
`define FlitBitSize 16 //{dst[14], head[1], tail[1]}
`define FlitDst [13:0]
`define FlitHead [15:15]
`define FlitTail [14:14]

/*******************************
**      Struct Data           **
*******************************/
`define DataBitSize 32 //{dst[14], vc[5], num_flit[10]}
`define DataDst [31:18]
`define DataVc [16:13]
`define DataNumFlit [12:3]


/*******************************
**      Struct RoutingTable           **
*******************************/
`define RTBitSize 32 //{out_port[6], dst[14]}
`define RTOutPort [19:14]
`define RTDst [13:0]


/*******************************
**      Struct Init           **
*******************************/
`define InitBitSize 32 //same as data {dst[num_in_ports[7]], num_out_ports[7], num_vc[6], credit_dlay[12]}
`define InitNumInPort [31:25]
`define InitNumOutPort [24:18]
`define InitNumVc [16:12]
`define InitCreditDelay [11:0]


/*******************************
**      Struct InitTraffic    **
*******************************/
`define InitTrafficBitSize 32 //{total_num_traffic[10]}
`define InitTrafficTotalNumTraffic [31:22]

`define SafeAccess(array,i,limit) array[i] //( i >= 0 && i<limit ? array[i] : 'b0 )
//`endif
