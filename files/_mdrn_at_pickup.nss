/*
    When placeable is used gives the PC an equivalent item as if it were picked up.
    Resref of item to be the same as the tag of the placeable
*/

void main()
{
    string sItem = GetTag(OBJECT_SELF);
    object oPC = GetLastUsedBy();
    CreateItemOnObject(sItem,oPC);
    DestroyObject(OBJECT_SELF, 5.0);
}
