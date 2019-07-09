/*
ESQUEMA DEL MODULO
                ________
    DATA  ---->|       |----> MODULE_A
    ENABLE---->|       |----> MODULE_B
    RESET ---->|       |----> MODULE_C
               |       |----> MODULE_D
               |_______|----> MODULE_E

NOTAS DE CREACIÓN
1. El tamaño del bus de entrada sera equivalente a la cantidad de 
modulos que seran conectados al modulo switch.
2. Al oprimir enable debo ser capaz de almacenar el valor en la
entrada y a su vez al inabilitarlo debe ser capaz de mantenerlo 
en la salida solo hasta que una condicion de reset lo obligue 
a tomar el estado por defecto.
*/
module switch (clk, DATA, ENABLE, RESET, MODULE_A, MODULE_B, MODULE_C, MODULE_D, MODULE_E);

        input            clk;
	input      [4:0] DATA;
	input            ENABLE;
        input            RESET;

	output           MODULE_A;
	output           MODULE_B;
	output           MODULE_C;
	output           MODULE_D;
	output           MODULE_E;

               reg [4:0] DATA_OUT;

	always @(posedge clk)
              begin
		if(RESET) DATA_OUT = 5'd0;
		  else if(ENABLE) DATA_OUT = DATA;
		    else DATA_OUT = DATA_OUT;
              end

assign {MODULE_A, MODULE_B, MODULE_C, MODULE_D, MODULE_E} = DATA_OUT;

endmodule
/*
//VERSION 1
//ERROR
//No consideraba el hecho de que debe almacenar el valor por lo tanto requeria de un reloj
module switch (DATA, ENABLE, RESET, MODULE_A, MODULE_B, MODULE_C, MODULE_D, MODULE_E);

	input      [4:0] DATA;
	input            ENABLE;
        input            RESET;

	output           MODULE_A;
	output           MODULE_B;
	output           MODULE_C;
	output           MODULE_D;
	output           MODULE_E;

               reg [4:0] DATA_OUT;

	always @(ENABLE, RESET, DATA)
              begin
			case( {ENABLE,RESET} )
				2'b00: DATA_OUT <= 5'd0;
				2'b01: DATA_OUT <= 5'd0;
				2'b10: DATA_OUT <= DATA;
				2'b11: DATA_OUT <= 5'd0;
			endcase
              end

assign {MODULE_A, MODULE_B, MODULE_C, MODULE_D, MODULE_E} = DATA_OUT;

endmodule
*/


  

