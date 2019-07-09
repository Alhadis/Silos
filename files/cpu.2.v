module yMux1(z, a, b, c);
output z;
input a, b, c;
wire notC, upper, lower;

not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);

endmodule
module yMux(z, a, b, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a, b;
input c;

yMux1 mine[SIZE-1:0](z, a, b, c);

endmodule
module yMux4to1(z,a0,a1,a2,a3,c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a0, a1, a2, a3;
input [1:0] c;
wire [SIZE-1:0] zLo, zHi;

yMux #(SIZE) lo(zLo, a0, a1, c[0]);
yMux #(SIZE) hi(zHi, a2, a3, c[0]);
yMux #(SIZE) final(z, zLo, zHi, c[1]);

endmodule
module yAdder1(z, cout, a, b, cin);
output z, cout;
input a, b, cin;

xor left_xor (tmp, a, b);
xor right_xor (z, cin, tmp);
and left_and(outL, a, b);
and right_and(outR, tmp, cin);
or my_or(cout, outR, outL);

endmodule
module yAdder(z, cout, a, b, cin);
output [31:0] z;
output cout;
input [31:0] a, b;
input cin;
wire [31:0] in, out;

yAdder1 mine[31:0](z, out, a, b, in);

assign in[0] = cin;
assign in[31:1] = out[30:0];
assign cout = out[31];

endmodule
module yArith(z, cout, a, b, ctrl);
output [31:0] z;
output cout;
input [31:0] a, b;
input ctrl;
wire [31:0] notB, tmp;
wire cin;

yAdder mine(z, out, a, notB, cin);

assign cin = ctrl ? 1 : 0;
assign notB = ctrl ? ~b : b;

endmodule
module yAlu(z, ex, a, b, op);
input [31:0] a, b;
input [2:0] op;
output [31:0] z;
output ex;
wire [31:0] arith_z, and_z, or_z, slt_z;
wire [15:0] or16;
wire [7:0] or8;
wire [3:0] or4;
wire [1:0] or2;
wire cout;


assign slt_z = (a[31] ^ b[31]) ? a[31] : arith_z[31];
and my_and[31:0] (and_z, a, b);
or my_or[31:0] (or_z, a, b);

or or_16[15:0]	(or16,	z[31:16],	z[15:0]);
or or_8[7:0]	(or8,	or16[15:8],	or16[7:0]);
or or_4[3:0]	(or4,	or8[7:4],	or8[3:0]);
or or_2[1:0]	(or2,	or4[3:2],	or4[1:0]);
nor nor_1		(ex,	or2[1],		or2[0]);

yArith my_arith(arith_z, cout, a, b, op[2]);
yMux4to1 #(32) my_mux(z, and_z, or_z, arith_z, slt_z, op[1:0]);

endmodule
module yMux2(z, a, b, c);
output [1:0] z;
input [1:0] a, b;
input c;

yMux1 upper(z[0], a[0], b[0], c);
yMux1 lower(z[1], a[1], b[1], c);

endmodule
module yIF(ins, PC, PCp4, PCin, clk);
output [31:0] ins, PC, PCp4;
input [31:0] PCin;
input clk;

wire  zero;
wire read, write,enable;
wire [31:0] a, memIN;
wire [2:0] op;

register #(32) pcReg(PC, PCin, clk, enable);
mem insMem(ins, PC, memIn, clk, read, write);
yAlu myAlu(PCp4, zero, a, PC, op);

assign enable = 1'b1;
assign a = 32'h0004;
assign op = 3'b010;
assign read = 1'b1;
assign write = 1'b0;
endmodule

module yID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
output [31:0] rd1, rd2, imm;
output [25:0] jTarget;
input [31:0] ins, wd;
input RegDst, RegWrite, clk;
wire [4:0] wn, rn1, rn2;

assign rn1 = ins[25:21];
assign rn2 = ins[20:16];
assign imm[15:0] = ins[15:0];
yMux #(16) se(imm[31:16], 16'b0000000000000000, 16'b1111111111111111, ins[15]);
assign jTarget = ins[25:0];

yMux #(5) my_mux(wn, rn2, ins[15:11], RegDst);

rf myRF(rd1, rd2, rn1, rn2, wn, wd, clk, RegWrite);

endmodule
module yEX(z, zero, rd1, rd2, imm, op, ALUSrc);
output [31:0] z;
output zero;
input [31:0] rd1, rd2, imm;
input [2:0] op;
input ALUSrc;
wire [31:0] b;

yMux #(32) my_mux(b, rd2, imm, ALUSrc);
yAlu my_alu(z, zero, rd1, b, op);

endmodule

module yDM(memOut, exeOut, rd2, clk, MemRead, MemWrite);
output [31:0] memOut;
input [31:0] exeOut, rd2;
input clk, MemRead, MemWrite;

mem my_mem(memOut, exeOut, rd2, clk, MemRead, MemWrite);

endmodule

module yWB(wb, exeOut, memOut, Mem2Reg);
output [31:0] wb;
input [31:0] exeOut, memOut;
input Mem2Reg;

yMux #(32) my_mux (wb, exeOut, memOut, Mem2Reg);

endmodule

module yPC(PCin, PC, PCp4, INT, entryPoint, branchImm, jImm, zero, isbranch, isjump);
output [31:0] PCin;
input [31:0] PC, PCp4, entryPoint, branchImm;
input [25:0] jImm;
input INT, zero, isbranch, isjump;
wire [31:0] branchImmX4, jImmX4, jImmX4PPCp4, bTraget, choiceA, choiceB;
wire doBranch, zf;

// Shifting left branchImm twice
assign branchImmX4[31:2] = branchImm[29:0];
assign branchImmX4[1:0] = 2'b00;
// Shifting left jump twice
assign jImmX4[31:2] = jImm[29:0];
assign jImmX4[1:0] = 2'b00;
// adding PC to shifted twice, branchImm
yAlu bALU(bTarget, zf, branchImmX4, PC, 3'b010);
// adding PC to shifted twice, jImm
yAlu jALU(jImmX4PPCp4, zf, jImmX4, PC, 3'b010);
// deciding do branch
and (doBranch, isbranch, zero);
yMux #(32) mux1(choiceA, PCp4, bTarget, doBranch);
yMux #(32) mux2(choiceB, choiceA, jImmX4PPCp4, isjump);
yMux #(32) mux3(PCin, choiceB, entryPoint, INT);
endmodule

module yC1(isStype, isRtype, isItype, isLw, isjump, isbranch, opCode);
output isStype, isRtype, isItype, isLw, isjump, isbranch;
input [6:0] opCode;
wire lwor, ISselect, JBselect, sbz, sz;
// opCode
// lw 0000011
// I-Type 0010011
// R-Type 0110011
// SB-Type 1100011
// UJ-Type 1101111
// S-Type 0100011
// Detect UJ-type
assign isjump=opCode[3'h0004];
// Detect lw
or (lwor, opCode[7'h13], opCode[7'h33], opCode[7'h63], opCode[7'h6F], opCode[7'h23]);
not (isLw, lwor);
// Select between S-Type and I-Type
xor (ISselect, opCode[7'h13], opCode[7'h33], opCode[7'h63], opCode[7'h6F], opCode[7'h23]);
and (isStype, ISselect, opCode[7'h23]);
and (isItype, ISselect, opCode[7'h13]);
// Detect R-Type
and (isRtype, opCode[7'h33], opCode[7'h6F]);
// Select between JAL and Branch
and (JBselect, opCode[7'h6F], opCode[7'h23]);
not (sbz, opCode[7'h13]);
and (isbranch, JBselect, sbz);
endmodule

module yC2(RegWrite, ALUSrc, MemRead, MemWrite, Mem2Reg, isStype, isRtype, isItype, isLw, isjump, isbranch);
output RegWrite, ALUSrc, MemRead, MemWrite, Mem2Reg;
input isStype, isRtype, isItype, isLw, isjump, isbranch;

assign RegDst = rtype;
nor (ALUSrc, rtype, branch);
assign RegWrite = ~branch;
assign MemRead = lw;
assign Mem2Reg = lw;
assign MemWrite = sw;

endmodule

module yC3(ALUop, rtype, branch);
output [1:0] ALUop;
input rtype, isbranch;


assign ALUop[0] = branch;
assign ALUop[1] = rtype;

endmodule

module yC4(op, ALUop, fnCode);
output [2:0] op;
input [5:0] fnCode;
input [1:0] ALUop;
wire or1, and1;

or (or1, fnCode[3], fnCode[0]);
and (and1, ALUop[1], fnCode[1]);
or (op[1], ~ALUop[1], ~fnCode[2]);
and (op[0], or1, ALUop[1]);
or (op[2], and1, ALUop[0]);

endmodule

module yChip(ins, rd2, wb, entryPoint, INT, clk);
output [31:0] ins, rd2, wb;
input [31:0] entryPoint;
input INT, clk;

wire RegDst, RegWrite, ALUSrc, Mem2Reg, MemRead, MemWrite, jump, branch;
wire [1:0] ALUop;
wire [1:0] op;
wire [5:0] opCode, fnCode;
wire [31:0] wd, rd1, imm, PCp4, z, memOut, PCin;
wire [25:0] jTarget;
wire zero;

yIF myIF(ins, PC, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, branch, ins, wd, RegWrite, clk);
yEX myEx(exeOut, zero, rd1, rd2, imm, op, ALUSrc);
yDM myDM(memOut, exeOut, rd2, clk, MemRead, MemWrite);
yWB myWB(wb, exeOut, memOut, Mem2Reg);
yPC myPC(PCin,PC,PCp4,INT,entryPoint,branch,jTarget,zero,isbranch,isjump);
assign opCode = ins[6:0];
yC1 myC1(isStype, isRtype, isItype, isLw, isjump, isbranch, opCode);
yC2 myC2(RegWrite, ALUSrc, MemRead, MemWrite, Mem2Reg,
isStype, isRtype, isItype, isLw, isjump, isbranch);
yC3 myC3(ALUop, isRtype, isbranch);
assign funct3=ins[14:12];
yC4 myC4(op, ALUop, funct3);
assign wd = wb;

assign opCode = ins[31:26];
yC1 myC1(rtype, lw, sw, jump, branch, opCode);
yC2 myC2(RegDst, ALUSrc, RegWrite, Mem2Reg, MemRead, MemWrite, rtype, lw, sw, branch);
assign fnCode = ins[5:0];
yC3 myC3(ALUop, rtype, branch);
yC4 myC4(op, ALUop, fnCode);
