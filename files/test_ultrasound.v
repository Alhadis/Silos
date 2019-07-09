`timescale 1ns / 1ps

module test_ultrasound;
    reg                 CLOCK_50;
    wire [3:0]          US0_ENET0_TX_DATA;
    wire [3:0]          US0_ENET0_RX_DATA;
    wire                US0_ENET0_TX_EN;
    wire                US0_ENET0_RX_DV;
    wire                US0_ENET0_GTX_CLK;
    wire                US1_ENET0_GTX_CLK;
    
    integer             i, j;
    
ultrasound #(.SIMULATION(1)) ultrasound0(
    .CLOCK_50           (CLOCK_50),
	//////// Ethernet 0 //////////
	.ENET0_GTX_CLK      (US0_ENET0_GTX_CLK),
	.ENET0_INT_N        (),
	.ENET0_MDC          (),
	.ENET0_MDIO         (),
	.ENET0_RST_N        (),
	.ENET0_RX_CLK       (US1_ENET0_GTX_CLK),
	.ENET0_RX_COL       (),
	.ENET0_RX_CRS       (),
	.ENET0_RX_DATA      (US0_ENET0_RX_DATA),
	.ENET0_RX_DV        (US0_ENET0_RX_DV),
	.ENET0_RX_ER        (),
	.ENET0_TX_CLK       (),
	.ENET0_TX_DATA      (US0_ENET0_TX_DATA),
	.ENET0_TX_EN        (US0_ENET0_TX_EN),
	.ENET0_TX_ER        (),
	.ENET0_LINK100      ()
);

ultrasound #(.SIMULATION(0), .RESET_CTR_WIDTH(5)) ultrasound1(
    .CLOCK_50           (CLOCK_50),
	//////// Ethernet 0 //////////
	.ENET0_GTX_CLK      (US1_ENET0_GTX_CLK),
	.ENET0_INT_N        (),
	.ENET0_MDC          (),
	.ENET0_MDIO         (),
	.ENET0_RST_N        (),
	.ENET0_RX_CLK       (US0_ENET0_GTX_CLK),
	.ENET0_RX_COL       (),
	.ENET0_RX_CRS       (),
	.ENET0_RX_DATA      (US0_ENET0_TX_DATA),
	.ENET0_RX_DV        (US0_ENET0_TX_EN),
	.ENET0_RX_ER        (),
	.ENET0_TX_CLK       (),
	.ENET0_TX_DATA      (US0_ENET0_RX_DATA),
	.ENET0_TX_EN        (US0_ENET0_RX_DV),
	.ENET0_TX_ER        (),
	.ENET0_LINK100      ()
);

always
begin
    CLOCK_50 <= 1'b 1;
    #(10);
    CLOCK_50 <= 1'b 0;
    #(10);
end

initial
begin
    force ultrasound0.pll_lock = 1;
    release ultrasound0.pll_lock;
    force ultrasound1.pll_lock = 1;
    release ultrasound1.pll_lock;
    ultrasound0.controller_inst.SIM.inram.SIM_RAM.mem[0] = 0;
    $readmemh("../testbench/inram.txt",ultrasound0.controller_inst.SIM.outram.SIM_RAM.mem);
    for (i=0; i<1024; i=i+1)
    if (ultrasound0.controller_inst.SIM.outram.SIM_RAM.mem[i] === 16'hxxxx)
    begin
        j = i;
        i = 1025;
    end 
    force ultrasound0.controller_inst.exec_out_len = j;
    force ultrasound0.controller_inst.exec_in_len = 0;
    force ultrasound0.controller_inst.ctrl_out_udp_dest_port = ultrasound0.controller_inst.CTRL_UDP_PORT;
    force ultrasound0.controller_inst.ctrl_out_udp_source_port = 16'h3456;
    force ultrasound0.controller_inst.ctrl_out_ip_dest_ip = 32'hffffffff;
    force ultrasound0.controller_inst.exec_err = 0;
    force ultrasound0.udp_mac_complete_inst.local_ip = 32'hc0a80102;
    force ultrasound0.udp_mac_complete_inst.local_mac = 48'h201906151130;
    @(negedge ultrasound0.rst);    
    #2000;
    @(posedge ultrasound0.clk);
    $display("finish reset");
    force ultrasound0.controller_inst.start_exec = 0;
    @(posedge ultrasound0.clk);
    force ultrasound0.controller_inst.start_exec = 1; //trigger ultrasound0 send UDP packet
    @(posedge ultrasound0.clk);
    force ultrasound0.controller_inst.start_exec = 0;
    @(ultrasound0.controller_inst.ctrl_out_udp_payload_axis_tvalid);
    $display("ultrasound0 start transmit command packet");
    @(ultrasound1.udp_mac_complete_inst.rx_eth_hdr_ready);
    $display("ultrasound1 receive command packet");
    @(ultrasound1.controller_inst.ctrl_out_udp_payload_axis_tvalid);
    $display("ultrasound1 start transmit reply packet");
    @(ultrasound0.controller_inst.ctrl_in_udp_hdr_valid);
    $display("ultrasound0 receive reply packet");
    #10000;
    $writememh("../testbench/outram.txt",ultrasound0.controller_inst.SIM.inram.SIM_RAM.mem);
    $stop;
    end
endmodule