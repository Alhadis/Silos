//::///////////////////////////////////////////////
//:: Name darklamp_used
//:: FileName darklamp_used
//:: Copyright (c) 2002 Adam Forster
//:://////////////////////////////////////////////
/*
This is the OnUsed script for the Dark Lamp
placable to toggle the lamp on/off when used.
*/
//:://////////////////////////////////////////////
//:: Created By: Adam Forster
//:: Created On: 12/01/02
//:://////////////////////////////////////////////


void main()
{

    if (GetLocalInt(OBJECT_SELF, "LAMP_ACTIVE"))
    {
        SetLocalInt(OBJECT_SELF, "LAMP_ACTIVE", FALSE);
        SetPlaceableIllumination(OBJECT_SELF, FALSE);
        RecomputeStaticLighting(GetArea(OBJECT_SELF));

    }
    else
    {
        SetLocalInt(OBJECT_SELF, "LAMP_ACTIVE", TRUE);
        SetPlaceableIllumination(OBJECT_SELF, TRUE);
        RecomputeStaticLighting(GetArea(OBJECT_SELF));
    }
}
