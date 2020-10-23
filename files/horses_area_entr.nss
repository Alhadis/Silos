#include "Horses_props_inc"
#include "rdo_spinc"

void main()
{
    object enteringObject = GetEnteringObject();

    if (GetIsRidableHorse(enteringObject)) {
        RDO_RemoveEffectsByCreator( enteringObject, GetWaypointByTag(Horses_DAYCARE_WP) );
        SetPlotFlag(enteringObject, TRUE);
    }
}
