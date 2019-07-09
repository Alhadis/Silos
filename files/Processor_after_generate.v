//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module FlagPIO_s1_arbitrator (
                               // inputs:
                                FlagPIO_s1_readdata,
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                reset_n,

                               // outputs:
                                FlagPIO_s1_address,
                                FlagPIO_s1_chipselect,
                                FlagPIO_s1_readdata_from_sa,
                                FlagPIO_s1_reset_n,
                                FlagPIO_s1_write_n,
                                FlagPIO_s1_writedata,
                                cpu_0_data_master_granted_FlagPIO_s1,
                                cpu_0_data_master_qualified_request_FlagPIO_s1,
                                cpu_0_data_master_read_data_valid_FlagPIO_s1,
                                cpu_0_data_master_requests_FlagPIO_s1,
                                d1_FlagPIO_s1_end_xfer
                             )
;

  output  [  1: 0] FlagPIO_s1_address;
  output           FlagPIO_s1_chipselect;
  output           FlagPIO_s1_readdata_from_sa;
  output           FlagPIO_s1_reset_n;
  output           FlagPIO_s1_write_n;
  output           FlagPIO_s1_writedata;
  output           cpu_0_data_master_granted_FlagPIO_s1;
  output           cpu_0_data_master_qualified_request_FlagPIO_s1;
  output           cpu_0_data_master_read_data_valid_FlagPIO_s1;
  output           cpu_0_data_master_requests_FlagPIO_s1;
  output           d1_FlagPIO_s1_end_xfer;
  input            FlagPIO_s1_readdata;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] FlagPIO_s1_address;
  wire             FlagPIO_s1_allgrants;
  wire             FlagPIO_s1_allow_new_arb_cycle;
  wire             FlagPIO_s1_any_bursting_master_saved_grant;
  wire             FlagPIO_s1_any_continuerequest;
  wire             FlagPIO_s1_arb_counter_enable;
  reg              FlagPIO_s1_arb_share_counter;
  wire             FlagPIO_s1_arb_share_counter_next_value;
  wire             FlagPIO_s1_arb_share_set_values;
  wire             FlagPIO_s1_beginbursttransfer_internal;
  wire             FlagPIO_s1_begins_xfer;
  wire             FlagPIO_s1_chipselect;
  wire             FlagPIO_s1_end_xfer;
  wire             FlagPIO_s1_firsttransfer;
  wire             FlagPIO_s1_grant_vector;
  wire             FlagPIO_s1_in_a_read_cycle;
  wire             FlagPIO_s1_in_a_write_cycle;
  wire             FlagPIO_s1_master_qreq_vector;
  wire             FlagPIO_s1_non_bursting_master_requests;
  wire             FlagPIO_s1_readdata_from_sa;
  reg              FlagPIO_s1_reg_firsttransfer;
  wire             FlagPIO_s1_reset_n;
  reg              FlagPIO_s1_slavearbiterlockenable;
  wire             FlagPIO_s1_slavearbiterlockenable2;
  wire             FlagPIO_s1_unreg_firsttransfer;
  wire             FlagPIO_s1_waits_for_read;
  wire             FlagPIO_s1_waits_for_write;
  wire             FlagPIO_s1_write_n;
  wire             FlagPIO_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_FlagPIO_s1;
  wire             cpu_0_data_master_qualified_request_FlagPIO_s1;
  wire             cpu_0_data_master_read_data_valid_FlagPIO_s1;
  wire             cpu_0_data_master_requests_FlagPIO_s1;
  wire             cpu_0_data_master_saved_grant_FlagPIO_s1;
  reg              d1_FlagPIO_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_FlagPIO_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 14: 0] shifted_address_to_FlagPIO_s1_from_cpu_0_data_master;
  wire             wait_for_FlagPIO_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~FlagPIO_s1_end_xfer;
    end


  assign FlagPIO_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_FlagPIO_s1));
  //assign FlagPIO_s1_readdata_from_sa = FlagPIO_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign FlagPIO_s1_readdata_from_sa = FlagPIO_s1_readdata;

  assign cpu_0_data_master_requests_FlagPIO_s1 = ({cpu_0_data_master_address_to_slave[14 : 4] , 4'b0} == 15'h5810) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //FlagPIO_s1_arb_share_counter set values, which is an e_mux
  assign FlagPIO_s1_arb_share_set_values = 1;

  //FlagPIO_s1_non_bursting_master_requests mux, which is an e_mux
  assign FlagPIO_s1_non_bursting_master_requests = cpu_0_data_master_requests_FlagPIO_s1;

  //FlagPIO_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign FlagPIO_s1_any_bursting_master_saved_grant = 0;

  //FlagPIO_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign FlagPIO_s1_arb_share_counter_next_value = FlagPIO_s1_firsttransfer ? (FlagPIO_s1_arb_share_set_values - 1) : |FlagPIO_s1_arb_share_counter ? (FlagPIO_s1_arb_share_counter - 1) : 0;

  //FlagPIO_s1_allgrants all slave grants, which is an e_mux
  assign FlagPIO_s1_allgrants = |FlagPIO_s1_grant_vector;

  //FlagPIO_s1_end_xfer assignment, which is an e_assign
  assign FlagPIO_s1_end_xfer = ~(FlagPIO_s1_waits_for_read | FlagPIO_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_FlagPIO_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_FlagPIO_s1 = FlagPIO_s1_end_xfer & (~FlagPIO_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //FlagPIO_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign FlagPIO_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_FlagPIO_s1 & FlagPIO_s1_allgrants) | (end_xfer_arb_share_counter_term_FlagPIO_s1 & ~FlagPIO_s1_non_bursting_master_requests);

  //FlagPIO_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          FlagPIO_s1_arb_share_counter <= 0;
      else if (FlagPIO_s1_arb_counter_enable)
          FlagPIO_s1_arb_share_counter <= FlagPIO_s1_arb_share_counter_next_value;
    end


  //FlagPIO_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          FlagPIO_s1_slavearbiterlockenable <= 0;
      else if ((|FlagPIO_s1_master_qreq_vector & end_xfer_arb_share_counter_term_FlagPIO_s1) | (end_xfer_arb_share_counter_term_FlagPIO_s1 & ~FlagPIO_s1_non_bursting_master_requests))
          FlagPIO_s1_slavearbiterlockenable <= |FlagPIO_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master FlagPIO/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = FlagPIO_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //FlagPIO_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign FlagPIO_s1_slavearbiterlockenable2 = |FlagPIO_s1_arb_share_counter_next_value;

  //cpu_0/data_master FlagPIO/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = FlagPIO_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //FlagPIO_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign FlagPIO_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_FlagPIO_s1 = cpu_0_data_master_requests_FlagPIO_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //FlagPIO_s1_writedata mux, which is an e_mux
  assign FlagPIO_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_FlagPIO_s1 = cpu_0_data_master_qualified_request_FlagPIO_s1;

  //cpu_0/data_master saved-grant FlagPIO/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_FlagPIO_s1 = cpu_0_data_master_requests_FlagPIO_s1;

  //allow new arb cycle for FlagPIO/s1, which is an e_assign
  assign FlagPIO_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign FlagPIO_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign FlagPIO_s1_master_qreq_vector = 1;

  //FlagPIO_s1_reset_n assignment, which is an e_assign
  assign FlagPIO_s1_reset_n = reset_n;

  assign FlagPIO_s1_chipselect = cpu_0_data_master_granted_FlagPIO_s1;
  //FlagPIO_s1_firsttransfer first transaction, which is an e_assign
  assign FlagPIO_s1_firsttransfer = FlagPIO_s1_begins_xfer ? FlagPIO_s1_unreg_firsttransfer : FlagPIO_s1_reg_firsttransfer;

  //FlagPIO_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign FlagPIO_s1_unreg_firsttransfer = ~(FlagPIO_s1_slavearbiterlockenable & FlagPIO_s1_any_continuerequest);

  //FlagPIO_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          FlagPIO_s1_reg_firsttransfer <= 1'b1;
      else if (FlagPIO_s1_begins_xfer)
          FlagPIO_s1_reg_firsttransfer <= FlagPIO_s1_unreg_firsttransfer;
    end


  //FlagPIO_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign FlagPIO_s1_beginbursttransfer_internal = FlagPIO_s1_begins_xfer;

  //~FlagPIO_s1_write_n assignment, which is an e_mux
  assign FlagPIO_s1_write_n = ~(cpu_0_data_master_granted_FlagPIO_s1 & cpu_0_data_master_write);

  assign shifted_address_to_FlagPIO_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //FlagPIO_s1_address mux, which is an e_mux
  assign FlagPIO_s1_address = shifted_address_to_FlagPIO_s1_from_cpu_0_data_master >> 2;

  //d1_FlagPIO_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_FlagPIO_s1_end_xfer <= 1;
      else 
        d1_FlagPIO_s1_end_xfer <= FlagPIO_s1_end_xfer;
    end


  //FlagPIO_s1_waits_for_read in a cycle, which is an e_mux
  assign FlagPIO_s1_waits_for_read = FlagPIO_s1_in_a_read_cycle & FlagPIO_s1_begins_xfer;

  //FlagPIO_s1_in_a_read_cycle assignment, which is an e_assign
  assign FlagPIO_s1_in_a_read_cycle = cpu_0_data_master_granted_FlagPIO_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = FlagPIO_s1_in_a_read_cycle;

  //FlagPIO_s1_waits_for_write in a cycle, which is an e_mux
  assign FlagPIO_s1_waits_for_write = FlagPIO_s1_in_a_write_cycle & 0;

  //FlagPIO_s1_in_a_write_cycle assignment, which is an e_assign
  assign FlagPIO_s1_in_a_write_cycle = cpu_0_data_master_granted_FlagPIO_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = FlagPIO_s1_in_a_write_cycle;

  assign wait_for_FlagPIO_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //FlagPIO/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module LEDPIO_s1_arbitrator (
                              // inputs:
                               LEDPIO_s1_readdata,
                               clk,
                               cpu_0_data_master_address_to_slave,
                               cpu_0_data_master_byteenable,
                               cpu_0_data_master_read,
                               cpu_0_data_master_waitrequest,
                               cpu_0_data_master_write,
                               cpu_0_data_master_writedata,
                               reset_n,

                              // outputs:
                               LEDPIO_s1_address,
                               LEDPIO_s1_chipselect,
                               LEDPIO_s1_readdata_from_sa,
                               LEDPIO_s1_reset_n,
                               LEDPIO_s1_write_n,
                               LEDPIO_s1_writedata,
                               cpu_0_data_master_granted_LEDPIO_s1,
                               cpu_0_data_master_qualified_request_LEDPIO_s1,
                               cpu_0_data_master_read_data_valid_LEDPIO_s1,
                               cpu_0_data_master_requests_LEDPIO_s1,
                               d1_LEDPIO_s1_end_xfer
                            )
;

  output  [  1: 0] LEDPIO_s1_address;
  output           LEDPIO_s1_chipselect;
  output  [  7: 0] LEDPIO_s1_readdata_from_sa;
  output           LEDPIO_s1_reset_n;
  output           LEDPIO_s1_write_n;
  output  [  7: 0] LEDPIO_s1_writedata;
  output           cpu_0_data_master_granted_LEDPIO_s1;
  output           cpu_0_data_master_qualified_request_LEDPIO_s1;
  output           cpu_0_data_master_read_data_valid_LEDPIO_s1;
  output           cpu_0_data_master_requests_LEDPIO_s1;
  output           d1_LEDPIO_s1_end_xfer;
  input   [  7: 0] LEDPIO_s1_readdata;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] LEDPIO_s1_address;
  wire             LEDPIO_s1_allgrants;
  wire             LEDPIO_s1_allow_new_arb_cycle;
  wire             LEDPIO_s1_any_bursting_master_saved_grant;
  wire             LEDPIO_s1_any_continuerequest;
  wire             LEDPIO_s1_arb_counter_enable;
  reg              LEDPIO_s1_arb_share_counter;
  wire             LEDPIO_s1_arb_share_counter_next_value;
  wire             LEDPIO_s1_arb_share_set_values;
  wire             LEDPIO_s1_beginbursttransfer_internal;
  wire             LEDPIO_s1_begins_xfer;
  wire             LEDPIO_s1_chipselect;
  wire             LEDPIO_s1_end_xfer;
  wire             LEDPIO_s1_firsttransfer;
  wire             LEDPIO_s1_grant_vector;
  wire             LEDPIO_s1_in_a_read_cycle;
  wire             LEDPIO_s1_in_a_write_cycle;
  wire             LEDPIO_s1_master_qreq_vector;
  wire             LEDPIO_s1_non_bursting_master_requests;
  wire             LEDPIO_s1_pretend_byte_enable;
  wire    [  7: 0] LEDPIO_s1_readdata_from_sa;
  reg              LEDPIO_s1_reg_firsttransfer;
  wire             LEDPIO_s1_reset_n;
  reg              LEDPIO_s1_slavearbiterlockenable;
  wire             LEDPIO_s1_slavearbiterlockenable2;
  wire             LEDPIO_s1_unreg_firsttransfer;
  wire             LEDPIO_s1_waits_for_read;
  wire             LEDPIO_s1_waits_for_write;
  wire             LEDPIO_s1_write_n;
  wire    [  7: 0] LEDPIO_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_LEDPIO_s1;
  wire             cpu_0_data_master_qualified_request_LEDPIO_s1;
  wire             cpu_0_data_master_read_data_valid_LEDPIO_s1;
  wire             cpu_0_data_master_requests_LEDPIO_s1;
  wire             cpu_0_data_master_saved_grant_LEDPIO_s1;
  reg              d1_LEDPIO_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_LEDPIO_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 14: 0] shifted_address_to_LEDPIO_s1_from_cpu_0_data_master;
  wire             wait_for_LEDPIO_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~LEDPIO_s1_end_xfer;
    end


  assign LEDPIO_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_LEDPIO_s1));
  //assign LEDPIO_s1_readdata_from_sa = LEDPIO_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign LEDPIO_s1_readdata_from_sa = LEDPIO_s1_readdata;

  assign cpu_0_data_master_requests_LEDPIO_s1 = ({cpu_0_data_master_address_to_slave[14 : 4] , 4'b0} == 15'h5800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //LEDPIO_s1_arb_share_counter set values, which is an e_mux
  assign LEDPIO_s1_arb_share_set_values = 1;

  //LEDPIO_s1_non_bursting_master_requests mux, which is an e_mux
  assign LEDPIO_s1_non_bursting_master_requests = cpu_0_data_master_requests_LEDPIO_s1;

  //LEDPIO_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign LEDPIO_s1_any_bursting_master_saved_grant = 0;

  //LEDPIO_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign LEDPIO_s1_arb_share_counter_next_value = LEDPIO_s1_firsttransfer ? (LEDPIO_s1_arb_share_set_values - 1) : |LEDPIO_s1_arb_share_counter ? (LEDPIO_s1_arb_share_counter - 1) : 0;

  //LEDPIO_s1_allgrants all slave grants, which is an e_mux
  assign LEDPIO_s1_allgrants = |LEDPIO_s1_grant_vector;

  //LEDPIO_s1_end_xfer assignment, which is an e_assign
  assign LEDPIO_s1_end_xfer = ~(LEDPIO_s1_waits_for_read | LEDPIO_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_LEDPIO_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_LEDPIO_s1 = LEDPIO_s1_end_xfer & (~LEDPIO_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //LEDPIO_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign LEDPIO_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_LEDPIO_s1 & LEDPIO_s1_allgrants) | (end_xfer_arb_share_counter_term_LEDPIO_s1 & ~LEDPIO_s1_non_bursting_master_requests);

  //LEDPIO_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LEDPIO_s1_arb_share_counter <= 0;
      else if (LEDPIO_s1_arb_counter_enable)
          LEDPIO_s1_arb_share_counter <= LEDPIO_s1_arb_share_counter_next_value;
    end


  //LEDPIO_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LEDPIO_s1_slavearbiterlockenable <= 0;
      else if ((|LEDPIO_s1_master_qreq_vector & end_xfer_arb_share_counter_term_LEDPIO_s1) | (end_xfer_arb_share_counter_term_LEDPIO_s1 & ~LEDPIO_s1_non_bursting_master_requests))
          LEDPIO_s1_slavearbiterlockenable <= |LEDPIO_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master LEDPIO/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = LEDPIO_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //LEDPIO_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign LEDPIO_s1_slavearbiterlockenable2 = |LEDPIO_s1_arb_share_counter_next_value;

  //cpu_0/data_master LEDPIO/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = LEDPIO_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //LEDPIO_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign LEDPIO_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_LEDPIO_s1 = cpu_0_data_master_requests_LEDPIO_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //LEDPIO_s1_writedata mux, which is an e_mux
  assign LEDPIO_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_LEDPIO_s1 = cpu_0_data_master_qualified_request_LEDPIO_s1;

  //cpu_0/data_master saved-grant LEDPIO/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_LEDPIO_s1 = cpu_0_data_master_requests_LEDPIO_s1;

  //allow new arb cycle for LEDPIO/s1, which is an e_assign
  assign LEDPIO_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign LEDPIO_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign LEDPIO_s1_master_qreq_vector = 1;

  //LEDPIO_s1_reset_n assignment, which is an e_assign
  assign LEDPIO_s1_reset_n = reset_n;

  assign LEDPIO_s1_chipselect = cpu_0_data_master_granted_LEDPIO_s1;
  //LEDPIO_s1_firsttransfer first transaction, which is an e_assign
  assign LEDPIO_s1_firsttransfer = LEDPIO_s1_begins_xfer ? LEDPIO_s1_unreg_firsttransfer : LEDPIO_s1_reg_firsttransfer;

  //LEDPIO_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign LEDPIO_s1_unreg_firsttransfer = ~(LEDPIO_s1_slavearbiterlockenable & LEDPIO_s1_any_continuerequest);

  //LEDPIO_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LEDPIO_s1_reg_firsttransfer <= 1'b1;
      else if (LEDPIO_s1_begins_xfer)
          LEDPIO_s1_reg_firsttransfer <= LEDPIO_s1_unreg_firsttransfer;
    end


  //LEDPIO_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign LEDPIO_s1_beginbursttransfer_internal = LEDPIO_s1_begins_xfer;

  //~LEDPIO_s1_write_n assignment, which is an e_mux
  assign LEDPIO_s1_write_n = ~(((cpu_0_data_master_granted_LEDPIO_s1 & cpu_0_data_master_write)) & LEDPIO_s1_pretend_byte_enable);

  assign shifted_address_to_LEDPIO_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //LEDPIO_s1_address mux, which is an e_mux
  assign LEDPIO_s1_address = shifted_address_to_LEDPIO_s1_from_cpu_0_data_master >> 2;

  //d1_LEDPIO_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_LEDPIO_s1_end_xfer <= 1;
      else 
        d1_LEDPIO_s1_end_xfer <= LEDPIO_s1_end_xfer;
    end


  //LEDPIO_s1_waits_for_read in a cycle, which is an e_mux
  assign LEDPIO_s1_waits_for_read = LEDPIO_s1_in_a_read_cycle & LEDPIO_s1_begins_xfer;

  //LEDPIO_s1_in_a_read_cycle assignment, which is an e_assign
  assign LEDPIO_s1_in_a_read_cycle = cpu_0_data_master_granted_LEDPIO_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = LEDPIO_s1_in_a_read_cycle;

  //LEDPIO_s1_waits_for_write in a cycle, which is an e_mux
  assign LEDPIO_s1_waits_for_write = LEDPIO_s1_in_a_write_cycle & 0;

  //LEDPIO_s1_in_a_write_cycle assignment, which is an e_assign
  assign LEDPIO_s1_in_a_write_cycle = cpu_0_data_master_granted_LEDPIO_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = LEDPIO_s1_in_a_write_cycle;

  assign wait_for_LEDPIO_s1_counter = 0;
  //LEDPIO_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign LEDPIO_s1_pretend_byte_enable = (cpu_0_data_master_granted_LEDPIO_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //LEDPIO/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Onchip_RAM_s1_arbitrator (
                                  // inputs:
                                   Onchip_RAM_s1_readdata,
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_byteenable,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_waitrequest,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   cpu_0_instruction_master_address_to_slave,
                                   cpu_0_instruction_master_read,
                                   reset_n,

                                  // outputs:
                                   Onchip_RAM_s1_address,
                                   Onchip_RAM_s1_byteenable,
                                   Onchip_RAM_s1_chipselect,
                                   Onchip_RAM_s1_clken,
                                   Onchip_RAM_s1_readdata_from_sa,
                                   Onchip_RAM_s1_reset,
                                   Onchip_RAM_s1_write,
                                   Onchip_RAM_s1_writedata,
                                   cpu_0_data_master_granted_Onchip_RAM_s1,
                                   cpu_0_data_master_qualified_request_Onchip_RAM_s1,
                                   cpu_0_data_master_read_data_valid_Onchip_RAM_s1,
                                   cpu_0_data_master_requests_Onchip_RAM_s1,
                                   cpu_0_instruction_master_granted_Onchip_RAM_s1,
                                   cpu_0_instruction_master_qualified_request_Onchip_RAM_s1,
                                   cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1,
                                   cpu_0_instruction_master_requests_Onchip_RAM_s1,
                                   d1_Onchip_RAM_s1_end_xfer,
                                   registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1
                                )
;

  output  [  7: 0] Onchip_RAM_s1_address;
  output  [  3: 0] Onchip_RAM_s1_byteenable;
  output           Onchip_RAM_s1_chipselect;
  output           Onchip_RAM_s1_clken;
  output  [ 31: 0] Onchip_RAM_s1_readdata_from_sa;
  output           Onchip_RAM_s1_reset;
  output           Onchip_RAM_s1_write;
  output  [ 31: 0] Onchip_RAM_s1_writedata;
  output           cpu_0_data_master_granted_Onchip_RAM_s1;
  output           cpu_0_data_master_qualified_request_Onchip_RAM_s1;
  output           cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  output           cpu_0_data_master_requests_Onchip_RAM_s1;
  output           cpu_0_instruction_master_granted_Onchip_RAM_s1;
  output           cpu_0_instruction_master_qualified_request_Onchip_RAM_s1;
  output           cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1;
  output           cpu_0_instruction_master_requests_Onchip_RAM_s1;
  output           d1_Onchip_RAM_s1_end_xfer;
  output           registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  input   [ 31: 0] Onchip_RAM_s1_readdata;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 14: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [  7: 0] Onchip_RAM_s1_address;
  wire             Onchip_RAM_s1_allgrants;
  wire             Onchip_RAM_s1_allow_new_arb_cycle;
  wire             Onchip_RAM_s1_any_bursting_master_saved_grant;
  wire             Onchip_RAM_s1_any_continuerequest;
  reg     [  1: 0] Onchip_RAM_s1_arb_addend;
  wire             Onchip_RAM_s1_arb_counter_enable;
  reg              Onchip_RAM_s1_arb_share_counter;
  wire             Onchip_RAM_s1_arb_share_counter_next_value;
  wire             Onchip_RAM_s1_arb_share_set_values;
  wire    [  1: 0] Onchip_RAM_s1_arb_winner;
  wire             Onchip_RAM_s1_arbitration_holdoff_internal;
  wire             Onchip_RAM_s1_beginbursttransfer_internal;
  wire             Onchip_RAM_s1_begins_xfer;
  wire    [  3: 0] Onchip_RAM_s1_byteenable;
  wire             Onchip_RAM_s1_chipselect;
  wire    [  3: 0] Onchip_RAM_s1_chosen_master_double_vector;
  wire    [  1: 0] Onchip_RAM_s1_chosen_master_rot_left;
  wire             Onchip_RAM_s1_clken;
  wire             Onchip_RAM_s1_end_xfer;
  wire             Onchip_RAM_s1_firsttransfer;
  wire    [  1: 0] Onchip_RAM_s1_grant_vector;
  wire             Onchip_RAM_s1_in_a_read_cycle;
  wire             Onchip_RAM_s1_in_a_write_cycle;
  wire    [  1: 0] Onchip_RAM_s1_master_qreq_vector;
  wire             Onchip_RAM_s1_non_bursting_master_requests;
  wire    [ 31: 0] Onchip_RAM_s1_readdata_from_sa;
  reg              Onchip_RAM_s1_reg_firsttransfer;
  wire             Onchip_RAM_s1_reset;
  reg     [  1: 0] Onchip_RAM_s1_saved_chosen_master_vector;
  reg              Onchip_RAM_s1_slavearbiterlockenable;
  wire             Onchip_RAM_s1_slavearbiterlockenable2;
  wire             Onchip_RAM_s1_unreg_firsttransfer;
  wire             Onchip_RAM_s1_waits_for_read;
  wire             Onchip_RAM_s1_waits_for_write;
  wire             Onchip_RAM_s1_write;
  wire    [ 31: 0] Onchip_RAM_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_Onchip_RAM_s1;
  wire             cpu_0_data_master_qualified_request_Onchip_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  reg              cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_Onchip_RAM_s1;
  wire             cpu_0_data_master_saved_grant_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1;
  reg              cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_saved_grant_Onchip_RAM_s1;
  reg              d1_Onchip_RAM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Onchip_RAM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_Onchip_RAM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_Onchip_RAM_s1;
  wire             p1_cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  wire    [ 14: 0] shifted_address_to_Onchip_RAM_s1_from_cpu_0_data_master;
  wire    [ 14: 0] shifted_address_to_Onchip_RAM_s1_from_cpu_0_instruction_master;
  wire             wait_for_Onchip_RAM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Onchip_RAM_s1_end_xfer;
    end


  assign Onchip_RAM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_Onchip_RAM_s1 | cpu_0_instruction_master_qualified_request_Onchip_RAM_s1));
  //assign Onchip_RAM_s1_readdata_from_sa = Onchip_RAM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Onchip_RAM_s1_readdata_from_sa = Onchip_RAM_s1_readdata;

  assign cpu_0_data_master_requests_Onchip_RAM_s1 = ({cpu_0_data_master_address_to_slave[14 : 10] , 10'b0} == 15'h5400) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1 = cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register_in;

  //Onchip_RAM_s1_arb_share_counter set values, which is an e_mux
  assign Onchip_RAM_s1_arb_share_set_values = 1;

  //Onchip_RAM_s1_non_bursting_master_requests mux, which is an e_mux
  assign Onchip_RAM_s1_non_bursting_master_requests = cpu_0_data_master_requests_Onchip_RAM_s1 |
    cpu_0_instruction_master_requests_Onchip_RAM_s1 |
    cpu_0_data_master_requests_Onchip_RAM_s1 |
    cpu_0_instruction_master_requests_Onchip_RAM_s1;

  //Onchip_RAM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign Onchip_RAM_s1_any_bursting_master_saved_grant = 0;

  //Onchip_RAM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign Onchip_RAM_s1_arb_share_counter_next_value = Onchip_RAM_s1_firsttransfer ? (Onchip_RAM_s1_arb_share_set_values - 1) : |Onchip_RAM_s1_arb_share_counter ? (Onchip_RAM_s1_arb_share_counter - 1) : 0;

  //Onchip_RAM_s1_allgrants all slave grants, which is an e_mux
  assign Onchip_RAM_s1_allgrants = (|Onchip_RAM_s1_grant_vector) |
    (|Onchip_RAM_s1_grant_vector) |
    (|Onchip_RAM_s1_grant_vector) |
    (|Onchip_RAM_s1_grant_vector);

  //Onchip_RAM_s1_end_xfer assignment, which is an e_assign
  assign Onchip_RAM_s1_end_xfer = ~(Onchip_RAM_s1_waits_for_read | Onchip_RAM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_Onchip_RAM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Onchip_RAM_s1 = Onchip_RAM_s1_end_xfer & (~Onchip_RAM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Onchip_RAM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign Onchip_RAM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_Onchip_RAM_s1 & Onchip_RAM_s1_allgrants) | (end_xfer_arb_share_counter_term_Onchip_RAM_s1 & ~Onchip_RAM_s1_non_bursting_master_requests);

  //Onchip_RAM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_RAM_s1_arb_share_counter <= 0;
      else if (Onchip_RAM_s1_arb_counter_enable)
          Onchip_RAM_s1_arb_share_counter <= Onchip_RAM_s1_arb_share_counter_next_value;
    end


  //Onchip_RAM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_RAM_s1_slavearbiterlockenable <= 0;
      else if ((|Onchip_RAM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_Onchip_RAM_s1) | (end_xfer_arb_share_counter_term_Onchip_RAM_s1 & ~Onchip_RAM_s1_non_bursting_master_requests))
          Onchip_RAM_s1_slavearbiterlockenable <= |Onchip_RAM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master Onchip_RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = Onchip_RAM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //Onchip_RAM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Onchip_RAM_s1_slavearbiterlockenable2 = |Onchip_RAM_s1_arb_share_counter_next_value;

  //cpu_0/data_master Onchip_RAM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = Onchip_RAM_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master Onchip_RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = Onchip_RAM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master Onchip_RAM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = Onchip_RAM_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted Onchip_RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_Onchip_RAM_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_Onchip_RAM_s1 <= cpu_0_instruction_master_saved_grant_Onchip_RAM_s1 ? 1 : (Onchip_RAM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_Onchip_RAM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_Onchip_RAM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_Onchip_RAM_s1 & cpu_0_instruction_master_requests_Onchip_RAM_s1;

  //Onchip_RAM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign Onchip_RAM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_Onchip_RAM_s1 = cpu_0_data_master_requests_Onchip_RAM_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register_in = cpu_0_data_master_granted_Onchip_RAM_s1 & cpu_0_data_master_read & ~Onchip_RAM_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register = {cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register, cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_Onchip_RAM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_Onchip_RAM_s1 = cpu_0_data_master_read_data_valid_Onchip_RAM_s1_shift_register;

  //Onchip_RAM_s1_writedata mux, which is an e_mux
  assign Onchip_RAM_s1_writedata = cpu_0_data_master_writedata;

  //mux Onchip_RAM_s1_clken, which is an e_mux
  assign Onchip_RAM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_Onchip_RAM_s1 = (({cpu_0_instruction_master_address_to_slave[14 : 10] , 10'b0} == 15'h5400) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted Onchip_RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_Onchip_RAM_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_Onchip_RAM_s1 <= cpu_0_data_master_saved_grant_Onchip_RAM_s1 ? 1 : (Onchip_RAM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_Onchip_RAM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_Onchip_RAM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_Onchip_RAM_s1 & cpu_0_data_master_requests_Onchip_RAM_s1;

  assign cpu_0_instruction_master_qualified_request_Onchip_RAM_s1 = cpu_0_instruction_master_requests_Onchip_RAM_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register_in = cpu_0_instruction_master_granted_Onchip_RAM_s1 & cpu_0_instruction_master_read & ~Onchip_RAM_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register, cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1 = cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1_shift_register;

  //allow new arb cycle for Onchip_RAM/s1, which is an e_assign
  assign Onchip_RAM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for Onchip_RAM/s1, which is an e_assign
  assign Onchip_RAM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_Onchip_RAM_s1;

  //cpu_0/instruction_master grant Onchip_RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_Onchip_RAM_s1 = Onchip_RAM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant Onchip_RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_Onchip_RAM_s1 = Onchip_RAM_s1_arb_winner[0] && cpu_0_instruction_master_requests_Onchip_RAM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for Onchip_RAM/s1, which is an e_assign
  assign Onchip_RAM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_Onchip_RAM_s1;

  //cpu_0/data_master grant Onchip_RAM/s1, which is an e_assign
  assign cpu_0_data_master_granted_Onchip_RAM_s1 = Onchip_RAM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant Onchip_RAM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_Onchip_RAM_s1 = Onchip_RAM_s1_arb_winner[1] && cpu_0_data_master_requests_Onchip_RAM_s1;

  //Onchip_RAM/s1 chosen-master double-vector, which is an e_assign
  assign Onchip_RAM_s1_chosen_master_double_vector = {Onchip_RAM_s1_master_qreq_vector, Onchip_RAM_s1_master_qreq_vector} & ({~Onchip_RAM_s1_master_qreq_vector, ~Onchip_RAM_s1_master_qreq_vector} + Onchip_RAM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign Onchip_RAM_s1_arb_winner = (Onchip_RAM_s1_allow_new_arb_cycle & | Onchip_RAM_s1_grant_vector) ? Onchip_RAM_s1_grant_vector : Onchip_RAM_s1_saved_chosen_master_vector;

  //saved Onchip_RAM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_RAM_s1_saved_chosen_master_vector <= 0;
      else if (Onchip_RAM_s1_allow_new_arb_cycle)
          Onchip_RAM_s1_saved_chosen_master_vector <= |Onchip_RAM_s1_grant_vector ? Onchip_RAM_s1_grant_vector : Onchip_RAM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign Onchip_RAM_s1_grant_vector = {(Onchip_RAM_s1_chosen_master_double_vector[1] | Onchip_RAM_s1_chosen_master_double_vector[3]),
    (Onchip_RAM_s1_chosen_master_double_vector[0] | Onchip_RAM_s1_chosen_master_double_vector[2])};

  //Onchip_RAM/s1 chosen master rotated left, which is an e_assign
  assign Onchip_RAM_s1_chosen_master_rot_left = (Onchip_RAM_s1_arb_winner << 1) ? (Onchip_RAM_s1_arb_winner << 1) : 1;

  //Onchip_RAM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_RAM_s1_arb_addend <= 1;
      else if (|Onchip_RAM_s1_grant_vector)
          Onchip_RAM_s1_arb_addend <= Onchip_RAM_s1_end_xfer? Onchip_RAM_s1_chosen_master_rot_left : Onchip_RAM_s1_grant_vector;
    end


  //~Onchip_RAM_s1_reset assignment, which is an e_assign
  assign Onchip_RAM_s1_reset = ~reset_n;

  assign Onchip_RAM_s1_chipselect = cpu_0_data_master_granted_Onchip_RAM_s1 | cpu_0_instruction_master_granted_Onchip_RAM_s1;
  //Onchip_RAM_s1_firsttransfer first transaction, which is an e_assign
  assign Onchip_RAM_s1_firsttransfer = Onchip_RAM_s1_begins_xfer ? Onchip_RAM_s1_unreg_firsttransfer : Onchip_RAM_s1_reg_firsttransfer;

  //Onchip_RAM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign Onchip_RAM_s1_unreg_firsttransfer = ~(Onchip_RAM_s1_slavearbiterlockenable & Onchip_RAM_s1_any_continuerequest);

  //Onchip_RAM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_RAM_s1_reg_firsttransfer <= 1'b1;
      else if (Onchip_RAM_s1_begins_xfer)
          Onchip_RAM_s1_reg_firsttransfer <= Onchip_RAM_s1_unreg_firsttransfer;
    end


  //Onchip_RAM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Onchip_RAM_s1_beginbursttransfer_internal = Onchip_RAM_s1_begins_xfer;

  //Onchip_RAM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign Onchip_RAM_s1_arbitration_holdoff_internal = Onchip_RAM_s1_begins_xfer & Onchip_RAM_s1_firsttransfer;

  //Onchip_RAM_s1_write assignment, which is an e_mux
  assign Onchip_RAM_s1_write = cpu_0_data_master_granted_Onchip_RAM_s1 & cpu_0_data_master_write;

  assign shifted_address_to_Onchip_RAM_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //Onchip_RAM_s1_address mux, which is an e_mux
  assign Onchip_RAM_s1_address = (cpu_0_data_master_granted_Onchip_RAM_s1)? (shifted_address_to_Onchip_RAM_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_Onchip_RAM_s1_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_Onchip_RAM_s1_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_Onchip_RAM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Onchip_RAM_s1_end_xfer <= 1;
      else 
        d1_Onchip_RAM_s1_end_xfer <= Onchip_RAM_s1_end_xfer;
    end


  //Onchip_RAM_s1_waits_for_read in a cycle, which is an e_mux
  assign Onchip_RAM_s1_waits_for_read = Onchip_RAM_s1_in_a_read_cycle & 0;

  //Onchip_RAM_s1_in_a_read_cycle assignment, which is an e_assign
  assign Onchip_RAM_s1_in_a_read_cycle = (cpu_0_data_master_granted_Onchip_RAM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_Onchip_RAM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Onchip_RAM_s1_in_a_read_cycle;

  //Onchip_RAM_s1_waits_for_write in a cycle, which is an e_mux
  assign Onchip_RAM_s1_waits_for_write = Onchip_RAM_s1_in_a_write_cycle & 0;

  //Onchip_RAM_s1_in_a_write_cycle assignment, which is an e_assign
  assign Onchip_RAM_s1_in_a_write_cycle = cpu_0_data_master_granted_Onchip_RAM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Onchip_RAM_s1_in_a_write_cycle;

  assign wait_for_Onchip_RAM_s1_counter = 0;
  //Onchip_RAM_s1_byteenable byte enable port mux, which is an e_mux
  assign Onchip_RAM_s1_byteenable = (cpu_0_data_master_granted_Onchip_RAM_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Onchip_RAM/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_Onchip_RAM_s1 + cpu_0_instruction_master_granted_Onchip_RAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_Onchip_RAM_s1 + cpu_0_instruction_master_saved_grant_Onchip_RAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Onchip_ROM_s1_arbitrator (
                                  // inputs:
                                   Onchip_ROM_s1_readdata,
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_byteenable,
                                   cpu_0_data_master_debugaccess,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_waitrequest,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   cpu_0_instruction_master_address_to_slave,
                                   cpu_0_instruction_master_read,
                                   reset_n,

                                  // outputs:
                                   Onchip_ROM_s1_address,
                                   Onchip_ROM_s1_byteenable,
                                   Onchip_ROM_s1_chipselect,
                                   Onchip_ROM_s1_clken,
                                   Onchip_ROM_s1_debugaccess,
                                   Onchip_ROM_s1_readdata_from_sa,
                                   Onchip_ROM_s1_reset,
                                   Onchip_ROM_s1_write,
                                   Onchip_ROM_s1_writedata,
                                   cpu_0_data_master_granted_Onchip_ROM_s1,
                                   cpu_0_data_master_qualified_request_Onchip_ROM_s1,
                                   cpu_0_data_master_read_data_valid_Onchip_ROM_s1,
                                   cpu_0_data_master_requests_Onchip_ROM_s1,
                                   cpu_0_instruction_master_granted_Onchip_ROM_s1,
                                   cpu_0_instruction_master_qualified_request_Onchip_ROM_s1,
                                   cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1,
                                   cpu_0_instruction_master_requests_Onchip_ROM_s1,
                                   d1_Onchip_ROM_s1_end_xfer,
                                   registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1
                                )
;

  output  [ 10: 0] Onchip_ROM_s1_address;
  output  [  3: 0] Onchip_ROM_s1_byteenable;
  output           Onchip_ROM_s1_chipselect;
  output           Onchip_ROM_s1_clken;
  output           Onchip_ROM_s1_debugaccess;
  output  [ 31: 0] Onchip_ROM_s1_readdata_from_sa;
  output           Onchip_ROM_s1_reset;
  output           Onchip_ROM_s1_write;
  output  [ 31: 0] Onchip_ROM_s1_writedata;
  output           cpu_0_data_master_granted_Onchip_ROM_s1;
  output           cpu_0_data_master_qualified_request_Onchip_ROM_s1;
  output           cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  output           cpu_0_data_master_requests_Onchip_ROM_s1;
  output           cpu_0_instruction_master_granted_Onchip_ROM_s1;
  output           cpu_0_instruction_master_qualified_request_Onchip_ROM_s1;
  output           cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1;
  output           cpu_0_instruction_master_requests_Onchip_ROM_s1;
  output           d1_Onchip_ROM_s1_end_xfer;
  output           registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  input   [ 31: 0] Onchip_ROM_s1_readdata;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 14: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [ 10: 0] Onchip_ROM_s1_address;
  wire             Onchip_ROM_s1_allgrants;
  wire             Onchip_ROM_s1_allow_new_arb_cycle;
  wire             Onchip_ROM_s1_any_bursting_master_saved_grant;
  wire             Onchip_ROM_s1_any_continuerequest;
  reg     [  1: 0] Onchip_ROM_s1_arb_addend;
  wire             Onchip_ROM_s1_arb_counter_enable;
  reg              Onchip_ROM_s1_arb_share_counter;
  wire             Onchip_ROM_s1_arb_share_counter_next_value;
  wire             Onchip_ROM_s1_arb_share_set_values;
  wire    [  1: 0] Onchip_ROM_s1_arb_winner;
  wire             Onchip_ROM_s1_arbitration_holdoff_internal;
  wire             Onchip_ROM_s1_beginbursttransfer_internal;
  wire             Onchip_ROM_s1_begins_xfer;
  wire    [  3: 0] Onchip_ROM_s1_byteenable;
  wire             Onchip_ROM_s1_chipselect;
  wire    [  3: 0] Onchip_ROM_s1_chosen_master_double_vector;
  wire    [  1: 0] Onchip_ROM_s1_chosen_master_rot_left;
  wire             Onchip_ROM_s1_clken;
  wire             Onchip_ROM_s1_debugaccess;
  wire             Onchip_ROM_s1_end_xfer;
  wire             Onchip_ROM_s1_firsttransfer;
  wire    [  1: 0] Onchip_ROM_s1_grant_vector;
  wire             Onchip_ROM_s1_in_a_read_cycle;
  wire             Onchip_ROM_s1_in_a_write_cycle;
  wire    [  1: 0] Onchip_ROM_s1_master_qreq_vector;
  wire             Onchip_ROM_s1_non_bursting_master_requests;
  wire    [ 31: 0] Onchip_ROM_s1_readdata_from_sa;
  reg              Onchip_ROM_s1_reg_firsttransfer;
  wire             Onchip_ROM_s1_reset;
  reg     [  1: 0] Onchip_ROM_s1_saved_chosen_master_vector;
  reg              Onchip_ROM_s1_slavearbiterlockenable;
  wire             Onchip_ROM_s1_slavearbiterlockenable2;
  wire             Onchip_ROM_s1_unreg_firsttransfer;
  wire             Onchip_ROM_s1_waits_for_read;
  wire             Onchip_ROM_s1_waits_for_write;
  wire             Onchip_ROM_s1_write;
  wire    [ 31: 0] Onchip_ROM_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_Onchip_ROM_s1;
  wire             cpu_0_data_master_qualified_request_Onchip_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  reg              cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_Onchip_ROM_s1;
  wire             cpu_0_data_master_saved_grant_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_qualified_request_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1;
  reg              cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_saved_grant_Onchip_ROM_s1;
  reg              d1_Onchip_ROM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Onchip_ROM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_Onchip_ROM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_Onchip_ROM_s1;
  wire             p1_cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  wire    [ 14: 0] shifted_address_to_Onchip_ROM_s1_from_cpu_0_data_master;
  wire    [ 14: 0] shifted_address_to_Onchip_ROM_s1_from_cpu_0_instruction_master;
  wire             wait_for_Onchip_ROM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Onchip_ROM_s1_end_xfer;
    end


  assign Onchip_ROM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_Onchip_ROM_s1 | cpu_0_instruction_master_qualified_request_Onchip_ROM_s1));
  //assign Onchip_ROM_s1_readdata_from_sa = Onchip_ROM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Onchip_ROM_s1_readdata_from_sa = Onchip_ROM_s1_readdata;

  assign cpu_0_data_master_requests_Onchip_ROM_s1 = ({cpu_0_data_master_address_to_slave[14 : 13] , 13'b0} == 15'h2000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1 = cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register_in;

  //Onchip_ROM_s1_arb_share_counter set values, which is an e_mux
  assign Onchip_ROM_s1_arb_share_set_values = 1;

  //Onchip_ROM_s1_non_bursting_master_requests mux, which is an e_mux
  assign Onchip_ROM_s1_non_bursting_master_requests = cpu_0_data_master_requests_Onchip_ROM_s1 |
    cpu_0_instruction_master_requests_Onchip_ROM_s1 |
    cpu_0_data_master_requests_Onchip_ROM_s1 |
    cpu_0_instruction_master_requests_Onchip_ROM_s1;

  //Onchip_ROM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign Onchip_ROM_s1_any_bursting_master_saved_grant = 0;

  //Onchip_ROM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign Onchip_ROM_s1_arb_share_counter_next_value = Onchip_ROM_s1_firsttransfer ? (Onchip_ROM_s1_arb_share_set_values - 1) : |Onchip_ROM_s1_arb_share_counter ? (Onchip_ROM_s1_arb_share_counter - 1) : 0;

  //Onchip_ROM_s1_allgrants all slave grants, which is an e_mux
  assign Onchip_ROM_s1_allgrants = (|Onchip_ROM_s1_grant_vector) |
    (|Onchip_ROM_s1_grant_vector) |
    (|Onchip_ROM_s1_grant_vector) |
    (|Onchip_ROM_s1_grant_vector);

  //Onchip_ROM_s1_end_xfer assignment, which is an e_assign
  assign Onchip_ROM_s1_end_xfer = ~(Onchip_ROM_s1_waits_for_read | Onchip_ROM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_Onchip_ROM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Onchip_ROM_s1 = Onchip_ROM_s1_end_xfer & (~Onchip_ROM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Onchip_ROM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign Onchip_ROM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_Onchip_ROM_s1 & Onchip_ROM_s1_allgrants) | (end_xfer_arb_share_counter_term_Onchip_ROM_s1 & ~Onchip_ROM_s1_non_bursting_master_requests);

  //Onchip_ROM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_ROM_s1_arb_share_counter <= 0;
      else if (Onchip_ROM_s1_arb_counter_enable)
          Onchip_ROM_s1_arb_share_counter <= Onchip_ROM_s1_arb_share_counter_next_value;
    end


  //Onchip_ROM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_ROM_s1_slavearbiterlockenable <= 0;
      else if ((|Onchip_ROM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_Onchip_ROM_s1) | (end_xfer_arb_share_counter_term_Onchip_ROM_s1 & ~Onchip_ROM_s1_non_bursting_master_requests))
          Onchip_ROM_s1_slavearbiterlockenable <= |Onchip_ROM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master Onchip_ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = Onchip_ROM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //Onchip_ROM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Onchip_ROM_s1_slavearbiterlockenable2 = |Onchip_ROM_s1_arb_share_counter_next_value;

  //cpu_0/data_master Onchip_ROM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = Onchip_ROM_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master Onchip_ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = Onchip_ROM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master Onchip_ROM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = Onchip_ROM_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted Onchip_ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_Onchip_ROM_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_Onchip_ROM_s1 <= cpu_0_instruction_master_saved_grant_Onchip_ROM_s1 ? 1 : (Onchip_ROM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_Onchip_ROM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_Onchip_ROM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_Onchip_ROM_s1 & cpu_0_instruction_master_requests_Onchip_ROM_s1;

  //Onchip_ROM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign Onchip_ROM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_Onchip_ROM_s1 = cpu_0_data_master_requests_Onchip_ROM_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register_in = cpu_0_data_master_granted_Onchip_ROM_s1 & cpu_0_data_master_read & ~Onchip_ROM_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register = {cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register, cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_Onchip_ROM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_Onchip_ROM_s1 = cpu_0_data_master_read_data_valid_Onchip_ROM_s1_shift_register;

  //Onchip_ROM_s1_writedata mux, which is an e_mux
  assign Onchip_ROM_s1_writedata = cpu_0_data_master_writedata;

  //mux Onchip_ROM_s1_clken, which is an e_mux
  assign Onchip_ROM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_Onchip_ROM_s1 = (({cpu_0_instruction_master_address_to_slave[14 : 13] , 13'b0} == 15'h2000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted Onchip_ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_Onchip_ROM_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_Onchip_ROM_s1 <= cpu_0_data_master_saved_grant_Onchip_ROM_s1 ? 1 : (Onchip_ROM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_Onchip_ROM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_Onchip_ROM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_Onchip_ROM_s1 & cpu_0_data_master_requests_Onchip_ROM_s1;

  assign cpu_0_instruction_master_qualified_request_Onchip_ROM_s1 = cpu_0_instruction_master_requests_Onchip_ROM_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register_in = cpu_0_instruction_master_granted_Onchip_ROM_s1 & cpu_0_instruction_master_read & ~Onchip_ROM_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register, cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1 = cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1_shift_register;

  //allow new arb cycle for Onchip_ROM/s1, which is an e_assign
  assign Onchip_ROM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for Onchip_ROM/s1, which is an e_assign
  assign Onchip_ROM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_Onchip_ROM_s1;

  //cpu_0/instruction_master grant Onchip_ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_Onchip_ROM_s1 = Onchip_ROM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant Onchip_ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_Onchip_ROM_s1 = Onchip_ROM_s1_arb_winner[0] && cpu_0_instruction_master_requests_Onchip_ROM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for Onchip_ROM/s1, which is an e_assign
  assign Onchip_ROM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_Onchip_ROM_s1;

  //cpu_0/data_master grant Onchip_ROM/s1, which is an e_assign
  assign cpu_0_data_master_granted_Onchip_ROM_s1 = Onchip_ROM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant Onchip_ROM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_Onchip_ROM_s1 = Onchip_ROM_s1_arb_winner[1] && cpu_0_data_master_requests_Onchip_ROM_s1;

  //Onchip_ROM/s1 chosen-master double-vector, which is an e_assign
  assign Onchip_ROM_s1_chosen_master_double_vector = {Onchip_ROM_s1_master_qreq_vector, Onchip_ROM_s1_master_qreq_vector} & ({~Onchip_ROM_s1_master_qreq_vector, ~Onchip_ROM_s1_master_qreq_vector} + Onchip_ROM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign Onchip_ROM_s1_arb_winner = (Onchip_ROM_s1_allow_new_arb_cycle & | Onchip_ROM_s1_grant_vector) ? Onchip_ROM_s1_grant_vector : Onchip_ROM_s1_saved_chosen_master_vector;

  //saved Onchip_ROM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_ROM_s1_saved_chosen_master_vector <= 0;
      else if (Onchip_ROM_s1_allow_new_arb_cycle)
          Onchip_ROM_s1_saved_chosen_master_vector <= |Onchip_ROM_s1_grant_vector ? Onchip_ROM_s1_grant_vector : Onchip_ROM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign Onchip_ROM_s1_grant_vector = {(Onchip_ROM_s1_chosen_master_double_vector[1] | Onchip_ROM_s1_chosen_master_double_vector[3]),
    (Onchip_ROM_s1_chosen_master_double_vector[0] | Onchip_ROM_s1_chosen_master_double_vector[2])};

  //Onchip_ROM/s1 chosen master rotated left, which is an e_assign
  assign Onchip_ROM_s1_chosen_master_rot_left = (Onchip_ROM_s1_arb_winner << 1) ? (Onchip_ROM_s1_arb_winner << 1) : 1;

  //Onchip_ROM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_ROM_s1_arb_addend <= 1;
      else if (|Onchip_ROM_s1_grant_vector)
          Onchip_ROM_s1_arb_addend <= Onchip_ROM_s1_end_xfer? Onchip_ROM_s1_chosen_master_rot_left : Onchip_ROM_s1_grant_vector;
    end


  //~Onchip_ROM_s1_reset assignment, which is an e_assign
  assign Onchip_ROM_s1_reset = ~reset_n;

  assign Onchip_ROM_s1_chipselect = cpu_0_data_master_granted_Onchip_ROM_s1 | cpu_0_instruction_master_granted_Onchip_ROM_s1;
  //Onchip_ROM_s1_firsttransfer first transaction, which is an e_assign
  assign Onchip_ROM_s1_firsttransfer = Onchip_ROM_s1_begins_xfer ? Onchip_ROM_s1_unreg_firsttransfer : Onchip_ROM_s1_reg_firsttransfer;

  //Onchip_ROM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign Onchip_ROM_s1_unreg_firsttransfer = ~(Onchip_ROM_s1_slavearbiterlockenable & Onchip_ROM_s1_any_continuerequest);

  //Onchip_ROM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_ROM_s1_reg_firsttransfer <= 1'b1;
      else if (Onchip_ROM_s1_begins_xfer)
          Onchip_ROM_s1_reg_firsttransfer <= Onchip_ROM_s1_unreg_firsttransfer;
    end


  //Onchip_ROM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Onchip_ROM_s1_beginbursttransfer_internal = Onchip_ROM_s1_begins_xfer;

  //Onchip_ROM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign Onchip_ROM_s1_arbitration_holdoff_internal = Onchip_ROM_s1_begins_xfer & Onchip_ROM_s1_firsttransfer;

  //Onchip_ROM_s1_write assignment, which is an e_mux
  assign Onchip_ROM_s1_write = cpu_0_data_master_granted_Onchip_ROM_s1 & cpu_0_data_master_write;

  assign shifted_address_to_Onchip_ROM_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //Onchip_ROM_s1_address mux, which is an e_mux
  assign Onchip_ROM_s1_address = (cpu_0_data_master_granted_Onchip_ROM_s1)? (shifted_address_to_Onchip_ROM_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_Onchip_ROM_s1_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_Onchip_ROM_s1_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_Onchip_ROM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Onchip_ROM_s1_end_xfer <= 1;
      else 
        d1_Onchip_ROM_s1_end_xfer <= Onchip_ROM_s1_end_xfer;
    end


  //Onchip_ROM_s1_waits_for_read in a cycle, which is an e_mux
  assign Onchip_ROM_s1_waits_for_read = Onchip_ROM_s1_in_a_read_cycle & 0;

  //Onchip_ROM_s1_in_a_read_cycle assignment, which is an e_assign
  assign Onchip_ROM_s1_in_a_read_cycle = (cpu_0_data_master_granted_Onchip_ROM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_Onchip_ROM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Onchip_ROM_s1_in_a_read_cycle;

  //Onchip_ROM_s1_waits_for_write in a cycle, which is an e_mux
  assign Onchip_ROM_s1_waits_for_write = Onchip_ROM_s1_in_a_write_cycle & 0;

  //Onchip_ROM_s1_in_a_write_cycle assignment, which is an e_assign
  assign Onchip_ROM_s1_in_a_write_cycle = cpu_0_data_master_granted_Onchip_ROM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Onchip_ROM_s1_in_a_write_cycle;

  assign wait_for_Onchip_ROM_s1_counter = 0;
  //Onchip_ROM_s1_byteenable byte enable port mux, which is an e_mux
  assign Onchip_ROM_s1_byteenable = (cpu_0_data_master_granted_Onchip_ROM_s1)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign Onchip_ROM_s1_debugaccess = (cpu_0_data_master_granted_Onchip_ROM_s1)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Onchip_ROM/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_Onchip_ROM_s1 + cpu_0_instruction_master_granted_Onchip_ROM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_Onchip_ROM_s1 + cpu_0_instruction_master_saved_grant_Onchip_ROM_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_waitrequest,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_read,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 14: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg              cpu_0_jtag_debug_module_arb_share_counter;
  wire             cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 14: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 14: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[14 : 11] , 11'b0} == 15'h4800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[14 : 11] , 11'b0} == 15'h4800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~(cpu_0_data_master_arbiterlock);
  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       FlagPIO_s1_readdata_from_sa,
                                       LEDPIO_s1_readdata_from_sa,
                                       Onchip_RAM_s1_readdata_from_sa,
                                       Onchip_ROM_s1_readdata_from_sa,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_granted_FlagPIO_s1,
                                       cpu_0_data_master_granted_LEDPIO_s1,
                                       cpu_0_data_master_granted_Onchip_RAM_s1,
                                       cpu_0_data_master_granted_Onchip_ROM_s1,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_FlagPIO_s1,
                                       cpu_0_data_master_qualified_request_LEDPIO_s1,
                                       cpu_0_data_master_qualified_request_Onchip_RAM_s1,
                                       cpu_0_data_master_qualified_request_Onchip_ROM_s1,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_FlagPIO_s1,
                                       cpu_0_data_master_read_data_valid_LEDPIO_s1,
                                       cpu_0_data_master_read_data_valid_Onchip_RAM_s1,
                                       cpu_0_data_master_read_data_valid_Onchip_ROM_s1,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_FlagPIO_s1,
                                       cpu_0_data_master_requests_LEDPIO_s1,
                                       cpu_0_data_master_requests_Onchip_RAM_s1,
                                       cpu_0_data_master_requests_Onchip_ROM_s1,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_write,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_FlagPIO_s1_end_xfer,
                                       d1_LEDPIO_s1_end_xfer,
                                       d1_Onchip_RAM_s1_end_xfer,
                                       d1_Onchip_ROM_s1_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1,
                                       registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 14: 0] cpu_0_data_master_address_to_slave;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input            FlagPIO_s1_readdata_from_sa;
  input   [  7: 0] LEDPIO_s1_readdata_from_sa;
  input   [ 31: 0] Onchip_RAM_s1_readdata_from_sa;
  input   [ 31: 0] Onchip_ROM_s1_readdata_from_sa;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_granted_FlagPIO_s1;
  input            cpu_0_data_master_granted_LEDPIO_s1;
  input            cpu_0_data_master_granted_Onchip_RAM_s1;
  input            cpu_0_data_master_granted_Onchip_ROM_s1;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_FlagPIO_s1;
  input            cpu_0_data_master_qualified_request_LEDPIO_s1;
  input            cpu_0_data_master_qualified_request_Onchip_RAM_s1;
  input            cpu_0_data_master_qualified_request_Onchip_ROM_s1;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_FlagPIO_s1;
  input            cpu_0_data_master_read_data_valid_LEDPIO_s1;
  input            cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  input            cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_FlagPIO_s1;
  input            cpu_0_data_master_requests_LEDPIO_s1;
  input            cpu_0_data_master_requests_Onchip_RAM_s1;
  input            cpu_0_data_master_requests_Onchip_ROM_s1;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_FlagPIO_s1_end_xfer;
  input            d1_LEDPIO_s1_end_xfer;
  input            d1_Onchip_RAM_s1_end_xfer;
  input            d1_Onchip_ROM_s1_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  input            registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  input            reset_n;

  wire    [ 14: 0] cpu_0_data_master_address_to_slave;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_FlagPIO_s1 | ~cpu_0_data_master_requests_FlagPIO_s1) & ((~cpu_0_data_master_qualified_request_FlagPIO_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_FlagPIO_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_LEDPIO_s1 | ~cpu_0_data_master_requests_LEDPIO_s1) & ((~cpu_0_data_master_qualified_request_LEDPIO_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_LEDPIO_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_Onchip_RAM_s1 | registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1 | ~cpu_0_data_master_requests_Onchip_RAM_s1) & (cpu_0_data_master_granted_Onchip_RAM_s1 | ~cpu_0_data_master_qualified_request_Onchip_RAM_s1) & ((~cpu_0_data_master_qualified_request_Onchip_RAM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_Onchip_RAM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_Onchip_ROM_s1 | registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1 | ~cpu_0_data_master_requests_Onchip_ROM_s1) & (cpu_0_data_master_granted_Onchip_ROM_s1 | ~cpu_0_data_master_qualified_request_Onchip_ROM_s1) & ((~cpu_0_data_master_qualified_request_Onchip_ROM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_Onchip_ROM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[14 : 0];

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_FlagPIO_s1}} | FlagPIO_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_LEDPIO_s1}} | LEDPIO_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_Onchip_RAM_s1}} | Onchip_RAM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_Onchip_ROM_s1}} | Onchip_ROM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else 
        cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              Onchip_RAM_s1_readdata_from_sa,
                                              Onchip_ROM_s1_readdata_from_sa,
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_Onchip_RAM_s1,
                                              cpu_0_instruction_master_granted_Onchip_ROM_s1,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_Onchip_RAM_s1,
                                              cpu_0_instruction_master_qualified_request_Onchip_ROM_s1,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1,
                                              cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_Onchip_RAM_s1,
                                              cpu_0_instruction_master_requests_Onchip_ROM_s1,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_Onchip_RAM_s1_end_xfer,
                                              d1_Onchip_ROM_s1_end_xfer,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 14: 0] cpu_0_instruction_master_address_to_slave;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_waitrequest;
  input   [ 31: 0] Onchip_RAM_s1_readdata_from_sa;
  input   [ 31: 0] Onchip_ROM_s1_readdata_from_sa;
  input            clk;
  input   [ 14: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_Onchip_RAM_s1;
  input            cpu_0_instruction_master_granted_Onchip_ROM_s1;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_Onchip_RAM_s1;
  input            cpu_0_instruction_master_qualified_request_Onchip_ROM_s1;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1;
  input            cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_Onchip_RAM_s1;
  input            cpu_0_instruction_master_requests_Onchip_ROM_s1;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_Onchip_RAM_s1_end_xfer;
  input            d1_Onchip_ROM_s1_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 14: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 14: 0] cpu_0_instruction_master_address_to_slave;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_Onchip_RAM_s1 | cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1 | ~cpu_0_instruction_master_requests_Onchip_RAM_s1) & (cpu_0_instruction_master_granted_Onchip_RAM_s1 | ~cpu_0_instruction_master_qualified_request_Onchip_RAM_s1) & ((~cpu_0_instruction_master_qualified_request_Onchip_RAM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1 & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_Onchip_ROM_s1 | cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1 | ~cpu_0_instruction_master_requests_Onchip_ROM_s1) & (cpu_0_instruction_master_granted_Onchip_ROM_s1 | ~cpu_0_instruction_master_qualified_request_Onchip_ROM_s1) & ((~cpu_0_instruction_master_qualified_request_Onchip_ROM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1 & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[14 : 0];

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~cpu_0_instruction_master_requests_Onchip_RAM_s1}} | Onchip_RAM_s1_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_requests_Onchip_ROM_s1}} | Onchip_ROM_s1_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Processor_after_generate_reset_clk_0_domain_synch_module (
                                                                  // inputs:
                                                                   clk,
                                                                   data_in,
                                                                   reset_n,

                                                                  // outputs:
                                                                   data_out
                                                                )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Processor_after_generate (
                                  // 1) global signals:
                                   clk_0,
                                   reset_n,

                                  // the_FlagPIO
                                   out_port_from_the_FlagPIO,

                                  // the_LEDPIO
                                   out_port_from_the_LEDPIO
                                )
;

  output           out_port_from_the_FlagPIO;
  output  [  7: 0] out_port_from_the_LEDPIO;
  input            clk_0;
  input            reset_n;

  wire    [  1: 0] FlagPIO_s1_address;
  wire             FlagPIO_s1_chipselect;
  wire             FlagPIO_s1_readdata;
  wire             FlagPIO_s1_readdata_from_sa;
  wire             FlagPIO_s1_reset_n;
  wire             FlagPIO_s1_write_n;
  wire             FlagPIO_s1_writedata;
  wire    [  1: 0] LEDPIO_s1_address;
  wire             LEDPIO_s1_chipselect;
  wire    [  7: 0] LEDPIO_s1_readdata;
  wire    [  7: 0] LEDPIO_s1_readdata_from_sa;
  wire             LEDPIO_s1_reset_n;
  wire             LEDPIO_s1_write_n;
  wire    [  7: 0] LEDPIO_s1_writedata;
  wire    [  7: 0] Onchip_RAM_s1_address;
  wire    [  3: 0] Onchip_RAM_s1_byteenable;
  wire             Onchip_RAM_s1_chipselect;
  wire             Onchip_RAM_s1_clken;
  wire    [ 31: 0] Onchip_RAM_s1_readdata;
  wire    [ 31: 0] Onchip_RAM_s1_readdata_from_sa;
  wire             Onchip_RAM_s1_reset;
  wire             Onchip_RAM_s1_write;
  wire    [ 31: 0] Onchip_RAM_s1_writedata;
  wire    [ 10: 0] Onchip_ROM_s1_address;
  wire    [  3: 0] Onchip_ROM_s1_byteenable;
  wire             Onchip_ROM_s1_chipselect;
  wire             Onchip_ROM_s1_clken;
  wire             Onchip_ROM_s1_debugaccess;
  wire    [ 31: 0] Onchip_ROM_s1_readdata;
  wire    [ 31: 0] Onchip_ROM_s1_readdata_from_sa;
  wire             Onchip_ROM_s1_reset;
  wire             Onchip_ROM_s1_write;
  wire    [ 31: 0] Onchip_ROM_s1_writedata;
  wire             clk_0_reset_n;
  wire    [ 14: 0] cpu_0_data_master_address;
  wire    [ 14: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_FlagPIO_s1;
  wire             cpu_0_data_master_granted_LEDPIO_s1;
  wire             cpu_0_data_master_granted_Onchip_RAM_s1;
  wire             cpu_0_data_master_granted_Onchip_ROM_s1;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_qualified_request_FlagPIO_s1;
  wire             cpu_0_data_master_qualified_request_LEDPIO_s1;
  wire             cpu_0_data_master_qualified_request_Onchip_RAM_s1;
  wire             cpu_0_data_master_qualified_request_Onchip_ROM_s1;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_FlagPIO_s1;
  wire             cpu_0_data_master_read_data_valid_LEDPIO_s1;
  wire             cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_FlagPIO_s1;
  wire             cpu_0_data_master_requests_LEDPIO_s1;
  wire             cpu_0_data_master_requests_Onchip_RAM_s1;
  wire             cpu_0_data_master_requests_Onchip_ROM_s1;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 14: 0] cpu_0_instruction_master_address;
  wire    [ 14: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_granted_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_granted_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_requests_Onchip_RAM_s1;
  wire             cpu_0_instruction_master_requests_Onchip_ROM_s1;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire             d1_FlagPIO_s1_end_xfer;
  wire             d1_LEDPIO_s1_end_xfer;
  wire             d1_Onchip_RAM_s1_end_xfer;
  wire             d1_Onchip_ROM_s1_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             out_port_from_the_FlagPIO;
  wire    [  7: 0] out_port_from_the_LEDPIO;
  wire             registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1;
  wire             registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1;
  wire             reset_n_sources;
  FlagPIO_s1_arbitrator the_FlagPIO_s1
    (
      .FlagPIO_s1_address                             (FlagPIO_s1_address),
      .FlagPIO_s1_chipselect                          (FlagPIO_s1_chipselect),
      .FlagPIO_s1_readdata                            (FlagPIO_s1_readdata),
      .FlagPIO_s1_readdata_from_sa                    (FlagPIO_s1_readdata_from_sa),
      .FlagPIO_s1_reset_n                             (FlagPIO_s1_reset_n),
      .FlagPIO_s1_write_n                             (FlagPIO_s1_write_n),
      .FlagPIO_s1_writedata                           (FlagPIO_s1_writedata),
      .clk                                            (clk_0),
      .cpu_0_data_master_address_to_slave             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_FlagPIO_s1           (cpu_0_data_master_granted_FlagPIO_s1),
      .cpu_0_data_master_qualified_request_FlagPIO_s1 (cpu_0_data_master_qualified_request_FlagPIO_s1),
      .cpu_0_data_master_read                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_FlagPIO_s1   (cpu_0_data_master_read_data_valid_FlagPIO_s1),
      .cpu_0_data_master_requests_FlagPIO_s1          (cpu_0_data_master_requests_FlagPIO_s1),
      .cpu_0_data_master_waitrequest                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                    (cpu_0_data_master_writedata),
      .d1_FlagPIO_s1_end_xfer                         (d1_FlagPIO_s1_end_xfer),
      .reset_n                                        (clk_0_reset_n)
    );

  FlagPIO the_FlagPIO
    (
      .address    (FlagPIO_s1_address),
      .chipselect (FlagPIO_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_FlagPIO),
      .readdata   (FlagPIO_s1_readdata),
      .reset_n    (FlagPIO_s1_reset_n),
      .write_n    (FlagPIO_s1_write_n),
      .writedata  (FlagPIO_s1_writedata)
    );

  LEDPIO_s1_arbitrator the_LEDPIO_s1
    (
      .LEDPIO_s1_address                             (LEDPIO_s1_address),
      .LEDPIO_s1_chipselect                          (LEDPIO_s1_chipselect),
      .LEDPIO_s1_readdata                            (LEDPIO_s1_readdata),
      .LEDPIO_s1_readdata_from_sa                    (LEDPIO_s1_readdata_from_sa),
      .LEDPIO_s1_reset_n                             (LEDPIO_s1_reset_n),
      .LEDPIO_s1_write_n                             (LEDPIO_s1_write_n),
      .LEDPIO_s1_writedata                           (LEDPIO_s1_writedata),
      .clk                                           (clk_0),
      .cpu_0_data_master_address_to_slave            (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                  (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_LEDPIO_s1           (cpu_0_data_master_granted_LEDPIO_s1),
      .cpu_0_data_master_qualified_request_LEDPIO_s1 (cpu_0_data_master_qualified_request_LEDPIO_s1),
      .cpu_0_data_master_read                        (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_LEDPIO_s1   (cpu_0_data_master_read_data_valid_LEDPIO_s1),
      .cpu_0_data_master_requests_LEDPIO_s1          (cpu_0_data_master_requests_LEDPIO_s1),
      .cpu_0_data_master_waitrequest                 (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                       (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                   (cpu_0_data_master_writedata),
      .d1_LEDPIO_s1_end_xfer                         (d1_LEDPIO_s1_end_xfer),
      .reset_n                                       (clk_0_reset_n)
    );

  LEDPIO the_LEDPIO
    (
      .address    (LEDPIO_s1_address),
      .chipselect (LEDPIO_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_LEDPIO),
      .readdata   (LEDPIO_s1_readdata),
      .reset_n    (LEDPIO_s1_reset_n),
      .write_n    (LEDPIO_s1_write_n),
      .writedata  (LEDPIO_s1_writedata)
    );

  Onchip_RAM_s1_arbitrator the_Onchip_RAM_s1
    (
      .Onchip_RAM_s1_address                                      (Onchip_RAM_s1_address),
      .Onchip_RAM_s1_byteenable                                   (Onchip_RAM_s1_byteenable),
      .Onchip_RAM_s1_chipselect                                   (Onchip_RAM_s1_chipselect),
      .Onchip_RAM_s1_clken                                        (Onchip_RAM_s1_clken),
      .Onchip_RAM_s1_readdata                                     (Onchip_RAM_s1_readdata),
      .Onchip_RAM_s1_readdata_from_sa                             (Onchip_RAM_s1_readdata_from_sa),
      .Onchip_RAM_s1_reset                                        (Onchip_RAM_s1_reset),
      .Onchip_RAM_s1_write                                        (Onchip_RAM_s1_write),
      .Onchip_RAM_s1_writedata                                    (Onchip_RAM_s1_writedata),
      .clk                                                        (clk_0),
      .cpu_0_data_master_address_to_slave                         (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                               (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_Onchip_RAM_s1                    (cpu_0_data_master_granted_Onchip_RAM_s1),
      .cpu_0_data_master_qualified_request_Onchip_RAM_s1          (cpu_0_data_master_qualified_request_Onchip_RAM_s1),
      .cpu_0_data_master_read                                     (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_Onchip_RAM_s1            (cpu_0_data_master_read_data_valid_Onchip_RAM_s1),
      .cpu_0_data_master_requests_Onchip_RAM_s1                   (cpu_0_data_master_requests_Onchip_RAM_s1),
      .cpu_0_data_master_waitrequest                              (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                    (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                  (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_Onchip_RAM_s1             (cpu_0_instruction_master_granted_Onchip_RAM_s1),
      .cpu_0_instruction_master_qualified_request_Onchip_RAM_s1   (cpu_0_instruction_master_qualified_request_Onchip_RAM_s1),
      .cpu_0_instruction_master_read                              (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1     (cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1),
      .cpu_0_instruction_master_requests_Onchip_RAM_s1            (cpu_0_instruction_master_requests_Onchip_RAM_s1),
      .d1_Onchip_RAM_s1_end_xfer                                  (d1_Onchip_RAM_s1_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1 (registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1),
      .reset_n                                                    (clk_0_reset_n)
    );

  Onchip_RAM the_Onchip_RAM
    (
      .address    (Onchip_RAM_s1_address),
      .byteenable (Onchip_RAM_s1_byteenable),
      .chipselect (Onchip_RAM_s1_chipselect),
      .clk        (clk_0),
      .clken      (Onchip_RAM_s1_clken),
      .readdata   (Onchip_RAM_s1_readdata),
      .reset      (Onchip_RAM_s1_reset),
      .write      (Onchip_RAM_s1_write),
      .writedata  (Onchip_RAM_s1_writedata)
    );

  Onchip_ROM_s1_arbitrator the_Onchip_ROM_s1
    (
      .Onchip_ROM_s1_address                                      (Onchip_ROM_s1_address),
      .Onchip_ROM_s1_byteenable                                   (Onchip_ROM_s1_byteenable),
      .Onchip_ROM_s1_chipselect                                   (Onchip_ROM_s1_chipselect),
      .Onchip_ROM_s1_clken                                        (Onchip_ROM_s1_clken),
      .Onchip_ROM_s1_debugaccess                                  (Onchip_ROM_s1_debugaccess),
      .Onchip_ROM_s1_readdata                                     (Onchip_ROM_s1_readdata),
      .Onchip_ROM_s1_readdata_from_sa                             (Onchip_ROM_s1_readdata_from_sa),
      .Onchip_ROM_s1_reset                                        (Onchip_ROM_s1_reset),
      .Onchip_ROM_s1_write                                        (Onchip_ROM_s1_write),
      .Onchip_ROM_s1_writedata                                    (Onchip_ROM_s1_writedata),
      .clk                                                        (clk_0),
      .cpu_0_data_master_address_to_slave                         (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                               (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                              (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_Onchip_ROM_s1                    (cpu_0_data_master_granted_Onchip_ROM_s1),
      .cpu_0_data_master_qualified_request_Onchip_ROM_s1          (cpu_0_data_master_qualified_request_Onchip_ROM_s1),
      .cpu_0_data_master_read                                     (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_Onchip_ROM_s1            (cpu_0_data_master_read_data_valid_Onchip_ROM_s1),
      .cpu_0_data_master_requests_Onchip_ROM_s1                   (cpu_0_data_master_requests_Onchip_ROM_s1),
      .cpu_0_data_master_waitrequest                              (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                    (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                  (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_Onchip_ROM_s1             (cpu_0_instruction_master_granted_Onchip_ROM_s1),
      .cpu_0_instruction_master_qualified_request_Onchip_ROM_s1   (cpu_0_instruction_master_qualified_request_Onchip_ROM_s1),
      .cpu_0_instruction_master_read                              (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1     (cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1),
      .cpu_0_instruction_master_requests_Onchip_ROM_s1            (cpu_0_instruction_master_requests_Onchip_ROM_s1),
      .d1_Onchip_ROM_s1_end_xfer                                  (d1_Onchip_ROM_s1_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1 (registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1),
      .reset_n                                                    (clk_0_reset_n)
    );

  Onchip_ROM the_Onchip_ROM
    (
      .address     (Onchip_ROM_s1_address),
      .byteenable  (Onchip_ROM_s1_byteenable),
      .chipselect  (Onchip_ROM_s1_chipselect),
      .clk         (clk_0),
      .clken       (Onchip_ROM_s1_clken),
      .debugaccess (Onchip_ROM_s1_debugaccess),
      .readdata    (Onchip_ROM_s1_readdata),
      .reset       (Onchip_ROM_s1_reset),
      .write       (Onchip_ROM_s1_write),
      .writedata   (Onchip_ROM_s1_writedata)
    );

  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_waitrequest                                      (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .FlagPIO_s1_readdata_from_sa                                 (FlagPIO_s1_readdata_from_sa),
      .LEDPIO_s1_readdata_from_sa                                  (LEDPIO_s1_readdata_from_sa),
      .Onchip_RAM_s1_readdata_from_sa                              (Onchip_RAM_s1_readdata_from_sa),
      .Onchip_ROM_s1_readdata_from_sa                              (Onchip_ROM_s1_readdata_from_sa),
      .clk                                                         (clk_0),
      .cpu_0_data_master_address                                   (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_FlagPIO_s1                        (cpu_0_data_master_granted_FlagPIO_s1),
      .cpu_0_data_master_granted_LEDPIO_s1                         (cpu_0_data_master_granted_LEDPIO_s1),
      .cpu_0_data_master_granted_Onchip_RAM_s1                     (cpu_0_data_master_granted_Onchip_RAM_s1),
      .cpu_0_data_master_granted_Onchip_ROM_s1                     (cpu_0_data_master_granted_Onchip_ROM_s1),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module           (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_FlagPIO_s1              (cpu_0_data_master_qualified_request_FlagPIO_s1),
      .cpu_0_data_master_qualified_request_LEDPIO_s1               (cpu_0_data_master_qualified_request_LEDPIO_s1),
      .cpu_0_data_master_qualified_request_Onchip_RAM_s1           (cpu_0_data_master_qualified_request_Onchip_RAM_s1),
      .cpu_0_data_master_qualified_request_Onchip_ROM_s1           (cpu_0_data_master_qualified_request_Onchip_ROM_s1),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_FlagPIO_s1                (cpu_0_data_master_read_data_valid_FlagPIO_s1),
      .cpu_0_data_master_read_data_valid_LEDPIO_s1                 (cpu_0_data_master_read_data_valid_LEDPIO_s1),
      .cpu_0_data_master_read_data_valid_Onchip_RAM_s1             (cpu_0_data_master_read_data_valid_Onchip_RAM_s1),
      .cpu_0_data_master_read_data_valid_Onchip_ROM_s1             (cpu_0_data_master_read_data_valid_Onchip_ROM_s1),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_readdata                                  (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_FlagPIO_s1                       (cpu_0_data_master_requests_FlagPIO_s1),
      .cpu_0_data_master_requests_LEDPIO_s1                        (cpu_0_data_master_requests_LEDPIO_s1),
      .cpu_0_data_master_requests_Onchip_RAM_s1                    (cpu_0_data_master_requests_Onchip_RAM_s1),
      .cpu_0_data_master_requests_Onchip_ROM_s1                    (cpu_0_data_master_requests_Onchip_ROM_s1),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module          (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_waitrequest                               (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_jtag_debug_module_readdata_from_sa                    (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_FlagPIO_s1_end_xfer                                      (d1_FlagPIO_s1_end_xfer),
      .d1_LEDPIO_s1_end_xfer                                       (d1_LEDPIO_s1_end_xfer),
      .d1_Onchip_RAM_s1_end_xfer                                   (d1_Onchip_RAM_s1_end_xfer),
      .d1_Onchip_ROM_s1_end_xfer                                   (d1_Onchip_ROM_s1_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                         (d1_cpu_0_jtag_debug_module_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1  (registered_cpu_0_data_master_read_data_valid_Onchip_RAM_s1),
      .registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1  (registered_cpu_0_data_master_read_data_valid_Onchip_ROM_s1),
      .reset_n                                                     (clk_0_reset_n)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .Onchip_RAM_s1_readdata_from_sa                                     (Onchip_RAM_s1_readdata_from_sa),
      .Onchip_ROM_s1_readdata_from_sa                                     (Onchip_ROM_s1_readdata_from_sa),
      .clk                                                                (clk_0),
      .cpu_0_instruction_master_address                                   (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_Onchip_RAM_s1                     (cpu_0_instruction_master_granted_Onchip_RAM_s1),
      .cpu_0_instruction_master_granted_Onchip_ROM_s1                     (cpu_0_instruction_master_granted_Onchip_ROM_s1),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_Onchip_RAM_s1           (cpu_0_instruction_master_qualified_request_Onchip_RAM_s1),
      .cpu_0_instruction_master_qualified_request_Onchip_ROM_s1           (cpu_0_instruction_master_qualified_request_Onchip_ROM_s1),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1             (cpu_0_instruction_master_read_data_valid_Onchip_RAM_s1),
      .cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1             (cpu_0_instruction_master_read_data_valid_Onchip_ROM_s1),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_readdata                                  (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_requests_Onchip_RAM_s1                    (cpu_0_instruction_master_requests_Onchip_RAM_s1),
      .cpu_0_instruction_master_requests_Onchip_ROM_s1                    (cpu_0_instruction_master_requests_Onchip_ROM_s1),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_waitrequest                               (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_Onchip_RAM_s1_end_xfer                                          (d1_Onchip_RAM_s1_end_xfer),
      .d1_Onchip_ROM_s1_end_xfer                                          (d1_Onchip_ROM_s1_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  //reset is asserted asynchronously and deasserted synchronously
  Processor_after_generate_reset_clk_0_domain_synch_module Processor_after_generate_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa);

  //cpu_0_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_0_data_master_irq = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.1/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/sgate.v"
`include "Onchip_RAM.v"
`include "FlagPIO.v"
`include "LEDPIO.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "Onchip_ROM.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             clk;
  reg              clk_0;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             out_port_from_the_FlagPIO;
  wire    [  7: 0] out_port_from_the_LEDPIO;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  Processor_after_generate DUT
    (
      .clk_0                     (clk_0),
      .out_port_from_the_FlagPIO (out_port_from_the_FlagPIO),
      .out_port_from_the_LEDPIO  (out_port_from_the_LEDPIO),
      .reset_n                   (reset_n)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on