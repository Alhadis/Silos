`include "CONST.v"

module MEM2WB(

	input wire clk,
	input wire rst,

	input wire[5: 0] bubble_flag,

	// from mem	
	input wire[`RegAddrBus] mem_waddr,
	input wire mem_wreg,
	input wire[`RegBus] mem_wdata,
	
	input wire mem_whilo,
	input wire[`RegBus] mem_hi,
	input wire[`RegBus] mem_lo,
	
	input wire mem_cp0_reg_we,
	input wire[4:0] mem_cp0_reg_write_addr,
	input wire[`RegBus] mem_cp0_reg_data,
	// exception
	input wire flush_flag,

	// to wb
	output reg[`RegAddrBus] wb_waddr,
	output reg wb_wreg,
	output reg[`RegBus] wb_wdata,
	
	output reg wb_whilo,
	output reg[`RegBus] wb_hi,
	output reg[`RegBus] wb_lo,
	
	output reg wb_cp0_reg_we,
	output reg[4:0] wb_cp0_reg_write_addr,
	output reg[`RegBus] wb_cp0_reg_data,
	
	
	input wire[`TLB_WRITE_STRUCT_WIDTH - 1: 0] tlb_read_struct,
	output reg[`TLB_WRITE_STRUCT_WIDTH - 1: 0] tlb_write_struct
);


	always @ (posedge clk) 
        begin
            if ((rst == `RstEnable)||(flush_flag == 1'b1)) 
                begin
                    wb_waddr <= `NOPRegAddr;
                    wb_wreg <= `WriteDisable;
                    wb_wdata <= `ZeroWord;	
                    wb_whilo <= `WriteDisable;
		  			wb_hi <= `ZeroWord;
					wb_lo <= `ZeroWord;
                    wb_cp0_reg_we <= `WriteDisable;
					wb_cp0_reg_write_addr <= 5'b00000;
					wb_cp0_reg_data <= `ZeroWord;
					tlb_write_struct <= {`TLB_WRITE_STRUCT_WIDTH{1'b0}};
                end 
            else if(bubble_flag[4] == `Stop && bubble_flag[5] == `NoStop) 
                begin
                    wb_waddr <= `NOPRegAddr;
                    wb_wreg <= `WriteDisable;
                    wb_wdata <= `ZeroWord;
                    wb_whilo <= `WriteDisable;
		  			wb_hi <= `ZeroWord;
					wb_lo <= `ZeroWord; 	  
                    wb_cp0_reg_we <= `WriteDisable;
					wb_cp0_reg_write_addr <= 5'b00000;
					wb_cp0_reg_data <= `ZeroWord;
					tlb_write_struct <= {`TLB_WRITE_STRUCT_WIDTH{1'b0}};
                end 
            else if(bubble_flag[4] == `NoStop) 
                begin
                    wb_waddr <= mem_waddr;
                    wb_wreg <= mem_wreg;
                    wb_wdata <= mem_wdata;
                    wb_whilo <= mem_whilo;
            		wb_hi <= mem_hi;
					wb_lo <= mem_lo;
                    wb_cp0_reg_we <= mem_cp0_reg_we;
					wb_cp0_reg_write_addr <= mem_cp0_reg_write_addr;
					wb_cp0_reg_data <= mem_cp0_reg_data;
					tlb_write_struct <= tlb_read_struct;
                end //if
        end
			

endmodule
