/****************************************************
This script originally crafted by Corin Tack
****************************************************/

#include "nw_i0_spells"

void spfoncast(object oPC, int iLvl, int iMissile, int iCaster)
{
int nDuration = 5;
effect eDur = EffectVisualEffect( VFX_DUR_SPELL_SPELL_MANTLE );
int iLvl2 = iLvl;
object oMe = GetItemPossessedBy(oPC, "ct_spellfire");
int iSpells = GetLocalInt(oMe, "spflvl");
object oArea = GetArea(oPC);

if(iMissile == 1)
	iLvl2 = iLvl * ((iCaster - 1) / 2);
if(iMissile == 2)
	iLvl2 = iLvl * iCaster;

int nAbsorb = iLvl2;

effect eAbsob = EffectSpellLevelAbsorption(9, nAbsorb);
effect eLink = EffectLinkEffects(eDur, eAbsob);

SignalEvent(oPC, EventSpellCastAt(OBJECT_SELF, SPELL_SPELL_MANTLE, FALSE));

RemoveEffectsFromSpell(oPC, SPELL_LEAST_SPELL_MANTLE);
RemoveEffectsFromSpell(oPC, SPELL_LESSER_SPELL_MANTLE);
RemoveEffectsFromSpell(oPC, SPELL_GREATER_SPELL_MANTLE);

ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));

SetLocalInt(oMe, "spflvl", iSpells + iLvl);
SetLocalInt(oPC, "absorblvl", 0);
SetLocalInt(oArea, "X2_L_WILD_MAGIC", 0);
}

void OnlyDoOnce(object oPC, object oArea, int iOnce, object oIt)
{
int iChk = GetLocalInt(oPC, "doonce");

if(iOnce == iChk)
	{
		SetLocalInt(oPC, "absorblvl", 0);
		SetLocalInt(oArea, "X2_L_WILD_MAGIC", 0);
		SetLocalInt(oIt, "doonce", iOnce + 1);
	}
}

void spfabsorb(object oPC)
{
object oTarget = oPC;
object oMe = GetItemPossessedBy(oPC, "ct_spellfire");
int iSpells = GetLocalInt(oMe, "spflvl");
int nAbsorb = GetAbilityScore(oPC, ABILITY_CONSTITUTION) - iSpells;
object oArea = GetArea(oPC);

SetLocalInt(oArea, "X2_L_WILD_MAGIC", 1);
SetLocalInt(oPC, "absorblvl", nAbsorb);
int iChk = GetLocalInt(oPC, "doonce");
int iOnce = GetLocalInt(oMe, "doonce");

if(iChk == 0)
	{
		SetLocalInt(oPC, "doonce", 1);
		SetLocalInt(oMe, "doonce", 1);
		iOnce = 1;
	}
if (iChk != 0 && iChk != iOnce)
	SetLocalInt(oPC, "doonce", iOnce);

DelayCommand(30.0, OnlyDoOnce(oPC, oArea, iOnce, oMe));
}

void spfheal(object oPC, object oTarget)
{
object oMe = GetItemPossessedBy(oPC, "ct_spellfire");
int iSpells = GetLocalInt(oMe, "spflvl");

if(GetDistanceBetween(oPC, oTarget) < 2.0)
	{
		if(iSpells > 0)
			{
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_HIT_SPELL_HOLY), oTarget);
				DelayCommand(0.5, AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(2 * iSpells), oTarget)));
				SetLocalInt(oMe, "spflvl", 0);
				if(GetGender(oPC) == GENDER_MALE)
									AssignCommand(oPC, ActionSpeakString("He touches " + GetName(oTarget) + " and " + GetName(oTarget) + " is briefly enveloped by a bright silver light. When the light fades, " + GetName(oTarget) + "'s wounds seem to have healed somehow."));
								if(GetGender(oPC) == GENDER_FEMALE)
									AssignCommand(oPC, ActionSpeakString("She touches " + GetName(oTarget) + " and " + GetName(oTarget) + " is briefly enveloped by a bright silver light. When the light fades, " + GetName(oTarget) + "'s wounds seem to have healed somehow."));
			}
		else
			SendMessageToPC(oPC, "You do not have any spellfire levels to expend at this time.");
	}
else
	SendMessageToPC(oPC, "You are too far away to do that.");
}

void inflict(int iDmg, object oTarget, object oPC)
{
AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDmg, DAMAGE_TYPE_FIRE), oTarget));
AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDmg), oTarget));
}

void spellflame(object oPC, object oTarget)
{
object oMe = GetItemPossessedBy(oPC, "ct_spellfire");
float fDis = GetDistanceBetween(oPC, oTarget);
int iStore = GetLocalInt(oMe, "spflvl");
int iDmg;
int iAB = GetBaseAttackBonus(oPC);
int iDex = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
int iATot = iAB + iDex;
int iAC = 10 + GetAbilityModifier(ABILITY_DEXTERITY, oTarget);
int iChk = d20();
int iChk2 = d20();

if(fDis <= 133.3)
	{
		if(iStore > 0)
			{
				iDmg = d6(iStore) / 2;

				if(iChk == 20)
					{
						ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_HIT_SPELL_FLAMESTRIKE), oTarget);
						if(iChk2 + iATot >= iAC)
							{
								ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_HIT_SPELL_FLAMESTRIKE), oTarget);
								DelayCommand(0.5, inflict(iDmg * 2, oTarget, oPC));
								SendMessageToPC(oPC, "Spellfire Flame touch Attack: " + IntToString(iChk) + " (d20) + " + IntToString(iATot) + " = " + IntToString(iChk + iATot) + ": Crit - Confirm Check: " + IntToString(iChk2) + " (d20) + " + IntToString(iATot) + " = " + IntToString(iChk2 + iATot) + ": Hit");
								if(GetGender(oPC) == GENDER_MALE)
									AssignCommand(oPC, ActionSpeakString("Points his finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". When it impacts, " + GetName(oTarget) + " is engulfed in a silver and red fire for a single instant."));
								if(GetGender(oPC) == GENDER_FEMALE)
									AssignCommand(oPC, ActionSpeakString("Points her finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". When it impacts, " + GetName(oTarget) + " is engulfed in a silver and red fire for a single instant."));
							}	
						else if (iChk2 + iATot <= iAC)
							{
								ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_HIT_SPELL_FLAMESTRIKE), oTarget);
								DelayCommand(0.5, inflict(iDmg, oTarget, oPC));
								SendMessageToPC(oPC, "Spellfire Flame touch Attack: " + IntToString(iChk) + " (d20) + " + IntToString(iATot) + " = " + IntToString(iChk + iATot) + ": Crit - Confirm Check: " + IntToString(iChk2) + " (d20) + " + IntToString(iATot) + " = " + IntToString(iChk2 + iATot) + ": Miss");
								if(GetGender(oPC) == GENDER_MALE)
									AssignCommand(oPC, ActionSpeakString("Points his finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". When it impacts, " + GetName(oTarget) + " is engulfed in a silver and red fire for a single instant."));
								if(GetGender(oPC) == GENDER_FEMALE)
									AssignCommand(oPC, ActionSpeakString("Points her finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". When it impacts, " + GetName(oTarget) + " is engulfed in a silver and red fire for a single instant."));
							}
					}
				else if(iChk < 20 && iChk + iATot >= iAC)
					{
						ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_HIT_SPELL_FLAMESTRIKE), oTarget);
						DelayCommand(0.5, inflict(iDmg, oTarget, oPC));
						SendMessageToPC(oPC, "Spellfire Flame touch Attack: " + IntToString(iChk) + " (d20) + " + IntToString(iATot) + " = " + IntToString(iChk + iATot) + ": Hit");
						if(GetGender(oPC) == GENDER_MALE)
							AssignCommand(oPC, ActionSpeakString("Points his finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". When it impacts, " + GetName(oTarget) + " is engulfed in a silver and red fire for a single instant."));
						if(GetGender(oPC) == GENDER_FEMALE)
							AssignCommand(oPC, ActionSpeakString("Points her finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". When it impacts, " + GetName(oTarget) + " is engulfed in a silver and red fire for a single instant."));
					}
				else if(iChk + iATot < iAC)
					{
						SendMessageToPC(oPC, "Spellfire Flame touch Attack: " + IntToString(iChk) + " (d20) + " + IntToString(iATot) + " = " + IntToString(iChk + iATot) + ": Miss");
						if(GetGender(oPC) == GENDER_MALE)
							AssignCommand(oPC, ActionSpeakString("Points his finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". It misses, but when it impacts with the ground it bursts into a massive silver and red flame for a single instant."));
						if(GetGender(oPC) == GENDER_FEMALE)
							AssignCommand(oPC, ActionSpeakString("Points her finger at " + GetName(oTarget) + " and a small silver orb flies out towards " + GetName(oTarget) + ". It misses, but when it impacts with the ground it bursts into a massive silver and red flame for a single instant."));
					}
				SetLocalInt(oMe, "spflvl", 0);
				
			}
		else
			SendMessageToPC(oPC, "You do not have any spellfire levels to expend at this time.");
	}
else
	SendMessageToPC(oPC, "You are too far away to do that.");
}