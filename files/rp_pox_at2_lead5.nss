//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Force the ox to follow the owner at 5 feet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rogers Pessin (Tigsen)
//:: Created On: August 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oSpeaker = GetPCSpeaker();
    if (oSpeaker!=OBJECT_INVALID)
    {
        // Force the pack ox to follow the speaker/controller at 5 feet.
        ActionForceFollowObject(oSpeaker,FeetToMeters(5.0));
        SetLocalInt(OBJECT_SELF,"RP_OX_STATUS",5);
    }
}
