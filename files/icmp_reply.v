`timescale 1ns / 1ps
module icmp_reply (
    clk,
    rst,
    // ICMP frame output
    m_icmp_ip_hdr_valid,
    m_icmp_ip_hdr_ready,
    m_icmp_ip_dscp,
    m_icmp_ip_ecn,
    m_icmp_ip_length,
    m_icmp_ip_ttl,
    m_icmp_ip_protocol,
    m_icmp_source_ip,
    m_icmp_dest_ip,
    m_icmp_payload_axis_tdata,
    m_icmp_payload_axis_tvalid,
    m_icmp_payload_axis_tready,
    m_icmp_payload_axis_tlast,
    m_icmp_payload_axis_tuser,
    // ICMP frame input
    s_icmp_ip_hdr_valid,
    s_icmp_ip_hdr_ready,
    s_icmp_ip_length,
    s_icmp_ip_protocol,
    s_icmp_source_ip,
    s_icmp_dest_ip,
    s_icmp_payload_axis_tdata,
    s_icmp_payload_axis_tvalid,
    s_icmp_payload_axis_tready,
    s_icmp_payload_axis_tlast,
    local_ip
);
    input                   clk;
    input                   rst;
    output reg              m_icmp_ip_hdr_valid;
    input                   m_icmp_ip_hdr_ready;
    output [5:0]            m_icmp_ip_dscp;
    output [1:0]            m_icmp_ip_ecn;
    output [15:0]           m_icmp_ip_length;
    output [7:0]            m_icmp_ip_ttl;
    output [7:0]            m_icmp_ip_protocol;
    output [31:0]           m_icmp_source_ip;
    output [31:0]           m_icmp_dest_ip;
    output [7:0]            m_icmp_payload_axis_tdata;
    output                  m_icmp_payload_axis_tvalid;
    input                   m_icmp_payload_axis_tready;
    output                  m_icmp_payload_axis_tlast;
    output                  m_icmp_payload_axis_tuser;
    input                   s_icmp_ip_hdr_valid;
    output reg              s_icmp_ip_hdr_ready;
    input [15:0]            s_icmp_ip_length;
    input [7:0]             s_icmp_ip_protocol;
    input [31:0]            s_icmp_source_ip;
    input [31:0]            s_icmp_dest_ip;
    input [7:0]             s_icmp_payload_axis_tdata;
    input                   s_icmp_payload_axis_tvalid;
    output                  s_icmp_payload_axis_tready;
    input                   s_icmp_payload_axis_tlast;
    input [31:0]            local_ip;
    wire                    need_reply;
    reg [9:0]               frame_length;
    reg                     payload_fwd;
    reg                     payload_drop;
    wire [8:0]              new_checksum;
    reg                     new_checksum_carry;
    assign m_icmp_payload_axis_tuser = 1'b0;
    assign m_icmp_ip_dscp = 1;
    assign m_icmp_ip_ecn = 0;
    assign m_icmp_ip_ttl = 55;
    assign m_icmp_ip_protocol = 1;
    assign m_icmp_payload_axis_tvalid = s_icmp_payload_axis_tvalid & payload_fwd;
    assign s_icmp_payload_axis_tready = m_icmp_payload_axis_tready & payload_fwd || payload_drop;
    assign m_icmp_payload_axis_tlast = s_icmp_payload_axis_tlast & payload_fwd;
    assign new_checksum = s_icmp_payload_axis_tdata + 8'd8;
    assign m_icmp_payload_axis_tdata =  (frame_length==0) ? 8'd0 : 
                                        ((frame_length==2) ? new_checksum :
                                        ((frame_length==3) ? s_icmp_payload_axis_tdata + new_checksum_carry :
                                        s_icmp_payload_axis_tdata));
    assign m_icmp_ip_length = s_icmp_ip_length;
    assign m_icmp_source_ip = s_icmp_dest_ip;
    assign m_icmp_dest_ip = s_icmp_source_ip;
    assign need_reply = (s_icmp_payload_axis_tdata == 8 && local_ip == s_icmp_dest_ip);
    //states for block icmp_echo
    reg		icmp_echo_00;
    reg		icmp_echo_01;
    reg		icmp_echo_02;
    reg		icmp_echo_03;
    reg		icmp_echo_04;
    reg		icmp_echo_05;
    reg		icmp_echo_06;


//state transition for block icmp_echo
    always @(posedge clk)
    if (rst)
        icmp_echo_00 <= #1 1;
    else
        icmp_echo_00 <= #1 icmp_echo_06&&(m_icmp_payload_axis_tvalid && m_icmp_payload_axis_tready && m_icmp_payload_axis_tlast) || icmp_echo_02&&(s_icmp_payload_axis_tvalid && s_icmp_payload_axis_tlast);

    always @(posedge clk)
    if (rst)
        icmp_echo_01 <= #1 0;
    else
        icmp_echo_01 <= #1 icmp_echo_01&&!(s_icmp_ip_hdr_valid && s_icmp_ip_protocol == 1 && s_icmp_payload_axis_tvalid) || icmp_echo_00;

    always @(posedge clk)
    if (rst)
        icmp_echo_02 <= #1 0;
    else
        icmp_echo_02 <= #1 icmp_echo_01&&(s_icmp_ip_hdr_valid && s_icmp_ip_protocol == 1 && s_icmp_payload_axis_tvalid)&&!need_reply || icmp_echo_02&&!(s_icmp_payload_axis_tvalid && s_icmp_payload_axis_tlast);

    always @(posedge clk)
    if (rst)
        icmp_echo_03 <= #1 0;
    else
        icmp_echo_03 <= #1 icmp_echo_01&&(s_icmp_ip_hdr_valid && s_icmp_ip_protocol == 1 && s_icmp_payload_axis_tvalid)&&need_reply;

    always @(posedge clk)
    if (rst)
        icmp_echo_04 <= #1 0;
    else
        icmp_echo_04 <= #1 icmp_echo_04&&!m_icmp_ip_hdr_ready || icmp_echo_03&&!m_icmp_ip_hdr_ready;

    always @(posedge clk)
    if (rst)
        icmp_echo_05 <= #1 0;
    else
        icmp_echo_05 <= #1 icmp_echo_04&&m_icmp_ip_hdr_ready || icmp_echo_03&&m_icmp_ip_hdr_ready;

    always @(posedge clk)
    if (rst)
        icmp_echo_06 <= #1 0;
    else
        icmp_echo_06 <= #1 icmp_echo_06&&!(m_icmp_payload_axis_tvalid && m_icmp_payload_axis_tready && m_icmp_payload_axis_tlast) || icmp_echo_05;


    always @(posedge clk)
        if (rst)
            frame_length <= #1 0;
        else
        begin
            if (icmp_echo_00)
                frame_length <= #1 0;
            if (icmp_echo_06&&(m_icmp_payload_axis_tvalid && m_icmp_payload_axis_tready))
                frame_length <= #1 frame_length + 1'b1;
        end

    always @(posedge clk)
        if (rst)
            m_icmp_ip_hdr_valid <= #1 0;
        else
        begin
            if (icmp_echo_01&&(s_icmp_ip_hdr_valid && s_icmp_ip_protocol == 1 && s_icmp_payload_axis_tvalid)&&need_reply)
                m_icmp_ip_hdr_valid <= #1 1;
            if (icmp_echo_04&&m_icmp_ip_hdr_ready || icmp_echo_03&&m_icmp_ip_hdr_ready)
                m_icmp_ip_hdr_valid <= #1 0;
        end

    always @(posedge clk)
    begin
        if (icmp_echo_06&&(frame_length == 2)&&(m_icmp_payload_axis_tvalid && m_icmp_payload_axis_tready))
            new_checksum_carry <= #1 new_checksum[8];
    end

    always @(posedge clk)
        if (rst)
            payload_drop <= #1 0;
        else
        begin
            if (icmp_echo_01&&(s_icmp_ip_hdr_valid && s_icmp_ip_protocol == 1 && s_icmp_payload_axis_tvalid)&&!need_reply)
                payload_drop <= #1 1;
            if (icmp_echo_02&&(s_icmp_payload_axis_tvalid && s_icmp_payload_axis_tlast))
                payload_drop <= #1 0;
        end

    always @(posedge clk)
        if (rst)
            payload_fwd <= #1 0;
        else
        begin
            if (icmp_echo_05)
                payload_fwd <= #1 1;
            if (icmp_echo_06&&(m_icmp_payload_axis_tvalid && m_icmp_payload_axis_tready && m_icmp_payload_axis_tlast))
                payload_fwd <= #1 0;
        end

    always @(posedge clk)
        if (rst)
            s_icmp_ip_hdr_ready <= #1 0;
        else
        begin
            if (icmp_echo_01&&(s_icmp_ip_hdr_valid && s_icmp_ip_protocol == 1 && s_icmp_payload_axis_tvalid)&&!need_reply)
                s_icmp_ip_hdr_ready <= #1 1;
            if (icmp_echo_02&&(s_icmp_payload_axis_tvalid && s_icmp_payload_axis_tlast))
                s_icmp_ip_hdr_ready <= #1 0;
            if (icmp_echo_04&&m_icmp_ip_hdr_ready || icmp_echo_03&&m_icmp_ip_hdr_ready)
                s_icmp_ip_hdr_ready <= #1 1;
            if (icmp_echo_05)
                s_icmp_ip_hdr_ready <= #1 0;
        end

endmodule
