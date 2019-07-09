/***************************************************
 * Module: control_unity_tb
 * Project: core_lapido
 * Author: Afonso Machado
 * Description: Test Bench criado para o modulo da
 * unidade de controle, contendo as entradas de
 * opcode e funct e a saída para as suas respectivas
 * funções.
 ***************************************************/

 `include "lapido_defs.v"

 module control_unit_tb ();

 	reg [5:0] opcode;  //Entrada do opcode
 	reg [5:0] funct;   // Entrada do funct se houver
    reg stall_pipeline;

    // Sinais para o estagio IF
    wire is_jump;          // A instrucao eh um salto incondicional

    // Sinais para o estagio ID
    wire sel_j_jr;         // Seleciona a fonte do endereco do salto incondicional

 	wire [5:0] alu_funct;  // Seleciona a operacao da alu
    wire alu_src_mu;      // Seleciona o segundo operando da alu
    wire [1:0] reg_dst_mux;// Seleciona o endereco do registrador de escrita
    wire is_load;


    // Sinais para o estagio MEM
    wire mem_write_enable; // Habilita a escrita na memoria
    wire sel_beq_bne;      // Seleciona entre beq e bne
    wire fl_write_enable;  // Habilita a escrita no registrador de flags
    wire sel_jt_jf;        // Seleciona entre jt e jf na fmu
    wire is_branch;        // A instrucao eh um desvio pc-relative
    wire sel_jflag_branch;


    // Sinais para o estagio WB
    wire [1:0] wb_res_mux; // Seleciona o dado que sera escrito no registrador
    wire reg_write_enable; // Habilita a escrita no banco de registradores


    reg [5:0] funct_array[13:0];

    control_unit dut(
    	.opcode(opcode),
    	.funct(funct),
        .stall_pipeline(stall_pipeline),
        .is_jump(is_jump),
        .sel_j_jr(sel_j_jr),
    	.alu_funct(alu_funct),
    	.alu_src_mux(alu_src_mux),
        .is_load(is_load),
    	.reg_dst_mux(reg_dst_mux),
        .sel_jflag_branch(sel_jflag_branch),
    	.mem_write_enable(mem_write_enable),
    	.sel_beq_bne(sel_beq_bne),
    	.fl_write_enable(fl_write_enable),
    	.sel_jt_jf(sel_jt_jf),
    	.is_branch(is_branch),
    	.wb_res_mux(wb_res_mux),
    	.reg_write_enable(reg_write_enable)
    	);

    initial begin

    	opcode = 0;
    	funct = 0;
        stall_pipeline = 0;

        create_funct_array; //Criar um array contendo todas as opções de funct

        test_jr;
        test_store;
        test_load;
        test_op_j_type;
        test_op_jal;
        test_beq;
        test_bne;
        test_jt;
        test_jf;
        test_loadlit;
        test_op_r_type;
        test_addi;
        test_andi;
        test_ori;
        test_slti;
        test_lcl;
        test_lch;
        test_op_r_type_no_jr;

    end

    task test_store;
    	begin
    		opcode = `OP_STORE;

            $display("store");
            #1

    		if(mem_write_enable == 1'b1) $display("OK!");
    		else $display("ERRO! @ %t , Esperado: %d,  Obteve %d",
			$time, 1'b1, mem_write_enable);

    	end
    endtask

    task test_load;
        begin
            opcode = `OP_LOAD;

            $display("load");
            #1

            if(wb_res_mux == `WB_MEM && reg_write_enable == 1'b1) $display("OK!");
            else $display("ERRO! @ %t , Esperado (wb_res_mux): %d, Esperado (reg_write_enable):%d,  Obteve %d",
            $time,`WB_MEM, 1'b1, mem_write_enable);
        end
    endtask

    task test_op_j_type;
        begin
            opcode = `OP_J_TYPE;

            $display("op_j_type");
            #1

            if(is_jump == 1'b1 && sel_j_jr == `SEL_J) begin
                $display("OK!");
            end
            else $display("ERRO! @ %t , Esperado (wb_res_mux): %d, Esperado (reg_write_enable):%d,  Obteve (wb_res_mux): %d, Obteve (reg_write_enable): %d",
            $time,`WB_MEM, 1'b1, wb_res_mux, reg_write_enable);
        end
    endtask

    task test_op_jal;
        begin
            opcode = `OP_JAL;

            $display("op_jal");
            #1

            if(is_jump == 1'b1 && reg_dst_mux == `REG_DST_15 &&
                sel_j_jr == `SEL_JR && reg_write_enable == 1'b1 &&
                wb_res_mux == `WB_PC)
                begin
                    $display("OK!");
                end
            else begin
                $display("ERRO! @ %t ,
                        Esperado (is_jump): %d,
                        Esperado (reg_dst_mux): %d,
                        Esperado (sel_j_jr): %d,
                        Esperado (reg_write_enable): %d,
                        Esperado (wb_res_mux): %d,

                        Obteve (is_jump): %d,
                        Obteve (reg_dst_mux): %d,
                        Obteve (sel_j_jr): %d,
                        Obteve (reg_write_enable): %d,
                        Obteve (wb_res_mux): %d",
                        $time,
                        1'b1,
                        `REG_DST_15,
                        `SEL_JR,
                        1'b1,
                        `WB_PC,
                        is_jump,
                        reg_dst_mux,
                        sel_j_jr,
                        reg_write_enable,
                        wb_res_mux,);
            end
        end
    endtask

    task test_beq;
        begin
            opcode = `OP_BEQ;

            $display("op_beq");
            #1

            if(is_branch == 1'b1 && alu_src_mux == `ALU_SRC_REG &&
                alu_funct == `FN_SUB && sel_beq_bne == `SEL_BEQ)
                begin
                    $display("OK!");
                end
            else begin
                $display("ERRO! @ %t ,
                        Esperado (is_branch): %d,
                        Esperado (alu_src_mux): %d,
                        Esperado (alu_funct): %d,
                        Esperado (sel_beq_bne): %d,

                        Obteve (is_branch): %d,
                        Obteve (alu_src_mux): %d,
                        Obteve (alu_funct): %d,
                        Obteve (sel_beq_bne): %d",
                        $time,
                        1'b1,
                        `ALU_SRC_REG,
                        `FN_SUB,
                        `SEL_BEQ,
                        is_branch,
                        alu_src_mux,
                        alu_funct,
                        sel_beq_bne,);
            end
        end
    endtask

    task test_bne;
        begin
            opcode = `OP_BNE;

            $display("op_beq");
            #1

            if(is_branch == 1'b1 && alu_src_mux == `ALU_SRC_REG &&
                alu_funct == `FN_SUB && sel_beq_bne == `SEL_BNE)
                begin
                    $display("OK!");
                end
            else begin
                $display("ERRO! @ %t ,
                        Esperado (is_branch): %d,
                        Esperado (alu_src_mux): %d,
                        Esperado (alu_funct): %d,
                        Esperado (sel_beq_bne): %d,

                        Obteve (is_branch): %d,
                        Obteve (alu_src_mux): %d,
                        Obteve (alu_funct): %d,
                        Obteve (sel_beq_bne): %d",
                        $time,
                        1'b1,
                        `ALU_SRC_REG,
                        `FN_SUB,
                        `SEL_BNE,
                        is_branch,
                        alu_src_mux,
                        alu_funct,
                        sel_beq_bne,);
            end
        end
    endtask

    task test_jt;
        begin
            opcode = `OP_JT;

            $display("op_jt");
            #1

            if(is_branch == 1'b1 && sel_jt_jf == `SEL_JT) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (is_branch): %d,
                         Esperado (sel_jt_jf):%d,
                         Obteve (is_branch): %d,
                         Obteve (sel_jt_jf): %d",
                         $time,
                         1'b1,
                         `SEL_JT,
                         is_branch,
                         sel_jt_jf);
            end
        end
    endtask

    task test_jf;
        begin
            opcode = `OP_JF;

            $display("op_jf");
            #1

            if(is_branch == 1'b1 && sel_jt_jf == `SEL_JF) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (is_branch): %d,
                         Esperado (sel_jt_jf):%d,
                         Obteve (is_branch): %d,
                         Obteve (sel_jt_jf): %d",
                         $time,
                         1'b1,
                         `SEL_JF,
                         is_branch,
                         sel_jt_jf);
            end
        end
    endtask

    task test_loadlit;
        begin
            opcode = `OP_LOADLIT;

            $display("op_loadlit");
            #1

            if(wb_res_mux == `WB_IMM && reg_write_enable == 1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (wb_res_mux): %d,
                         Esperado (reg_write_enable):%d,
                         Obteve (wb_res_mux): %d,
                         Obteve (reg_write_enable): %d",
                         $time,
                         `WB_IMM,
                         1'b1,
                         wb_res_mux,
                         reg_write_enable);
            end
        end
    endtask

    task test_op_r_type;
        begin
            opcode = `OP_R_TYPE;

            $display("test_op_r_type");
            #1

            if(reg_dst_mux == `REG_DST_RD && alu_src_mux == `ALU_SRC_REG) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (reg_dst_mux): %d,
                         Esperado (alu_src_mux):%d,
                         Obteve (reg_dst_mux): %d,
                         Obteve (alu_src_mux): %d",
                         $time,
                         `REG_DST_RD,
                         `ALU_SRC_REG,
                         reg_dst_mux,
                         alu_src_mux);
            end
        end
    endtask

    task test_jr;
        begin
            opcode = `OP_R_TYPE;
            funct = `FN_JR;

            $display("test_jr");
            #1

            if(reg_dst_mux == `REG_DST_RD && alu_src_mux == `ALU_SRC_REG &&
                is_jump ==1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (reg_dst_mux): %d,
                         Esperado (alu_src_mux): %d,
                         Esperado (is_jump): %d
                         Obteve (reg_dst_mux): %d,
                         Obteve (alu_src_mux): %d,
                         Obteve (is_jump) %d",
                         $time,
                         `REG_DST_RD,
                         `ALU_SRC_REG,
                         1'b1,
                         reg_dst_mux,
                         alu_src_mux,
                         is_jump);
            end
        end
    endtask
    integer i;
    task test_op_r_type_no_jr;
        begin
            opcode = `OP_R_TYPE;

            $display("test_op_r_type_no_jr");

            for (i = 0; i < 14; i=i+1) begin
                funct = funct_array[i];
                #1;
                $display("funct: 0x%h", funct);
                if(funct != `FN_JR && reg_write_enable == 1'b1 &&
                    fl_write_enable == 1'b1) begin
                    $display("OK!");
                end
                else begin
                $display("ERRO! @ %t,
                         Esperado (funct != FN_JR): %d,
                         Esperado (reg_write_enable): %d,
                         Esperado (fl_write_enable): %d
                         Obteve (alu_funct): %d,
                         Obteve (reg_write_enable): %d,
                         Obteve (fl_write_enable) %d",
                         $time,
                         funct,
                         1'b1,
                         1'b1,
                         funct,
                         reg_write_enable,
                         fl_write_enable);
                end
            end
        end
    endtask

    task test_addi;
        begin
            opcode = `OP_ADDI;

            $display("test_addi");
            #1

            if(alu_funct == `FN_ADD && reg_write_enable == 1'b1 &&
                fl_write_enable == 1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (alu_funct): %d,
                         Esperado (reg_write_enable): %d,
                         Esperado (fl_write_enable): %d
                         Obteve (alu_funct): %d,
                         Obteve (reg_write_enable): %d,
                         Obteve (fl_write_enable) %d",
                         $time,
                         `FN_ADD,
                         1'b1,
                         1'b1,
                         alu_funct,
                         reg_write_enable,
                         fl_write_enable);
            end
        end
    endtask

    task test_andi;
        begin
            opcode = `OP_ANDI;

            $display("test_addi");
            #1

            if(alu_funct == `FN_AND && reg_write_enable == 1'b1 &&
                fl_write_enable == 1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (alu_funct): %d,
                         Esperado (reg_write_enable): %d,
                         Esperado (fl_write_enable): %d
                         Obteve (alu_funct): %d,
                         Obteve (reg_write_enable): %d,
                         Obteve (fl_write_enable) %d",
                         $time,
                         `FN_AND,
                         1'b1,
                         1'b1,
                         alu_funct,
                         reg_write_enable,
                         fl_write_enable);
            end
        end
    endtask

    task test_ori;
        begin
            opcode = `OP_ORI;

            $display("test_addi");
            #1

            if(alu_funct == `FN_OR && reg_write_enable == 1'b1 &&
                fl_write_enable == 1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (alu_funct): %d,
                         Esperado (reg_write_enable): %d,
                         Esperado (fl_write_enable): %d
                         Obteve (alu_funct): %d,
                         Obteve (reg_write_enable): %d,
                         Obteve (fl_write_enable) %d",
                         $time,
                         `FN_OR,
                         1'b1,
                         1'b1,
                         alu_funct,
                         reg_write_enable,
                         fl_write_enable);
            end
        end
    endtask

    task test_slti;
        begin
            opcode = `OP_SLTI;

            $display("test_addi");
            #1

            if(alu_funct == `FN_SLT && reg_write_enable == 1'b1 &&
                fl_write_enable == 1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (alu_funct): %d,
                         Esperado (reg_write_enable): %d,
                         Esperado (fl_write_enable): %d
                         Obteve (alu_funct): %d,
                         Obteve (reg_write_enable): %d,
                         Obteve (fl_write_enable) %d",
                         $time,
                         `FN_SLT,
                         1'b1,
                         1'b1,
                         alu_funct,
                         reg_write_enable,
                         fl_write_enable);
            end
        end
    endtask

    task test_lcl;
        begin
            opcode = `OP_LCL;

            $display("test_addi");
            #1

            if(alu_funct == `OP_LCL && reg_write_enable == 1'b1 &&
                fl_write_enable == 1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (alu_funct): %d,
                         Esperado (reg_write_enable): %d,
                         Esperado (fl_write_enable): %d
                         Obteve (alu_funct): %d,
                         Obteve (reg_write_enable): %d,
                         Obteve (fl_write_enable) %d",
                         $time,
                         `OP_LCL,
                         1'b1,
                         1'b1,
                         alu_funct,
                         reg_write_enable,
                         fl_write_enable);
            end
        end
    endtask

    task test_lch;
        begin
            opcode = `OP_LCH;

            $display("test_addi");
            #1

            if(alu_funct == `OP_LCH && reg_write_enable == 1'b1 &&
                fl_write_enable == 1'b1) begin
                $display("OK!");
            end
            else begin
                $display("ERRO! @ %t,
                         Esperado (alu_funct): %d,
                         Esperado (reg_write_enable): %d,
                         Esperado (fl_write_enable): %d
                         Obteve (alu_funct): %d,
                         Obteve (reg_write_enable): %d,
                         Obteve (fl_write_enable) %d",
                         $time,
                         `OP_LCH,
                         1'b1,
                         1'b1,
                         alu_funct,
                         reg_write_enable,
                         fl_write_enable);
            end
        end
    endtask

    task create_funct_array;
        begin
            funct_array[0] = `FN_ADD;
            funct_array[1] = `FN_SUB;
            funct_array[2] = `FN_AND;
            funct_array[3] = `FN_OR;
            funct_array[4] = `FN_NOT;
            funct_array[5] = `FN_XOR;
            funct_array[6] = `FN_NOR;
            funct_array[7] = `FN_XNOR;
            funct_array[8] = `FN_NAND;
            funct_array[9] = `FN_LSL;
            funct_array[10] = `FN_LSR;
            funct_array[11] = `FN_ASL;
            funct_array[12] = `FN_ASR;
            funct_array[13] = `FN_SLT;
        end
    endtask


 endmodule
