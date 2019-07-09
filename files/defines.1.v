`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/03 13:32:45
// Design Name: 
// Module Name: define
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//********全局宏定义**********
`define RstEnable 			1'b1		  //复位信号有效
`define RstDisable 			1'b0		  //复位信号无效
`define ZeroWord 			32'h00000000  //32位数初始为0
`define WriteEnable 		1'b1		  //使能写
`define WriteDisable 		1'b0		  //禁止写
`define	ReadEnable 			1'b1	      //使能读
`define ReadDisable 		1'b0		  //禁止读
`define AluOpBus 			7:0			  //译码阶段的输出aluop_0宽度
`define AluSelBus 			2:0			  //译码阶段的输出alusel_0宽度
`define InstValid 			1'b0		  //指令有效
`define InstInvalid 		1'b1		  //指令无效
`define Stop 				1'b1		  
`define NoStop 				1'b0
`define InDelaySlot 		1'b1
`define NotInDelaySlot 		1'b0
`define Branch 				1'b1
`define NotBranch 			1'b0
`define InterruptAssert 	1'b1
`define InterruptNotAssert  1'b0
`define TrapAssert 			1'b1
`define TrapNotAssert 		1'b0
`define True_v 				1'b1		  //逻辑“真”
`define False_v 			1'b0		  //逻辑“假”
`define ChipEnable 			1'b1		  //芯片使能
`define ChipDisable 		1'b0		  //芯片禁止

//***********  指令相关宏定义  ***********
`define EXE_ORI				6'b001101	  //ori指令码
`define EXE_NOP				6'b000000	  //空指令

//***********  AluOp  **********
`define EXE_OR_OP    		8'b00100101
`define EXE_ORI_OP   		8'b01011010

//***********  AluSel  ***********
`define EXE_RES_LOGIC 	    3'b001
`define EXE_RES_NOP 		3'b000

//***********  指令存储器ROM有关宏定义  ***********
`define InstAddrBus 		31:0		  //ROM的地址总线宽度			
`define InstDataBus 	    31:0		  //ROM的数据总线宽度
`define InstMemNum 			131071		  //ROM实际大小
`define InstMemNumLog2 		17			  //ROM实际使用的地址总线

//***********  通用寄存器Regfile有关的宏定义  **********
`define RegAddrBus 			4:0			  //Regfile模块地址总线宽度
`define RegDataBus 		    31:0		  //Regfile模块数据总线宽度
`define RegWidth 			32			  //通用寄存器宽度
`define DoubleRegWidth 		64		      //两倍的宽度
`define DoubleRegBus 		63:0		  //两倍的数据线宽度
`define RegNum 				32			  //通用寄存器数量
`define RegNumLog2 			5			  //通用寄存器使用的位数
`define NOPRegAddr 			5'b00000     //空