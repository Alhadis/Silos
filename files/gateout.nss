/////////////////////////
// Script by Zero
//
// Evento OnExit del area Inicio
////////////////////////

#include "entradas"

void main()
{
    object oPC = GetEnteringObject();

    // Agregado por Inquisidor BEGIN: Ver "gatein"
    Experience_onGateExit( oPC );
    // Agregado por Inquisidor END

//    DelayCommand(2.0, ajustarVida(oPC));
}
