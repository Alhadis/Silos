void main()
{
     object oStore = OBJECT_SELF;
     object oThing = GetFirstItemInInventory(oStore);
        while (GetIsObjectValid(oThing))
        {
               SetPlotFlag(oThing, FALSE);
               DestroyObject(oThing);
               oThing=GetNextItemInInventory(oStore);
         }
         SetPlotFlag(oStore, FALSE);
         DestroyObject(oStore);
}
