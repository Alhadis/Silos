module Stm32connectTo(  
    input clk,
    input rst_n,
    input CS_N,
    input SCK,
    input MOSI,
   // input [15:0] txd_data,
   // output reg MISO
    output reg [15:0] rxd_data,
    output rxd_flag
    // output sel
);   

reg sck_r0,sck_r1;
wire sck_n,sck_p;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        sck_r0 <= 1'b1;   //sck of the idle state is high 
        sck_r1 <= 1'b1;
    end
    else
    begin
        sck_r0 <= SCK;
        sck_r1 <= sck_r0;
    end
end

assign sck_n = (~sck_r0 & sck_r1)? 1'b1:1'b0;   //capture the sck negedge
assign sck_p = (~sck_r1 & sck_r0)? 1'b1:1'b0;   //capture the sck posedge

//-----------------------spi_slaver read data-------------------------------
reg rxd_flag_r;
reg [2:0] rxd_state;
reg [3:0]cnt;
reg [15:0]temp;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
            temp <= 1'b0;
            rxd_flag_r <= 1'b0;
            rxd_state <= 3'b0;
            cnt <= 4'd15;
        end
    else if(CS_N)
    begin
            rxd_flag_r <= 1'b0;
            rxd_state <= 3'b0;
            cnt <= 4'd15;
     end
    else if(sck_p && !CS_N)   
        begin
            case(rxd_state)
                3'd0:begin
                    temp[cnt] <= MOSI;
                    rxd_flag_r <= 1'b0;
                    rxd_state <= 3'd1;
                    cnt <= cnt - 1;
                    end       
                3'd1:begin
                    temp[cnt] <= MOSI;
                    cnt <= cnt -1;
                    if(cnt == 1)begin
								rxd_state <= 3'd2;
                    end
                end
                3'd2:begin
							cnt <= 15;
                    temp[cnt] <= MOSI;
                    rxd_flag_r <= 1'b1;  //set rxd_flag
                    rxd_state <= 3'd0;
                      end
                default: ;
            endcase
        end
end

/**********************防止出错**************************/
reg [15:0]rxd_data_temp;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        rxd_data_temp <= 0;
    end
    else begin
        rxd_data_temp <= temp;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        rxd_data <= 0;
    end
    else if (temp >= rxd_data_temp && temp <= 16'd2800) begin
        rxd_data <= temp;
    end
end

//--------------------capture spi_flag posedge--------------------------------
reg rxd_flag_r0,rxd_flag_r1;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
            rxd_flag_r0 <= 1'b0;
            rxd_flag_r1 <= 1'b0;
        end
    else
        begin
            rxd_flag_r0 <= rxd_flag_r;
            rxd_flag_r1 <= rxd_flag_r0;
        end
end

assign rxd_flag = (~rxd_flag_r1 & rxd_flag_r0)? 1'b1:1'b0;   //posedge

endmodule

