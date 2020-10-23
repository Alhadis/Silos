//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Force the ox to stop.
*/
//:://////////////////////////////////////////////
//:: Created By: Rogers Pessin (Tigsen)
//:: Created On: August 4, 2002
//:://////////////////////////////////////////////

void main()
{
    // Clear all actions so the ox will just stand there.
    ClearAllActions();
    SetLocalInt(OBJECT_SELF,"RP_OX_STATUS",0);
}
