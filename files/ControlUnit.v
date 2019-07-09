`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:08 10/31/2012 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
	  input [5:0] OpCode,
	  input [5:0] Funct,
	  output [1:0] RegDst1,
	  output RegWrite1,
	  output [1:0] AluSrc1,
	  output DataRead1,
	  output DataWrite1,
     output [1:0] RegInData1,
     output [2:0] PCUpdate1,
     output [2:0] LogicFunc1,
     output FnSel1,
     output FnClass1,
     output [1:0] BrSel1,
     output BCD1
     );
	  
	  reg [1:0] RegDst;
	  reg RegWrite;
	  reg [1:0] AluSrc;
	  reg DataRead;
	  reg DataWrite;
     reg [1:0] RegInData;
     reg [2:0] PCUpdate;
     reg [2:0] LogicFunc;
     reg FnSel;
     reg FnClass;
     reg [1:0] BrSel;
     reg BCD; 
	  
	  always @(OpCode or Funct)
	  
	  begin
	                 RegDst = 0;
						  RegWrite = 0;
	                 AluSrc = 2'b00;
                    DataRead = 0;
                    DataWrite = 0;
                    RegInData = 0;
                    PCUpdate = 0;     
                    LogicFunc = 0;
                    FnSel = 0;
                    FnClass = 0;
	                 BrSel  = 0;
	                 BCD = 0;
	   
	  case(OpCode)	
	  0:
	  begin
	    case(Funct)
		 
		 6'b01000:                                 //br
		           begin
					    PCUpdate = 3'b100;
					  end
		                     
		 6'b10000,                                 //add
       6'b10001,                                 //comp
       6'b11000,                                 //and
		 6'b11001,                                 //xor
       6'b11011,                                 //shllv
       6'b11111,                                 //shrlv
		 6'b11101: begin                           //shrav
						 RegDst= 2'b00;
						 RegWrite = 1'b1;
						 AluSrc = 2'b00;
						 DataRead = 1'b0;
						 DataWrite = 1'b0;
						 RegInData = 1;
						 PCUpdate = 3'b0;
						 FnClass = 1;
					  end
					  
		6'b11010,                                  //shll
		6'b11100,                                  //shra
		6'b11110:  begin                           //shrl
						 RegDst = 2'b00;
						 RegWrite = 1'b1;
						 AluSrc = 2'b10;
						 DataRead = 1'b0;
						 DataWrite = 1'b0;
						 RegInData = 1'b1;
						 PCUpdate = 3'b0;
						 FnClass = 1;
		           end
      default:
		begin
                	  RegDst = 0;
						  RegWrite = 0;
	                 AluSrc = 2'b00;
                    DataRead = 0;
                    DataWrite = 0;
                    RegInData = 0;
                    PCUpdate = 0;     
                    LogicFunc = 0;
                    FnSel = 0;
                    FnClass = 0;
	                 BrSel  = 0;
	                 BCD = 0;	
		end					  
		 endcase
		 
		 
		 case(Funct)
		 6'b10000:                        //add
		  begin
		     FnSel = 0;
		     FnClass = 0; 
		  end
		  
		 6'b10001:                    //comp
		   begin
			   FnSel = 1;
            FnClass = 0;
         end
        		
      6'b11000:                     //and
         begin
            LogicFunc = 0;
         end
			
		6'b11001:                      //xor
         begin
            LogicFunc = 3'b001;
         end
 	   
      6'b11010:                      //shll
            LogicFunc = 3'b010;
      6'b11011:                      //shllv
            LogicFunc = 3'b011;
      6'b11100:                      //shra
            LogicFunc = 3'b110;
      6'b11101:                      //shrav
            LogicFunc = 3'b101;
      6'b11110:                      //shrl
            LogicFunc = 3'b110;
      6'b11111:                     //shrlv
            LogicFunc = 3'b111;
		default:
		begin
                	  RegDst = 0;
						  RegWrite = 0;
	                 AluSrc = 2'b00;
                    DataRead = 0;
                    DataWrite = 0;
                    RegInData = 0;
                    PCUpdate = 0;     
                    LogicFunc = 0;
                    FnSel = 0;
                    FnClass = 0;
	                 BrSel  = 0;
	                 BCD = 0;	
		end
            		
				
		endcase
		end
		 
		6'b000001:                      //bltz
		  begin
					  AluSrc = 2'b10;
					  RegInData = 2'b1;
					  PCUpdate = 3'b011;             
                 LogicFunc = 3'b000;
					  FnClass =3'b0;
					  BrSel = 2'b00;
		 
	    end
	  
	   6'b000010:                       //b
		 begin
					  AluSrc = 2'b10;
					  PCUpdate = 3'b001;
                 LogicFunc = 3'b000;
					  FnClass =3'b0;
					  BrSel = 2'b00;
		 end
		 
	   6'b000011:                       //bz
		  begin
					  AluSrc = 2'b10;
					  PCUpdate = 3'b011;
                 LogicFunc = 3'b000;
					  FnClass = 3'b0;
					  BrSel = 2'b10;
        end
	  
	   6'b000100:                    //bnz
		  begin
					  RegDst = 2'b00;
					  AluSrc = 2'b10;
					  PCUpdate = 3'b011;
                 LogicFunc = 3'b000;
					  FnClass =3'b0;
					  BrSel = 2'b01;
        end
	  
	   6'b000101:                  //bl 
		  begin
		           RegDst = 2'b10;
		           RegWrite = 1'b1;
					  AluSrc = 2'b10;
					  DataRead = 1'b0;
					  DataWrite = 1'b0;
					  RegInData = 2'b10;
					  PCUpdate = 3'b001;
                 LogicFunc = 3'b000;
					  FnClass =3'b0;
					  BrSel = 2'b01;
					  BCD = 0;
        end
	  
	  6'b000110:                     //bcy
		  begin
		          
					  PCUpdate = 3'b010;
					  BCD = 0;
        end
		 
	  6'b000111:                     //bncy
		  begin
		         PCUpdate = 3'b010;
					BCD = 1;
	     end
	  
	  6'b101001:                     //lw
		  begin
		           RegDst = 2'b01;
		           RegWrite = 1'b1;
					  AluSrc = 2'b01;
					  DataRead = 1'b1;
					  DataWrite = 1'b0;
					  RegInData = 2'b00;
					  PCUpdate = 3'b000;
                 LogicFunc = 3'b000;
					  FnClass =3'b0;
					  FnSel = 0;
        end
	  
	 6'b101010:                     //sw
		  begin
		           RegWrite = 1'b0;
					  AluSrc = 2'b01;
					  DataRead = 1'b0;
					  DataWrite = 1'b1;
					  PCUpdate = 3'b000;
                 LogicFunc = 3'b000;
					  FnClass =3'b0;
					  FnSel = 0;
        end
	  
	   6'b001100:                 //addi
	     begin
						RegDst = 2'b00;
						RegWrite = 1;
						AluSrc = 2'b01;
						RegInData = 1;
						FnSel = 0;
						FnClass = 0;
						PCUpdate = 0;
	     end
	  
	  6'b001101:                //compi
	     begin
						RegDst = 2'b00;
						RegWrite = 1;
						AluSrc = 2'b01;
						RegInData =1;
						FnSel = 1;
						FnClass = 0;
						PCUpdate = 0;
	     end
		default:
		begin
                	  RegDst = 0;
						  RegWrite = 0;
	                 AluSrc = 2'b00;
                    DataRead = 0;
                    DataWrite = 0;
                    RegInData = 0;
                    PCUpdate = 0;     
                    LogicFunc = 0;
                    FnSel = 0;
                    FnClass = 0;
	                 BrSel  = 0;
	                 BCD = 0;	
		end				
		  
	  
	  endcase
	 end 
	 
	 assign RegDst1 = RegDst;
	 assign RegWrite1 = RegWrite;
	 assign AluSrc1 = AluSrc;
    assign DataRead1 = DataRead;
    assign DataWrite1 = DataWrite;
    assign RegInData1 = RegInData;
    assign PCUpdate1 = PCUpdate;     
    assign LogicFunc1 = LogicFunc;
    assign FnSel1 = FnSel;
    assign FnClass1 = FnClass;
	 assign BrSel1  = BrSel;
	 assign BCD1 = BCD;
	 
endmodule