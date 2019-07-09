/******************************************************************************
 * File: multicycle.v
 * Author: ECE243 development team, Patrick Payne, Alex Papanicolaou
 * Date Created: Original 2007, modifications November 2013
 * Purpose: Implements the datapath of the multicycle processor. See project
 *    documentation for details.
 * Original file Copyright (c) 2007 by University of Toronto ECE 243
 * development team.
 *****************************************************************************/

module multicycle(
    input [1:0] KEY,
    input [2:0] SW,
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
    output [7:0] LEDG,
    output [17:0] LEDR);

  /* Internal registers/wires. */
  wire clock, reset;
  wire S1Load, S2Load, S3Load, S4Load;
  wire MDRLoad, MemRead, MemWrite, PC_sel, PC0_write, RegIn, Stop;
  wire ALUOutWrite, FlagWrite, R1R2Load, R1Sel, RFWrite;
  wire [7:0] R2wire, R1wire, RFout1wire, RFout2wire;
  wire [7:0] PC_in, PC0wire, PC1wire, PC2wire, PC3wire;
  wire [7:0] ALU1wire, ALU2wire, ALUwire, ALUOut, MDRwire, MEMwire;
  wire [7:0] IR1_in, IR1_out, IR2_out, IR3_out, IR4_out;
  wire [7:0] SE4wire, ZE5wire, ZE3wire, RegWire;
  wire [7:0] reg0, reg1, reg2, reg3;
  wire [7:0] HEX10_wire, HEX32_wire, HEX54_wire, HEX76_wire;
  wire [7:0] constant;
  reg [15:0] performance_count;
  wire [2:0] ALUOp, ALU2;
  wire [1:0] R1_in, ALU1;
  wire en_fetch, en_read, en_exec, en_wb;
  wire bypass_ALU1, bypass_ALU2;
  wire RegWSel;
  wire [1:0] RegW_in;
  wire [7:0] R1_mux_to_R1, R2_mux_to_R2;
  wire bypass_R1, bypass_R2;
  wire Nwire, Zwire, branch;
  wire wb_writing;
  wire ALUOut_sel;
  wire [7:0] ALUOut_in;
  reg  N, Z;

  /* Input assigments */
  assign clock = KEY[1];
  assign reset = ~KEY[0]; // KEY is active high

  control_main main(
    .clock(clock), .reset(reset), .N(N), .Z(Z),
    .ir1(IR1_out), .ir2(IR2_out), .ir3(IR3_out), .ir4(IR4_out), .branch(branch),
    .bypass_ALU1(bypass_ALU1), .bypass_ALU2(bypass_ALU2), .ir1_load(S1Load),
    .ir2_load(S2Load), .ir3_load(S3Load), .ir4_load(S4Load),
    .en_fetch(en_fetch), .en_read(en_read), .en_exec(en_exec), .en_wb(en_wb),
	.bypass_R1(bypass_R1), .bypass_R2(bypass_R2), .WB_writing(wb_writing));
  
  control_fetch fetch (
      .branch(branch), .en_fetch(en_fetch), .opcode(IR1_out[3:0]),
      .pc_sel(PC_sel), .pc0(PC0_write));
      
  control_read read (
     .instr(IR2_out[3:0]), .en_read(en_read), .r1r2_load(R1R2Load), .r1_sel(R1Sel));

  control_exec exec (
     .instr(IR3_out[3:0]), .en_exec(en_exec), .bypass_ALU1(bypass_ALU1),
     .bypass_ALU2(bypass_ALU2), .alu1(ALU1), .mem_read(MemRead),
     .mem_write(MemWrite), .mdr_load(MDRLoad), .flag_write(FlagWrite),
     .alu_2(ALU2), .alu_op(ALUOp), .alu_out_write(ALUOutWrite), .reg_in(RegIn));
      
  control_wb  wb (
    .opcode(IR4_out[3:0]), .en_wb(en_wb), .rf_write(RFWrite), .regw_sel(RegWSel),
    .stop(Stop));

  memory DataMem(
     .MemRead(MemRead), .wren(MemWrite), .clock(clock), .address(ALU2wire),
     .address_pc(PC0wire), .data(R1wire), .q(MEMwire), .q_pc(IR1_in));

  ALU  ALU(
     .in1(ALU1wire), .in2(ALU2wire), .out(ALUwire),
     .ALUOp(ALUOp), .N(Nwire), .Z(Zwire));

  RF  RF_block(
     .clock(clock), .reset(reset), .RFWrite(RFWrite),
     .dataw(ALUOut), .reg1(R1_in), .reg2(IR2_out[5:4]),
     .regw(RegW_in), .data1(RFout1wire), .data2(RFout2wire),
     .r0(reg0), .r1(reg1), .r2(reg2), .r3(reg3));

  /* Implement the pipelined instruction registers. */
  register_8bit IR1_reg(
     .clock(clock), .aclr(reset), .enable(S1Load),
     .data(IR1_in), .q(IR1_out));

  register_8bit IR2_reg(
     .clock(clock), .aclr(reset), .enable(S2Load),
     .data(IR1_out), .q(IR2_out));

  register_8bit IR3_reg(
     .clock(clock), .aclr(reset), .enable(S3Load),
     .data(IR2_out), .q(IR3_out));

  register_8bit IR4_reg(
     .clock(clock), .aclr(reset), .enable(S4Load),
     .data(IR3_out), .q(IR4_out));

  register_8bit PC0(
     .clock(clock), .aclr(reset), .enable(PC0_write),
     .data(PC_in), .q(PC0wire));
     
  register_8bit PC1(
     .clock(clock), .aclr(reset), .enable(S1Load),
     .data(PC0wire + 8'b1), .q(PC1wire));
     
  register_8bit PC2(
     .clock(clock), .aclr(reset), .enable(S2Load),
     .data(PC1wire), .q(PC2wire));
     
  register_8bit PC3(
     .clock(clock), .aclr(reset), .enable(S3Load),
     .data(PC2wire), .q(PC3wire));

  register_8bit R1(
     .clock(clock), .aclr(reset), .enable(R1R2Load),
     .data(R1_mux_to_R1), .q(R1wire));

  register_8bit R2(
     .clock(clock), .aclr(reset), .enable(R1R2Load),
     .data(R2_mux_to_R2), .q(R2wire));

  register_8bit ALUOut_reg(
     .clock(clock), .aclr(reset), .enable(ALUOutWrite),
     .data(ALUOut_in), .q(ALUOut));

  /* Muxes. */
  mux2to1_8bit PCsel_mux(
     .data0x(PC0wire + 8'b1), .data1x(ALUwire),
     .sel(PC_sel), .result(PC_in));

  mux2to1_2bit R1Sel_mux(
     .data0x(IR2_out[7:6]), .data1x(constant[1:0]),
     .sel(R1Sel), .result(R1_in));
     
  mux2to1_2bit RegWSel_mux(
     .data0x(IR4_out[7:6]), .data1x(constant[1:0]),
     .sel(RegWSel), .result(RegW_in));

  mux3to1_8bit ALU1_mux(
     .data0x(PC3wire), .data1x(R1wire), .data2x(ALUOut),
     .sel(ALU1), .result(ALU1wire));

  mux5to1_8bit ALU2_mux(
     .data0x(R2wire), .data1x(ALUOut), .data2x(SE4wire),
     .data3x(ZE5wire), .data4x(ZE3wire), .sel(ALU2), .result(ALU2wire));
  
  mux2to1_8bit ALUOut_mux(
     .data0x(ALUwire), .data1x(MEMwire), 
     .sel(RegIn), .result(ALUOut_in));
     
  //bypass data hazard 1
  mux2to1_8bit R1_mux(
     .data0x(RFout1wire), .data1x(ALUOut), 
     .sel(bypass_R1), .result(R1_mux_to_R1));
  
  //bypass data hazard 1
  mux2to1_8bit R2_mux(
     .data0x(RFout2wire), .data1x(ALUOut), 
     .sel(bypass_R2), .result(R2_mux_to_R2));
     
  

  sExtend SE4(.in(IR3_out[7:4]), .out(SE4wire));
  zExtend ZE3(.in(IR3_out[5:3]), .out(ZE3wire));
  zExtend ZE5(.in(IR3_out[7:3]), .out(ZE5wire));

  // define parameter for the data size to be extended
  defparam SE4.n = 4;
  defparam ZE3.n = 3;
  defparam ZE5.n = 5;

  always @(posedge clock, posedge reset) begin
    if (reset) begin
      N <= 0;
      Z <= 0;
    end
    else if (FlagWrite) begin
      N <= Nwire;
      Z <= Zwire;
    end
  end

  /* Create a dummy constant 1, used in the datapath. */
  assign constant = 1;

  /* Update the performance counter if the stop condition is not raised. */
  always @(posedge clock, posedge reset) begin
    if (reset) begin
      performance_count <= 0;
    end
    else if (!Stop) begin
      performance_count <= performance_count + 16'b1;
    end
  end

  /* Select the values to display on the hex displays. */
  // If switches are off, display the 4 registers.
  // If switch 1 is on, display the pipelined instruction registers.
  // If switch 2 is on, display the performance counter on HEX1 and HEX0.
  // If both switches are on, display the pipelined PC registers.
  mux4to1_8bit HEX10_mux(
     .data0x(reg3), .data1x(IR4_out), .data2x(performance_count[7:0]),
     .data3x(PC3wire), .sel(SW[2:1]), .result(HEX10_wire));

  mux4to1_8bit HEX32_mux(
     .data0x(reg2), .data1x(IR3_out), .data2x(performance_count[15:8]),
     .data3x(PC2wire), .sel(SW[2:1]), .result(HEX32_wire));

  mux4to1_8bit HEX54_mux(
     .data0x(reg1), .data1x(IR2_out), .data2x(ALU2wire),
     .data3x(PC1wire), .sel(SW[2:1]), .result(HEX54_wire));

  mux4to1_8bit HEX76_mux(
     .data0x(reg0), .data1x(IR1_out), .data2x(ALU1wire),
     .data3x(PC0wire), .sel(SW[2:1]), .result(HEX76_wire));

  /* Output */
  HEXs HEX_display(
     .in0(HEX76_wire), .in1(HEX54_wire),
     .in2(HEX32_wire), .in3(HEX10_wire),
     .out0(HEX0), .out1(HEX1), .out2(HEX2), .out3(HEX3),
     .out4(HEX4), .out5(HEX5), .out6(HEX6), .out7(HEX7));

  /* LED Indicators */
  assign LEDR[17] = PC0_write;
  assign LEDR[16] = Stop;
  assign LEDR[15] = MemRead;
  assign LEDR[14] = MemWrite;
  assign LEDR[13] = S1Load;
  assign LEDR[12] = R1Sel;
  assign LEDR[11] = MDRLoad;
  assign LEDR[10] = R1R2Load;
  assign LEDR[9] = ALU1[0];
  assign LEDR[8:6] = ALU2[2:0];
  assign LEDR[5:3] = ALUOp[2:0];
  assign LEDR[2] = wb_writing;
  assign LEDR[1] = RFWrite;
  assign LEDR[0] = RegIn;
  
  assign LEDG[7] = bypass_R1;
  assign LEDG[6] = bypass_R2;
  assign LEDG[5] = en_fetch;
  assign LEDG[4] = en_read;
  assign LEDG[3] = en_exec;
  assign LEDG[2] = en_wb;
  assign LEDG[1] = N;
  assign LEDG[0] = Z;

endmodule
