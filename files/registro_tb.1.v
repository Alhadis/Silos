`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precisión
// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "registro_struct.v"
`include "registro_cond.v"
`include "tester.v"
`include "verifier.v"
`include "synth.v"
`include "synthA.v"
`include "synth_delay.v"

module testbench;

   // Wires para alambrar módulos
   wire ENB_tb, CLK_tb, DIR_tb, S_IN_tb;
   wire S_OUTstruct_tb, S_OUTnstruct_tb, S_OUTcond_tb;
   wire S_OUTyosA_tb, S_OUTyos_tb, S_OUTdelay_tb;
   wire [3:0] Qcond_tb;
   wire [3:0] Qstruct_tb;
   wire [3:0] Qnstruct_tb;
   wire [3:0] Qyos_tb;
   wire [3:0] QA_tb;
   wire [3:0] Qdelay_tb;
   wire [3:0] D_tb;
   wire [1:0] MODO_tb;

   // Wires para contadores
   wire [31:0] dato;
   wire [`Ndir:0] dir;

   parameter PwrC = 0;

   tester     letest( .Qcond        (Qcond_tb),
                      .Qstruct      (Qstruct_tb),
                      .QA           (QA_tb),
                      .Qyos         (Qyos_tb),
                      .Qdelay       (Qdelay_tb),
                      .S_OUTcond    (S_OUTcond_tb),
                      .S_OUTstruct  (S_OUTstruct_tb),
                      .S_OUTnstruct (S_OUTnstruct_tb),
                      .S_OUTA       (S_OUTyosA_tb),
                      .S_OUTyos     (S_OUTyos_tb),
                      .S_OUTdelay   (S_OUTdelay_tb),
                      .MODO         (MODO_tb),
                      .DIR          (DIR_tb),
                      .D            (D_tb),
                      .S_IN         (S_IN_tb),
                      .ENB          (ENB_tb),
                      .CLK          (CLK_tb)
                      );

  registro_struct    r_struct(  .Q          (Qstruct_tb),
                                .Qn         (Qnstruct_tb),
                                .S_OUT      (S_OUTstruct_tb),
                                .S_OUTn     (S_OUTnstruct_tb),
                                .D          (D_tb),
                                .MODO       (MODO_tb),
                                .CLK        (CLK_tb),
                                .ENB        (ENB_tb),
                                .DIR        (DIR_tb),
                                .S_IN       (S_IN_tb)
                                );

  registro_cond #(4, 0) r_cond(   .Q        (Qcond_tb),
                                  .S_OUT    (S_OUTcond_tb),
                                  .D        (D_tb),
                                  .MODO     (MODO_tb),
                                  .CLK      (CLK_tb),
                                  .ENB      (ENB_tb),
                                  .DIR      (DIR_tb),
                                  .S_IN     (S_IN_tb)
                              );

  registro_yosys      r_yosys (   .Q        (Qyos_tb),
                                  .S_OUT    (S_OUTyos_tb),
                                  .D        (D_tb),
                                  .MODO     (MODO_tb),
                                  .CLK      (CLK_tb),
                                  .ENB      (ENB_tb),
                                  .DIR      (DIR_tb),
                                  .S_IN     (S_IN_tb)
                                  );

  registro_A      r_A         (   .Q        (QA_tb),
                                  .S_OUT    (S_OUTyosA_tb),
                                  .D        (D_tb),
                                  .MODO     (MODO_tb),
                                  .CLK      (CLK_tb),
                                  .ENB      (ENB_tb),
                                  .DIR      (DIR_tb),
                                  .S_IN     (S_IN_tb)
                                  );

  registro_yosys_delay r_delay(   .Q        (Qdelay_tb),
                                  .S_OUT    (S_OUTdelay_tb),
                                  .D        (D_tb),
                                  .MODO     (MODO_tb),
                                  .CLK      (CLK_tb),
                                  .ENB      (ENB_tb),
                                  .DIR      (DIR_tb),
                                  .S_IN     (S_IN_tb)
                                  );

  verifier          leverifier(   .Qcond        (Qcond_tb),
                                  .Qstruct      (Qstruct_tb),
                                  .Qyos         (Qyos_tb),
                                  .QA           (QA_tb),
                                  .Qdelay       (Qdelay_tb),
                                  .S_OUTcond    (S_OUTcond_tb),
                                  .S_OUTstruct  (S_OUTstruct_tb),
                                  .S_OUTyosA    (S_OUTyosA_tb),
                                  .S_OUTyos     (S_OUTyos_tb),
                                  .S_OUTdelay   (S_OUTdelay_tb)
                                  );

endmodule
