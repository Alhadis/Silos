

module sNAND2(OUT,IN1,IN2);
    input IN1,IN2;
    output OUT;
    nand #2 g1(OUT,IN1,IN2);
endmodule

module sNAND3(OUT,IN1,IN2,IN3);
    input IN1,IN2,IN3;
    output OUT;
    nand #3.5 g1(OUT,IN1,IN2,IN3);
endmodule

module sNAND4(OUT,IN1,IN2,IN3,IN4);
    input IN1,IN2,IN3,IN4;
    output OUT;
    nand #6 g1(OUT,IN1,IN2,IN3,IN4);
endmodule


module sAND2(OUT,IN1,IN2);
    input IN1,IN2;
    output OUT;
    and #3 g1(OUT,IN1,IN2);
endmodule

module sAND3(OUT,IN1,IN2,IN3);
    input IN1,IN2,IN3;
    output OUT;
    and #4.5 g1(OUT,IN1,IN2,IN3);
endmodule

module sAND4(OUT,IN1,IN2,IN3,IN4);
    input IN1,IN2,IN3,IN4;
    output OUT;
    and #7 g1(OUT,IN1,IN2,IN3,IN4);
endmodule

module sNOR2(OUT,IN1,IN2);
    input IN1,IN2;
    output OUT;
    nor #3 g1(OUT,IN1,IN2);
endmodule

module sNOR3(OUT,IN1,IN2,IN3);
    input IN1,IN2,IN3;
    output OUT;
    nor #4.5 g1(OUT,IN1,IN2,IN3);
endmodule

module sNOR4(OUT,IN1,IN2,IN3,IN4);
    input IN1,IN2,IN3,IN4;
    output OUT;
    nor #7 g1(OUT,IN1,IN2,IN3,IN4);
endmodule

module sOR2(OUT,IN1,IN2);
    input IN1,IN2;
    output OUT;
    or #4 g1(OUT,IN1,IN2);
endmodule

module sOR3(OUT,IN1,IN2,IN3);
    input IN1,IN2,IN3;
    output OUT;
    or #5.5 g1(OUT,IN1,IN2,IN3);
endmodule

module sOR4(OUT,IN1,IN2,IN3,IN4);
    input IN1,IN2,IN3,IN4;
    output OUT;
    or #8 g1(OUT,IN1,IN2,IN3,IN4);
endmodule

module sNOT(OUT,IN);
    input IN;
    output OUT;
    not #1 g1(OUT,IN);
endmodule
