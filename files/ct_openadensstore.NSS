void main()
{
object oPC = GetPCSpeaker();
object oStore = GetNearestObjectByTag("ct_winecigstores");
TakeGoldFromCreature(50, oPC, TRUE);
OpenStore(oStore, oPC);
}