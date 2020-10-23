// Combat Sense 1

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    if (GetLocalInt(oPC, "nCSense")==0)
    {
        SendMessageToPC(oPC, "Combat Sense target: "+GetName(oTarget));
       SetLocalInt(oPC, "nCSense", 1);
        DelayCommand(30.0, SetLocalInt(oPC, "nCSense", 0));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectACDecrease(2) , oTarget, 30.0);

    }
    else
        SendMessageToPC(oPC, "Combat sense target already chosen; you can only choose one target every 30 seconds.");



}
