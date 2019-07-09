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

  output  [ 11: 0] RAM_s1_address;
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
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 16: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [ 11: 0] RAM_s1_address;
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
  wire    [ 16: 0] shifted_address_to_RAM_s1_from_cpu_0_data_master;
  wire    [ 16: 0] shifted_address_to_RAM_s1_from_cpu_0_instruction_master;
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

  assign cpu_0_data_master_requests_RAM_s1 = ({cpu_0_data_master_address_to_slave[16 : 14] , 14'b0} == 17'hc000) & (cpu_0_data_master_read | cpu_0_data_master_write);
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

  assign cpu_0_instruction_master_requests_RAM_s1 = (({cpu_0_instruction_master_address_to_slave[16 : 14] , 14'b0} == 17'hc000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

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

  output  [ 11: 0] ROM_s1_address;
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
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 16: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [ 11: 0] ROM_s1_address;
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
  wire    [ 16: 0] shifted_address_to_ROM_s1_from_cpu_0_data_master;
  wire    [ 16: 0] shifted_address_to_ROM_s1_from_cpu_0_instruction_master;
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

  assign cpu_0_data_master_requests_ROM_s1 = ({cpu_0_data_master_address_to_slave[16 : 14] , 14'b0} == 17'h8000) & (cpu_0_data_master_read | cpu_0_data_master_write);
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

  assign cpu_0_instruction_master_requests_ROM_s1 = (({cpu_0_instruction_master_address_to_slave[16 : 14] , 14'b0} == 17'h8000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

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
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 16: 0] cpu_0_instruction_master_address_to_slave;
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
  wire    [ 16: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 16: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
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

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[16 : 11] , 11'b0} == 17'h10800) & (cpu_0_data_master_read | cpu_0_data_master_write);
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

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[16 : 11] , 11'b0} == 17'h10800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       RAM_s1_readdata_from_sa,
                                       ROM_s1_readdata_from_sa,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_granted_RAM_s1,
                                       cpu_0_data_master_granted_ROM_s1,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_in_KEY1_s1,
                                       cpu_0_data_master_granted_in_MSB_interrupt_s1,
                                       cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_granted_uart_0_s1,
                                       cpu_0_data_master_qualified_request_RAM_s1,
                                       cpu_0_data_master_qualified_request_ROM_s1,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_in_KEY1_s1,
                                       cpu_0_data_master_qualified_request_in_MSB_interrupt_s1,
                                       cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_qualified_request_uart_0_s1,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_RAM_s1,
                                       cpu_0_data_master_read_data_valid_ROM_s1,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_in_KEY1_s1,
                                       cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1,
                                       cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_read_data_valid_uart_0_s1,
                                       cpu_0_data_master_requests_RAM_s1,
                                       cpu_0_data_master_requests_ROM_s1,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_in_KEY1_s1,
                                       cpu_0_data_master_requests_in_MSB_interrupt_s1,
                                       cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_requests_uart_0_s1,
                                       cpu_0_data_master_write,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_RAM_s1_end_xfer,
                                       d1_ROM_s1_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_in_KEY1_s1_end_xfer,
                                       d1_in_MSB_interrupt_s1_end_xfer,
                                       d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                       d1_uart_0_s1_end_xfer,
                                       in_KEY1_s1_readdata_from_sa,
                                       in_MSB_interrupt_s1_irq_from_sa,
                                       in_MSB_interrupt_s1_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                       registered_cpu_0_data_master_read_data_valid_RAM_s1,
                                       registered_cpu_0_data_master_read_data_valid_ROM_s1,
                                       reset_n,
                                       uart_0_s1_irq_from_sa,
                                       uart_0_s1_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 16: 0] cpu_0_data_master_address_to_slave;
  output  [ 31: 0] cpu_0_data_master_irq;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input   [ 31: 0] RAM_s1_readdata_from_sa;
  input   [ 31: 0] ROM_s1_readdata_from_sa;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_granted_RAM_s1;
  input            cpu_0_data_master_granted_ROM_s1;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_in_KEY1_s1;
  input            cpu_0_data_master_granted_in_MSB_interrupt_s1;
  input            cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_granted_uart_0_s1;
  input            cpu_0_data_master_qualified_request_RAM_s1;
  input            cpu_0_data_master_qualified_request_ROM_s1;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_in_KEY1_s1;
  input            cpu_0_data_master_qualified_request_in_MSB_interrupt_s1;
  input            cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_qualified_request_uart_0_s1;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_RAM_s1;
  input            cpu_0_data_master_read_data_valid_ROM_s1;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_in_KEY1_s1;
  input            cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1;
  input            cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_read_data_valid_uart_0_s1;
  input            cpu_0_data_master_requests_RAM_s1;
  input            cpu_0_data_master_requests_ROM_s1;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_in_KEY1_s1;
  input            cpu_0_data_master_requests_in_MSB_interrupt_s1;
  input            cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_requests_uart_0_s1;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_RAM_s1_end_xfer;
  input            d1_ROM_s1_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_in_KEY1_s1_end_xfer;
  input            d1_in_MSB_interrupt_s1_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_uart_0_s1_end_xfer;
  input   [ 31: 0] in_KEY1_s1_readdata_from_sa;
  input            in_MSB_interrupt_s1_irq_from_sa;
  input   [ 31: 0] in_MSB_interrupt_s1_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input            registered_cpu_0_data_master_read_data_valid_RAM_s1;
  input            registered_cpu_0_data_master_read_data_valid_ROM_s1;
  input            reset_n;
  input            uart_0_s1_irq_from_sa;
  input   [ 15: 0] uart_0_s1_readdata_from_sa;

  wire    [ 16: 0] cpu_0_data_master_address_to_slave;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  wire    [ 31: 0] p1_registered_cpu_0_data_master_readdata;
  wire             r_0;
  wire             r_1;
  reg     [ 31: 0] registered_cpu_0_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_RAM_s1 | registered_cpu_0_data_master_read_data_valid_RAM_s1 | ~cpu_0_data_master_requests_RAM_s1) & (cpu_0_data_master_granted_RAM_s1 | ~cpu_0_data_master_qualified_request_RAM_s1) & ((~cpu_0_data_master_qualified_request_RAM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_RAM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_RAM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_ROM_s1 | registered_cpu_0_data_master_read_data_valid_ROM_s1 | ~cpu_0_data_master_requests_ROM_s1) & (cpu_0_data_master_granted_ROM_s1 | ~cpu_0_data_master_qualified_request_ROM_s1) & ((~cpu_0_data_master_qualified_request_ROM_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_ROM_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_ROM_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_in_KEY1_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_in_KEY1_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_in_MSB_interrupt_s1 | ~cpu_0_data_master_requests_in_MSB_interrupt_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_in_MSB_interrupt_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_in_MSB_interrupt_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & ((~cpu_0_data_master_qualified_request_uart_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_uart_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[16 : 0];

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_RAM_s1}} | RAM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_ROM_s1}} | ROM_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_in_KEY1_s1}} | in_KEY1_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_in_MSB_interrupt_s1}} | in_MSB_interrupt_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_uart_0_s1}} | uart_0_s1_readdata_from_sa);

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
    uart_0_s1_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa,
    in_MSB_interrupt_s1_irq_from_sa};

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_0_data_master_readdata <= 0;
      else 
        registered_cpu_0_data_master_readdata <= p1_registered_cpu_0_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_0_data_master_readdata = {32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

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

  output  [ 16: 0] cpu_0_instruction_master_address_to_slave;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_waitrequest;
  input   [ 31: 0] RAM_s1_readdata_from_sa;
  input   [ 31: 0] ROM_s1_readdata_from_sa;
  input            clk;
  input   [ 16: 0] cpu_0_instruction_master_address;
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
  reg     [ 16: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 16: 0] cpu_0_instruction_master_address_to_slave;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_RAM_s1 | cpu_0_instruction_master_read_data_valid_RAM_s1 | ~cpu_0_instruction_master_requests_RAM_s1) & (cpu_0_instruction_master_granted_RAM_s1 | ~cpu_0_instruction_master_qualified_request_RAM_s1) & ((~cpu_0_instruction_master_qualified_request_RAM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_RAM_s1 & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_ROM_s1 | cpu_0_instruction_master_read_data_valid_ROM_s1 | ~cpu_0_instruction_master_requests_ROM_s1) & (cpu_0_instruction_master_granted_ROM_s1 | ~cpu_0_instruction_master_qualified_request_ROM_s1) & ((~cpu_0_instruction_master_qualified_request_ROM_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_ROM_s1 & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[16 : 0];

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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module in_KEY1_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_read,
                                cpu_0_data_master_write,
                                in_KEY1_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_0_data_master_granted_in_KEY1_s1,
                                cpu_0_data_master_qualified_request_in_KEY1_s1,
                                cpu_0_data_master_read_data_valid_in_KEY1_s1,
                                cpu_0_data_master_requests_in_KEY1_s1,
                                d1_in_KEY1_s1_end_xfer,
                                in_KEY1_s1_address,
                                in_KEY1_s1_readdata_from_sa,
                                in_KEY1_s1_reset_n
                             )
;

  output           cpu_0_data_master_granted_in_KEY1_s1;
  output           cpu_0_data_master_qualified_request_in_KEY1_s1;
  output           cpu_0_data_master_read_data_valid_in_KEY1_s1;
  output           cpu_0_data_master_requests_in_KEY1_s1;
  output           d1_in_KEY1_s1_end_xfer;
  output  [  1: 0] in_KEY1_s1_address;
  output  [ 31: 0] in_KEY1_s1_readdata_from_sa;
  output           in_KEY1_s1_reset_n;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] in_KEY1_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_in_KEY1_s1;
  wire             cpu_0_data_master_qualified_request_in_KEY1_s1;
  wire             cpu_0_data_master_read_data_valid_in_KEY1_s1;
  wire             cpu_0_data_master_requests_in_KEY1_s1;
  wire             cpu_0_data_master_saved_grant_in_KEY1_s1;
  reg              d1_in_KEY1_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_in_KEY1_s1;
  wire    [  1: 0] in_KEY1_s1_address;
  wire             in_KEY1_s1_allgrants;
  wire             in_KEY1_s1_allow_new_arb_cycle;
  wire             in_KEY1_s1_any_bursting_master_saved_grant;
  wire             in_KEY1_s1_any_continuerequest;
  wire             in_KEY1_s1_arb_counter_enable;
  reg              in_KEY1_s1_arb_share_counter;
  wire             in_KEY1_s1_arb_share_counter_next_value;
  wire             in_KEY1_s1_arb_share_set_values;
  wire             in_KEY1_s1_beginbursttransfer_internal;
  wire             in_KEY1_s1_begins_xfer;
  wire             in_KEY1_s1_end_xfer;
  wire             in_KEY1_s1_firsttransfer;
  wire             in_KEY1_s1_grant_vector;
  wire             in_KEY1_s1_in_a_read_cycle;
  wire             in_KEY1_s1_in_a_write_cycle;
  wire             in_KEY1_s1_master_qreq_vector;
  wire             in_KEY1_s1_non_bursting_master_requests;
  wire    [ 31: 0] in_KEY1_s1_readdata_from_sa;
  reg              in_KEY1_s1_reg_firsttransfer;
  wire             in_KEY1_s1_reset_n;
  reg              in_KEY1_s1_slavearbiterlockenable;
  wire             in_KEY1_s1_slavearbiterlockenable2;
  wire             in_KEY1_s1_unreg_firsttransfer;
  wire             in_KEY1_s1_waits_for_read;
  wire             in_KEY1_s1_waits_for_write;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 16: 0] shifted_address_to_in_KEY1_s1_from_cpu_0_data_master;
  wire             wait_for_in_KEY1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~in_KEY1_s1_end_xfer;
    end


  assign in_KEY1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_in_KEY1_s1));
  //assign in_KEY1_s1_readdata_from_sa = in_KEY1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign in_KEY1_s1_readdata_from_sa = in_KEY1_s1_readdata;

  assign cpu_0_data_master_requests_in_KEY1_s1 = (({cpu_0_data_master_address_to_slave[16 : 4] , 4'b0} == 17'h11020) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //in_KEY1_s1_arb_share_counter set values, which is an e_mux
  assign in_KEY1_s1_arb_share_set_values = 1;

  //in_KEY1_s1_non_bursting_master_requests mux, which is an e_mux
  assign in_KEY1_s1_non_bursting_master_requests = cpu_0_data_master_requests_in_KEY1_s1;

  //in_KEY1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign in_KEY1_s1_any_bursting_master_saved_grant = 0;

  //in_KEY1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign in_KEY1_s1_arb_share_counter_next_value = in_KEY1_s1_firsttransfer ? (in_KEY1_s1_arb_share_set_values - 1) : |in_KEY1_s1_arb_share_counter ? (in_KEY1_s1_arb_share_counter - 1) : 0;

  //in_KEY1_s1_allgrants all slave grants, which is an e_mux
  assign in_KEY1_s1_allgrants = |in_KEY1_s1_grant_vector;

  //in_KEY1_s1_end_xfer assignment, which is an e_assign
  assign in_KEY1_s1_end_xfer = ~(in_KEY1_s1_waits_for_read | in_KEY1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_in_KEY1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_in_KEY1_s1 = in_KEY1_s1_end_xfer & (~in_KEY1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //in_KEY1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign in_KEY1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_in_KEY1_s1 & in_KEY1_s1_allgrants) | (end_xfer_arb_share_counter_term_in_KEY1_s1 & ~in_KEY1_s1_non_bursting_master_requests);

  //in_KEY1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_KEY1_s1_arb_share_counter <= 0;
      else if (in_KEY1_s1_arb_counter_enable)
          in_KEY1_s1_arb_share_counter <= in_KEY1_s1_arb_share_counter_next_value;
    end


  //in_KEY1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_KEY1_s1_slavearbiterlockenable <= 0;
      else if ((|in_KEY1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_in_KEY1_s1) | (end_xfer_arb_share_counter_term_in_KEY1_s1 & ~in_KEY1_s1_non_bursting_master_requests))
          in_KEY1_s1_slavearbiterlockenable <= |in_KEY1_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master in_KEY1/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = in_KEY1_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //in_KEY1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign in_KEY1_s1_slavearbiterlockenable2 = |in_KEY1_s1_arb_share_counter_next_value;

  //cpu_0/data_master in_KEY1/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = in_KEY1_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //in_KEY1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign in_KEY1_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_in_KEY1_s1 = cpu_0_data_master_requests_in_KEY1_s1;
  //master is always granted when requested
  assign cpu_0_data_master_granted_in_KEY1_s1 = cpu_0_data_master_qualified_request_in_KEY1_s1;

  //cpu_0/data_master saved-grant in_KEY1/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_in_KEY1_s1 = cpu_0_data_master_requests_in_KEY1_s1;

  //allow new arb cycle for in_KEY1/s1, which is an e_assign
  assign in_KEY1_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign in_KEY1_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign in_KEY1_s1_master_qreq_vector = 1;

  //in_KEY1_s1_reset_n assignment, which is an e_assign
  assign in_KEY1_s1_reset_n = reset_n;

  //in_KEY1_s1_firsttransfer first transaction, which is an e_assign
  assign in_KEY1_s1_firsttransfer = in_KEY1_s1_begins_xfer ? in_KEY1_s1_unreg_firsttransfer : in_KEY1_s1_reg_firsttransfer;

  //in_KEY1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign in_KEY1_s1_unreg_firsttransfer = ~(in_KEY1_s1_slavearbiterlockenable & in_KEY1_s1_any_continuerequest);

  //in_KEY1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_KEY1_s1_reg_firsttransfer <= 1'b1;
      else if (in_KEY1_s1_begins_xfer)
          in_KEY1_s1_reg_firsttransfer <= in_KEY1_s1_unreg_firsttransfer;
    end


  //in_KEY1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign in_KEY1_s1_beginbursttransfer_internal = in_KEY1_s1_begins_xfer;

  assign shifted_address_to_in_KEY1_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //in_KEY1_s1_address mux, which is an e_mux
  assign in_KEY1_s1_address = shifted_address_to_in_KEY1_s1_from_cpu_0_data_master >> 2;

  //d1_in_KEY1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_KEY1_s1_end_xfer <= 1;
      else 
        d1_in_KEY1_s1_end_xfer <= in_KEY1_s1_end_xfer;
    end


  //in_KEY1_s1_waits_for_read in a cycle, which is an e_mux
  assign in_KEY1_s1_waits_for_read = in_KEY1_s1_in_a_read_cycle & in_KEY1_s1_begins_xfer;

  //in_KEY1_s1_in_a_read_cycle assignment, which is an e_assign
  assign in_KEY1_s1_in_a_read_cycle = cpu_0_data_master_granted_in_KEY1_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = in_KEY1_s1_in_a_read_cycle;

  //in_KEY1_s1_waits_for_write in a cycle, which is an e_mux
  assign in_KEY1_s1_waits_for_write = in_KEY1_s1_in_a_write_cycle & 0;

  //in_KEY1_s1_in_a_write_cycle assignment, which is an e_assign
  assign in_KEY1_s1_in_a_write_cycle = cpu_0_data_master_granted_in_KEY1_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = in_KEY1_s1_in_a_write_cycle;

  assign wait_for_in_KEY1_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //in_KEY1/s1 enable non-zero assertions, which is an e_register
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module in_MSB_interrupt_s1_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_waitrequest,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         in_MSB_interrupt_s1_irq,
                                         in_MSB_interrupt_s1_readdata,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_in_MSB_interrupt_s1,
                                         cpu_0_data_master_qualified_request_in_MSB_interrupt_s1,
                                         cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1,
                                         cpu_0_data_master_requests_in_MSB_interrupt_s1,
                                         d1_in_MSB_interrupt_s1_end_xfer,
                                         in_MSB_interrupt_s1_address,
                                         in_MSB_interrupt_s1_chipselect,
                                         in_MSB_interrupt_s1_irq_from_sa,
                                         in_MSB_interrupt_s1_readdata_from_sa,
                                         in_MSB_interrupt_s1_reset_n,
                                         in_MSB_interrupt_s1_write_n,
                                         in_MSB_interrupt_s1_writedata
                                      )
;

  output           cpu_0_data_master_granted_in_MSB_interrupt_s1;
  output           cpu_0_data_master_qualified_request_in_MSB_interrupt_s1;
  output           cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1;
  output           cpu_0_data_master_requests_in_MSB_interrupt_s1;
  output           d1_in_MSB_interrupt_s1_end_xfer;
  output  [  1: 0] in_MSB_interrupt_s1_address;
  output           in_MSB_interrupt_s1_chipselect;
  output           in_MSB_interrupt_s1_irq_from_sa;
  output  [ 31: 0] in_MSB_interrupt_s1_readdata_from_sa;
  output           in_MSB_interrupt_s1_reset_n;
  output           in_MSB_interrupt_s1_write_n;
  output  [ 31: 0] in_MSB_interrupt_s1_writedata;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            in_MSB_interrupt_s1_irq;
  input   [ 31: 0] in_MSB_interrupt_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_qualified_request_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_requests_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_saved_grant_in_MSB_interrupt_s1;
  reg              d1_in_MSB_interrupt_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_in_MSB_interrupt_s1;
  wire    [  1: 0] in_MSB_interrupt_s1_address;
  wire             in_MSB_interrupt_s1_allgrants;
  wire             in_MSB_interrupt_s1_allow_new_arb_cycle;
  wire             in_MSB_interrupt_s1_any_bursting_master_saved_grant;
  wire             in_MSB_interrupt_s1_any_continuerequest;
  wire             in_MSB_interrupt_s1_arb_counter_enable;
  reg              in_MSB_interrupt_s1_arb_share_counter;
  wire             in_MSB_interrupt_s1_arb_share_counter_next_value;
  wire             in_MSB_interrupt_s1_arb_share_set_values;
  wire             in_MSB_interrupt_s1_beginbursttransfer_internal;
  wire             in_MSB_interrupt_s1_begins_xfer;
  wire             in_MSB_interrupt_s1_chipselect;
  wire             in_MSB_interrupt_s1_end_xfer;
  wire             in_MSB_interrupt_s1_firsttransfer;
  wire             in_MSB_interrupt_s1_grant_vector;
  wire             in_MSB_interrupt_s1_in_a_read_cycle;
  wire             in_MSB_interrupt_s1_in_a_write_cycle;
  wire             in_MSB_interrupt_s1_irq_from_sa;
  wire             in_MSB_interrupt_s1_master_qreq_vector;
  wire             in_MSB_interrupt_s1_non_bursting_master_requests;
  wire    [ 31: 0] in_MSB_interrupt_s1_readdata_from_sa;
  reg              in_MSB_interrupt_s1_reg_firsttransfer;
  wire             in_MSB_interrupt_s1_reset_n;
  reg              in_MSB_interrupt_s1_slavearbiterlockenable;
  wire             in_MSB_interrupt_s1_slavearbiterlockenable2;
  wire             in_MSB_interrupt_s1_unreg_firsttransfer;
  wire             in_MSB_interrupt_s1_waits_for_read;
  wire             in_MSB_interrupt_s1_waits_for_write;
  wire             in_MSB_interrupt_s1_write_n;
  wire    [ 31: 0] in_MSB_interrupt_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 16: 0] shifted_address_to_in_MSB_interrupt_s1_from_cpu_0_data_master;
  wire             wait_for_in_MSB_interrupt_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~in_MSB_interrupt_s1_end_xfer;
    end


  assign in_MSB_interrupt_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_in_MSB_interrupt_s1));
  //assign in_MSB_interrupt_s1_readdata_from_sa = in_MSB_interrupt_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign in_MSB_interrupt_s1_readdata_from_sa = in_MSB_interrupt_s1_readdata;

  assign cpu_0_data_master_requests_in_MSB_interrupt_s1 = ({cpu_0_data_master_address_to_slave[16 : 4] , 4'b0} == 17'h11030) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //in_MSB_interrupt_s1_arb_share_counter set values, which is an e_mux
  assign in_MSB_interrupt_s1_arb_share_set_values = 1;

  //in_MSB_interrupt_s1_non_bursting_master_requests mux, which is an e_mux
  assign in_MSB_interrupt_s1_non_bursting_master_requests = cpu_0_data_master_requests_in_MSB_interrupt_s1;

  //in_MSB_interrupt_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign in_MSB_interrupt_s1_any_bursting_master_saved_grant = 0;

  //in_MSB_interrupt_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign in_MSB_interrupt_s1_arb_share_counter_next_value = in_MSB_interrupt_s1_firsttransfer ? (in_MSB_interrupt_s1_arb_share_set_values - 1) : |in_MSB_interrupt_s1_arb_share_counter ? (in_MSB_interrupt_s1_arb_share_counter - 1) : 0;

  //in_MSB_interrupt_s1_allgrants all slave grants, which is an e_mux
  assign in_MSB_interrupt_s1_allgrants = |in_MSB_interrupt_s1_grant_vector;

  //in_MSB_interrupt_s1_end_xfer assignment, which is an e_assign
  assign in_MSB_interrupt_s1_end_xfer = ~(in_MSB_interrupt_s1_waits_for_read | in_MSB_interrupt_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_in_MSB_interrupt_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_in_MSB_interrupt_s1 = in_MSB_interrupt_s1_end_xfer & (~in_MSB_interrupt_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //in_MSB_interrupt_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign in_MSB_interrupt_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_in_MSB_interrupt_s1 & in_MSB_interrupt_s1_allgrants) | (end_xfer_arb_share_counter_term_in_MSB_interrupt_s1 & ~in_MSB_interrupt_s1_non_bursting_master_requests);

  //in_MSB_interrupt_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_MSB_interrupt_s1_arb_share_counter <= 0;
      else if (in_MSB_interrupt_s1_arb_counter_enable)
          in_MSB_interrupt_s1_arb_share_counter <= in_MSB_interrupt_s1_arb_share_counter_next_value;
    end


  //in_MSB_interrupt_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_MSB_interrupt_s1_slavearbiterlockenable <= 0;
      else if ((|in_MSB_interrupt_s1_master_qreq_vector & end_xfer_arb_share_counter_term_in_MSB_interrupt_s1) | (end_xfer_arb_share_counter_term_in_MSB_interrupt_s1 & ~in_MSB_interrupt_s1_non_bursting_master_requests))
          in_MSB_interrupt_s1_slavearbiterlockenable <= |in_MSB_interrupt_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master in_MSB_interrupt/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = in_MSB_interrupt_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //in_MSB_interrupt_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign in_MSB_interrupt_s1_slavearbiterlockenable2 = |in_MSB_interrupt_s1_arb_share_counter_next_value;

  //cpu_0/data_master in_MSB_interrupt/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = in_MSB_interrupt_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //in_MSB_interrupt_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign in_MSB_interrupt_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_in_MSB_interrupt_s1 = cpu_0_data_master_requests_in_MSB_interrupt_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //in_MSB_interrupt_s1_writedata mux, which is an e_mux
  assign in_MSB_interrupt_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_in_MSB_interrupt_s1 = cpu_0_data_master_qualified_request_in_MSB_interrupt_s1;

  //cpu_0/data_master saved-grant in_MSB_interrupt/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_in_MSB_interrupt_s1 = cpu_0_data_master_requests_in_MSB_interrupt_s1;

  //allow new arb cycle for in_MSB_interrupt/s1, which is an e_assign
  assign in_MSB_interrupt_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign in_MSB_interrupt_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign in_MSB_interrupt_s1_master_qreq_vector = 1;

  //in_MSB_interrupt_s1_reset_n assignment, which is an e_assign
  assign in_MSB_interrupt_s1_reset_n = reset_n;

  assign in_MSB_interrupt_s1_chipselect = cpu_0_data_master_granted_in_MSB_interrupt_s1;
  //in_MSB_interrupt_s1_firsttransfer first transaction, which is an e_assign
  assign in_MSB_interrupt_s1_firsttransfer = in_MSB_interrupt_s1_begins_xfer ? in_MSB_interrupt_s1_unreg_firsttransfer : in_MSB_interrupt_s1_reg_firsttransfer;

  //in_MSB_interrupt_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign in_MSB_interrupt_s1_unreg_firsttransfer = ~(in_MSB_interrupt_s1_slavearbiterlockenable & in_MSB_interrupt_s1_any_continuerequest);

  //in_MSB_interrupt_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          in_MSB_interrupt_s1_reg_firsttransfer <= 1'b1;
      else if (in_MSB_interrupt_s1_begins_xfer)
          in_MSB_interrupt_s1_reg_firsttransfer <= in_MSB_interrupt_s1_unreg_firsttransfer;
    end


  //in_MSB_interrupt_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign in_MSB_interrupt_s1_beginbursttransfer_internal = in_MSB_interrupt_s1_begins_xfer;

  //~in_MSB_interrupt_s1_write_n assignment, which is an e_mux
  assign in_MSB_interrupt_s1_write_n = ~(cpu_0_data_master_granted_in_MSB_interrupt_s1 & cpu_0_data_master_write);

  assign shifted_address_to_in_MSB_interrupt_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //in_MSB_interrupt_s1_address mux, which is an e_mux
  assign in_MSB_interrupt_s1_address = shifted_address_to_in_MSB_interrupt_s1_from_cpu_0_data_master >> 2;

  //d1_in_MSB_interrupt_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_MSB_interrupt_s1_end_xfer <= 1;
      else 
        d1_in_MSB_interrupt_s1_end_xfer <= in_MSB_interrupt_s1_end_xfer;
    end


  //in_MSB_interrupt_s1_waits_for_read in a cycle, which is an e_mux
  assign in_MSB_interrupt_s1_waits_for_read = in_MSB_interrupt_s1_in_a_read_cycle & in_MSB_interrupt_s1_begins_xfer;

  //in_MSB_interrupt_s1_in_a_read_cycle assignment, which is an e_assign
  assign in_MSB_interrupt_s1_in_a_read_cycle = cpu_0_data_master_granted_in_MSB_interrupt_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = in_MSB_interrupt_s1_in_a_read_cycle;

  //in_MSB_interrupt_s1_waits_for_write in a cycle, which is an e_mux
  assign in_MSB_interrupt_s1_waits_for_write = in_MSB_interrupt_s1_in_a_write_cycle & 0;

  //in_MSB_interrupt_s1_in_a_write_cycle assignment, which is an e_assign
  assign in_MSB_interrupt_s1_in_a_write_cycle = cpu_0_data_master_granted_in_MSB_interrupt_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = in_MSB_interrupt_s1_in_a_write_cycle;

  assign wait_for_in_MSB_interrupt_s1_counter = 0;
  //assign in_MSB_interrupt_s1_irq_from_sa = in_MSB_interrupt_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign in_MSB_interrupt_s1_irq_from_sa = in_MSB_interrupt_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //in_MSB_interrupt/s1 enable non-zero assertions, which is an e_register
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_waitrequest,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg              jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 16: 0] shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_0_data_master_address_to_slave[16 : 3] , 3'b0} == 17'h11040) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write);

  assign shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart_0_s1_arbitrator (
                              // inputs:
                               clk,
                               cpu_0_data_master_address_to_slave,
                               cpu_0_data_master_read,
                               cpu_0_data_master_write,
                               cpu_0_data_master_writedata,
                               reset_n,
                               uart_0_s1_dataavailable,
                               uart_0_s1_irq,
                               uart_0_s1_readdata,
                               uart_0_s1_readyfordata,

                              // outputs:
                               cpu_0_data_master_granted_uart_0_s1,
                               cpu_0_data_master_qualified_request_uart_0_s1,
                               cpu_0_data_master_read_data_valid_uart_0_s1,
                               cpu_0_data_master_requests_uart_0_s1,
                               d1_uart_0_s1_end_xfer,
                               uart_0_s1_address,
                               uart_0_s1_begintransfer,
                               uart_0_s1_chipselect,
                               uart_0_s1_dataavailable_from_sa,
                               uart_0_s1_irq_from_sa,
                               uart_0_s1_read_n,
                               uart_0_s1_readdata_from_sa,
                               uart_0_s1_readyfordata_from_sa,
                               uart_0_s1_reset_n,
                               uart_0_s1_write_n,
                               uart_0_s1_writedata
                            )
;

  output           cpu_0_data_master_granted_uart_0_s1;
  output           cpu_0_data_master_qualified_request_uart_0_s1;
  output           cpu_0_data_master_read_data_valid_uart_0_s1;
  output           cpu_0_data_master_requests_uart_0_s1;
  output           d1_uart_0_s1_end_xfer;
  output  [  2: 0] uart_0_s1_address;
  output           uart_0_s1_begintransfer;
  output           uart_0_s1_chipselect;
  output           uart_0_s1_dataavailable_from_sa;
  output           uart_0_s1_irq_from_sa;
  output           uart_0_s1_read_n;
  output  [ 15: 0] uart_0_s1_readdata_from_sa;
  output           uart_0_s1_readyfordata_from_sa;
  output           uart_0_s1_reset_n;
  output           uart_0_s1_write_n;
  output  [ 15: 0] uart_0_s1_writedata;
  input            clk;
  input   [ 16: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            uart_0_s1_dataavailable;
  input            uart_0_s1_irq;
  input   [ 15: 0] uart_0_s1_readdata;
  input            uart_0_s1_readyfordata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_uart_0_s1;
  wire             cpu_0_data_master_qualified_request_uart_0_s1;
  wire             cpu_0_data_master_read_data_valid_uart_0_s1;
  wire             cpu_0_data_master_requests_uart_0_s1;
  wire             cpu_0_data_master_saved_grant_uart_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_uart_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_uart_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 16: 0] shifted_address_to_uart_0_s1_from_cpu_0_data_master;
  wire    [  2: 0] uart_0_s1_address;
  wire             uart_0_s1_allgrants;
  wire             uart_0_s1_allow_new_arb_cycle;
  wire             uart_0_s1_any_bursting_master_saved_grant;
  wire             uart_0_s1_any_continuerequest;
  wire             uart_0_s1_arb_counter_enable;
  reg              uart_0_s1_arb_share_counter;
  wire             uart_0_s1_arb_share_counter_next_value;
  wire             uart_0_s1_arb_share_set_values;
  wire             uart_0_s1_beginbursttransfer_internal;
  wire             uart_0_s1_begins_xfer;
  wire             uart_0_s1_begintransfer;
  wire             uart_0_s1_chipselect;
  wire             uart_0_s1_dataavailable_from_sa;
  wire             uart_0_s1_end_xfer;
  wire             uart_0_s1_firsttransfer;
  wire             uart_0_s1_grant_vector;
  wire             uart_0_s1_in_a_read_cycle;
  wire             uart_0_s1_in_a_write_cycle;
  wire             uart_0_s1_irq_from_sa;
  wire             uart_0_s1_master_qreq_vector;
  wire             uart_0_s1_non_bursting_master_requests;
  wire             uart_0_s1_read_n;
  wire    [ 15: 0] uart_0_s1_readdata_from_sa;
  wire             uart_0_s1_readyfordata_from_sa;
  reg              uart_0_s1_reg_firsttransfer;
  wire             uart_0_s1_reset_n;
  reg              uart_0_s1_slavearbiterlockenable;
  wire             uart_0_s1_slavearbiterlockenable2;
  wire             uart_0_s1_unreg_firsttransfer;
  wire             uart_0_s1_waits_for_read;
  wire             uart_0_s1_waits_for_write;
  wire             uart_0_s1_write_n;
  wire    [ 15: 0] uart_0_s1_writedata;
  wire             wait_for_uart_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~uart_0_s1_end_xfer;
    end


  assign uart_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_uart_0_s1));
  //assign uart_0_s1_readdata_from_sa = uart_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_readdata_from_sa = uart_0_s1_readdata;

  assign cpu_0_data_master_requests_uart_0_s1 = ({cpu_0_data_master_address_to_slave[16 : 5] , 5'b0} == 17'h11000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign uart_0_s1_dataavailable_from_sa = uart_0_s1_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_dataavailable_from_sa = uart_0_s1_dataavailable;

  //assign uart_0_s1_readyfordata_from_sa = uart_0_s1_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_readyfordata_from_sa = uart_0_s1_readyfordata;

  //uart_0_s1_arb_share_counter set values, which is an e_mux
  assign uart_0_s1_arb_share_set_values = 1;

  //uart_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign uart_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_uart_0_s1;

  //uart_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign uart_0_s1_any_bursting_master_saved_grant = 0;

  //uart_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign uart_0_s1_arb_share_counter_next_value = uart_0_s1_firsttransfer ? (uart_0_s1_arb_share_set_values - 1) : |uart_0_s1_arb_share_counter ? (uart_0_s1_arb_share_counter - 1) : 0;

  //uart_0_s1_allgrants all slave grants, which is an e_mux
  assign uart_0_s1_allgrants = |uart_0_s1_grant_vector;

  //uart_0_s1_end_xfer assignment, which is an e_assign
  assign uart_0_s1_end_xfer = ~(uart_0_s1_waits_for_read | uart_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_uart_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_uart_0_s1 = uart_0_s1_end_xfer & (~uart_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //uart_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign uart_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_uart_0_s1 & uart_0_s1_allgrants) | (end_xfer_arb_share_counter_term_uart_0_s1 & ~uart_0_s1_non_bursting_master_requests);

  //uart_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_0_s1_arb_share_counter <= 0;
      else if (uart_0_s1_arb_counter_enable)
          uart_0_s1_arb_share_counter <= uart_0_s1_arb_share_counter_next_value;
    end


  //uart_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_0_s1_slavearbiterlockenable <= 0;
      else if ((|uart_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_uart_0_s1) | (end_xfer_arb_share_counter_term_uart_0_s1 & ~uart_0_s1_non_bursting_master_requests))
          uart_0_s1_slavearbiterlockenable <= |uart_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master uart_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = uart_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //uart_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign uart_0_s1_slavearbiterlockenable2 = |uart_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master uart_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = uart_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //uart_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign uart_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_uart_0_s1 = cpu_0_data_master_requests_uart_0_s1;
  //uart_0_s1_writedata mux, which is an e_mux
  assign uart_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_uart_0_s1 = cpu_0_data_master_qualified_request_uart_0_s1;

  //cpu_0/data_master saved-grant uart_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_uart_0_s1 = cpu_0_data_master_requests_uart_0_s1;

  //allow new arb cycle for uart_0/s1, which is an e_assign
  assign uart_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign uart_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign uart_0_s1_master_qreq_vector = 1;

  assign uart_0_s1_begintransfer = uart_0_s1_begins_xfer;
  //uart_0_s1_reset_n assignment, which is an e_assign
  assign uart_0_s1_reset_n = reset_n;

  assign uart_0_s1_chipselect = cpu_0_data_master_granted_uart_0_s1;
  //uart_0_s1_firsttransfer first transaction, which is an e_assign
  assign uart_0_s1_firsttransfer = uart_0_s1_begins_xfer ? uart_0_s1_unreg_firsttransfer : uart_0_s1_reg_firsttransfer;

  //uart_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign uart_0_s1_unreg_firsttransfer = ~(uart_0_s1_slavearbiterlockenable & uart_0_s1_any_continuerequest);

  //uart_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_0_s1_reg_firsttransfer <= 1'b1;
      else if (uart_0_s1_begins_xfer)
          uart_0_s1_reg_firsttransfer <= uart_0_s1_unreg_firsttransfer;
    end


  //uart_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign uart_0_s1_beginbursttransfer_internal = uart_0_s1_begins_xfer;

  //~uart_0_s1_read_n assignment, which is an e_mux
  assign uart_0_s1_read_n = ~(cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_read);

  //~uart_0_s1_write_n assignment, which is an e_mux
  assign uart_0_s1_write_n = ~(cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_uart_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //uart_0_s1_address mux, which is an e_mux
  assign uart_0_s1_address = shifted_address_to_uart_0_s1_from_cpu_0_data_master >> 2;

  //d1_uart_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_uart_0_s1_end_xfer <= 1;
      else 
        d1_uart_0_s1_end_xfer <= uart_0_s1_end_xfer;
    end


  //uart_0_s1_waits_for_read in a cycle, which is an e_mux
  assign uart_0_s1_waits_for_read = uart_0_s1_in_a_read_cycle & uart_0_s1_begins_xfer;

  //uart_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign uart_0_s1_in_a_read_cycle = cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = uart_0_s1_in_a_read_cycle;

  //uart_0_s1_waits_for_write in a cycle, which is an e_mux
  assign uart_0_s1_waits_for_write = uart_0_s1_in_a_write_cycle & uart_0_s1_begins_xfer;

  //uart_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign uart_0_s1_in_a_write_cycle = cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = uart_0_s1_in_a_write_cycle;

  assign wait_for_uart_0_s1_counter = 0;
  //assign uart_0_s1_irq_from_sa = uart_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_irq_from_sa = uart_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uart_0/s1 enable non-zero assertions, which is an e_register
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_processor_reset_clk_0_domain_synch_module (
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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_processor (
                        // 1) global signals:
                         clk_0,
                         reset_n,

                        // the_in_KEY1
                         in_port_to_the_in_KEY1,

                        // the_in_MSB_interrupt
                         in_port_to_the_in_MSB_interrupt,

                        // the_uart_0
                         rxd_to_the_uart_0,
                         txd_from_the_uart_0
                      )
;

  output           txd_from_the_uart_0;
  input            clk_0;
  input            in_port_to_the_in_KEY1;
  input            in_port_to_the_in_MSB_interrupt;
  input            reset_n;
  input            rxd_to_the_uart_0;

  wire    [ 11: 0] RAM_s1_address;
  wire    [  3: 0] RAM_s1_byteenable;
  wire             RAM_s1_chipselect;
  wire             RAM_s1_clken;
  wire    [ 31: 0] RAM_s1_readdata;
  wire    [ 31: 0] RAM_s1_readdata_from_sa;
  wire             RAM_s1_reset;
  wire             RAM_s1_write;
  wire    [ 31: 0] RAM_s1_writedata;
  wire    [ 11: 0] ROM_s1_address;
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
  wire    [ 16: 0] cpu_0_data_master_address;
  wire    [ 16: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_RAM_s1;
  wire             cpu_0_data_master_granted_ROM_s1;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_in_KEY1_s1;
  wire             cpu_0_data_master_granted_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_granted_uart_0_s1;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_qualified_request_RAM_s1;
  wire             cpu_0_data_master_qualified_request_ROM_s1;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_in_KEY1_s1;
  wire             cpu_0_data_master_qualified_request_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_uart_0_s1;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_in_KEY1_s1;
  wire             cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_uart_0_s1;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_RAM_s1;
  wire             cpu_0_data_master_requests_ROM_s1;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_in_KEY1_s1;
  wire             cpu_0_data_master_requests_in_MSB_interrupt_s1;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_uart_0_s1;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 16: 0] cpu_0_instruction_master_address;
  wire    [ 16: 0] cpu_0_instruction_master_address_to_slave;
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
  wire             d1_RAM_s1_end_xfer;
  wire             d1_ROM_s1_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_in_KEY1_s1_end_xfer;
  wire             d1_in_MSB_interrupt_s1_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_uart_0_s1_end_xfer;
  wire    [  1: 0] in_KEY1_s1_address;
  wire    [ 31: 0] in_KEY1_s1_readdata;
  wire    [ 31: 0] in_KEY1_s1_readdata_from_sa;
  wire             in_KEY1_s1_reset_n;
  wire    [  1: 0] in_MSB_interrupt_s1_address;
  wire             in_MSB_interrupt_s1_chipselect;
  wire             in_MSB_interrupt_s1_irq;
  wire             in_MSB_interrupt_s1_irq_from_sa;
  wire    [ 31: 0] in_MSB_interrupt_s1_readdata;
  wire    [ 31: 0] in_MSB_interrupt_s1_readdata_from_sa;
  wire             in_MSB_interrupt_s1_reset_n;
  wire             in_MSB_interrupt_s1_write_n;
  wire    [ 31: 0] in_MSB_interrupt_s1_writedata;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             registered_cpu_0_data_master_read_data_valid_RAM_s1;
  wire             registered_cpu_0_data_master_read_data_valid_ROM_s1;
  wire             reset_n_sources;
  wire             txd_from_the_uart_0;
  wire    [  2: 0] uart_0_s1_address;
  wire             uart_0_s1_begintransfer;
  wire             uart_0_s1_chipselect;
  wire             uart_0_s1_dataavailable;
  wire             uart_0_s1_dataavailable_from_sa;
  wire             uart_0_s1_irq;
  wire             uart_0_s1_irq_from_sa;
  wire             uart_0_s1_read_n;
  wire    [ 15: 0] uart_0_s1_readdata;
  wire    [ 15: 0] uart_0_s1_readdata_from_sa;
  wire             uart_0_s1_readyfordata;
  wire             uart_0_s1_readyfordata_from_sa;
  wire             uart_0_s1_reset_n;
  wire             uart_0_s1_write_n;
  wire    [ 15: 0] uart_0_s1_writedata;
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
      .RAM_s1_readdata_from_sa                                           (RAM_s1_readdata_from_sa),
      .ROM_s1_readdata_from_sa                                           (ROM_s1_readdata_from_sa),
      .clk                                                               (clk_0),
      .cpu_0_data_master_address                                         (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_RAM_s1                                  (cpu_0_data_master_granted_RAM_s1),
      .cpu_0_data_master_granted_ROM_s1                                  (cpu_0_data_master_granted_ROM_s1),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                 (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_in_KEY1_s1                              (cpu_0_data_master_granted_in_KEY1_s1),
      .cpu_0_data_master_granted_in_MSB_interrupt_s1                     (cpu_0_data_master_granted_in_MSB_interrupt_s1),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_granted_uart_0_s1                               (cpu_0_data_master_granted_uart_0_s1),
      .cpu_0_data_master_irq                                             (cpu_0_data_master_irq),
      .cpu_0_data_master_qualified_request_RAM_s1                        (cpu_0_data_master_qualified_request_RAM_s1),
      .cpu_0_data_master_qualified_request_ROM_s1                        (cpu_0_data_master_qualified_request_ROM_s1),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module       (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_in_KEY1_s1                    (cpu_0_data_master_qualified_request_in_KEY1_s1),
      .cpu_0_data_master_qualified_request_in_MSB_interrupt_s1           (cpu_0_data_master_qualified_request_in_MSB_interrupt_s1),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_uart_0_s1                     (cpu_0_data_master_qualified_request_uart_0_s1),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_RAM_s1                          (cpu_0_data_master_read_data_valid_RAM_s1),
      .cpu_0_data_master_read_data_valid_ROM_s1                          (cpu_0_data_master_read_data_valid_ROM_s1),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module         (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_in_KEY1_s1                      (cpu_0_data_master_read_data_valid_in_KEY1_s1),
      .cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1             (cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_uart_0_s1                       (cpu_0_data_master_read_data_valid_uart_0_s1),
      .cpu_0_data_master_readdata                                        (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_RAM_s1                                 (cpu_0_data_master_requests_RAM_s1),
      .cpu_0_data_master_requests_ROM_s1                                 (cpu_0_data_master_requests_ROM_s1),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_in_KEY1_s1                             (cpu_0_data_master_requests_in_KEY1_s1),
      .cpu_0_data_master_requests_in_MSB_interrupt_s1                    (cpu_0_data_master_requests_in_MSB_interrupt_s1),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_uart_0_s1                              (cpu_0_data_master_requests_uart_0_s1),
      .cpu_0_data_master_waitrequest                                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_jtag_debug_module_readdata_from_sa                          (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_RAM_s1_end_xfer                                                (d1_RAM_s1_end_xfer),
      .d1_ROM_s1_end_xfer                                                (d1_ROM_s1_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                               (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_in_KEY1_s1_end_xfer                                            (d1_in_KEY1_s1_end_xfer),
      .d1_in_MSB_interrupt_s1_end_xfer                                   (d1_in_MSB_interrupt_s1_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_uart_0_s1_end_xfer                                             (d1_uart_0_s1_end_xfer),
      .in_KEY1_s1_readdata_from_sa                                       (in_KEY1_s1_readdata_from_sa),
      .in_MSB_interrupt_s1_irq_from_sa                                   (in_MSB_interrupt_s1_irq_from_sa),
      .in_MSB_interrupt_s1_readdata_from_sa                              (in_MSB_interrupt_s1_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .registered_cpu_0_data_master_read_data_valid_RAM_s1               (registered_cpu_0_data_master_read_data_valid_RAM_s1),
      .registered_cpu_0_data_master_read_data_valid_ROM_s1               (registered_cpu_0_data_master_read_data_valid_ROM_s1),
      .reset_n                                                           (clk_0_reset_n),
      .uart_0_s1_irq_from_sa                                             (uart_0_s1_irq_from_sa),
      .uart_0_s1_readdata_from_sa                                        (uart_0_s1_readdata_from_sa)
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

  in_KEY1_s1_arbitrator the_in_KEY1_s1
    (
      .clk                                            (clk_0),
      .cpu_0_data_master_address_to_slave             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_in_KEY1_s1           (cpu_0_data_master_granted_in_KEY1_s1),
      .cpu_0_data_master_qualified_request_in_KEY1_s1 (cpu_0_data_master_qualified_request_in_KEY1_s1),
      .cpu_0_data_master_read                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_in_KEY1_s1   (cpu_0_data_master_read_data_valid_in_KEY1_s1),
      .cpu_0_data_master_requests_in_KEY1_s1          (cpu_0_data_master_requests_in_KEY1_s1),
      .cpu_0_data_master_write                        (cpu_0_data_master_write),
      .d1_in_KEY1_s1_end_xfer                         (d1_in_KEY1_s1_end_xfer),
      .in_KEY1_s1_address                             (in_KEY1_s1_address),
      .in_KEY1_s1_readdata                            (in_KEY1_s1_readdata),
      .in_KEY1_s1_readdata_from_sa                    (in_KEY1_s1_readdata_from_sa),
      .in_KEY1_s1_reset_n                             (in_KEY1_s1_reset_n),
      .reset_n                                        (clk_0_reset_n)
    );

  in_KEY1 the_in_KEY1
    (
      .address  (in_KEY1_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_in_KEY1),
      .readdata (in_KEY1_s1_readdata),
      .reset_n  (in_KEY1_s1_reset_n)
    );

  in_MSB_interrupt_s1_arbitrator the_in_MSB_interrupt_s1
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_in_MSB_interrupt_s1           (cpu_0_data_master_granted_in_MSB_interrupt_s1),
      .cpu_0_data_master_qualified_request_in_MSB_interrupt_s1 (cpu_0_data_master_qualified_request_in_MSB_interrupt_s1),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1   (cpu_0_data_master_read_data_valid_in_MSB_interrupt_s1),
      .cpu_0_data_master_requests_in_MSB_interrupt_s1          (cpu_0_data_master_requests_in_MSB_interrupt_s1),
      .cpu_0_data_master_waitrequest                           (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                             (cpu_0_data_master_writedata),
      .d1_in_MSB_interrupt_s1_end_xfer                         (d1_in_MSB_interrupt_s1_end_xfer),
      .in_MSB_interrupt_s1_address                             (in_MSB_interrupt_s1_address),
      .in_MSB_interrupt_s1_chipselect                          (in_MSB_interrupt_s1_chipselect),
      .in_MSB_interrupt_s1_irq                                 (in_MSB_interrupt_s1_irq),
      .in_MSB_interrupt_s1_irq_from_sa                         (in_MSB_interrupt_s1_irq_from_sa),
      .in_MSB_interrupt_s1_readdata                            (in_MSB_interrupt_s1_readdata),
      .in_MSB_interrupt_s1_readdata_from_sa                    (in_MSB_interrupt_s1_readdata_from_sa),
      .in_MSB_interrupt_s1_reset_n                             (in_MSB_interrupt_s1_reset_n),
      .in_MSB_interrupt_s1_write_n                             (in_MSB_interrupt_s1_write_n),
      .in_MSB_interrupt_s1_writedata                           (in_MSB_interrupt_s1_writedata),
      .reset_n                                                 (clk_0_reset_n)
    );

  in_MSB_interrupt the_in_MSB_interrupt
    (
      .address    (in_MSB_interrupt_s1_address),
      .chipselect (in_MSB_interrupt_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_in_MSB_interrupt),
      .irq        (in_MSB_interrupt_s1_irq),
      .readdata   (in_MSB_interrupt_s1_readdata),
      .reset_n    (in_MSB_interrupt_s1_reset_n),
      .write_n    (in_MSB_interrupt_s1_write_n),
      .writedata  (in_MSB_interrupt_s1_writedata)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                               (clk_0),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_waitrequest                                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                             (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                          (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                       (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa               (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                 (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                              (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                            (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                        (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                             (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                         (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                             (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                           (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                           (clk_0_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clk_0),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  uart_0_s1_arbitrator the_uart_0_s1
    (
      .clk                                           (clk_0),
      .cpu_0_data_master_address_to_slave            (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_uart_0_s1           (cpu_0_data_master_granted_uart_0_s1),
      .cpu_0_data_master_qualified_request_uart_0_s1 (cpu_0_data_master_qualified_request_uart_0_s1),
      .cpu_0_data_master_read                        (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_uart_0_s1   (cpu_0_data_master_read_data_valid_uart_0_s1),
      .cpu_0_data_master_requests_uart_0_s1          (cpu_0_data_master_requests_uart_0_s1),
      .cpu_0_data_master_write                       (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                   (cpu_0_data_master_writedata),
      .d1_uart_0_s1_end_xfer                         (d1_uart_0_s1_end_xfer),
      .reset_n                                       (clk_0_reset_n),
      .uart_0_s1_address                             (uart_0_s1_address),
      .uart_0_s1_begintransfer                       (uart_0_s1_begintransfer),
      .uart_0_s1_chipselect                          (uart_0_s1_chipselect),
      .uart_0_s1_dataavailable                       (uart_0_s1_dataavailable),
      .uart_0_s1_dataavailable_from_sa               (uart_0_s1_dataavailable_from_sa),
      .uart_0_s1_irq                                 (uart_0_s1_irq),
      .uart_0_s1_irq_from_sa                         (uart_0_s1_irq_from_sa),
      .uart_0_s1_read_n                              (uart_0_s1_read_n),
      .uart_0_s1_readdata                            (uart_0_s1_readdata),
      .uart_0_s1_readdata_from_sa                    (uart_0_s1_readdata_from_sa),
      .uart_0_s1_readyfordata                        (uart_0_s1_readyfordata),
      .uart_0_s1_readyfordata_from_sa                (uart_0_s1_readyfordata_from_sa),
      .uart_0_s1_reset_n                             (uart_0_s1_reset_n),
      .uart_0_s1_write_n                             (uart_0_s1_write_n),
      .uart_0_s1_writedata                           (uart_0_s1_writedata)
    );

  uart_0 the_uart_0
    (
      .address       (uart_0_s1_address),
      .begintransfer (uart_0_s1_begintransfer),
      .chipselect    (uart_0_s1_chipselect),
      .clk           (clk_0),
      .dataavailable (uart_0_s1_dataavailable),
      .irq           (uart_0_s1_irq),
      .read_n        (uart_0_s1_read_n),
      .readdata      (uart_0_s1_readdata),
      .readyfordata  (uart_0_s1_readyfordata),
      .reset_n       (uart_0_s1_reset_n),
      .rxd           (rxd_to_the_uart_0),
      .txd           (txd_from_the_uart_0),
      .write_n       (uart_0_s1_write_n),
      .writedata     (uart_0_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_processor_reset_clk_0_domain_synch_module nios_processor_reset_clk_0_domain_synch
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

`include "c:/altera/12.0sp2/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/12.0sp2/quartus/eda/sim_lib/220model.v"
`include "c:/altera/12.0sp2/quartus/eda/sim_lib/sgate.v"
`include "ROM.v"
`include "in_KEY1.v"
`include "RAM.v"
`include "jtag_uart_0.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "uart_0.v"
`include "in_MSB_interrupt.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             clk;
  reg              clk_0;
  wire             in_port_to_the_in_KEY1;
  wire             in_port_to_the_in_MSB_interrupt;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              reset_n;
  wire             rxd_to_the_uart_0;
  wire             txd_from_the_uart_0;
  wire             uart_0_s1_dataavailable_from_sa;
  wire             uart_0_s1_readyfordata_from_sa;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios_processor DUT
    (
      .clk_0                           (clk_0),
      .in_port_to_the_in_KEY1          (in_port_to_the_in_KEY1),
      .in_port_to_the_in_MSB_interrupt (in_port_to_the_in_MSB_interrupt),
      .reset_n                         (reset_n),
      .rxd_to_the_uart_0               (rxd_to_the_uart_0),
      .txd_from_the_uart_0             (txd_from_the_uart_0)
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