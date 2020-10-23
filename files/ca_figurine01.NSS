#include "ct_includes"

void DestroyHorse(object oTar)
{
DespawnRosterMember(GetTag(oTar));
}

void UnsummonHorse(object oTar, object oPC)
{
object oIt = GetFirstItemInInventory(oTar);

EmptyInventoryandReturn(oTar, oPC);
DelayCommand(0.5, DestroyHorse(oTar));
}

void main()
{
object oPC = GetItemActivator();
object oIt = GetItemActivated();
location lLoc;
object oTar = GetItemActivatedTarget();
effect eEffect = EffectSummonCreature("ca_hcat01", VFX_FNF_SUMMON_MONSTER_1);
object oKitty;
string sCat = GetLocalString(oIt, "tag");

if(oTar == oPC && GetLocalInt(oIt, "cat") == 0)
	{
		oKitty = CreateObject(OBJECT_TYPE_CREATURE, "ca_hcat01", lLoc, FALSE, GetFirstName(oPC) + "heavyhorse");
		AddNPCToParty(oKitty, oPC);
		SetLocalObject(oIt, "cat", oKitty);
		SetLocalInt(oIt, "cat", 1);
		SetLocalString(oIt, "tag", GetTag(oKitty));
		SetLocalObject(oKitty, "owner", oPC);
	}

else if(oTar == oPC && GetLocalInt(oIt, "cat") == 2)
	{
		AddRosterMemberToParty(sCat, oPC);
		SetLocalObject(oIt, "cat", oKitty);
		SetLocalInt(oIt, "cat", 1);
	}
	
else if(GetTag(oTar) == GetFirstName(oPC) + "heavyhorse" && GetLocalInt(oIt, "horse") == 1)
	{
		UnsummonHorse(oTar, oPC);
		SetLocalInt(oIt, "cat", 2);
	}
	
else if(oTar == oIt)
	SetLocalInt(oIt, "cat", 0);
}