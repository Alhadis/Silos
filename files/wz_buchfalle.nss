void main()
{
// Get the creature who triggered this event.
    object oPC = GetEnteringObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Only fire once per PC.
    if ( GetLocalInt(oPC, "DO_ONCE__" + GetTag(OBJECT_SELF)) )
        return;
    SetLocalInt(oPC, "DO_ONCE__" + GetTag(OBJECT_SELF), TRUE);

object oBuch1=GetObjectByTag("wz_fliegendes_Buch_1");
object oBuch2=GetObjectByTag("wz_fliegendes_Buch_2");
ChangeToStandardFaction(oBuch1, STANDARD_FACTION_HOSTILE);
ChangeToStandardFaction(oBuch2, STANDARD_FACTION_HOSTILE);
location lBuch=GetLocation(GetWaypointByTag("wz_buch"));
CreateObject(OBJECT_TYPE_CREATURE, "zep_animtome2", lBuch, TRUE, "buch3");
CreateObject(OBJECT_TYPE_CREATURE, "zep_animtome3", lBuch, TRUE, "buch4");
CreateObject(OBJECT_TYPE_CREATURE, "zep_animtome4", lBuch, TRUE, "buch5");
CreateObject(OBJECT_TYPE_CREATURE, "zep_animtome5", lBuch, TRUE, "buch6");
CreateObject(OBJECT_TYPE_CREATURE, "zep_animtome1", lBuch, TRUE, "buch7");
CreateObject(OBJECT_TYPE_CREATURE, "zep_animtome5", lBuch, TRUE, "buch8");



}
