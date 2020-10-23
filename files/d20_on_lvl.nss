// This is the D20 Modern On Level Up Event script.  It processes changes in the
// D20 Modern feats.  Be sure to include all this if adding to your own script.

#include "inc_d20"

void main()
{
    ExecuteScript("fvex_mod_levelup",OBJECT_SELF); // Fallen's Vampire System
    ExecuteScript("ks_pointlvlup",OBJECT_SELF);//Knightstar's Point System
    ExecuteScript("sf_pclvlup",OBJECT_SELF);//Knightstar's Point System

    object oPC = GetPCLevellingUp();

    //reset feat and class bonuses
    ExecuteScript("d20_setbonuses",oPC);

    //allocate action points
    int nNewAP = 2*(6+GetHitDice(oPC)/2); // Two times due to increased combat frequency of NWN over tabletop
    CreateItemOnObject("actionpoint", oPC, nNewAP);

    //allocate wealth
    if (GetLocalInt(GetModule(), "nUseModernWealth")==1)
    {
        int nWealth = GetLocalInt(oPC, "nWealth");               //get current wealth bonus of PC
        int nDC = 0;
        object oWealth = GetFirstItemInInventory(oPC);           //find the wealth the PC currently has and use as the DC
        while (GetIsObjectValid(oWealth))
        {
            if (GetTag(oWealth)=="wealth")
            nDC = nDC + GetItemStackSize(oWealth);
            oWealth = GetNextItemInInventory(oPC);
        }
        int nCheck = d20()+GetSkillRank(SKILL_PROFESSION, oPC);  //do a profession roll
        if (nCheck + 1 > nDC)
        {
            nWealth ++;          // Gain at least 1 wealth
            nWealth = nWealth + (nCheck - nDC)/5;   // Gain additional wealth according to the success of the check
        }
        CreateItemOnObject("wealth", oPC, nWealth);
    }

    // Begin superpowers section
    int nPoint = 3;
    object oEnhance = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oEnhance))
    {
        if (GetTag(oEnhance)=="_super_power")
            ExecuteScript("_super_enhance", oEnhance);
        oEnhance = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("_super_point", oPC, nPoint);
    object oHench = CreateObject(OBJECT_TYPE_PLACEABLE, "_super_supply", GetLocation(oPC));
    AssignCommand(oPC, ActionInteractObject(oHench));
    DelayCommand(1.0, SetUseableFlag(oHench, FALSE));
    if (GetIsObjectValid(oHench)==TRUE)
        SendMessageToPC(oPC, "A container of Super Powers has been created for you - don't move; select your powers and only move when you're DONE (that will close the container for you.");
    // End Superpowers section
}
