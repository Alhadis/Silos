
void main()
{
    object oPC = GetExitingObject();
    SetPlotFlag(oPC, FALSE);
    SetFootstepType(FOOTSTEP_TYPE_DEFAULT, oPC);
    effect eRem = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRem))
    {
        if (GetEffectCreator(eRem)==OBJECT_SELF)
            RemoveEffect(oPC, eRem);

        eRem = GetNextEffect(oPC);
    }
}
