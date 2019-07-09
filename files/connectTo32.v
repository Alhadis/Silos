module connectTo32(  
    input clk,
    input rst_n,
    input CS_N,
    input SCK,
    // input MOSI,
    input [15:0] txd_data,
    input data_ready,
    output reg MISO
    // output reg [7:0] rxd_data,
    // output rxd_flag,
    // output sel
);   

//-------------------------capture the sck-----------------------------    
/*
parameter txd_data1 = 32'hAE56815C;
parameter txd_data2 = 32'hBBEEAACC;
*/

reg flag;
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


/**************************数据准备上升沿***********************/
reg ready_r0, ready_r1;
wire ready_pos;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        ready_r1 <= 0;
        ready_r0 <= 0;
    end
    else begin
        ready_r0 <= data_ready;
        ready_r1 <= ready_r0;
    end
end
assign ready_pos = (~ready_r1 & ready_r0)? 1'b1:1'b0;

/***********************数据封装****************************/
reg [319:0] data;//不用for是因为后面就要20个状态
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset
       data <= 0;
    end
    else if (!flag & ready_pos) begin
        data <= {txd_data,data[319:16]};
    end
end

//---------------------spi_slaver send data---------------------------
reg [3:0] txd_state;
reg [9:0] cnt;
always@(posedge clk or negedge rst_n or posedge CS_N)
begin
    if(!rst_n | CS_N)
    begin
		cnt <= 10'd319;
        flag <= 0;
    end
    else if(sck_n & !CS_N)
    begin
        flag <= 1;
        MISO <= data[cnt];
        if(cnt==10'd0)
        begin
            cnt <= 10'd319;
            flag <= 0;
        end
        else cnt <= cnt - 1;
    end
end

endmodule

