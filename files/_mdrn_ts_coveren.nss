//script to apply a concealment effect on entering a "cover" trigger
//Variable Percentage required on trigger

void main()
{
    object oPC = GetEnteringObject();
    int nAmount = GetLocalInt(OBJECT_SELF,"Percentage");
    effect eConceal = EffectConcealment(nAmount);

    // Apply the effect
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConceal, oPC);
    FloatingTextStringOnCreature("Entering "+IntToString(nAmount)+"% cover",oPC,FALSE);
}
