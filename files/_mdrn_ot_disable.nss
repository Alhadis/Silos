// Main Disable Device handler for unlocking doors and disarming traps

#include "inc_d20"

void main()
{
    object oPC = GetItemActivator();
    object oLock = GetItemActivatedTarget();
    location lTrap = GetItemActivatedTargetLocation();
    int nSkill;
    int nRoll;
    int nDC;


    if (GetObjectType(oLock)==OBJECT_TYPE_CREATURE)
    {
        // They're trying to pick pockets.
        if (GetDistanceBetween(oPC, oLock)>3.3)
        {
            SendMessageToPC(oPC, "You must be within 10 feet of a victim.");
            return;

        }


       nSkill = GetSkillRank(SKILL_SLEIGHT_OF_HAND, oPC);
        int nHand = GetLocalInt(oLock, "nMdrnHandTarget");
        nDC = 20+10*nHand;
        nHand ++;
        SetLocalInt(oLock, "nMdrnHandTarget", nHand);
        DelayCommand(3600.0, SetLocalInt(oLock, "nMdrnHandTarget", 0));

        nRoll = d20();
        SendMessageToPC(oPC, "Pick pocket attempt: "+IntToString(nSkill+nRoll)+" vs DC: "+IntToString(nDC));
        if (nRoll+nSkill+1>nDC)
        {
              // Success
              object oItem = GetFirstItemInInventory(oLock);
              int nDone = 0;
              while (GetIsObjectValid(oItem) && nDone == 0)
              {
                if (GetPickpocketableFlag(oLock)==TRUE)
                {
                       nDone = 1;
                       CopyItem(oItem, oPC, TRUE);
                       DestroyObject(oItem);

                }
                oItem = GetNextItemInInventory(oLock);
              }

        }

        int nSpot = GetSkillRank(SKILL_SPOT, oLock);
        if (d20()+nSpot+1>nRoll+nSkill)
        {
            // Spotted
            SendMessageToPC(oLock, GetName(oPC)+" has tried to pickpocket you.");
            AdjustReputation(oPC, oLock, -20);
        }
        return;


    }


    if (GetIsObjectValid(oLock)==FALSE)                  // Need to find the nearest trap
    {
        object oTarget = GetNearestObjectToLocation(OBJECT_TYPE_ALL, lTrap);
        oLock = GetNearestTrapToObject(oTarget, TRUE);
        if (GetIsObjectValid(oLock)==FALSE || GetDistanceToObject(oLock) > 3.3)
        {
            SendMessageToPC(oPC, "You must be within 10 feet of a target.");
            return;

        }
    }

    nSkill = GetSkillRank(SKILL_DISABLE_DEVICE, oPC);
    nRoll = d20();
    nDC = GetLockUnlockDC(oLock);
    if (GetIsTrapped(oLock) && GetTrapDetectedBy(oLock, oPC))
    {
         // It's a trap

         if (GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_trap"))==FALSE && GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)==FALSE)
            nSkill = nSkill - 4;
         if (GetTrapDisarmable(oLock)==FALSE)
         {
            SendMessageToPC(oPC, "The trap cannot be disarmed.");
            return;
         }
         nDC = GetTrapDisarmDC(oLock);
         SendMessageToPC(oPC, "Disable Device roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
         if (nSkill+nRoll+1>nDC)
         {
              SetTrapDisabled(oLock);
              SendMessageToPC(oPC, "Trap disarmed.");

         }
         else if (nSkill + nRoll + 5 > nDC)
         {
               SendMessageToPC(oPC, "Attempt failed.");
               return;

         }
         else
         {
               ClearAllActions();
               if (GetObjectType(oLock)==OBJECT_TYPE_TRIGGER)
               {
                    ActionForceMoveToLocation(GetLocation(oLock));
               }

               else
               {
                    if (GetObjectType(oLock)==OBJECT_TYPE_DOOR)
                       ActionOpenDoor(oLock);
                    else
                       ActionInteractObject(oLock);
               }
               DelayCommand(0.1, SetCommandable(FALSE, oPC));
               DelayCommand(3.0, SetCommandable(TRUE, oPC));
         }

    }
    else if (GetLocked(oLock)==TRUE)
    {
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
              SendMessageToPC(oPC, "Unlocked.");

         }
         else
         {
               SendMessageToPC(oPC, "Unlock attempt failed.");
               return;
         }

    }
    else
        SendMessageToPC(oPC, "Not a valid trapped or locked target.");
}
