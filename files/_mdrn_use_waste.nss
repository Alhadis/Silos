/*
    place in close event for a waste container
*/
void main()
{
    // destroy items in container's inventory
    object oItem =  GetFirstItemInInventory(OBJECT_SELF);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_S);

    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem =  GetNextItemInInventory(OBJECT_SELF);
    }
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF));
}
