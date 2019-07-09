module pckgen(
  input SYSCLK,
  output PCK
);

wire CLKFBOUT,iPCK,locked;
BUFG iBUFG(.I(iPCK), .O(PCK));

MMCME2_BASE #(CLKFBOUT)




//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG

  clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1(clk_out1),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in1));      // input clk_in1
// INST_TAG_END ------ End INSTANTIATION Template ---------
