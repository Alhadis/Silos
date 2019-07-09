////////////////////////////////////////////////////////////////
// 
// FILE: ht6116_tb
//
//AUTHOR: JOHN MARSHALL
//
// DESCRIPTION: This file is a test bench for the memory chip ht6116
// Run this file against a model of the ht6116 and it will detect:
// -Faulty address lines
// -Faulty data lines
// -Bad memory locations
// -Improper IO timing
//
// Datasheet for memory chip: 
// http://web.mit.edu/6.115/www/document/6116.pdf
//
// To run this in ModelSim on the command line:
//
//    vlib work    <--- do this only once
//
//    vlog all.v my.v verilog.v files.v
//
//    vsim ht6116_tb -L 220model_ver \
//         -L altera_mf_ver -c -do "run -all"
//
// This can also run with the GUI -- leave off the '-c' in the above
// command.
//
// 
//
// REVISIONS:
// 
//
////////////////////////////////////////////////////////////////



//Address to data access time is 35 ns, a good chip then shoul have data in
//40ns, we will test for that here.
`timescale 1ns/10ps


module ht6116_tb();

   // Component signals:
   reg [07:00] datain, dataout;
   reg [10:00] address;
   reg reset_L, we_L, cs_L, oe_L, read_writet;
   wire [07:00] dataIO, dataOO;

   integer delay;
   integer error_count;

//Instance the Device under test (DUT)
//EDIT THE NAME AS NEEDED FOR TESTING
//
IDT6116SA15 dut(
   .RESET(reset_L), //active low reset? 
   .IO(dataIO),
   .A(address),
   .WE_N(we_L),
   .OE_N(oe_L),
   .CS_N(cs_L)
);


    assign dataIO = (read_writet == 1) ? datain : 8'bZ;          
    assign dataOO = (read_writet == 0) ? dataIO : 8'bZ;

   // Stimulus block: provide inputs to DUT
   initial begin
 
      //SET DELAY HERE, 35 or less will NOT work
      delay = 40; 
      error_count = 0;

      reset_L = 0;
      we_L = 1'b1; //not writing yet
      cs_L = 1'b1; //chip is in standby or high Z
      oe_L = 1'b0; //sending output, but still high Z
      address = 11'b0;
      datain = 8'b0;
      dataout = 8'b0; 
      read_writet = 1'b1;
      #delay
      cs_L = 1'b0; //take chip out of high Z, now we are in read state
      we_L = 1'b0; //now we are writing data to the chip

      datain = 8'b0; 

      for(address = 0; address < 2047; address = address + 1) begin
        #delay we_L = 1'b1;
        datain = datain + 8'b1;  
        #delay we_L = 1'b0;
      end

       //all the address should be written, now check them
       we_L = 1'b1; // no longer writing
       read_writet = 1'b0; //switch direction
       #delay
       datain = 8'b1;

      for(address = 0; address < 2047; address = address + 1) begin
        #delay 
        if(!(dataIO === datain)) begin
            error_count = error_count + 1;
            $display($time,": Device is BAD");
            $finish;
        end
        datain = datain + 1; 
     end


      //Tranistion to writing
      we_L = 1'b0;
      read_writet = 1'b1;

      //Begining test for dataline issue (stuck at zero)
      datain = 8'b11111111;
      for(address = 0; address < 2047; address = address + 1) begin
        #delay we_L = 1'b1;  
        datain = 8'b11111111;
        #delay we_L = 1'b0;
      end

      //Switch to reading
      read_writet = 1'b0;
      we_L = 1'b1;
      #delay

      for(address = 0; address < 2047; address = address + 1) begin
        #delay 
        if(!(dataIO === 8'b11111111)) begin
            error_count = error_count + 1;
            $display($time,": Device is BAD");
            $finish;
        end
     end


      //Continued test for dataline issue (stuck at one)
      read_writet = 1'b1;
      datain = 8'b00000000;
      we_L = 1'b0;
      for(address = 0; address < 2047; address = address + 1) begin
        #delay we_L = 1'b1;  
        datain = 8'b00000000;
        #delay we_L = 1'b0;
      end

      //Switch to reading
      read_writet = 1'b0;
      we_L = 1'b1;

      for(address = 0; address < 2047; address = address + 1) begin
        #delay 
        if(!(dataIO === 8'b00000000)) begin
            error_count = error_count + 1;
            $display($time,": Device is BAD");
            $finish;
        end
     end

   $display($time,": Device is GOOD");
   $finish;

   end

endmodule
