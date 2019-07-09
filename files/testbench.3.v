/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Tarea #8 - IE-0523 - modulo testbench
 *@author Moisés Campos Zepeda
 *@date   02/07/2019
 *@brief  Banco de pruebas de la arquitectura con su respectivo probador
*/

`timescale 	1ns	/ 100ps		// escala
// includes de archivos de verilog
`include "arqui.v"
//`include "arqui_Synth.v"
`include "probador.v"
`include "CMOS/cmos_cells.v"

module testbench; // Testbench
//parameter DATA_SIZE = 4;
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		active_out;		// From arqui_cond of arqui.v
	wire [1:0]	aeDF_i;			// From test0 of probador.v
	wire [1:0]	aeMF_i;			// From test0 of probador.v
	wire [3:0]	aeVC_i;			// From test0 of probador.v
	wire [1:0]	afDF_i;			// From test0 of probador.v
	wire [1:0]	afMF_i;			// From test0 of probador.v
	wire [3:0]	afVC_i;			// From test0 of probador.v
	wire [DATA_SIZE-1:0] data_in;		// From test0 of probador.v
	wire [OUTPUT_SIZE-1:0] data_out0;	// From arqui_cond of arqui.v
	wire [OUTPUT_SIZE-1:0] data_out1;	// From arqui_cond of arqui.v
	wire		error_out;		// From arqui_cond of arqui.v
	wire		idle_out;		// From arqui_cond of arqui.v
	wire		pop_d0;			// From test0 of probador.v
	wire		pop_d1;			// From test0 of probador.v
	wire		push_M;			// From test0 of probador.v
	// End of automatics
    /*AUTOREG*/
	
    // Instanciacion de modulos con los parametros definidos
    arqui arqui_cond(/*AUTOINST*/
		     // Outputs
		     .error_out		(error_out),
		     .active_out	(active_out),
		     .idle_out		(idle_out),
		     .data_out0		(data_out0[OUTPUT_SIZE-1:0]),
		     .data_out1		(data_out1[OUTPUT_SIZE-1:0]),
		     // Inputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .data_in		(data_in[DATA_SIZE-1:0]),
		     .push_M		(push_M),
		     .pop_d0		(pop_d0),
		     .pop_d1		(pop_d1),
		     .afMF_i		(afMF_i[1:0]),
		     .aeMF_i		(aeMF_i[1:0]),
		     .afVC_i		(afVC_i[3:0]),
		     .aeVC_i		(aeVC_i[3:0]),
		     .afDF_i		(afDF_i[1:0]),
		     .aeDF_i		(aeDF_i[1:0]));

//	arqui_Synth arqui_est(/*AUTOINST*/);	
    
    probador test0(/*AUTOINST*/
		   // Outputs
		   .data_in		(data_in[DATA_SIZE-1:0]),
		   .push_M		(push_M),
		   .pop_d0		(pop_d0),
		   .pop_d1		(pop_d1),
		   .afMF_i		(afMF_i[1:0]),
		   .aeMF_i		(aeMF_i[1:0]),
		   .afVC_i		(afVC_i[3:0]),
		   .aeVC_i		(aeVC_i[3:0]),
		   .afDF_i		(afDF_i[1:0]),
		   .aeDF_i		(aeDF_i[1:0]),
		   // Inputs
		   .error_out		(error_out),
		   .active_out		(active_out),
		   .idle_out		(idle_out),
		   .data_out0_c		(data_out0_c[OUTPUT_SIZE-1:0]),
		   .data_out0_e		(data_out0_e[OUTPUT_SIZE-1:0]),
		   .data_out1_c		(data_out1_c[OUTPUT_SIZE-1:0]),
		   .data_out1_e		(data_out1_e[OUTPUT_SIZE-1:0]));

endmodule
