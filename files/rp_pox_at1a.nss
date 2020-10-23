//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Count the number of packs on this ox and set
custom token 5001 to that number. Also set
custom token 5002 to whatever pack number the owner
last accessed (is nearest to).
*/
//:://////////////////////////////////////////////
//:: Created By: Rogers Pessin (Tigsen)
//:: Created On:August 4, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    // First step is to set custom token 5001, the number of packs left.

    // Sort through the pack positions and see if the ox is still carrying
    // that pack. If it is, count it, if not, need to shuffle the positions.
    int iNumPacks = GetLocalInt(OBJECT_SELF,"RP_PACK_COUNT");
    int iCount = 0;
    int iIndex;
    object oPack;
    object oLastPack;
    object oMyOwner = GetLocalObject(OBJECT_SELF,"RP_OWNER");
    string sPackPos;
    for(iIndex=1;iIndex<=iNumPacks;)
    {
        sPackPos = "RP_PACK_NUM_"+IntToString(iIndex);
        oPack = GetLocalObject(OBJECT_SELF,sPackPos);
        if (GetIsObjectValid(oPack) &&
        ((GetItemPossessor(oPack)==OBJECT_SELF) || (GetItemPossessor(oPack)==oMyOwner)))
        {
            // The pack is still valid and on the ox. Count it and increment
            // the index for this for loop.
            iCount++;
            iIndex++;
            if (GetItemPossessor(oPack)==oMyOwner) ActionTakeItem(oPack,oMyOwner);
        }
        else
        {
            // The pack isn't valid or isn't on the ox anymore:
            // Move the last pack location to this one, if this isn't already
            // the last position.
            if (iIndex!=iNumPacks)
            {
                oLastPack = GetLocalObject(OBJECT_SELF,"RP_PACK_NUM_"+IntToString(iNumPacks));
                SetLocalObject(OBJECT_SELF,sPackPos,oLastPack);
            }
            // Now delete the last pack, and reduce the expected number of
            // packs.
            // We do NOT increase the index, since we have to look at this
            // position again (since we're not checking to see if the last
            // pack that we move into this position is valid or not.
            // Reducing iNumPacks if this is already the last pack will
            // drop us out of the for loop.
            DeleteLocalObject(OBJECT_SELF,"RP_PACK_NUM_"+IntToString(iNumPacks));
            iNumPacks--;
        }
    }

    // Set custom token 5001 and local int.
    string sToken5001 = IntToString(iCount) + " pack";
    if (iCount!=1) sToken5001=sToken5001+"s";
    SetCustomToken(5001,sToken5001);
    SetLocalInt(OBJECT_SELF,"RP_PACK_COUNT",iCount);

    // Now figure out custom token 5002, the pack "nearest" to the owner.
    int iNearestPack = GetLocalInt(OBJECT_SELF,"RP_PACK_NEAREST");

    // Check if this is the first time we've done this or if the last
    // "nearest" pack was never returned to the pack ox.
    if ((iNearestPack<=0) || (iNearestPack>iCount))
    {
        iNearestPack=1;
        SetLocalInt(OBJECT_SELF,"RP_PACK_NEAREST",iNearestPack);
    }

    string sToken5002;
    switch (iNearestPack)
    {
        case 1: sToken5002="1st"; break;
        case 2: sToken5002="2nd"; break;
        case 3: sToken5002="3rd"; break;
        default: sToken5002=IntToString(iNearestPack) + "th"; break;
    }
    SetCustomToken(5002,sToken5002);
    return TRUE;
}
