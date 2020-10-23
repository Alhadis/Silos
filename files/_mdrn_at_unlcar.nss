#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    object oCar = GetLocalObject(oPC, "oMdrnTarget");
    int nSkill = GetSkillRank(SKILL_DISABLE_DEVICE, oPC);
    int nRoll = d20();
    int nDC = GetLocalInt(oCar, "LOCKDC");
    if (nDC == 0)
        nDC = 15;
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_lock"))==FALSE && GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)==FALSE)
            nSkill = nSkill - 4;
         SendMessageToPC(oPC, "Disable Device roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
         if (nSkill+nRoll+1>nDC)
         {
              SetLocalInt(oCar, "nMdrnUnlocked", 1);
              FloatingTextStringOnCreature("Unlocked.", oPC);

         }
         else
         {
               SendMessageToPC(oPC, "Unlock attempt failed.");
               return;
         }
}
