`timescale 1ns/100ps

module alu_tb;

logic [5:0] fn;
logic [31:0] a;
logic [31:0] b;
logic [31:0] y;

logic clk;
always begin
    clk = 0;
    #10;
    clk = 1;
    #10;
end

alu dut(
    .fn(fn),
    .a(a),
    .b(b),
    .y(y)
);

integer dut_error_counter = 0;

task test_case;
    input [5:0] test_fn;
    input [31:0] test_a;
    input [31:0] test_b;
    input [31:0] expected;
begin
    a <= test_a;
    b <= test_b;
    fn <= test_fn;
    @(posedge clk);
    if (y == expected) begin
        $display("PASS: fn=%b a=%x b=%x y=%x expected=%x",
            test_fn, test_a, test_b, y, expected);
    end else begin
        $display("** FAIL: fn=%b a=%x b=%x y=%x expected=%x",
            test_fn, test_a, test_b, y, expected);
        dut_error_counter = dut_error_counter + 1;
    end
end
endtask

initial begin
    @(posedge clk);
    // boolean test cases
    test_case(6'b100000, 32'hffffffff, 32'h00000000, 32'h00000000);
    test_case(6'b101111, 32'hffffffff, 32'h00000000, 32'hffffffff);
    test_case(6'b101000, 32'hffffffff, 32'h0000ffff, 32'h0000ffff);
    test_case(6'b101000, 32'hffff0000, 32'h0000ffff, 32'h00000000);
    test_case(6'b101110, 32'hffffffff, 32'h0000ffff, 32'hffffffff);
    test_case(6'b101110, 32'hff00ff00, 32'hffff0000, 32'hffffff00);
    test_case(6'b100110, 32'hff00ff00, 32'hffff0000, 32'h00ffff00);

    // add / subtract test cases
    test_case(6'b010000, 32'h0000ffff, 32'h0000ffff, 32'h0001fffe);
    test_case(6'b010000, 32'hffffffff, 32'h00000001, 32'h00000000);
    test_case(6'b010000, 32'hffffffff, 32'h00000002, 32'h00000001);
    test_case(6'b010000, 32'h80000000, 32'h80000000, 32'h00000000);
    test_case(6'b010000, 32'h80000001, 32'h80000001, 32'h00000002);
    test_case(6'b010001, 32'h00000000, 32'h00000001, 32'hffffffff);
    test_case(6'b010001, 32'h7fffffff, 32'h80000000, 32'hffffffff);

    // shift test cases
    test_case(6'b110000, 32'h00000001, 32'h00000001, 32'h00000002);
    test_case(6'b110001, 32'h0000ff00, 32'h00000003, 32'h00001fe0);
    test_case(6'b110011, 32'h80000000, 32'h00000003, 32'hf0000000);

    // compare test cases
    test_case(6'b000011, 32'hffffffff, 32'hffffffff, 32'h00000001);

    if (dut_error_counter != 0) begin
        $display("ERROR: %d test cases failed", dut_error_counter);
    end else begin
        $display("PASS: all test cases passed");
    end
    $finish;
end

endmodule