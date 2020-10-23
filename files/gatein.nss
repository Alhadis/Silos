/////////////////////////
// Script by Zero modificado por Inquisidor
//
// Evento OnEnter del area Inicio
////////////////////////
#include "entradas"
#include "Experience_inc"


void main() {
    object oPC = GetEnteringObject();

    string nombrePCnosalta = GetLocalString(OBJECT_SELF, "nombrePCnosalta");  // El personaje cuyo nombre este en esta variable no salta a su posicion persistente
    if(
        !GetIsDM(oPC)
        && (
            GetStringLength( nombrePCnosalta ) == 0
            || FindSubString( GetName(oPC), nombrePCnosalta ) < 0
        )
    ) {
    // Agregado por Inquisidor BEGIN:
        if( Experience_pasaControlYAjuste( oPC ) )
    // Agregado por Inquisidor END
            DelayCommand( 1.0, Entradas_volver(oPC) );
    }
    if( GetXP( oPC ) == 0 )
        SendMessageToPC(oPC, "Bienvenido a Nordock!");
}
