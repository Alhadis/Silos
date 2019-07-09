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


module test;

reg reset = 1;
reg clk = 0;
reg [31:0] counter = 0;

wire [15:0] addr;
wire [7:0] idata;
wire [7:0] odata;
wire rw;
wire nmi = 1;
wire irq = 1;
wire clk1;
wire clk2;

cpu6502 cpu(clk, reset, irq, nmi, addr, idata, odata, rw, clk1, clk2);
ram r(.address(addr[13:0]),
      .wdata(odata),
      .rw(rw),
      .ce(1'b1),
      .rdata(idata));


initial begin
    $dumpfile(`VCDOUT);
    $dumpvars(0, test);
    # 1 reset = 0;
    # 2000000 $finish;
end

always #1
begin
    clk = !clk;
    counter <= counter + 1;

    if (addr == 16'h0200 && rw == 0)
    begin
        $display("test_case = 0x%02x at pc=%04x t=0x%04x", odata, cpu.pc, counter);
    end
    // Load timestamps are at the end of phi2 (falling edge of clk2)
    // Store timestamps are at the begin of phi2 (rising edge of clk2)

end

endmodule
