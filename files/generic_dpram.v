//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Generic Dual-Port Synchronous RAM                           ////
////                                                              ////
////  This file is part of memory library available from          ////
////  http://www.opencores.org/cvsweb.shtml/generic_memories/     ////
////                                                              ////
////  Description                                                 ////
////  This block is a wrapper with common dual-port               ////
////  synchronous memory interface for different                  ////
////  types of ASIC and FPGA RAMs. Beside universal memory        ////
////  interface it also provides behavioral model of generic      ////
////  dual-port synchronous RAM.                                  ////
////  It also contains a fully synthesizeable model for FPGAs.    ////
////  It should be used in all OPENCORES designs that want to be  ////
////  portable accross different target technologies and          ////
////  independent of target memory.                               ////

////  Supported FPGA RAMs are:                                    ////
////  - Generic FPGA (VENDOR_FPGA)                                ////
////    Tested RAMs: Altera, Xilinx                               ////
////    Synthesis tools: LeonardoSpectrum, Synplicity             ////
////  - Xilinx (VENDOR_XILINX)                                    ////
////  - Altera (VENDOR_ALTERA)                                    ////
////                                                              ////
////  To Do:                                                      ////
////   - fix Avant!                                               ////
////   - add additional RAMs (VS etc)                             ////
////                                                              ////
////  Author(s):                                                  ////
////      - Richard Herveille, richard@asics.ws                   ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "./include/timescale.v"

module generic_dpram(
	// Generic synchronous dual-port RAM interface
	rclk, 	
	rce, 
	raddr, 
	do,
	wclk, 	
	wce, 
	we, 
	waddr, 
	di
);

	//
	// Default address and data buses width
	//
	parameter aw = 5;  // number of bits in address-bus
	parameter dw = 16; // number of bits in data-bus
	parameter wsize = 1<<aw;        // number of words in memory
	//
	// Generic synchronous double-port RAM interface
	//
	// read port
	input           rclk;  // read clock, rising edge trigger
	input           rce;   // read port chip enable, active high
	input  [aw-1:0] raddr; // read address
	output [dw-1:0] do;    // data output

	// write port
	input          wclk;  // write clock, rising edge trigger
	input          wce;   // write port chip enable, active high
	input          we;    // write enable, active high
	input [aw-1:0] waddr; // write address
	input [dw-1:0] di;    // data input

	//
	// Module body
	//

`ifdef SIM
	//
	// Instantiation synthesizeable FPGA memory
	//
	// This code has been tested using LeonardoSpectrum and Synplicity.
	// The code correctly instantiates Altera EABs and Xilinx BlockRAMs.
	//
	reg [dw-1:0] mem [wsize -1:0]; // instantiate memory
	reg [aw-1:0] ra;                 // register read address

	// read operation
	always @(posedge rclk)
	  if (rce)
	    ra <= #1 raddr;

	assign do = mem[ra];

	// write operation
	always@(posedge wclk)
		if (we && wce)
			mem[waddr] <= #1 di;

`else
	altsyncram	dpram (
				.wren_a (we & wce),
				.clock0 (wclk),
				.address_a (waddr),
				.address_b (raddr),
				.data_a (di),
				.q_b (do),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b ({dw{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		dpram.address_aclr_b = "NONE",
		dpram.address_reg_b = "CLOCK0",
		dpram.clock_enable_input_a = "BYPASS",
		dpram.clock_enable_input_b = "BYPASS",
		dpram.clock_enable_output_b = "BYPASS",
		dpram.intended_device_family = "Stratix IV",
		dpram.lpm_type = "altsyncram",
		dpram.numwords_a = wsize,
		dpram.numwords_b = wsize,
		dpram.operation_mode = "DUAL_PORT",
		dpram.outdata_aclr_b = "NONE",
		dpram.outdata_reg_b = "UNREGISTERED",
		dpram.power_up_uninitialized = "FALSE",
		dpram.ram_block_type = "M9K",
		dpram.read_during_write_mode_mixed_ports = "DONT_CARE",
		dpram.widthad_a = aw,
		dpram.widthad_b = aw,
		dpram.width_a = dw,
		dpram.width_b = dw,
		dpram.width_byteena_a = 1;
`endif

endmodule