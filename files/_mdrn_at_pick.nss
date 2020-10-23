// Main handler for picking pockets.

#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    object oLock = GetLocalObject(oPC, "oMdrnTarget");
    location lTrap = GetLocalLocation(oPC, "lMdrnLocation");
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
        if (oLock==oPC)
        {
            SendMessageToPC(oPC, "You cannot target yourself.");
            return;

        }


       nSkill = GetSkillRank(SKILL_SLEIGHT_OF_HAND, oPC);
       // Make it more difficult to keep picking something's pockets.
       int nHand = GetLocalInt(oLock, "nMdrnHandTarget");
        nDC = 20+10*nHand;

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
                if (GetPickpocketableFlag(oItem)==TRUE)
                {
                       nDone = 1;
                       CopyItem(oItem, oPC, TRUE);
                       DestroyObject(oItem);

                }
                oItem = GetNextItemInInventory(oLock);
              }

        }
        else
        {
            nHand ++;
            SendMessageToPC(oPC, "Failed.");
            SetLocalInt(oLock, "nMdrnHandTarget", nHand);

        }

        int nSpot = GetSkillRank(SKILL_SPOT, oLock);
        if (d20()+nSpot+1>nRoll+nSkill)
        {
            // Spotted
            SendMessageToPC(oLock, GetName(oPC)+" has tried to pickpocket you.");
            AdjustReputation(oPC, oLock, -20);
        }



    }
    else
     {
            SendMessageToPC(oPC, "You must target a creature with pick pockets.");
            return;

        }



}
