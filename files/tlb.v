// Table Lookaside Buffer, used for both data and instructions.
module TLB(input clk, [15:0]virtIn, [15:0]physIn, wrtFlag,
            output reg [15:0]physOut, missFlag);
  // Page size: 2^16.
  reg [31:0] physAddr[15:0];
  reg [31:0] virtAddr[15:0];
  reg [31:0] valid;
  // Flag that indicates if the cached @ has been found.
  reg found = 1'b0;
  reg i = 1'b0;

  initial
  begin
	for (i = 0; i < 31; i = i + 1) begin
		valid[i] = 1'b0;
	end
  end
  
  // Read
  always @(posedge clk, virtIn)
  begin
    if (!wrtFlag) begin
      // Look for the addr, if valid, return it.
      for (i = 0; i < 31; i= i + 1) begin
        if (virtAddr[i] == virtIn) begin
          found <= 1;
          physOut <= physAddr[i];
        end
      end
      // Otherwise, set miss.
      if (!found) begin
        assign missFlag = 1;
      end else begin
        found <= 0;
      end
    end
  end
  
  // Write
  always @(posedge clk, wrtFlag, physIn)
  begin
    // Store new value.
    // Look for the first empty place.
	for (i = 0; i < 31; i = i + 1) begin
		if (!valid[i]) begin
			virtAddr[i] = virtIn;
			physAddr[i] = physIn;
			valid[i] = 1'b1;
		end
	end
  end
endmodule

module testTLB();
	reg [15:0]virtData, clktest;
	wire [15:0]phys, miss;
	
	always begin
		clktest = 1'b0;
		#5 forever clktest = ~clktest;
	end

	TLB t(.clk(clktest), .virtIn(virtData), .physIn(16'b0), .wrtFlag(1'b0), .physOut(phys), .missFlag(miss));
	initial begin
		t.physAddr[0] = 16'b1111111111111111;
		t.virtAddr[0] = 16'b0000000000001001;
		t.valid[0] = 1'b1;
	end

	always begin
		virtData <= #10 16'b1111111111111111;
		virtData <= #30 16'b1111111111111110;
	end
endmodule
