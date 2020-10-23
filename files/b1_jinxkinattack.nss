void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC)) return;
    int i;
    int n = 8+d8();
    object oWP = GetWaypointByTag("WPJINX");
    for(i = 0; i < n; i++)
        CreateObject(OBJECT_TYPE_CREATURE,"jinxkin",GetLocation(oWP));
    DestroyObject(OBJECT_SELF);
}
