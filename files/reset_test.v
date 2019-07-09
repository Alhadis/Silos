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
input [3:0] address;
output [7:0] data;
input rd;
reg [7:0] data;

always @(rd or address)
begin
    case (address)
        0: data = 8'hea;   // NOP
        1: data = 8'hea;
        2: data = 8'hea;
        3: data = 8'hea;
        4: data = 8'hea;
        5: data = 8'hea;
        6: data = 8'hea;
        7: data = 8'hea;
        8: data = 8'hea;
        9: data = 8'hea;
        10: data = 8'h00;
        11: data = 8'h00;
        12: data = 8'h00;  // Reset vector = $FF00
        13: data = 8'hFF;
        14: data = 8'h00;
        15: data = 8'h00;
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
wire nmi = 1;
wire irq = 1;
wire clk1;
wire clk2;

cpu6502 cpu(clk, reset, irq, nmi, addr, idata, odata, rw, clk1, clk2);
rom r(addr[3:0], idata, rw);


initial begin
    $dumpfile(`VCDOUT);
    $dumpvars(0, test);
    # 1 reset = 0;
    # 31 reset = 1;
    # 10 reset = 0;
    # 48 $finish;
end

always #1
begin
    clk = !clk;
    counter <= counter + 1;
    // Reset vector fetch at FFFC
    `ASSERT_AT(16'h05, addr == 16'hFFFC);
    `ASSERT_AT(16'h09, addr == 16'hFFFD);

    // Fetch code at FF00
    `ASSERT_AT(16'h0d, addr == 16'hFF00);
    `ASSERT_AT(16'h15, addr == 16'hFF01);

    // Reset again, re-fetch reset vector
    `ASSERT_AT(16'h25, addr == 16'hFFFC);
    `ASSERT_AT(16'h29, addr == 16'hFFFD);
    // And execute code again
    `ASSERT_AT(16'h2d, addr == 16'hFF00);
    `ASSERT_AT(16'h35, addr == 16'hFF01);
end

endmodule
