#include "ct_includes"

void main()
{
object oPC = OBJECT_SELF;
object oOwn = GetLocalObject(oPC, "owner");
string sRes = GetResRef(oPC);
object oWhi;
string sTag = GetTag(oPC);

if(sRes == "ct_lighthorse")
	oWhi = GetItemPossessedBy(oOwn, "ct_ponywhistle");
else if (sRes == "midhorse")
	oWhi = GetItemPossessedBy(oOwn, "ct_packwhistle");
else if (sRes == "heavyhorse")
	oWhi = GetItemPossessedBy(oOwn, "ct_heavypackwhistle");

FloatingTextStringOnCreature("Your horse died.", oOwn);
EmptyInventoryandReturn(oPC, oOwn);

DestroyObject(oWhi);
RemoveRosterMemberFromParty(sTag, oOwn);
RemoveRosterMember(sTag);
}