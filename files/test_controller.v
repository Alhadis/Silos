`timescale 1ns / 1ps

module test_controller;
parameter AW=10;
    //clock
    reg             clk;
    reg             rst;

    //UDP interface
    reg             ctrl_in_udp_hdr_valid;
    wire            ctrl_in_udp_hdr_ready;
    reg [15:0]      ctrl_in_udp_length;
    reg [7:0]       ctrl_in_udp_payload_axis_tdata;
    reg             ctrl_in_udp_payload_axis_tvalid;
    wire            ctrl_in_udp_payload_axis_tready;
    reg             ctrl_in_udp_payload_axis_tlast;

    wire            ctrl_out_udp_hdr_valid;
    reg             ctrl_out_udp_hdr_ready;
    wire [31:0]     ctrl_out_ip_dest_ip;
    wire [15:0]     ctrl_out_udp_source_port;
    wire [15:0]     ctrl_out_udp_dest_port;
    wire [15:0]     ctrl_out_udp_length;
    wire [7:0]      ctrl_out_udp_payload_axis_tdata;
    wire            ctrl_out_udp_payload_axis_tvalid;
    reg             ctrl_out_udp_payload_axis_tready;
    wire            ctrl_out_udp_payload_axis_tlast;

    //AXI reg access
    wire [13:0]         reg_addr;
    wire                reg_rd_udp_mac;
    wire                reg_wr_udp_mac;
    wire                reg_busy;
    wire [31:0]         reg_writedata;
    wire [31:0]         reg_readdata_udp_mac;
    
controller #(.SIMULATION(0), .AW(AW)) controller_inst(
    //input
    .clk                (clk),
    .rst                (rst),

    //UDP frame input
    .ctrl_in_udp_hdr_valid                  (ctrl_in_udp_hdr_valid),
    .ctrl_in_udp_hdr_ready                  (ctrl_in_udp_hdr_ready),
    .ctrl_in_ip_fragment_offset             (13'h0),
    .ctrl_in_ip_source_ip                   (32'h0a000001),
    .ctrl_in_ip_dest_ip                     (32'h0a000002),
    .ctrl_in_udp_source_port                (16'h3456),
    .ctrl_in_udp_dest_port                  (16'h6789),
    .ctrl_in_udp_length                     (ctrl_in_udp_length),
    .ctrl_in_udp_payload_axis_tdata         (ctrl_in_udp_payload_axis_tdata),
    .ctrl_in_udp_payload_axis_tvalid        (ctrl_in_udp_payload_axis_tvalid),
    .ctrl_in_udp_payload_axis_tready        (ctrl_in_udp_payload_axis_tready),
    .ctrl_in_udp_payload_axis_tlast         (ctrl_in_udp_payload_axis_tlast),
    .ctrl_in_udp_err                        (1'b0),

    //UDP frame output
    .ctrl_out_udp_hdr_valid                 (ctrl_out_udp_hdr_valid),
    .ctrl_out_udp_hdr_ready                 (ctrl_out_udp_hdr_ready),
    .ctrl_out_ip_dest_ip                    (ctrl_out_ip_dest_ip),
    .ctrl_out_udp_source_port               (ctrl_out_udp_source_port),
    .ctrl_out_udp_dest_port                 (ctrl_out_udp_dest_port),
    .ctrl_out_udp_length                    (ctrl_out_udp_length),
    .ctrl_out_udp_payload_axis_tdata        (ctrl_out_udp_payload_axis_tdata),
    .ctrl_out_udp_payload_axis_tvalid       (ctrl_out_udp_payload_axis_tvalid),
    .ctrl_out_udp_payload_axis_tready       (ctrl_out_udp_payload_axis_tready),
    .ctrl_out_udp_payload_axis_tlast        (ctrl_out_udp_payload_axis_tlast),
    .local_ip                               (32'h0a000002),

    //AXI reg access
    .reg_addr                               (reg_addr),
    .reg_rd_udp_mac                         (reg_rd_udp_mac),
    .reg_wr_udp_mac                         (reg_wr_udp_mac),
    .reg_ready_udp_mac                      (!reg_busy),
    .reg_writedata                          (reg_writedata),
    .reg_readdata_udp_mac                   (reg_readdata_udp_mac)
);

ether1 ether1_inst (
    .ff_tx_data(),
    .ff_tx_eop(1'b0),
    .ff_tx_err(1'b0),
    .ff_tx_rdy(),
    .ff_tx_sop(1'b0),
    .ff_tx_wren(1'b0),
    .ff_tx_clk(clk),
    .ff_rx_data(),
    .ff_rx_dval(),
    .ff_rx_eop(),
    .ff_rx_rdy(1'b0),
    .ff_rx_sop(),
    .rx_err(),
    .ff_rx_clk(clk),
    .mdc(),
    .mdio_in(),
    .mdio_oen(),
    .mdio_out(),
    .address        (reg_addr[7:0]),
    .readdata       (reg_readdata_udp_mac),
    .read           (reg_rd_udp_mac),
    .writedata      (reg_writedata),
    .write          (reg_wr_udp_mac),
    .waitrequest    (reg_busy),
    .clk(clk),
    .reset(rst),
    .rgmii_in(),
    .rgmii_out(),
    .rx_control(),
    .tx_control(),
    .tx_clk(clk),
    .rx_clk(clk),
    .set_10(1'b0),
    .set_1000(1'b0),
    .ena_10(),
    .eth_mode(),
    .ff_tx_crc_fwd(1'b0),
    .ff_tx_septy(),
    .tx_ff_uflow(),
    .ff_tx_a_full(),
    .ff_tx_a_empty(),
    .rx_err_stat(),
    .rx_frm_type(),
    .ff_rx_dsav(),
    .ff_rx_a_full(),
    .ff_rx_a_empty()
);

always
begin
    clk <= 1'b 1;
    #5;
    clk <= 1'b 0;
    #5;
end

    reg [15:0]      udp_pkt[1023:0];
    reg [15:0]      udp_out[1023:0];
    integer i;
initial
begin
    $readmemh("../testbench/inram.txt", udp_pkt);
    for (i=0; i<1024; i=i+1)
    if (udp_pkt[i] === 16'hxxxx)
    begin
        ctrl_in_udp_length = i * 2 + 8;
        i = 1025;
    end    
    rst = 0;
    ctrl_in_udp_hdr_valid <= #1 0;
    ctrl_in_udp_payload_axis_tlast <= #1 0;
    ctrl_in_udp_payload_axis_tvalid <= #1 0;
    ctrl_out_udp_hdr_ready <= #1 0;
    ctrl_out_udp_payload_axis_tready <= #1 0;
    @(posedge clk);
    rst = 1;
    #1000;
    rst = 0;
    #200;
    @(posedge clk);
    ctrl_in_udp_hdr_valid <= #1 1;
    @(posedge clk);
    while (ctrl_in_udp_hdr_ready == 0)
        @(posedge clk);
    ctrl_in_udp_hdr_valid <= #1 0;
    ctrl_in_udp_payload_axis_tvalid <= #1 1;
    for (i=0; i< (ctrl_in_udp_length - 8) / 2; i=i+1)
    begin
        ctrl_in_udp_payload_axis_tdata <= #1 udp_pkt[i][15:8];
        @(posedge clk);
        while (ctrl_in_udp_payload_axis_tready == 0)
            @(posedge clk);
        ctrl_in_udp_payload_axis_tdata <= #1 udp_pkt[i][7:0];
        if (i + 1 == (ctrl_in_udp_length - 8) / 2)
            ctrl_in_udp_payload_axis_tlast <= #1 1;
        @(posedge clk);
        while (ctrl_in_udp_payload_axis_tready == 0)
            @(posedge clk);
    end
    ctrl_in_udp_payload_axis_tvalid <= #1 0;
    ctrl_in_udp_payload_axis_tlast <= #1 0;    
    ctrl_out_udp_hdr_ready <= #1 1;
    @(posedge clk);
    while (ctrl_out_udp_hdr_valid == 0)
        @(posedge clk);
    ctrl_out_udp_hdr_ready <= #1 0;
    $display("ip_dest=%x,udp_dest=%x,udp_source=%x,udp_len=%d", ctrl_out_ip_dest_ip, 
            ctrl_out_udp_dest_port, ctrl_out_udp_source_port, ctrl_out_udp_length);
    ctrl_out_udp_payload_axis_tready <= #1 1;
    i=0;
    @(posedge clk);
    while (!(ctrl_out_udp_payload_axis_tlast && ctrl_out_udp_payload_axis_tvalid))
    begin
        if (ctrl_out_udp_payload_axis_tvalid)
        begin
            if (i & 1)
                udp_out[i/2][7:0] = ctrl_out_udp_payload_axis_tdata;
            else
                udp_out[i/2][15:8] = ctrl_out_udp_payload_axis_tdata;
            i = i+1;
        end
        @(posedge clk);
    end
    if (i & 1)
        udp_out[i/2][7:0] = ctrl_out_udp_payload_axis_tdata;
    else
        udp_out[i/2][15:8] = ctrl_out_udp_payload_axis_tdata;
    ctrl_out_udp_payload_axis_tready <= #1 0;
    $writememh("../testbench/outram.txt",udp_out);
    $display("finish rst!");
    $stop;
end
endmodule