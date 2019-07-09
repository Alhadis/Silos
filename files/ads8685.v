// @file  : 8685 module
// @author: Shengbing Zhou
// @date  : 2017/10/6 

module ads8686if
(
    input  wire        sys_rstn,
    input  wire        clk_ref,
    
    output reg         convst_csn,
    output wire        ads_rstn,
    output reg         ads_sclk,
    output reg         ads_sdi,
    input  wire        ads_sdo0,
    input  wire        ads_sdo1,
    input  wire        ads_rvs,
    
    output reg         dvalid,
    output reg  [15:0] dout
);

// write command
localparam cfg_reg0c_w = 32'hd00c0000;
localparam cfg_reg10_w = 32'hd0100000;
localparam cfg_reg14_w = 32'hd0140001;
localparam cmd_nop     = 32'h00000000;

// read command
localparam cfg_reg10_r = 32'hc8100000; // c8100000: read half-word, get 16bit register data. 48100000: read: get 8bits data

// bring adc out of reset
assign ads_rstn = 1'b1;

// configure adc and read data out
reg [3:0]  reg_cfg_cnt;
reg [31:0] readout;
reg [31:0] cfgdata;
always @(negedge sys_rstn or posedge clk_ref) begin
    if (!sys_rstn) begin
        cfgdata <= 0;
    end
    else begin
        if (reg_cfg_cnt == 0) begin
            cfgdata <= cfg_reg0c_w;
        end
        else if (reg_cfg_cnt == 1) begin
            cfgdata <= cfg_reg10_w;
        end
        else if (reg_cfg_cnt == 2) begin
            cfgdata <= cfg_reg14_w;
        end
        else if (reg_cfg_cnt == 3) begin // for test
            cfgdata <= cfg_reg10_r;
        end
        else begin // read adc data
            cfgdata <= cmd_nop;
        end
    end
end

// FSM
localparam IDLE  = 0;
localparam DELAY = 1;
localparam WRITE = 2;
reg [3:0] state;
reg [15:0] clk_cnt;
reg [31:0] reg_cfg_data;
always @(negedge sys_rstn or posedge clk_ref) begin
    if (!sys_rstn) begin
        state <= IDLE;
        clk_cnt <= 0; 
        convst_csn <= 1;
        dvalid <= 0;
        ads_sclk <= 0;
        ads_sdi  <= 0;
    end
    else begin
        case(state)
            IDLE: begin
                state <= DELAY;              
                clk_cnt <= 0;
            end
            DELAY: begin
                clk_cnt <= clk_cnt + 1;
                if (clk_cnt >= 50) begin
                    state <= WRITE;  
                    readout <= 0;                    
                    reg_cfg_data <= {cfgdata[30:0], 1'b0};                    					
                    ads_sdi <= cfgdata[31];
                end
            end
            WRITE: begin
                clk_cnt <= clk_cnt + 1;
                if (clk_cnt >= 133) begin
                    state <= IDLE;
                    convst_csn <= 1;
                    dvalid <= 1;
                    dout   <= readout[31:16];
                    ads_sclk <= 0;
                    if (reg_cfg_cnt <= 3)
                        reg_cfg_cnt <= reg_cfg_cnt + 1;                                        
                end
                else if (clk_cnt >= 70) begin
                    ads_sclk <= ~ads_sclk;
                    if (ads_sclk) begin                 // prepare data on falling edge
                        ads_sdi <= reg_cfg_data[31];
                        reg_cfg_data <= {reg_cfg_data[30:0], 1'b0};                    
                    end
                    else begin
                        readout <= {readout[30:0], ads_sdo0};
                    end
                end
                else if (clk_cnt >= 60) begin
                    convst_csn <= 0;
                    dvalid <= 0;
                end             
            end
            default: begin
                state <= IDLE;
                clk_cnt <= 0;
                convst_csn <= 1;
                dvalid <= 0;
                ads_sclk <= 0;
                ads_sdi  <= 0;                
            end
        endcase        
    end
end

endmodule