#include "inc_d20"
void main()
{
    object oPC = GetPCSpeaker();
    int nWealth = 3;
    if (GetHasFeat(FEAT_ADVENTURER, oPC))
        nWealth = nWealth -2;
    if (GetHasFeat(FEAT_ATHLETE, oPC))
        nWealth = nWealth -2;
     if (GetHasFeat(FEAT_BLUECOLLAR, oPC))
        nWealth = nWealth -1;
     if (GetHasFeat(FEAT_CREATIVE, oPC))
        nWealth = nWealth -1;
     if (GetHasFeat(FEAT_CELEBRITY, oPC))
        nWealth = nWealth +1;
     if (GetHasFeat(FEAT_CRIMINAL, oPC))
        nWealth = nWealth -2;
     if (GetHasFeat(FEAT_DILETTANTE, oPC))
        nWealth = nWealth +3;
     if (GetHasFeat(FEAT_DILETTANTE, oPC))
        nWealth = nWealth +3;
     if (GetHasFeat(FEAT_DOCTOR, oPC))
        nWealth = nWealth +1;
     if (GetHasFeat(FEAT_EMERGENCYSERVICES, oPC))
        nWealth = nWealth -1;
     if (GetHasFeat(FEAT_ENTREPRENEUR, oPC))
        nWealth = nWealth +1;
     if (GetHasFeat(FEAT_ENTREPRENEUR, oPC))
        nWealth = nWealth +1;
     if (GetHasFeat(FEAT_INVESTIGATIVE, oPC))
        nWealth = nWealth -1;
     if (GetHasFeat(FEAT_LAWENFORCEMENT, oPC))
        nWealth = nWealth -2;
     if (GetHasFeat(FEAT_MILITARY, oPC))
        nWealth = nWealth -2;
     if (GetHasFeat(FEAT_RELIGIOUS, oPC))
        nWealth = nWealth -1;
     if (GetHasFeat(FEAT_RURAL, oPC))
        nWealth = nWealth -2;
     if (GetHasFeat(FEAT_STUDENT, oPC))
        nWealth = nWealth -2;

     CreateItemOnObject("wealth", oPC, nWealth);
     SetLocalInt(oPC, "nMdrnOccuSet", 0);
     }
