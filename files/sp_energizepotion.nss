//::///////////////////////////////////////////////
//:: Name 	Energize Potion
//:: FileName sp_energz_ptn.nss
//:://////////////////////////////////////////////
/**@file Energize Potion
Transmutation
Level: Cleric 3, druid 3, sorc/wizard 2, Wrath 2
Components: V,S,M
Casting Time: 1 standard action
Range: Close
Effect: 10ft radius
Duration: Instantaneous
Saving Throw: Reflex half
Spell Resistance: Yes

This spell transforms a magic potion into a volatile
substance that can be hurled out to the specified
range. The spell destroys the potion and releases
a 10-foot-radius burst of energy at the point of
impact. The caster must specify the energy type
(acid, cold, electricity, fire, or sonic) when the
spell is cast.

The potion deals 1d6 points of damage (of the
appropriate energy type) per spell level of the
potion (maximum 3d6). For example, a potion of
displacement transformed by this spell deals 3d6
points of damage. An energized potion set to deal
fire damage ignites combustibles within the burst
radius.

Author: 	Tenjac
Created: 	7/6/06
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//#include "spinc_common"


#include "_HkSpell"

void main()
{	
	
	//--------------------------------------------------------------------------
	//Prep the spell
	//--------------------------------------------------------------------------
	object oCaster = OBJECT_SELF;
	int iSpellId = SPELL_ENERGIZE_POTION; // put spell constant here
	int iClass = CLASS_TYPE_NONE;
	int iSpellLevel = HkGetSpellLevel( iSpellId, iClass );
	//int iImpactSEF = VFX_HIT_AOE_ACID;
	int iAttributes = SCMETA_ATTRIBUTES_MAGICAL | SCMETA_ATTRIBUTES_ARCANE | SCMETA_ATTRIBUTES_SOMANTICCOMP | SCMETA_ATTRIBUTES_VOCALCOMP | SCMETA_ATTRIBUTES_MATERIALCOMP | SCMETA_ATTRIBUTES_FOCUSCOMP | SCMETA_ATTRIBUTES_HOSTILE | SCMETA_ATTRIBUTES_CANTCASTINTOWN;
	
	//--------------------------------------------------------------------------
	//Run Precast Code
	//--------------------------------------------------------------------------
	if (!HkPreCastHook( oCaster, iSpellId, SCMETA_DESCRIPTOR_NONE, iClass, iSpellLevel, SPELL_SCHOOL_TRANSMUTATION, SPELL_SUBSCHOOL_NONE, iAttributes ) )
	{
		return;
	}

	//--------------------------------------------------------------------------
	//Declare major variables
	//--------------------------------------------------------------------------	
	object oPotion = HkGetSpellTarget();
	int nSpell = HkGetSpellId();
	int nCasterLvl = HkGetCasterLevel(oCaster);
	SetLocalInt(oPotion, "PRC_EnergizePotionCL", nCasterLvl);
	string sDamageType;

	//Get spell level
	int nLevel = 0; //define it outside the loop
	itemproperty ipTest = GetFirstItemProperty(oPotion);

	while(GetIsItemPropertyValid(ipTest))
	{
		if(GetItemPropertyType(ipTest) == ITEM_PROPERTY_CAST_SPELL)
		{
			//Get row
			int nRow = GetItemPropertySubType(ipTest);

			//Get spellID
			int nSpellID = StringToInt(Get2DAString("iprp_spells.2da", "SpellIndex", nRow));

			//Get spell level
			nLevel = StringToInt(Get2DAString("spells", "Innate", nSpellID));

			//no need to check rest of the ips
			break;
		}
		ipTest = GetNextItemProperty(oPotion);
	}

	//Remove potion being converted
	DestroyObject(oPotion);

	//Create the grenade
	object oGrenade = CreateItemOnObject("nw_it_enrgpot", oCaster, 1);

	if(nSpell == SPELL_ENERGIZE_POTION_ACID)
	{
		SetLocalInt(oGrenade, "PRC_GrenadeDamageType", DAMAGE_TYPE_ACID);
		SetLocalInt(oGrenade, "PRC_EnergizedPotionSave", SAVING_THROW_TYPE_ACID);
		sDamageType = "Acid";
	}

	if(nSpell == SPELL_ENERGIZE_POTION_COLD)
	{
		SetLocalInt(oGrenade, "PRC_GrenadeDamageType", DAMAGE_TYPE_COLD);
		SetLocalInt(oGrenade, "PRC_EnergizedPotionSave", SAVING_THROW_TYPE_COLD);
		sDamageType = "Cold";
	}

	if(nSpell == SPELL_ENERGIZE_POTION_ELECTRICITY)
	{
		SetLocalInt(oGrenade, "PRC_GrenadeDamageType", DAMAGE_TYPE_ELECTRICAL);
		SetLocalInt(oGrenade, "PRC_EnergizedPotionSave", SAVING_THROW_TYPE_ELECTRICITY);
		sDamageType = "Electrical";
	}

	if(nSpell == SPELL_ENERGIZE_POTION_FIRE)
	{
		SetLocalInt(oGrenade, "PRC_GrenadeDamageType", DAMAGE_TYPE_FIRE);
		SetLocalInt(oGrenade, "PRC_EnergizedPotionSave", SAVING_THROW_TYPE_FIRE);
		sDamageType = "Fire";
	}

	if(nSpell == SPELL_ENERGIZE_POTION_SONIC)
	{
		SetLocalInt(oGrenade, "PRC_GrenadeDamageType", DAMAGE_TYPE_SONIC);
		SetLocalInt(oGrenade, "PRC_EnergizedPotionSave", SAVING_THROW_TYPE_SONIC);
		sDamageType = "Sonic";
	}

	SetLocalInt(oGrenade, "PRC_GrenadeLevel", CSLGetMin(3, nLevel));

	string sStrength;

	//Get strength string
	switch(nLevel)
	{
		case 0: break;

		case 1: sStrength = "Weak";

		case 2: sStrength = "Moderate";

		case 3: sStrength = "Strong";
	}
	//renamed function - NWN2
	SetFirstName(oPotion, sStrength + " " + "Energized" + " " + sDamageType + " " + "Potion");

	
	//--------------------------------------------------------------------------
	// Clean up
	//--------------------------------------------------------------------------
	HkPostCast( oCaster );
}

