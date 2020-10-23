void main()
{
object oPC = GetPCSpeaker();
object oIt = GetItemPossessedBy(oPC, "ct_wandfact");
object oTar = GetLocalObject(oIt, "target");

FeatAdd(oTar, FEAT_EPITHET_SHADOWTHIEFAMN, FALSE);
}