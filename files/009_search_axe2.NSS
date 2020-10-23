
// Put this script OnEnter.


void main()
{
    object oTarget;
    object oSpawn;

    // Get the creature who triggered this event.
    object oPC = GetEnteringObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Abort if a skill check (search) is failed.
    if ( d20() + GetSkillRank(SKILL_SEARCH, oPC) < 20 )
        return;

    // Spawn "plc_gaxe_secretd".
    oTarget = GetNearestObjectByTag("WP_greataxe2");
    oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_gaxe_secretdr_trg2", GetLocation(oTarget));

    // Have us say something.
    SpeakString("*you discover the axe will turn, which reveals a small alcove with a ladder down");
}