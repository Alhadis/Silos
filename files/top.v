`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:04 03/18/2014 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module top(input wire CCLK, BTN3_IN, BTN2_IN, BTN1_IN, input wire [3:0]SW, output wire [1:0] LED, output wire LCDE, LCDRS, LCDRW, output wire [3:0]LCDDAT);
// BTN3  is system clk, BTN2 is the
	wire [31:0] if_npc;
	wire [31:0] if_pc4;
	wire [31:0] if_inst;
	
	wire [31:0] id_pc4;	
	wire [31:0] id_inA;
	wire [31:0] id_inB;
	wire [31:0] id_imm;
	wire [4:0] id_destR;
	wire [4:0] id_regrt;
	wire [4:0] id_rt;
	wire [4:0] id_rd;
	wire id_branch; 
	wire id_wreg;
	wire id_m2reg;
	wire id_wmem;
	wire [3:0] id_aluc;
	wire id_shift;
	wire id_aluimm;
	
	wire ex_wreg;
	wire ex_m2reg;
	wire ex_wmem;
	wire[31:0] ex_aluR;
	wire[31:0] ex_inB;
	wire[4:0] ex_destR;
	wire ex_branch,ex_zero;
	wire[31:0]ex_pc;
	
	wire mem_wreg;
	wire mem_m2reg;
	wire[31:0] mem_mdata;
	wire[31:0] mem_aluR;
	wire[4:0] mem_destR;
	wire mem_branch;
	wire[31:0] mem_pc;
	
	wire wb_wreg;
	wire[4:0] wb_destR;
	wire[31:0] wb_dest;
	
	wire [3:0] IF_ins_type; 
	wire [3:0] IF_ins_number;
	wire [3:0] ID_ins_type;
	wire [3:0] ID_ins_number;
	wire [3:0] EX_ins_type; 
	wire [3:0] EX_ins_number;
	wire [3:0] MEM_ins_type; 
	wire [3:0] MEM_ins_number;
	wire [3:0] WB_ins_type; 
	wire [3:0] WB_ins_number;
	wire [3:0] OUT_ins_type; 
	wire [3:0] OUT_ins_number;
	
	wire [31:0] pc;
	wire [31:0] reg_content;
	wire [3:0] which_reg;
	
	reg [255:0] strdata;
	reg [3:0] SW_old;
	reg [7:0] clk_cnt;
	reg cls;

	wire [3:0] lcdd;
	wire rslcd, rwlcd, elcd;
	wire clk_1ms;
	wire BTN1, BTN2, BTN3;
	
	reg reg_select = 0;

	assign LCDDAT[3]=lcdd[3];
	assign LCDDAT[2]=lcdd[2];
	assign LCDDAT[1]=lcdd[1];
	assign LCDDAT[0]=lcdd[0];
	
	assign LCDRS=rslcd;
	assign LCDRW=rwlcd;
	assign LCDE=elcd;
	
	assign LED[0]=BTN3;
	assign LED[1]=mem_branch;
	assign which_reg[3:0] = SW[3:0];

	initial begin
		strdata <= "01234567 00 0123f01d01e01m01w01 ";
		SW_old = 4'b0;
		clk_cnt <= 8'b0;
		cls <= 1'b0;
	end
	clock C1 (CCLK, 25000, clk0);
	pbdebounce M3(CCLK, BTN1_IN, BTN1);
	pbdebounce M1(clk0, BTN2_IN, BTN2);
	pbdebounce M2(clk0, BTN3_IN, BTN3);
	
	display M0 (CCLK, cls, strdata, rslcd, rwlcd, elcd, lcdd);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

	always @(posedge BTN1) reg_select = ~reg_select;
	always @(posedge CCLK) begin
		if(reg_select == 1'b0) begin
			strdata[159:152] <= (reg_content[15:12]<10)?(8'h30+reg_content[15:12]):(8'h37+reg_content[15:12]);//8'h30 + reg_content[15:12];
			strdata[151:144] <= (reg_content[11:8]<10)?(8'h30+reg_content[11:8]):(8'h37+reg_content[11:8]);//8'h30 + reg_content[11:8];
			strdata[143:136] <= (reg_content[7:4]<10)?(8'h30+reg_content[7:4]):(8'h37+reg_content[7:4]);//8'h30 + reg_content[7:4];
			strdata[135:128] <= (reg_content[3:0]<10)?(8'h30+reg_content[3:0]):(8'h37+reg_content[3:0]);//8'h30 + reg_content[3:0];
		end
		else begin
			strdata[159:152] <= (reg_content[31:28]<10)?(8'h30+reg_content[31:28]):(8'h37+reg_content[31:28]);//8'h30 + reg_content[15:12];
			strdata[151:144] <= (reg_content[27:24]<10)?(8'h30+reg_content[27:24]):(8'h37+reg_content[27:24]);//8'h30 + reg_content[11:8];
			strdata[143:136] <= (reg_content[23:20]<10)?(8'h30+reg_content[23:20]):(8'h37+reg_content[23:20]);//8'h30 + reg_content[7:4];
			strdata[135:128] <= (reg_content[19:16]<10)?(8'h30+reg_content[19:16]):(8'h37+reg_content[19:16]);//8'h30 + reg_content[3:0];
		end
	end
	always @(posedge CCLK) begin
		if ((BTN3 == 1'b1) || (BTN2 == 1'b1)||(BTN1== 1'b1)||(SW_old != SW)) begin
			//first line 8 4-bit Instrution
			strdata[255:248] <= (if_inst[31:28]<10)?(8'h30 + if_inst[31:28]):(8'h37 + if_inst[31:28]);
			strdata[247:240] <= (if_inst[27:24]<10)?(8'h30 + if_inst[27:24]):(8'h37 + if_inst[27:24]);
			strdata[239:232] <= (if_inst[23:20]<10)?(8'h30 + if_inst[23:20]):(8'h37 + if_inst[23:20]);
			//strdata[255:248] <= 8'h30+ wb_destR[3:0];
			
			//strdata[247:240] <= 8'h30+ wb_dest[3:0];
			
			//strdata[239:232] <= 8'h30+ {3'b000,wb_wreg};
			strdata[231:224] <= (if_inst[19:16]<10)?(8'h30 + if_inst[19:16]):(8'h37 + if_inst[19:16]);
			strdata[223:216] <= (if_inst[15:12]<10)?(8'h30 + if_inst[15:12]):(8'h37 + if_inst[15:12]);	
			strdata[215:208] <= (if_inst[11:8]<10)?(8'h30 + if_inst[11:8]):(8'h37 + if_inst[11:8]);
			strdata[207:200] <= (if_inst[7:4]<10)?(8'h30 + if_inst[7:4]):(8'h37 + if_inst[7:4]);
			strdata[199:192] <= (if_inst[3:0]<10)?(8'h30 + if_inst[3:0]):(8'h37 + if_inst[3:0]);

			//space
			//strdata[191:184] = " ";
			//2 4-bit CLK
			strdata[183:176] <= (clk_cnt[7:4]<10)?(8'h30+clk_cnt[7:4]):(8'h37+clk_cnt[7:4]);//8'h30 + clk_cnt[7:4];
			strdata[175:168] <= (clk_cnt[3:0]<10)?(8'h30+clk_cnt[3:0]):(8'h37+clk_cnt[3:0]);//8'h30 + clk_cnt[3:0];
			//space
			//strdata[167:160] = " ";

			//second line
			//strdata[127:120] = "f";
			strdata[119:112] <= (IF_ins_number<10)?(8'h30+IF_ins_number):(8'h37+IF_ins_number);//8'h30 + IF_ins_number;
			strdata[111:104] <= (IF_ins_type<10)?(8'h30+IF_ins_type):(8'h37+IF_ins_type);//8'h30 + IF_ins_type;
			//strdata[103:96] = "d";
			strdata[95:88] <= (ID_ins_number<10)?(8'h30+ID_ins_number):(8'h37+ID_ins_number);//8'h30 + ID_ins_number;
			strdata[87:80] <= (ID_ins_type<10)?(8'h30+ID_ins_type):(8'h37+ID_ins_type);//8'h30 + ID_ins_type;
			//strdata[79:72] = "e";
			strdata[71:64] <= (EX_ins_number<10)?(8'h30+EX_ins_number):(8'h37+EX_ins_number);//8'h30 + EX_ins_number;
			strdata[63:56] <= (EX_ins_type<10)?(8'h30+EX_ins_type):(8'h37+EX_ins_type);//8'h30 + EX_ins_type;
			//strdata[55:48] = "m";
			strdata[47:40] <= (MEM_ins_number<10)?(8'h30+MEM_ins_number):(8'h37+MEM_ins_number);//8'h30 + MEM_ins_number;
			strdata[39:32] <= (MEM_ins_type<10)?(8'h30+MEM_ins_type):(8'h37+MEM_ins_type);//8'h30 + MEM_ins_type;
			//strdata[31:24] = "w";
			strdata[23:16] <= (WB_ins_number<10)?(8'h30+WB_ins_number):(8'h37+WB_ins_number);//8'h30 + WB_ins_number;
			strdata[15:8] <=(WB_ins_type<10)?(8'h30+WB_ins_type):(8'h37+WB_ins_type);//8'h30 + WB_ins_type;
			strdata[7:0] <= 8'h30+{3'b000,wb_wreg};//8'h30 + WB_ins_type;		
			//end
		   //if((BTN3 == 1'b1) || (BTN2 == 1'b1)||(SW_old != SW)) begin
			//first line after CLK and space
			//strdata[159:152] <= (reg_content[15:12]<9)?(8'h30+reg_content[15:12]):(8'h37+reg_content[15:12]);//8'h30 + reg_content[15:12];
			//strdata[151:144] <= (reg_content[11:8]<9)?(8'h30+reg_content[11:8]):(8'h37+reg_content[11:8]);//8'h30 + reg_content[11:8];
			//strdata[143:136] <= (reg_content[7:4]<9)?(8'h30+reg_content[7:4]):(8'h37+reg_content[7:4]);//8'h30 + reg_content[7:4];
			//strdata[135:128] <= (reg_content[3:0]<9)?(8'h30+reg_content[3:0]):(8'h37+reg_content[3:0]);//8'h30 + reg_content[3:0];
			SW_old <= SW;
			cls <= 1;
		end
		else
			cls <= 0;
	end
	
	always @(posedge BTN3) begin
		clk_cnt <= clk_cnt + 1;
	end

	assign rst = BTN2;
	
	assign pc [31:0] = if_npc[31:0];
	
	if_stage x_if_stage(CCLK, BTN3, rst, pc, mem_pc, mem_branch, id_wpcir,
		if_npc, if_pc4, if_inst, IF_ins_type, IF_ins_number,ID_ins_type,ID_ins_number);

	id_stage x_id_stage(BTN3, rst, if_inst, if_pc4, wb_destR, wb_dest,wb_wreg, 
		id_wreg, id_m2reg, id_wmem, id_aluc, id_shift, id_aluimm, id_branch, id_pc4, id_inA, id_inB, id_imm, id_regrt,id_rt,id_rd, 
		ID_ins_type, ID_ins_number, EX_ins_type, EX_ins_number, {1'b0,which_reg}, reg_content, id_wpcir);
		
	ex_stage x_ex_stage(BTN3, rst, id_imm, id_inA, id_inB, id_wreg, id_m2reg, id_wmem, id_aluc, id_aluimm,id_shift, id_branch, id_pc4,id_regrt,id_rt,id_rd,
		ex_wreg, ex_m2reg, ex_wmem, ex_aluR, ex_inB, ex_destR, ex_branch, ex_pc, ex_zero, 
		EX_ins_type, EX_ins_number, MEM_ins_type, MEM_ins_number);
	  
	mem_stage x_mem_stage(BTN3, rst, ex_destR, ex_inB, ex_aluR, ex_wreg, ex_m2reg, ex_wmem, ex_branch,ex_pc,ex_zero,  
		mem_wreg, mem_m2reg, mem_mdata, mem_aluR, mem_destR, mem_branch, mem_pc,
		MEM_ins_type, MEM_ins_number, WB_ins_type, WB_ins_number);

	wb_stage x_wb_stage(BTN3, rst, mem_destR, mem_aluR, mem_mdata, mem_wreg, mem_m2reg, 
		wb_wreg, wb_dest, wb_destR, WB_ins_type, WB_ins_number,OUT_ins_type, OUT_ins_number);
		
endmodule

