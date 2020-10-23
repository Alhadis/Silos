// React First

void main()
{
    object oPC = OBJECT_SELF;
    if (GetIsInCombat(oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectHaste(), oPC, 6.0);
        FloatingTextStringOnCreature(GetName(oPC)+" is able to react first in the fight.", oPC);
    }
    else
    {
        SendMessageToPC(oPC, "You weren't in combat 6 rounds after you activated React First, so you received no bonus.");
    }


}
