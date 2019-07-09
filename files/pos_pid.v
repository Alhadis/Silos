module pos_pid
(
    input  wire        sys_rstn,
    input  wire        clk_pid,
    
    input  wire [15:0] kp,
    input  wire [15:0] ki,
    input  wire [15:0] kd,
    
    input  wire [15:0] pos_pre,
    input  wire [15:0] pos_adc,
    output wire [15:0] pos_dac
);

reg  [15:0] pos_pre_reg;
reg  [15:0] pos_adc_reg;
wire [15:0] ek;
reg  [15:0] ek_d1;
reg  [15:0] ek_d2;
wire [15:0] delta_e1;
wire [15:0] delta_e2;
wire [15:0] delta_e12;

wire [31:0] mp_delta_e1;
wire [31:0] mi_e;
wire [31:0] md_delta_e12;

wire [15:0] sum1;
wire [15:0] sum2;

wire [15:0] pos_dac_reg;
reg  [15:0] pos_dac_reg_d1;

always @(negedge sys_rstn or posedge clk_pid) begin
    if (!sys_rstn) begin
        pos_pre_reg <= 0;
        pos_adc_reg <= 0;
        ek_d1 <= 0;
        ek_d2 <= 0;
        pos_dac_reg_d1 <= 0;
    end
    else if (clk_pid) begin
        pos_pre_reg <= pos_pre;
        pos_adc_reg <= pos_adc;
        ek_d1 <= ek;
        ek_d2 <= ek_d1;
        pos_dac_reg_d1 <= pos_dac_reg;
    end
end

assign ek = pos_pre_reg - pos_adc_reg;
assign delta_e1  = ek    - ek_d1;
assign delta_e2  = ek_d2 - ek_d1;
assign delta_e12 = delta_e1 + delta_e2;

assign mp_delta_e1  = kp * delta_e1;
assign mi_e         = ki * ek;
assign md_delta_e12 = kd * ek;

assign sum1 = pos_dac_reg_d1 + mp_delta_e1[31:16];
assign sum2 = mi_e[31:16] + md_delta_e12[31:16];
assign pos_dac_reg = sum1 + sum2;
assign pos_dac = pos_dac_reg;

endmodule
