`timescale 1us / 100ns

module testbench;
  wire [7:0] lane0s, lane1s, lane2s, lane3s, entradaBS;
  wire [7:0] lane0c, lane1c, lane2c, lane3c;
  wire lanevalid;
  wire validBS, relojMUX, relojBS;
  wire [1:0] counts, countc;
  wire reset;

  byte_striping_cond BS_conduct(
    .stripedLane0 (lane0c),
    .stripedLane1 (lane1c),
    .stripedLane2 (lane2c),
    .stripedLane3 (lane3c),
    .byteStripingVLD (validBS),
    .byteStripingIN (entradaBS),
    .laneVLD (validlane),
    .clk250k  (relojBS),
    .clk1Mhz  (relojMUX),
    .counter (countc),
    .reset (reset)
    );

  byte_striping_synth BS_struct(
    .stripedLane0 (lane0s),
    .stripedLane1 (lane1s),
    .stripedLane2 (lane2s),
    .stripedLane3 (lane3s),
    .byteStripingVLD (validBS),
    .byteStripingIN (entradaBS),
    .laneVLD (validlane),
    .clk250k  (relojBS),
    .clk1Mhz  (relojMUX),
    .counter (counts),
    .reset (reset)
    );

  tester_byte_striping BS_tester(
    .stripedLane0 (lane0),
    .stripedLane1 (lane1),
    .stripedLane2 (lane2),
    .stripedLane3 (lane3),
    .byteStripingVLD (validBS),
    .byteStripingIN (entradaBS),
    .laneVLD (validlane),
    .clk250k  (relojBS),
    .clk1Mhz  (relojMUX),
    .reset (reset)
    );

endmodule // testbench
