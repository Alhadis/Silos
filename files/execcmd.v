`timescale 1ns / 1ps
module execcmd (
    //input
    clk,
    rst,

    //input command ram
    inram_address,
    inram_re,
    inram_q,

    //output result ram
    outram_address,
    outram_we,
    outram_d,

    //AXI reg access
    reg_addr,
    reg_rd,
    reg_wr,
    reg_ready,
    reg_writedata,
    reg_readdata,

    //controller
    start_exec,
    busy,
    err,
    out_len
);
    parameter AW=10;
    localparam CMD_WRITE = 2'b10;
    localparam CMD_READ = 2'b00;
    input           clk;
    input           rst;
    output reg [AW-1:0] inram_address;
    output reg          inram_re;
    input [15:0]        inram_q;
    output reg [AW-1:0] outram_address;
    output reg          outram_we;
    output reg [15:0]   outram_d;
    output reg [13:0]   reg_addr;
    output reg          reg_rd;
    output reg          reg_wr;
    input               reg_ready;
    output [31:0]       reg_writedata;
    input [31:0]        reg_readdata;
    input               start_exec;
    output reg          busy;
    output reg          err;
    output reg [AW-1:0] out_len;
    reg [31:0]          reg_readdata_d;
    reg [1:0]           command;
    reg [15:0]          in_len;
    reg [15:0]          reg_writedata_h, reg_writedata_l;
    wire                check_length;
    assign check_length = (inram_address < in_len &&  outram_address < 800);
    assign reg_writedata = {reg_writedata_h, reg_writedata_l};
    always @(posedge clk)
    if (reg_rd & reg_ready)
        reg_readdata_d <= #1 reg_readdata;
    //states for block cmd_process
    reg		cmd_process_00;
    reg		cmd_process_01;
    reg		cmd_process_02;
    reg		cmd_process_03;
    reg		cmd_process_04;
    reg		cmd_process_05;
    reg		cmd_process_06;
    reg		cmd_process_07;
    reg		cmd_process_08;
    reg		cmd_process_09;
    reg		cmd_process_10;
    reg		cmd_process_11;
    reg		cmd_process_12;
    reg		cmd_process_13;
    reg		cmd_process_14;
    reg		cmd_process_15;
    reg		cmd_process_16;


//state transition for block cmd_process
    always @(posedge clk)
    if (rst)
        cmd_process_00 <= #1 1;
    else
        cmd_process_00 <= #1 cmd_process_16;

    always @(posedge clk)
    if (rst)
        cmd_process_01 <= #1 0;
    else
        cmd_process_01 <= #1 cmd_process_01&&!start_exec || cmd_process_00;

    always @(posedge clk)
    if (rst)
        cmd_process_02 <= #1 0;
    else
        cmd_process_02 <= #1 cmd_process_01&&start_exec;

    always @(posedge clk)
    if (rst)
        cmd_process_03 <= #1 0;
    else
        cmd_process_03 <= #1 cmd_process_02;

    always @(posedge clk)
    if (rst)
        cmd_process_04 <= #1 0;
    else
        cmd_process_04 <= #1 cmd_process_03;

    always @(posedge clk)
    if (rst)
        cmd_process_05 <= #1 0;
    else
        cmd_process_05 <= #1 cmd_process_06&&(command!=CMD_READ)&&(command!=CMD_WRITE)&&check_length || cmd_process_15&&check_length || cmd_process_10&&reg_ready&&check_length || cmd_process_09&&reg_ready&&check_length || cmd_process_04&&check_length;

    always @(posedge clk)
    if (rst)
        cmd_process_06 <= #1 0;
    else
        cmd_process_06 <= #1 cmd_process_05;

    always @(posedge clk)
    if (rst)
        cmd_process_07 <= #1 0;
    else
        cmd_process_07 <= #1 cmd_process_06&&(command == CMD_WRITE);

    always @(posedge clk)
    if (rst)
        cmd_process_08 <= #1 0;
    else
        cmd_process_08 <= #1 cmd_process_07;

    always @(posedge clk)
    if (rst)
        cmd_process_09 <= #1 0;
    else
        cmd_process_09 <= #1 cmd_process_08;

    always @(posedge clk)
    if (rst)
        cmd_process_10 <= #1 0;
    else
        cmd_process_10 <= #1 cmd_process_10&&!reg_ready || cmd_process_09&&!reg_ready;

    always @(posedge clk)
    if (rst)
        cmd_process_11 <= #1 0;
    else
        cmd_process_11 <= #1 cmd_process_06&&(command == CMD_READ)&&(command!=CMD_WRITE);

    always @(posedge clk)
    if (rst)
        cmd_process_12 <= #1 0;
    else
        cmd_process_12 <= #1 cmd_process_12&&!reg_ready || cmd_process_11&&!reg_ready;

    always @(posedge clk)
    if (rst)
        cmd_process_13 <= #1 0;
    else
        cmd_process_13 <= #1 cmd_process_12&&reg_ready || cmd_process_11&&reg_ready;

    always @(posedge clk)
    if (rst)
        cmd_process_14 <= #1 0;
    else
        cmd_process_14 <= #1 cmd_process_13;

    always @(posedge clk)
    if (rst)
        cmd_process_15 <= #1 0;
    else
        cmd_process_15 <= #1 cmd_process_14;

    always @(posedge clk)
    if (rst)
        cmd_process_16 <= #1 0;
    else
        cmd_process_16 <= #1 cmd_process_06&&(command!=CMD_READ)&&(command!=CMD_WRITE)&&!check_length || cmd_process_15&&!check_length || cmd_process_10&&reg_ready&&!check_length || cmd_process_09&&reg_ready&&!check_length || cmd_process_04&&!check_length;


    always @(posedge clk)
        if (rst)
            busy <= #1 0;
        else
        begin
            if (cmd_process_00)
                busy <= #1 0;
            if (cmd_process_01&&start_exec)
                busy <= #1 1;
        end

    always @(posedge clk)
    begin
        if (cmd_process_05)
            command <= #1 inram_q[15:14];
    end

    always @(posedge clk)
        if (rst)
            err <= #1 0;
        else
        begin
            if (cmd_process_16&&(in_len == inram_address))
                err <= #1 0;
            if (cmd_process_16&&(in_len!=inram_address))
                err <= #1 1;
        end

    always @(posedge clk)
    begin
        if (cmd_process_00)
            in_len <= #1 0;
        if (cmd_process_03)
            in_len <= #1 inram_q;
    end

    always @(posedge clk)
    begin
        if (cmd_process_00)
            inram_address <= #1 0;
        if (cmd_process_02)
            inram_address <= #1 1;
        if (cmd_process_05)
            inram_address <= #1 inram_address + 1'b1;
        if (cmd_process_06&&(command == CMD_WRITE))
            inram_address <= #1 inram_address + 1'b1;
        if (cmd_process_07)
            inram_address <= #1 inram_address + 1'b1;
    end

    always @(posedge clk)
    begin
        if (cmd_process_00)
            inram_re <= #1 0;
        if (cmd_process_01&&start_exec)
            inram_re <= #1 1;
    end

    always @(posedge clk)
    begin
        if (cmd_process_16&&(in_len == inram_address))
            out_len <= #1 outram_address;
        if (cmd_process_16&&(in_len!=inram_address))
            out_len <= #1 0;
    end

    always @(posedge clk)
    begin
        if (cmd_process_00)
            outram_address <= #1 0;
        if (cmd_process_06)
            outram_address <= #1 outram_address + 1'b1;
        if (cmd_process_14)
            outram_address <= #1 outram_address + 1'b1;
        if (cmd_process_15)
            outram_address <= #1 outram_address + 1'b1;
    end

    always @(posedge clk)
    begin
        if (cmd_process_05)
            outram_d <= #1 inram_q;
        if (cmd_process_13)
            outram_d <= #1 reg_readdata_d[31:16];
        if (cmd_process_14)
            outram_d <= #1 reg_readdata_d[15:0];
    end

    always @(posedge clk)
        if (rst)
            outram_we <= #1 0;
        else
        begin
            if (cmd_process_00)
                outram_we <= #1 0;
            if (cmd_process_05)
                outram_we <= #1 1;
            if (cmd_process_06)
                outram_we <= #1 0;
            if (cmd_process_13)
                outram_we <= 1;
            if (cmd_process_15)
                outram_we <= 0;
        end

    always @(posedge clk)
    begin
        if (cmd_process_05)
            reg_addr <= #1 inram_q[13:0];
    end

    always @(posedge clk)
        if (rst)
            reg_rd <= #1 0;
        else
        begin
            if (cmd_process_06&&(command == CMD_READ)&&(command!=CMD_WRITE))
                reg_rd <= #1 1;
            if (cmd_process_12&&reg_ready || cmd_process_11&&reg_ready)
                reg_rd <= #1 0;
        end

    always @(posedge clk)
        if (rst)
            reg_wr <= #1 0;
        else
        begin
            if (cmd_process_08)
                reg_wr <= #1 1;
            if (cmd_process_10&&reg_ready || cmd_process_09&&reg_ready)
                reg_wr <= #1 0;
        end

    always @(posedge clk)
    begin
        if (cmd_process_07)
            reg_writedata_h <= #1 inram_q;
    end

    always @(posedge clk)
    begin
        if (cmd_process_08)
            reg_writedata_l <= #1 inram_q;
    end

endmodule
