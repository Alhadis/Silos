#include "inc_d20"
// Item identification system for D20 Modern.
void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetLocalObject(oPC, "oMdrnTarget");
    if (GetIsObjectValid(oItem)==FALSE)
    {
        oItem = GetNearestObjectToLocation(OBJECT_TYPE_PLACEABLE, GetLocalLocation(oPC, "lMdrnLocation"));
        if (GetDistanceBetweenLocations(GetLocation(oItem),GetLocalLocation(oPC, "lMdrnLocation"))>5.0)
            return;


    }
    location lLoc = GetLocation(oItem);
    float fZ = GetLocalFloat(GetModule(), "fMdrnHeight");
    float fFace = GetFacing(oItem);
    object oArea = GetArea(oItem);
    vector vPos = GetPositionFromLocation(lLoc);
    vector vNew = Vector(vPos.x, vPos.y, fZ);
    CreateObject(OBJECT_TYPE_PLACEABLE, GetResRef(oItem), Location(oArea, vNew, fFace));
    SetPlotFlag(oItem, FALSE);
    DestroyObject(oItem, 2.0);
}
