// Main handler for unlocking doors from conversation menu.

#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    object oLock = GetLocalObject(oPC, "oMdrnTarget");
    location lTrap = GetLocalLocation(oPC, "lMdrnLocation");
    int nSkill;
    int nRoll;
    int nDC;


     if (GetIsObjectValid(oLock)==FALSE || GetDistanceToObject(oLock) > 3.3)
        {
            SendMessageToPC(oPC, "You must be within 10 feet of a target.");
            return;

        }




    nSkill = GetSkillRank(SKILL_DISABLE_DEVICE, oPC);
    nRoll = d20();
    nDC = GetLockUnlockDC(oLock);
    if (GetLocked(oLock)==TRUE)
    {
         AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 6.0));


         // It's a lock
          if (GetLockKeyRequired(oLock)==TRUE)
         {
            SendMessageToPC(oPC, "A specific key is required to open this lock.");
            return;
         }
         if (GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_lock"))==FALSE && GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)==FALSE)
            nSkill = nSkill - 4;
         SendMessageToPC(oPC, "Disable Device roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
         if (nSkill+nRoll+1>nDC)
         {
              SetLocked(oLock, FALSE);
              FloatingTextStringOnCreature("Unlocked.", oPC);

         }
         else
         {
               SendMessageToPC(oPC, "Unlock attempt failed.");
               return;
         }

    }
    else
    {
        // It's in need of locking.
         nDC = GetLockLockDC(oLock);
          if (GetLockLockable(oLock)==FALSE)
         {
            SendMessageToPC(oPC, "This cannot be locked.");
            return;
         }
         if (GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_lock"))==FALSE && GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)==FALSE)
            nSkill = nSkill - 4;
         SendMessageToPC(oPC, "Disable Device roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
         if (nSkill+nRoll+1>nDC)
         {
              SetLocked(oLock, TRUE);
              FloatingTextStringOnCreature("Locked.", oPC);

         }
         else
         {
               SendMessageToPC(oPC, "Lock attempt failed.");
               return;
         }

    }
}
