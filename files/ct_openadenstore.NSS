void main()
{
object oPC = GetPCSpeaker();
object oStore = GetNearestObjectByTag("ct_winecigstoren");
OpenStore(oStore, oPC);
}