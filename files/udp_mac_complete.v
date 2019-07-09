/*
    UDP use open source https://github.com/alexforencich/verilog-ethernet
    MAC use Altera IP
    ICMP is my design
    Add register, local_ip, subnet_mask, gateway
    2019.6.15 Chen Yu
*/
`timescale 1ns / 1ps

module udp_mac_complete
(
    clk,
    rst,

    //config register
    reg_addr,
    reg_rd,
    reg_wr,
    reg_busy,
    reg_writedata,
    reg_readdata,

    //mii signal
    tx_clk,
    rx_clk,
    tx_control,
    rx_control,
    rgmii_in,
    rgmii_out,
    
    //IP frame input
    in_ip_hdr_valid,
    in_ip_hdr_ready,
    in_ip_dscp,
    in_ip_ecn,
    in_ip_length,
    in_ip_ttl,
    in_ip_protocol,
    in_ip_source_ip,
    in_ip_dest_ip,
    in_ip_payload_axis_tdata,
    in_ip_payload_axis_tvalid,
    in_ip_payload_axis_tready,
    in_ip_payload_axis_tlast,
    in_ip_payload_axis_tuser,
    
    // UDP frame input
    tx_udp_hdr_valid,
    tx_udp_hdr_ready,
    tx_udp_ip_dscp,
    tx_udp_ip_ecn,
    tx_udp_ip_ttl,
    tx_udp_ip_dest_ip,
    tx_udp_source_port,
    tx_udp_dest_port,
    tx_udp_length,
    tx_udp_checksum,
    tx_udp_payload_axis_tdata,
    tx_udp_payload_axis_tvalid,
    tx_udp_payload_axis_tready,
    tx_udp_payload_axis_tlast,
    tx_udp_payload_axis_tuser,

    // UDP frame output
    rx_udp_hdr_valid,
    rx_udp_hdr_ready,
    rx_udp_eth_dest_mac,
    rx_udp_eth_src_mac,
    rx_udp_eth_type,
    rx_udp_ip_version,
    rx_udp_ip_ihl,
    rx_udp_ip_dscp,
    rx_udp_ip_ecn,
    rx_udp_ip_length,
    rx_udp_ip_identification,
    rx_udp_ip_flags,
    rx_udp_ip_fragment_offset,
    rx_udp_ip_ttl,
    rx_udp_ip_protocol,
    rx_udp_ip_header_checksum,
    rx_udp_ip_source_ip,
    rx_udp_ip_dest_ip,
    rx_udp_source_port,
    rx_udp_dest_port,
    rx_udp_length,
    rx_udp_checksum,
    rx_udp_payload_axis_tdata,
    rx_udp_payload_axis_tvalid,
    rx_udp_payload_axis_tready,
    rx_udp_payload_axis_tlast,
    rx_udp_payload_axis_tuser,
    rx_udp_err,

    //local_ip
    local_ip,
    eth_mode,

    //mdio
    mdc,
    mdio_in,
    mdio_oen,
    mdio_out
);

    //clock and reset
    input           clk;
    input           rst;
    //config register
    input [7:0]     reg_addr;
    input [31:0]    reg_writedata;
    output [31:0]   reg_readdata;
    input           reg_rd;
    input           reg_wr;
    output          reg_busy;

    //mii signal
    input           tx_clk;
    input           rx_clk;
    output          tx_control;
    input           rx_control;
    input [3:0]     rgmii_in;
    output [3:0]    rgmii_out;

    //IP frame input
    input           in_ip_hdr_valid;
    output          in_ip_hdr_ready;
    input [5:0]     in_ip_dscp;
    input [1:0]     in_ip_ecn;
    input [15:0]    in_ip_length;
    input [7:0]     in_ip_ttl;
    input [7:0]     in_ip_protocol;
    input [31:0]    in_ip_source_ip;
    input [31:0]    in_ip_dest_ip;
    input [7:0]     in_ip_payload_axis_tdata;
    input           in_ip_payload_axis_tvalid;
    output          in_ip_payload_axis_tready;
    input           in_ip_payload_axis_tlast;
    input           in_ip_payload_axis_tuser;
    
    // UDP frame input
    input           tx_udp_hdr_valid;
    output          tx_udp_hdr_ready;
    input [5:0]     tx_udp_ip_dscp;
    input [1:0]     tx_udp_ip_ecn;
    input [7:0]     tx_udp_ip_ttl;
    input [31:0]    tx_udp_ip_dest_ip;
    input [15:0]    tx_udp_source_port;
    input [15:0]    tx_udp_dest_port;
    input [15:0]    tx_udp_length;
    input [15:0]    tx_udp_checksum;
    input [7:0]     tx_udp_payload_axis_tdata;
    input           tx_udp_payload_axis_tvalid;
    output          tx_udp_payload_axis_tready;
    input           tx_udp_payload_axis_tlast;
    input           tx_udp_payload_axis_tuser;

    // UDP frame output
    output          rx_udp_hdr_valid;
    input           rx_udp_hdr_ready;
    output [47:0]   rx_udp_eth_dest_mac;
    output [47:0]   rx_udp_eth_src_mac;
    output [15:0]   rx_udp_eth_type;
    output [3:0]    rx_udp_ip_version;
    output [3:0]    rx_udp_ip_ihl;
    output [5:0]    rx_udp_ip_dscp;
    output [1:0]    rx_udp_ip_ecn;
    output [15:0]   rx_udp_ip_length;
    output [15:0]   rx_udp_ip_identification;
    output [2:0]    rx_udp_ip_flags;
    output [12:0]   rx_udp_ip_fragment_offset;
    output [7:0]    rx_udp_ip_ttl;
    output [7:0]    rx_udp_ip_protocol;
    output [15:0]   rx_udp_ip_header_checksum;
    output [31:0]   rx_udp_ip_source_ip;
    output [31:0]   rx_udp_ip_dest_ip;
    output [15:0]   rx_udp_source_port;
    output [15:0]   rx_udp_dest_port;
    output [15:0]   rx_udp_length;
    output [15:0]   rx_udp_checksum;
    output [7:0]    rx_udp_payload_axis_tdata;
    output          rx_udp_payload_axis_tvalid;
    input           rx_udp_payload_axis_tready;
    output          rx_udp_payload_axis_tlast;
    output          rx_udp_payload_axis_tuser;
    output reg      rx_udp_err;

    //local_ip
    output reg [31:0]   local_ip;
    output          eth_mode;
    //MDIO
    output          mdc;
    input           mdio_in;
    output          mdio_oen;
    output          mdio_out;
    
    // Ethernet frame input
    wire            rx_eth_hdr_ready;
    wire            rx_eth_hdr_valid;
    wire [47:0]     rx_eth_dest_mac;
    wire [47:0]     rx_eth_src_mac;
    wire [15:0]     rx_eth_type;
    wire [7:0]      rx_eth_payload_axis_tdata;
    wire            rx_eth_payload_axis_tvalid;
    wire            rx_eth_payload_axis_tready;
    wire            rx_eth_payload_axis_tlast;
    wire            rx_eth_payload_axis_tuser;

    // Ethernet frame output
    wire            tx_eth_hdr_ready;
    wire            tx_eth_hdr_valid;
    wire [47:0]     tx_eth_dest_mac;
    wire [47:0]     tx_eth_src_mac;
    wire [15:0]     tx_eth_type;
    wire [7:0]      tx_eth_payload_axis_tdata;
    wire            tx_eth_payload_axis_tvalid;
    wire            tx_eth_payload_axis_tready;
    wire            tx_eth_payload_axis_tlast;
    wire            tx_eth_payload_axis_tuser;

// AXI between MAC and Ethernet modules
    wire [7:0]      rx_axis_tdata;
    wire            rx_axis_tvalid;
    wire            rx_axis_tready;
    wire            rx_axis_tlast;
    wire [5:0]      rx_err;

    wire            ff_rx_sop;
    wire            ff_rx_eop;
    wire [7:0]      ff_rx_data;
    wire            ff_rx_rdy;
    wire            ff_rx_dval;

    wire [7:0]      tx_axis_tdata;
    wire            tx_axis_tvalid;
    wire            tx_axis_tready;
    wire            tx_axis_tlast;
    wire            tx_axis_tuser;

    //ICMP frame output
    wire            m_icmp_ip_hdr_valid;
    wire            m_icmp_ip_hdr_ready;
    wire [5:0]      m_icmp_ip_dscp;
    wire [1:0]      m_icmp_ip_ecn;
    wire [15:0]     m_icmp_ip_length;
    wire [7:0]      m_icmp_ip_ttl;
    wire [7:0]      m_icmp_ip_protocol;
    wire [31:0]     m_icmp_source_ip;
    wire [31:0]     m_icmp_dest_ip;
    wire [7:0]      m_icmp_payload_axis_tdata;
    wire            m_icmp_payload_axis_tvalid;
    wire            m_icmp_payload_axis_tready;
    wire            m_icmp_payload_axis_tlast;
    wire            m_icmp_payload_axis_tuser;
    //ICMP frame input
    wire            s_icmp_ip_hdr_valid;
    wire            s_icmp_ip_hdr_ready;
    wire [15:0]     s_icmp_ip_length;
    wire [7:0]      s_icmp_ip_protocol;
    wire [31:0]     s_icmp_source_ip;
    wire [31:0]     s_icmp_dest_ip;
    wire [7:0]      s_icmp_payload_axis_tdata;
    wire            s_icmp_payload_axis_tvalid;
    wire            s_icmp_payload_axis_tready;
    wire            s_icmp_payload_axis_tlast;
    wire            s_icmp_payload_axis_tuser;

    //IP arb to IP output
    wire            s_ip_hdr_valid;
    wire            s_ip_hdr_ready;
    wire [5:0]      s_ip_dscp;
    wire [1:0]      s_ip_ecn;
    wire [15:0]     s_ip_length;
    wire [7:0]      s_ip_ttl;
    wire [7:0]      s_ip_protocol;
    wire [31:0]     s_ip_source_ip;
    wire [31:0]     s_ip_dest_ip;
    wire [7:0]      s_ip_payload_axis_tdata;
    wire            s_ip_payload_axis_tvalid;
    wire            s_ip_payload_axis_tready;
    wire            s_ip_payload_axis_tlast;
    wire            s_ip_payload_axis_tuser;

    
    //Avalon sop
    reg             ff_tx_sop_enable;

    //UDP config reg
    reg [47:0]      local_mac;
    reg [31:0]      gateway_ip;
    reg [31:0]      subnet_mask;

    //config signal
    wire [31:0]     readdata;
    wire [31:0]     writedata;
    wire [7:0]      address;
    wire            read;
    wire            write;

    //reset control sequence
    wire [31:0]     rst_writedata;
    wire [31:0]     rst_readdata;
    wire [7:0]      rst_addr;
    wire            rst_rd;
    wire            rst_wr;
    wire            reg_busy;
    wire            rst_finish;

    
udp_complete #(
    .ARP_CACHE_ADDR_WIDTH(3),
    .UDP_CHECKSUM_GEN_ENABLE(0)
)
udp_complete_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(rx_eth_hdr_valid),
    .s_eth_hdr_ready(rx_eth_hdr_ready),
    .s_eth_dest_mac(rx_eth_dest_mac),
    .s_eth_src_mac(rx_eth_src_mac),
    .s_eth_type(rx_eth_type),
    .s_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(tx_eth_hdr_valid),
    .m_eth_hdr_ready(tx_eth_hdr_ready),
    .m_eth_dest_mac(tx_eth_dest_mac),
    .m_eth_src_mac(tx_eth_src_mac),
    .m_eth_type(tx_eth_type),
    .m_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // IP frame input
    .s_ip_hdr_valid(s_ip_hdr_valid),
    .s_ip_hdr_ready(s_ip_hdr_ready),
    .s_ip_dscp(s_ip_dscp),
    .s_ip_ecn(s_ip_ecn),
    .s_ip_length(s_ip_length),
    .s_ip_ttl(s_ip_ttl),
    .s_ip_protocol(s_ip_protocol),
    .s_ip_source_ip(s_ip_source_ip),
    .s_ip_dest_ip(s_ip_dest_ip),
    .s_ip_payload_axis_tdata(s_ip_payload_axis_tdata),
    .s_ip_payload_axis_tvalid(s_ip_payload_axis_tvalid),
    .s_ip_payload_axis_tready(s_ip_payload_axis_tready),
    .s_ip_payload_axis_tlast(s_ip_payload_axis_tlast),
    .s_ip_payload_axis_tuser(s_ip_payload_axis_tuser),
    // IP frame output
    .m_ip_hdr_valid(s_icmp_ip_hdr_valid),
    .m_ip_hdr_ready(s_icmp_ip_hdr_ready),
    .m_ip_eth_dest_mac(),
    .m_ip_eth_src_mac(),
    .m_ip_eth_type(),
    .m_ip_version(),
    .m_ip_ihl(),
    .m_ip_dscp(),
    .m_ip_ecn(),
    .m_ip_length(s_icmp_ip_length),
    .m_ip_identification(),
    .m_ip_flags(),
    .m_ip_fragment_offset(),
    .m_ip_ttl(),
    .m_ip_protocol(s_icmp_ip_protocol),
    .m_ip_header_checksum(),
    .m_ip_source_ip(s_icmp_source_ip),
    .m_ip_dest_ip(s_icmp_dest_ip),
    .m_ip_payload_axis_tdata(s_icmp_payload_axis_tdata),
    .m_ip_payload_axis_tvalid(s_icmp_payload_axis_tvalid),
    .m_ip_payload_axis_tready(s_icmp_payload_axis_tready),
    .m_ip_payload_axis_tlast(s_icmp_payload_axis_tlast),
    .m_ip_payload_axis_tuser(s_icmp_payload_axis_tuser),
    // UDP frame input
    .s_udp_hdr_valid(tx_udp_hdr_valid),
    .s_udp_hdr_ready(tx_udp_hdr_ready),
    .s_udp_ip_dscp(tx_udp_ip_dscp),
    .s_udp_ip_ecn(tx_udp_ip_ecn),
    .s_udp_ip_ttl(tx_udp_ip_ttl),
    .s_udp_ip_source_ip(local_ip),
    .s_udp_ip_dest_ip(tx_udp_ip_dest_ip),
    .s_udp_source_port(tx_udp_source_port),
    .s_udp_dest_port(tx_udp_dest_port),
    .s_udp_length(tx_udp_length),
    .s_udp_checksum(tx_udp_checksum),
    .s_udp_payload_axis_tdata(tx_udp_payload_axis_tdata),
    .s_udp_payload_axis_tvalid(tx_udp_payload_axis_tvalid),
    .s_udp_payload_axis_tready(tx_udp_payload_axis_tready),
    .s_udp_payload_axis_tlast(tx_udp_payload_axis_tlast),
    .s_udp_payload_axis_tuser(tx_udp_payload_axis_tuser),
    // UDP frame output
    .m_udp_hdr_valid(rx_udp_hdr_valid),
    .m_udp_hdr_ready(rx_udp_hdr_ready),
    .m_udp_eth_dest_mac(rx_udp_eth_dest_mac),
    .m_udp_eth_src_mac(rx_udp_eth_src_mac),
    .m_udp_eth_type(rx_udp_eth_type),
    .m_udp_ip_version(rx_udp_ip_version),
    .m_udp_ip_ihl(rx_udp_ip_ihl),
    .m_udp_ip_dscp(rx_udp_ip_dscp),
    .m_udp_ip_ecn(rx_udp_ip_ecn),
    .m_udp_ip_length(rx_udp_ip_length),
    .m_udp_ip_identification(rx_udp_ip_identification),
    .m_udp_ip_flags(rx_udp_ip_flags),
    .m_udp_ip_fragment_offset(rx_udp_ip_fragment_offset),
    .m_udp_ip_ttl(rx_udp_ip_ttl),
    .m_udp_ip_protocol(rx_udp_ip_protocol),
    .m_udp_ip_header_checksum(rx_udp_ip_header_checksum),
    .m_udp_ip_source_ip(rx_udp_ip_source_ip),
    .m_udp_ip_dest_ip(rx_udp_ip_dest_ip),
    .m_udp_source_port(rx_udp_source_port),
    .m_udp_dest_port(rx_udp_dest_port),
    .m_udp_length(rx_udp_length),
    .m_udp_checksum(rx_udp_checksum),
    .m_udp_payload_axis_tdata(rx_udp_payload_axis_tdata),
    .m_udp_payload_axis_tvalid(rx_udp_payload_axis_tvalid),
    .m_udp_payload_axis_tready(rx_udp_payload_axis_tready),
    .m_udp_payload_axis_tlast(rx_udp_payload_axis_tlast),
    .m_udp_payload_axis_tuser(rx_udp_payload_axis_tuser),
    // Status signals
    .ip_rx_busy(),
    .ip_tx_busy(),
    .udp_rx_busy(),
    .udp_tx_busy(),
    .ip_rx_error_header_early_termination(),
    .ip_rx_error_payload_early_termination(),
    .ip_rx_error_invalid_header(),
    .ip_rx_error_invalid_checksum(),
    .ip_tx_error_payload_early_termination(),
    .ip_tx_error_arp_failed(),
    .udp_rx_error_header_early_termination(),
    .udp_rx_error_payload_early_termination(),
    .udp_tx_error_payload_early_termination(),
    // Configuration
    .local_mac(local_mac),
    .local_ip(local_ip),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask),
    .clear_arp_cache(1'b0)
);

icmp_reply icmp_reply_inst(
    .clk                            (clk),
    .rst                            (rst),
    // IP frame output
    .m_icmp_ip_hdr_valid            (m_icmp_ip_hdr_valid),
    .m_icmp_ip_hdr_ready            (m_icmp_ip_hdr_ready),
    .m_icmp_ip_dscp                 (m_icmp_ip_dscp),
    .m_icmp_ip_ecn                  (m_icmp_ip_ecn),
    .m_icmp_ip_length               (m_icmp_ip_length),
    .m_icmp_ip_ttl                  (m_icmp_ip_ttl),
    .m_icmp_ip_protocol             (m_icmp_ip_protocol),
    .m_icmp_source_ip               (m_icmp_source_ip),
    .m_icmp_dest_ip                 (m_icmp_dest_ip),
    .m_icmp_payload_axis_tdata      (m_icmp_payload_axis_tdata),
    .m_icmp_payload_axis_tvalid     (m_icmp_payload_axis_tvalid),
    .m_icmp_payload_axis_tready     (m_icmp_payload_axis_tready),
    .m_icmp_payload_axis_tlast      (m_icmp_payload_axis_tlast),
    .m_icmp_payload_axis_tuser      (m_icmp_payload_axis_tuser),
    // IP frame input
    .s_icmp_ip_hdr_valid            (s_icmp_ip_hdr_valid),
    .s_icmp_ip_hdr_ready            (s_icmp_ip_hdr_ready),
    .s_icmp_ip_length               (s_icmp_ip_length),
    .s_icmp_ip_protocol             (s_icmp_ip_protocol),
    .s_icmp_source_ip               (s_icmp_source_ip),
    .s_icmp_dest_ip                 (s_icmp_dest_ip),
    .s_icmp_payload_axis_tdata      (s_icmp_payload_axis_tdata),
    .s_icmp_payload_axis_tvalid     (s_icmp_payload_axis_tvalid),
    .s_icmp_payload_axis_tready     (s_icmp_payload_axis_tready),
    .s_icmp_payload_axis_tlast      (s_icmp_payload_axis_tlast),
    .local_ip                       (local_ip)
);

/*
 * Output arbiter
 */
ip_arb_mux #(
    .S_COUNT(2),
    .DATA_WIDTH(8),
    .KEEP_ENABLE(0),
    .ID_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(1),
    .USER_WIDTH(1),
    .ARB_TYPE("PRIORITY"),
    .LSB_PRIORITY("HIGH")
)
ip_arb_mux_inst (
    .clk(clk),
    .rst(rst),
    // IP frame inputs
    .s_ip_hdr_valid({m_icmp_ip_hdr_valid, in_ip_hdr_valid}),
    .s_ip_hdr_ready({m_icmp_ip_hdr_ready, in_ip_hdr_ready}),
    .s_eth_dest_mac(96'd0),
    .s_eth_src_mac(96'd0),
    .s_eth_type(0),
    .s_ip_version(8'd0),
    .s_ip_ihl(8'd0),
    .s_ip_dscp({m_icmp_ip_dscp, in_ip_dscp}),
    .s_ip_ecn({m_icmp_ip_ecn, in_ip_ecn}),
    .s_ip_length({m_icmp_ip_length, in_ip_length}),
    .s_ip_identification(0),
    .s_ip_flags(6'd0),
    .s_ip_fragment_offset(26'd0),
    .s_ip_ttl({m_icmp_ip_ttl, in_ip_ttl}),
    .s_ip_protocol({m_icmp_ip_protocol, in_ip_protocol}),
    .s_ip_header_checksum(0),
    .s_ip_source_ip({m_icmp_source_ip, in_ip_source_ip}),
    .s_ip_dest_ip({m_icmp_dest_ip, in_ip_dest_ip}),
    .s_ip_payload_axis_tdata({m_icmp_payload_axis_tdata, in_ip_payload_axis_tdata}),
    .s_ip_payload_axis_tkeep(2'd0),
    .s_ip_payload_axis_tvalid({m_icmp_payload_axis_tvalid, in_ip_payload_axis_tvalid}),
    .s_ip_payload_axis_tready({m_icmp_payload_axis_tready, in_ip_payload_axis_tready}),
    .s_ip_payload_axis_tlast({m_icmp_payload_axis_tlast, in_ip_payload_axis_tlast}),
    .s_ip_payload_axis_tid(16'd0),
    .s_ip_payload_axis_tdest(16'd0),
    .s_ip_payload_axis_tuser({m_icmp_payload_axis_tuser, in_ip_payload_axis_tuser}),
    // IP frame output
    .m_ip_hdr_valid(s_ip_hdr_valid),
    .m_ip_hdr_ready(s_ip_hdr_ready),
    .m_eth_dest_mac(),
    .m_eth_src_mac(),
    .m_eth_type(),
    .m_ip_version(),
    .m_ip_ihl(),
    .m_ip_dscp(s_ip_dscp),
    .m_ip_ecn(s_ip_ecn),
    .m_ip_length(s_ip_length),
    .m_ip_identification(),
    .m_ip_flags(),
    .m_ip_fragment_offset(),
    .m_ip_ttl(s_ip_ttl),
    .m_ip_protocol(s_ip_protocol),
    .m_ip_header_checksum(),
    .m_ip_source_ip(s_ip_source_ip),
    .m_ip_dest_ip(s_ip_dest_ip),
    .m_ip_payload_axis_tdata(s_ip_payload_axis_tdata),
    .m_ip_payload_axis_tkeep(),
    .m_ip_payload_axis_tvalid(s_ip_payload_axis_tvalid),
    .m_ip_payload_axis_tready(s_ip_payload_axis_tready),
    .m_ip_payload_axis_tlast(s_ip_payload_axis_tlast),
    .m_ip_payload_axis_tid(),
    .m_ip_payload_axis_tdest(),
    .m_ip_payload_axis_tuser(s_ip_payload_axis_tuser)
);

eth_axis_rx
eth_axis_rx_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(rx_axis_tdata),
    .s_axis_tvalid(rx_axis_tvalid),
    .s_axis_tready(rx_axis_tready),
    .s_axis_tlast(rx_axis_tlast),
    .s_axis_tuser(1'b0),
    // Ethernet frame output
    .m_eth_hdr_valid(rx_eth_hdr_valid),
    .m_eth_hdr_ready(rx_eth_hdr_ready),
    .m_eth_dest_mac(rx_eth_dest_mac),
    .m_eth_src_mac(rx_eth_src_mac),
    .m_eth_type(rx_eth_type),
    .m_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Status signals
    .busy(),
    .error_header_early_termination()
);

eth_axis_tx
eth_axis_tx_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(tx_eth_hdr_valid),
    .s_eth_hdr_ready(tx_eth_hdr_ready),
    .s_eth_dest_mac(tx_eth_dest_mac),
    .s_eth_src_mac(tx_eth_src_mac),
    .s_eth_type(tx_eth_type),
    .s_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // AXI output
    .m_axis_tdata(tx_axis_tdata),
    .m_axis_tvalid(tx_axis_tvalid),
    .m_axis_tready(tx_axis_tready),
    .m_axis_tlast(tx_axis_tlast),
    .m_axis_tuser(tx_axis_tuser),
    // Status signals
    .busy()
);

avalon2axi avalon2axi_inst (
    .clk        (clk),
    .rst        (rst),
    .sop        (ff_rx_sop),
    .eop        (ff_rx_eop),
    .data       (ff_rx_data),
    .rdy        (ff_rx_rdy),
    .dval       (ff_rx_dval),
    .axi_data   (rx_axis_tdata),
    .axi_valid  (rx_axis_tvalid),
    .axi_rdy    (rx_axis_tready),
    .axi_last   (rx_axis_tlast)
);

ether1 ether1_inst (
    .ff_tx_data(tx_axis_tdata),
    .ff_tx_eop(tx_axis_tlast),
    .ff_tx_err(1'b0),
    .ff_tx_rdy(tx_axis_tready),
    .ff_tx_sop(ff_tx_sop_enable & tx_axis_tvalid),
    .ff_tx_wren(tx_axis_tvalid),
    .ff_tx_clk(clk),
    .ff_rx_data(ff_rx_data),
    .ff_rx_dval(ff_rx_dval),
    .ff_rx_eop(ff_rx_eop),
    .ff_rx_rdy(ff_rx_rdy),
    .ff_rx_sop(ff_rx_sop),
    .rx_err(rx_err),
    .ff_rx_clk(clk),
    .mdc(mdc),
    .mdio_in(mdio_in),
    .mdio_oen(mdio_oen),
    .mdio_out(mdio_out),
    .address(address),
    .readdata(readdata),
    .read(read),
    .writedata(writedata),
    .write(write),
    .waitrequest(reg_busy),
    .clk(clk),
    .reset(rst),
    .rgmii_in(rgmii_in),
    .rgmii_out(rgmii_out),
    .rx_control(rx_control),
    .tx_control(tx_control),
    .tx_clk(tx_clk),
    .rx_clk(rx_clk),
    .set_10(1'b0),
    .set_1000(1'b0),
    .ena_10(),
    .eth_mode(eth_mode),
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

always @(posedge clk) begin
    if (rst)
        ff_tx_sop_enable <= #1 1;
    else
        if (tx_axis_tvalid && tx_axis_tready)
            ff_tx_sop_enable <= #1 tx_axis_tlast;
end

always @(posedge clk) begin
    if (rst)
        rx_udp_err <= #1 0;
    else
        if (rx_axis_tvalid && rx_axis_tready && rx_axis_tlast)
            rx_udp_err <= #1 rx_err[0];
end

always @(posedge clk) begin
    if (rst)
        local_mac[31:0] <= #1 0;
    else
        if (write && address == 3)
            local_mac[31:0] <= #1 writedata;
end

always @(posedge clk) begin
    if (rst)
        local_mac[47:32] <= #1 0;
    else
        if (write && address == 4)
            local_mac[47:32] <= #1 writedata[15:0];
end

always @(posedge clk) begin
    if (rst)
        local_ip <= #1 32'hc0a80101;
    else
        if (write && address == 8'hf0)
            local_ip <= #1 writedata;
end

always @(posedge clk) begin
    if (rst)
        subnet_mask <= #1 32'hffffff00;
    else
        if (write && address == 8'hf1)
            subnet_mask <= #1 writedata;
end

always @(posedge clk) begin
    if (rst)
        gateway_ip <= #1 32'hc0a801fd;
    else
        if (write && address == 8'hf2)
            gateway_ip <= #1 writedata;
end

assign reg_readdata = (reg_addr == 8'hf0) ? local_ip :
                     ((reg_addr == 8'hf1) ? subnet_mask :
                     ((reg_addr == 8'hf2) ? gateway_ip :readdata));

assign writedata = rst_finish ? reg_writedata : rst_writedata;
assign address = rst_finish ? reg_addr : rst_addr;
assign read = rst_finish ? reg_rd : rst_rd;
assign write = rst_finish ? reg_wr : rst_wr;

mac_reset mac_reset_inst (
    .clk                (clk),
    .rst                (rst),
    .rst_writedata      (rst_writedata),
    .rst_readdata       (rst_readdata),
    .rst_addr           (rst_addr),
    .rst_rd             (rst_rd),
    .rst_wr             (rst_wr),
    .reg_busy           (reg_busy),
    .rst_finish         (rst_finish)
);
endmodule