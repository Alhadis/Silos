// on_enter script for a trigger to cause a placeable with the same tag as the trigger
// to fire objects inside the trigger

#include "x0_i0_projtrap"

void main()
{
    object oPC = GetEnteringObject();
    object oGun = GetNearestObjectByTag(GetTag(OBJECT_SELF),OBJECT_SELF);
    int nCheck = 1;

    //look for a gun with the right tag in the right area
    while ((GetIsObjectValid(oGun)) && (GetArea(oGun)!=GetArea(OBJECT_SELF)))
    {
        nCheck++;
        oGun = GetNearestObjectByTag(GetTag(OBJECT_SELF),OBJECT_SELF,nCheck);
    }
    if ((GetArea(oGun)!=GetArea(OBJECT_SELF))||(!GetIsObjectValid(oGun)))
        return;

    //Found it so get number of targets it has, increment and store
    int nTargets = GetLocalInt(oGun,"Targets") + 1;
    SetLocalInt(oGun,"Targets",nTargets);

    // set entering object as potential target
    SetLocalInt(oPC,GetTag(oGun),1);
}
