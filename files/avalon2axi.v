
`timescale 1ns / 1ps
module avalon2axi
(
    clk,
    rst,

    sop,
    eop,
    data,
    rdy,
    dval,
    axi_data,
    axi_valid,
    axi_rdy,
    axi_last
);
parameter DATAWIDTH = 8;
parameter MAX_READY_LATENCY = 2;
parameter QUEUE_IDX_LEN = 1;
    input                   clk;
    input                   rst;

    input                   sop;
    input                   eop;
    input [DATAWIDTH-1:0]   data;
    output                  rdy;
    input                   dval;
    output [DATAWIDTH-1:0]  axi_data;
    output                  axi_valid;
    input                   axi_rdy;
    output                  axi_last;
    
    reg [DATAWIDTH-1:0]     data_queue[MAX_READY_LATENCY - 1 : 0];
    reg [QUEUE_IDX_LEN:0]   queue_head, queue_tail;
    reg                     eop_d;
    
    assign axi_data = (queue_head == queue_tail) ? data : data_queue[queue_head[QUEUE_IDX_LEN-1:0]];
    assign axi_valid = dval || (queue_head != queue_tail);
    assign rdy = axi_rdy;
    assign axi_last = (queue_head == queue_tail) && (eop ^ eop_d);
    
    always @(posedge clk) begin
        if (rst) begin
            queue_head <= #1 0;
            queue_tail <= #1 0;
        end
        else begin
            if (dval)
                queue_tail <= #1 queue_tail + 1'b1;
            if (axi_rdy && axi_valid)
                queue_head <= #1 queue_head + 1'b1;
        end
    end
    
    always @(posedge clk)
        data_queue[queue_tail[QUEUE_IDX_LEN-1:0]] <= #1 data;
        
    always @(posedge clk) begin
        if (rst)
            eop_d <= #1 0;
        else
            if (axi_last)
                eop_d <= #1 0;
            else
                if (eop)
                    eop_d <= #1 1;
    end
endmodule