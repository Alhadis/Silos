// D20 On UnAcquired event
// Current, just checks for skill bonus-related items.

void main()
{

    ExecuteScript("fvex_mod_itemdrp",OBJECT_SELF); // Fallen's Vampires

    ExecuteScript("x2_mod_def_unaqu",OBJECT_SELF); // Default Bioware

    object oItem = GetModuleItemLost();
    object oPC = GetModuleItemLostBy();

    SetLocalInt(oPC, "nMdrnEquip"+GetTag(oItem), 0);
    effect eRem = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRem))
    {
       if (GetEffectCreator(eRem)==oItem)
            RemoveEffect(oPC, eRem);

        eRem = GetNextEffect(oPC);
    }


}
