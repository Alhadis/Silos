void main()
{
object oPC = GetPCSpeaker();
object oStore = GetObjectByTag("ct_horsearmorstore");

OpenStore(oStore, oPC);
}