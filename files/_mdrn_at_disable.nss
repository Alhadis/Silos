// Main handler for disarming traps

#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    object oLock = GetLocalObject(oPC, "oMdrnTarget");
    location lTrap = GetLocalLocation(oPC, "lMdrnLocation");
    int nSkill;
    int nRoll;
    int nDC;





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

    nSkill = GetSkillRank(SKILL_DISABLE_DEVICE, oPC) - 4*(!(GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_disable"))||GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)));
    int nType = GetTrapBaseType(oLock);
    if (nType==TRAP_BASE_TYPE_AVERAGE_FIRE || nType == TRAP_BASE_TYPE_DEADLY_FIRE  || nType==TRAP_BASE_TYPE_MINOR_FIRE || nType == TRAP_BASE_TYPE_STRONG_FIRE  || nType == TRAP_BASE_TYPE_EPIC_FIRE)
        nSkill = GetSkillRank(SKILL_DEMOLITIONS, oPC) - 4*(!(GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_demo"))||GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)));
    nRoll = d20();
    nDC = GetTrapDisarmDC(oLock);
    if (GetIsTrapped(oLock) && GetTrapDetectedBy(oLock, oPC))
    {
         // It's a valid trap
         AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 6.0));
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
               SendMessageToPC(oPC, "Failure by more than 5 points; trap may be triggered.");
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
    else
     {
        SendMessageToPC(oPC, "You must target a detected trap.");
        return;
     }

}
