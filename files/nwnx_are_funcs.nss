// Pops up an examine window on player with the description of placable.
void ForcePlacableExamineWindow(object player, object placeable);

// Set object position to the provided vector.
void SetObjectPosition(object obj, vector pos);

void ForcePlacableExamineWindow(object player, object placeable)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_FUNCS!FORCE_PLACABLE_EXAMINE_WINDOW",
        ObjectToString(player) + " " + ObjectToString(placeable));
}

void SetObjectPosition(object obj, vector pos)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_FUNCS!SET_OBJECT_POSITION",
        ObjectToString(obj) + " " +
        FloatToString(pos.x) + " " +
        FloatToString(pos.y) + " " +
        FloatToString(pos.z));
}