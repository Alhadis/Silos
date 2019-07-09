//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  Zbus device (master/slave) model                                        //
//                                                                          //
//  Copyright (C) 2009  Iztok Jeras                                         //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  This RTL is free hardware: you can redistribute it and/or modify        //
//  it under the terms of the GNU Lesser General Public License             //
//  as published by the Free Software Foundation, either                    //
//  version 3 of the License, or (at your option) any later version.        //
//                                                                          //
//  This RTL is distributed in the hope that it will be useful,             //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of          //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           //
//  GNU General Public License for more details.                            //
//                                                                          //
//  You should have received a copy of the GNU General Public License       //
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.   //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////

`timescale  1ns / 1ps

module zbus #(
  // essential bus parameters
  parameter ZON = 1,         // number of zbus output busses
  parameter ZOW = ZON*32,    // sum of all zbus output bus widths
  parameter ZIN = 1,         // number of zbus input busses
  parameter ZIW = ZIN*32,    // sum of all zbus output bus widths
  // software interface parameters
  parameter FNW = "",        // file name for write file
  parameter FNR = "",        // file name for read  file
  // presentation
  parameter NAME   = "noname",
  parameter AUTO   = 0
)(
  // system signals
  input  wire           clk,
  input  wire           rst,
  // output interface
  output reg  [ZON-1:0] zo_req,   // transfer request
  output reg  [ZOW-1:0] zo_bus,   // payload
  input  wire [ZON-1:0] zo_ack,   // transfer acknowledge (bus ready)
  // input interface
  input  wire [ZIN-1:0] zi_req,   // transfer request
  input  wire [ZIW-1:0] zi_bus,   // payload
  output reg  [ZIN-1:0] zi_ack    // transfer acknowledge (bus ready)
);

//////////////////////////////////////////////////////////////////////////////
// local parameters and signals                                             //
//////////////////////////////////////////////////////////////////////////////

reg  [ZON-1:0] zo_req_r;
reg  [ZOW-1:0] zo_bus_r;
reg  [ZIN-1:0] zo_ack_r;

// bus transfer and bus readr signals
wire [ZON-1:0] zo_trn;
wire [ZIN-1:0] zi_trn;

// master status
reg     run = 0;   // master running status

// file pointer and access status
integer fpw, fsw = 0; // write file
integer fpr, fsr = 0; // read  file

// program file parsing variables
reg [  3*8-1:0] inst;

///////////////////////////////////////////////////////////////////////////////
// initialization and on request tasks                                       //
///////////////////////////////////////////////////////////////////////////////

initial begin
  $display ("DEBUG: Starting master");
  if (AUTO)  start (FNW, FNR);
end

task start (
  input reg [256*8-1:0] fnw,
  input reg [256*8-1:0] fnr,
); begin
  // write file
  $display ("DEBUG: Opening write file.");
  if (fnw != "")  fpw = $fopen (fnw, "w");
  else debug_missing_file_name ();
  // read files are opened
  $display ("DEBUG: Opening read  file.");
  if (fnr != "")  fpr = $fopen (fnr, "r");
  else debug_missing_file_name ();
  run = 1;
end endtask

task stop; begin
  run = 0;
end endtask

task debug_missing_file_name (); begin
  $display ("ERROR: No zbus output port file specified!");
  $finish;
end

///////////////////////////////////////////////////////////////////////////////
// implementation                                                            //
///////////////////////////////////////////////////////////////////////////////

// bus transfer in progres event
assign zo_trn = zo_req & zo_ack;
assign zi_trn = zi_req & zi_ack;

reg loop;

always @ (posedge clk, posedge rst)
if (rst) begin
  // set the bus into an idle state
  zo_req <= 1'b0;
  zo_bus <= {ZOW{IDLE}};
end else if (run) begin
  // file writes
  $fdisplay ("zbus:w %h %h %h\n", zi_req, zo_ack, zi_bus);
  $fdisplay (fp_zi_wf, "%h %h %h\n", zi_req, zo_ack, zi_bus);
  // file reads
//  loop = 0;
//  while (loop == 0) begin
  fs_zo = $fscanf (fp_zo_rf, "%h %h %h\n", zo_req_r, zi_ack_r, zo_bus_r);
//  end
  $display ("zbus:r %h %h %h\n", zo_req_r, zi_ack_r, zo_bus_r);
  zo_req <= zo_req_r;
  zo_bus <= zo_bus_r;
  zi_ack <= zi_ack_r;
end


endmodule
