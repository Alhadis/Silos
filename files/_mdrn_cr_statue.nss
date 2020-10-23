/*
    Prevent animations and make creature uncontrollable for the purposes of appearing as a statue.
*/

void Main()
{
    object oPC = OBJECT_SELF;
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);
    SetCommandable(FALSE, oPC);
}
