//::///////////////////////////////////////////////
//:: Summons a bed for the sleepover
//:: pri_slpover_inc
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: August 7, 2002
//:://////////////////////////////////////////////

void SummonBed(int iNumberOfBeds, object oPC)
{
    object oBedArea = GetNearestObjectByTag("priguestbed1", oPC);
    object oTrigger = GetNearestObjectByTag("SuiteAutoDoor", oPC);
    int iNGuests = GetLocalInt(oTrigger, "RSA_NGuests");

    int iBedsToMake = iNumberOfBeds;
    int iBedOn = 1;

    while (iBedsToMake > 0)
    {
        CreateObject(OBJECT_TYPE_PLACEABLE, "suitebed", GetLocation(oBedArea), TRUE);
        iBedsToMake--;
        iBedOn++;
        oBedArea = GetNearestObjectByTag("priguestbed"+IntToString(iBedOn),oPC);
    }

    iNGuests = iNGuests - iNumberOfBeds;
    SetLocalInt(oTrigger, "RSA_NGuests", iNGuests);
}
