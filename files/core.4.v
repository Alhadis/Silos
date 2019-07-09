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
// File Name: 		core.v					||
// Author:    		Kitty Wang				||
// Description: 						||
//	      		top of core 			     	|| 
// History:   							||
//===============================================================

`include "core_defines.vh"

module core (
//global signals 
	input  wire cpu_clk,						//cpu clock
	input  wire cpu_rstn,						//cpu reset, active low
	input  wire [`ADDR_WIDTH - 1 : 0] boot_addr,			// boot address from SoC

//interface with pg_ctrl
	input  wire pg_resetn,						//power gating reset, active low
	output wire wfi,						//WFI

//interface with kplic
	input  wire kplic_int,						//kplic interrupt

//interface with core_timer
	input wire core_timer_int,					//core_timer interrupt

//instr_dec interface access itcm
	output wire instr_itcm_access,					//instruction interface access ITCM
	output wire [`ADDR_WIDTH - 1 : 0] instr_itcm_addr,		//instruction interface access ITCM address
	input  wire [`DATA_WIDTH - 1 : 0] instr_itcm_read_data,		//instruction interface access ITCM read data
	input  wire instr_itcm_read_data_valid,				//instruction interface access ITCM read data valid
	input  wire itcm_auto_load,					//ITCM is in auto-load process

//data interface access dtcm
	output wire data_dtcm_access,	      				//data interface access DTCM
	input  wire data_dtcm_ready,					//DTCM is ready for data interface access
	output wire data_dtcm_rd0_wr1,					//data interface access DTCM cmd 0: read; 1: write	
	output wire [3:0] data_dtcm_byte_strobe,			//data interface access DTCM byte strobe    	
	output wire [`DATA_WIDTH - 1 : 0]  data_dtcm_write_data,	//data interface access DTCM write data		
	output wire [`ADDR_WIDTH - 1 : 0] data_dtcm_addr,		//data interface access DTCM address		
	input  wire [`DATA_WIDTH - 1 : 0] data_dtcm_read_data,		//data interface access DTCM read data		
	input  wire data_dtcm_read_data_valid,				//data interface access DTCM read data valid	

//with IAHB
	output wire IAHB_access,					//IAHB access 
	output wire [`ADDR_WIDTH - 1 : 0] IAHB_addr,			//IAHB access address         	
	input  wire [`DATA_WIDTH - 1 : 0] IAHB_read_data,		//IAHB access read data
	input  wire IAHB_read_data_valid,				//IAHB access read data valid

//with DAHB
	output wire DAHB_access,					//DAHB access 	
	output wire DAHB_rd0_wr1,					//DAHB access cmd 0: read; 1: write	
	output wire [2:0] DAHB_size,					//DAHB access byte strobe
	output wire [`DATA_WIDTH - 1 : 0]  DAHB_write_data,		//DAHB access write data
	output wire [`ADDR_WIDTH - 1 : 0] DAHB_addr,			//DAHB access address	
	input  wire DAHB_trans_buffer_full,				//DAHB access transfer buffer full
	input  wire [`DATA_WIDTH - 1 : 0] DAHB_read_data,		//DAHB access read data
	input  wire DAHB_read_data_valid				//DAHB access read data valid	

`ifdef KRV_HAS_DBG
//debug interface
	,
	input wire				resumereq_w1,		//write 1 to resumereq 
	input wire				dbg_reg_access,		//debugger access register
	input wire 				dbg_wr1_rd0,		//debugger access register cmd 0: read; 1: write
	input wire[`CMD_REGNO_SIZE - 1 : 0]	dbg_regno,		//debugger access register number
	input wire[`DATA_WIDTH - 1 : 0]		dbg_write_data,		//debugger access register write data
	output wire [`DATA_WIDTH - 1 : 0]	dbg_read_data,		//debugger access register read data
	output wire                     	dbg_read_data_valid	//debugger access register read data valid
`endif


);


//---------------------------------------------//
//Wires declaration
//---------------------------------------------//

`ifdef KRV_HAS_DBG
wire                     	dbg_gprs_read_data_valid;
wire                     	dbg_csrs_read_data_valid;
wire                     	dbg_t_regs_read_data_valid;
wire[`DATA_WIDTH - 1 : 0]	dbg_gprs_read_data;
wire[`DATA_WIDTH - 1 : 0]	dbg_csrs_read_data;
wire[`DATA_WIDTH - 1 : 0]	dbg_t_regs_read_data;
assign dbg_read_data = dbg_gprs_read_data | dbg_csrs_read_data | dbg_t_regs_read_data;
assign dbg_read_data_valid = dbg_gprs_read_data_valid | dbg_csrs_read_data_valid | dbg_t_regs_read_data_valid;
`endif

wire 					jal_dec;
wire 					jalr_ex;
wire 					fence_dec;
wire [`ADDR_WIDTH - 1 : 0] 		pc_dec;

wire [`RD_WIDTH:0] 			rd_ex;
wire signed [`DATA_WIDTH - 1 : 0]  	src_data1_ex;	
wire signed [`DATA_WIDTH - 1 : 0]  	src_data2_ex;	
wire signed [`DATA_WIDTH - 1 : 0] 	imm_ex;
wire signed [`DATA_WIDTH - 1 : 0] 	imm_dec;
wire					alu_add_ex  ;
wire					alu_sub_ex  ;
wire					alu_com_ex  ;
wire					alu_ucom_ex ;
wire					alu_and_ex  ;
wire					alu_or_ex   ;
wire					alu_xor_ex  ;
wire					alu_sll_ex  ;
wire					alu_srl_ex  ;
wire					alu_sra_ex  ;
wire					alu_mul_ex  ;
wire					alu_mulh_ex  ;
wire					alu_mulhsu_ex  ;
wire					alu_mulhu_ex  ;
wire					alu_rem_ex  ;
wire					alu_remu_ex  ;
wire					alu_div_ex  ;
wire					alu_divu_ex  ;
wire 					beq_ex;
wire 					bne_ex;
wire 					blt_ex;
wire 					bge_ex;
wire 					bltu_ex;
wire 					bgeu_ex;
wire 					branch_taken_ex;
wire [`DATA_WIDTH - 1 : 0]		alu_result_ex;				
wire 					load_ex;
wire 					store_ex;
wire 					mem_H_ex;
wire 					mem_B_ex;
wire 					mem_U_ex;
wire [`DATA_WIDTH - 1 : 0] 		store_data_ex;
wire 					only_src2_used_ex;	
wire [`ADDR_WIDTH - 1 : 0] 		pc_ex;
wire [`ADDR_WIDTH - 1 : 0]		mem_addr_ex;

wire [`DATA_WIDTH - 1 : 0]		data_mem;				
wire [`RD_WIDTH:0] 			rd_mem;
wire [`DATA_WIDTH - 1 : 0]		alu_result_mem;		
wire 					load_mem;
wire 					store_mem;
wire 					mem_H_mem;
wire 					mem_B_mem;
wire 					mem_U_mem;
wire [`DATA_WIDTH - 1 : 0]		store_data_mem;
wire [`ADDR_WIDTH - 1 : 0]		mem_addr_mem;
wire 					mem_wb_data_valid;
wire 					load_wait_data;

wire [`RD_WIDTH:0] 			rd_wb;
wire signed [`DATA_WIDTH - 1 : 0]	wr_data_wb;					
wire 					wr_valid_wb;
wire [`DATA_WIDTH - 1 : 0]		alu_result_wb;				
wire 					alu_result_valid_wb;
wire 					load_wb;	
wire [`DATA_WIDTH - 1 : 0] 		load_data_wb;
wire 					load_data_valid_wb;


 wire [11:0] 				mcsr_addr;
 wire 					mcsr_rd;
 wire 					mcsr_wr;
 wire 					valid_mcsr_rd;
 wire 					valid_mcsr_wr;
 wire 					mcsr_set;
 wire 					mcsr_clr;
 wire 					meip;		
 wire 					mtip;		
 wire 					meie;		
 wire 					mtie;		
 wire [`ADDR_WIDTH - 1 : 0] 		mepc;		
 wire [`ADDR_WIDTH - 1 : 0] 		dpc;		
 wire [`DATA_WIDTH - 1 : 0] 		mcause;	
 wire [`DATA_WIDTH - 1 : 0] 		mtval;	
 wire [`DATA_WIDTH - 1 : 0] 		mcsr_write_data;
 wire [`DATA_WIDTH - 1 : 0] 		mcsr_read_data;
 wire 					dtcm_en;
 wire [`ADDR_WIDTH - 1 : 0] 		dtcm_start_addr;

wire [`ADDR_WIDTH - 1 : 0] 		pc;
wire 					pc_misaligned;
wire 					load_x0;
wire 					csr_illegal_access;
wire [`ADDR_WIDTH - 1 : 0] 		fault_pc;	 
wire 					trap;
wire 					exception_met;
wire 					ecall;
wire 					instr_illegal;
wire 					ebreak;
wire  [`ADDR_WIDTH - 1 : 0] 		vector_addr;
wire 					mret;
wire 					mepc_sel;
wire 					mcause_sel;
wire 					mtval_sel;

`ifdef KRV_HAS_DBG
wire                        		step;	
wire                        		single_step;	
wire                        		single_step_d1;	
wire                        		single_step_d2;	
wire                        		single_step_d3;	
wire                        		single_step_d4;	
wire 					breakpoint;
wire 					dret;
wire					dbg_wr;
wire 					dbg_mode;
wire [`DATA_WIDTH - 1 : 0] 		d_regs_read_data;
`endif

wire [`INSTR_WIDTH - 1 : 0] 		illegal_instr;
wire 					valid_interrupt;
wire 					mstatus_mie;
wire [1:0] 				mtvec_mode;
wire [31:0] 				mtvec_base;


wire [`INSTR_WIDTH - 1 : 0] 		instr_dec	;
wire 					instr_read_data_valid;	
wire [`INSTR_WIDTH - 1 : 0] 		instr_read_data;
wire [`ADDR_WIDTH - 1 : 0] 		next_pc;

wire 					if_valid;
wire 					dec_valid;
wire 					ex_valid;
wire 					dec_ready;
wire 					ex_ready;
wire 					mem_ready;
wire 					wb_ready;

wire 					comb_rstn;

//===========================================================================//
//There are below blocks in the core
//--reset_comb
//--imem_ctrl
//--fetch
//--dec	
//--alu
//--dmem_ctrl
//--wb_ctrl
//--mcsr
//--trap_ctrl
//===========================================================================//

//-----------------------------------------------------//
//reset comb
//-----------------------------------------------------//

reset_comb u_reset_comb (
	.cpu_rstn	(cpu_rstn),
	.pg_resetn	(pg_resetn),
	.comb_rstn	(comb_rstn)
);
//-----------------------------------------------------//
//imem_ctrl
//-----------------------------------------------------//
imem_ctrl u_imem_ctrl(
.cpu_clk			(cpu_clk),		
.cpu_rstn			(comb_rstn),		
.next_pc			(next_pc),
.pc				(pc),	
.instr_read_data		(instr_read_data),
.instr_read_data_valid		(instr_read_data_valid),
.instr_itcm_access		(instr_itcm_access),	
.instr_itcm_addr		(instr_itcm_addr),
.instr_itcm_read_data		(instr_itcm_read_data),
.instr_itcm_read_data_valid	(instr_itcm_read_data_valid),
.itcm_auto_load			(itcm_auto_load),
.IAHB_access			(IAHB_access),	
.IAHB_addr			(IAHB_addr),
.IAHB_read_data			(IAHB_read_data),
.IAHB_read_data_valid		(IAHB_read_data_valid)
);
//-----------------------------------------------------//
//fetch
//-----------------------------------------------------//
fetch u_fetch(
.cpu_clk		(cpu_clk),		
.cpu_rstn		(comb_rstn),		
.boot_addr		(boot_addr),
.next_pc		(next_pc),	
.pc			(pc),	
.instr_read_data	(instr_read_data),
.instr_read_data_valid	(instr_read_data_valid),	
.pc_dec			(pc_dec),
.if_valid		(if_valid ),		
.dec_ready		(dec_ready),		
.instr_dec		(instr_dec ),	
.jal_dec		(jal_dec), 
.jalr_ex		(jalr_ex), 
.fence_dec		(fence_dec),
.pc_ex			(pc_ex),
.branch_taken_ex	(branch_taken_ex),
.src_data1_ex		(src_data1_ex ),
.imm_ex			(imm_ex),
.imm_dec		(imm_dec),
.mret			(mret),
`ifdef KRV_HAS_DBG
.ebreak			(ebreak),
.breakpoint		(breakpoint),
.dpc			(dpc),
.single_step		(single_step),
.single_step_d2		(single_step_d2),
.dret			(dret),
.dbg_mode		(dbg_mode	),
`endif
.pc_misaligned 		(pc_misaligned),
.fault_pc		(fault_pc),
.trap			(trap),
.vector_addr		(vector_addr),
.mepc			(mepc)

);

//-----------------------------------------------------//
//dec
//-----------------------------------------------------//

dec u_dec (
.cpu_clk		(cpu_clk ),	
.cpu_rstn		(comb_rstn ),	
.if_valid		(if_valid ),		
.dec_ready		(dec_ready),		
.instr_dec		(instr_dec ),
.pc_dec			(pc_dec),
.jal_dec		(jal_dec), 
.jalr_ex		(jalr_ex), 
.fence_dec		(fence_dec),
.dec_valid		(dec_valid ),		
.ex_ready		(ex_ready),		
.alu_result_ex		(alu_result_ex),
.only_src2_used_ex 	(only_src2_used_ex),
.src_data1_ex		(src_data1_ex ),
.src_data2_ex		(src_data2_ex ),
.alu_add_ex  		(alu_add_ex ),
.alu_sub_ex  		(alu_sub_ex ),
.alu_com_ex  		(alu_com_ex ),
.alu_ucom_ex 		(alu_ucom_ex ),
.alu_and_ex  		(alu_and_ex ),
.alu_or_ex   		(alu_or_ex ),
.alu_xor_ex  		(alu_xor_ex ),
.alu_sll_ex  		(alu_sll_ex ),
.alu_srl_ex  		(alu_srl_ex ),
.alu_sra_ex  		(alu_sra_ex ),
.alu_mul_ex  		(alu_mul_ex ),
.alu_mulh_ex  		(alu_mulh_ex ),
.alu_mulhsu_ex  	(alu_mulhsu_ex ),
.alu_mulhu_ex  		(alu_mulhu_ex ),
.alu_rem_ex  		(alu_rem_ex ),
.alu_remu_ex  		(alu_remu_ex ),
.alu_div_ex  		(alu_div_ex ),
.alu_divu_ex  		(alu_divu_ex ),
.beq_ex			(beq_ex),
.bne_ex			(bne_ex),
.blt_ex			(blt_ex),
.bge_ex			(bge_ex),
.bltu_ex		(bltu_ex),
.bgeu_ex		(bgeu_ex),
.branch_taken_ex	(branch_taken_ex),
.load_ex		(load_ex),
.store_ex		(store_ex),
.mem_H_ex		(mem_H_ex),
.mem_B_ex		(mem_B_ex),
.mem_U_ex		(mem_U_ex),
.store_data_ex		(store_data_ex),
.pc_ex			(pc_ex),
.rd_ex			(rd_ex ), 
.imm_ex			(imm_ex),
.imm_dec		(imm_dec),
.data_mem		(data_mem),
.rd_mem			(rd_mem ),	
.mem_wb_data_valid	(mem_wb_data_valid),
.load_wait_data		(load_wait_data),
.rd_wb			(rd_wb ),	
.wr_valid_wb		(wr_valid_wb ),	
.wr_data_wb		(wr_data_wb),
.mcsr_addr		(mcsr_addr),
.mcsr_rd		(mcsr_rd),
.mcsr_wr		(mcsr_wr),
.valid_mcsr_rd		(valid_mcsr_rd),
.valid_mcsr_wr		(valid_mcsr_wr),
.mcsr_set		(mcsr_set),
.mcsr_clr		(mcsr_clr),
.mcsr_write_data	(mcsr_write_data),
.mcsr_read_data		(mcsr_read_data),
.valid_interrupt	(valid_interrupt),
.exception_met		(exception_met),
.ecall			(ecall),
.ebreak			(ebreak),
.instr_illegal		(instr_illegal),
.load_x0		(load_x0),
.mret			(mret),
.wfi			(wfi)
`ifdef KRV_HAS_DBG
,
.single_step_d1		(single_step_d1),
.single_step_d2		(single_step_d2),
.single_step_d3		(single_step_d3),
.breakpoint		(breakpoint),
.d_regs_read_data	(d_regs_read_data),
.dret			(dret),
.dbg_mode		(dbg_mode	),
.dbg_reg_access		(dbg_reg_access	),
.dbg_wr1_rd0		(dbg_wr1_rd0	),
.dbg_regno		(dbg_regno	),
.dbg_write_data		(dbg_write_data	),
.dbg_read_data_valid	(dbg_gprs_read_data_valid),
.dbg_read_data		(dbg_gprs_read_data	)
`endif


);

//-----------------------------------------------------//
//alu
//-----------------------------------------------------//

alu u_alu (
.cpu_clk		(cpu_clk ),				
.cpu_rstn		(comb_rstn),				
.alu_result_ex		(alu_result_ex),
.only_src2_used_ex 	(only_src2_used_ex),

.dec_valid		(dec_valid ),		
.ex_ready		(ex_ready),		
.src_data1_ex		(src_data1_ex ),
.src_data2_ex		(src_data2_ex ),	
.alu_add_ex		(alu_add_ex ),				
.alu_sub_ex		(alu_sub_ex ),				
.alu_com_ex		(alu_com_ex ),				
.alu_ucom_ex		(alu_ucom_ex ),				
.alu_and_ex		(alu_and_ex ),				
.alu_or_ex		(alu_or_ex ),				
.alu_xor_ex		(alu_xor_ex ),				
.alu_sll_ex		(alu_sll_ex ),				
.alu_srl_ex		(alu_srl_ex ),				
.alu_sra_ex		(alu_sra_ex ),				
.alu_mul_ex  		(alu_mul_ex ),
.alu_mulh_ex  		(alu_mulh_ex ),
.alu_mulhsu_ex  	(alu_mulhsu_ex ),
.alu_mulhu_ex  		(alu_mulhu_ex ),
.alu_rem_ex  		(alu_rem_ex ),
.alu_remu_ex  		(alu_remu_ex ),
.alu_div_ex  		(alu_div_ex ),
.alu_divu_ex  		(alu_divu_ex ),
.beq_ex			(beq_ex),
.bne_ex			(bne_ex),
.blt_ex			(blt_ex),
.bge_ex			(bge_ex),
.bltu_ex		(bltu_ex),
.bgeu_ex		(bgeu_ex),
.branch_taken_ex	(branch_taken_ex),
.rd_ex			(rd_ex ),			
.load_ex		(load_ex),
.store_ex		(store_ex),
.mem_H_ex		(mem_H_ex),
.mem_B_ex		(mem_B_ex),
.mem_U_ex		(mem_U_ex),
.store_data_ex		(store_data_ex),
.alu_result_mem		(alu_result_mem ),				
.ex_valid		(ex_valid ),				
.mem_ready		(mem_ready),		
.rd_mem			(rd_mem),				
.load_mem		(load_mem),
.store_mem		(store_mem),
.mem_H_mem		(mem_H_mem),
.mem_B_mem		(mem_B_mem),
.mem_U_mem		(mem_U_mem),
.store_data_mem		(store_data_mem),
.mem_addr_mem		(mem_addr_mem)
`ifdef KRV_HAS_DBG
,
.single_step_d2		(single_step_d2),
.single_step_d3		(single_step_d3),
.single_step_d4		(single_step_d4),
.breakpoint		(breakpoint),
.dbg_mode		(dbg_mode	),
.mem_addr_ex		(mem_addr_ex	)
`endif
);

//-----------------------------------------------------//
//dmem_ctrl
//-----------------------------------------------------//
dmem_ctrl u_dmem_ctrl (
.cpu_clk			(cpu_clk ),				
.cpu_rstn			(comb_rstn),				
.load_ex			(load_ex),
.store_ex			(store_ex),
.load_mem			(load_mem),
.store_mem			(store_mem),
.mem_H_mem			(mem_H_mem),
.mem_B_mem			(mem_B_mem),
.mem_U_mem			(mem_U_mem),
.store_data_mem			(store_data_mem),
.mem_addr_mem			(mem_addr_mem),
.alu_result_mem			(alu_result_mem ),		
.ex_valid			(ex_valid ),				
.mem_ready			(mem_ready),		
.data_mem			(data_mem),
.mem_wb_data_valid		(mem_wb_data_valid),
.load_wait_data			(load_wait_data),
.rd_mem				(rd_mem),		
.wb_ready			(wb_ready),		
.load_wb 			(load_wb),			
.alu_result_wb			(alu_result_wb ),				
.alu_result_valid_wb		(alu_result_valid_wb ),				
.load_data_wb			(load_data_wb ),				
.load_data_valid_wb		(load_data_valid_wb ),				
.rd_wb				(rd_wb ),	
.dtcm_en			(dtcm_en),
.dtcm_start_addr		(dtcm_start_addr),
.data_dtcm_access		(data_dtcm_access),
.data_dtcm_ready		(data_dtcm_ready),
.data_dtcm_rd0_wr1		(data_dtcm_rd0_wr1),	
.data_dtcm_byte_strobe		(data_dtcm_byte_strobe),
.data_dtcm_write_data		(data_dtcm_write_data),
.data_dtcm_addr			(data_dtcm_addr),
.data_dtcm_read_data		(data_dtcm_read_data),
.data_dtcm_read_data_valid	(data_dtcm_read_data_valid),

.DAHB_access			(DAHB_access),
.DAHB_rd0_wr1			(DAHB_rd0_wr1),	
.DAHB_size			(DAHB_size),
.DAHB_write_data		(DAHB_write_data),
.DAHB_addr			(DAHB_addr),
.DAHB_trans_buffer_full		(DAHB_trans_buffer_full),
.DAHB_read_data			(DAHB_read_data),
.DAHB_read_data_valid		(DAHB_read_data_valid)

);

//-----------------------------------------------------//
//wb_ctrl
//-----------------------------------------------------//
wb_ctrl u_wb_ctrl (
.cpu_clk			(cpu_clk ),				
.cpu_rstn			(comb_rstn),				
.wb_ready			(wb_ready),		
.load_wb 			(load_wb),			
.alu_result_wb			(alu_result_wb ),				
.alu_result_valid_wb		(alu_result_valid_wb ),				
.load_data_wb			(load_data_wb ),				
.load_data_valid_wb		(load_data_valid_wb ),	
.wr_valid_wb			(wr_valid_wb ),	
.wr_data_wb			(wr_data_wb)
);

//-----------------------------------------------------//
//mcsr
//-----------------------------------------------------//
mcsr u_mcsr(
.cpu_clk		(cpu_clk),		
.cpu_rstn		(comb_rstn),	
.instr_dec		(instr_dec ),	
.csr_addr		(mcsr_addr),
.mcsr_rd		(mcsr_rd),
.mcsr_wr		(mcsr_wr),
.valid_mcsr_rd		(valid_mcsr_rd),
.valid_mcsr_wr		(valid_mcsr_wr),
.mcsr_set		(mcsr_set),
.mcsr_clr		(mcsr_clr),
.write_data		(mcsr_write_data),
.read_data		(mcsr_read_data),
.valid_interrupt	(valid_interrupt),
.mret			(mret),
.meip			(meip),		
.mtip			(mtip),		
.mepc			(mepc),	
.mcause			(mcause),	
.mtval			(mtval),	
.mepc_sel		(mepc_sel),
.mcause_sel		(mcause_sel),
.mtval_sel		(mtval_sel),
.csr_illegal_access	(csr_illegal_access),
.illegal_instr		(illegal_instr ),	
.mstatus_mie		(mstatus_mie),
.meie			(meie),
.mtie			(mtie),
.mtvec_mode		(mtvec_mode),
.mtvec_base		(mtvec_base),
.dtcm_en		(dtcm_en),
.dtcm_start_addr	(dtcm_start_addr)
`ifdef KRV_HAS_DBG
,
.pc_ex			(pc_ex),
.pc_dec			(pc_dec),
.breakpoint		(breakpoint),
.ebreak			(ebreak),
.dpc			(dpc),
.step			(step),
.dbg_mode		(dbg_mode	),
.dbg_reg_access		(dbg_reg_access	),
.dbg_wr1_rd0		(dbg_wr1_rd0	),
.dbg_regno		(dbg_regno	),
.dbg_wr			(dbg_wr		),
.dbg_write_data		(dbg_write_data	),
.dbg_read_data_valid	(dbg_csrs_read_data_valid),
.dbg_read_data		(dbg_csrs_read_data	)
`endif


);

//-----------------------------------------------------//
//trap_ctrl
//-----------------------------------------------------//
trap_ctrl u_trap_ctrl (
.cpu_clk		(cpu_clk),		
.cpu_rstn		(comb_rstn),	
.branch_taken_ex	(branch_taken_ex),
.pc_misaligned 		(pc_misaligned),
.pc			(pc),	
.fault_pc		(fault_pc),
.load_x0		(load_x0),
.csr_illegal_access	(csr_illegal_access),
.illegal_instr		(illegal_instr ),	
.kplic_int		(kplic_int),
.timer_int		(core_timer_int),
.valid_mcsr_rd		(valid_mcsr_rd),
.valid_mcsr_wr		(valid_mcsr_wr),
.mcsr_set		(mcsr_set),
.mcsr_clr		(mcsr_clr),
.write_data		(mcsr_write_data),
.mepc_sel		(mepc_sel),
.mcause_sel		(mcause_sel),
.mtval_sel		(mtval_sel),
.mstatus_mie		(mstatus_mie),
.meie			(meie),
.mtie			(mtie),
.mtvec_mode		(mtvec_mode),
.mtvec_base		(mtvec_base),
.valid_interrupt	(valid_interrupt),
.meip			(meip),				
.mtip			(mtip),		
.mepc			(mepc),
.mcause			(mcause),	
.mtval			(mtval),	
.trap			(trap),
.exception_met		(exception_met),
.ecall			(ecall),
.instr_illegal		(instr_illegal),
.vector_addr		(vector_addr)
`ifdef KRV_HAS_DBG
,
.dbg_wr			(dbg_wr		),
.dbg_write_data		(dbg_write_data	),
.dbg_mode		(dbg_mode	)
`endif
);

`ifdef KRV_HAS_DBG
//-----------------------------------------------------//
//trigger_regs
//-----------------------------------------------------//
wire [`DATA_WIDTH - 1 : 0] tdata1_t0;
wire [`DATA_WIDTH - 1 : 0] tdata1_t1;
wire [`DATA_WIDTH - 1 : 0] tdata2_t0;
wire [`DATA_WIDTH - 1 : 0] tdata3_t0;
wire [`DATA_WIDTH - 1 : 0] tdata2_t1;
wire [`DATA_WIDTH - 1 : 0] tdata3_t1;


trigger_regs u_trigger_regs(
.cpu_clk		(cpu_clk),		
.cpu_rstn		(cpu_rstn),	
.csr_addr		(mcsr_addr),
.mcsr_rd		(mcsr_rd),
.mcsr_wr		(mcsr_wr),
.valid_mcsr_rd		(valid_mcsr_rd),
.valid_mcsr_wr		(valid_mcsr_wr),
.mcsr_set		(mcsr_set),
.mcsr_clr		(mcsr_clr),
.write_data		(mcsr_write_data),
.read_data		(d_regs_read_data),
.tdata1_t0		(tdata1_t0      ),
.tdata1_t1		(tdata1_t1      ),
.tdata2_t0		(tdata2_t0    ),
.tdata3_t0		(tdata3_t0    ),
.tdata2_t1		(tdata2_t1    ),
.tdata3_t1		(tdata3_t1    ),
.dbg_mode		(dbg_mode	),
.dbg_reg_access		(dbg_reg_access	),
.dbg_wr1_rd0		(dbg_wr1_rd0	),
.dbg_regno		(dbg_regno	),
.dbg_wr			(dbg_wr		),
.dbg_write_data		(dbg_write_data	),
.dbg_read_data_valid	(dbg_t_regs_read_data_valid),
.dbg_read_data		(dbg_t_regs_read_data	)
);


//-----------------------------------------------------//
//hw_triggers
//-----------------------------------------------------//

hw_triggers u_hw_triggers(
.cpu_clk		(cpu_clk),		
.cpu_rstn		(cpu_rstn),	
.tdata1_t0		(tdata1_t0      ),
.tdata1_t1		(tdata1_t1      ),
.tdata2_t0		(tdata2_t0    ),
.tdata3_t0		(tdata3_t0    ),
.tdata2_t1		(tdata2_t1    ),
.tdata3_t1		(tdata3_t1    ),
.pc_ex			(pc_ex),
.load_ex		(load_ex),
.store_ex		(store_ex),
.mem_addr_ex		(mem_addr_ex),
.dbg_mode		(dbg_mode	),
.breakpoint		(breakpoint)
);


//-----------------------------------------------------//
//dbg_mode_ctrl
//-----------------------------------------------------//
dbg_mode_ctrl u_dbg_mode_ctrl (
.cpu_clk		(cpu_clk),		
.cpu_rstn		(cpu_rstn),	
.resumereq_w1		(resumereq_w1),
.step			(step),
.single_step		(single_step),
.single_step_d1		(single_step_d1),
.single_step_d2		(single_step_d2),
.single_step_d3		(single_step_d3),
.single_step_d4		(single_step_d4),
.breakpoint		(breakpoint),
.ebreak			(ebreak),
.dret			(dret),
.dbg_mode		(dbg_mode)
);
`endif


endmodule
