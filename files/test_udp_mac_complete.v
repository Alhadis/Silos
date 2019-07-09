`timescale 1 ns / 1 ps

module test_udp_mac_complete;

parameter ETH_SPEED=1000;
parameter ETH_CLK_DELAY= (ETH_SPEED==1000) ? 4 : ((ETH_SPEED==100) ? 20 : 200);

    //clock
    reg             clk;
    reg             rst;

    //mii
    reg             tx_clk;                                                      //  GMII Transmit clock
    wire            rx_clk;                                                      //  GMII Receive clock
    wire            tx_control1;
    wire            rx_control1;
    wire [3:0]      rgmii_in1;
    wire [3:0]      rgmii_out1;

    //config register
    reg [7:0]       reg_addr1, reg_addr2;
    reg             reg_rd1, reg_rd2;
    reg             reg_wr1, reg_wr2;
    wire            reg_busy1, reg_busy2;
    reg [31:0]      reg_writedata1, reg_writedata2;
    wire [31:0]     reg_readdata1, reg_readdata2;

    //IP frame input
    reg             in_ip_hdr_valid1;
    wire            in_ip_hdr_ready1;
    reg [15:0]      in_ip_length1;
    reg [7:0]       in_ip_protocol1;
    reg [31:0]      in_ip_source_ip1;
    reg [31:0]      in_ip_dest_ip1;
    reg [7:0]       in_ip_payload_axis_tdata1;
    reg             in_ip_payload_axis_tvalid1;
    wire            in_ip_payload_axis_tready1;
    reg             in_ip_payload_axis_tlast1;
    
    // UDP frame input
    reg             tx_udp_hdr_valid1, tx_udp_hdr_valid2;
    wire            tx_udp_hdr_ready1, tx_udp_hdr_ready2;
    reg [15:0]      tx_udp_length1, tx_udp_length2;
    reg [7:0]       tx_udp_payload_axis_tdata1, tx_udp_payload_axis_tdata2;
    reg             tx_udp_payload_axis_tvalid1, tx_udp_payload_axis_tvalid2;
    wire            tx_udp_payload_axis_tready1, tx_udp_payload_axis_tready2;
    reg             tx_udp_payload_axis_tlast1, tx_udp_payload_axis_tlast2;

    // UDP frame output
    wire            rx_udp_hdr_valid1, rx_udp_hdr_valid2;
    reg             rx_udp_hdr_ready1, rx_udp_hdr_ready2;
    wire [47:0]     rx_udp_eth_dest_mac1, rx_udp_eth_dest_mac2;
    wire [47:0]     rx_udp_eth_src_mac1, rx_udp_eth_src_mac2;
    wire [15:0]     rx_udp_eth_type1, rx_udp_eth_type2;
    wire [3:0]      rx_udp_ip_version1, rx_udp_ip_version2;
    wire [3:0]      rx_udp_ip_ihl1, rx_udp_ip_ihl2;
    wire [5:0]      rx_udp_ip_dscp1, rx_udp_ip_dscp2;
    wire [1:0]      rx_udp_ip_ecn1, rx_udp_ip_ecn2;
    wire [15:0]     rx_udp_ip_length1, rx_udp_ip_length2;
    wire [15:0]     rx_udp_ip_identification1, rx_udp_ip_identification2;
    wire [2:0]      rx_udp_ip_flags1, rx_udp_ip_flags2;
    wire [12:0]     rx_udp_ip_fragment_offset1, rx_udp_ip_fragment_offset2;
    wire [7:0]      rx_udp_ip_ttl1, rx_udp_ip_ttl2;
    wire [7:0]      rx_udp_ip_protocol1, rx_udp_ip_protocol2;
    wire [15:0]     rx_udp_ip_header_checksum1, rx_udp_ip_header_checksum2;
    wire [31:0]     rx_udp_ip_source_ip1, rx_udp_ip_source_ip2;
    wire [31:0]     rx_udp_ip_dest_ip1, rx_udp_ip_dest_ip2;
    wire [15:0]     rx_udp_source_port1, rx_udp_source_port2;
    wire [15:0]     rx_udp_dest_port1, rx_udp_dest_port2;
    wire [15:0]     rx_udp_length1, rx_udp_length2;
    wire [15:0]     rx_udp_checksum1, rx_udp_checksum2;
    wire [7:0]      rx_udp_payload_axis_tdata1, rx_udp_payload_axis_tdata2;
    wire            rx_udp_payload_axis_tvalid1, rx_udp_payload_axis_tvalid2;
    reg             rx_udp_payload_axis_tready1, rx_udp_payload_axis_tready2;
    wire            rx_udp_payload_axis_tlast1, rx_udp_payload_axis_tlast2;
    wire            rx_udp_payload_axis_tuser1, rx_udp_payload_axis_tuser2;
    wire            rx_udp_err1, rx_udp_err2;

    wire            mdc1, mdc2;
	wire            mdio_in1, mdio_in2;
	wire            mdio_oen1, mdio_oen2;
	wire            mdio_out1, mdio_out2;
    wire            conf_done1, conf_done2;
    wire            mdio1, mdio2;
    reg             mdio_tmp1, mdio_tmp2;
    integer         i,j;
            
udp_mac_complete dut1
(
    .clk        (clk),
    .rst        (rst),

    //config register
    .reg_addr               (reg_addr1),
    .reg_rd                 (reg_rd1),
    .reg_wr                 (reg_wr1),
    .reg_busy               (reg_busy1),
    .reg_writedata          (reg_writedata1),
    .reg_readdata           (reg_readdata1),

    //mii signal
    .tx_clk                 (tx_clk),
    .rx_clk                 (rx_clk),
    .tx_control             (tx_control1),
    .rx_control             (rx_control1),
    .rgmii_in               (rgmii_in1),
    .rgmii_out              (rgmii_out1),

    //IP frame input
    .in_ip_hdr_valid        (in_ip_hdr_valid1),
    .in_ip_hdr_ready        (in_ip_hdr_ready1),
    .in_ip_dscp             (6'd0),
    .in_ip_ecn              (2'd0),
    .in_ip_length           (in_ip_length1),
    .in_ip_ttl              (8'd128),
    .in_ip_protocol         (in_ip_protocol1),
    .in_ip_source_ip        (in_ip_source_ip1),
    .in_ip_dest_ip          (in_ip_dest_ip1),
    .in_ip_payload_axis_tdata       (in_ip_payload_axis_tdata1),
    .in_ip_payload_axis_tvalid      (in_ip_payload_axis_tvalid1),
    .in_ip_payload_axis_tready      (in_ip_payload_axis_tready1),
    .in_ip_payload_axis_tlast       (in_ip_payload_axis_tlast1),
    .in_ip_payload_axis_tuser       (1'b0),
    
    // UDP frame input
    .tx_udp_hdr_valid       (tx_udp_hdr_valid1),
    .tx_udp_hdr_ready       (tx_udp_hdr_ready1),
    .tx_udp_ip_dscp         (6'd0),
    .tx_udp_ip_ecn          (2'd0),
    .tx_udp_ip_ttl          (8'd100),
    .tx_udp_ip_dest_ip      (32'hc0a80102),
    .tx_udp_source_port     (16'h3456),
    .tx_udp_dest_port       (16'h789a),
    .tx_udp_length          (tx_udp_length1),
    .tx_udp_checksum        (16'd0),
    .tx_udp_payload_axis_tdata      (tx_udp_payload_axis_tdata1),
    .tx_udp_payload_axis_tvalid     (tx_udp_payload_axis_tvalid1),
    .tx_udp_payload_axis_tready     (tx_udp_payload_axis_tready1),
    .tx_udp_payload_axis_tlast      (tx_udp_payload_axis_tlast1),
    .tx_udp_payload_axis_tuser      (1'b0),

    // UDP frame output
    .rx_udp_hdr_valid               (rx_udp_hdr_valid1),
    .rx_udp_hdr_ready               (rx_udp_hdr_ready1),
    .rx_udp_eth_dest_mac            (rx_udp_eth_dest_mac1),
    .rx_udp_eth_src_mac             (rx_udp_eth_src_mac1),
    .rx_udp_eth_type                (rx_udp_eth_type1),
    .rx_udp_ip_version              (rx_udp_ip_version1),
    .rx_udp_ip_ihl                  (rx_udp_ip_ihl1),
    .rx_udp_ip_dscp                 (rx_udp_ip_dscp1),
    .rx_udp_ip_ecn                  (rx_udp_ip_ecn1),
    .rx_udp_ip_length               (rx_udp_ip_length1),
    .rx_udp_ip_identification       (rx_udp_ip_identification1),
    .rx_udp_ip_flags                (rx_udp_ip_flags1),
    .rx_udp_ip_fragment_offset      (rx_udp_ip_fragment_offset1),
    .rx_udp_ip_ttl                  (rx_udp_ip_ttl1),
    .rx_udp_ip_protocol             (rx_udp_ip_protocol1),
    .rx_udp_ip_header_checksum      (rx_udp_ip_header_checksum1),
    .rx_udp_ip_source_ip            (rx_udp_ip_source_ip1),
    .rx_udp_ip_dest_ip              (rx_udp_ip_dest_ip1),
    .rx_udp_source_port             (rx_udp_source_port1),
    .rx_udp_dest_port               (rx_udp_dest_port1),
    .rx_udp_length                  (rx_udp_length1),
    .rx_udp_checksum                (rx_udp_checksum1),
    .rx_udp_payload_axis_tdata      (rx_udp_payload_axis_tdata1),
    .rx_udp_payload_axis_tvalid     (rx_udp_payload_axis_tvalid1),
    .rx_udp_payload_axis_tready     (rx_udp_payload_axis_tready1),
    .rx_udp_payload_axis_tlast      (rx_udp_payload_axis_tlast1),
    .rx_udp_payload_axis_tuser      (rx_udp_payload_axis_tuser1),
    .rx_udp_err                     (rx_udp_err1),
    .local_ip                       (),
    //MDIO interface
    .mdc                            (mdc1),
	.mdio_in                        (mdio_in1),
	.mdio_oen                       (mdio_oen1),
	.mdio_out                       (mdio_out1)
);

assign mdio_in1 = mdio1;
assign mdio1 = mdio_tmp1;

always@(mdio_oen1 or mdio_out1)
begin
    if (mdio_oen1)
        mdio_tmp1 <= #(2) 1'b Z ;
    else
        mdio_tmp1 <= #(2) mdio_out1;        
end

top_mdio_slave top_mdio_slave1
(
    .reset                          (rst),
    .mdc                            (mdc1),
    .mdio                           (mdio1),
    .dev_addr                       (5'd0),
    .conf_done                      (conf_done1)
);
   
udp_mac_complete dut2
(
    .clk        (clk),
    .rst        (rst),

    //config register
    .reg_addr               (reg_addr2),
    .reg_rd                 (reg_rd2),
    .reg_wr                 (reg_wr2),
    .reg_busy               (reg_busy2),
    .reg_writedata          (reg_writedata2),
    .reg_readdata           (reg_readdata2),

    //mii signal
    .tx_clk                 (tx_clk),
    .rx_clk                 (rx_clk),
    .tx_control             (rx_control1),
    .rx_control             (tx_control1),
    .rgmii_in               (rgmii_out1),
    .rgmii_out              (rgmii_in1),
    
    //IP frame input
    .in_ip_hdr_valid        (1'b0),
    .in_ip_hdr_ready        (),
    .in_ip_dscp             (6'd0),
    .in_ip_ecn              (2'd0),
    .in_ip_length           (16'd0),
    .in_ip_ttl              (8'd0),
    .in_ip_protocol         (8'd0),
    .in_ip_source_ip        (32'd0),
    .in_ip_dest_ip          (32'd0),
    .in_ip_payload_axis_tdata       (8'd0),
    .in_ip_payload_axis_tvalid      (1'b0),
    .in_ip_payload_axis_tready      (),
    .in_ip_payload_axis_tlast       (1'b0),
    .in_ip_payload_axis_tuser       (1'b0),
    
    // UDP frame input
    .tx_udp_hdr_valid               (tx_udp_hdr_valid2),
    .tx_udp_hdr_ready               (tx_udp_hdr_ready2),
    .tx_udp_ip_dscp                 (6'd0),
    .tx_udp_ip_ecn                  (2'd0),
    .tx_udp_ip_ttl                  (8'd100),
    .tx_udp_ip_dest_ip              (32'hc0a80101),
    .tx_udp_source_port             (16'h3456),
    .tx_udp_dest_port               (16'h789a),
    .tx_udp_length                  (tx_udp_length2),
    .tx_udp_checksum                (16'd0),
    .tx_udp_payload_axis_tdata      (tx_udp_payload_axis_tdata2),
    .tx_udp_payload_axis_tvalid     (tx_udp_payload_axis_tvalid2),
    .tx_udp_payload_axis_tready     (tx_udp_payload_axis_tready2),
    .tx_udp_payload_axis_tlast      (tx_udp_payload_axis_tlast2),
    .tx_udp_payload_axis_tuser      (1'b0),

    // UDP frame output
    .rx_udp_hdr_valid               (rx_udp_hdr_valid2),
    .rx_udp_hdr_ready               (rx_udp_hdr_ready2),
    .rx_udp_eth_dest_mac            (rx_udp_eth_dest_mac2),
    .rx_udp_eth_src_mac             (rx_udp_eth_src_mac2),
    .rx_udp_eth_type                (rx_udp_eth_type2),
    .rx_udp_ip_version              (rx_udp_ip_version2),
    .rx_udp_ip_ihl                  (rx_udp_ip_ihl2),
    .rx_udp_ip_dscp                 (rx_udp_ip_dscp2),
    .rx_udp_ip_ecn                  (rx_udp_ip_ecn2),
    .rx_udp_ip_length               (rx_udp_ip_length2),
    .rx_udp_ip_identification       (rx_udp_ip_identification2),
    .rx_udp_ip_flags                (rx_udp_ip_flags2),
    .rx_udp_ip_fragment_offset      (rx_udp_ip_fragment_offset2),
    .rx_udp_ip_ttl                  (rx_udp_ip_ttl2),
    .rx_udp_ip_protocol             (rx_udp_ip_protocol2),
    .rx_udp_ip_header_checksum      (rx_udp_ip_header_checksum2),
    .rx_udp_ip_source_ip            (rx_udp_ip_source_ip2),
    .rx_udp_ip_dest_ip              (rx_udp_ip_dest_ip2),
    .rx_udp_source_port             (rx_udp_source_port2),
    .rx_udp_dest_port               (rx_udp_dest_port2),
    .rx_udp_length                  (rx_udp_length2),
    .rx_udp_checksum                (rx_udp_checksum2),
    .rx_udp_payload_axis_tdata      (rx_udp_payload_axis_tdata2),
    .rx_udp_payload_axis_tvalid     (rx_udp_payload_axis_tvalid2),
    .rx_udp_payload_axis_tready     (rx_udp_payload_axis_tready2),
    .rx_udp_payload_axis_tlast      (rx_udp_payload_axis_tlast2),
    .rx_udp_payload_axis_tuser      (rx_udp_payload_axis_tuser2),
    .rx_udp_err                     (rx_udp_err2),
    .local_ip                       (),
    .eth_mode                       (),
    //MDIO interface
    .mdc                            (mdc2),
	.mdio_in                        (mdio_in2),
	.mdio_oen                       (mdio_oen2),
	.mdio_out                       (mdio_out2)
);

assign mdio_in2 = mdio2;
assign mdio2 = mdio_tmp2;

always@(mdio_oen2 or mdio_out2)
begin
    if (mdio_oen2)        
        mdio_tmp2 <= #(2) 1'b Z ;
    else
        mdio_tmp2 <= #(2) mdio_out2;        
end

top_mdio_slave topmdio_tmp2_mdio_slave1
(
    .reset                          (rst),
    .mdc                            (mdc2),
    .mdio                           (mdio2),
    .dev_addr                       (5'd1),
    .conf_done                      (conf_done2)
);

    reg [7:0]       ip_pkt[0:255];
    
always
begin
    tx_clk <= 1'b 1;
    #(ETH_CLK_DELAY);
    tx_clk <= 1'b 0;
    #(ETH_CLK_DELAY);
end

assign #1 rx_clk = tx_clk;

always
begin
    clk <= 1'b 1;
    #5;
    clk <= 1'b 0;
    #5;
end

initial
begin
    $readmemh("../testbench/ip_pkt.txt",ip_pkt);
    rst = 0;
    @(posedge clk);
    rst = 1;
    in_ip_hdr_valid1 <= 1'b0;
    in_ip_payload_axis_tvalid1 <= 1'b0;
    in_ip_payload_axis_tlast1 <= 1'b0;
    reg_wr1 <= 1'b0;
    reg_wr2 <= 1'b0;
    reg_rd1 <= 1'b0;
    reg_rd2 <= 1'b0;
    reg_addr1 <= 0;
    reg_addr2 <= 0;
    reg_writedata1 <= 0;
    reg_writedata2 <= 0;
    tx_udp_hdr_valid1 <= 1'b0;
    tx_udp_payload_axis_tvalid1 <= #1 1'b0;
    tx_udp_payload_axis_tlast1 <= #1 1'b0;
    rx_udp_hdr_ready1 <= #1 1'b1;
    rx_udp_payload_axis_tready1 <= #1 1'b1;
    
    tx_udp_hdr_valid2 <= 1'b0;
    tx_udp_payload_axis_tvalid2 <= #1 1'b0;
    tx_udp_payload_axis_tlast2 <= #1 1'b0;
    rx_udp_hdr_ready2 <= #1 1'b1;
    rx_udp_payload_axis_tready2 <= #1 1'b1;
    #1000;
    rst = 0;
    #200;
    @(dut1.rst_finish);
    @(posedge clk);

    reg_wr1 <= #1 1'b 1;
    reg_rd1 <= #1 1'b 0;
    reg_addr1 <= #1 1;
    reg_writedata1 <= #1 32'h5A5A5A5A;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 1;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    if (reg_readdata1 != 32'h5A5A5A5A) begin
        $display("dut1 scratch reg read write error");
        $stop;
    end
    
    /*MDIO write read
    reg_wr1 <= #1 1'b 1;
    reg_rd1 <= #1 1'b 0;
    reg_addr1 <= #(1) 15;   
    reg_writedata1 <= #1 0;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    reg_addr1 <= #(1) 128;   
    reg_writedata1 <= #1 32'hAAAA5555;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("MDIO reg0 = %x", reg_readdata1);*/
         
    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'hf0;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("ip address = %x", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'hf1;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("submask = %x", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'hf2;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("gateway ip=%x", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'h2;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("command=%x", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'h3;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("mac hi=%x", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'h4;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("mac lo=%x", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'h7;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("rx section empty=%d", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'h8;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("rx section full=%d", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'h9;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    $display("tx section empty=%d", reg_readdata1);

    reg_wr1 <= #1 1'b 0;
    reg_rd1 <= #1 1'b 1;
    reg_addr1 <= #1 8'ha;
    @(negedge clk);
    @(!reg_busy1);
    @(posedge clk);
    reg_rd1 <= #1 1'b0;
    $display("tx section full=%d", reg_readdata1);

    reg_wr2 <= #1 1'b 1;
    reg_rd2 <= #1 1'b 0;
    reg_addr2 <= #1 1;
    reg_writedata2 <= #1 32'h5A5A5A5A;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    reg_wr2 <= #1 1'b 0;
    reg_rd2 <= #1 1'b 1;
    reg_addr2 <= #1 1;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    if (reg_readdata2 != 32'h5A5A5A5A) begin
        $display("dut2 scratch reg read write error");
        $stop;
    end
    reg_rd2 <= #1 1'b 0;
    
    //write dut2 mac and ip
    reg_wr2 <= #1 1'b 1;
    reg_rd2 <= #1 1'b 0;
    reg_addr2 <= #1 8'h3;
    reg_writedata2 <= #1 32'h06231132;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    reg_wr2 <= #1 1'b 0;
    reg_rd2 <= #1 1'b 1;
    reg_addr2 <= #1 8'h3;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    if (reg_readdata2 != 32'h06231132) begin
        $display("dut2 mac reg read write error");
        $stop;
    end
    
    reg_wr2 <= #1 1'b 1;
    reg_rd2 <= #1 1'b 0;
    reg_addr2 <= #1 8'h4;
    reg_writedata2 <= #1 32'h2019;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    reg_wr2 <= #1 1'b 0;
    reg_rd2 <= #1 1'b 1;
    reg_addr2 <= #1 8'h4;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    if (reg_readdata2 != 32'h2019) begin
        $display("dut2 mac reg read write error");
        $stop;
    end
    
    reg_wr2 <= #1 1'b 1;
    reg_rd2 <= #1 1'b 0;
    reg_addr2 <= #1 8'hf0;
    reg_writedata2 <= #1 32'hc0a80102;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    reg_wr2 <= #1 1'b 0;
    reg_rd2 <= #1 1'b 1;
    reg_addr2 <= #1 8'hf0;
    @(negedge clk);
    @(!reg_busy2);
    @(posedge clk);
    if (reg_readdata2 != 32'hc0a80102) begin
        $display("dut2 ip reg read write error");
        $stop;
    end
    reg_rd2 <= #1 1'b 0;

    //start transmit ICMP packet
    $display("dut1 start transmit icmp request packet");
    in_ip_hdr_valid1 <= #1 1'b1;
    in_ip_length1 <= #1 ip_pkt[0] + 20;
    in_ip_protocol1 <= #1 ip_pkt[1];
    in_ip_source_ip1 <= 32'hc0a80101;
    in_ip_dest_ip1 <= 32'hc0a80102;
    @(posedge clk);
    in_ip_hdr_valid1 <= #1 1'b0;
    in_ip_payload_axis_tvalid1 <= #1 1;
    for (i=0; i<ip_pkt[0]; i=i+1)
    begin
        in_ip_payload_axis_tdata1 <= #1 ip_pkt[i+2];
        @(posedge clk);
        while (!in_ip_payload_axis_tready1)
            @(posedge clk);
    end
    in_ip_payload_axis_tlast1 <= #1 1;
    @(posedge clk);
    in_ip_payload_axis_tvalid1 <= #1 0;
    in_ip_payload_axis_tlast1 <= #1 0;
    @(posedge clk);
    @(dut2.rx_eth_hdr_ready);
    $display("dut2 start receive icmp request packet");
    @(dut2.m_icmp_ip_hdr_valid);
    $display("dut2 start transmit icmp reply packet");
    @(dut1.s_icmp_ip_hdr_valid);
    $display("dut1 receive icmp reply packet");
    
    //start transmit UDP packet
    $display("dut1 start transmit UDP packet from dut1");
    tx_udp_hdr_valid1 <= #1 1'b1;
    tx_udp_length1 <= #1 16'd50;
    tx_udp_payload_axis_tdata1 <= #1 tx_udp_length1;
    tx_udp_payload_axis_tvalid1 <= #1 1'b0;
    @(posedge clk);
    @(tx_udp_hdr_ready1);
    @(posedge clk);
              
    tx_udp_hdr_valid1 <= #1 1'b0;
    tx_udp_payload_axis_tvalid1 <= #1 1'b1;     
    for (i=tx_udp_length1-8; i>0; i=i-1)
    begin
        tx_udp_payload_axis_tdata1 <= #1 i;
        @(posedge clk);
        while (!tx_udp_payload_axis_tready1)
            @(posedge clk);
    end
    tx_udp_payload_axis_tdata1 <= #1 0;
    tx_udp_payload_axis_tlast1 <= 1'b1;
    @(posedge clk);
    tx_udp_payload_axis_tlast1 <= 1'b0;
    $display("dut1 finish transmit UDP packet from dut1");
    #10000;
    @(posedge clk);
    reg_rd1 <= #1 1'b 1;
    reg_rd2 <= #1 1'b 1;
    for (i=32'h1A; i<=32'h38; i=i+1)
    begin
        reg_addr1 <= #1 i;
        reg_addr2 <= #1 i;
        @(negedge clk);
        @(!reg_busy2);
        @(posedge clk);
        case (i)
        32'h1a: $display("tx frame  ok  num, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h1b: $display("rx frame  ok  num, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h1c: $display("crc  error  frame, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h1d: $display("align  err  frame, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h22: $display("total  err  frame, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h24: $display("rx unicast okfram, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h25: $display("rx   multicast ok, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h26: $display("rx  broadcast  ok, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h28: $display("tx  unicast total, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h29: $display("tx multicas total, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h2a: $display("tx broadcas total, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h2d: $display("rx   frame total , r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h2e: $display("rx frame tooshort, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h2f: $display("rx frame too long, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h37: $display("rx long & bad-crc, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        32'h38: $display("rx short &bad-crc, r0=%d, r1=%d",reg_readdata1, reg_readdata2);
        default: $display("addr[%d], r0=%d, r1=%d", i, reg_readdata1, reg_readdata2);
        endcase  
    end
    reg_rd1 <= #1 1'b 0;
    reg_rd2 <= #1 1'b 0;
    $stop;
end
endmodule