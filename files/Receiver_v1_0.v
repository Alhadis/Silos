
//`#start header` -- edit after this line, do not edit this line
// ========================================
// (C) Bizan Nishimura, 2019
// ========================================
`include "cypress.v"
//`#end` -- edit above this line, do not edit this line
// Generated on 06/22/2019 at 21:38
// Component: Receiver_v1_0
module Receiver_v1_0 (
	output reg [7:0] data,
	output reg full,
	input   clk,
	input   rd,
	input   res,
	input   rx
);

//`#start body` -- edit after this line, do not edit this line

    // レジスタ、ラッチ
    reg[7:0] rx_data;       // 受信データレジスタ
    reg[7:0] rx_data2;      // 受信データレジスタ(1クロック遅延)
    reg[7:0] pw_cnt;        // パルス幅カウンタ
    reg rx_old;             // rxの前回値
    reg[3:0] bit_cnt;       // ビット受信カウンタ  (0から8にカウントアップ、0はアイドル状態)
    reg data_set;           // 受信データセットタイミング
    reg rd_old;             // rdの前回値

    // 組み合わせ回路
    wire rx_edge;            // rxの立下りエッジ
    wire rd_edge;            // rdの立上りエッジ

    // パルス幅閾値 (パルス幅の理論値は 1なら24、0なら48、アイドルなら96)
    parameter PW_TOO_LONG = 128; // これ以上なら異常
    parameter PW_LONG  = 64;     // これ以上ならアイドル、未満ならデータ
    parameter PW_SHORT = 32;     // これ以上なら0、未満なら1

    // パルス幅カウント
    always @(posedge clk or posedge res)
    begin
        if (res) begin
            pw_cnt <= 0;
        end else begin
            if (rx) begin
                pw_cnt <= pw_cnt + 1;
            end else begin
                pw_cnt <= 0;
            end
        end
    end

    // rxの前回値
    always @(posedge clk or posedge res)
    begin
        if (res) begin
            rx_old <= 0;
        end else begin
            rx_old <= rx;
        end
    end
    // rxの立下りエッジ
    assign rx_edge = rx_old && !rx;

    // ビット受信カウンタ (0から8にカウントアップ、0はアイドル状態)
    always @(posedge clk or posedge res)
    begin
        if (res)
            bit_cnt <= 0;
        else begin 
            if (rx_edge == 1) begin
                if(pw_cnt >= PW_LONG) begin
                    bit_cnt <= 0;
                end else begin
                    bit_cnt <= bit_cnt + 1;
                end
            end
        end
    end

    // 受信データレジスタ
    always @(posedge clk or posedge res)
    begin
        if (res)
            rx_data <= 0;
        else begin 
            if (rx_edge == 1) begin
                if(pw_cnt >= PW_LONG) begin
                    rx_data <= 0;
                end else begin
                    if(pw_cnt >= PW_SHORT) begin
                        rx_data <= (rx_data << 1);
                    end else begin
                        rx_data <= (rx_data << 1) | 8'h01;
                    end
                end
            end
        end
    end
    // 受信データレジスタ(1クロック遅延)
    always @(posedge clk or posedge res)
    begin
        if (res)
            rx_data2 <= 0;
        else begin 
            rx_data2 <= rx_data;
        end
    end
    // 受信データセットタイミング
    always @(posedge clk or posedge res)
    begin
        if (res)
            data_set <= 0;
        else begin 
            if ((rx_edge == 1) && (bit_cnt == 8) && 
                (pw_cnt > PW_LONG) && (pw_cnt < PW_TOO_LONG)) begin
                data_set <= 1;
            end else begin
                data_set <= 0;
            end
        end
    end

    // 受信データ出力
    always @(posedge clk or posedge res)
    begin
        if (res) begin
            data <= 8'h00;
        end else begin
            if (data_set == 1) begin
                data <= rx_data2;
            end
        end
    end

    // rdの前回値
    always @(posedge clk or posedge res)
    begin
        if (res) begin
            rd_old <= 0;
        end else begin
            rd_old <= rd;
        end
    end
    // rdの立上がりエッジ
    assign rd_edge = !rd_old && rd;

    // 受信フルフラグ
    always @(posedge clk or posedge res)
    begin
        if (res) begin
            full <= 0;
        end else begin
            if (data_set == 1) begin
                full <= 1;
            end else if (rd_edge == 1) begin
                full <= 0;
            end 
        end
    end

//`#end` -- edit above this line, do not edit this line
endmodule
//`#start footer` -- edit after this line, do not edit this line
//`#end` -- edit above this line, do not edit this line
