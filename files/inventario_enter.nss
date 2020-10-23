void main()
{
    object objetoEntrante = GetEnteringObject();
    location locationIlmater = GetLocation(GetWaypointByTag("inicio2"));

    if (GetIsPC(objetoEntrante)) {
        AssignCommand(objetoEntrante, ClearAllActions());
        AssignCommand(objetoEntrante, ActionJumpToLocation(locationIlmater));
    }
}
