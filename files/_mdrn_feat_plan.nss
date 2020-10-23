// Plan

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    if (GetLocalInt(oPC, "nPlan") == 0)
    {
        DelayCommand(60.0, ExecuteScript("_mdrn_exe_plan", oPC));
        SetLocalInt(oPC, "nPlan", 1);
    }
    else
        FloatingTextStringOnCreature(GetName(oPC)+" is already developing a plan; another cannot be started until the first is ready.", oPC);
}
