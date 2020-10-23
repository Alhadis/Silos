// React First

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;

    int nTest = 0;

    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oPC), TRUE);



    while( GetIsObjectValid(oTarget) )
    {
        if (GetIsPC(oTarget)==0)
            nTest = 1;
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oPC), TRUE);
    }
    if (nTest == 0)
    {
        SendMessageToPC(oPC, "NPC's must be within 20 meters for this to work.");
        return;

    }
    if (GetIsInCombat(oPC))
     {
        SendMessageToPC(oPC, "You must not be in combat for this to work.");
        return;

    }
    DelayCommand(36.0, ExecuteScript("_mdrn_exe_react", oPC));

}
