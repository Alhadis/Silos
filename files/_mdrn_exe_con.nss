// Executable script for handling massive damage - check if damage greater than Con.
void main()
{
    object oTarg = GetLocalObject(OBJECT_SELF, "oMdrnConTarg"); // Get target.
    int nDam = GetLocalInt(oTarg, "nMdrnConDam");
    // Note that Damage Threshold feat provides a bonus here.
    int iConScore = GetAbilityScore(oTarg, ABILITY_CONSTITUTION) + 3*GetHasFeat(2325, oTarg);

    if(iConScore<nDam)
    {
        int nSave = FortitudeSave(oTarg, 15);
        //SpeakString("Fortitude Save for Massive Damage: "+IntToString(nSave)+" vs. DC 15.");
        if (nSave==0)
        {
            AssignCommand(oTarg, SpeakString(GetName(oTarg)+" is down and dying from massive damage."));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetCurrentHitPoints(oTarg)),oTarg);
        }
    }
}
