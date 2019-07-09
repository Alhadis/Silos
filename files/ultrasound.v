`timescale 1ns / 1ps

module ultrasound(
    CLOCK_50,
	//////// Ethernet 0 //////////
	ENET0_GTX_CLK,
	ENET0_INT_N,
	ENET0_MDC,
	ENET0_MDIO,
	ENET0_RST_N,
	ENET0_RX_CLK,
	ENET0_RX_COL,
	ENET0_RX_CRS,
	ENET0_RX_DATA,
	ENET0_RX_DV,
	ENET0_RX_ER,
	ENET0_TX_CLK,
	ENET0_TX_DATA,
	ENET0_TX_EN,
	ENET0_TX_ER,
	ENET0_LINK100
);
parameter SIMULATION = 0;
parameter RESET_CTR_WIDTH = SIMULATION ? 5 : 20;

    //clk
    input           CLOCK_50;
    
    //Ethernet0
    output          ENET0_GTX_CLK;
    input           ENET0_INT_N;
    output          ENET0_MDC;
    inout           ENET0_MDIO;
    output          ENET0_RST_N;
    input           ENET0_RX_CLK;
    input           ENET0_RX_COL;
    input           ENET0_RX_CRS;
    input [3:0]     ENET0_RX_DATA;
    input           ENET0_RX_DV;
    input           ENET0_RX_ER;
    input           ENET0_TX_CLK;
    output [3:0]    ENET0_TX_DATA;
    output          ENET0_TX_EN;
    output          ENET0_TX_ER;
    input           ENET0_LINK100;

    // udp_mac_complete tx & rx UDP
    wire            tx_udp_hdr_valid;
    wire            tx_udp_hdr_ready;
    wire [31:0]     tx_udp_ip_dest_ip;
    wire [15:0]     tx_udp_source_port;
    wire [15:0]     tx_udp_dest_port;
    wire [15:0]     tx_udp_length;
    wire [7:0]      tx_udp_payload_axis_tdata;
    wire            tx_udp_payload_axis_tvalid;
    wire            tx_udp_payload_axis_tready;
    wire            tx_udp_payload_axis_tlast;
    wire            tx_udp_payload_axis_tuser;
    wire            rx_udp_hdr_valid;
    wire            rx_udp_hdr_ready;
    wire [12:0]     rx_udp_ip_fragment_offset;
    wire [31:0]     rx_udp_ip_source_ip;
    wire [31:0]     rx_udp_ip_dest_ip;
    wire [15:0]     rx_udp_source_port;
    wire [15:0]     rx_udp_dest_port;
    wire [15:0]     rx_udp_length;
    wire [7:0]      rx_udp_payload_axis_tdata;
    wire            rx_udp_payload_axis_tvalid;
    wire            rx_udp_payload_axis_tready;
    wire            rx_udp_payload_axis_tlast;
    wire            rx_udp_err;
    wire [31:0]     local_ip;
    wire            eth_mode;
    wire            mdio_in;
    wire            mdio_oen;
    wire            mdio_out;

    //clk & reset
    wire            clk;
    wire            rst;
    wire            tx_clk_mac;
    wire            tx_clk_phy;

    //PLL
    wire            pll_lock;
    wire            pll_125m;
    wire            pll_125m_deg90;
    wire            pll_25m;
    wire            pll_25m_deg90;
    wire            eth_mode_tx_clk_mac_sync;
    wire            eth_mode_tx_clk_phy_syn;

    //controller
    wire [13:0]     reg_addr;
    wire            reg_rd_udp_mac;
    wire            reg_wr_udp_mac;
    wire            reg_busy_udp_mac;
    wire [31:0]     reg_writedata;
    wire [31:0]     reg_readdata_udp_mac;
    
    // ===== MDIO Tristate
    assign mdio_in = ENET0_MDIO;
    assign ENET0_MDIO   = mdio_oen ? 1'bz : mdio_out;
    assign ENET0_GTX_CLK = tx_clk_phy;
    assign ENET0_TX_ER = 0;
    assign ENET0_RST_N = !rst;
    
enet_clk_pll enet_clk_pll_inst(
	.inclk0                 (CLOCK_50),
	.c0                     (pll_125m),
	.c1                     (pll_125m_deg90),
	.c2                     (pll_25m),
	.c3                     (pll_25m_deg90),
	.c4                     (clk),
	.locked                 (pll_lock)
);

gen_reset #(.CTR_WIDTH(RESET_CTR_WIDTH)) gen_sys_reset(
    .clk            (CLOCK_50),
	.reset_n_in     (pll_lock),
	.reset_out      (rst)
);

synchronizer synchronizer_mac(
	.reset                  (rst),
	.clk                    (tx_clk_mac),
	.d                      (eth_mode),
	.q                      (eth_mode_tx_clk_mac_sync)	
);

clkctrl1 clkctrl1_mac(
	.clkselect              (eth_mode_tx_clk_mac_sync),
	.inclk0x                (pll_125m),
	.inclk1x                (pll_25m),
	.outclk                 (tx_clk_mac)
);

synchronizer synchronizer_phy(
	.reset                  (rst),
	.clk                    (tx_clk_phy),
	.d                      (eth_mode),
	.q                      (eth_mode_tx_clk_phy_syn)	
);

clkctrl1 clkctrl1_phy(
	.clkselect              (eth_mode_tx_clk_phy_syn),
	.inclk0x                (pll_125m_deg90),
	.inclk1x                (pll_25m_deg90),
	.outclk                 (tx_clk_phy)
);

udp_mac_complete udp_mac_complete_inst (
    .clk                    (clk),
    .rst                    (rst),

    //config register
    .reg_addr               (reg_addr[7:0]),
    .reg_rd                 (reg_rd_udp_mac),
    .reg_wr                 (reg_wr_udp_mac),
    .reg_busy               (reg_busy_udp_mac),
    .reg_writedata          (reg_writedata),
    .reg_readdata           (reg_readdata_udp_mac),

    //mii signal
    .tx_clk                 (tx_clk_mac),
    .rx_clk                 (ENET0_RX_CLK),
    .tx_control             (ENET0_TX_EN),
    .rx_control             (ENET0_RX_DV),
    .rgmii_in               (ENET0_RX_DATA),
    .rgmii_out              (ENET0_TX_DATA),

    //IP frame input
    .in_ip_hdr_valid        (1'b0),
    .in_ip_hdr_ready        (),
    .in_ip_dscp             (),
    .in_ip_ecn              (),
    .in_ip_length           (),
    .in_ip_ttl              (),
    .in_ip_protocol         (),
    .in_ip_source_ip        (),
    .in_ip_dest_ip          (),
    .in_ip_payload_axis_tdata       (),
    .in_ip_payload_axis_tvalid      (1'b0),
    .in_ip_payload_axis_tready      (),
    .in_ip_payload_axis_tlast       (1'b0),
    .in_ip_payload_axis_tuser       (1'b0),

    // UDP frame input
    .tx_udp_hdr_valid               (tx_udp_hdr_valid),
    .tx_udp_hdr_ready               (tx_udp_hdr_ready),
    .tx_udp_ip_dscp                 (6'd0),
    .tx_udp_ip_ecn                  (2'd0),
    .tx_udp_ip_ttl                  (8'h80),
    .tx_udp_ip_dest_ip              (tx_udp_ip_dest_ip),
    .tx_udp_source_port             (tx_udp_source_port),
    .tx_udp_dest_port               (tx_udp_dest_port),
    .tx_udp_length                  (tx_udp_length),
    .tx_udp_checksum                (16'd0),
    .tx_udp_payload_axis_tdata      (tx_udp_payload_axis_tdata),
    .tx_udp_payload_axis_tvalid     (tx_udp_payload_axis_tvalid),
    .tx_udp_payload_axis_tready     (tx_udp_payload_axis_tready),
    .tx_udp_payload_axis_tlast      (tx_udp_payload_axis_tlast),
    .tx_udp_payload_axis_tuser      (tx_udp_payload_axis_tuser),

    // UDP frame output
    .rx_udp_hdr_valid               (rx_udp_hdr_valid),
    .rx_udp_hdr_ready               (rx_udp_hdr_ready),
    .rx_udp_eth_dest_mac            (),
    .rx_udp_eth_src_mac             (),
    .rx_udp_eth_type                (),
    .rx_udp_ip_version              (),
    .rx_udp_ip_ihl                  (),
    .rx_udp_ip_dscp                 (),
    .rx_udp_ip_ecn                  (),
    .rx_udp_ip_length               (),
    .rx_udp_ip_identification       (),
    .rx_udp_ip_flags                (),
    .rx_udp_ip_fragment_offset      (rx_udp_ip_fragment_offset),
    .rx_udp_ip_ttl                  (),
    .rx_udp_ip_protocol             (),
    .rx_udp_ip_header_checksum      (),
    .rx_udp_ip_source_ip            (rx_udp_ip_source_ip),
    .rx_udp_ip_dest_ip              (rx_udp_ip_dest_ip),
    .rx_udp_source_port             (rx_udp_source_port),
    .rx_udp_dest_port               (rx_udp_dest_port),
    .rx_udp_length                  (rx_udp_length),
    .rx_udp_checksum                (),
    .rx_udp_payload_axis_tdata      (rx_udp_payload_axis_tdata),
    .rx_udp_payload_axis_tvalid     (rx_udp_payload_axis_tvalid),
    .rx_udp_payload_axis_tready     (rx_udp_payload_axis_tready),
    .rx_udp_payload_axis_tlast      (rx_udp_payload_axis_tlast),
    .rx_udp_payload_axis_tuser      (),
    .rx_udp_err                     (rx_udp_err),
    .local_ip                       (local_ip),
    .eth_mode                       (eth_mode),
    //mdio
    .mdc                            (ENET0_MDC),
    .mdio_in                        (mdio_in),
    .mdio_oen                       (mdio_oen),
    .mdio_out                       (mdio_out)
);

controller #(.SIMULATION(SIMULATION)) controller_inst(
    //input
    .clk                                (clk),
    .rst                                (rst),

    //UDP frame input
    .ctrl_in_udp_hdr_valid              (rx_udp_hdr_valid),
    .ctrl_in_udp_hdr_ready              (rx_udp_hdr_ready),
    .ctrl_in_ip_fragment_offset         (rx_udp_ip_fragment_offset),
    .ctrl_in_ip_source_ip               (rx_udp_ip_source_ip),
    .ctrl_in_ip_dest_ip                 (rx_udp_ip_dest_ip),
    .ctrl_in_udp_source_port            (rx_udp_source_port),
    .ctrl_in_udp_dest_port              (rx_udp_dest_port),
    .ctrl_in_udp_length                 (rx_udp_length),
    .ctrl_in_udp_payload_axis_tdata     (rx_udp_payload_axis_tdata),
    .ctrl_in_udp_payload_axis_tvalid    (rx_udp_payload_axis_tvalid),
    .ctrl_in_udp_payload_axis_tready    (rx_udp_payload_axis_tready),
    .ctrl_in_udp_payload_axis_tlast     (rx_udp_payload_axis_tlast),
    .ctrl_in_udp_err                    (rx_udp_err),

    //UDP frame output
    .ctrl_out_udp_hdr_valid             (tx_udp_hdr_valid),
    .ctrl_out_udp_hdr_ready             (tx_udp_hdr_ready),
    .ctrl_out_ip_dest_ip                (tx_udp_ip_dest_ip),
    .ctrl_out_udp_source_port           (tx_udp_source_port),
    .ctrl_out_udp_dest_port             (tx_udp_dest_port),
    .ctrl_out_udp_length                (tx_udp_length),
    .ctrl_out_udp_payload_axis_tdata    (tx_udp_payload_axis_tdata),
    .ctrl_out_udp_payload_axis_tvalid   (tx_udp_payload_axis_tvalid),
    .ctrl_out_udp_payload_axis_tready   (tx_udp_payload_axis_tready),
    .ctrl_out_udp_payload_axis_tlast    (tx_udp_payload_axis_tlast),
    .local_ip                           (local_ip),

    //AXI reg access
    .reg_addr                           (reg_addr),
    .reg_rd_udp_mac                     (reg_rd_udp_mac),
    .reg_wr_udp_mac                     (reg_wr_udp_mac),
    .reg_ready_udp_mac                  (!reg_busy_udp_mac),
    .reg_writedata                      (reg_writedata),
    .reg_readdata_udp_mac               (reg_readdata_udp_mac)
);
endmodule