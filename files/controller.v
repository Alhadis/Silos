`timescale 1ns / 1ps
module controller (
    //input
    clk,
    rst,

    //UDP frame input
    ctrl_in_udp_hdr_valid,
    ctrl_in_udp_hdr_ready,
    ctrl_in_ip_fragment_offset,
    ctrl_in_ip_source_ip,
    ctrl_in_ip_dest_ip,
    ctrl_in_udp_source_port,
    ctrl_in_udp_dest_port,
    ctrl_in_udp_length,
    ctrl_in_udp_payload_axis_tdata,
    ctrl_in_udp_payload_axis_tvalid,
    ctrl_in_udp_payload_axis_tready,
    ctrl_in_udp_payload_axis_tlast,
    ctrl_in_udp_err,

    //UDP frame output
    ctrl_out_udp_hdr_valid,
    ctrl_out_udp_hdr_ready,
    ctrl_out_ip_dest_ip,
    ctrl_out_udp_source_port,
    ctrl_out_udp_dest_port,
    ctrl_out_udp_length,
    ctrl_out_udp_payload_axis_tdata,
    ctrl_out_udp_payload_axis_tvalid,
    ctrl_out_udp_payload_axis_tready,
    ctrl_out_udp_payload_axis_tlast,
    local_ip,

    //AXI reg access
    reg_addr,
    reg_rd_udp_mac,
    reg_wr_udp_mac,
    reg_ready_udp_mac,
    reg_writedata,
    reg_readdata_udp_mac
);
    parameter SIMULATION = 0;
    parameter AW=10;
    localparam CTRL_UDP_PORT = 16'h6789;
    localparam MAGIC_WORD = 16'hCBAE;
    input           clk;
    input           rst;
    input           ctrl_in_udp_hdr_valid;
    output reg      ctrl_in_udp_hdr_ready;
    input [12:0]    ctrl_in_ip_fragment_offset;
    input [31:0]    ctrl_in_ip_source_ip;
    input [31:0]    ctrl_in_ip_dest_ip;
    input [15:0]    ctrl_in_udp_source_port;
    input [15:0]    ctrl_in_udp_dest_port;
    input [15:0]    ctrl_in_udp_length;
    input [7:0]     ctrl_in_udp_payload_axis_tdata;
    input           ctrl_in_udp_payload_axis_tvalid;
    output reg      ctrl_in_udp_payload_axis_tready;
    input           ctrl_in_udp_payload_axis_tlast;
    input           ctrl_in_udp_err;
    output reg          ctrl_out_udp_hdr_valid;
    input               ctrl_out_udp_hdr_ready;
    output reg [31:0]   ctrl_out_ip_dest_ip;
    output reg [15:0]   ctrl_out_udp_source_port;
    output reg [15:0]   ctrl_out_udp_dest_port;
    output [15:0]       ctrl_out_udp_length;
    output [7:0]        ctrl_out_udp_payload_axis_tdata;
    output reg          ctrl_out_udp_payload_axis_tvalid;
    input               ctrl_out_udp_payload_axis_tready;
    output              ctrl_out_udp_payload_axis_tlast;
    input [31:0]        local_ip;
    output [13:0]   reg_addr;
    output          reg_rd_udp_mac;
    output          reg_wr_udp_mac;
    input           reg_ready_udp_mac;
    output [31:0]   reg_writedata;
    input [31:0]    reg_readdata_udp_mac;
    wire            exec_inram_re;
    wire [15:0]     exec_inram_q;
    wire [AW-1:0]   exec_inram_address;
    wire [AW-1:0]   exec_outram_address;
    wire            exec_outram_we;
    wire [15:0]     exec_outram_d;
    wire            reg_rd;
    wire            reg_wr;
    wire            reg_ready;
    wire [31:0]     reg_readdata;
    reg             start_exec;
    wire            exec_busy;
    wire            exec_err;
    wire [AW-1:0]   exec_out_len;
    reg [15:0]      exec_in_len;
    wire            ctrl_inram_we;
    reg [AW-1:0]    ctrl_inram_address;
    reg [15:0]      ctrl_inram_d;
    wire            ctrl_outram_re;
    reg [AW-1:0]    ctrl_outram_address;
    wire [15:0]     ctrl_outram_q;
    reg [15:0]      ctrl_outram_q1;
    reg             udp_hdr_tx_finish;
    reg             ctrl_in_udp_payload_lo;
    reg             ctrl_in_valid;
    reg             ctrl_out_udp_payload_lo;
    wire            check_invalid;
    reg [15:0]      bad_pkt_cnt;
    reg [15:0]      good_pkt_cnt;
    assign reg_rd_udp_mac = (reg_rd && reg_addr[13:8] == 1);
    assign reg_wr_udp_mac = (reg_wr && reg_addr[13:8] == 1);
    assign reg_readdata = (reg_addr[13:8] == 1) ? reg_readdata_udp_mac : 
                         ((reg_addr[13:0] == 14'hff) ? {bad_pkt_cnt, good_pkt_cnt} : 32'h0BAD0BAD);
    assign reg_ready = (reg_addr[13:8] == 1) ? reg_ready_udp_mac : 1'b1;
    assign ctrl_out_udp_length = (exec_out_len + 8'd4) << 1;
    execcmd #(AW) execcmd_inst(
    //input
    .clk                (clk),
    .rst                (rst),

    //input command ram
    .inram_address      (exec_inram_address),
    .inram_re           (exec_inram_re),
    .inram_q            (exec_inram_q),

    //output result ram
    .outram_address     (exec_outram_address),
    .outram_we          (exec_outram_we),
    .outram_d           (exec_outram_d),

    //AXI reg access
    .reg_addr           (reg_addr),
    .reg_rd             (reg_rd),
    .reg_wr             (reg_wr),
    .reg_ready          (reg_ready),
    .reg_writedata      (reg_writedata),
    .reg_readdata       (reg_readdata),

    //controller
    .start_exec         (start_exec),
    .busy               (exec_busy),
    .err                (exec_err),
    .out_len            (exec_out_len)
);
    generate
if (SIMULATION) begin : SIM
generic_spram  #(1, AW, 16) inram (
    .clk        (clk),
    .re         (exec_busy),
    .we         (ctrl_inram_we & !exec_busy),
    .addr       (exec_busy ? exec_inram_address : ctrl_inram_address),
    .q          (exec_inram_q),
    .data       (ctrl_inram_d)
);

generic_spram #(1, AW, 16) outram (
    .clk        (clk),
    .re         (!exec_busy),
    .we         (exec_outram_we & exec_busy),
    .addr       (exec_busy ? exec_outram_address : ctrl_outram_address),
    .q          (ctrl_outram_q),
    .data       (exec_outram_d)
);
end
else
begin
inputram inputram_inst (
    .address    (exec_busy ? exec_inram_address : ctrl_inram_address),
	.clock      (clk),
	.data       (ctrl_inram_d),
	.rden       (exec_busy),
	.wren       (ctrl_inram_we & !exec_busy),
	.q          (exec_inram_q)
);

outputram outputram_inst (
    .address    (exec_busy ? exec_outram_address : ctrl_outram_address),
	.clock      (clk),
	.data       (exec_outram_d),
	.rden       (!exec_busy),
	.wren       (exec_outram_we & exec_busy),
	.q          (ctrl_outram_q)
);
end
endgenerate
    assign ctrl_inram_we = ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tready && !ctrl_in_udp_payload_lo;
    always @(posedge clk)
    begin
        if (rst)
            ctrl_in_udp_payload_lo <= #1 0;
        else
            if (ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tready)
                ctrl_in_udp_payload_lo <= #1 !ctrl_in_udp_payload_lo;
    end
    always @(posedge clk)
    begin
        if (ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tready)
            if (ctrl_in_udp_payload_lo)
                ctrl_inram_d[7:0] <= #1 ctrl_in_udp_payload_axis_tdata;
            else
                ctrl_inram_d[15:8] <= #1 ctrl_in_udp_payload_axis_tdata;
    end
    always @(posedge clk)
    begin
        if (rst || start_exec)
            ctrl_inram_address <= #1 (~0);
        else
            if (ctrl_inram_we)
                ctrl_inram_address <= #1 ctrl_inram_address + 1'b1;
    end
    always @(posedge clk)
    begin
        if (ctrl_inram_address == 0 && ctrl_inram_we)
            exec_in_len <= #1 ctrl_inram_d;
    end
    assign ctrl_outram_re = ctrl_out_udp_payload_axis_tvalid && ctrl_out_udp_payload_axis_tready && ctrl_out_udp_payload_lo || ctrl_out_udp_hdr_valid && ctrl_out_udp_hdr_ready;
    assign ctrl_out_udp_payload_axis_tlast = (ctrl_outram_address == exec_out_len) && ctrl_outram_re;
    always @(posedge clk)
    begin
        if (rst)
            ctrl_out_udp_payload_lo <= #1 0;
        else
            if (ctrl_out_udp_payload_axis_tvalid && ctrl_out_udp_payload_axis_tready)
                ctrl_out_udp_payload_lo <= #1 !ctrl_out_udp_payload_lo;
    end
    always @(posedge clk)
    begin
        if (ctrl_outram_re)
            ctrl_outram_q1 <= #1 ctrl_outram_q;
    end
    always @(posedge clk)
    begin
        if (rst || start_exec)
            ctrl_outram_address <= #1 0;
        else
            if (ctrl_outram_re)
                ctrl_outram_address <= #1 ctrl_outram_address + 1;
    end
    assign ctrl_out_udp_payload_axis_tdata = ctrl_out_udp_payload_lo ? ctrl_outram_q1[7:0] : ctrl_outram_q1[15:8];
    assign check_invalid = (ctrl_in_ip_dest_ip != local_ip && ctrl_in_ip_dest_ip != 32'hffffffff) || ctrl_in_udp_dest_port != CTRL_UDP_PORT || ctrl_in_udp_err || ctrl_in_udp_length <= 12 || ctrl_in_ip_fragment_offset !=0;
    //states for block rec_udp
    reg		rec_udp_00;
    reg		rec_udp_01;
    reg		rec_udp_02;
    reg		rec_udp_03;
    reg		rec_udp_04;
    reg		rec_udp_05;
    reg		rec_udp_06;
    reg		rec_udp_07;

    //states for block tx_udp
    reg		tx_udp_00;
    reg		tx_udp_01;
    reg		tx_udp_02;
    reg		tx_udp_03;
    reg		tx_udp_04;
    reg		tx_udp_05;
    reg		tx_udp_06;


//state transition for block rec_udp
    always @(posedge clk)
    if (rst)
        rec_udp_00 <= #1 1;
    else
        rec_udp_00 <= #1 rec_udp_07 || rec_udp_02&&(ctrl_in_udp_length<=8) || rec_udp_03&&(ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tlast);

    always @(posedge clk)
    if (rst)
        rec_udp_01 <= #1 0;
    else
        rec_udp_01 <= #1 rec_udp_01&&(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid) || rec_udp_00;

    always @(posedge clk)
    if (rst)
        rec_udp_02 <= #1 0;
    else
        rec_udp_02 <= #1 rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid)&&check_invalid;

    always @(posedge clk)
    if (rst)
        rec_udp_03 <= #1 0;
    else
        rec_udp_03 <= #1 rec_udp_02&&(ctrl_in_udp_length > 8) || rec_udp_03&&!(ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tlast);

    always @(posedge clk)
    if (rst)
        rec_udp_04 <= #1 0;
    else
        rec_udp_04 <= #1 rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid)&&!check_invalid;

    always @(posedge clk)
    if (rst)
        rec_udp_05 <= #1 0;
    else
        rec_udp_05 <= #1 rec_udp_05&&!(ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tlast) || rec_udp_04;

    always @(posedge clk)
    if (rst)
        rec_udp_06 <= #1 0;
    else
        rec_udp_06 <= #1 rec_udp_05&&(ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tlast);

    always @(posedge clk)
    if (rst)
        rec_udp_07 <= #1 0;
    else
        rec_udp_07 <= #1 rec_udp_06;

//state transition for block tx_udp
    always @(posedge clk)
    if (rst)
        tx_udp_00 <= #1 1;
    else
        tx_udp_00 <= #1 tx_udp_06&&ctrl_out_udp_payload_axis_tlast || tx_udp_03&&!exec_busy&&exec_err;

    always @(posedge clk)
    if (rst)
        tx_udp_01 <= #1 0;
    else
        tx_udp_01 <= #1 tx_udp_01&&!start_exec || tx_udp_00;

    always @(posedge clk)
    if (rst)
        tx_udp_02 <= #1 0;
    else
        tx_udp_02 <= #1 tx_udp_01&&start_exec;

    always @(posedge clk)
    if (rst)
        tx_udp_03 <= #1 0;
    else
        tx_udp_03 <= #1 tx_udp_03&&exec_busy || tx_udp_02;

    always @(posedge clk)
    if (rst)
        tx_udp_04 <= #1 0;
    else
        tx_udp_04 <= #1 tx_udp_03&&!exec_busy&&!exec_err;

    always @(posedge clk)
    if (rst)
        tx_udp_05 <= #1 0;
    else
        tx_udp_05 <= #1 tx_udp_05&&!ctrl_out_udp_hdr_ready || tx_udp_04&&!ctrl_out_udp_hdr_ready;

    always @(posedge clk)
    if (rst)
        tx_udp_06 <= #1 0;
    else
        tx_udp_06 <= #1 tx_udp_06&&!ctrl_out_udp_payload_axis_tlast || tx_udp_05&&ctrl_out_udp_hdr_ready || tx_udp_04&&ctrl_out_udp_hdr_ready;


    always @(posedge clk)
        if (rst)
            bad_pkt_cnt <= #1 0;
        else
        begin
            if (rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid)&&check_invalid)
                bad_pkt_cnt <= #1 bad_pkt_cnt + 1'b1;
            if (rec_udp_07&&!ctrl_in_valid)
                bad_pkt_cnt <= #1 bad_pkt_cnt + 1'b1;
            if (tx_udp_03&&!exec_busy&&exec_err)
                bad_pkt_cnt <= #1 bad_pkt_cnt + 1'b1;
        end

    always @(posedge clk)
        if (rst)
            ctrl_in_udp_hdr_ready <= #1 0;
        else
        begin
            if (rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid))
                ctrl_in_udp_hdr_ready <= #1 1;
            if (rec_udp_02)
                ctrl_in_udp_hdr_ready <= #1 0;
            if (rec_udp_04)
                ctrl_in_udp_hdr_ready <= #1 0;
        end

    always @(posedge clk)
        if (rst)
            ctrl_in_udp_payload_axis_tready <= #1 0;
        else
        begin
            if (rec_udp_02&&(ctrl_in_udp_length > 8))
                ctrl_in_udp_payload_axis_tready <= #1 1;
            if (rec_udp_03&&(ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tlast))
                ctrl_in_udp_payload_axis_tready <= #1 0;
            if (rec_udp_04)
                ctrl_in_udp_payload_axis_tready <= #1 1;
            if (rec_udp_05&&(ctrl_in_udp_payload_axis_tvalid && ctrl_in_udp_payload_axis_tlast))
                ctrl_in_udp_payload_axis_tready <= #1 0;
        end

    always @(posedge clk)
        if (rst)
            ctrl_in_valid <= #1 0;
        else
        begin
            if (rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid)&&check_invalid)
                ctrl_in_valid <= #1 0;
            if (rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid)&&!check_invalid)
                ctrl_in_valid <= #1 1;
            if (rec_udp_06&&(ctrl_inram_d != MAGIC_WORD || ctrl_in_udp_payload_lo || exec_in_len != ctrl_inram_address || exec_in_len == 1))
                ctrl_in_valid <= #1 0;
        end

    always @(posedge clk)
    begin
        if (rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid))
            ctrl_out_ip_dest_ip <= #1 ctrl_in_ip_source_ip;
    end

    always @(posedge clk)
    begin
        if (rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid))
            ctrl_out_udp_dest_port <= #1 ctrl_in_udp_source_port;
    end

    always @(posedge clk)
        if (rst)
            ctrl_out_udp_hdr_valid <= #1 0;
        else
        begin
            if (tx_udp_03&&!exec_busy&&!exec_err)
                ctrl_out_udp_hdr_valid <= #1 1;
            if (tx_udp_05&&ctrl_out_udp_hdr_ready || tx_udp_04&&ctrl_out_udp_hdr_ready)
                ctrl_out_udp_hdr_valid <= #1 0;
        end

    always @(posedge clk)
        if (rst)
            ctrl_out_udp_payload_axis_tvalid <= #1 0;
        else
        begin
            if (tx_udp_05&&ctrl_out_udp_hdr_ready || tx_udp_04&&ctrl_out_udp_hdr_ready)
                ctrl_out_udp_payload_axis_tvalid <= #1 1;
            if (tx_udp_06&&ctrl_out_udp_payload_axis_tlast)
                ctrl_out_udp_payload_axis_tvalid <= #1 0;
        end

    always @(posedge clk)
    begin
        if (rec_udp_01&&!(exec_busy || !udp_hdr_tx_finish || !ctrl_in_udp_hdr_valid))
            ctrl_out_udp_source_port <= #1 ctrl_in_udp_dest_port;
    end

    always @(posedge clk)
        if (rst)
            good_pkt_cnt <= #1 0;
        else
        begin
            if (tx_udp_06&&ctrl_out_udp_payload_axis_tlast)
                good_pkt_cnt <= #1 good_pkt_cnt + 1;
        end

    always @(posedge clk)
        if (rst)
            start_exec <= #1 0;
        else
        begin
            if (rec_udp_00)
                start_exec <= #1 0;
            if (rec_udp_07&&ctrl_in_valid)
                start_exec <= #1 1;
        end

    always @(posedge clk)
        if (rst)
            udp_hdr_tx_finish <= #1 1;
        else
        begin
            if (tx_udp_01&&start_exec)
                udp_hdr_tx_finish <= #1 0;
            if (tx_udp_06&&ctrl_out_udp_payload_axis_tlast)
                udp_hdr_tx_finish <= #1 1;
        end

endmodule
