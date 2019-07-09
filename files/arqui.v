/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Proyecto #2 - IE-0523 - modulo probador.v
*@author Moises Campos Zepeda, Esteban Valverde, Giancarlo Marin
*@date   02/07/2019
*@brief Modulo principal, que junta los modulos anteriores y agrega logica miscelanea.
*cantidad de ciclos que tarda la suma
*/

`timescale 1ns/1ps

//modulos anteriores
`include "../fifo/fifo.v"
`include "../fsm/fsm.v"
`include "../muxes/mux/mux.v"
`include "../muxes/demux/demux.v"

module arqui#(
    parameter MAIN_QUEUE_SIZE = 4,        //Cantiad de filas del main fifo
    parameter OUTPUT_SIZE = 6,
    parameter DATA_SIZE = 6             //cantidad de bits de entrada
)(
    input                               clk,
    input                               reset_L,
    input       [DATA_SIZE-1:0]   		data_in,            //datos para hacerle push 
    input 								push_M,
    input 								pop_d0,
    input 								pop_d1,
    input [1:0]							afMF_i,				// almost full Main FIFO
    input [1:0]							aeMF_i,				// almost empty Main FIFO
    input [3:0]							afVC_i,				// almost full VC FIFO
    input [3:0]							aeVC_i,				// almost empty VC FIFO
    input [1:0]							afDF_i,				// almost full D FIFO
    input [1:0]							aeDF_i,				// almost empty D FIFO
    output reg 							error_out,			
    output reg 							active_out,			
    output reg 							idle_out,			
    output reg  [OUTPUT_SIZE-1:0]       data_out0,
    output reg  [OUTPUT_SIZE-1:0]       data_out1
);

    fsm fsm0(/*AUTOINST*/
	     // Outputs
	     .error_out_cond		(error_out_cond[4:0]),
	     .active_out_cond		(active_out_cond),
	     .idle_out_cond		(idle_out_cond),
	     // Inputs
	     .clk			(clk),
	     .reset_L			(reset_L),
	     .init			(init),
	     .FIFO_errors		(FIFO_errors[4:0]),
	     .FIFO_empties		(FIFO_empties[4:0]),
	     .afMFs			(afMFs[2:0]),
	     .aeMFs			(aeMFs[2:0]),
	     .afVCs			(afVCs[2:0]),
	     .aeVCs			(aeVCs[2:0]),
	     .afDs			(afDs[2:0]),
	     .aeDs			(aeDs[2:0]));

    fifo# (.DATA_SIZE(4), .MAIN_QUEUE_SIZE(6))
    Main_FIFO (
        /*AUTOINST*/
	       // Outputs
	       .fifo_full_		(fifo_full_),
	       .fifo_empty_		(fifo_empty_),
	       .data_out_		(data_out_[DATA_SIZE-1:0]),
	       .fifo_error_		(fifo_error_),
	       .fifo_pause_		(fifo_pause_),
	       // Inputs
	       .clk			(clk),
	       .reset_L			(reset_L),
	       .read			(read),
	       .push_			(push_),
	       .data_in			(data_in[DATA_SIZE-1:0]),
	       .af			(af[DATA_SIZE-1:0]),
	       .ae			(ae[DATA_SIZE-1:0]));


    fifo #(.DATA_SIZE(16),.MAIN_QUEUE_SIZE(6))
        vc0 (
        /*AUTOINST*/
	     // Outputs
	     .fifo_full_		(fifo_full_),
	     .fifo_empty_		(fifo_empty_),
	     .data_out_			(data_out_[DATA_SIZE-1:0]),
	     .fifo_error_		(fifo_error_),
	     .fifo_pause_		(fifo_pause_),
	     // Inputs
	     .clk			(clk),
	     .reset_L			(reset_L),
	     .read			(read),
	     .push_			(push_),
	     .data_in			(data_in[DATA_SIZE-1:0]),
	     .af			(af[DATA_SIZE-1:0]),
	     .ae			(ae[DATA_SIZE-1:0]));


    fifo #(.DATA_SIZE(16), .MAIN_QUEUE_SIZE(6) )
        vc1 (/*AUTOINST*/
	     // Outputs
	     .fifo_full_		(fifo_full_),
	     .fifo_empty_		(fifo_empty_),
	     .data_out_			(data_out_[DATA_SIZE-1:0]),
	     .fifo_error_		(fifo_error_),
	     .fifo_pause_		(fifo_pause_),
	     // Inputs
	     .clk			(clk),
	     .reset_L			(reset_L),
	     .read			(read),
	     .push_			(push_),
	     .data_in			(data_in[DATA_SIZE-1:0]),
	     .af			(af[DATA_SIZE-1:0]),
	     .ae			(ae[DATA_SIZE-1:0]));


    fifo #(.DATA_SIZE(4), .MAIN_QUEUE_SIZE(6) )
        d0 (/*AUTOINST*/
	    // Outputs
	    .fifo_full_			(fifo_full_),
	    .fifo_empty_		(fifo_empty_),
	    .data_out_			(data_out_[DATA_SIZE-1:0]),
	    .fifo_error_		(fifo_error_),
	    .fifo_pause_		(fifo_pause_),
	    // Inputs
	    .clk			(clk),
	    .reset_L			(reset_L),
	    .read			(read),
	    .push_			(push_),
	    .data_in			(data_in[DATA_SIZE-1:0]),
	    .af				(af[DATA_SIZE-1:0]),
	    .ae				(ae[DATA_SIZE-1:0]));


    fifo #(.DATA_SIZE(4), .MAIN_QUEUE_SIZE(6) )
        d1(/*AUTOINST*/
	   // Outputs
	   .fifo_full_			(fifo_full_),
	   .fifo_empty_			(fifo_empty_),
	   .data_out_			(data_out_[DATA_SIZE-1:0]),
	   .fifo_error_			(fifo_error_),
	   .fifo_pause_			(fifo_pause_),
	   // Inputs
	   .clk				(clk),
	   .reset_L			(reset_L),
	   .read			(read),
	   .push_			(push_),
	   .data_in			(data_in[DATA_SIZE-1:0]),
	   .af				(af[DATA_SIZE-1:0]),
	   .ae				(ae[DATA_SIZE-1:0]));



endmodule
