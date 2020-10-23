////////////////////////////////////////////////////////////////////////////////
// On Client Enter script //////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//#include "tlj_inc_force"
#include "inc_d20"
#include "_mdrn_inc_acont"
#include "nwnx_creature"

void main() {
    object oPC = GetEnteringObject();
    string sPCName = GetName(oPC);

    // This starts up the fatigue recovery for force users
   // AssignCommand(oPC, InnitiateForceRecovery());

    // Start the PC items script
    ExecuteScript("wod_pc_items", oPC);
    // Start the PC properties script
    DelayCommand(1.0, ExecuteScript("wod_pc_props", oPC));


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
        AssignCommand(oPC, DelayCommand(2.0, GiveGoldToCreature(oPC, 50)));
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
    NWNX_Creature_AddFeat(oPC, 2581);
    NWNX_Creature_AddFeat(oPC, 2582);
}
