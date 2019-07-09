module SCProcController(iword, aluCompTrue, aluFn, rdIndex0, rdIndex1, wrtIndex, imm, 
regFileWrtEn, dMemWrtEn, aluSrc2Sel, PCSel, regFileWrtSel, isJAL, needsShift);

//use parameters later

	input[31:0] iword;
	input aluCompTrue;
	
	output reg [4:0] aluFn;
	output reg [3:0] rdIndex0, rdIndex1, wrtIndex;
	output reg [15:0] imm;
	output reg regFileWrtEn, dMemWrtEn;
	output reg PCSel, aluSrc2Sel, regFileWrtSel, isJAL, needsShift;
	
	always @(*) begin
		//init here
		rdIndex0 <= iword[27:24];
		rdIndex1 <= iword[23:20];
		wrtIndex <= iword[31:28];
		imm <= iword[23:8];
		//those work for everything except branch and sw
		regFileWrtEn <= 1'b0;
		dMemWrtEn <= 1'b0;
		PCSel <= 1'b0;
		aluSrc2Sel <= 1'b0;
		regFileWrtSel <= 1'b0;
		isJAL <= 1'b0;
		needsShift <= 1'b0;
		case(iword[3:0]) //group by primary opcode
			4'b0000: begin //ALU-R instruction
				aluFn <= {1'b0, iword[7:4]};
				regFileWrtEn <= 1'b1; //write to DestReg
				dMemWrtEn <= 1'b0; //don't write to memory
				PCSel <= 1'b0; //0 is regular PC increment
				aluSrc2Sel <= 1'b0; // 0 means RS2
				regFileWrtSel <= 1'b0; //0 means aluOut
				isJAL <= 1'b0;
			end
			4'b1000: begin //ALU-I instruction
				aluFn <= {1'b0, iword[7:4]};
				regFileWrtEn <= 1'b1; //write to DestReg
				dMemWrtEn <= 1'b0; //don't write to memory
				PCSel <= 1'b0; //0 is regular PC increment
				aluSrc2Sel <= 1'b1; // 1 means sext(imm)
				regFileWrtSel <= 1'b0; //0 means aluOut
				isJAL <= 1'b0;			
			end
			4'b1001: begin //LW instruction
				aluFn <= {1'b0, iword[7:4]};
				regFileWrtEn <= 1'b1; //write to DestReg
				dMemWrtEn <= 1'b0; //don't write to memory
				PCSel <= 1'b0; //0 is regular PC increment
				aluSrc2Sel <= 1'b1; // 1 means sext(imm)
				regFileWrtSel <= 1'b1; //1 means memDOut
				isJAL <= 1'b0;
				needsShift <= 1'b1;
			end
			4'b0101: begin //SW instruction
			//no RD so:
				rdIndex0 <= iword[31:28];
				rdIndex1 <= iword[27:24];
				aluFn <= {1'b0, iword[7:4]};
				regFileWrtEn <= 1'b0; //there is no destReg
				dMemWrtEn <= 1'b1; //write to memory
				PCSel <= 1'b0; //0 is regular PC increment
				aluSrc2Sel <= 1'b1; // 1 means sexT(imm)
				regFileWrtSel <= 1'b0; //doesn't matter - aren't writing
				isJAL <= 1'b0;
				needsShift <= 1'b1;
			end
			4'b0010: begin //CMP-R instruction
				aluFn <= {1'b1, iword[7:4]};
				regFileWrtEn <= 1'b1; //write to destReg
				dMemWrtEn <= 1'b0; //don't write to memory
				PCSel <= 1'b0; //0 is regular PC increment
				aluSrc2Sel <= 1'b0; // 0 means RS2
				regFileWrtSel <= 1'b0; //0 means aluOut
				isJAL <= 1'b0;
			
			end
			4'b1010: begin //CMP-I instruction
				aluFn <= {1'b1, iword[7:4]};
				regFileWrtEn <= 1'b1; //write to DestReg
				dMemWrtEn <= 1'b0; //don't write to memory
				PCSel <= 1'b0; //0 is regular PC increment
				aluSrc2Sel <= 1'b1; // 1 means sext(imm)
				regFileWrtSel <= 1'b0; //0 means aluOut
				isJAL <= 1'b0;	
			
			end
			4'b0110: begin //BRANCH instruction
				aluFn <= {1'b1, iword[7:4]};
				rdIndex0 <= iword[31:28];
				rdIndex1 <= iword[27:24];
				regFileWrtEn <= 1'b0; //there's no DestReg
				dMemWrtEn <= 1'b0; //don't write to memory
				if(aluCompTrue)
					PCSel <= 1'b1; //1 is regular PC branch
				else
					PCSel <= 1'b0;
				aluSrc2Sel <= 1'b1; // 1 means sext(imm)
				regFileWrtSel <= 1'b0; //doesn't matter- aren't writing
				isJAL <= 1'b0;
				needsShift <= 1'b0;
				
			end
			4'b1011: begin //JAL instruction
				aluFn <= {1'b0, iword[7:4]};
				regFileWrtEn <= 1'b1; //write to destReg
				dMemWrtEn <= 1'b0; //don't write to memory
				PCSel <= 1'b0; //doesn't matter - choosing JAL
				aluSrc2Sel <= 1'b0; //doesn't matter- choosing JAL
				regFileWrtSel <= 1'b0; //doesn't matter- choosing JAL
				isJAL <= 1'b1;
				needsShift <= 1'b1;
			end
			default: begin
				aluFn <= {1'b0, iword[7:4]};
				rdIndex0 <= iword[27:24];
				rdIndex1 <= iword[23:20];
				wrtIndex <= iword[31:28];
				imm <= iword[23:8];
				regFileWrtEn <= 1'b0;
				dMemWrtEn <= 1'b0;
				PCSel <= 1'b0;
				aluSrc2Sel <= 1'b0;
				regFileWrtSel <= 1'b0;
				isJAL <= 1'b0;
				needsShift <= 1'b0;
				end
		endcase
	end
	
	
	
endmodule