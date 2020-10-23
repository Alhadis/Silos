// D20 On Acquired event
// Current, just checks for skill bonus-related items.

void main()
{
    object oItem = GetModuleItemAcquired();
    object oPC = GetModuleItemAcquiredBy();

    int nBonus = GetLocalInt(oItem, "SkillBonus");

    if (nBonus > 0)

        ExecuteScript("_mdrn_exe_itsk", oItem);
            // PLOT WIZARD MANAGED CODE BEGINS
//    PWSetMinLocalIntAndJournalForItemAcquired("p000state", "p000", 2, "zombiehead", 250);
    // PLOT WIZARD MANAGED CODE ENDS
 // ExecuteScript("x2_mod_def_aqu",OBJECT_SELF); //Default Bioware
  ExecuteScript("fvex_mod_itemacq",OBJECT_SELF); // Fallen's Vampire System
  //ExecuteScript("wdm_mod_onaqu",OBJECT_SELF); //Dead and Wild Magic System
  ExecuteScript("as_pp", GetModule()); //Pickpocket fix

}



