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
location lLoc = GetItemActivatedTargetLocation();
object oTar = GetItemActivatedTarget();
object oIt = GetItemActivated();
object oHorse;
string sHorse = GetLocalString(oIt, "tag");
string sName;

if(oTar == oPC && GetLocalInt(oIt, "horse") == 0)
	{
		oHorse = CreateObject(OBJECT_TYPE_CREATURE, "ct_heavyhorse", lLoc, FALSE, GetFirstName(oPC) + "heavyhorse");
		AddNPCToParty(oHorse, oPC);
		SetLocalObject(oIt, "horse", oHorse);
		SetLocalInt(oIt, "horse", 1);
		SetLocalString(oIt, "tag", GetTag(oHorse));
		sName = GetFirstName(oHorse);
		SetFirstName(oHorse, GetFirstName(oPC) + "'s Heavy Pack Horse");
		SetLocalObject(oHorse, "owner", oPC);
	}

else if(oTar == oPC && GetLocalInt(oIt, "horse") == 2)
	{
		AddRosterMemberToParty(sHorse, oPC);
		SetLocalObject(oIt, "horse", oHorse);
		SetLocalInt(oIt, "horse", 1);
	}
	
else if(GetTag(oTar) == GetFirstName(oPC) + "heavyhorse" && GetLocalInt(oIt, "horse") == 1)
	{
		UnsummonHorse(oTar, oPC);
		SetLocalInt(oIt, "horse", 2);
	}
else if(oTar == oIt)
	SetLocalInt(oIt, "horse", 0);
}