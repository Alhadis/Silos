`timescale 1ns/100ps

`include "library.v"
`include "definitions.v"

module registro_struct (  output  wire  [3:0] Q,
                          output  wire  [3:0] Qn,
                          output  wire        S_OUT,
                          output  wire        S_OUTn,
                          input   wire  [3:0] D,
                          input   wire  [1:0] MODO,
                          input   wire        CLK, ENB, DIR, S_IN
                          );

  parameter PwrC = 1;

  // Conecto bloques FFD a bloques MUX
  wire oD_Q3, oD_Q2, oD_Q1, oD_Q0;

  // Conecto negativos de señales para reutilizar
  // los mismos bloques mux
  wire DIR_rmux, m0_msout;
  wire gnd;

  // Para alambrar mid mux al FFD que maneja S_OUT
  wire ommux_s_out;
  wire nand_msout;
  wire nMODO0, nMODO1;
  // wire not_msout;

  assign gnd = 1'b0;

  ff_d #(PwrC) Q3(  .Q    (Q[3]),
                    .Qn   (Qn[3]),
                    .D    (oD_Q3),
                    .CLK  (CLK),
                    .ENB  (ENB)
                    );

  ff_d #(PwrC) Q2(  .Q    (Q[2]),
                    .Qn   (Qn[2]),
                    .D    (oD_Q2),
                    .CLK  (CLK),
                    .ENB  (ENB)
                    );

  ff_d #(PwrC) Q1(  .Q    (Q[1]),
                    .Qn   (Qn[1]),
                    .D    (oD_Q1),
                    .CLK  (CLK),
                    .ENB  (ENB)
                    );

  ff_d #(PwrC) Q0(  .Q    (Q[0]),
                    .Qn   (Qn[0]),
                    .D    (oD_Q0),
                    .CLK  (CLK),
                    .ENB  (ENB)
                    );

  left_mux #(PwrC) left(  .oD       (oD_Q3),
                          .S_IN     (S_IN),
                          .Qcirc    (Q[0]),
                          .Qright   (Q[2]),
                          .D        (D[3]),
                          .DIR      (DIR),
                          .MODO1    (MODO[1]),
                          .MODO0    (MODO[0])
                          );

  mid_mux #(PwrC) q3_q2(  .oD       (oD_Q2),
                          .Qleft    (Q[3]),
                          .Qright   (Q[1]),
                          .D        (D[2]),
                          .DIR      (DIR),
                          .MODO1    (MODO[1])
                          );

  mid_mux #(PwrC) q2_q1(  .oD       (oD_Q1),
                          .Qleft    (Q[2]),
                          .Qright   (Q[0]),
                          .D        (D[1]),
                          .DIR      (DIR),
                          .MODO1    (MODO[1])
                          );

  // right_mux #(PwrC) right(  .oD       (oD_Q0),
  //                           .S_IN     (S_IN),
  //                           .Qcirc    (Q[3]),
  //                           .Qleft    (Q[1]),
  //                           .D        (D[0]),
  //                           .DIR      (DIR),
  //                           .MODO1    (MODO[1]),
  //                           .MODO0    (MODO[0])
  //                           );

  left_mux #(PwrC) right( .oD       (oD_Q0),
                          .S_IN     (S_IN),
                          .Qcirc    (Q[3]),
                          .Qright   (Q[1]),
                          .D        (D[0]),
                          .DIR      (DIR_rmux),
                          .MODO1    (MODO[1]),
                          .MODO0    (MODO[0])
                          );

  not_ti #(PwrC) not_DIR(   .oNot     (DIR_rmux),
                            .iA       (DIR)
                            );

  // sout_mux #(PwrC) to_sout( .oD     (ommux_s_out),
  //                           .Q3     (Q[3]),
  //                           .Q0     (Q[0]),
  //                           .DIR    (DIR),
  //                           .MODO0  (MODO[0])
  //                           );

  not_ti #(PwrC) not_MODO1( .oNot     (nMODO1),
                            .iA       (MODO[1])
                            );

  not_ti #(PwrC) not_MODO0( .oNot     (nMODO0),
                            .iA       (MODO[0])
                            );

  nand_ti #(PwrC) nand_sout(.oNand  (nand_msout),
                            .iA     (nMODO0),
                            .iB     (nMODO1)
                            );

  // not_ti #(PwrC) not_sout(    .oNot     (not_msout),
  //                             .iA       (nand_not_msout)
  //                             );

  mid_mux #(PwrC) to_sout(  .oD       (ommux_s_out),
                            .Qleft    (Q[0]),
                            .Qright   (Q[3]),
                            .D        (gnd),
                            .DIR      (DIR),
                            .MODO1    (nand_msout)
                            );

  ff_d #(PwrC) s_out(  .Q    (S_OUT),
                       .Qn   (S_OUTn),
                       .D    (ommux_s_out),
                       .CLK  (CLK),
                       .ENB  (ENB)
                       );
endmodule
