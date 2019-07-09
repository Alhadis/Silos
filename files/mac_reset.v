`timescale 1ns / 1ps
module mac_reset (
    clk,
    rst,
    rst_writedata,
    rst_readdata,
	rst_addr,
	rst_rd,
	rst_wr,
	reg_busy,
	rst_finish
);
    input               clk;
    input               rst;
    output reg [31:0]   rst_writedata;
    input [31:0]        rst_readdata;
    output reg [7:0]    rst_addr;
    output reg          rst_rd;
    output reg          rst_wr;
    input               reg_busy;
    output reg          rst_finish;
    reg                 reg_busy_d;
    reg [5:0]           rw_idx;
    wire [5:0]          rw_idx_next;
    always @(posedge clk) 
	begin
    if (rst)
        reg_busy_d <= 1'b0;
    else
        reg_busy_d <= reg_busy;
    end
    always @(posedge clk)
    if (rst)
		rw_idx <= #1 0;
	else
        rw_idx <= #1 rw_idx_next;
    assign rw_idx_next = (reg_busy == 1'b 0 && reg_busy_d == 1'b1) ? rw_idx + 1'b1 : rw_idx;
    always @(*)
    begin
        case (rw_idx)
        0:  begin rst_addr = 3;     rst_writedata = 32'h06150910; end //mac address
        1:  begin rst_addr = 4;     rst_writedata = 32'h2019; end //mac address
        2:  begin rst_addr = 9;     rst_writedata = 500; end //tx section empty
        3:  begin rst_addr = 10;    rst_writedata = 200; end //tx section full
        4:  begin rst_addr = 7;     rst_writedata = 4000; end //rx section empty
        5:  begin rst_addr = 8;     rst_writedata = 0; end //rx section full
        6:  begin rst_addr = 11;    rst_writedata = 8; end //rx almost empty
        7:  begin rst_addr = 12;    rst_writedata = 8; end //rx almost full
        8:  begin rst_addr = 13;    rst_writedata = 8; end //tx almost empty
        9:  begin rst_addr = 14;    rst_writedata = 3; end //tx almost full
        10: begin rst_addr = 2;     rst_writedata = 32'h04000033; end //command
        default: begin rst_addr = 8'hxx; rst_writedata = 32'hxxxxxxxx; end
        endcase
    end
    //states for block reg_write
    reg		reg_write_00;
    reg		reg_write_01;
    reg		reg_write_02;


//state transition for block reg_write
    always @(posedge clk)
    if (rst)
        reg_write_00 <= #1 1;
    else
        reg_write_00 <= #1 reg_write_02&&(rw_idx==0);

    always @(posedge clk)
    if (rst)
        reg_write_01 <= #1 0;
    else
        reg_write_01 <= #1 reg_write_01&&(rw_idx_next != 11) || reg_write_00;

    always @(posedge clk)
    if (rst)
        reg_write_02 <= #1 0;
    else
        reg_write_02 <= #1 reg_write_02&&(rw_idx != 0) || reg_write_01&&(rw_idx_next==11);


    always @(posedge clk)
        if (rst)
            rst_finish <= #1 0;
        else
        begin
            if (reg_write_01&&(rw_idx_next==11))
                rst_finish <= #1 1;
        end

    always @(posedge clk)
        if (rst)
            rst_rd <= #1 0;
        else
        begin
            if (reg_write_01&&(rw_idx_next==11))
                rst_rd <= #1 0;
        end

    always @(posedge clk)
        if (rst)
            rst_wr <= #1 0;
        else
        begin
            if (reg_write_00)
                rst_wr <= #1 1;
            if (reg_write_01&&(rw_idx_next==11))
                rst_wr <= #1 0;
        end

endmodule
