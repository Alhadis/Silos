// This main On Client Enter d20 Modern.  It processes D20 feats and skills,
// strips equipment from characters with zero XP, and provides those characters with starting equipment and 1 XP.
// Be sure to include all the material below if you add to your module's script.

#include "inc_d20"
#include "_mdrn_inc_acont"
#include "subdual_inc"
#include "mvd_02_init"

void main()
{
    MvD_02_PlayerEnter();  //LRES Roleplay Experience
    ExecuteScript("fvex_mod_clntent",OBJECT_SELF); // Fallen's Vampire System
    ExecuteScript("replace_vampires",OBJECT_SELF); //     REplacement of Vampire disciplines
    ExecuteScript("sf_cl_enter",OBJECT_SELF);

    object oPC = GetEnteringObject();

    if(GetIsPC(oPC) && !(GetXP(oPC)) && !GetIsDM(oPC))      // character with zero xp
    {
        // If a Mage or Acolyte, boot them.
        if (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC)>0 || GetLevelByClass(CLASS_TYPE_MAGE, oPC)>0)
        {
            SendMessageToPC(oPC, "No Mages or Acolytes at first level; these are Advanced classes only.");
            DelayCommand(10.0, BootPC(oPC));
        }
        // Starting cash
        AssignCommand(oPC, TakeGoldFromCreature(GetGold(oPC), oPC, TRUE));
        AssignCommand(oPC, DelayCommand(2.0, GiveGoldToCreature(oPC, 1500)));
        // Start Supers section
        int nPoint = 12;
        CreateItemOnObject("_super_point", oPC, nPoint);
        // End Supers section

        /// Provide starting widgets.
        CreateItemOnObject("dmfi_pc_dicebag", oPC);
        CreateItemOnObject("dmfi_pc_follow", oPC);
        // Allow PC to change alignment, head and choose occupation.
        DelayCommand(3.0, AssignCommand(oPC, ActionStartConversation(oPC, "_mdrn_conv_align", TRUE, FALSE)));
        int nNewAP = 2*(6+GetHitDice(oPC)/2);   // Two times due to increased combat frequency of NWN over tabletop
        CreateItemOnObject("actionpoint", oPC, nNewAP);
        int nNewWealth = d4(2)+(GetSkillRank(SKILL_PROFESSION, oPC)>0);
        CreateItemOnObject("wealth", oPC, nNewWealth);
        SetXP(oPC, 1);       // make sure this doesn't happen again
    }
    // Check for PC's who made characters locally and provided to a server host - kick if they have a new Mage or Acolyte.
    if (GetIsPC(oPC) && GetXP(oPC)==1 && GetIsDM(oPC)==FALSE)
    {
        if (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC)>0 || GetLevelByClass(CLASS_TYPE_MAGE, oPC)>0)
        {
            SendMessageToPC(oPC, "No Mages or Acolytes at first level; these are Advanced classes only.");
            DelayCommand(10.0, BootPC(oPC));
        }
    }

    //set up class & feat bonuses
    ExecuteScript("d20_setbonuses",oPC);

     if(!GetIsObjectValid(GetItemPossessedBy(GetEnteringObject(),"SubdualModeTog")))
       CreateItemOnObject("subdualmodetog",GetEnteringObject());
     if(!GetIsObjectValid(GetItemPossessedBy(GetEnteringObject(),"rp_ce_marker")))
       CreateItemOnObject("rp_ce_marker",GetEnteringObject());
     if(!GetIsObjectValid(GetItemPossessedBy(GetEnteringObject(),"mr_emote_wand")))
       CreateItemOnObject("mr_emote_wand",GetEnteringObject());
}
