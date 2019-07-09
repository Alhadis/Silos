
//`#start header` -- edit after this line, do not edit this line
// ========================================
//
// Copyright YOUR COMPANY, THE YEAR
// All Rights Reserved
// UNPUBLISHED, LICENSED SOFTWARE.
//
// CONFIDENTIAL AND PROPRIETARY INFORMATION
// WHICH IS THE PROPERTY OF your company.
//
// ========================================
`include "cypress.v"
//`#end` -- edit above this line, do not edit this line
// Generated on 06/22/2019 at 18:54
// Component: Transmitter_v1_0
module Transmitter_v1_0 (
	output  reg tx,
	output  empty,
	input   clk,
	input  [7:0] data,
	input   res,
	input   wr
);

//`#start body` -- edit after this line, do not edit this line

    // レジスタ、ラッチ
    reg wr_req;             // writeリクエスト
    reg[7:0] tx_data;          // 送信データレジスタ
    reg[4:0] pw_cnt;        // パルス幅カウンタ
    reg[3:0] bit_cnt;       // ビット送信カウンタ  (8から0にカウントダウン、0はアイドル状態)

    // 組み合わせ回路
    wire data_set;          // 送信データセットタイミング
    reg bit_end;            // ビット送信完了フラグ
    reg[1:0] sending_bit;   // ビット送信状態 (0送信か1送信かアイドルか)
    
    // 定数
    parameter BIT_IDLE = 0;  // 0送信状態
    parameter BIT_ZERO = 1;  // 1送信状態
    parameter BIT_ONE  = 2;  // アイドル状態
    
    // writeリクエスト状態
    always @(posedge clk or posedge res)
    begin
        if (res) begin
            wr_req <= 0;
        end else begin
            if(wr) begin
                wr_req <= 1;
            end else if(bit_end) begin
                wr_req <= 0;
            end
        end
    end
    
    // 送信データセットタイミング
    assign data_set = wr_req & bit_end;
    
    // 送信データレジスタ(8ビット)
    always @(posedge clk or posedge res)
    begin
        if (res)
            tx_data <= 8'h00;
        else begin
            if (bit_cnt == 0) begin
                if (data_set) begin
                    tx_data <= data;
                end
            end else begin
                if (bit_end) begin
                    tx_data <= (tx_data << 1);
                end
            end
        end
    end
    
    // ビット送信カウンタ (8から0にカウントダウン、0はアイドル状態)
    always @(posedge clk or posedge res)
    begin
        if (res)
            bit_cnt <= 0;
        else begin 
            if (bit_cnt == 0) begin
                if (data_set) begin
                    bit_cnt <= 8;
                end
            end else begin
                if(bit_end) begin
                    bit_cnt <= (bit_cnt - 1);
                end
            end
        end
    end

    // パルス幅カウンタ
    always @(posedge clk or posedge res)
    begin
        if (res)
            pw_cnt <= 0;
        else
            pw_cnt <= (bit_end) ? 0 : (pw_cnt + 1);
    end

    // ビット送信完了フラグ    
    always @(res or bit_cnt or sending_bit or pw_cnt)
    begin
        if (res)
            bit_end <= 0;
        else begin
            case(sending_bit)
                BIT_IDLE:
                    bit_end <= (pw_cnt < (16 - 1)) ? 0 : 1;
                BIT_ZERO:
                    bit_end <= (pw_cnt < (8 - 1)) ? 0 : 1;
                BIT_ONE:
                    bit_end <= (pw_cnt < (4 - 1)) ? 0 : 1;
                default:
                    bit_end <= 0;
            endcase
        end
    end
    
    // ビット送信状態 (0送信か1送信かアイドルか)
    always @(res or bit_cnt or tx_data)
    begin
        if (res)
            sending_bit <= BIT_IDLE;
        else begin 
            if (bit_cnt == 0)
                sending_bit <= BIT_IDLE;
            else begin
                sending_bit <= (tx_data[7]) ? BIT_ONE : BIT_ZERO;
            end
        end
    end
    
    // 送信出力(ベースバンド)
    always @(res or sending_bit or pw_cnt)
    begin
        if (res)
            tx <= 0;
        else begin
            case(sending_bit)
                BIT_IDLE:
                    tx <= (pw_cnt < 4) ? 0 : 1;
                BIT_ZERO:
                    tx <= (pw_cnt < 2) ? 0 : 1;
                BIT_ONE:
                    tx <= (pw_cnt < 1) ? 0 : 1;
                default:
                    tx <= 0;
            endcase
        end
    end

    // エンプティフラグ TODO レジスタにすべき
    assign empty = (sending_bit == BIT_IDLE) ? 1 : 0;


//`#end` -- edit above this line, do not edit this line
endmodule
//`#start footer` -- edit after this line, do not edit this line
//`#end` -- edit above this line, do not edit this line
