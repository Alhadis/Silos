//gb_hydra_hb - Hydra heartbeat script
//
//Check if countdown in progress and add regen property
//back to hide if countdown over
//
//if local int on creature 'KeepHeads' is not 1,
//then apply head remove effects

#include "ginc_ai"
#include "x0_i0_spells"

void HealthCheck(object oTarget);

void main()
{
if (GetLocalInt(OBJECT_SELF, "KeepHeads") != 1)
	HealthCheck(OBJECT_SELF);

int iWait = GetLocalInt(OBJECT_SELF, "Wait");
int iCounter = GetLocalInt(OBJECT_SELF, "Counter");

if (iWait < 0)//if no countdown in progress, abort
	{
	ExecuteScript("nw_c2_default1", OBJECT_SELF);
	return;
	}
iCounter = iCounter +1;//continue the countdown
SetLocalInt(OBJECT_SELF, "Counter", iCounter);
object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, OBJECT_SELF);
int iHD = GetHitDice(OBJECT_SELF);
int iRegen = 10 + iHD;
if (iRegen > 20) iRegen = 20;
itemproperty ipRegen = ItemPropertyRegeneration(iRegen);
int iHasRegen = GetItemHasItemProperty(oHide, ITEM_PROPERTY_REGENERATION);

if (iCounter >= iWait)// add regen back when countdown over
	{
	if (iHasRegen == FALSE)
		AddItemProperty(DURATION_TYPE_PERMANENT, ipRegen, oHide);
	SetLocalInt(OBJECT_SELF, "Wait", -1);
	SetLocalInt(OBJECT_SELF, "Counter", -1);
	}
	
ExecuteScript("nw_c2_default1", OBJECT_SELF);
}

void HealthCheck(object oTarget)
{
effect eBlood;
int iHP = GetCurrentHitPoints(oTarget);
if (iHP < 1) return;
int iHPperc = GetHealthPercent(oTarget);
int iHeadsGone = GetLocalInt(oTarget, "HeadsGone");
int iHP1 = ( iHPperc / 20 ) + 1;
if (iHP1 > 5) iHP1 = 5;
int iHP2 = 5 - iHP1;

if (iHP2 == iHeadsGone) return;
iHeadsGone = iHP2;
SetLocalInt(oTarget, "HeadsGone", iHeadsGone);
RemoveAnySpellEffects(100, oTarget);
if (iHeadsGone == 0) return;
string sEffect = "fx_hydra_blood"+IntToString(iHeadsGone)+".sef";
eBlood = SetEffectSpellId(EffectNWN2SpecialEffectFile(sEffect),100);
DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBlood, oTarget));
}