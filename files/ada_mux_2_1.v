/*
 *******************************************************************************
 *  File Name   :   ada_mux_2_1.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Sept 1st, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (C) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   A 2-input Mux.
 *******************************************************************************
 */

module ada_mux_2_1(
    input               select,
    input       [31:0]  in0,
    input       [31:0]  in1,
    output  reg [31:0]  out
    );

    always @(*) begin
        case (select)
            1'b0 : out <= in0;
            1'b1 : out <= in1;
        endcase
    end
endmodule
