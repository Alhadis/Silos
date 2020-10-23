// Creates a Magic Mouth type spell and effect.
// Thanks to bioware for the code, I just messed with it some.
// July 2003 - Arturum
// Check out Arturum's Bane PW Action to see this kind of need swag stuff in action.

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);


    object oWP = GetWaypointByTag("Q2B_WP_HEAD_SP");
    //Change tag of waypoint as needed above
    vector vPos = GetPosition(oWP);
    vPos.z += 2;
    //to raise the head, add more "z" (2 is default)...to lower subtract
    location lLoc = Location(GetArea(OBJECT_SELF), vPos, 270.0);
    //OK - facing -- you might have to mess with this, the 270 above is for this mod, I've
    //used several settings to get the head to face the direction needed.
    //its based on a 360 degree circle. So - mainly you will use 90,180,270 and 360 to
    //get the desired rotation of the head
    object oStone = CreateObject(OBJECT_TYPE_PLACEABLE, "q3c_stone_face", lLoc);
    effect eVis = EffectVisualEffect(VFX_FNF_IMPLOSION);
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oStone)));
    DelayCommand(1.0, AssignCommand(oStone, ActionSpeakString("Give of your life")));
    //Just edit the "fool" text to what you need...or turn back now, you fool!
    DelayCommand(5.0, DestroyObject(oStone));
    //longer delay then 5.0 might be needed to read the head also...play with it.





}
