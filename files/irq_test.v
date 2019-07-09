`define STRINGIFY(x) `"x`"
`ifdef DIE_ON_ASSERT
`define DIE $finish_and_return(1);
`else
`define DIE
`endif
`define VCDOUT {`__FILE__, "cd"}
`define ASSERT_AT(count_, cond_) \
    if (count_ == counter && (cond_) != 1) \
    begin \
        $display("[%s, %d] Assertion failed: %s", \
                 `__FILE__, `__LINE__, `STRINGIFY(cond_)); \
        `DIE \
    end

module rom(address, data, rd);
input [15:0] address;
output [7:0] data;
input rd;
reg [7:0] data;

always @(rd or address)
begin
    case (address)
        16'h1100: data = 8'ha2;     // LDX #$FF
        16'h1101: data = 8'hff;
        16'h1102: data = 8'h9a;     // TXS
        16'h1103: data = 8'hea;     // NOP
        16'h1104: data = 8'hea;     // NOP
        16'h1105: data = 8'hea;     // NOP
        16'h1106: data = 8'hea;     // NOP

        16'h2244: data = 8'hea;     // NOP

        16'h4433: data = 8'hea;     // NOP

        16'hFFFA: data = 8'h33;
        16'hFFFB: data = 8'h44;
        16'hFFFC: data = 8'h00;
        16'hFFFD: data = 8'h11;
        16'hFFFE: data = 8'h44;
        16'hFFFF: data = 8'h22;
        default: data = 8'hff;
    endcase

end
endmodule

module test;

reg reset = 1;
reg clk = 0;
reg [15:0] counter = 0;

wire [15:0] addr;
wire [7:0] idata;
wire [7:0] odata;
wire rw;
reg nmi = 1;
reg irq = 1;
wire clk1;
wire clk2;

cpu6502 cpu(clk, reset, irq, nmi, addr, idata, odata, rw, clk1, clk2);
rom r(addr, idata, rw);


initial begin
    $dumpfile(`VCDOUT);
    $dumpvars(0, test);
    # 1 reset = 0;
    # 32 irq = 0;
    # 192 $finish;
end

always #1
begin
    clk = !clk;
    counter <= counter + 1;

    // Load timestamps are at the end of phi2 (falling edge of clk2)
    // Store timestamps are at the begin of phi2 (rising edge of clk2)

    // push of PCH during JSR
    `ASSERT_AT(16'h2b, addr == 16'h01ff);
    `ASSERT_AT(16'h2b, odata == 8'h11);
    `ASSERT_AT(16'h2b, rw == 0);

    // push of PCL during JSR
    `ASSERT_AT(16'h2f, addr == 16'h01fe);
    `ASSERT_AT(16'h2f, odata == 8'h04);
    `ASSERT_AT(16'h2f, rw == 0);

    // push of PCL during JSR
    `ASSERT_AT(16'h37, addr == 16'h01fd);
    `ASSERT_AT(16'h37, odata == 8'ha0);
    `ASSERT_AT(16'h37, rw == 0);

    // NOP after JSR $5597
    `ASSERT_AT(16'h41, addr == 16'h2244);
    `ASSERT_AT(16'h41, idata == 8'hea);
end

endmodule
