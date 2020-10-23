void main()
{

 object oPC = GetEnteringObject();

 if (!GetIsPC(oPC)) return;

 int DoOnce = GetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF));

 if (DoOnce==TRUE) return;

 SetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF), TRUE);

 SendMessageToPC(oPC, "The sewer passage ends in a tumble of ruin, completely choking the passageway. An old tun rests upside down at the end of the ledge. Waterdrops striking it from above is whats causing the drumlike sounds resounding throughout the sewers.");

}
