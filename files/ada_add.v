/*
 *******************************************************************************
 *  File Name   :   ada_add.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 31th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (C) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   A simple 32 bits adder
 *******************************************************************************
 */

module ada_add(
    input  [31:0] A,
    input  [31:0] B,
    output [31:0] C
    );

    assign C = (A + B);

endmodule
