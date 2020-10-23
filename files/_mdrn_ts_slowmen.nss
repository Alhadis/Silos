//script to apply a slow effect (to PCs only) on entering a "slow" trigger
//exit and enter messages can be placed on trigger

void main()
{
    object oPC = GetEnteringObject();

    if (!GetIsPC(oPC)||GetIsDM(oPC)) return;
    // Apply the effect
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSlow(), oPC);
    if (GetLocalString(OBJECT_SELF,"Message")!="")
        FloatingTextStringOnCreature(GetLocalString(OBJECT_SELF,"Message"),oPC,FALSE);
}
