`include "definitions.v"

module verifier(input top_lim_cond,
                input bott_lim_cond,
                input top_lim_synth,
                input bott_lim_synth,
                input top_lim_synth_delay,
                input bott_lim_synth_delay
                );

  always @ (posedge top_lim_synth_delay or negedge top_lim_synth_delay) begin
    if (top_lim_synth_delay != top_lim_cond) begin
      $display("##############################\nError de salida en T = %t, top_lim_synth_delay = %d, top_lim_cond = %d, top_lim_synth = %d.\n##############################", $time, top_lim_synth_delay, top_lim_cond, top_lim_synth);
    end // if
  end

  always @ (posedge bott_lim_synth_delay or negedge bott_lim_synth_delay) begin
    if (bott_lim_synth_delay != bott_lim_cond) begin
      $display("##############################\nError de salida en T = %t, bott_lim_delay = %d, bott_lim_cond = %d, bott_lim_struct = %d.\n##############################", $time, bott_lim_synth_delay, bott_lim_cond, bott_lim_synth);
    end // if
  end

endmodule
