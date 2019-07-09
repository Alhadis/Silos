module pbl1 (
		input  wire       clk_clk,          //       clk.clk
		input  wire       reset_reset_n,    //     reset.reset_n
		input  wire [3:0] botoes_export,    //    botoes.export
		output wire [4:0] ledlinha_export,  //  ledlinha.export
		output wire [4:0] ledcoluna_export  // ledcoluna.export
	);
	
	Problema1 u0 (
        .clk_clk          (clk_clk),          //       clk.clk
        .reset_reset_n    (reset_reset_n),    //     reset.reset_n
        .botoes_export    (botoes_export),    //    botoes.export
        .ledlinha_export  (ledlinha_export),  //  ledlinha.export
        .ledcoluna_export (ledcoluna_export)  // ledcoluna.export
    );	
	
	end 