`timescale 1ns / 1ps

module test_execcmd;
parameter AW=10;
    //clock
    reg             clk;
    reg             rst;

    //input command ram
    wire [AW-1:0]       inram_address;
    wire                inram_re;
    wire [15:0]         inram_q;

    //output result ram
    wire [AW-1:0]       outram_address;
    wire                outram_we;
    wire [15:0]         outram_d;

    //AXI reg access
    wire [13:0]         reg_addr;
    wire                reg_rd;
    wire                reg_wr;
    wire                reg_busy;
    wire [31:0]         reg_writedata;
    wire [31:0]         reg_readdata;

    //controller
    reg                 start_exec;
    wire                busy;
    wire                err;

execcmd #(.AW(AW)) execcmd_inst(
    //input
    .clk                (clk),
    .rst                (rst),

    //input command ram
    .inram_address      (inram_address),
    .inram_re           (inram_re),
    .inram_q            (inram_q),

    //output result ram
    .outram_address     (outram_address),
    .outram_we          (outram_we),
    .outram_d           (outram_d),

    //AXI reg access
    .reg_addr           (reg_addr),
    .reg_rd             (reg_rd),
    .reg_wr             (reg_wr),
    .reg_ready          (!reg_busy),
    .reg_writedata      (reg_writedata),
    .reg_readdata       (reg_readdata),

    //controller
    .start_exec         (start_exec),
    .busy               (busy),
    .err                (err)
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
    .address(reg_addr[7:0]),
    .readdata(reg_readdata),
    .read(reg_rd),
    .writedata(reg_writedata),
    .write(reg_wr),
    .waitrequest(reg_busy),
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

generic_spram  #(.aw(AW), .dw(16)) inram (
    .clk        (clk),
    .re         (inram_re),
    .we         (1'b0),
    .addr       (inram_address),
    .q          (inram_q),
    .data       ()
);

generic_spram #(.aw(AW), .dw(16)) outram (
    .clk        (clk),
    .re         (1'b0),
    .we         (outram_we),
    .addr       (outram_address),
    .q          (),
    .data       (outram_d)
);

always
begin
    clk <= 1'b 1;
    #5;
    clk <= 1'b 0;
    #5;
end

initial
begin
    $readmemh("../testbench/inram.txt",inram.SIM_RAM.mem);
    rst = 0;
    start_exec <= #1 0;
    @(posedge clk);
    rst = 1;
    #1000;
    rst = 0;
    #200;
    @(posedge clk);
    start_exec <= #1 1;
    @(posedge clk);
    start_exec <= #1 0;
    @(posedge clk);
    @(!busy);
    $writememh("../testbench/outram.txt",outram.SIM_RAM.mem);
    $display("finish rst=%d!", err);
    $stop;
end
endmodule