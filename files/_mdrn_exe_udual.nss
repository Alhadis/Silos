void main()
{
    object oPC = GetLocalObject(OBJECT_SELF, "oPC");
    effect eDual = GetFirstEffect(oPC);
        while (GetIsEffectValid(eDual))
        {
            if (GetEffectCreator(eDual)==OBJECT_SELF)
                RemoveEffect(oPC, eDual);
            eDual = GetNextEffect(oPC);
        }
}
