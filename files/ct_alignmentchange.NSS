void main(int iAlign, int iChange)
{
object oPC = GetPCSpeaker();
object oIt = GetItemPossessedBy(oPC, "ct_wandalch");
object oTarget = GetLocalObject(oIt, "target");

AdjustAlignment(oTarget, iAlign, iChange);
}