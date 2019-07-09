/*
 *******************************************************************************
 *  File Name   :   ada_reg_file.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 2nd, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Regiser file for the ADA processor.
 *                  Contains 32 general-purpose 32-bits registers,
 *                  2 read ports, and 1 write port.
 *                  Register 0 always reads as Zero.
 *******************************************************************************
 */
module ada_reg_file(
    input           clk,            // clock
    input   [4:0]   read_addr_a,    // Address port A
    input   [4:0]   read_addr_b,    // Address port B
    input   [4:0]   write_addr,     // Write address
    input   [31:0]  write_data,     // Data to write
    input           we,             // Write enable
    output [31:0]   read_data_a,    // Data port A
    output [31:0]   read_data_b     // Data port B
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: reg
    //--------------------------------------------------------------------------
    reg [31:0] registers [1:31];                // Register file of 32 32-bit registers. Register 0 is hardwired to 0s

    //--------------------------------------------------------------------------
    // Sequential (clocked) write.
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (write_addr != 0)
            registers[write_addr] <= (we) ? write_data : registers[write_addr];
    end

    //--------------------------------------------------------------------------
    // Combinatorial Read. Register 0 is all 0s.
    //--------------------------------------------------------------------------
    assign read_data_a = (read_addr_a == 5'b0) ? 32'h0000_0000 : registers[read_addr_a];
    assign read_data_b = (read_addr_b == 5'b0) ? 32'h0000_0000 : registers[read_addr_b];
endmodule
