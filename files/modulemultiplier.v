module MODULE_ADDER(
	input wire iData_A, iData_B, iData_Ci, 
	output wire oData_Co, oPartialResult
);

assign {oData_Co, oPartialResult} = iData_A + iData_B + iData_Ci;

endmodule

module MODULE_MULTIPLIER
(
	input wire [15:0] wA,
	input wire [15:0] wB,
	output wire [15:0]wResult
);

wire [3:0] wCarry[2:0];

//Linea 0
assign wResult[0] = wA[0]&wB[0];

wire [3:0] wRow0Result;
MODULE_ADDER bit1row0(wA[0]&wB[1], wA[1]&wB[0], 0, wCarry[0][0], wRow0Result[0]);
MODULE_ADDER bit2row0(wA[2]&wB[0], wA[1]&wB[1], wCarry[0][0], wCarry[0][1], wRow0Result[1]);
MODULE_ADDER bit3row0(wA[3]&wB[0], wA[2]&wB[1], wCarry[0][1],wCarry[0][2], wRow0Result[2]);
MODULE_ADDER bit4row0(0, wA[3]&wB[1], wCarry[0][2], wCarry[0][3], wRow0Result[3]);

//Linea 1

wire [3:0] wRow1Result;
MODULE_ADDER bit1row1(wA[0]&wB[2], wRow0Result[1], 0, wCarry[1][0], wRow1Result[0]);
MODULE_ADDER bit2row1(wA[1]&wB[2], wRow0Result[2], wCarry[1][0], wCarry[1][1], wRow1Result[1]);
MODULE_ADDER bit3row1(wA[2]&wB[2], wRow0Result[3], wCarry[1][1],wCarry[1][2], wRow1Result[2]);
MODULE_ADDER bit4row1(wCarry[0][3], wA[3]&wB[2], wCarry[1][2], wCarry[1][3], wRow1Result[3]);

//Linea 2

wire [3:0] wRow2Result;
MODULE_ADDER bit1row2(wA[0]&wB[3], wRow1Result[1], 0, wCarry[2][0], wRow2Result[0]);
MODULE_ADDER bit2row2(wA[1]&wB[3], wRow2Result[2], wCarry[2][0], wCarry[2][1], wRow2Result[1]);
MODULE_ADDER bit3row2(wA[2]&wB[3], wRow2Result[3], wCarry[2][1],wCarry[2][2], wRow2Result[2]);
MODULE_ADDER bit4row2(wCarry[1][3], wA[3]&wB[3], wCarry[2][2], wCarry[2][3], wRow2Result[3]);

wire [7:0] Zeros;
assign Zeros = 7'd0;
assign wResult[15:1] = {Zeros, wCarry[2][3], wRow2Result, wRow1Result[0], wRow0Result[0]};

endmodule

///////////////////////ESTO VA EN LA MINI ALU////////////////////////////////////////
//MODULE_MULTIPLIER multiplier
//(
//	.wA(wSourceData0),
//	.wB(wSourceData1),
//	.wResult(wResult)
//);
