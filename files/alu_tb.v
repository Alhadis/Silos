/***************************************************
 * Module: alu_tb
 * Project: core_lapido
 * Author: Afonso Machado, Felipe Cordeiro e Filipe Boaventura
 * Description: Test Bench criado para o modulo da alu.
 ***************************************************/

`include "lapido_defs.v"

module alu_tb();

	reg signed [31:0] op1;		// Primeiro operando
	reg signed [31:0] op2; 	// Segundo operando
    reg [5:0] alu_funct; 	// Operacao da alu

    wire signed [32:0] alu_res; 	// O 33th bit eh o carry da alu
    wire [4:0] flags;     	// Demais flags

    alu dut(
		.op1(op1),
		.op2(op2),
		.alu_funct(alu_funct),
		.alu_res(alu_res),
		.flags(flags)
	);



	initial begin
		op1 = 0;
		op2 = 0;
		alu_funct = 0;

		test_add;
		test_sub;
		test_asl;
		test_asr;
		test_and;
		test_nand;
		test_or;
		test_nor;
		test_xnor;
		test_xor;
		test_not;
		test_lsl;
		test_lsr;
		test_slt;

	end

	task display_flags;
		begin
			$display("Flags: ");
			$display(
				"Zero: %b\tTrue: %b\tNeg: %b\tOveflow: %b\nNegZero: %b\tCarry: %b",
				flags[`FL_ZERO], flags[`FL_TRUE], flags[`FL_NEG], flags[`FL_OVERFLOW],
				flags[`FL_NEGZERO],
				alu_res[32] // <--carry da alu
		    );
		end
	endtask

	task test_add;
		begin
			$display("FN_ADD");
			alu_funct = `FN_ADD;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == op1 + op2) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 + op2, alu_res);
		end
	endtask // test_add

	task test_sub;
		begin
			$display("FN_SUB");
			alu_funct = `FN_SUB;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == op1 - op2) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 - op2, alu_res);
		end
	endtask

	task test_asl;
		begin
			$display("FN_ASL");
			alu_funct = `FN_ASL;
			op1 = $random;
			#1;
			$display("rs: %d\tres: %d", op1, alu_res);
			display_flags;

			if(alu_res == op1 <<< 1) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 <<< 1, alu_res);
		end
	endtask

	task test_asr;
		begin
			$display("FN_ASR");
			alu_funct = `FN_ASR;
			op1 = $random;
			#1;
			$display("rs: %d\tres: %d", op1, alu_res);
			display_flags;

			if(alu_res == op1 >>> 1) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 >>> 1, alu_res);
		end
	endtask

	task test_and;
		begin
			$display("FN_AND");
			alu_funct = `FN_AND;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == op1 & op2) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 & op2, alu_res);
		end
	endtask

	task test_nand;
		begin
			$display("FN_NAND");
			alu_funct = `FN_NAND;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == ~(op1 & op2)) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, ~(op1 & op2), alu_res);
		end
	endtask

	task test_or;
		begin
			$display("FN_OR");
			alu_funct = `FN_OR;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == op1 | op2) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 | op2, alu_res);
		end
	endtask

	task test_nor;
		begin
			$display("FN_NOR");
			alu_funct = `FN_NOR;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == ~(op1 | op2)) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, ~(op1 | op2), alu_res);
		end
	endtask

	task test_xnor;
		begin
			$display("FN_XNOR");
			alu_funct = `FN_XNOR;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == op1 ~^ op2) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 ~^ op2, alu_res);
		end
	endtask

	task test_xor;
		begin
			$display("FN_XOR");
			alu_funct = `FN_XOR;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == op1 ^ op2) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 ^ op2, alu_res);
		end
	endtask

	task test_not;
		begin
			$display("FN_NOT");
			alu_funct = `FN_NOT;
			op1 = $random;
			#1;
			$display("rs: %d\tres: %d", op1, alu_res);
			display_flags;

			if(alu_res == ~op1) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, ~op1, alu_res);
		end
	endtask

	task test_lsl;
		begin
			$display("FN_LSL");
			alu_funct = `FN_LSL;
			op1 = $random;
			#1;
			$display("rs: %d\tres: %d", op1, alu_res);
			display_flags;

			if(alu_res == op1 << 1) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 << 1, alu_res);
		end
	endtask

	task test_lsr;
		begin
			$display("FN_LSR");
			alu_funct = `FN_LSR;
			op1 = $random;
			#1;
			$display("rs: %d\tres: %d", op1, alu_res);
			display_flags;

			if(alu_res == op1 >> 1) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, op1 >> 1, alu_res);
		end
	endtask

	task test_slt;
		begin
			$display("FN_SLT");
			alu_funct = `FN_SLT;
			op1 = $random;
			op2 = $random;
			#1;
			$display("rs: %d\trt: %d\tres: %d", op1, op2, alu_res);
			display_flags;

			if(alu_res == 1) $display("OK!");
			else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, 1, alu_res);
		end
	endtask

endmodule
