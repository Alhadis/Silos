#include "location_tools"

void main()
{
    object enteringObject = GetEnteringObject();

    if (GetIsPC(enteringObject)) {
        AssignCommand(enteringObject, ClearAllActions(TRUE));
        object wpIlmater = GetWaypointByTag("inicio2");
        AssignCommand(enteringObject, Location_forcedJump(GetLocation(wpIlmater)));
    }
}
