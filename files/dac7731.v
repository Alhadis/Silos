// @file  : 7731 module
// @author: Shengbing Zhou
// @date  : 2018/10/22

module dac7731if
(
    input  wire        sys_rstn,
    input  wire        clk_ref,     // 20MHz
    input  wire [15:0] dac_data,
    output wire        dac_csn,
    output wire        dac_rstn,
    output wire        dac_sck,     // 5MHz
    output wire        dac_sdi,
    input  wire        dac_sdo,
    output wire        dac_lr,
    output wire        ads_rstsel
);

wire reg_clk;
reg reg_lr;
reg [ 2:0] reg_csn;
reg [ 3:0] bit_cnt;
reg [ 1:0] refclk_cnt;
reg [15:0] reg_data;

// dac clk = clk_ref / 4
always @(negedge sys_rstn or posedge clk_ref) begin
    if (!sys_rstn) begin
        refclk_cnt <= 0;
    end
    else if (clk_ref)
        refclk_cnt <= refclk_cnt + 1;
end
assign reg_clk = refclk_cnt[1];

// generate cs#
always @(negedge sys_rstn or posedge clk_ref) begin
    if (!sys_rstn) begin
        reg_csn <= 3'b111;
    end
    else if (clk_ref) begin        
        reg_csn <= {reg_csn[1], reg_csn[0], (refclk_cnt == 3) ? 0 :reg_csn[0]};
    end
end

// output dac data
always @(negedge sys_rstn or posedge reg_csn[2] or posedge clk_ref) begin
    if ((!sys_rstn) || reg_csn[2]) begin
        reg_lr <= 1;
        bit_cnt <= 0;
        reg_data <= 16'h8000;
    end
    else if (clk_ref) begin
        if (bit_cnt < 15) begin
            if (refclk_cnt == 1) begin
                bit_cnt <= bit_cnt + 1;
                reg_data <= {reg_data[14:0], reg_data[15]};
            end
            reg_lr <= 1;
        end
        else begin
            if (refclk_cnt == 1) begin
                bit_cnt <= bit_cnt + 1;
                reg_data <= dac_data;
                reg_lr <= 1;
            end
            else if (refclk_cnt == 3)
                reg_lr <= 0;
            else
                reg_lr <= 1;
        end
    end
end

// ports
assign ads_rstsel = 1;
assign dac_rstn = sys_rstn;
assign dac_csn  = reg_csn[0];
assign dac_sck  = reg_clk;
assign dac_sdi  = reg_data[15];
assign dac_lr   = reg_lr;

endmodule
 
