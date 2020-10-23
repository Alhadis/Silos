#include "ginc_param_const"
#include "ginc_henchman"

void PrepForDestruction(object oTarget)
{
	SetPlotFlag(oTarget,FALSE);
    SetImmortal(oTarget,FALSE);
    AssignCommand(oTarget,SetIsDestroyable(TRUE,FALSE,FALSE));
}

void main()
{
object oPC = GetItemActivator();
location lLoc = GetItemActivatedTargetLocation();
object oTar = GetItemActivatedTarget();
object oCreature;
object oIt = GetItemActivated();
string sCreature = GetLocalString(oIt, "tag");

if(oTar == oPC)
	{
	oCreature = CreateObject(OBJECT_TYPE_CREATURE, "maybell_hench4", lLoc, FALSE,GetFirstName(oPC) + "slave");
	}

else if(GetTag(oTar) == GetFirstName(oPC) + "slave")
	{
	HenchmanRemove(GetMaster(oTar),oTar);	
	PrepForDestruction(oTar);
	DestroyObject(oTar,0.5f);
	}
}