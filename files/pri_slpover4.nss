//::///////////////////////////////////////////////
//:: Summons a bed for the sleepover
//:: pri_slpover4
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: August 7, 2002
//:://////////////////////////////////////////////

#include "pri_slpover_inc"
#include "pri_inc"

void main()
{
    object oPC = GetPCSpeaker();

    SummonBed(4, oPC);
    GetInnArea(oPC);

    string sButler = GetLocalString(oPC, "RSA_Butler");
    string sButSlpOver = GetLocalString(oPC, "RSA_ButSlpOver");

    object oButler = GetObjectByTag(sButler);
    AssignCommand(oButler, ClearAllActions());
    AssignCommand(oButler, ActionSpeakString(sButSlpOver));
    SetLocalInt(oButler, "RSA_HadSleepOver", 1);
}
