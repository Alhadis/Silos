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
        0: data = 8'ha9;    // LDA #0
        1: data = 8'h00;    // 
        2: data = 8'ha9;    // LDA #$FF
        3: data = 8'hFF;    // 
        4: data = 8'h85;    // STA $99
        5: data = 8'h99;    // 
        6: data = 8'ha2;    // LDX #11
        7: data = 8'h11;    //
        8: data = 8'h95;    // STA $33,x
        9: data = 8'h33;    //
        10: data = 8'had;   // LDA $FFFE
        11: data = 8'hFE;   //
        12: data = 8'hFF;   //
        13: data = 8'h9d;   // STA $44F0,X
        14: data = 8'hF0;   //
        15: data = 8'h44;   //
        16: data = 8'h99;   // STA $44F0,Y
        17: data = 8'hF0;   //
        18: data = 8'h44;   //
        19: data = 8'ha1;   // LDA ($f7,X) ; $f7+$11 = $08
        20: data = 8'hf7;   // should load from $3395
        21: data = 8'hb1;   // LDA ($02),y ; $ffa9+0 = $ffa9
        22: data = 8'h02;   // should read from $ffa9

        16'h3395: data = 8'h55;
        16'hffa9: data = 8'haa;
        16'hFFFC: data = 8'h00;
        16'hFFFD: data = 8'h00;
        16'hFFFE: data = 8'h80;
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
rom r(addr, idata, rw);


initial begin
    $dumpfile(`VCDOUT);
    $dumpvars(0, test);
    # 1 reset = 0;
    # 192 $finish;
end

always #1
begin
    clk = !clk;
    counter <= counter + 1;

    // Load timestamps are at the end of phi2 (falling edge of clk2)
    // Store timestamps are at the begin of phi2 (rising edge of clk2)

    // LDA #0
    `ASSERT_AT(16'h14, cpu.control0.flags == 8'h02);
    // LDA #-1
    `ASSERT_AT(16'h1c, cpu.control0.flags == 8'h80);

    // STA $99
    `ASSERT_AT(16'h27, addr == 16'h0099);
    `ASSERT_AT(16'h27, odata == 8'hFF);
    `ASSERT_AT(16'h27, rw == 0);

    // STA $33,x
    `ASSERT_AT(16'h3f, addr == 16'h0044);
    `ASSERT_AT(16'h3f, odata == 8'hFF);
    `ASSERT_AT(16'h3f, rw == 0);

    // LDA $FFFE
    `ASSERT_AT(16'h50, addr == 16'hFFFE);
    `ASSERT_AT(16'h50, cpu.control0.flags == 8'h80);

    // STA $44f0,x
    `ASSERT_AT(16'h63, addr == 16'h4501);
    `ASSERT_AT(16'h63, odata == 8'h80);
    `ASSERT_AT(16'h63, rw == 0);

    // STA $44f0,y
    `ASSERT_AT(16'h77, addr == 16'h44f0);
    `ASSERT_AT(16'h77, odata == 8'h80);
    `ASSERT_AT(16'h77, rw == 0);

    // LDA ($f7,x)
    `ASSERT_AT(16'h90, addr == 16'h3395);
    `ASSERT_AT(16'h90, idata == 8'h55);

    // LDA ($02),y
    `ASSERT_AT(16'ha4, addr == 16'hffa9);
    `ASSERT_AT(16'ha4, idata == 8'haa);
end

endmodule
