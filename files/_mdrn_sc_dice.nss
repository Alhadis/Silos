//::///////////////////////////////////////////////
//:: FileName _mdrn_sc_dice
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/2/2007 10:54:49 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    object oPC = GetPCSpeaker();
    object oLock = GetLocalObject(oPC, "oMdrnTarget");
    if (oPC != oLock)
    {
        return FALSE;
    }
    else
        return TRUE;
}
