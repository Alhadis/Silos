void main()
{
 object oPC = GetEnteringObject();
 object oItem = GetFirstItemInInventory(oPC);
 while (GetIsObjectValid(oItem))
       {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
       }
}
