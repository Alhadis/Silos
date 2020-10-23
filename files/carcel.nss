#include "RS_onEnter"
#include "SPC_inc"
#include "PCT_area_inc"
#include "Skills_sinergy"
#include "Horses_inc"
#include "Mod_inc"
#include "Muerte_inc"

void main() {
    object enteringObject = GetEnteringObject();

    if( GetIsPC( enteringObject ) ) {

        Mod_onPcEntersArea( enteringObject ); // debe ser lo primero que se ejecuta cuando un Pc entra a un área.

        RS_onPcEntersArea( enteringObject );

        if( !GetIsDM( enteringObject ) ) {
            SisPremioCombate_onPjEnterArea( enteringObject );

            Muerte_onPjEntersArea( enteringObject );

            Skills_Sinergy_areaOnEnter( enteringObject );

            PerceptionSys_onPjEnterArea( enteringObject );

            Muerte_onPjEntersJailsArea( enteringObject );
        }
    }

    Horses_areaOnEnter( enteringObject );
}

