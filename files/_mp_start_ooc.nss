#include "d0_functions_inc"
void main()
{
    object   oPC  = GetEnteringObject();
    location lPCLoc = DeathGetDeathAreaLocation(oPC); // Sollte die Datenbank position des Spielers nicht den Todeswelten gleichen, Position löschen.

    if(GetAreaFromLocation(lPCLoc) != GetAreaFromLocation(GetLocation(GetWaypointByTag("respawn_b"))) &&
       GetAreaFromLocation(lPCLoc) != GetAreaFromLocation(GetLocation(GetWaypointByTag("respawn_n"))) &&
       GetAreaFromLocation(lPCLoc) != GetAreaFromLocation(GetLocation(GetWaypointByTag("respawn_g"))))
    {
        DeathDeleteDeathAreaLocation(oPC);
    }
    else
    {
        DelayCommand(4.0, AssignCommand(oPC, JumpToLocation(lPCLoc)));
    }

    //OOC-Anpassungsgespräch
    if(GetIsPC(oPC) && !GetIsDM(oPC) && GetXP(oPC) == 0)
    DelayCommand(4.0, AssignCommand(oPC, ActionStartConversation(oPC, "sf_willkommen", TRUE, FALSE)));

    ExecuteScript("baum_onuse", OBJECT_SELF);
}
