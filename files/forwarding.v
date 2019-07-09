module bypasses(
	input[4:0] rs_D,
	input[4:0] rt_D,

	input[4:0] rd_EX,
	input[4:0] rd_TL,
	input[4:0] rd_C,
	input[4:0] rd_WB,

	input[4:0] rob_rd_0,
	input[4:0] rob_rd_1,
	input[4:0] rob_rd_2,
	input[4:0] rob_rd_3,
	input[4:0] rob_rd_4,
	input[4:0] rob_rd_5,
	input[4:0] rob_rd_6,
	input[4:0] rob_rd_7,
	input[7:0] rob_valids,

	output rs_from_EX,
	output rs_from_TL,
	output rs_from_WB,
	output rs_from_C,

	output rt_from_EX,
	output rt_from_TL,
	output rt_from_WB,
	output rt_from_C,

	input[2:0] ROB_tail,

	output[2:0] rt_from_ROB,
	output rs_ROB,
	output[2:0] rs_from_ROB,
	output rt_ROB
);

wire[4:0] rob_rd[7:0];
assign rob_rd[0] = rob_rd_0;
assign rob_rd[1] = rob_rd_1;
assign rob_rd[2] = rob_rd_2;
assign rob_rd[3] = rob_rd_3;
assign rob_rd[4] = rob_rd_4;
assign rob_rd[5] = rob_rd_5;
assign rob_rd[6] = rob_rd_6;
assign rob_rd[7] = rob_rd_7;

assign rs_from_EX = (rs_D == rd_EX);
assign rs_from_TL = (rs_D == rd_TL);
assign rs_from_WB = (rs_D == rd_WB);
assign rs_from_C = (rs_D == rd_C);

assign rt_from_EX = (rt_D == rd_EX);
assign rt_from_TL = (rt_D == rd_TL);
assign rt_from_WB = (rt_D == rd_WB);
assign rt_from_C = (rt_D == rd_C);

assign rs_from_ROB = ((rs_D == rob_rd[ROB_tail])&rob_valids[ROB_tail])?ROB_tail:
((rs_D == rob_rd[ROB_tail-1])&rob_valids[ROB_tail-1])?ROB_tail-1:
((rs_D == rob_rd[ROB_tail-2])&rob_valids[ROB_tail-2])?ROB_tail-2:
((rs_D == rob_rd[ROB_tail-3])&rob_valids[ROB_tail-3])?ROB_tail-3:
((rs_D == rob_rd[ROB_tail-4])&rob_valids[ROB_tail-4])?ROB_tail-4:
((rs_D == rob_rd[ROB_tail-5])&rob_valids[ROB_tail-5])?ROB_tail-5:
((rs_D == rob_rd[ROB_tail-6])&rob_valids[ROB_tail-6])?ROB_tail-6:ROB_tail-7;

assign rs_ROB = ((rs_D == rob_rd[ROB_tail])&rob_valids[ROB_tail])
&((rs_D == rob_rd[ROB_tail-1])&rob_valids[ROB_tail-1])
&((rs_D == rob_rd[ROB_tail-2])&rob_valids[ROB_tail-1])
&((rs_D == rob_rd[ROB_tail-3])&rob_valids[ROB_tail-1])
&((rs_D == rob_rd[ROB_tail-4])&rob_valids[ROB_tail-1])
&((rs_D == rob_rd[ROB_tail-5])&rob_valids[ROB_tail-1])
&((rs_D == rob_rd[ROB_tail-6])&rob_valids[ROB_tail-1]);

assign rt_from_ROB = ((rs_D == rob_rd[ROB_tail])&rob_valids[ROB_tail])?ROB_tail:
((rt_D == rob_rd[ROB_tail-1])&rob_valids[ROB_tail-1])?ROB_tail-1:
((rt_D == rob_rd[ROB_tail-2])&rob_valids[ROB_tail-2])?ROB_tail-2:
((rt_D == rob_rd[ROB_tail-3])&rob_valids[ROB_tail-3])?ROB_tail-3:
((rt_D == rob_rd[ROB_tail-4])&rob_valids[ROB_tail-4])?ROB_tail-4:
((rt_D == rob_rd[ROB_tail-5])&rob_valids[ROB_tail-5])?ROB_tail-5:
((rt_D == rob_rd[ROB_tail-6])&rob_valids[ROB_tail-6])?ROB_tail-6:ROB_tail-7;

assign rt_ROB = ((rt_D == rob_rd[ROB_tail])&rob_valids[ROB_tail])
&((rt_D == rob_rd[ROB_tail-1])&rob_valids[ROB_tail-1])
&((rt_D == rob_rd[ROB_tail-2])&rob_valids[ROB_tail-1])
&((rt_D == rob_rd[ROB_tail-3])&rob_valids[ROB_tail-1])
&((rt_D == rob_rd[ROB_tail-4])&rob_valids[ROB_tail-1])
&((rt_D == rob_rd[ROB_tail-5])&rob_valids[ROB_tail-1])
&((rt_D == rob_rd[ROB_tail-6])&rob_valids[ROB_tail-1]);

endmodule