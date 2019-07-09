/*
 *******************************************************************************
 *  File Name   :   ada_mux_4_1.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 31th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (C) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   A 4-input Mux.
 *******************************************************************************
 */

module ada_mux_4_1(
    input       [1:0]   select,
    input       [31:0]  in0,
    input       [31:0]  in1,
    input       [31:0]  in2,
    input       [31:0]  in3,
    output  reg [31:0]  out
    );

    always @(*) begin
        case (select)
            2'b00 : out <= in0;
            2'b01 : out <= in1;
            2'b10 : out <= in2;
            2'b11 : out <= in3;
        endcase
    end
endmodule
