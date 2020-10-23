//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Increment the count of the pack the owner will next
access (the "nearest" pack).
*/
//:://////////////////////////////////////////////
//:: Created By: Rogers Pessin (Tigsen)
//:: Created On:August 4, 2002
//:://////////////////////////////////////////////

void main()
{
    int iNearestPack = GetLocalInt(OBJECT_SELF,"RP_PACK_NEAREST");
    iNearestPack++;
    if (iNearestPack>GetLocalInt(OBJECT_SELF,"RP_PACK_COUNT")) iNearestPack = 1;
    SetLocalInt(OBJECT_SELF,"RP_PACK_NEAREST",iNearestPack);
}
