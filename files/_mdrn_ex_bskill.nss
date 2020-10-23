void main()
{
    object oPC = GetExitingObject();
    effect eEff = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEff))
    {
        if (GetEffectCreator(eEff)==OBJECT_SELF)
            RemoveEffect(oPC, eEff);

        eEff = GetNextEffect(oPC);
    }
}
