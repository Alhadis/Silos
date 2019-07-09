`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:10 10/21/2014 
// Design Name: 
// Module Name:    Top 
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
module Top(
    input iReset,
    input iStart,
	 input iClk,
    input iPosicionY1,					//derecha
    input iPosicionY2,					//izquierda
	 //.......Pantalla.......
	 output sincH,
    output sincV,
    output colorR,
    output colorG,
    output colorB,
	 output [3:0] conectorAn,
	 output [0:6] display,
	 //.......MOUSE.......
	 input [1:0]selectorControles,
	 output [7:0]LedMouse,
	 inout PS2_CLK,
	 inout PS2_DATA,
	 input RsRx
	 
    );
	 

//activadores de los registros
wire EnableResta;
wire EnableSalto;
wire EnableRegistrosPintar;
wire EnableRegistrosPintarY;
wire EnableConectorCero;

// indica el choque 
wire EnableChoque;

wire EnableResetPintar;

//senales para las contadores
wire EnableConectorLFSM;

//controldor del baud
wire wireSTick;


wire EnablePintar;
wire EnablePintarMonitor;
	
	
//salidas de los Contadores	
wire[8:0] SalidaContadorLFSM;


//Conector controlJugador
wire [7:0]wireAcelerometro;

//wire wireBanderaAceletrometro;
//Conectores de las tubos a pintar
wire[9:0] ConectorPosicionX1;
wire[8:0] ConectorPosicionY1;
wire[9:0] ConectorPosicionX2;
wire[8:0] ConectorPosicionY2;
wire[9:0] ConectorPosicionX3;
wire[8:0] ConectorPosicionY3;



//Conectores puntos de pintar

wire [10:0] ConectorPixelX;
wire [9:0] ConectorPixelY;

//wire display
wire[3:0] conectorInversorAux;
wire[0:6] conectorDisplay;


//conectores de numero 

wire [8:0] 	ConectorNumero;
wire [11:0] ConectorNumeroDisplay;

//conectores de modulo de pintar

wire [2:0] colorRGB; //activar para conectar el generador
wire video, synH, synV; 

//DivisoresDe reloj

wire wireClk25;
wire wireClk1s;
wire wireCLK9600;

//Conectores del birds

wire wireSubir;
wire wireBajar;
wire sepuedesubir;
wire sepuedebajar;
wire[8:0] wireCuadroX;
wire wirePintarBirds;

//conectores sumador

wire conectorEnableSumador;

//....................................
//			selector de controles
//....................................
wire [0:7] wireLed;
wire  wire_PS2_CLK;
wire wire_PS2_DATA;
wire controlDer;
wire controlIzq;

selectorControles controlJugador (
	 .iclk(wireClk1s),	
    .selectorControles(selectorControles),
    .mouse(wireLed[2:7]),
    .acelerometro(wireAcelerometro),	 
    .botonDerecha(iPosicionY1), 
    .botonIzquierda(iPosicionY2), 
	 
    .salidaDerecha(controlDer), //salidas
    .salidaIzquierda(controlIzq)
    );
//....................................	 

// Instantiate the module
MaquinaJugador MaquinaBicho (
    .clk(wireClk1s), 
    .reset(iReset),
	 .iResetPintar(EnableResetPintar),
    .pintarEnable(EnablePintar), 
    .izquierda(controlDer), //controles
    .derecha(controlIzq), //controles
    .spaceizq(sepuedesubir), 
    .spaceder(sepuedebajar),  
    .incremente(wireSubir), 
    .decremente(wireBajar), 
	 .oEnablePintar(wirePintarBirds)
    );
	 


Mouse_Test controlMouse (
    .CLK_100MHZ(iClk),//wireClk50), 
    .reset(iReset), 
    .PS2_CLK(wire_PS2_CLK), //salidas
    .PS2_DATA(wire_PS2_DATA), 
    .LED(wireLed)
    );

// Instantiate the module
DivisorFrecuencias 	Divisor (
    .clk(iClk), 
    .clk_25Mhz(wireClk25), 
    .clk_1s(wireClk1s)
	 //.clk_50Mhz(wireClk50)
    );
 
// Instantiate the module
MaquinaMaster FSMMaster (
    .iClk(wireClk1s),  
    .oEnableLFSR(EnableConectorLFSM), 
    .oPintar(EnablePintar), 
	 .oResetPintar(EnableResetPintar),
    .iStop(EnableChoque),
    .iStart(iStart), 
    .iReset(iReset)
    );
	 
LFSR RegistroLFSM(
    .clk(wireClk1s), 
    .rst_n(EnableConectorLFSM), 
    .data(SalidaContadorLFSM)
    );



// Instantiate the module
MaquinaCarros FSMMaquina (
    .iClk(wireClk1s), 
    .iEnable(EnablePintar), 
    .iReset(iReset),
	 .iResetPintar(EnableResetPintar),	 
    .iEnableCero(EnableConectorCero), 
    .pintar(EnablePintarMonitor), 
    .EnableX(EnableRegistrosPintar), 
    .EnableY(EnableRegistrosPintarY), 
    .Suma(EnableResta), 
    .Salta(EnableSalto)
    );

// Instantiate the module
CarroX RegistroPintarX1 (
    .iClk(wireClk1s), 
    .iPosicionX(10'd330), 
    .iPosicionY(9'd240), 
    .iPosicionAuxX(ConectorPosicionX2), 
    .iPosicionAuxY(ConectorPosicionY2), 
    .iEnable(EnableRegistrosPintar), 
    .iSuma(EnableResta), 
    .iSalto(EnableSalto), 
    .oPosicionSalidaX(ConectorPosicionX1), 
    .oPosicionSalidaY(ConectorPosicionY1), 
    .oEnableCero(EnableConectorCero),
	 .oEnableCuenta(conectorEnableSumador)
    );

// Instantiate the module
Carro2 RegistroPintarX2 (
    .iClk(wireClk1s), 
    .iPosicionX(10'd225), 
    .iPosicionY(9'd0), 
    .iPosicionAuxX(ConectorPosicionX3), 
    .iPosicionAuxY(ConectorPosicionY3), 
    .iEnable(EnableRegistrosPintar), 
    .iSuma(EnableResta), 
    .iSalto(EnableSalto), 
    .oPosicionSalidaX(ConectorPosicionX2), 
    .oPosicionSalidaY(ConectorPosicionY2)
    );
	 
// Instantiate the module RegistroPintarY
CarroY RegistroPintarY (
    .iClk(wireClk1s), 
    .iPosicionX(SalidaContadorLFSM), 
    .iPosicionY(9'd0), 
    .iEnable(EnableRegistrosPintarY), 
    .iSalto(EnableSalto), 
    .oPosicionX(ConectorPosicionX3), 
    .oPosicionY(ConectorPosicionY3)
    );

	 
	 
// Instantiate the module
vga_sync VGA (
    .clkP(wireClk25), 
    .sincH(synH), 
    .sincV(synV), 
    .video(video), 
    .pixelX(ConectorPixelX), 
    .pixelY(ConectorPixelY)
    );
	 
// Instantiate the module
Pintar PintarMonitor (
    .clk(wireClk25), 
    .pixelX(ConectorPixelX), 
    .pixelY(ConectorPixelY), 
    .iPintarCarros(EnablePintarMonitor), 
    .iPintarJugador(wirePintarBirds), 
    .iPosicionX1(ConectorPosicionX1), 
    .iPosicionX2(ConectorPosicionX2),
    .iPosicionX3(ConectorPosicionX3),	 
    .iPosicionY1(ConectorPosicionY1), 
    .iPosicionY2(ConectorPosicionY2),	
    .iPosicionJugador(wireCuadroX), 
    .ColorRGB(colorRGB)
    );
	 
	 
	 
	//Modulos del birds
	
// Instantiate the module
Jugador Cuadro (
    .clk(wireClk1s), 
    .reset(iReset), 
    .der(wireSubir), 
    .izq(wireBajar), 
    .espacioAr(sepuedesubir), 
    .espacioAb(sepuedebajar), 
    .posicionX(wireCuadroX)
    );
	 

	 
	 
// Instantiate the module choque
Choque Choque (
    .iPosicionXT(ConectorPosicionX1), 
    .iPosicionYT(ConectorPosicionY1), 
    .iPosicionXC(wireCuadroX), 
    .oStop(EnableChoque)
    );	 	 
	

// Instantiate the module 	Sumador
CuentaPuntos Sumador (
	 .iClk(wireClk1s),
    .iEnableContar(conectorEnableSumador), 
    .iReset(iReset), 
    .Numero(ConectorNumero)//out 9bits
    );
	 
udDecenasCentenas convertidorBCD(
	.clk(wireClk1s), 
	.binario(ConectorNumero), //in 9 bits
	.display(ConectorNumeroDisplay)//out 12bits
);

// Instantiate the module Display
Display Display (
    .iClk(wireClk1s), //in
    .inputs(ConectorNumeroDisplay), //in 12bits
    .outputs(conectorDisplay), //out
    .an(conectorInversorAux) //out
 );
 

uart_rs Serial (
    .clk(iClk), 
    .reset(iReset), 
    .rx(RsRx), 
    .s_tick(wireSTick),  
    .capture_out(wireAcelerometro)
    );
	 
BaudGen Baud (
    .clk(iClk), 
    .reset(iReset), 
    .max_tick(wireSTick)
    );
	 



	assign LedMouse = wireAcelerometro;
	assign conectorAn = ~conectorInversorAux;
	assign display = ~conectorDisplay;
	//Asiganacion de salidas 
	assign sincH = synH;
   assign sincV = synV;
	assign colorR = (video & colorRGB[2]);
	assign colorG = (video & colorRGB[1]);
	assign colorB = (video & colorRGB[0]);
	//assign LedMouse = wireLed;
	assign PS2_CLK = wire_PS2_CLK;
	assign PS2_DATA = wire_PS2_DATA;

endmodule
