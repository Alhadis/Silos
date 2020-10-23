// Plan

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    if (GetFactionEqual(oPC, oTarget)==TRUE)
    {
        SendMessageToPC(oPC, "You cannot target someone in your party with Empathy.");
        return;

    }
    if (GetLocalInt(oPC, "nEmpathy") == 0)
    {
        SetLocalObject(oPC, "oEmpathyTarget", oTarget);
        DelayCommand(60.0, ExecuteScript("_mdrn_exe_empath", oPC));
        SetLocalInt(oPC, "nEmpathy", 1);
    }
    else
        FloatingTextStringOnCreature(GetName(oPC)+" is already getting to know a target; another cannot be started until the first is finished.", oPC);
}
