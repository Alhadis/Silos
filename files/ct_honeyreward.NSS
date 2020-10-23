void main()
{
object oPC = GetPCSpeaker();
int iReward = GetLocalInt(oPC, "honeyreward");
int iHoneyToTake = iReward * 2;
object oIt = GetFirstItemInInventory(oPC);
string sTag = GetTag(oIt);
string sTar = "ct_honeybottle";

if(sTag == sTar)
	{
		DestroyObject(oIt);
		iHoneyToTake--;
	}

while(GetIsObjectValid(oIt) && iHoneyToTake > 0)
	{
		oIt = GetNextItemInInventory(oPC);
		sTag = GetTag(oIt);
		if(sTag == sTar)
			{
				DestroyObject(oIt);
				iHoneyToTake--;
			}
	}

GiveGoldToCreature(oPC, 50 * iReward);
}