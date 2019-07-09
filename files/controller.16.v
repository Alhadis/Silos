`timescale 1ps/1ps
module controller(
                  reset,
                  controller_opcode6,
                  controller_cc_z,
                  controller_cc_c,
                  controller_int_req,
                  controller_alu_fn,
                  controller_dmem_write_en,
                  controller_mux2_1_1_or_disp,
                  controller_mux5_1,
                  controller_mux2_1_r2_rd,
                  controller_mux3_1,
                  controller_mux2_1_gpr2_const,
                  controller_gpr_write_en,
                  controller_reti_signal,
                  controller_int_en,
                  controller_port_read,
                  controller_port_write,
                  controller_push_pop,
                  controller_tri_state_buffer,
						controller_port_ready,
						controller_ack,
						controller_stack_en,
						controller_branch_taken);

parameter opcode6_width = 6;
parameter alu_fn_width  = 4;

///////////// Default /////////////

parameter d_alu_fn 				= 3'b000;
parameter d_dmem_write_en 	   = 1'b0;
parameter d_mux2_1_1_or_disp  = 1'b0;
parameter d_mux5_1 				= 3'b001;
parameter d_mux2_1_r2_rd 		= 1'b0;
parameter d_mux3_1 				= 2'b00;
parameter d_mux2_1_gpr2_const = 1'b0;
parameter d_gpr_write_en 		= 1'b0;
parameter d_reti_signal 		= 1'b0;
parameter d_int_en 				= 1'b0;
parameter d_port_write 			= 1'b0;
parameter d_port_read 			= 1'b0;
parameter d_push_pop 			= 1'b0;
parameter d_tri_state_buffer  = 1'b0;
parameter d_stack_en 			= 1'b0;
parameter d_branch_taken      = 1'b0;

///////////// Default /////////////

//input                      clk;
input                      reset;
input  [opcode6_width-1:0] controller_opcode6;// [ 5 | 4 | 3 | 2 | 1 | 0 ]
input                      controller_cc_z;
input                      controller_cc_c;
input                      controller_int_req;
input								controller_port_ready;
input                      controller_ack;
 
output [alu_fn_width-1:0]  controller_alu_fn;
output                     controller_dmem_write_en;
output         [1-1:0]     controller_mux2_1_1_or_disp;
output         [3-1:0]     controller_mux5_1;
output         [1-1:0]     controller_mux2_1_r2_rd;
output         [2-1:0]     controller_mux3_1;
output         [1-1:0]     controller_mux2_1_gpr2_const;
output                     controller_gpr_write_en;
output                     controller_reti_signal;
output                     controller_int_en;
output                     controller_port_write;
output                     controller_port_read;
output                     controller_push_pop;
output                     controller_tri_state_buffer;
output                     controller_stack_en;
output                     controller_branch_taken;

reg    [alu_fn_width-1:0]  controller_alu_fn; // 00 and 01
                           // 4'b0000 ADD
                           // 4'b0001 ADD_C
                           // 4'b0010 SUB
                           // 4'b0011 SUB_C
                           // 4'b0100 AND
                           // 4'b0101 OR
                           // 4'b0110 XOR
                           // 4'b0111 MSK
                           
                           // 4'b1000 Shift Left
                           // 4'b1001 Shift Right
                           // 4'b1010 Rotate Left
                           // 4'b1011 Rotate Right

reg                        controller_dmem_write_en;
reg         [1-1:0]        controller_mux2_1_1_or_disp; 
                           // 0: 1 for increment programcounter 
                           // 1: disp for branch
                          
reg         [3-1:0]        controller_mux5_1;
                           // 0: 1 for interrupt 
                           // 1: feedback current pc value + 1:: default
                           // 2: pc_address for jump instruction
                           // 3: return pc_address from stack
                           // 4: return pc_address from interrupt
                          
reg         [1-1:0]        controller_mux2_1_r2_rd;
                           // 0: instruction address_r2 to GPR address_r2 :: default
                           // 1: instruction address_rd to GPR address_r2
                          
reg         [2-1:0]        controller_mux3_1;
                           // 0: write value from port_data input for INP
                           // 1: write value from dmem_out LDM
                           // 2: write value from alu_result STM
      
reg         [1-1:0]        controller_mux2_1_gpr2_const;
                           // 0: gpr2 selected :: default
                           // 1: const selected
reg                        controller_gpr_write_en;
reg                        controller_reti_signal;
reg                        controller_int_en;
reg								controller_int_en_temp; //Internal Reg
reg                        controller_port_write;
reg                        controller_port_read;
reg                        controller_push_pop;
                           //0 : push
                           //1 : pop
reg                        controller_tri_state_buffer;

reg                        controller_branch_taken;

reg                        controller_stack_en;


always@(				reset 							 or
                  controller_opcode6			 or
                  controller_cc_z				 or
                  controller_cc_c	   		 or
                  controller_int_req			 or
                  controller_alu_fn				 or
                  controller_dmem_write_en 	 or
                  controller_mux2_1_1_or_disp or
                  controller_mux5_1				 or
                  controller_mux2_1_r2_rd		 or
                  controller_mux3_1				 or
                  controller_mux2_1_gpr2_const or
                  controller_gpr_write_en or
                  controller_reti_signal or
                  controller_int_en or
                  controller_port_read or
                  controller_port_write or
                  controller_push_pop or
                  controller_tri_state_buffer or
						controller_port_ready or
						controller_ack or
						controller_stack_en or
						controller_branch_taken)
begin
    if(!reset)
    begin
      controller_alu_fn            = 3'b000;
      controller_dmem_write_en     = 1'b0;
      controller_mux2_1_1_or_disp  = 1'b0;
      controller_mux5_1            = 3'b000;
      controller_mux2_1_r2_rd      = 1'b0;
      controller_mux3_1            = 2'b00;
      controller_mux2_1_gpr2_const = 1'b0;
      controller_gpr_write_en      = 1'b0;
      controller_reti_signal       = 1'b0;
      controller_int_en            = 1'b0;
      controller_port_write        = 1'b0;
      controller_port_read         = 1'b0;
      controller_push_pop          = 1'b0;
      controller_tri_state_buffer  = 1'b0;
      controller_stack_en          = 1'b0;
      controller_branch_taken	     = 1'b0;
    end
    
    else
    begin
    $display("OPCODE: %b", controller_opcode6);
	 
    case(controller_opcode6)	 
      6'b111110 : begin
                    $display("Miscellaneous : ENAI");
						  controller_alu_fn 				 = d_alu_fn;           
						  controller_dmem_write_en 	 = d_dmem_write_en;   
						  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
						  controller_mux5_1 				 = 3'b001;          
						  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd;    
						  controller_mux3_1 				 = d_mux3_1;          
						  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
						  controller_gpr_write_en 		 = d_gpr_write_en;    
						  controller_reti_signal 		 = 1'b0;      
						  controller_int_en 				 = 1'b1;       
						  controller_port_write 		 = d_port_write;      
						  controller_port_read 			 = d_port_read;       
						  controller_push_pop  			 = d_push_pop;       
						  controller_tri_state_buffer  = d_tri_state_buffer;
						  controller_stack_en 			 = d_stack_en;
						  controller_branch_taken	    = 1'b0;	  
                  end
                  
      6'b111100 : begin
                    $display("Miscellaneous : RET");
						  controller_alu_fn 				 = d_alu_fn;           
						  controller_dmem_write_en 	 = d_dmem_write_en;   
						  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
						  controller_mux5_1 				 = 3'b011; // 3: return pc_address from stack
						  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd;    
						  controller_mux3_1 				 = d_mux3_1;          
						  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
						  controller_gpr_write_en 		 = d_gpr_write_en;    
						  controller_reti_signal 		 = d_reti_signal;      
						  controller_int_en 				 = d_int_en;       
						  controller_port_write 		 = d_port_write;      
						  controller_port_read 			 = d_port_read;       
						  controller_push_pop  			 = 1'b1; //POP top stack       
						  controller_tri_state_buffer  = d_tri_state_buffer;
						  controller_stack_en 			 = 1'b1;
						  controller_branch_taken	    = 1'b0;
                  end
                  
      6'b111101 : begin
                    $display("Miscellaneous : RETI");
						  controller_alu_fn 				 = d_alu_fn;           
						  controller_dmem_write_en 	 = d_dmem_write_en;   
						  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
						  controller_mux5_1 				 = 3'b100; // 4: return pc_address from interrupt          
						  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd;    
						  controller_mux3_1 				 = d_mux3_1;          
						  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
						  controller_gpr_write_en 		 = d_gpr_write_en;    
						  controller_reti_signal 		 = 1'b1;      
						  controller_int_en 				 = 1'b1;       
						  controller_port_write 		 = d_port_write;      
						  controller_port_read 			 = d_port_read;       
						  controller_push_pop  			 = d_push_pop;       
						  controller_tri_state_buffer  = d_tri_state_buffer;
						  controller_stack_en 			 = d_stack_en;
						  controller_branch_taken	    = 1'b0;
                  end
                  
      6'b111111 : begin
                    $display("Miscellaneous : DISI");
						  controller_alu_fn 				 = d_alu_fn;           
						  controller_dmem_write_en 	 = d_dmem_write_en;   
						  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
						  controller_mux5_1 				 = d_mux5_1;          
						  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd;    
						  controller_mux3_1 				 = d_mux3_1;          
						  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
						  controller_gpr_write_en 		 = d_gpr_write_en;    
						  controller_reti_signal 		 = d_reti_signal;      
						  controller_int_en 				 = 1'b0;       
						  controller_port_write 		 = d_port_write;      
						  controller_port_read 			 = d_port_read;       
						  controller_push_pop  			 = d_push_pop;       
						  controller_tri_state_buffer  = d_tri_state_buffer;
						  controller_stack_en 			 = d_stack_en;
						  controller_branch_taken	    = 1'b0;
                  end
                  

                  
      6'b000000 : begin
                 $display("REG-REG : ADD");
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b000001 : begin
                 $display("REG-REG : ADD");
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
      6'b000010 : begin
                 $display("REG-REG : ADDC");
					  
					  controller_alu_fn 				 = 4'b0001;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
 
      6'b000011 : begin
                 $display("REG-REG : ADDC");
					  
					  controller_alu_fn 				 = 4'b0001;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
 
      6'b000100 : begin
                 $display("REG-REG : SUB");
					  
					  controller_alu_fn 				 = 4'b0010;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
      6'b000101 : begin
                 $display("REG-REG : SUB");
					  
					  controller_alu_fn 				 = 4'b0010;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b000110 : begin
                 $display("REG-REG : SUBC");
					  
					  controller_alu_fn 				 = 4'b0011;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b000111 : begin
                 $display("REG-REG : SUBC");
					  
					  controller_alu_fn 				 = 4'b0011;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b001000 : begin
                 $display("REG-REG : AND");
					  
					  controller_alu_fn 				 = 4'b0100;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
 
      6'b001001 : begin
                 $display("REG-REG : AND");
					  
					  controller_alu_fn 				 = 4'b0100;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
 
      6'b001010 : begin
                 $display("REG-REG : OR");
					  
					  controller_alu_fn 				 = 4'b0101;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b001011 : begin
                 $display("REG-REG : OR");
					  
					  controller_alu_fn 				 = 4'b0101;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b001100 : begin
                 $display("REG-REG : XOR");
					  
					  controller_alu_fn 				 = 4'b0110;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b001101 : begin
                 $display("REG-REG : XOR");
					  
					  controller_alu_fn 				 = 4'b0110;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b001110 : begin
                 $display("REG-REG : MSK");
					  
					  controller_alu_fn 				 = 4'b0111;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
      6'b001111 : begin
                 $display("REG-REG : MSK");
					  
					  controller_alu_fn 				 = 4'b0111;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b0; // r2 was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b0;// 0: gpr2 selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
      6'b010000 : begin
                 $display("REG-IMMED : ADD");
					  
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b010001 : begin
                 $display("REG-IMMED : ADD");
					  
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
      6'b010010 : begin
                 $display("REG-IMMED : ADDC");
					  
					  controller_alu_fn 				 = 4'b0001;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b010011 : begin
                 $display("REG-IMMED : ADDC");
					  
					  controller_alu_fn 				 = 4'b0001;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b010100 : begin
                 $display("REG-IMMED : SUB");
                 
					  controller_alu_fn 				 = 4'b0010;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b010101 : begin
                 $display("REG-IMMED : SUB");
                 
					  controller_alu_fn 				 = 4'b0010;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
      6'b010110 : begin
                 $display("REG-IMMED : SUBC");
					  
					  controller_alu_fn 				 = 4'b0011;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
 
      6'b010111 : begin
                 $display("REG-IMMED : SUBC");
					  
					  controller_alu_fn 				 = 4'b0011;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
 
      6'b011000 : begin
                 $display("REG-IMMED : AND");
					  
					  controller_alu_fn 				 = 4'b0100;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b011001 : begin
                 $display("REG-IMMED : AND");
					  
					  controller_alu_fn 				 = 4'b0100;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b011010 : begin
                 $display("REG-IMMED : OR");
					  
					  controller_alu_fn 				 = 4'b0101;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b011011 : begin
                 $display("REG-IMMED : OR");
					  
					  controller_alu_fn 				 = 4'b0101;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b011100 : begin
                 $display("REG-IMMED : XOR");
					  
					  controller_alu_fn 				 = 4'b0110;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b011101 : begin
                 $display("REG-IMMED : XOR");
					  
					  controller_alu_fn 				 = 4'b0110;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
                 
      6'b011110 : begin
                 $display("REG-IMMED : MSK");
					  
					  controller_alu_fn 				 = 4'b0111;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end 

      6'b011111 : begin
                 $display("REG-IMMED : MSK");
					  
					  controller_alu_fn 				 = 4'b0111;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end 	
	
      6'b110000 : begin
                 $display("SHIFT INSTRUCTION : SHIFE LEFT");
					  
					  controller_alu_fn 				 = 4'b1000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b110001 : begin
                 $display("SHIFT INSTRUCTION : SHIFE LEFT");
					  
					  controller_alu_fn 				 = 4'b1000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end	
	
      6'b110010 : begin
                 $display("SHIFT INSTRUCTION : SHIFE RIGHT");
					  
					  controller_alu_fn 				 = 4'b1001;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b110011 : begin
                 $display("SHIFT INSTRUCTION : SHIFE RIGHT");
					  
					  controller_alu_fn 				 = 4'b1001;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
      6'b110100 : begin
                 $display("SHIFT INSTRUCTION : ROTATE LEFT");
					  
					  controller_alu_fn 				 = 4'b1010;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

      6'b110101 : begin
                 $display("SHIFT INSTRUCTION : ROTATE LEFT");
					  
					  controller_alu_fn 				 = 4'b1010;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
     6'b110110 : begin
                 $display("SHIFT INSTRUCTION : ROTATE RIGHT");
						 
					  controller_alu_fn 				 = 4'b1011;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;           
					  end

     6'b110111 : begin
                 $display("SHIFT INSTRUCTION : ROTATE RIGHT");
						 
					  controller_alu_fn 				 = 4'b1011;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;           
					  end		
					
	  6'b100000 : begin 
                 $display("Memory I/O : LDM");
						 
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b01;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end//LDM Load from Memory

	  6'b100001 : begin 
                 $display("Memory I/O : LDM");
						 
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b01;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end//LDM Load from Memory
					  
     6'b100010 : begin 
                 $display("Memory I/O : STM");
						 
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b1;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b0;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end//STM Alu Result

     6'b100011 : begin 
                 $display("Memory I/O : STM");
						 
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = 1'b1;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = 2'b10;          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = 1'b0;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end//STM Alu Result
					  
     6'b100100 : begin
                 $display("Memory I/O : INP");
						 
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd; // rd was selected   
				     controller_mux3_1 				 = 2'b00; // INP Data port          
					  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = 1'b0;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

     6'b100101 : begin
                 $display("Memory I/O : INP");
						 
					  controller_alu_fn 				 = 4'b0000;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd; // rd was selected   
				     controller_mux3_1 				 = 2'b00; // INP Data port          
					  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;// 1: const selected
					  controller_gpr_write_en 		 = 1'b1;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = 1'b0;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
     6'b100110 : begin
                 if(controller_port_ready == 1'b1)
                 begin
                 $display("Memory I/O : OUT");
					  controller_alu_fn 				 = 4'b000;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = d_mux3_1; // INP Data port          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = d_gpr_write_en;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = 1'b1;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;

                 end
                 else
                 $display("Memory I/O : PORT NOT READY");
                 end//OUT Data port

     6'b100111 : begin
                 if(controller_port_ready == 1'b1)
                 begin
                 $display("Memory I/O : OUT");
					  controller_alu_fn 				 = 4'b000;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = d_mux5_1;          
					  controller_mux2_1_r2_rd 		 = 1'b1; // rd was selected   
				     controller_mux3_1 				 = d_mux3_1; // INP Data port          
					  controller_mux2_1_gpr2_const = 1'b1;// 1: const selected
					  controller_gpr_write_en 		 = d_gpr_write_en;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = 1'b1;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;

                 end
                 else
                 $display("Memory I/O : PORT NOT READY");
                 end//OUT Data port 
					 
     6'b101000 : begin
                 $display("Branch INSTRUCTION : Branch if zero");
						    
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = controller_cc_z; //Branch if zero
                 if(controller_branch_taken  != 1'b1)
                 begin
					  controller_mux2_1_1_or_disp  = 1'b0;
					  controller_mux5_1 				 = 3'b001;
					  controller_branch_taken	    = 1'b0;
                 end
                 else
                 begin 
					  controller_mux2_1_1_or_disp  = 1'b1; // displacement was selected
					  controller_mux5_1 				 = 3'b001;
                 end              
                 end

     6'b101001 : begin
                 $display("Branch INSTRUCTION : Branch if zero");
						    
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = controller_cc_z; //Branch if zero
                 if(controller_branch_taken  != 1'b1)
                 begin
					  controller_mux2_1_1_or_disp  = 1'b0;
					  controller_mux5_1 				 = 3'b001;
					  controller_branch_taken	    = 1'b0;
                 end
                 else
                 begin 
					  controller_mux2_1_1_or_disp  = 1'b1; // displacement was selected
					  controller_mux5_1 				 = 3'b001;
                 end              
                 end 
 
     6'b101010 : begin
                 $display("Branch INSTRUCTION : Branch if not zero");   
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = ~(controller_cc_z); // Branch not zero
                 if(controller_branch_taken == 1'b1)
                 begin 
					  controller_mux2_1_1_or_disp  = 1'b1; // displacement was selected
					  controller_mux5_1 				 = 3'b001;
					  controller_branch_taken	    = 1'b0;					  
                 end
					  
                 else
                 begin
					  controller_mux2_1_1_or_disp  = 1'b0;
					  controller_mux5_1 				 = 3'b001;   				  
                 end  
                 end

     6'b101011 : begin
                 $display("Branch INSTRUCTION : Branch if not zero");   
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = ~(controller_cc_z); // Branch not zero
                 if(controller_branch_taken == 1'b1)
                 begin 
					  controller_mux2_1_1_or_disp  = 1'b1; // displacement was selected
					  controller_mux5_1 				 = 3'b001;
					  controller_branch_taken	    = 1'b0;
                 end
					  
                 else
                 begin
					  controller_mux2_1_1_or_disp  = 1'b0;
					  controller_mux5_1 				 = 3'b001;   
                 end  
                 end
                 
     6'b101100 : begin
                 $display("Branch INSTRUCTION : Branch if carry");			     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = controller_cc_c; //Branch if carry
                 if(controller_branch_taken != 1'b1)
                 begin		  
                 controller_mux2_1_1_or_disp = 1'b0; // 1 was seleted
                 controller_mux5_1           = 3'b001;
					  controller_branch_taken	    = 1'b0;
                 end
                 else
                 begin	  
                 controller_mux2_1_1_or_disp = 1'b1; // displacement was selected
                 controller_mux5_1           = 3'b001;
                 end  
                 end

     6'b101101 : begin
                 $display("Branch INSTRUCTION : Branch if carry");			     
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = controller_cc_c; //Branch if carry
                 if(controller_branch_taken != 1'b1)
                 begin		  
                 controller_mux2_1_1_or_disp = 1'b0; // 1 was seleted
                 controller_mux5_1           = 3'b001;
					  controller_branch_taken	    = 1'b0;
                 end
                 else
                 begin	  
                 controller_mux2_1_1_or_disp = 1'b1; // displacement was selected
                 controller_mux5_1           = 3'b001;
                 end  
                 end
					  
     6'b101110 : begin
                 $display("Branch INSTRUCTION : Branch if not carry");
                   
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = ~(controller_cc_c); //Branch if not carry
                 if(controller_branch_taken == 1'b1)
                 begin  
                 controller_mux2_1_1_or_disp = 1'b1; // displacement was selected
                 controller_mux5_1           = 3'b001;
					  controller_branch_taken	    = 1'b0;
                 end
                 else
                 begin
                 controller_mux2_1_1_or_disp = 1'b0; // displacement was selected
                 controller_mux5_1           = 3'b001;
					  end  
                 end

     6'b101111 : begin
                 $display("Branch INSTRUCTION : Branch if not carry");
                   
					  controller_dmem_write_en 	 = 1'b0;   
					  controller_gpr_write_en 		 = 1'b0;    
                 controller_branch_taken = ~(controller_cc_c); //Branch if not carry
                 if(controller_branch_taken == 1'b1)
                 begin  
                 controller_mux2_1_1_or_disp = 1'b1; // displacement was selected
                 controller_mux5_1           = 3'b001;
					  controller_branch_taken	    = 1'b0;
                 end
                 else
                 begin
                 controller_mux2_1_1_or_disp = 1'b0; // displacement was selected
                 controller_mux5_1           = 3'b001;
					  end  
                 end 
					 
     6'b111000 : begin
                 $display("JMP INSTRUCTION");
					  
					  controller_alu_fn 				 = d_alu_fn;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = 3'b010; // 2: pc_address for jump instruction         
					  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd; 
				     controller_mux3_1 				 = d_mux3_1;        
					  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
					  controller_gpr_write_en 		 = d_gpr_write_en;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end

     6'b111001 : begin
                 $display("JMP INSTRUCTION");
					  
					  controller_alu_fn 				 = d_alu_fn;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = 3'b010; // 2: pc_address for jump instruction         
					  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd; 
				     controller_mux3_1 				 = d_mux3_1;        
					  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
					  controller_gpr_write_en 		 = d_gpr_write_en;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = d_push_pop;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                 end
					  
     6'b111010 : begin
                 $display("JSB INSTRUCTION");
					  
					  controller_alu_fn 				 = d_alu_fn;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = 3'b010; // 2: pc_address for jump instruction         
					  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd; 
				     controller_mux3_1 				 = d_mux3_1;        
					  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
					  controller_gpr_write_en 		 = d_gpr_write_en;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = 1'b0;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = 1'b1;
					  controller_branch_taken	    = 1'b0;
					  end

     6'b111011 : begin
                 $display("JSB INSTRUCTION");
					  
					  controller_alu_fn 				 = d_alu_fn;     
					  controller_dmem_write_en 	 = d_dmem_write_en;   
					  controller_mux2_1_1_or_disp  = d_mux2_1_1_or_disp;
					  controller_mux5_1 				 = 3'b010; // 2: pc_address for jump instruction         
					  controller_mux2_1_r2_rd 		 = d_mux2_1_r2_rd; 
				     controller_mux3_1 				 = d_mux3_1;        
					  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
					  controller_gpr_write_en 		 = d_gpr_write_en;    
					  controller_reti_signal 		 = d_reti_signal;            
					  controller_port_write 		 = d_port_write;      
					  controller_port_read 			 = d_port_read;       
					  controller_push_pop  			 = 1'b0;       
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en 			 = 1'b1;
					  controller_branch_taken	    = 1'b0;
					  end
					 
     default   : begin
					  controller_alu_fn            = d_alu_fn;
					  controller_dmem_write_en     = d_dmem_write_en;
					  controller_mux2_1_1_or_disp  = 1'b0;
					  controller_mux5_1            = 3'b001;
					  controller_mux2_1_r2_rd      = d_mux2_1_r2_rd;
					  controller_mux3_1            = d_mux3_1;
					  controller_mux2_1_gpr2_const = d_mux2_1_gpr2_const;
					  controller_gpr_write_en      = d_gpr_write_en;
					  controller_reti_signal       = d_reti_signal;
					  controller_int_en            = d_int_en;
					  controller_port_write        = d_port_write;
					  controller_port_read         = d_port_read;
					  controller_push_pop          = d_push_pop;
					  controller_tri_state_buffer  = d_tri_state_buffer;
					  controller_stack_en          = d_stack_en;
					  controller_branch_taken	    = 1'b0;
                end
    endcase
	 
	 if (controller_int_en == 1'b1 && controller_int_req == 1'b1)
    begin
    $display("INTERRUPT");
    controller_mux5_1 = 3'b000; // 0: 1 for interrupt
		if(controller_ack == 1'b1)
      begin
      controller_int_en = 1'b0;
      end
    end

end
end
endmodule
