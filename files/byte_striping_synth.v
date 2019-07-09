module byte_striping_synth (
  output reg [7:0] stripedLane0,
  output reg [7:0] stripedLane1,
  output reg [7:0] stripedLane2,
  output reg [7:0] stripedLane3,
  output reg byteStripingVLD,

  input wire [7:0] byteStripingIN,
  input wire laneVLD,
  input wire clk250k,
  input wire clk1Mhz,
  output reg [1:0] counter,
  input wire reset
  );

  always @ ( posedge clk1Mhz ) begin
    if (reset) begin
      counter <= counter + 1;
    end else begin
      counter <= 2'b11;
    end

    case (counter)
      2'b00: if (laneVLD) begin
        stripedLane0 <= byteStripingIN;
        byteStripingVLD <=0;
        // counter <= 2'b01;
      end
      2'b01: if (laneVLD) begin
        stripedLane1 <= byteStripingIN;
        byteStripingVLD <=0;
        // counter <= 2'b10;
      end
      2'b10: if (laneVLD) begin
        stripedLane2 <= byteStripingIN;
        byteStripingVLD <=0;
        // counter <= 2'b11;
      end
      2'b11: if (laneVLD) begin
        stripedLane3 <= byteStripingIN;
        byteStripingVLD <=1;
        // counter <= 2'b00;
      end
      default: byteStripingVLD <=0;
    endcase
  end

endmodule //byte_striping_struct
