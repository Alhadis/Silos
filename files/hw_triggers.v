/*
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.      
*/

//==============================================================||
// File Name: 		hw_triggers.v				||
// Author:    		Kitty Wang				||
// Description: 						||
//	      		hardware trigger module                 ||
// History:   							||
//                      2019/5/27 				||
//                      First version				||
//===============================================================

`include "core_defines.vh"
`include "dbg_defines.vh"

module hw_triggers (
//global signals
input wire cpu_clk,					//cpu clock
input wire cpu_rstn,					//cpu reset, active low

//trigger regs
input [`DATA_WIDTH - 1 : 0] tdata1_t0,			//tdata1 for trigger0
input [`DATA_WIDTH - 1 : 0] tdata1_t1,			//tdata1 for trigger0
input [`DATA_WIDTH - 1 : 0] tdata2_t0,                  //tdata2 for trigger0
input [`DATA_WIDTH - 1 : 0] tdata2_t1,                  //tdata3 for trigger0
input [`DATA_WIDTH - 1 : 0] tdata3_t0,                  //tdata2 for trigger1
input [`DATA_WIDTH - 1 : 0] tdata3_t1,                  //tdata3 for trigger1
//trigger sources
input [`ADDR_WIDTH - 1 : 0] pc_ex,			//PC at EX stage
input load_ex,						//load at EX stage
input store_ex,						//store at EX stage
input [`ADDR_WIDTH - 1 : 0] mem_addr_ex,		//load/store address at EX stage

input dbg_mode,						//debug mode
output breakpoint					//breakpoint met
/*
,
output reg breakpoint_exp	//just a breakpoint exception
*/

);


//tdata1_t0 decode
wire [3:0] data1_type_t0 = tdata1_t0[(`DATA_WIDTH - 1) : (`DATA_WIDTH - 4)];
wire dmode_t0 = tdata1_t0[`DATA_WIDTH - 5];

//mcontrol when tdata1.data1_type == 2

wire mctrl_type_t0 = (data1_type_t0 == 2);

wire [3:0] action_t0 = mctrl_type_t0 ? tdata1_t0[15:12] : 4'h0;
wire chain_t0 = mctrl_type_t0 ? tdata1_t0[11] : 1'h0;
wire m_prv_t0 = mctrl_type_t0 ? tdata1_t0[6] : 1'h0;
wire execute_t0 = mctrl_type_t0 ? tdata1_t0[2] : 1'h0;
wire store_t0 = mctrl_type_t0 ? tdata1_t0[1] : 1'h0;
wire load_t0 = mctrl_type_t0 ? tdata1_t0[0] : 1'h0;



wire[2:0] trigger0_type = {execute_t0,store_t0,load_t0};
//trigger0
reg trigger0;

always @ *
begin
	if(m_prv_t0 && !dbg_mode)	//select trigger0 at M priviledge
	begin
		case (trigger0_type)
		3'b001: begin			//load
			if(load_ex && (mem_addr_ex == tdata2_t0))
			trigger0 = 1'b1;
			else
			trigger0 = 1'b0;
		end
		3'b010: begin			//store
			if(store_ex && (mem_addr_ex == tdata2_t0))
			trigger0 = 1'b1;
			else
			trigger0 = 1'b0;
		end
		3'b100: begin			//pc
			if((pc_ex == tdata2_t0) && (|pc_ex))
			trigger0 = 1'b1;
			else
			trigger0 = 1'b0;
		end
		default: trigger0 = 1'b0;
		endcase
	end
	else
	begin
		trigger0 = 1'b0;
	end
end


//trigger1
//tdata1_t1 decode
wire [3:0] data1_type_t1 = tdata1_t1[(`DATA_WIDTH - 1) : (`DATA_WIDTH - 4)];
wire dmode_t1 = tdata1_t1[`DATA_WIDTH - 5];

//mcontrol when tdata1.data1_type == 2

wire mctrl_type_t1 = (data1_type_t1 == 2);

wire [3:0] action_t1 = mctrl_type_t1 ? tdata1_t1[15:12] : 4'h0;
wire chain_t1 = mctrl_type_t1 ? tdata1_t1[11] : 1'h0;
wire m_prv_t1 = mctrl_type_t1 ? tdata1_t1[6] : 1'h0;
wire execute_t1 = mctrl_type_t1 ? tdata1_t1[2] : 1'h0;
wire store_t1 = mctrl_type_t1 ? tdata1_t1[1] : 1'h0;
wire load_t1 = mctrl_type_t1 ? tdata1_t1[0] : 1'h0;

wire[2:0] trigger1_type = {execute_t1,store_t1,load_t1};
reg trigger1;

always @ *
begin
	if( m_prv_t1 && !dbg_mode)	//select trigger1 at M priviledge
	begin
		case (trigger1_type)
		3'b001: begin			//load
			if(load_ex && (mem_addr_ex == tdata2_t1))
			trigger1 = 1'b1;
			else
			trigger1 = 1'b0;
		end
		3'b010: begin			//store
			if(store_ex && (mem_addr_ex == tdata2_t1))
			trigger1 = 1'b1;
			else
			trigger1 = 1'b0;
		end
		3'b100: begin			//pc
			if(pc_ex == tdata2_t1)
			trigger1 = 1'b1;
			else
			trigger1 = 1'b0;
		end
		default: trigger1 = 1'b0;
		endcase
	end
	else
	begin
		trigger1 = 1'b0;
	end
end

//action with the trigger
wire action_breakpoint_t0 = action_t0 == 4'h1;
assign trigger0_breakpoint = dmode_t0 && trigger0 && action_breakpoint_t0 && !dbg_mode;

wire action_breakpoint_t1 = action_t1 == 4'h1;
wire trigger1_final = (trigger1 && ((chain_t0 && trigger0) || !chain_t0));
assign trigger1_breakpoint = dmode_t1 && trigger1_final && action_breakpoint_t1 && !dbg_mode;


//breakpoint

assign breakpoint = trigger0_breakpoint || trigger1_breakpoint;

/*
//breakpoint_exception
wire action_breakpoint_exp = action == 4'h0;

assign breakpoint = dmode && trigger && action_breakpoint_exp && !dbg_mode;
*/


endmodule
