void main()
{
    if (GetEnteringObject() != GetFirstPC())
    {
        return;
    }

    int i = 1;
    for (i = 1; i <= 6; ++i)
    {
        string tag = "e1_at_spawn_z" + IntToString(i);
        object spawnPoint = GetNearestObjectByTag(tag);
        CreateObject(OBJECT_TYPE_CREATURE, "zombie002", GetLocation(spawnPoint));
        CreateObject(OBJECT_TYPE_CREATURE, "zombie002", GetLocation(spawnPoint));
    }

    DestroyObject(OBJECT_SELF);
}
