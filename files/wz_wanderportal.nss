void main()
{
    object oTarget;
    int random;

    // Get the creature who triggered this event.
    object oPC = GetEnteringObject();
    object cache = GetNearestObject (OBJECT_TYPE_TRIGGER);

    int zeit = GetTimeMinute();
    int zeitalt = GetLocalInt(cache, "letzte_teleportation");

    if (zeit - zeitalt > 1){
        random = Random(3);
    }
    else{
        random = GetLocalInt(cache, "last_loc");
    }

    // Find the location to which to teleport.
    switch (random) {
        case 0: oTarget = GetWaypointByTag("wz_feuer");
           //     SendMessageToPC(oPC, "asdf0");
                break;
        case 1: oTarget = GetWaypointByTag("wz_wasser");
         //       SendMessageToPC(oPC, "adsf1");
                break;
        case 2: oTarget = GetWaypointByTag("wz_pelion");
           //     SendMessageToPC(oPC, "asdf2");
                break;
      }

    // Save the PC's current location for the next minute.
    SetLocalInt(cache, "last_loc", random);
    SetLocalInt(cache, "letzte_teleportation", zeit);

    // Teleport the PC.
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, JumpToObject(oTarget));
    ActionCastFakeSpellAtObject(SPELL_VIRTUE,oPC);
}

