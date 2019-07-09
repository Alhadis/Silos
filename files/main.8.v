module main(
	input  clk,
	input reset,
	input  [3:0]switches,
	output [3:0]leds
);

 project1 u0 (
	.clk_clk         (clk),         //      clk.clk
	.switches_export (switches), // switches.export
	.leds_export     (leds),      //     leds.export
	.reset_reset_n   (reset)     //reset_reset_n
);

endmodule