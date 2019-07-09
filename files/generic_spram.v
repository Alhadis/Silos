//
// This block is a wrapper with common single-port synchronous memory interface for different
// types FPGA RAMs. It is fully synthesizeable model for FPGAs. It can not be used for ASIC.
//
// Author:       Chen Yu
// Revision:    0.1 - Initial Release
//
`timescale 1ns / 1ps


module generic_spram(
        clk,
        re,
        we,
        addr,
        q,
        data
);
parameter SIMULATION = 1;
parameter aw = 12;              // number of bits in address-bus
parameter dw = 32;              // number of bits in data-bus
parameter wsize = 1<<aw;        // number of words in memory

        input           clk; //clock
        input           re; //read enable
        input           we; //write enable
        input [aw-1:0]  addr; //address
        input [dw-1:0]  data; //input data
        output reg [dw-1:0] q;   //output data
        
        
generate
if (SIMULATION) begin : SIM_RAM
        reg [dw-1:0]    mem [wsize -1:0]; // instantiate memory
        always @(posedge clk)
        if (re)
           q <= #1 mem[addr];

        always @(posedge clk)
        if (we)
           mem[addr] <= #1  data;
end
else begin
	altsyncram	altsyncram_component (
				.address_a (addr),
				.clock0 (clk),
				.data_a (data),
				.wren_a (we),
				.rden_a (re),
				.q_a (q),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone IV E",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = wsize,
		altsyncram_component.operation_mode = "SINGLE_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.ram_block_type = "M9K",
		altsyncram_component.read_during_write_mode_port_a = "DONT_CARE",
		altsyncram_component.widthad_a = aw,
		altsyncram_component.width_a = dw,
		altsyncram_component.width_byteena_a = 1;

end
endgenerate
endmodule
