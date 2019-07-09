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

module FLAG_1_bit_s1_arbitrator (
                                  // inputs:
                                   FLAG_1_bit_s1_readdata,
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_waitrequest,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   reset_n,

                                  // outputs:
                                   FLAG_1_bit_s1_address,
                                   FLAG_1_bit_s1_chipselect,
                                   FLAG_1_bit_s1_readdata_from_sa,
                                   FLAG_1_bit_s1_reset_n,
                                   FLAG_1_bit_s1_write_n,
                                   FLAG_1_bit_s1_writedata,
                                   cpu_0_data_master_granted_FLAG_1_bit_s1,
                                   cpu_0_data_master_qualified_request_FLAG_1_bit_s1,
                                   cpu_0_data_master_read_data_valid_FLAG_1_bit_s1,
                                   cpu_0_data_master_requests_FLAG_1_bit_s1,
                                   d1_FLAG_1_bit_s1_end_xfer
                                )
;

  output  [  1: 0] FLAG_1_bit_s1_address;
  output           FLAG_1_bit_s1_chipselect;
  output           FLAG_1_bit_s1_readdata_from_sa;
  output           FLAG_1_bit_s1_reset_n;
  output           FLAG_1_bit_s1_write_n;
  output           FLAG_1_bit_s1_writedata;
  output           cpu_0_data_master_granted_FLAG_1_bit_s1;
  output           cpu_0_data_master_qualified_request_FLAG_1_bit_s1;
  output           cpu_0_data_master_read_data_valid_FLAG_1_bit_s1;
  output           cpu_0_data_master_requests_FLAG_1_bit_s1;
  output           d1_FLAG_1_bit_s1_end_xfer;
  input            FLAG_1_bit_s1_readdata;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] FLAG_1_bit_s1_address;
  wire             FLAG_1_bit_s1_allgrants;
  wire             FLAG_1_bit_s1_allow_new_arb_cycle;
  wire             FLAG_1_bit_s1_any_bursting_master_saved_grant;
  wire             FLAG_1_bit_s1_any_continuerequest;
  wire             FLAG_1_bit_s1_arb_counter_enable;
  reg              FLAG_1_bit_s1_arb_share_counter;
  wire             FLAG_1_bit_s1_arb_share_counter_next_value;
  wire             FLAG_1_bit_s1_arb_share_set_values;
  wire             FLAG_1_bit_s1_beginbursttransfer_internal;
  wire             FLAG_1_bit_s1_begins_xfer;
  wire             FLAG_1_bit_s1_chipselect;
  wire             FLAG_1_bit_s1_end_xfer;
  wire             FLAG_1_bit_s1_firsttransfer;
  wire             FLAG_1_bit_s1_grant_vector;
  wire             FLAG_1_bit_s1_in_a_read_cycle;
  wire             FLAG_1_bit_s1_in_a_write_cycle;
  wire             FLAG_1_bit_s1_master_qreq_vector;
  wire             FLAG_1_bit_s1_non_bursting_master_requests;
  wire             FLAG_1_bit_s1_readdata_from_sa;
  reg              FLAG_1_bit_s1_reg_firsttransfer;
  wire             FLAG_1_bit_s1_reset_n;
  reg              FLAG_1_bit_s1_slavearbiterlockenable;
  wire             FLAG_1_bit_s1_slavearbiterlockenable2;
  wire             FLAG_1_bit_s1_unreg_firsttransfer;
  wire             FLAG_1_bit_s1_waits_for_read;
  wire             FLAG_1_bit_s1_waits_for_write;
  wire             FLAG_1_bit_s1_write_n;
  wire             FLAG_1_bit_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_FLAG_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_FLAG_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_FLAG_1_bit_s1;
  wire             cpu_0_data_master_requests_FLAG_1_bit_s1;
  wire             cpu_0_data_master_saved_grant_FLAG_1_bit_s1;
  reg              d1_FLAG_1_bit_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_FLAG_1_bit_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 15: 0] shifted_address_to_FLAG_1_bit_s1_from_cpu_0_data_master;
  wire             wait_for_FLAG_1_bit_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~FLAG_1_bit_s1_end_xfer;
    end


  assign FLAG_1_bit_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_FLAG_1_bit_s1));
  //assign FLAG_1_bit_s1_readdata_from_sa = FLAG_1_bit_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign FLAG_1_bit_s1_readdata_from_sa = FLAG_1_bit_s1_readdata;

  assign cpu_0_data_master_requests_FLAG_1_bit_s1 = ({cpu_0_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9010) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //FLAG_1_bit_s1_arb_share_counter set values, which is an e_mux
  assign FLAG_1_bit_s1_arb_share_set_values = 1;

  //FLAG_1_bit_s1_non_bursting_master_requests mux, which is an e_mux
  assign FLAG_1_bit_s1_non_bursting_master_requests = cpu_0_data_master_requests_FLAG_1_bit_s1;

  //FLAG_1_bit_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign FLAG_1_bit_s1_any_bursting_master_saved_grant = 0;

  //FLAG_1_bit_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign FLAG_1_bit_s1_arb_share_counter_next_value = FLAG_1_bit_s1_firsttransfer ? (FLAG_1_bit_s1_arb_share_set_values - 1) : |FLAG_1_bit_s1_arb_share_counter ? (FLAG_1_bit_s1_arb_share_counter - 1) : 0;

  //FLAG_1_bit_s1_allgrants all slave grants, which is an e_mux
  assign FLAG_1_bit_s1_allgrants = |FLAG_1_bit_s1_grant_vector;

  //FLAG_1_bit_s1_end_xfer assignment, which is an e_assign
  assign FLAG_1_bit_s1_end_xfer = ~(FLAG_1_bit_s1_waits_for_read | FLAG_1_bit_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_FLAG_1_bit_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_FLAG_1_bit_s1 = FLAG_1_bit_s1_end_xfer & (~FLAG_1_bit_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //FLAG_1_bit_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign FLAG_1_bit_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_FLAG_1_bit_s1 & FLAG_1_bit_s1_allgrants) | (end_xfer_arb_share_counter_term_FLAG_1_bit_s1 & ~FLAG_1_bit_s1_non_bursting_master_requests);

  //FLAG_1_bit_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          FLAG_1_bit_s1_arb_share_counter <= 0;
      else if (FLAG_1_bit_s1_arb_counter_enable)
          FLAG_1_bit_s1_arb_share_counter <= FLAG_1_bit_s1_arb_share_counter_next_value;
    end


  //FLAG_1_bit_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          FLAG_1_bit_s1_slavearbiterlockenable <= 0;
      else if ((|FLAG_1_bit_s1_master_qreq_vector & end_xfer_arb_share_counter_term_FLAG_1_bit_s1) | (end_xfer_arb_share_counter_term_FLAG_1_bit_s1 & ~FLAG_1_bit_s1_non_bursting_master_requests))
          FLAG_1_bit_s1_slavearbiterlockenable <= |FLAG_1_bit_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master FLAG_1_bit/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = FLAG_1_bit_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //FLAG_1_bit_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign FLAG_1_bit_s1_slavearbiterlockenable2 = |FLAG_1_bit_s1_arb_share_counter_next_value;

  //cpu_0/data_master FLAG_1_bit/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = FLAG_1_bit_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //FLAG_1_bit_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign FLAG_1_bit_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_FLAG_1_bit_s1 = cpu_0_data_master_requests_FLAG_1_bit_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //FLAG_1_bit_s1_writedata mux, which is an e_mux
  assign FLAG_1_bit_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_FLAG_1_bit_s1 = cpu_0_data_master_qualified_request_FLAG_1_bit_s1;

  //cpu_0/data_master saved-grant FLAG_1_bit/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_FLAG_1_bit_s1 = cpu_0_data_master_requests_FLAG_1_bit_s1;

  //allow new arb cycle for FLAG_1_bit/s1, which is an e_assign
  assign FLAG_1_bit_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign FLAG_1_bit_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign FLAG_1_bit_s1_master_qreq_vector = 1;

  //FLAG_1_bit_s1_reset_n assignment, which is an e_assign
  assign FLAG_1_bit_s1_reset_n = reset_n;

  assign FLAG_1_bit_s1_chipselect = cpu_0_data_master_granted_FLAG_1_bit_s1;
  //FLAG_1_bit_s1_firsttransfer first transaction, which is an e_assign
  assign FLAG_1_bit_s1_firsttransfer = FLAG_1_bit_s1_begins_xfer ? FLAG_1_bit_s1_unreg_firsttransfer : FLAG_1_bit_s1_reg_firsttransfer;

  //FLAG_1_bit_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign FLAG_1_bit_s1_unreg_firsttransfer = ~(FLAG_1_bit_s1_slavearbiterlockenable & FLAG_1_bit_s1_any_continuerequest);

  //FLAG_1_bit_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          FLAG_1_bit_s1_reg_firsttransfer <= 1'b1;
      else if (FLAG_1_bit_s1_begins_xfer)
          FLAG_1_bit_s1_reg_firsttransfer <= FLAG_1_bit_s1_unreg_firsttransfer;
    end


  //FLAG_1_bit_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign FLAG_1_bit_s1_beginbursttransfer_internal = FLAG_1_bit_s1_begins_xfer;

  //~FLAG_1_bit_s1_write_n assignment, which is an e_mux
  assign FLAG_1_bit_s1_write_n = ~(cpu_0_data_master_granted_FLAG_1_bit_s1 & cpu_0_data_master_write);

  assign shifted_address_to_FLAG_1_bit_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //FLAG_1_bit_s1_address mux, which is an e_mux
  assign FLAG_1_bit_s1_address = shifted_address_to_FLAG_1_bit_s1_from_cpu_0_data_master >> 2;

  //d1_FLAG_1_bit_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_FLAG_1_bit_s1_end_xfer <= 1;
      else 
        d1_FLAG_1_bit_s1_end_xfer <= FLAG_1_bit_s1_end_xfer;
    end


  //FLAG_1_bit_s1_waits_for_read in a cycle, which is an e_mux
  assign FLAG_1_bit_s1_waits_for_read = FLAG_1_bit_s1_in_a_read_cycle & FLAG_1_bit_s1_begins_xfer;

  //FLAG_1_bit_s1_in_a_read_cycle assignment, which is an e_assign
  assign FLAG_1_bit_s1_in_a_read_cycle = cpu_0_data_master_granted_FLAG_1_bit_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = FLAG_1_bit_s1_in_a_read_cycle;

  //FLAG_1_bit_s1_waits_for_write in a cycle, which is an e_mux
  assign FLAG_1_bit_s1_waits_for_write = FLAG_1_bit_s1_in_a_write_cycle & 0;

  //FLAG_1_bit_s1_in_a_write_cycle assignment, which is an e_assign
  assign FLAG_1_bit_s1_in_a_write_cycle = cpu_0_data_master_granted_FLAG_1_bit_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = FLAG_1_bit_s1_in_a_write_cycle;

  assign wait_for_FLAG_1_bit_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //FLAG_1_bit/s1 enable non-zero assertions, which is an e_register
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

module IN_MSB_1_bit_s1_arbitrator (
                                    // inputs:
                                     IN_MSB_1_bit_s1_irq,
                                     IN_MSB_1_bit_s1_readdata,
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_waitrequest,
                                     cpu_0_data_master_write,
                                     cpu_0_data_master_writedata,
                                     reset_n,

                                    // outputs:
                                     IN_MSB_1_bit_s1_address,
                                     IN_MSB_1_bit_s1_chipselect,
                                     IN_MSB_1_bit_s1_irq_from_sa,
                                     IN_MSB_1_bit_s1_readdata_from_sa,
                                     IN_MSB_1_bit_s1_reset_n,
                                     IN_MSB_1_bit_s1_write_n,
                                     IN_MSB_1_bit_s1_writedata,
                                     cpu_0_data_master_granted_IN_MSB_1_bit_s1,
                                     cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1,
                                     cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1,
                                     cpu_0_data_master_requests_IN_MSB_1_bit_s1,
                                     d1_IN_MSB_1_bit_s1_end_xfer
                                  )
;

  output  [  1: 0] IN_MSB_1_bit_s1_address;
  output           IN_MSB_1_bit_s1_chipselect;
  output           IN_MSB_1_bit_s1_irq_from_sa;
  output           IN_MSB_1_bit_s1_readdata_from_sa;
  output           IN_MSB_1_bit_s1_reset_n;
  output           IN_MSB_1_bit_s1_write_n;
  output           IN_MSB_1_bit_s1_writedata;
  output           cpu_0_data_master_granted_IN_MSB_1_bit_s1;
  output           cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1;
  output           cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1;
  output           cpu_0_data_master_requests_IN_MSB_1_bit_s1;
  output           d1_IN_MSB_1_bit_s1_end_xfer;
  input            IN_MSB_1_bit_s1_irq;
  input            IN_MSB_1_bit_s1_readdata;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] IN_MSB_1_bit_s1_address;
  wire             IN_MSB_1_bit_s1_allgrants;
  wire             IN_MSB_1_bit_s1_allow_new_arb_cycle;
  wire             IN_MSB_1_bit_s1_any_bursting_master_saved_grant;
  wire             IN_MSB_1_bit_s1_any_continuerequest;
  wire             IN_MSB_1_bit_s1_arb_counter_enable;
  reg              IN_MSB_1_bit_s1_arb_share_counter;
  wire             IN_MSB_1_bit_s1_arb_share_counter_next_value;
  wire             IN_MSB_1_bit_s1_arb_share_set_values;
  wire             IN_MSB_1_bit_s1_beginbursttransfer_internal;
  wire             IN_MSB_1_bit_s1_begins_xfer;
  wire             IN_MSB_1_bit_s1_chipselect;
  wire             IN_MSB_1_bit_s1_end_xfer;
  wire             IN_MSB_1_bit_s1_firsttransfer;
  wire             IN_MSB_1_bit_s1_grant_vector;
  wire             IN_MSB_1_bit_s1_in_a_read_cycle;
  wire             IN_MSB_1_bit_s1_in_a_write_cycle;
  wire             IN_MSB_1_bit_s1_irq_from_sa;
  wire             IN_MSB_1_bit_s1_master_qreq_vector;
  wire             IN_MSB_1_bit_s1_non_bursting_master_requests;
  wire             IN_MSB_1_bit_s1_readdata_from_sa;
  reg              IN_MSB_1_bit_s1_reg_firsttransfer;
  wire             IN_MSB_1_bit_s1_reset_n;
  reg              IN_MSB_1_bit_s1_slavearbiterlockenable;
  wire             IN_MSB_1_bit_s1_slavearbiterlockenable2;
  wire             IN_MSB_1_bit_s1_unreg_firsttransfer;
  wire             IN_MSB_1_bit_s1_waits_for_read;
  wire             IN_MSB_1_bit_s1_waits_for_write;
  wire             IN_MSB_1_bit_s1_write_n;
  wire             IN_MSB_1_bit_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_requests_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_saved_grant_IN_MSB_1_bit_s1;
  reg              d1_IN_MSB_1_bit_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_IN_MSB_1_bit_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 15: 0] shifted_address_to_IN_MSB_1_bit_s1_from_cpu_0_data_master;
  wire             wait_for_IN_MSB_1_bit_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~IN_MSB_1_bit_s1_end_xfer;
    end


  assign IN_MSB_1_bit_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1));
  //assign IN_MSB_1_bit_s1_readdata_from_sa = IN_MSB_1_bit_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign IN_MSB_1_bit_s1_readdata_from_sa = IN_MSB_1_bit_s1_readdata;

  assign cpu_0_data_master_requests_IN_MSB_1_bit_s1 = ({cpu_0_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9040) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //IN_MSB_1_bit_s1_arb_share_counter set values, which is an e_mux
  assign IN_MSB_1_bit_s1_arb_share_set_values = 1;

  //IN_MSB_1_bit_s1_non_bursting_master_requests mux, which is an e_mux
  assign IN_MSB_1_bit_s1_non_bursting_master_requests = cpu_0_data_master_requests_IN_MSB_1_bit_s1;

  //IN_MSB_1_bit_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign IN_MSB_1_bit_s1_any_bursting_master_saved_grant = 0;

  //IN_MSB_1_bit_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign IN_MSB_1_bit_s1_arb_share_counter_next_value = IN_MSB_1_bit_s1_firsttransfer ? (IN_MSB_1_bit_s1_arb_share_set_values - 1) : |IN_MSB_1_bit_s1_arb_share_counter ? (IN_MSB_1_bit_s1_arb_share_counter - 1) : 0;

  //IN_MSB_1_bit_s1_allgrants all slave grants, which is an e_mux
  assign IN_MSB_1_bit_s1_allgrants = |IN_MSB_1_bit_s1_grant_vector;

  //IN_MSB_1_bit_s1_end_xfer assignment, which is an e_assign
  assign IN_MSB_1_bit_s1_end_xfer = ~(IN_MSB_1_bit_s1_waits_for_read | IN_MSB_1_bit_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_IN_MSB_1_bit_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_IN_MSB_1_bit_s1 = IN_MSB_1_bit_s1_end_xfer & (~IN_MSB_1_bit_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //IN_MSB_1_bit_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign IN_MSB_1_bit_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_IN_MSB_1_bit_s1 & IN_MSB_1_bit_s1_allgrants) | (end_xfer_arb_share_counter_term_IN_MSB_1_bit_s1 & ~IN_MSB_1_bit_s1_non_bursting_master_requests);

  //IN_MSB_1_bit_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          IN_MSB_1_bit_s1_arb_share_counter <= 0;
      else if (IN_MSB_1_bit_s1_arb_counter_enable)
          IN_MSB_1_bit_s1_arb_share_counter <= IN_MSB_1_bit_s1_arb_share_counter_next_value;
    end


  //IN_MSB_1_bit_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          IN_MSB_1_bit_s1_slavearbiterlockenable <= 0;
      else if ((|IN_MSB_1_bit_s1_master_qreq_vector & end_xfer_arb_share_counter_term_IN_MSB_1_bit_s1) | (end_xfer_arb_share_counter_term_IN_MSB_1_bit_s1 & ~IN_MSB_1_bit_s1_non_bursting_master_requests))
          IN_MSB_1_bit_s1_slavearbiterlockenable <= |IN_MSB_1_bit_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master IN_MSB_1_bit/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = IN_MSB_1_bit_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //IN_MSB_1_bit_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign IN_MSB_1_bit_s1_slavearbiterlockenable2 = |IN_MSB_1_bit_s1_arb_share_counter_next_value;

  //cpu_0/data_master IN_MSB_1_bit/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = IN_MSB_1_bit_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //IN_MSB_1_bit_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign IN_MSB_1_bit_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1 = cpu_0_data_master_requests_IN_MSB_1_bit_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //IN_MSB_1_bit_s1_writedata mux, which is an e_mux
  assign IN_MSB_1_bit_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_IN_MSB_1_bit_s1 = cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1;

  //cpu_0/data_master saved-grant IN_MSB_1_bit/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_IN_MSB_1_bit_s1 = cpu_0_data_master_requests_IN_MSB_1_bit_s1;

  //allow new arb cycle for IN_MSB_1_bit/s1, which is an e_assign
  assign IN_MSB_1_bit_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign IN_MSB_1_bit_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign IN_MSB_1_bit_s1_master_qreq_vector = 1;

  //IN_MSB_1_bit_s1_reset_n assignment, which is an e_assign
  assign IN_MSB_1_bit_s1_reset_n = reset_n;

  assign IN_MSB_1_bit_s1_chipselect = cpu_0_data_master_granted_IN_MSB_1_bit_s1;
  //IN_MSB_1_bit_s1_firsttransfer first transaction, which is an e_assign
  assign IN_MSB_1_bit_s1_firsttransfer = IN_MSB_1_bit_s1_begins_xfer ? IN_MSB_1_bit_s1_unreg_firsttransfer : IN_MSB_1_bit_s1_reg_firsttransfer;

  //IN_MSB_1_bit_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign IN_MSB_1_bit_s1_unreg_firsttransfer = ~(IN_MSB_1_bit_s1_slavearbiterlockenable & IN_MSB_1_bit_s1_any_continuerequest);

  //IN_MSB_1_bit_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          IN_MSB_1_bit_s1_reg_firsttransfer <= 1'b1;
      else if (IN_MSB_1_bit_s1_begins_xfer)
          IN_MSB_1_bit_s1_reg_firsttransfer <= IN_MSB_1_bit_s1_unreg_firsttransfer;
    end


  //IN_MSB_1_bit_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign IN_MSB_1_bit_s1_beginbursttransfer_internal = IN_MSB_1_bit_s1_begins_xfer;

  //~IN_MSB_1_bit_s1_write_n assignment, which is an e_mux
  assign IN_MSB_1_bit_s1_write_n = ~(cpu_0_data_master_granted_IN_MSB_1_bit_s1 & cpu_0_data_master_write);

  assign shifted_address_to_IN_MSB_1_bit_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //IN_MSB_1_bit_s1_address mux, which is an e_mux
  assign IN_MSB_1_bit_s1_address = shifted_address_to_IN_MSB_1_bit_s1_from_cpu_0_data_master >> 2;

  //d1_IN_MSB_1_bit_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_IN_MSB_1_bit_s1_end_xfer <= 1;
      else 
        d1_IN_MSB_1_bit_s1_end_xfer <= IN_MSB_1_bit_s1_end_xfer;
    end


  //IN_MSB_1_bit_s1_waits_for_read in a cycle, which is an e_mux
  assign IN_MSB_1_bit_s1_waits_for_read = IN_MSB_1_bit_s1_in_a_read_cycle & IN_MSB_1_bit_s1_begins_xfer;

  //IN_MSB_1_bit_s1_in_a_read_cycle assignment, which is an e_assign
  assign IN_MSB_1_bit_s1_in_a_read_cycle = cpu_0_data_master_granted_IN_MSB_1_bit_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = IN_MSB_1_bit_s1_in_a_read_cycle;

  //IN_MSB_1_bit_s1_waits_for_write in a cycle, which is an e_mux
  assign IN_MSB_1_bit_s1_waits_for_write = IN_MSB_1_bit_s1_in_a_write_cycle & 0;

  //IN_MSB_1_bit_s1_in_a_write_cycle assignment, which is an e_assign
  assign IN_MSB_1_bit_s1_in_a_write_cycle = cpu_0_data_master_granted_IN_MSB_1_bit_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = IN_MSB_1_bit_s1_in_a_write_cycle;

  assign wait_for_IN_MSB_1_bit_s1_counter = 0;
  //assign IN_MSB_1_bit_s1_irq_from_sa = IN_MSB_1_bit_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign IN_MSB_1_bit_s1_irq_from_sa = IN_MSB_1_bit_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //IN_MSB_1_bit/s1 enable non-zero assertions, which is an e_register
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

module KEY1_1_bit_s1_arbitrator (
                                  // inputs:
                                   KEY1_1_bit_s1_readdata,
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_write,
                                   reset_n,

                                  // outputs:
                                   KEY1_1_bit_s1_address,
                                   KEY1_1_bit_s1_readdata_from_sa,
                                   KEY1_1_bit_s1_reset_n,
                                   cpu_0_data_master_granted_KEY1_1_bit_s1,
                                   cpu_0_data_master_qualified_request_KEY1_1_bit_s1,
                                   cpu_0_data_master_read_data_valid_KEY1_1_bit_s1,
                                   cpu_0_data_master_requests_KEY1_1_bit_s1,
                                   d1_KEY1_1_bit_s1_end_xfer
                                )
;

  output  [  1: 0] KEY1_1_bit_s1_address;
  output           KEY1_1_bit_s1_readdata_from_sa;
  output           KEY1_1_bit_s1_reset_n;
  output           cpu_0_data_master_granted_KEY1_1_bit_s1;
  output           cpu_0_data_master_qualified_request_KEY1_1_bit_s1;
  output           cpu_0_data_master_read_data_valid_KEY1_1_bit_s1;
  output           cpu_0_data_master_requests_KEY1_1_bit_s1;
  output           d1_KEY1_1_bit_s1_end_xfer;
  input            KEY1_1_bit_s1_readdata;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;

  wire    [  1: 0] KEY1_1_bit_s1_address;
  wire             KEY1_1_bit_s1_allgrants;
  wire             KEY1_1_bit_s1_allow_new_arb_cycle;
  wire             KEY1_1_bit_s1_any_bursting_master_saved_grant;
  wire             KEY1_1_bit_s1_any_continuerequest;
  wire             KEY1_1_bit_s1_arb_counter_enable;
  reg              KEY1_1_bit_s1_arb_share_counter;
  wire             KEY1_1_bit_s1_arb_share_counter_next_value;
  wire             KEY1_1_bit_s1_arb_share_set_values;
  wire             KEY1_1_bit_s1_beginbursttransfer_internal;
  wire             KEY1_1_bit_s1_begins_xfer;
  wire             KEY1_1_bit_s1_end_xfer;
  wire             KEY1_1_bit_s1_firsttransfer;
  wire             KEY1_1_bit_s1_grant_vector;
  wire             KEY1_1_bit_s1_in_a_read_cycle;
  wire             KEY1_1_bit_s1_in_a_write_cycle;
  wire             KEY1_1_bit_s1_master_qreq_vector;
  wire             KEY1_1_bit_s1_non_bursting_master_requests;
  wire             KEY1_1_bit_s1_readdata_from_sa;
  reg              KEY1_1_bit_s1_reg_firsttransfer;
  wire             KEY1_1_bit_s1_reset_n;
  reg              KEY1_1_bit_s1_slavearbiterlockenable;
  wire             KEY1_1_bit_s1_slavearbiterlockenable2;
  wire             KEY1_1_bit_s1_unreg_firsttransfer;
  wire             KEY1_1_bit_s1_waits_for_read;
  wire             KEY1_1_bit_s1_waits_for_write;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_KEY1_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_KEY1_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_KEY1_1_bit_s1;
  wire             cpu_0_data_master_requests_KEY1_1_bit_s1;
  wire             cpu_0_data_master_saved_grant_KEY1_1_bit_s1;
  reg              d1_KEY1_1_bit_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_KEY1_1_bit_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 15: 0] shifted_address_to_KEY1_1_bit_s1_from_cpu_0_data_master;
  wire             wait_for_KEY1_1_bit_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~KEY1_1_bit_s1_end_xfer;
    end


  assign KEY1_1_bit_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_KEY1_1_bit_s1));
  //assign KEY1_1_bit_s1_readdata_from_sa = KEY1_1_bit_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign KEY1_1_bit_s1_readdata_from_sa = KEY1_1_bit_s1_readdata;

  assign cpu_0_data_master_requests_KEY1_1_bit_s1 = (({cpu_0_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9030) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //KEY1_1_bit_s1_arb_share_counter set values, which is an e_mux
  assign KEY1_1_bit_s1_arb_share_set_values = 1;

  //KEY1_1_bit_s1_non_bursting_master_requests mux, which is an e_mux
  assign KEY1_1_bit_s1_non_bursting_master_requests = cpu_0_data_master_requests_KEY1_1_bit_s1;

  //KEY1_1_bit_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign KEY1_1_bit_s1_any_bursting_master_saved_grant = 0;

  //KEY1_1_bit_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign KEY1_1_bit_s1_arb_share_counter_next_value = KEY1_1_bit_s1_firsttransfer ? (KEY1_1_bit_s1_arb_share_set_values - 1) : |KEY1_1_bit_s1_arb_share_counter ? (KEY1_1_bit_s1_arb_share_counter - 1) : 0;

  //KEY1_1_bit_s1_allgrants all slave grants, which is an e_mux
  assign KEY1_1_bit_s1_allgrants = |KEY1_1_bit_s1_grant_vector;

  //KEY1_1_bit_s1_end_xfer assignment, which is an e_assign
  assign KEY1_1_bit_s1_end_xfer = ~(KEY1_1_bit_s1_waits_for_read | KEY1_1_bit_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_KEY1_1_bit_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_KEY1_1_bit_s1 = KEY1_1_bit_s1_end_xfer & (~KEY1_1_bit_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //KEY1_1_bit_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign KEY1_1_bit_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_KEY1_1_bit_s1 & KEY1_1_bit_s1_allgrants) | (end_xfer_arb_share_counter_term_KEY1_1_bit_s1 & ~KEY1_1_bit_s1_non_bursting_master_requests);

  //KEY1_1_bit_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          KEY1_1_bit_s1_arb_share_counter <= 0;
      else if (KEY1_1_bit_s1_arb_counter_enable)
          KEY1_1_bit_s1_arb_share_counter <= KEY1_1_bit_s1_arb_share_counter_next_value;
    end


  //KEY1_1_bit_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          KEY1_1_bit_s1_slavearbiterlockenable <= 0;
      else if ((|KEY1_1_bit_s1_master_qreq_vector & end_xfer_arb_share_counter_term_KEY1_1_bit_s1) | (end_xfer_arb_share_counter_term_KEY1_1_bit_s1 & ~KEY1_1_bit_s1_non_bursting_master_requests))
          KEY1_1_bit_s1_slavearbiterlockenable <= |KEY1_1_bit_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master KEY1_1_bit/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = KEY1_1_bit_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //KEY1_1_bit_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign KEY1_1_bit_s1_slavearbiterlockenable2 = |KEY1_1_bit_s1_arb_share_counter_next_value;

  //cpu_0/data_master KEY1_1_bit/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = KEY1_1_bit_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //KEY1_1_bit_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign KEY1_1_bit_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_KEY1_1_bit_s1 = cpu_0_data_master_requests_KEY1_1_bit_s1;
  //master is always granted when requested
  assign cpu_0_data_master_granted_KEY1_1_bit_s1 = cpu_0_data_master_qualified_request_KEY1_1_bit_s1;

  //cpu_0/data_master saved-grant KEY1_1_bit/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_KEY1_1_bit_s1 = cpu_0_data_master_requests_KEY1_1_bit_s1;

  //allow new arb cycle for KEY1_1_bit/s1, which is an e_assign
  assign KEY1_1_bit_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign KEY1_1_bit_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign KEY1_1_bit_s1_master_qreq_vector = 1;

  //KEY1_1_bit_s1_reset_n assignment, which is an e_assign
  assign KEY1_1_bit_s1_reset_n = reset_n;

  //KEY1_1_bit_s1_firsttransfer first transaction, which is an e_assign
  assign KEY1_1_bit_s1_firsttransfer = KEY1_1_bit_s1_begins_xfer ? KEY1_1_bit_s1_unreg_firsttransfer : KEY1_1_bit_s1_reg_firsttransfer;

  //KEY1_1_bit_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign KEY1_1_bit_s1_unreg_firsttransfer = ~(KEY1_1_bit_s1_slavearbiterlockenable & KEY1_1_bit_s1_any_continuerequest);

  //KEY1_1_bit_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          KEY1_1_bit_s1_reg_firsttransfer <= 1'b1;
      else if (KEY1_1_bit_s1_begins_xfer)
          KEY1_1_bit_s1_reg_firsttransfer <= KEY1_1_bit_s1_unreg_firsttransfer;
    end


  //KEY1_1_bit_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign KEY1_1_bit_s1_beginbursttransfer_internal = KEY1_1_bit_s1_begins_xfer;

  assign shifted_address_to_KEY1_1_bit_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //KEY1_1_bit_s1_address mux, which is an e_mux
  assign KEY1_1_bit_s1_address = shifted_address_to_KEY1_1_bit_s1_from_cpu_0_data_master >> 2;

  //d1_KEY1_1_bit_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_KEY1_1_bit_s1_end_xfer <= 1;
      else 
        d1_KEY1_1_bit_s1_end_xfer <= KEY1_1_bit_s1_end_xfer;
    end


  //KEY1_1_bit_s1_waits_for_read in a cycle, which is an e_mux
  assign KEY1_1_bit_s1_waits_for_read = KEY1_1_bit_s1_in_a_read_cycle & KEY1_1_bit_s1_begins_xfer;

  //KEY1_1_bit_s1_in_a_read_cycle assignment, which is an e_assign
  assign KEY1_1_bit_s1_in_a_read_cycle = cpu_0_data_master_granted_KEY1_1_bit_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = KEY1_1_bit_s1_in_a_read_cycle;

  //KEY1_1_bit_s1_waits_for_write in a cycle, which is an e_mux
  assign KEY1_1_bit_s1_waits_for_write = KEY1_1_bit_s1_in_a_write_cycle & 0;

  //KEY1_1_bit_s1_in_a_write_cycle assignment, which is an e_assign
  assign KEY1_1_bit_s1_in_a_write_cycle = cpu_0_data_master_granted_KEY1_1_bit_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = KEY1_1_bit_s1_in_a_write_cycle;

  assign wait_for_KEY1_1_bit_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //KEY1_1_bit/s1 enable non-zero assertions, which is an e_register
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

module LEDG_1_bit_s1_arbitrator (
                                  // inputs:
                                   LEDG_1_bit_s1_readdata,
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_waitrequest,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   reset_n,

                                  // outputs:
                                   LEDG_1_bit_s1_address,
                                   LEDG_1_bit_s1_chipselect,
                                   LEDG_1_bit_s1_readdata_from_sa,
                                   LEDG_1_bit_s1_reset_n,
                                   LEDG_1_bit_s1_write_n,
                                   LEDG_1_bit_s1_writedata,
                                   cpu_0_data_master_granted_LEDG_1_bit_s1,
                                   cpu_0_data_master_qualified_request_LEDG_1_bit_s1,
                                   cpu_0_data_master_read_data_valid_LEDG_1_bit_s1,
                                   cpu_0_data_master_requests_LEDG_1_bit_s1,
                                   d1_LEDG_1_bit_s1_end_xfer
                                )
;

  output  [  1: 0] LEDG_1_bit_s1_address;
  output           LEDG_1_bit_s1_chipselect;
  output           LEDG_1_bit_s1_readdata_from_sa;
  output           LEDG_1_bit_s1_reset_n;
  output           LEDG_1_bit_s1_write_n;
  output           LEDG_1_bit_s1_writedata;
  output           cpu_0_data_master_granted_LEDG_1_bit_s1;
  output           cpu_0_data_master_qualified_request_LEDG_1_bit_s1;
  output           cpu_0_data_master_read_data_valid_LEDG_1_bit_s1;
  output           cpu_0_data_master_requests_LEDG_1_bit_s1;
  output           d1_LEDG_1_bit_s1_end_xfer;
  input            LEDG_1_bit_s1_readdata;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] LEDG_1_bit_s1_address;
  wire             LEDG_1_bit_s1_allgrants;
  wire             LEDG_1_bit_s1_allow_new_arb_cycle;
  wire             LEDG_1_bit_s1_any_bursting_master_saved_grant;
  wire             LEDG_1_bit_s1_any_continuerequest;
  wire             LEDG_1_bit_s1_arb_counter_enable;
  reg              LEDG_1_bit_s1_arb_share_counter;
  wire             LEDG_1_bit_s1_arb_share_counter_next_value;
  wire             LEDG_1_bit_s1_arb_share_set_values;
  wire             LEDG_1_bit_s1_beginbursttransfer_internal;
  wire             LEDG_1_bit_s1_begins_xfer;
  wire             LEDG_1_bit_s1_chipselect;
  wire             LEDG_1_bit_s1_end_xfer;
  wire             LEDG_1_bit_s1_firsttransfer;
  wire             LEDG_1_bit_s1_grant_vector;
  wire             LEDG_1_bit_s1_in_a_read_cycle;
  wire             LEDG_1_bit_s1_in_a_write_cycle;
  wire             LEDG_1_bit_s1_master_qreq_vector;
  wire             LEDG_1_bit_s1_non_bursting_master_requests;
  wire             LEDG_1_bit_s1_readdata_from_sa;
  reg              LEDG_1_bit_s1_reg_firsttransfer;
  wire             LEDG_1_bit_s1_reset_n;
  reg              LEDG_1_bit_s1_slavearbiterlockenable;
  wire             LEDG_1_bit_s1_slavearbiterlockenable2;
  wire             LEDG_1_bit_s1_unreg_firsttransfer;
  wire             LEDG_1_bit_s1_waits_for_read;
  wire             LEDG_1_bit_s1_waits_for_write;
  wire             LEDG_1_bit_s1_write_n;
  wire             LEDG_1_bit_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_LEDG_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_LEDG_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_LEDG_1_bit_s1;
  wire             cpu_0_data_master_requests_LEDG_1_bit_s1;
  wire             cpu_0_data_master_saved_grant_LEDG_1_bit_s1;
  reg              d1_LEDG_1_bit_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_LEDG_1_bit_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 15: 0] shifted_address_to_LEDG_1_bit_s1_from_cpu_0_data_master;
  wire             wait_for_LEDG_1_bit_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~LEDG_1_bit_s1_end_xfer;
    end


  assign LEDG_1_bit_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_LEDG_1_bit_s1));
  //assign LEDG_1_bit_s1_readdata_from_sa = LEDG_1_bit_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign LEDG_1_bit_s1_readdata_from_sa = LEDG_1_bit_s1_readdata;

  assign cpu_0_data_master_requests_LEDG_1_bit_s1 = ({cpu_0_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9020) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //LEDG_1_bit_s1_arb_share_counter set values, which is an e_mux
  assign LEDG_1_bit_s1_arb_share_set_values = 1;

  //LEDG_1_bit_s1_non_bursting_master_requests mux, which is an e_mux
  assign LEDG_1_bit_s1_non_bursting_master_requests = cpu_0_data_master_requests_LEDG_1_bit_s1;

  //LEDG_1_bit_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign LEDG_1_bit_s1_any_bursting_master_saved_grant = 0;

  //LEDG_1_bit_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign LEDG_1_bit_s1_arb_share_counter_next_value = LEDG_1_bit_s1_firsttransfer ? (LEDG_1_bit_s1_arb_share_set_values - 1) : |LEDG_1_bit_s1_arb_share_counter ? (LEDG_1_bit_s1_arb_share_counter - 1) : 0;

  //LEDG_1_bit_s1_allgrants all slave grants, which is an e_mux
  assign LEDG_1_bit_s1_allgrants = |LEDG_1_bit_s1_grant_vector;

  //LEDG_1_bit_s1_end_xfer assignment, which is an e_assign
  assign LEDG_1_bit_s1_end_xfer = ~(LEDG_1_bit_s1_waits_for_read | LEDG_1_bit_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_LEDG_1_bit_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_LEDG_1_bit_s1 = LEDG_1_bit_s1_end_xfer & (~LEDG_1_bit_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //LEDG_1_bit_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign LEDG_1_bit_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_LEDG_1_bit_s1 & LEDG_1_bit_s1_allgrants) | (end_xfer_arb_share_counter_term_LEDG_1_bit_s1 & ~LEDG_1_bit_s1_non_bursting_master_requests);

  //LEDG_1_bit_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LEDG_1_bit_s1_arb_share_counter <= 0;
      else if (LEDG_1_bit_s1_arb_counter_enable)
          LEDG_1_bit_s1_arb_share_counter <= LEDG_1_bit_s1_arb_share_counter_next_value;
    end


  //LEDG_1_bit_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LEDG_1_bit_s1_slavearbiterlockenable <= 0;
      else if ((|LEDG_1_bit_s1_master_qreq_vector & end_xfer_arb_share_counter_term_LEDG_1_bit_s1) | (end_xfer_arb_share_counter_term_LEDG_1_bit_s1 & ~LEDG_1_bit_s1_non_bursting_master_requests))
          LEDG_1_bit_s1_slavearbiterlockenable <= |LEDG_1_bit_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master LEDG_1_bit/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = LEDG_1_bit_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //LEDG_1_bit_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign LEDG_1_bit_s1_slavearbiterlockenable2 = |LEDG_1_bit_s1_arb_share_counter_next_value;

  //cpu_0/data_master LEDG_1_bit/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = LEDG_1_bit_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //LEDG_1_bit_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign LEDG_1_bit_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_LEDG_1_bit_s1 = cpu_0_data_master_requests_LEDG_1_bit_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //LEDG_1_bit_s1_writedata mux, which is an e_mux
  assign LEDG_1_bit_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_LEDG_1_bit_s1 = cpu_0_data_master_qualified_request_LEDG_1_bit_s1;

  //cpu_0/data_master saved-grant LEDG_1_bit/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_LEDG_1_bit_s1 = cpu_0_data_master_requests_LEDG_1_bit_s1;

  //allow new arb cycle for LEDG_1_bit/s1, which is an e_assign
  assign LEDG_1_bit_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign LEDG_1_bit_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign LEDG_1_bit_s1_master_qreq_vector = 1;

  //LEDG_1_bit_s1_reset_n assignment, which is an e_assign
  assign LEDG_1_bit_s1_reset_n = reset_n;

  assign LEDG_1_bit_s1_chipselect = cpu_0_data_master_granted_LEDG_1_bit_s1;
  //LEDG_1_bit_s1_firsttransfer first transaction, which is an e_assign
  assign LEDG_1_bit_s1_firsttransfer = LEDG_1_bit_s1_begins_xfer ? LEDG_1_bit_s1_unreg_firsttransfer : LEDG_1_bit_s1_reg_firsttransfer;

  //LEDG_1_bit_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign LEDG_1_bit_s1_unreg_firsttransfer = ~(LEDG_1_bit_s1_slavearbiterlockenable & LEDG_1_bit_s1_any_continuerequest);

  //LEDG_1_bit_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LEDG_1_bit_s1_reg_firsttransfer <= 1'b1;
      else if (LEDG_1_bit_s1_begins_xfer)
          LEDG_1_bit_s1_reg_firsttransfer <= LEDG_1_bit_s1_unreg_firsttransfer;
    end


  //LEDG_1_bit_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign LEDG_1_bit_s1_beginbursttransfer_internal = LEDG_1_bit_s1_begins_xfer;

  //~LEDG_1_bit_s1_write_n assignment, which is an e_mux
  assign LEDG_1_bit_s1_write_n = ~(cpu_0_data_master_granted_LEDG_1_bit_s1 & cpu_0_data_master_write);

  assign shifted_address_to_LEDG_1_bit_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //LEDG_1_bit_s1_address mux, which is an e_mux
  assign LEDG_1_bit_s1_address = shifted_address_to_LEDG_1_bit_s1_from_cpu_0_data_master >> 2;

  //d1_LEDG_1_bit_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_LEDG_1_bit_s1_end_xfer <= 1;
      else 
        d1_LEDG_1_bit_s1_end_xfer <= LEDG_1_bit_s1_end_xfer;
    end


  //LEDG_1_bit_s1_waits_for_read in a cycle, which is an e_mux
  assign LEDG_1_bit_s1_waits_for_read = LEDG_1_bit_s1_in_a_read_cycle & LEDG_1_bit_s1_begins_xfer;

  //LEDG_1_bit_s1_in_a_read_cycle assignment, which is an e_assign
  assign LEDG_1_bit_s1_in_a_read_cycle = cpu_0_data_master_granted_LEDG_1_bit_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = LEDG_1_bit_s1_in_a_read_cycle;

  //LEDG_1_bit_s1_waits_for_write in a cycle, which is an e_mux
  assign LEDG_1_bit_s1_waits_for_write = LEDG_1_bit_s1_in_a_write_cycle & 0;

  //LEDG_1_bit_s1_in_a_write_cycle assignment, which is an e_assign
  assign LEDG_1_bit_s1_in_a_write_cycle = cpu_0_data_master_granted_LEDG_1_bit_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = LEDG_1_bit_s1_in_a_write_cycle;

  assign wait_for_LEDG_1_bit_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //LEDG_1_bit/s1 enable non-zero assertions, which is an e_register
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

module OUT_LEDR_8_Bits_s1_arbitrator (
                                       // inputs:
                                        OUT_LEDR_8_Bits_s1_readdata,
                                        clk,
                                        cpu_0_data_master_address_to_slave,
                                        cpu_0_data_master_byteenable,
                                        cpu_0_data_master_read,
                                        cpu_0_data_master_waitrequest,
                                        cpu_0_data_master_write,
                                        cpu_0_data_master_writedata,
                                        reset_n,

                                       // outputs:
                                        OUT_LEDR_8_Bits_s1_address,
                                        OUT_LEDR_8_Bits_s1_chipselect,
                                        OUT_LEDR_8_Bits_s1_readdata_from_sa,
                                        OUT_LEDR_8_Bits_s1_reset_n,
                                        OUT_LEDR_8_Bits_s1_write_n,
                                        OUT_LEDR_8_Bits_s1_writedata,
                                        cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1,
                                        cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1,
                                        cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1,
                                        cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1,
                                        d1_OUT_LEDR_8_Bits_s1_end_xfer
                                     )
;

  output  [  1: 0] OUT_LEDR_8_Bits_s1_address;
  output           OUT_LEDR_8_Bits_s1_chipselect;
  output  [  7: 0] OUT_LEDR_8_Bits_s1_readdata_from_sa;
  output           OUT_LEDR_8_Bits_s1_reset_n;
  output           OUT_LEDR_8_Bits_s1_write_n;
  output  [  7: 0] OUT_LEDR_8_Bits_s1_writedata;
  output           cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1;
  output           cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1;
  output           cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1;
  output           cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1;
  output           d1_OUT_LEDR_8_Bits_s1_end_xfer;
  input   [  7: 0] OUT_LEDR_8_Bits_s1_readdata;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] OUT_LEDR_8_Bits_s1_address;
  wire             OUT_LEDR_8_Bits_s1_allgrants;
  wire             OUT_LEDR_8_Bits_s1_allow_new_arb_cycle;
  wire             OUT_LEDR_8_Bits_s1_any_bursting_master_saved_grant;
  wire             OUT_LEDR_8_Bits_s1_any_continuerequest;
  wire             OUT_LEDR_8_Bits_s1_arb_counter_enable;
  reg              OUT_LEDR_8_Bits_s1_arb_share_counter;
  wire             OUT_LEDR_8_Bits_s1_arb_share_counter_next_value;
  wire             OUT_LEDR_8_Bits_s1_arb_share_set_values;
  wire             OUT_LEDR_8_Bits_s1_beginbursttransfer_internal;
  wire             OUT_LEDR_8_Bits_s1_begins_xfer;
  wire             OUT_LEDR_8_Bits_s1_chipselect;
  wire             OUT_LEDR_8_Bits_s1_end_xfer;
  wire             OUT_LEDR_8_Bits_s1_firsttransfer;
  wire             OUT_LEDR_8_Bits_s1_grant_vector;
  wire             OUT_LEDR_8_Bits_s1_in_a_read_cycle;
  wire             OUT_LEDR_8_Bits_s1_in_a_write_cycle;
  wire             OUT_LEDR_8_Bits_s1_master_qreq_vector;
  wire             OUT_LEDR_8_Bits_s1_non_bursting_master_requests;
  wire             OUT_LEDR_8_Bits_s1_pretend_byte_enable;
  wire    [  7: 0] OUT_LEDR_8_Bits_s1_readdata_from_sa;
  reg              OUT_LEDR_8_Bits_s1_reg_firsttransfer;
  wire             OUT_LEDR_8_Bits_s1_reset_n;
  reg              OUT_LEDR_8_Bits_s1_slavearbiterlockenable;
  wire             OUT_LEDR_8_Bits_s1_slavearbiterlockenable2;
  wire             OUT_LEDR_8_Bits_s1_unreg_firsttransfer;
  wire             OUT_LEDR_8_Bits_s1_waits_for_read;
  wire             OUT_LEDR_8_Bits_s1_waits_for_write;
  wire             OUT_LEDR_8_Bits_s1_write_n;
  wire    [  7: 0] OUT_LEDR_8_Bits_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_saved_grant_OUT_LEDR_8_Bits_s1;
  reg              d1_OUT_LEDR_8_Bits_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_OUT_LEDR_8_Bits_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 15: 0] shifted_address_to_OUT_LEDR_8_Bits_s1_from_cpu_0_data_master;
  wire             wait_for_OUT_LEDR_8_Bits_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~OUT_LEDR_8_Bits_s1_end_xfer;
    end


  assign OUT_LEDR_8_Bits_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1));
  //assign OUT_LEDR_8_Bits_s1_readdata_from_sa = OUT_LEDR_8_Bits_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_readdata_from_sa = OUT_LEDR_8_Bits_s1_readdata;

  assign cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1 = ({cpu_0_data_master_address_to_slave[15 : 4] , 4'b0} == 16'h9000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //OUT_LEDR_8_Bits_s1_arb_share_counter set values, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_arb_share_set_values = 1;

  //OUT_LEDR_8_Bits_s1_non_bursting_master_requests mux, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_non_bursting_master_requests = cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1;

  //OUT_LEDR_8_Bits_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_any_bursting_master_saved_grant = 0;

  //OUT_LEDR_8_Bits_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_arb_share_counter_next_value = OUT_LEDR_8_Bits_s1_firsttransfer ? (OUT_LEDR_8_Bits_s1_arb_share_set_values - 1) : |OUT_LEDR_8_Bits_s1_arb_share_counter ? (OUT_LEDR_8_Bits_s1_arb_share_counter - 1) : 0;

  //OUT_LEDR_8_Bits_s1_allgrants all slave grants, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_allgrants = |OUT_LEDR_8_Bits_s1_grant_vector;

  //OUT_LEDR_8_Bits_s1_end_xfer assignment, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_end_xfer = ~(OUT_LEDR_8_Bits_s1_waits_for_read | OUT_LEDR_8_Bits_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_OUT_LEDR_8_Bits_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_OUT_LEDR_8_Bits_s1 = OUT_LEDR_8_Bits_s1_end_xfer & (~OUT_LEDR_8_Bits_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //OUT_LEDR_8_Bits_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_OUT_LEDR_8_Bits_s1 & OUT_LEDR_8_Bits_s1_allgrants) | (end_xfer_arb_share_counter_term_OUT_LEDR_8_Bits_s1 & ~OUT_LEDR_8_Bits_s1_non_bursting_master_requests);

  //OUT_LEDR_8_Bits_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          OUT_LEDR_8_Bits_s1_arb_share_counter <= 0;
      else if (OUT_LEDR_8_Bits_s1_arb_counter_enable)
          OUT_LEDR_8_Bits_s1_arb_share_counter <= OUT_LEDR_8_Bits_s1_arb_share_counter_next_value;
    end


  //OUT_LEDR_8_Bits_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          OUT_LEDR_8_Bits_s1_slavearbiterlockenable <= 0;
      else if ((|OUT_LEDR_8_Bits_s1_master_qreq_vector & end_xfer_arb_share_counter_term_OUT_LEDR_8_Bits_s1) | (end_xfer_arb_share_counter_term_OUT_LEDR_8_Bits_s1 & ~OUT_LEDR_8_Bits_s1_non_bursting_master_requests))
          OUT_LEDR_8_Bits_s1_slavearbiterlockenable <= |OUT_LEDR_8_Bits_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master OUT_LEDR_8_Bits/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = OUT_LEDR_8_Bits_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //OUT_LEDR_8_Bits_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_slavearbiterlockenable2 = |OUT_LEDR_8_Bits_s1_arb_share_counter_next_value;

  //cpu_0/data_master OUT_LEDR_8_Bits/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = OUT_LEDR_8_Bits_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //OUT_LEDR_8_Bits_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1 = cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //OUT_LEDR_8_Bits_s1_writedata mux, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1 = cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1;

  //cpu_0/data_master saved-grant OUT_LEDR_8_Bits/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_OUT_LEDR_8_Bits_s1 = cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1;

  //allow new arb cycle for OUT_LEDR_8_Bits/s1, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign OUT_LEDR_8_Bits_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign OUT_LEDR_8_Bits_s1_master_qreq_vector = 1;

  //OUT_LEDR_8_Bits_s1_reset_n assignment, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_reset_n = reset_n;

  assign OUT_LEDR_8_Bits_s1_chipselect = cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1;
  //OUT_LEDR_8_Bits_s1_firsttransfer first transaction, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_firsttransfer = OUT_LEDR_8_Bits_s1_begins_xfer ? OUT_LEDR_8_Bits_s1_unreg_firsttransfer : OUT_LEDR_8_Bits_s1_reg_firsttransfer;

  //OUT_LEDR_8_Bits_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_unreg_firsttransfer = ~(OUT_LEDR_8_Bits_s1_slavearbiterlockenable & OUT_LEDR_8_Bits_s1_any_continuerequest);

  //OUT_LEDR_8_Bits_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          OUT_LEDR_8_Bits_s1_reg_firsttransfer <= 1'b1;
      else if (OUT_LEDR_8_Bits_s1_begins_xfer)
          OUT_LEDR_8_Bits_s1_reg_firsttransfer <= OUT_LEDR_8_Bits_s1_unreg_firsttransfer;
    end


  //OUT_LEDR_8_Bits_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_beginbursttransfer_internal = OUT_LEDR_8_Bits_s1_begins_xfer;

  //~OUT_LEDR_8_Bits_s1_write_n assignment, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_write_n = ~(((cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1 & cpu_0_data_master_write)) & OUT_LEDR_8_Bits_s1_pretend_byte_enable);

  assign shifted_address_to_OUT_LEDR_8_Bits_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //OUT_LEDR_8_Bits_s1_address mux, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_address = shifted_address_to_OUT_LEDR_8_Bits_s1_from_cpu_0_data_master >> 2;

  //d1_OUT_LEDR_8_Bits_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_OUT_LEDR_8_Bits_s1_end_xfer <= 1;
      else 
        d1_OUT_LEDR_8_Bits_s1_end_xfer <= OUT_LEDR_8_Bits_s1_end_xfer;
    end


  //OUT_LEDR_8_Bits_s1_waits_for_read in a cycle, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_waits_for_read = OUT_LEDR_8_Bits_s1_in_a_read_cycle & OUT_LEDR_8_Bits_s1_begins_xfer;

  //OUT_LEDR_8_Bits_s1_in_a_read_cycle assignment, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_in_a_read_cycle = cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = OUT_LEDR_8_Bits_s1_in_a_read_cycle;

  //OUT_LEDR_8_Bits_s1_waits_for_write in a cycle, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_waits_for_write = OUT_LEDR_8_Bits_s1_in_a_write_cycle & 0;

  //OUT_LEDR_8_Bits_s1_in_a_write_cycle assignment, which is an e_assign
  assign OUT_LEDR_8_Bits_s1_in_a_write_cycle = cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = OUT_LEDR_8_Bits_s1_in_a_write_cycle;

  assign wait_for_OUT_LEDR_8_Bits_s1_counter = 0;
  //OUT_LEDR_8_Bits_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign OUT_LEDR_8_Bits_s1_pretend_byte_enable = (cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //OUT_LEDR_8_Bits/s1 enable non-zero assertions, which is an e_register
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

module RAM_s1_arbitrator (
                           // inputs:
                            RAM_s1_readdata,
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
                            RAM_s1_address,
                            RAM_s1_byteenable,
                            RAM_s1_chipselect,
                            RAM_s1_clken,
                            RAM_s1_readdata_from_sa,
                            RAM_s1_reset,
                            RAM_s1_write,
                            RAM_s1_writedata,
                            cpu_0_data_master_granted_RAM_s1,
                            cpu_0_data_master_qualified_request_RAM_s1,
                            cpu_0_data_master_read_data_valid_RAM_s1,
                            cpu_0_data_master_requests_RAM_s1,
                            cpu_0_instruction_master_granted_RAM_s1,
                            cpu_0_instruction_master_qualified_request_RAM_s1,
                            cpu_0_instruction_master_read_data_valid_RAM_s1,
                            cpu_0_instruction_master_requests_RAM_s1,
                            d1_RAM_s1_end_xfer,
                            registered_cpu_0_data_master_read_data_valid_RAM_s1
                         )
;

  output  [ 10: 0] RAM_s1_address;
  output  [  3: 0] RAM_s1_byteenable;
  output           RAM_s1_chipselect;
  output           RAM_s1_clken;
  output  [ 31: 0] RAM_s1_readdata_from_sa;
  output           RAM_s1_reset;
  output           RAM_s1_write;
  output  [ 31: 0] RAM_s1_writedata;
  output           cpu_0_data_master_granted_RAM_s1;
  output           cpu_0_data_master_qualified_request_RAM_s1;
  output           cpu_0_data_master_read_data_valid_RAM_s1;
  output           cpu_0_data_master_requests_RAM_s1;
  output           cpu_0_instruction_master_granted_RAM_s1;
  output           cpu_0_instruction_master_qualified_request_RAM_s1;
  output           cpu_0_instruction_master_read_data_valid_RAM_s1;
  output           cpu_0_instruction_master_requests_RAM_s1;
  output           d1_RAM_s1_end_xfer;
  output           registered_cpu_0_data_master_read_data_valid_RAM_s1;
  input   [ 31: 0] RAM_s1_readdata;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 15: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [ 10: 0] RAM_s1_address;
  wire             RAM_s1_allgrants;
  wire             RAM_s1_allow_new_arb_cycle;
  wire             RAM_s1_any_bursting_master_saved_grant;
  wire             RAM_s1_any_continuerequest;
  reg     [  1: 0] RAM_s1_arb_addend;
  wire             RAM_s1_arb_counter_enable;
  reg              RAM_s1_arb_share_counter;
  wire             RAM_s1_arb_share_counter_next_value;
  wire             RAM_s1_arb_share_set_values;
  wire    [  1: 0] RAM_s1_arb_winner;
  wire             RAM_s1_arbitration_holdoff_internal;
  wire             RAM_s1_beginbursttransfer_internal;
  wire             RAM_s1_begins_xfer;
  wire    [  3: 0] RAM_s1_byteenable;
  wire             RAM_s1_chipselect;
  wire    [  3: 0] RAM_s1_chosen_master_double_vector;
  wire    [  1: 0] RAM_s1_chosen_master_rot_left;
  wire             RAM_s1_clken;
  wire             RAM_s1_end_xfer;
  wire             RAM_s1_firsttransfer;
  wire    [  1: 0] RAM_s1_grant_vector;
  wire             RAM_s1_in_a_read_cycle;
  wire             RAM_s1_in_a_write_cycle;
  wire    [  1: 0] RAM_s1_master_qreq_vector;
  wire             RAM_s1_non_bursting_master_requests;
  wire    [ 31: 0] RAM_s1_readdata_from_sa;
  reg              RAM_s1_reg_firsttransfer;
  wire             RAM_s1_reset;
  reg     [  1: 0] RAM_s1_saved_chosen_master_vector;
  reg              RAM_s1_slavearbiterlockenable;
  wire             RAM_s1_slavearbiterlockenable2;
  wire             RAM_s1_unreg_firsttransfer;
  wire             RAM_s1_waits_for_read;
  wire             RAM_s1_waits_for_write;
  wire             RAM_s1_write;
  wire    [ 31: 0] RAM_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_RAM_s1;
  wire             cpu_0_data_master_qualified_request_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_RAM_s1;
  reg              cpu_0_data_master_read_data_valid_RAM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_RAM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_RAM_s1;
  wire             cpu_0_data_master_saved_grant_RAM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_RAM_s1;
  reg              cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_RAM_s1;
  wire             cpu_0_instruction_master_saved_grant_RAM_s1;
  reg              d1_RAM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_RAM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_RAM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_RAM_s1;
  wire             p1_cpu_0_data_master_read_data_valid_RAM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_RAM_s1;
  wire    [ 15: 0] shifted_address_to_RAM_s1_from_cpu_0_data_master;
  wire    [ 15: 0] shifted_address_to_RAM_s1_from_cpu_0_instruction_master;
  wire             wait_for_RAM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~RAM_s1_end_xfer;
    end


  assign RAM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_RAM_s1 | cpu_0_instruction_master_qualified_request_RAM_s1));
  //assign RAM_s1_readdata_from_sa = RAM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign RAM_s1_readdata_from_sa = RAM_s1_readdata;

  assign cpu_0_data_master_requests_RAM_s1 = ({cpu_0_data_master_address_to_slave[15 : 13] , 13'b0} == 16'h6000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_RAM_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_RAM_s1 = cpu_0_data_master_read_data_valid_RAM_s1_shift_register_in;

  //RAM_s1_arb_share_counter set values, which is an e_mux
  assign RAM_s1_arb_share_set_values = 1;

  //RAM_s1_non_bursting_master_requests mux, which is an e_mux
  assign RAM_s1_non_bursting_master_requests = cpu_0_data_master_requests_RAM_s1 |
    cpu_0_instruction_master_requests_RAM_s1 |
    cpu_0_data_master_requests_RAM_s1 |
    cpu_0_instruction_master_requests_RAM_s1;

  //RAM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign RAM_s1_any_bursting_master_saved_grant = 0;

  //RAM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign RAM_s1_arb_share_counter_next_value = RAM_s1_firsttransfer ? (RAM_s1_arb_share_set_values - 1) : |RAM_s1_arb_share_counter ? (RAM_s1_arb_share_counter - 1) : 0;

  //RAM_s1_allgrants all slave grants, which is an e_mux
  assign RAM_s1_allgrants = (|RAM_s1_grant_vector) |
    (|RAM_s1_grant_vector) |
    (|RAM_s1_grant_vector) |
    (|RAM_s1_grant_vector);

  //RAM_s1_end_xfer assignment, which is an e_assign
  assign RAM_s1_end_xfer = ~(RAM_s1_waits_for_read | RAM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_RAM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_RAM_s1 = RAM_s1_end_xfer & (~RAM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //RAM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign RAM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_RAM_s1 & RAM_s1_allgrants) | (end_xfer_arb_share_counter_term_RAM_s1 & ~RAM_s1_non_bursting_master_requests);

  //RAM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RAM_s1_arb_share_counter <= 0;
      else if (RAM_s1_arb_counter_enable)
          RAM_s1_arb_share_counter <= RAM_s1_arb_share_counter_next_value;
    end


  //RAM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RAM_s1_slavearbiterlockenable <= 0;
      else if ((|RAM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_RAM_s1) | (end_xfer_arb_share_counter_term_RAM_s1 & ~RAM_s1_non_bursting_master_requests))
          RAM_s1_slavearbiterlockenable <= |RAM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = RAM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //RAM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign RAM_s1_slavearbiterlockenable2 = |RAM_s1_arb_share_counter_next_value;

  //cpu_0/data_master RAM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = RAM_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = RAM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master RAM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = RAM_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_RAM_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_RAM_s1 <= cpu_0_instruction_master_saved_grant_RAM_s1 ? 1 : (RAM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_RAM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_RAM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_RAM_s1 & cpu_0_instruction_master_requests_RAM_s1;

  //RAM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign RAM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_RAM_s1 = cpu_0_data_master_requests_RAM_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_RAM_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_RAM_s1_shift_register_in = cpu_0_data_master_granted_RAM_s1 & cpu_0_data_master_read & ~RAM_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_RAM_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_RAM_s1_shift_register = {cpu_0_data_master_read_data_valid_RAM_s1_shift_register, cpu_0_data_master_read_data_valid_RAM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_RAM_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_RAM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_RAM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_RAM_s1 = cpu_0_data_master_read_data_valid_RAM_s1_shift_register;

  //RAM_s1_writedata mux, which is an e_mux
  assign RAM_s1_writedata = cpu_0_data_master_writedata;

  //mux RAM_s1_clken, which is an e_mux
  assign RAM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_RAM_s1 = (({cpu_0_instruction_master_address_to_slave[15 : 13] , 13'b0} == 16'h6000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_RAM_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_RAM_s1 <= cpu_0_data_master_saved_grant_RAM_s1 ? 1 : (RAM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_RAM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_RAM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_RAM_s1 & cpu_0_data_master_requests_RAM_s1;

  assign cpu_0_instruction_master_qualified_request_RAM_s1 = cpu_0_instruction_master_requests_RAM_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register_in = cpu_0_instruction_master_granted_RAM_s1 & cpu_0_instruction_master_read & ~RAM_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register, cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_RAM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_RAM_s1 = cpu_0_instruction_master_read_data_valid_RAM_s1_shift_register;

  //allow new arb cycle for RAM/s1, which is an e_assign
  assign RAM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for RAM/s1, which is an e_assign
  assign RAM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_RAM_s1;

  //cpu_0/instruction_master grant RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_RAM_s1 = RAM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_RAM_s1 = RAM_s1_arb_winner[0] && cpu_0_instruction_master_requests_RAM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for RAM/s1, which is an e_assign
  assign RAM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_RAM_s1;

  //cpu_0/data_master grant RAM/s1, which is an e_assign
  assign cpu_0_data_master_granted_RAM_s1 = RAM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant RAM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_RAM_s1 = RAM_s1_arb_winner[1] && cpu_0_data_master_requests_RAM_s1;

  //RAM/s1 chosen-master double-vector, which is an e_assign
  assign RAM_s1_chosen_master_double_vector = {RAM_s1_master_qreq_vector, RAM_s1_master_qreq_vector} & ({~RAM_s1_master_qreq_vector, ~RAM_s1_master_qreq_vector} + RAM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign RAM_s1_arb_winner = (RAM_s1_allow_new_arb_cycle & | RAM_s1_grant_vector) ? RAM_s1_grant_vector : RAM_s1_saved_chosen_master_vector;

  //saved RAM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RAM_s1_saved_chosen_master_vector <= 0;
      else if (RAM_s1_allow_new_arb_cycle)
          RAM_s1_saved_chosen_master_vector <= |RAM_s1_grant_vector ? RAM_s1_grant_vector : RAM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign RAM_s1_grant_vector = {(RAM_s1_chosen_master_double_vector[1] | RAM_s1_chosen_master_double_vector[3]),
    (RAM_s1_chosen_master_double_vector[0] | RAM_s1_chosen_master_double_vector[2])};

  //RAM/s1 chosen master rotated left, which is an e_assign
  assign RAM_s1_chosen_master_rot_left = (RAM_s1_arb_winner << 1) ? (RAM_s1_arb_winner << 1) : 1;

  //RAM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RAM_s1_arb_addend <= 1;
      else if (|RAM_s1_grant_vector)
          RAM_s1_arb_addend <= RAM_s1_end_xfer? RAM_s1_chosen_master_rot_left : RAM_s1_grant_vector;
    end


  //~RAM_s1_reset assignment, which is an e_assign
  assign RAM_s1_reset = ~reset_n;

  assign RAM_s1_chipselect = cpu_0_data_master_granted_RAM_s1 | cpu_0_instruction_master_granted_RAM_s1;
  //RAM_s1_firsttransfer first transaction, which is an e_assign
  assign RAM_s1_firsttransfer = RAM_s1_begins_xfer ? RAM_s1_unreg_firsttransfer : RAM_s1_reg_firsttransfer;

  //RAM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign RAM_s1_unreg_firsttransfer = ~(RAM_s1_slavearbiterlockenable & RAM_s1_any_continuerequest);

  //RAM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RAM_s1_reg_firsttransfer <= 1'b1;
      else if (RAM_s1_begins_xfer)
          RAM_s1_reg_firsttransfer <= RAM_s1_unreg_firsttransfer;
    end


  //RAM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign RAM_s1_beginbursttransfer_internal = RAM_s1_begins_xfer;

  //RAM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign RAM_s1_arbitration_holdoff_internal = RAM_s1_begins_xfer & RAM_s1_firsttransfer;

  //RAM_s1_write assignment, which is an e_mux
  assign RAM_s1_write = cpu_0_data_master_granted_RAM_s1 & cpu_0_data_master_write;

  assign shifted_address_to_RAM_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //RAM_s1_address mux, which is an e_mux
  assign RAM_s1_address = (cpu_0_data_master_granted_RAM_s1)? (shifted_address_to_RAM_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_RAM_s1_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_RAM_s1_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_RAM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_RAM_s1_end_xfer <= 1;
      else 
        d1_RAM_s1_end_xfer <= RAM_s1_end_xfer;
    end


  //RAM_s1_waits_for_read in a cycle, which is an e_mux
  assign RAM_s1_waits_for_read = RAM_s1_in_a_read_cycle & 0;

  //RAM_s1_in_a_read_cycle assignment, which is an e_assign
  assign RAM_s1_in_a_read_cycle = (cpu_0_data_master_granted_RAM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_RAM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = RAM_s1_in_a_read_cycle;

  //RAM_s1_waits_for_write in a cycle, which is an e_mux
  assign RAM_s1_waits_for_write = RAM_s1_in_a_write_cycle & 0;

  //RAM_s1_in_a_write_cycle assignment, which is an e_assign
  assign RAM_s1_in_a_write_cycle = cpu_0_data_master_granted_RAM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = RAM_s1_in_a_write_cycle;

  assign wait_for_RAM_s1_counter = 0;
  //RAM_s1_byteenable byte enable port mux, which is an e_mux
  assign RAM_s1_byteenable = (cpu_0_data_master_granted_RAM_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //RAM/s1 enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_RAM_s1 + cpu_0_instruction_master_granted_RAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_RAM_s1 + cpu_0_instruction_master_saved_grant_RAM_s1 > 1)
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

module ROM_s1_arbitrator (
                           // inputs:
                            ROM_s1_readdata,
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
                            ROM_s1_address,
                            ROM_s1_byteenable,
                            ROM_s1_chipselect,
                            ROM_s1_clken,
                            ROM_s1_debugaccess,
                            ROM_s1_readdata_from_sa,
                            ROM_s1_reset,
                            ROM_s1_write,
                            ROM_s1_writedata,
                            cpu_0_data_master_granted_ROM_s1,
                            cpu_0_data_master_qualified_request_ROM_s1,
                            cpu_0_data_master_read_data_valid_ROM_s1,
                            cpu_0_data_master_requests_ROM_s1,
                            cpu_0_instruction_master_granted_ROM_s1,
                            cpu_0_instruction_master_qualified_request_ROM_s1,
                            cpu_0_instruction_master_read_data_valid_ROM_s1,
                            cpu_0_instruction_master_requests_ROM_s1,
                            d1_ROM_s1_end_xfer,
                            registered_cpu_0_data_master_read_data_valid_ROM_s1
                         )
;

  output  [ 10: 0] ROM_s1_address;
  output  [  3: 0] ROM_s1_byteenable;
  output           ROM_s1_chipselect;
  output           ROM_s1_clken;
  output           ROM_s1_debugaccess;
  output  [ 31: 0] ROM_s1_readdata_from_sa;
  output           ROM_s1_reset;
  output           ROM_s1_write;
  output  [ 31: 0] ROM_s1_writedata;
  output           cpu_0_data_master_granted_ROM_s1;
  output           cpu_0_data_master_qualified_request_ROM_s1;
  output           cpu_0_data_master_read_data_valid_ROM_s1;
  output           cpu_0_data_master_requests_ROM_s1;
  output           cpu_0_instruction_master_granted_ROM_s1;
  output           cpu_0_instruction_master_qualified_request_ROM_s1;
  output           cpu_0_instruction_master_read_data_valid_ROM_s1;
  output           cpu_0_instruction_master_requests_ROM_s1;
  output           d1_ROM_s1_end_xfer;
  output           registered_cpu_0_data_master_read_data_valid_ROM_s1;
  input   [ 31: 0] ROM_s1_readdata;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 15: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [ 10: 0] ROM_s1_address;
  wire             ROM_s1_allgrants;
  wire             ROM_s1_allow_new_arb_cycle;
  wire             ROM_s1_any_bursting_master_saved_grant;
  wire             ROM_s1_any_continuerequest;
  reg     [  1: 0] ROM_s1_arb_addend;
  wire             ROM_s1_arb_counter_enable;
  reg              ROM_s1_arb_share_counter;
  wire             ROM_s1_arb_share_counter_next_value;
  wire             ROM_s1_arb_share_set_values;
  wire    [  1: 0] ROM_s1_arb_winner;
  wire             ROM_s1_arbitration_holdoff_internal;
  wire             ROM_s1_beginbursttransfer_internal;
  wire             ROM_s1_begins_xfer;
  wire    [  3: 0] ROM_s1_byteenable;
  wire             ROM_s1_chipselect;
  wire    [  3: 0] ROM_s1_chosen_master_double_vector;
  wire    [  1: 0] ROM_s1_chosen_master_rot_left;
  wire             ROM_s1_clken;
  wire             ROM_s1_debugaccess;
  wire             ROM_s1_end_xfer;
  wire             ROM_s1_firsttransfer;
  wire    [  1: 0] ROM_s1_grant_vector;
  wire             ROM_s1_in_a_read_cycle;
  wire             ROM_s1_in_a_write_cycle;
  wire    [  1: 0] ROM_s1_master_qreq_vector;
  wire             ROM_s1_non_bursting_master_requests;
  wire    [ 31: 0] ROM_s1_readdata_from_sa;
  reg              ROM_s1_reg_firsttransfer;
  wire             ROM_s1_reset;
  reg     [  1: 0] ROM_s1_saved_chosen_master_vector;
  reg              ROM_s1_slavearbiterlockenable;
  wire             ROM_s1_slavearbiterlockenable2;
  wire             ROM_s1_unreg_firsttransfer;
  wire             ROM_s1_waits_for_read;
  wire             ROM_s1_waits_for_write;
  wire             ROM_s1_write;
  wire    [ 31: 0] ROM_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_ROM_s1;
  wire             cpu_0_data_master_qualified_request_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_ROM_s1;
  reg              cpu_0_data_master_read_data_valid_ROM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_ROM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_ROM_s1;
  wire             cpu_0_data_master_saved_grant_ROM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_ROM_s1;
  wire             cpu_0_instruction_master_qualified_request_ROM_s1;
  wire             cpu_0_instruction_master_read_data_valid_ROM_s1;
  reg              cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_ROM_s1;
  wire             cpu_0_instruction_master_saved_grant_ROM_s1;
  reg              d1_ROM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ROM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_ROM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_ROM_s1;
  wire             p1_cpu_0_data_master_read_data_valid_ROM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_ROM_s1;
  wire    [ 15: 0] shifted_address_to_ROM_s1_from_cpu_0_data_master;
  wire    [ 15: 0] shifted_address_to_ROM_s1_from_cpu_0_instruction_master;
  wire             wait_for_ROM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ROM_s1_end_xfer;
    end


  assign ROM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_ROM_s1 | cpu_0_instruction_master_qualified_request_ROM_s1));
  //assign ROM_s1_readdata_from_sa = ROM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ROM_s1_readdata_from_sa = ROM_s1_readdata;

  assign cpu_0_data_master_requests_ROM_s1 = ({cpu_0_data_master_address_to_slave[15 : 13] , 13'b0} == 16'h4000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_ROM_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_ROM_s1 = cpu_0_data_master_read_data_valid_ROM_s1_shift_register_in;

  //ROM_s1_arb_share_counter set values, which is an e_mux
  assign ROM_s1_arb_share_set_values = 1;

  //ROM_s1_non_bursting_master_requests mux, which is an e_mux
  assign ROM_s1_non_bursting_master_requests = cpu_0_data_master_requests_ROM_s1 |
    cpu_0_instruction_master_requests_ROM_s1 |
    cpu_0_data_master_requests_ROM_s1 |
    cpu_0_instruction_master_requests_ROM_s1;

  //ROM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign ROM_s1_any_bursting_master_saved_grant = 0;

  //ROM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign ROM_s1_arb_share_counter_next_value = ROM_s1_firsttransfer ? (ROM_s1_arb_share_set_values - 1) : |ROM_s1_arb_share_counter ? (ROM_s1_arb_share_counter - 1) : 0;

  //ROM_s1_allgrants all slave grants, which is an e_mux
  assign ROM_s1_allgrants = (|ROM_s1_grant_vector) |
    (|ROM_s1_grant_vector) |
    (|ROM_s1_grant_vector) |
    (|ROM_s1_grant_vector);

  //ROM_s1_end_xfer assignment, which is an e_assign
  assign ROM_s1_end_xfer = ~(ROM_s1_waits_for_read | ROM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_ROM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ROM_s1 = ROM_s1_end_xfer & (~ROM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ROM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign ROM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_ROM_s1 & ROM_s1_allgrants) | (end_xfer_arb_share_counter_term_ROM_s1 & ~ROM_s1_non_bursting_master_requests);

  //ROM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ROM_s1_arb_share_counter <= 0;
      else if (ROM_s1_arb_counter_enable)
          ROM_s1_arb_share_counter <= ROM_s1_arb_share_counter_next_value;
    end


  //ROM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ROM_s1_slavearbiterlockenable <= 0;
      else if ((|ROM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_ROM_s1) | (end_xfer_arb_share_counter_term_ROM_s1 & ~ROM_s1_non_bursting_master_requests))
          ROM_s1_slavearbiterlockenable <= |ROM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = ROM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //ROM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ROM_s1_slavearbiterlockenable2 = |ROM_s1_arb_share_counter_next_value;

  //cpu_0/data_master ROM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = ROM_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = ROM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master ROM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = ROM_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_ROM_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_ROM_s1 <= cpu_0_instruction_master_saved_grant_ROM_s1 ? 1 : (ROM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_ROM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_ROM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_ROM_s1 & cpu_0_instruction_master_requests_ROM_s1;

  //ROM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign ROM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_ROM_s1 = cpu_0_data_master_requests_ROM_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_ROM_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_ROM_s1_shift_register_in = cpu_0_data_master_granted_ROM_s1 & cpu_0_data_master_read & ~ROM_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_ROM_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_ROM_s1_shift_register = {cpu_0_data_master_read_data_valid_ROM_s1_shift_register, cpu_0_data_master_read_data_valid_ROM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_ROM_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_ROM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_ROM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_ROM_s1 = cpu_0_data_master_read_data_valid_ROM_s1_shift_register;

  //ROM_s1_writedata mux, which is an e_mux
  assign ROM_s1_writedata = cpu_0_data_master_writedata;

  //mux ROM_s1_clken, which is an e_mux
  assign ROM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_ROM_s1 = (({cpu_0_instruction_master_address_to_slave[15 : 13] , 13'b0} == 16'h4000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_ROM_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_ROM_s1 <= cpu_0_data_master_saved_grant_ROM_s1 ? 1 : (ROM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_ROM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_ROM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_ROM_s1 & cpu_0_data_master_requests_ROM_s1;

  assign cpu_0_instruction_master_qualified_request_ROM_s1 = cpu_0_instruction_master_requests_ROM_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register_in = cpu_0_instruction_master_granted_ROM_s1 & cpu_0_instruction_master_read & ~ROM_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register, cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_ROM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_ROM_s1 = cpu_0_instruction_master_read_data_valid_ROM_s1_shift_register;

  //allow new arb cycle for ROM/s1, which is an e_assign
  assign ROM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for ROM/s1, which is an e_assign
  assign ROM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_ROM_s1;

  //cpu_0/instruction_master grant ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_ROM_s1 = ROM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_ROM_s1 = ROM_s1_arb_winner[0] && cpu_0_instruction_master_requests_ROM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for ROM/s1, which is an e_assign
  assign ROM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_ROM_s1;

  //cpu_0/data_master grant ROM/s1, which is an e_assign
  assign cpu_0_data_master_granted_ROM_s1 = ROM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant ROM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_ROM_s1 = ROM_s1_arb_winner[1] && cpu_0_data_master_requests_ROM_s1;

  //ROM/s1 chosen-master double-vector, which is an e_assign
  assign ROM_s1_chosen_master_double_vector = {ROM_s1_master_qreq_vector, ROM_s1_master_qreq_vector} & ({~ROM_s1_master_qreq_vector, ~ROM_s1_master_qreq_vector} + ROM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign ROM_s1_arb_winner = (ROM_s1_allow_new_arb_cycle & | ROM_s1_grant_vector) ? ROM_s1_grant_vector : ROM_s1_saved_chosen_master_vector;

  //saved ROM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ROM_s1_saved_chosen_master_vector <= 0;
      else if (ROM_s1_allow_new_arb_cycle)
          ROM_s1_saved_chosen_master_vector <= |ROM_s1_grant_vector ? ROM_s1_grant_vector : ROM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign ROM_s1_grant_vector = {(ROM_s1_chosen_master_double_vector[1] | ROM_s1_chosen_master_double_vector[3]),
    (ROM_s1_chosen_master_double_vector[0] | ROM_s1_chosen_master_double_vector[2])};

  //ROM/s1 chosen master rotated left, which is an e_assign
  assign ROM_s1_chosen_master_rot_left = (ROM_s1_arb_winner << 1) ? (ROM_s1_arb_winner << 1) : 1;

  //ROM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ROM_s1_arb_addend <= 1;
      else if (|ROM_s1_grant_vector)
          ROM_s1_arb_addend <= ROM_s1_end_xfer? ROM_s1_chosen_master_rot_left : ROM_s1_grant_vector;
    end


  //~ROM_s1_reset assignment, which is an e_assign
  assign ROM_s1_reset = ~reset_n;

  assign ROM_s1_chipselect = cpu_0_data_master_granted_ROM_s1 | cpu_0_instruction_master_granted_ROM_s1;
  //ROM_s1_firsttransfer first transaction, which is an e_assign
  assign ROM_s1_firsttransfer = ROM_s1_begins_xfer ? ROM_s1_unreg_firsttransfer : ROM_s1_reg_firsttransfer;

  //ROM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign ROM_s1_unreg_firsttransfer = ~(ROM_s1_slavearbiterlockenable & ROM_s1_any_continuerequest);

  //ROM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ROM_s1_reg_firsttransfer <= 1'b1;
      else if (ROM_s1_begins_xfer)
          ROM_s1_reg_firsttransfer <= ROM_s1_unreg_firsttransfer;
    end


  //ROM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ROM_s1_beginbursttransfer_internal = ROM_s1_begins_xfer;

  //ROM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign ROM_s1_arbitration_holdoff_internal = ROM_s1_begins_xfer & ROM_s1_firsttransfer;

  //ROM_s1_write assignment, which is an e_mux
  assign ROM_s1_write = cpu_0_data_master_granted_ROM_s1 & cpu_0_data_master_write;

  assign shifted_address_to_ROM_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //ROM_s1_address mux, which is an e_mux
  assign ROM_s1_address = (cpu_0_data_master_granted_ROM_s1)? (shifted_address_to_ROM_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_ROM_s1_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_ROM_s1_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_ROM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ROM_s1_end_xfer <= 1;
      else 
        d1_ROM_s1_end_xfer <= ROM_s1_end_xfer;
    end


  //ROM_s1_waits_for_read in a cycle, which is an e_mux
  assign ROM_s1_waits_for_read = ROM_s1_in_a_read_cycle & 0;

  //ROM_s1_in_a_read_cycle assignment, which is an e_assign
  assign ROM_s1_in_a_read_cycle = (cpu_0_data_master_granted_ROM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_ROM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ROM_s1_in_a_read_cycle;

  //ROM_s1_waits_for_write in a cycle, which is an e_mux
  assign ROM_s1_waits_for_write = ROM_s1_in_a_write_cycle & 0;

  //ROM_s1_in_a_write_cycle assignment, which is an e_assign
  assign ROM_s1_in_a_write_cycle = cpu_0_data_master_granted_ROM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ROM_s1_in_a_write_cycle;

  assign wait_for_ROM_s1_counter = 0;
  //ROM_s1_byteenable byte enable port mux, which is an e_mux
  assign ROM_s1_byteenable = (cpu_0_data_master_granted_ROM_s1)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign ROM_s1_debugaccess = (cpu_0_data_master_granted_ROM_s1)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ROM/s1 enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_ROM_s1 + cpu_0_instruction_master_granted_ROM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_ROM_s1 + cpu_0_instruction_master_saved_grant_ROM_s1 > 1)
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
  input   [ 15: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 15: 0] cpu_0_instruction_master_address_to_slave;
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
  wire    [ 15: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 15: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
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

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[15 : 11] , 11'b0} == 16'h8800) & (cpu_0_data_master_read | cpu_0_data_master_write);
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

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[15 : 11] , 11'b0} == 16'h8800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
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
                                       FLAG_1_bit_s1_readdata_from_sa,
                                       IN_MSB_1_bit_s1_irq_from_sa,
                                       IN_MSB_1_bit_s1_readdata_from_sa,
                                       KEY1_1_bit_s1_readdata_from_sa,
                                       LEDG_1_bit_s1_readdata_from_sa,
                                       OUT_LEDR_8_Bits_s1_readdata_from_sa,
                                       RAM_s1_readdata_from_sa,
                                       ROM_s1_readdata_from_sa,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_granted_FLAG_1_bit_s1,
                                       cpu_0_data_master_granted_IN_MSB_1_bit_s1,
                                       cpu_0_data_master_granted_KEY1_1_bit_s1,
                                       cpu_0_data_master_granted_LEDG_1_bit_s1,
                                       cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1,
                                       cpu_0_data_master_granted_RAM_s1,
                                       cpu_0_data_master_granted_ROM_s1,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_FLAG_1_bit_s1,
                                       cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1,
                                       cpu_0_data_master_qualified_request_KEY1_1_bit_s1,
                                       cpu_0_data_master_qualified_request_LEDG_1_bit_s1,
                                       cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1,
                                       cpu_0_data_master_qualified_request_RAM_s1,
                                       cpu_0_data_master_qualified_request_ROM_s1,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_FLAG_1_bit_s1,
                                       cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1,
                                       cpu_0_data_master_read_data_valid_KEY1_1_bit_s1,
                                       cpu_0_data_master_read_data_valid_LEDG_1_bit_s1,
                                       cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1,
                                       cpu_0_data_master_read_data_valid_RAM_s1,
                                       cpu_0_data_master_read_data_valid_ROM_s1,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_FLAG_1_bit_s1,
                                       cpu_0_data_master_requests_IN_MSB_1_bit_s1,
                                       cpu_0_data_master_requests_KEY1_1_bit_s1,
                                       cpu_0_data_master_requests_LEDG_1_bit_s1,
                                       cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1,
                                       cpu_0_data_master_requests_RAM_s1,
                                       cpu_0_data_master_requests_ROM_s1,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_write,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_FLAG_1_bit_s1_end_xfer,
                                       d1_IN_MSB_1_bit_s1_end_xfer,
                                       d1_KEY1_1_bit_s1_end_xfer,
                                       d1_LEDG_1_bit_s1_end_xfer,
                                       d1_OUT_LEDR_8_Bits_s1_end_xfer,
                                       d1_RAM_s1_end_xfer,
                                       d1_ROM_s1_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       registered_cpu_0_data_master_read_data_valid_RAM_s1,
                                       registered_cpu_0_data_master_read_data_valid_ROM_s1,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 15: 0] cpu_0_data_master_address_to_slave;
  output  [ 31: 0] cpu_0_data_master_irq;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input            FLAG_1_bit_s1_readdata_from_sa;
  input            IN_MSB_1_bit_s1_irq_from_sa;
  input            IN_MSB_1_bit_s1_readdata_from_sa;
  input            KEY1_1_bit_s1_readdata_from_sa;
  input            LEDG_1_bit_s1_readdata_from_sa;
  input   [  7: 0] OUT_LEDR_8_Bits_s1_readdata_from_sa;
  input   [ 31: 0] RAM_s1_readdata_from_sa;
  input   [ 31: 0] ROM_s1_readdata_from_sa;
  input            clk;
  input   [ 15: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_granted_FLAG_1_bit_s1;
  input            cpu_0_data_master_granted_IN_MSB_1_bit_s1;
  input            cpu_0_data_master_granted_KEY1_1_bit_s1;
  input            cpu_0_data_master_granted_LEDG_1_bit_s1;
  input            cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1;
  input            cpu_0_data_master_granted_RAM_s1;
  input            cpu_0_data_master_granted_ROM_s1;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_FLAG_1_bit_s1;
  input            cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1;
  input            cpu_0_data_master_qualified_request_KEY1_1_bit_s1;
  input            cpu_0_data_master_qualified_request_LEDG_1_bit_s1;
  input            cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1;
  input            cpu_0_data_master_qualified_request_RAM_s1;
  input            cpu_0_data_master_qualified_request_ROM_s1;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_FLAG_1_bit_s1;
  input            cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1;
  input            cpu_0_data_master_read_data_valid_KEY1_1_bit_s1;
  input            cpu_0_data_master_read_data_valid_LEDG_1_bit_s1;
  input            cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1;
  input            cpu_0_data_master_read_data_valid_RAM_s1;
  input            cpu_0_data_master_read_data_valid_ROM_s1;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_FLAG_1_bit_s1;
  input            cpu_0_data_master_requests_IN_MSB_1_bit_s1;
  input            cpu_0_data_master_requests_KEY1_1_bit_s1;
  input            cpu_0_data_master_requests_LEDG_1_bit_s1;
  input            cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1;
  input            cpu_0_data_master_requests_RAM_s1;
  input            cpu_0_data_master_requests_ROM_s1;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_FLAG_1_bit_s1_end_xfer;
  input            d1_IN_MSB_1_bit_s1_end_xfer;
  input            d1_KEY1_1_bit_s1_end_xfer;
  input            d1_LEDG_1_bit_s1_end_xfer;
  input            d1_OUT_LEDR_8_Bits_s1_end_xfer;
  input            d1_RAM_s1_end_xfer;
  input            d1_ROM_s1_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            registered_cpu_0_data_master_read_data_valid_RAM_s1;
  input            registered_cpu_0_data_master_read_data_valid_ROM_s1;
  input            reset_n;

  wire    [ 15: 0] cpu_0_data_master_address_to_slave;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_FLAG_1_bit_s1 | ~cpu_0_data_master_requests_FLAG_1_bit_s1) & ((~cpu_0_data_master_qualified_request_FLAG_1_bit_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_FLAG_1_bit_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1 | ~cpu_0_data_master_requests_IN_MSB_1_bit_s1) & ((~cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_KEY1_1_bit_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_KEY1_1_bit_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_LEDG_1_bit_s1 | ~cpu_0_data_master_requests_LEDG_1_bit_s1) & ((~cpu_0_data_master_qualified_request_LEDG_1_bit_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_LEDG_1_bit_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1 | ~cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1) & ((~cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1;

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_0_data_master_qualified_request_RAM_s1 | registered_cpu_0_data_master_read_data_valid_RAM_s1 | ~cpu_0_data_master_requests_RAM_s1) & (cpu_0_data_master_granted_RAM_s1 | ~cpu_0_data_master_qualified_request_RAM_s1) & ((~cpu_0_data_master_qualified_request_RAM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_RAM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_RAM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_ROM_s1 | registered_cpu_0_data_master_read_data_valid_ROM_s1 | ~cpu_0_data_master_requests_ROM_s1) & (cpu_0_data_master_granted_ROM_s1 | ~cpu_0_data_master_qualified_request_ROM_s1) & ((~cpu_0_data_master_qualified_request_ROM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_ROM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_ROM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[15 : 0];

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_FLAG_1_bit_s1}} | FLAG_1_bit_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_IN_MSB_1_bit_s1}} | IN_MSB_1_bit_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_KEY1_1_bit_s1}} | KEY1_1_bit_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_LEDG_1_bit_s1}} | LEDG_1_bit_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1}} | OUT_LEDR_8_Bits_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_RAM_s1}} | RAM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_ROM_s1}} | ROM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else 
        cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    IN_MSB_1_bit_s1_irq_from_sa};


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              RAM_s1_readdata_from_sa,
                                              ROM_s1_readdata_from_sa,
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_RAM_s1,
                                              cpu_0_instruction_master_granted_ROM_s1,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_RAM_s1,
                                              cpu_0_instruction_master_qualified_request_ROM_s1,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_RAM_s1,
                                              cpu_0_instruction_master_read_data_valid_ROM_s1,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_RAM_s1,
                                              cpu_0_instruction_master_requests_ROM_s1,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_RAM_s1_end_xfer,
                                              d1_ROM_s1_end_xfer,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 15: 0] cpu_0_instruction_master_address_to_slave;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_waitrequest;
  input   [ 31: 0] RAM_s1_readdata_from_sa;
  input   [ 31: 0] ROM_s1_readdata_from_sa;
  input            clk;
  input   [ 15: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_RAM_s1;
  input            cpu_0_instruction_master_granted_ROM_s1;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_RAM_s1;
  input            cpu_0_instruction_master_qualified_request_ROM_s1;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_RAM_s1;
  input            cpu_0_instruction_master_read_data_valid_ROM_s1;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_RAM_s1;
  input            cpu_0_instruction_master_requests_ROM_s1;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_RAM_s1_end_xfer;
  input            d1_ROM_s1_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 15: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 15: 0] cpu_0_instruction_master_address_to_slave;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_0_instruction_master_qualified_request_RAM_s1 | cpu_0_instruction_master_read_data_valid_RAM_s1 | ~cpu_0_instruction_master_requests_RAM_s1) & (cpu_0_instruction_master_granted_RAM_s1 | ~cpu_0_instruction_master_qualified_request_RAM_s1) & ((~cpu_0_instruction_master_qualified_request_RAM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_RAM_s1 & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_ROM_s1 | cpu_0_instruction_master_read_data_valid_ROM_s1 | ~cpu_0_instruction_master_requests_ROM_s1) & (cpu_0_instruction_master_granted_ROM_s1 | ~cpu_0_instruction_master_qualified_request_ROM_s1) & ((~cpu_0_instruction_master_qualified_request_ROM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_ROM_s1 & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[15 : 0];

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~cpu_0_instruction_master_requests_RAM_s1}} | RAM_s1_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_requests_ROM_s1}} | ROM_s1_readdata_from_sa) &
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

module Lab_3_Nios_processor_reset_clk_0_domain_synch_module (
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

module Lab_3_Nios_processor (
                              // 1) global signals:
                               clk_0,
                               reset_n,

                              // the_FLAG_1_bit
                               out_port_from_the_FLAG_1_bit,

                              // the_IN_MSB_1_bit
                               in_port_to_the_IN_MSB_1_bit,

                              // the_KEY1_1_bit
                               in_port_to_the_KEY1_1_bit,

                              // the_LEDG_1_bit
                               out_port_from_the_LEDG_1_bit,

                              // the_OUT_LEDR_8_Bits
                               out_port_from_the_OUT_LEDR_8_Bits
                            )
;

  output           out_port_from_the_FLAG_1_bit;
  output           out_port_from_the_LEDG_1_bit;
  output  [  7: 0] out_port_from_the_OUT_LEDR_8_Bits;
  input            clk_0;
  input            in_port_to_the_IN_MSB_1_bit;
  input            in_port_to_the_KEY1_1_bit;
  input            reset_n;

  wire    [  1: 0] FLAG_1_bit_s1_address;
  wire             FLAG_1_bit_s1_chipselect;
  wire             FLAG_1_bit_s1_readdata;
  wire             FLAG_1_bit_s1_readdata_from_sa;
  wire             FLAG_1_bit_s1_reset_n;
  wire             FLAG_1_bit_s1_write_n;
  wire             FLAG_1_bit_s1_writedata;
  wire    [  1: 0] IN_MSB_1_bit_s1_address;
  wire             IN_MSB_1_bit_s1_chipselect;
  wire             IN_MSB_1_bit_s1_irq;
  wire             IN_MSB_1_bit_s1_irq_from_sa;
  wire             IN_MSB_1_bit_s1_readdata;
  wire             IN_MSB_1_bit_s1_readdata_from_sa;
  wire             IN_MSB_1_bit_s1_reset_n;
  wire             IN_MSB_1_bit_s1_write_n;
  wire             IN_MSB_1_bit_s1_writedata;
  wire    [  1: 0] KEY1_1_bit_s1_address;
  wire             KEY1_1_bit_s1_readdata;
  wire             KEY1_1_bit_s1_readdata_from_sa;
  wire             KEY1_1_bit_s1_reset_n;
  wire    [  1: 0] LEDG_1_bit_s1_address;
  wire             LEDG_1_bit_s1_chipselect;
  wire             LEDG_1_bit_s1_readdata;
  wire             LEDG_1_bit_s1_readdata_from_sa;
  wire             LEDG_1_bit_s1_reset_n;
  wire             LEDG_1_bit_s1_write_n;
  wire             LEDG_1_bit_s1_writedata;
  wire    [  1: 0] OUT_LEDR_8_Bits_s1_address;
  wire             OUT_LEDR_8_Bits_s1_chipselect;
  wire    [  7: 0] OUT_LEDR_8_Bits_s1_readdata;
  wire    [  7: 0] OUT_LEDR_8_Bits_s1_readdata_from_sa;
  wire             OUT_LEDR_8_Bits_s1_reset_n;
  wire             OUT_LEDR_8_Bits_s1_write_n;
  wire    [  7: 0] OUT_LEDR_8_Bits_s1_writedata;
  wire    [ 10: 0] RAM_s1_address;
  wire    [  3: 0] RAM_s1_byteenable;
  wire             RAM_s1_chipselect;
  wire             RAM_s1_clken;
  wire    [ 31: 0] RAM_s1_readdata;
  wire    [ 31: 0] RAM_s1_readdata_from_sa;
  wire             RAM_s1_reset;
  wire             RAM_s1_write;
  wire    [ 31: 0] RAM_s1_writedata;
  wire    [ 10: 0] ROM_s1_address;
  wire    [  3: 0] ROM_s1_byteenable;
  wire             ROM_s1_chipselect;
  wire             ROM_s1_clken;
  wire             ROM_s1_debugaccess;
  wire    [ 31: 0] ROM_s1_readdata;
  wire    [ 31: 0] ROM_s1_readdata_from_sa;
  wire             ROM_s1_reset;
  wire             ROM_s1_write;
  wire    [ 31: 0] ROM_s1_writedata;
  wire             clk_0_reset_n;
  wire    [ 15: 0] cpu_0_data_master_address;
  wire    [ 15: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_FLAG_1_bit_s1;
  wire             cpu_0_data_master_granted_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_granted_KEY1_1_bit_s1;
  wire             cpu_0_data_master_granted_LEDG_1_bit_s1;
  wire             cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_granted_RAM_s1;
  wire             cpu_0_data_master_granted_ROM_s1;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_qualified_request_FLAG_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_KEY1_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_LEDG_1_bit_s1;
  wire             cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_qualified_request_RAM_s1;
  wire             cpu_0_data_master_qualified_request_ROM_s1;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_FLAG_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_KEY1_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_LEDG_1_bit_s1;
  wire             cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_read_data_valid_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_FLAG_1_bit_s1;
  wire             cpu_0_data_master_requests_IN_MSB_1_bit_s1;
  wire             cpu_0_data_master_requests_KEY1_1_bit_s1;
  wire             cpu_0_data_master_requests_LEDG_1_bit_s1;
  wire             cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1;
  wire             cpu_0_data_master_requests_RAM_s1;
  wire             cpu_0_data_master_requests_ROM_s1;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 15: 0] cpu_0_instruction_master_address;
  wire    [ 15: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_granted_RAM_s1;
  wire             cpu_0_instruction_master_granted_ROM_s1;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_ROM_s1;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_ROM_s1;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_requests_RAM_s1;
  wire             cpu_0_instruction_master_requests_ROM_s1;
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
  wire             d1_FLAG_1_bit_s1_end_xfer;
  wire             d1_IN_MSB_1_bit_s1_end_xfer;
  wire             d1_KEY1_1_bit_s1_end_xfer;
  wire             d1_LEDG_1_bit_s1_end_xfer;
  wire             d1_OUT_LEDR_8_Bits_s1_end_xfer;
  wire             d1_RAM_s1_end_xfer;
  wire             d1_ROM_s1_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             out_port_from_the_FLAG_1_bit;
  wire             out_port_from_the_LEDG_1_bit;
  wire    [  7: 0] out_port_from_the_OUT_LEDR_8_Bits;
  wire             registered_cpu_0_data_master_read_data_valid_RAM_s1;
  wire             registered_cpu_0_data_master_read_data_valid_ROM_s1;
  wire             reset_n_sources;
  FLAG_1_bit_s1_arbitrator the_FLAG_1_bit_s1
    (
      .FLAG_1_bit_s1_address                             (FLAG_1_bit_s1_address),
      .FLAG_1_bit_s1_chipselect                          (FLAG_1_bit_s1_chipselect),
      .FLAG_1_bit_s1_readdata                            (FLAG_1_bit_s1_readdata),
      .FLAG_1_bit_s1_readdata_from_sa                    (FLAG_1_bit_s1_readdata_from_sa),
      .FLAG_1_bit_s1_reset_n                             (FLAG_1_bit_s1_reset_n),
      .FLAG_1_bit_s1_write_n                             (FLAG_1_bit_s1_write_n),
      .FLAG_1_bit_s1_writedata                           (FLAG_1_bit_s1_writedata),
      .clk                                               (clk_0),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_FLAG_1_bit_s1           (cpu_0_data_master_granted_FLAG_1_bit_s1),
      .cpu_0_data_master_qualified_request_FLAG_1_bit_s1 (cpu_0_data_master_qualified_request_FLAG_1_bit_s1),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_FLAG_1_bit_s1   (cpu_0_data_master_read_data_valid_FLAG_1_bit_s1),
      .cpu_0_data_master_requests_FLAG_1_bit_s1          (cpu_0_data_master_requests_FLAG_1_bit_s1),
      .cpu_0_data_master_waitrequest                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                       (cpu_0_data_master_writedata),
      .d1_FLAG_1_bit_s1_end_xfer                         (d1_FLAG_1_bit_s1_end_xfer),
      .reset_n                                           (clk_0_reset_n)
    );

  FLAG_1_bit the_FLAG_1_bit
    (
      .address    (FLAG_1_bit_s1_address),
      .chipselect (FLAG_1_bit_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_FLAG_1_bit),
      .readdata   (FLAG_1_bit_s1_readdata),
      .reset_n    (FLAG_1_bit_s1_reset_n),
      .write_n    (FLAG_1_bit_s1_write_n),
      .writedata  (FLAG_1_bit_s1_writedata)
    );

  IN_MSB_1_bit_s1_arbitrator the_IN_MSB_1_bit_s1
    (
      .IN_MSB_1_bit_s1_address                             (IN_MSB_1_bit_s1_address),
      .IN_MSB_1_bit_s1_chipselect                          (IN_MSB_1_bit_s1_chipselect),
      .IN_MSB_1_bit_s1_irq                                 (IN_MSB_1_bit_s1_irq),
      .IN_MSB_1_bit_s1_irq_from_sa                         (IN_MSB_1_bit_s1_irq_from_sa),
      .IN_MSB_1_bit_s1_readdata                            (IN_MSB_1_bit_s1_readdata),
      .IN_MSB_1_bit_s1_readdata_from_sa                    (IN_MSB_1_bit_s1_readdata_from_sa),
      .IN_MSB_1_bit_s1_reset_n                             (IN_MSB_1_bit_s1_reset_n),
      .IN_MSB_1_bit_s1_write_n                             (IN_MSB_1_bit_s1_write_n),
      .IN_MSB_1_bit_s1_writedata                           (IN_MSB_1_bit_s1_writedata),
      .clk                                                 (clk_0),
      .cpu_0_data_master_address_to_slave                  (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_IN_MSB_1_bit_s1           (cpu_0_data_master_granted_IN_MSB_1_bit_s1),
      .cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1 (cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1),
      .cpu_0_data_master_read                              (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1   (cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1),
      .cpu_0_data_master_requests_IN_MSB_1_bit_s1          (cpu_0_data_master_requests_IN_MSB_1_bit_s1),
      .cpu_0_data_master_waitrequest                       (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                             (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                         (cpu_0_data_master_writedata),
      .d1_IN_MSB_1_bit_s1_end_xfer                         (d1_IN_MSB_1_bit_s1_end_xfer),
      .reset_n                                             (clk_0_reset_n)
    );

  IN_MSB_1_bit the_IN_MSB_1_bit
    (
      .address    (IN_MSB_1_bit_s1_address),
      .chipselect (IN_MSB_1_bit_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_IN_MSB_1_bit),
      .irq        (IN_MSB_1_bit_s1_irq),
      .readdata   (IN_MSB_1_bit_s1_readdata),
      .reset_n    (IN_MSB_1_bit_s1_reset_n),
      .write_n    (IN_MSB_1_bit_s1_write_n),
      .writedata  (IN_MSB_1_bit_s1_writedata)
    );

  KEY1_1_bit_s1_arbitrator the_KEY1_1_bit_s1
    (
      .KEY1_1_bit_s1_address                             (KEY1_1_bit_s1_address),
      .KEY1_1_bit_s1_readdata                            (KEY1_1_bit_s1_readdata),
      .KEY1_1_bit_s1_readdata_from_sa                    (KEY1_1_bit_s1_readdata_from_sa),
      .KEY1_1_bit_s1_reset_n                             (KEY1_1_bit_s1_reset_n),
      .clk                                               (clk_0),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_KEY1_1_bit_s1           (cpu_0_data_master_granted_KEY1_1_bit_s1),
      .cpu_0_data_master_qualified_request_KEY1_1_bit_s1 (cpu_0_data_master_qualified_request_KEY1_1_bit_s1),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_KEY1_1_bit_s1   (cpu_0_data_master_read_data_valid_KEY1_1_bit_s1),
      .cpu_0_data_master_requests_KEY1_1_bit_s1          (cpu_0_data_master_requests_KEY1_1_bit_s1),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .d1_KEY1_1_bit_s1_end_xfer                         (d1_KEY1_1_bit_s1_end_xfer),
      .reset_n                                           (clk_0_reset_n)
    );

  KEY1_1_bit the_KEY1_1_bit
    (
      .address  (KEY1_1_bit_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_KEY1_1_bit),
      .readdata (KEY1_1_bit_s1_readdata),
      .reset_n  (KEY1_1_bit_s1_reset_n)
    );

  LEDG_1_bit_s1_arbitrator the_LEDG_1_bit_s1
    (
      .LEDG_1_bit_s1_address                             (LEDG_1_bit_s1_address),
      .LEDG_1_bit_s1_chipselect                          (LEDG_1_bit_s1_chipselect),
      .LEDG_1_bit_s1_readdata                            (LEDG_1_bit_s1_readdata),
      .LEDG_1_bit_s1_readdata_from_sa                    (LEDG_1_bit_s1_readdata_from_sa),
      .LEDG_1_bit_s1_reset_n                             (LEDG_1_bit_s1_reset_n),
      .LEDG_1_bit_s1_write_n                             (LEDG_1_bit_s1_write_n),
      .LEDG_1_bit_s1_writedata                           (LEDG_1_bit_s1_writedata),
      .clk                                               (clk_0),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_LEDG_1_bit_s1           (cpu_0_data_master_granted_LEDG_1_bit_s1),
      .cpu_0_data_master_qualified_request_LEDG_1_bit_s1 (cpu_0_data_master_qualified_request_LEDG_1_bit_s1),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_LEDG_1_bit_s1   (cpu_0_data_master_read_data_valid_LEDG_1_bit_s1),
      .cpu_0_data_master_requests_LEDG_1_bit_s1          (cpu_0_data_master_requests_LEDG_1_bit_s1),
      .cpu_0_data_master_waitrequest                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                       (cpu_0_data_master_writedata),
      .d1_LEDG_1_bit_s1_end_xfer                         (d1_LEDG_1_bit_s1_end_xfer),
      .reset_n                                           (clk_0_reset_n)
    );

  LEDG_1_bit the_LEDG_1_bit
    (
      .address    (LEDG_1_bit_s1_address),
      .chipselect (LEDG_1_bit_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_LEDG_1_bit),
      .readdata   (LEDG_1_bit_s1_readdata),
      .reset_n    (LEDG_1_bit_s1_reset_n),
      .write_n    (LEDG_1_bit_s1_write_n),
      .writedata  (LEDG_1_bit_s1_writedata)
    );

  OUT_LEDR_8_Bits_s1_arbitrator the_OUT_LEDR_8_Bits_s1
    (
      .OUT_LEDR_8_Bits_s1_address                             (OUT_LEDR_8_Bits_s1_address),
      .OUT_LEDR_8_Bits_s1_chipselect                          (OUT_LEDR_8_Bits_s1_chipselect),
      .OUT_LEDR_8_Bits_s1_readdata                            (OUT_LEDR_8_Bits_s1_readdata),
      .OUT_LEDR_8_Bits_s1_readdata_from_sa                    (OUT_LEDR_8_Bits_s1_readdata_from_sa),
      .OUT_LEDR_8_Bits_s1_reset_n                             (OUT_LEDR_8_Bits_s1_reset_n),
      .OUT_LEDR_8_Bits_s1_write_n                             (OUT_LEDR_8_Bits_s1_write_n),
      .OUT_LEDR_8_Bits_s1_writedata                           (OUT_LEDR_8_Bits_s1_writedata),
      .clk                                                    (clk_0),
      .cpu_0_data_master_address_to_slave                     (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                           (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1           (cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1 (cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_read                                 (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1   (cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1          (cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_waitrequest                          (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                            (cpu_0_data_master_writedata),
      .d1_OUT_LEDR_8_Bits_s1_end_xfer                         (d1_OUT_LEDR_8_Bits_s1_end_xfer),
      .reset_n                                                (clk_0_reset_n)
    );

  OUT_LEDR_8_Bits the_OUT_LEDR_8_Bits
    (
      .address    (OUT_LEDR_8_Bits_s1_address),
      .chipselect (OUT_LEDR_8_Bits_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_OUT_LEDR_8_Bits),
      .readdata   (OUT_LEDR_8_Bits_s1_readdata),
      .reset_n    (OUT_LEDR_8_Bits_s1_reset_n),
      .write_n    (OUT_LEDR_8_Bits_s1_write_n),
      .writedata  (OUT_LEDR_8_Bits_s1_writedata)
    );

  RAM_s1_arbitrator the_RAM_s1
    (
      .RAM_s1_address                                      (RAM_s1_address),
      .RAM_s1_byteenable                                   (RAM_s1_byteenable),
      .RAM_s1_chipselect                                   (RAM_s1_chipselect),
      .RAM_s1_clken                                        (RAM_s1_clken),
      .RAM_s1_readdata                                     (RAM_s1_readdata),
      .RAM_s1_readdata_from_sa                             (RAM_s1_readdata_from_sa),
      .RAM_s1_reset                                        (RAM_s1_reset),
      .RAM_s1_write                                        (RAM_s1_write),
      .RAM_s1_writedata                                    (RAM_s1_writedata),
      .clk                                                 (clk_0),
      .cpu_0_data_master_address_to_slave                  (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                        (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_RAM_s1                    (cpu_0_data_master_granted_RAM_s1),
      .cpu_0_data_master_qualified_request_RAM_s1          (cpu_0_data_master_qualified_request_RAM_s1),
      .cpu_0_data_master_read                              (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_RAM_s1            (cpu_0_data_master_read_data_valid_RAM_s1),
      .cpu_0_data_master_requests_RAM_s1                   (cpu_0_data_master_requests_RAM_s1),
      .cpu_0_data_master_waitrequest                       (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                             (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                         (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave           (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_RAM_s1             (cpu_0_instruction_master_granted_RAM_s1),
      .cpu_0_instruction_master_qualified_request_RAM_s1   (cpu_0_instruction_master_qualified_request_RAM_s1),
      .cpu_0_instruction_master_read                       (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_RAM_s1     (cpu_0_instruction_master_read_data_valid_RAM_s1),
      .cpu_0_instruction_master_requests_RAM_s1            (cpu_0_instruction_master_requests_RAM_s1),
      .d1_RAM_s1_end_xfer                                  (d1_RAM_s1_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_RAM_s1 (registered_cpu_0_data_master_read_data_valid_RAM_s1),
      .reset_n                                             (clk_0_reset_n)
    );

  RAM the_RAM
    (
      .address    (RAM_s1_address),
      .byteenable (RAM_s1_byteenable),
      .chipselect (RAM_s1_chipselect),
      .clk        (clk_0),
      .clken      (RAM_s1_clken),
      .readdata   (RAM_s1_readdata),
      .reset      (RAM_s1_reset),
      .write      (RAM_s1_write),
      .writedata  (RAM_s1_writedata)
    );

  ROM_s1_arbitrator the_ROM_s1
    (
      .ROM_s1_address                                      (ROM_s1_address),
      .ROM_s1_byteenable                                   (ROM_s1_byteenable),
      .ROM_s1_chipselect                                   (ROM_s1_chipselect),
      .ROM_s1_clken                                        (ROM_s1_clken),
      .ROM_s1_debugaccess                                  (ROM_s1_debugaccess),
      .ROM_s1_readdata                                     (ROM_s1_readdata),
      .ROM_s1_readdata_from_sa                             (ROM_s1_readdata_from_sa),
      .ROM_s1_reset                                        (ROM_s1_reset),
      .ROM_s1_write                                        (ROM_s1_write),
      .ROM_s1_writedata                                    (ROM_s1_writedata),
      .clk                                                 (clk_0),
      .cpu_0_data_master_address_to_slave                  (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                        (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                       (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_ROM_s1                    (cpu_0_data_master_granted_ROM_s1),
      .cpu_0_data_master_qualified_request_ROM_s1          (cpu_0_data_master_qualified_request_ROM_s1),
      .cpu_0_data_master_read                              (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_ROM_s1            (cpu_0_data_master_read_data_valid_ROM_s1),
      .cpu_0_data_master_requests_ROM_s1                   (cpu_0_data_master_requests_ROM_s1),
      .cpu_0_data_master_waitrequest                       (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                             (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                         (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave           (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_ROM_s1             (cpu_0_instruction_master_granted_ROM_s1),
      .cpu_0_instruction_master_qualified_request_ROM_s1   (cpu_0_instruction_master_qualified_request_ROM_s1),
      .cpu_0_instruction_master_read                       (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_ROM_s1     (cpu_0_instruction_master_read_data_valid_ROM_s1),
      .cpu_0_instruction_master_requests_ROM_s1            (cpu_0_instruction_master_requests_ROM_s1),
      .d1_ROM_s1_end_xfer                                  (d1_ROM_s1_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_ROM_s1 (registered_cpu_0_data_master_read_data_valid_ROM_s1),
      .reset_n                                             (clk_0_reset_n)
    );

  ROM the_ROM
    (
      .address     (ROM_s1_address),
      .byteenable  (ROM_s1_byteenable),
      .chipselect  (ROM_s1_chipselect),
      .clk         (clk_0),
      .clken       (ROM_s1_clken),
      .debugaccess (ROM_s1_debugaccess),
      .readdata    (ROM_s1_readdata),
      .reset       (ROM_s1_reset),
      .write       (ROM_s1_write),
      .writedata   (ROM_s1_writedata)
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
      .FLAG_1_bit_s1_readdata_from_sa                              (FLAG_1_bit_s1_readdata_from_sa),
      .IN_MSB_1_bit_s1_irq_from_sa                                 (IN_MSB_1_bit_s1_irq_from_sa),
      .IN_MSB_1_bit_s1_readdata_from_sa                            (IN_MSB_1_bit_s1_readdata_from_sa),
      .KEY1_1_bit_s1_readdata_from_sa                              (KEY1_1_bit_s1_readdata_from_sa),
      .LEDG_1_bit_s1_readdata_from_sa                              (LEDG_1_bit_s1_readdata_from_sa),
      .OUT_LEDR_8_Bits_s1_readdata_from_sa                         (OUT_LEDR_8_Bits_s1_readdata_from_sa),
      .RAM_s1_readdata_from_sa                                     (RAM_s1_readdata_from_sa),
      .ROM_s1_readdata_from_sa                                     (ROM_s1_readdata_from_sa),
      .clk                                                         (clk_0),
      .cpu_0_data_master_address                                   (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_FLAG_1_bit_s1                     (cpu_0_data_master_granted_FLAG_1_bit_s1),
      .cpu_0_data_master_granted_IN_MSB_1_bit_s1                   (cpu_0_data_master_granted_IN_MSB_1_bit_s1),
      .cpu_0_data_master_granted_KEY1_1_bit_s1                     (cpu_0_data_master_granted_KEY1_1_bit_s1),
      .cpu_0_data_master_granted_LEDG_1_bit_s1                     (cpu_0_data_master_granted_LEDG_1_bit_s1),
      .cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1                (cpu_0_data_master_granted_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_granted_RAM_s1                            (cpu_0_data_master_granted_RAM_s1),
      .cpu_0_data_master_granted_ROM_s1                            (cpu_0_data_master_granted_ROM_s1),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module           (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_irq                                       (cpu_0_data_master_irq),
      .cpu_0_data_master_qualified_request_FLAG_1_bit_s1           (cpu_0_data_master_qualified_request_FLAG_1_bit_s1),
      .cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1         (cpu_0_data_master_qualified_request_IN_MSB_1_bit_s1),
      .cpu_0_data_master_qualified_request_KEY1_1_bit_s1           (cpu_0_data_master_qualified_request_KEY1_1_bit_s1),
      .cpu_0_data_master_qualified_request_LEDG_1_bit_s1           (cpu_0_data_master_qualified_request_LEDG_1_bit_s1),
      .cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1      (cpu_0_data_master_qualified_request_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_qualified_request_RAM_s1                  (cpu_0_data_master_qualified_request_RAM_s1),
      .cpu_0_data_master_qualified_request_ROM_s1                  (cpu_0_data_master_qualified_request_ROM_s1),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_FLAG_1_bit_s1             (cpu_0_data_master_read_data_valid_FLAG_1_bit_s1),
      .cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1           (cpu_0_data_master_read_data_valid_IN_MSB_1_bit_s1),
      .cpu_0_data_master_read_data_valid_KEY1_1_bit_s1             (cpu_0_data_master_read_data_valid_KEY1_1_bit_s1),
      .cpu_0_data_master_read_data_valid_LEDG_1_bit_s1             (cpu_0_data_master_read_data_valid_LEDG_1_bit_s1),
      .cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1        (cpu_0_data_master_read_data_valid_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_read_data_valid_RAM_s1                    (cpu_0_data_master_read_data_valid_RAM_s1),
      .cpu_0_data_master_read_data_valid_ROM_s1                    (cpu_0_data_master_read_data_valid_ROM_s1),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_readdata                                  (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_FLAG_1_bit_s1                    (cpu_0_data_master_requests_FLAG_1_bit_s1),
      .cpu_0_data_master_requests_IN_MSB_1_bit_s1                  (cpu_0_data_master_requests_IN_MSB_1_bit_s1),
      .cpu_0_data_master_requests_KEY1_1_bit_s1                    (cpu_0_data_master_requests_KEY1_1_bit_s1),
      .cpu_0_data_master_requests_LEDG_1_bit_s1                    (cpu_0_data_master_requests_LEDG_1_bit_s1),
      .cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1               (cpu_0_data_master_requests_OUT_LEDR_8_Bits_s1),
      .cpu_0_data_master_requests_RAM_s1                           (cpu_0_data_master_requests_RAM_s1),
      .cpu_0_data_master_requests_ROM_s1                           (cpu_0_data_master_requests_ROM_s1),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module          (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_waitrequest                               (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_jtag_debug_module_readdata_from_sa                    (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_FLAG_1_bit_s1_end_xfer                                   (d1_FLAG_1_bit_s1_end_xfer),
      .d1_IN_MSB_1_bit_s1_end_xfer                                 (d1_IN_MSB_1_bit_s1_end_xfer),
      .d1_KEY1_1_bit_s1_end_xfer                                   (d1_KEY1_1_bit_s1_end_xfer),
      .d1_LEDG_1_bit_s1_end_xfer                                   (d1_LEDG_1_bit_s1_end_xfer),
      .d1_OUT_LEDR_8_Bits_s1_end_xfer                              (d1_OUT_LEDR_8_Bits_s1_end_xfer),
      .d1_RAM_s1_end_xfer                                          (d1_RAM_s1_end_xfer),
      .d1_ROM_s1_end_xfer                                          (d1_ROM_s1_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                         (d1_cpu_0_jtag_debug_module_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_RAM_s1         (registered_cpu_0_data_master_read_data_valid_RAM_s1),
      .registered_cpu_0_data_master_read_data_valid_ROM_s1         (registered_cpu_0_data_master_read_data_valid_ROM_s1),
      .reset_n                                                     (clk_0_reset_n)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .RAM_s1_readdata_from_sa                                            (RAM_s1_readdata_from_sa),
      .ROM_s1_readdata_from_sa                                            (ROM_s1_readdata_from_sa),
      .clk                                                                (clk_0),
      .cpu_0_instruction_master_address                                   (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_RAM_s1                            (cpu_0_instruction_master_granted_RAM_s1),
      .cpu_0_instruction_master_granted_ROM_s1                            (cpu_0_instruction_master_granted_ROM_s1),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_RAM_s1                  (cpu_0_instruction_master_qualified_request_RAM_s1),
      .cpu_0_instruction_master_qualified_request_ROM_s1                  (cpu_0_instruction_master_qualified_request_ROM_s1),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_RAM_s1                    (cpu_0_instruction_master_read_data_valid_RAM_s1),
      .cpu_0_instruction_master_read_data_valid_ROM_s1                    (cpu_0_instruction_master_read_data_valid_ROM_s1),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_readdata                                  (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_requests_RAM_s1                           (cpu_0_instruction_master_requests_RAM_s1),
      .cpu_0_instruction_master_requests_ROM_s1                           (cpu_0_instruction_master_requests_ROM_s1),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_waitrequest                               (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_RAM_s1_end_xfer                                                 (d1_RAM_s1_end_xfer),
      .d1_ROM_s1_end_xfer                                                 (d1_ROM_s1_end_xfer),
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
  Lab_3_Nios_processor_reset_clk_0_domain_synch_module Lab_3_Nios_processor_reset_clk_0_domain_synch
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
`include "IN_MSB_1_bit.v"
`include "ROM.v"
`include "RAM.v"
`include "LEDG_1_bit.v"
`include "OUT_LEDR_8_Bits.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "KEY1_1_bit.v"
`include "FLAG_1_bit.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             clk;
  reg              clk_0;
  wire             in_port_to_the_IN_MSB_1_bit;
  wire             in_port_to_the_KEY1_1_bit;
  wire             out_port_from_the_FLAG_1_bit;
  wire             out_port_from_the_LEDG_1_bit;
  wire    [  7: 0] out_port_from_the_OUT_LEDR_8_Bits;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  Lab_3_Nios_processor DUT
    (
      .clk_0                             (clk_0),
      .in_port_to_the_IN_MSB_1_bit       (in_port_to_the_IN_MSB_1_bit),
      .in_port_to_the_KEY1_1_bit         (in_port_to_the_KEY1_1_bit),
      .out_port_from_the_FLAG_1_bit      (out_port_from_the_FLAG_1_bit),
      .out_port_from_the_LEDG_1_bit      (out_port_from_the_LEDG_1_bit),
      .out_port_from_the_OUT_LEDR_8_Bits (out_port_from_the_OUT_LEDR_8_Bits),
      .reset_n                           (reset_n)
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