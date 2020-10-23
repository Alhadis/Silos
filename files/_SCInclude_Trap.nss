/** @file
* @brief Include File for Traps
*
* 
* 
*
* @ingroup scinclude
* @author Segal, Brian T. Meyer and others ( mainly Segal and the depths for this file )
*/



//::///////////////////////////////////////////////
//:: _SCInclude_Trap
//:: Purpose: Handles the Tempest for the Equip and Unequip
//:: Original Version By: Segal from "the Depths PW", with further development by Pain
//:: Created On: October 18, 2007
//:://////////////////////////////////////////////

#include "_HkSpell"

//#include "ginc_debug"
#include "_SCInclude_Events"

// -------------------------------------------------------
// Constants
// -------------------------------------------------------

const string SYMBOL_OF_DEATH = "death";
const string SYMBOL_OF_FEAR = "fear";
const string SYMBOL_OF_PAIN = "pain";
const string SYMBOL_OF_PERSUASION = "persuasion";
const string SYMBOL_OF_SLEEP = "sleep";
const string SYMBOL_OF_STUNNING = "stunning";
const string SYMBOL_OF_WEAKNESS = "weakness";

// Magic trap description
const int nTRAP_DESCRIPTION = 210911;



//::///////////////////////////////////////////////
//:: SCDoTrapSpike
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Does a spike trap. Reflex save allowed.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
// apply effects of spike trap on entering object

// * Function for doing electrical traps
void SCTrapDoElectricalDamage(int ngDamageMaster, int iSaveDC, int nSecondary);



//#include "NW_I0_SPELLS"

const int DTRAP_MINOR_SPIKE   = 0;
const int DTRAP_AVERAGE_SPIKE  = 1;
const int DTRAP_STRONG_SPIKE  = 2;
const int DTRAP_DEADLY_SPIKE  = 3;
const int DTRAP_MINOR_HOLY   = 4;
const int DTRAP_AVERAGE_HOLY  = 5;
const int DTRAP_STRONG_HOLY   = 6;
const int DTRAP_DEADLY_HOLY   = 7;
const int DTRAP_MINOR_TANGLE  = 8;
const int DTRAP_AVERAGE_TANGLE  = 9;
const int DTRAP_STRONG_TANGLE  = 10;
const int DTRAP_DEADLY_TANGLE  = 11;
const int DTRAP_MINOR_ACID   = 12;
const int DTRAP_AVERAGE_ACID  = 13;
const int DTRAP_STRONG_ACID   = 14;
const int DTRAP_DEADLY_ACID   = 15;
const int DTRAP_MINOR_FIRE   = 16;
const int DTRAP_AVERAGE_FIRE  = 17;
const int DTRAP_STRONG_FIRE   = 18;
const int DTRAP_DEADLY_FIRE   = 19; 
const int DTRAP_MINOR_ELECT   = 20;
const int DTRAP_AVERAGE_ELECT  = 21;
const int DTRAP_STRONG_ELECT     = 22;
const int DTRAP_DEADLY_ELECT  = 23;
// 24 - 27 = Gas //
const int DTRAP_MINOR_COLD   = 28;
const int DTRAP_AVERAGE_COLD  = 29;
const int DTRAP_STRONG_COLD   = 30;
const int DTRAP_DEADLY_COLD   = 31;
const int DTRAP_MINOR_NEGATIVE  = 32;
const int DTRAP_AVERAGE_NEGATIVE  = 33;
const int DTRAP_STRONG_NEGATIVE  = 34;
const int DTRAP_DEADLY_NEGATIVE  = 35;
const int DTRAP_MINOR_SONIC   = 36;
const int DTRAP_AVERAGE_SONIC  = 37; 
const int DTRAP_STRONG_SONIC  = 38;
const int DTRAP_DEADLY_SONIC  = 39;
const int DTRAP_MINOR_ACIDSPLH  = 40;
const int DTRAP_AVERAGE_ACIDSPLH   = 41;
const int DTRAP_STRONG_ACIDSPLH    = 42;
const int DTRAP_DEADLY_ACIDSPLH    = 43;
const int DTRAP_EPIC_ELECT   = 44;
const int DTRAP_EPIC_FIRE   = 45;
const int DTRAP_EPIC_COLD   = 46;
const int DTRAP_EPIC_SONIC   = 47;
const int DTRAP_FATAL_SONIC   = 48; 
const int DTRAP_EPIC_SONIC2   = 49;
const int DTRAP_FATAL_ACID   = 50;
const int DTRAP_EPIC_ACID   = 51;
const int DTRAP_FATAL_ELECT   = 52;
const int DTRAP_EPIC_ELECT2   = 53;
const int DTRAP_FATAL_FIRE   = 54;
const int DTRAP_EPIC_FIRE2   = 55;
const int DTRAP_FATAL_HOLY   = 56;
const int DTRAP_EPIC_HOLY   = 57;


/////////////////////////////////////////////////
// Apply Trap Know How
// Reduces damage from trap based on feat
int DEP_ApplyTrapKnowHow(object oTarget, int nDamage)
{
	float AdvTrapKnowHow = 1.0;
	if (GetHasFeat(3196, oTarget, TRUE) == TRUE) AdvTrapKnowHow = 0.9; 
	if (GetHasFeat(3197, oTarget, TRUE) == TRUE) AdvTrapKnowHow = 0.8;
	if (GetHasFeat(3198, oTarget, TRUE) == TRUE) AdvTrapKnowHow = 0.7;
	if (GetHasFeat(3199, oTarget, TRUE) == TRUE) AdvTrapKnowHow = 0.6;
	if (GetHasFeat(3200, oTarget, TRUE) == TRUE) AdvTrapKnowHow = 0.5;
	if (AdvTrapKnowHow == 1.0) return nDamage;
	int TotDamage = nDamage;
	float fDamage = IntToFloat(nDamage);
	nDamage = FloatToInt( fDamage * AdvTrapKnowHow );
	int ActDamage = TotDamage - nDamage;
	SendMessageToPC(oTarget, "* Trap Know-How reduces damage by " + IntToString(ActDamage));
	return nDamage;
}

///////////////////////////////////////////////////
// Check for Critical
int DEP_CheckForTrapCritical(int nDamage, object oTrap=OBJECT_SELF)
{
	int SpecCritChance = GetLocalInt(oTrap, "TrapCritical");
	int BaseCritChance = 5 + SpecCritChance;
	int RandomChance = d100(1);
	if (RandomChance <= BaseCritChance)
	{
		nDamage = nDamage * 2;
	}
	return nDamage;
}
 
//::///////////////////////////////////////////////
//:: DoTrapSpike
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
// apply effects of spike trap on entering object
// implement a damage cap to support caltrops code --> SCDoCaltropEffect which destroys trap when

// VFX_IMP_SPIKE_TRAP, 

void DEP_DoTrapSpike(int nDamage, int nSaveDC=15, int nDamageType = DAMAGE_TYPE_PIERCING, int nVisualEffect = VFX_IMP_SPIKE_TRAP, int nSpikeDamageCap = 0 )
{
	//Declare major variables
	object oTarget = GetEnteringObject();
	
	// flying creatures will not be affected by this
	if ( CSLGetIsFlying(oTarget) )
	{
		return;
	}
	
	int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
	if (TrapEffectDC > 0)
	{
		nSaveDC = TrapEffectDC;
	}
	int nRealDamage = GetReflexAdjustedDamage(nDamage, oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP, OBJECT_SELF);
	nRealDamage = DEP_CheckForTrapCritical(nRealDamage, OBJECT_SELF);
	nRealDamage = DEP_ApplyTrapKnowHow(oTarget, nRealDamage);
	if ( nRealDamage > 0)
	{
		effect eDam = EffectDamage(nRealDamage, DAMAGE_TYPE_PIERCING);
		ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(nVisualEffect), GetLocation(oTarget));
		HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
		
		if ( nSpikeDamageCap )
		{
			int nDamageDone = GetLocalInt(OBJECT_SELF, "NW_L_TOTAL_DAMAGE")+nRealDamage;
			SetLocalInt(OBJECT_SELF, "NW_L_TOTAL_DAMAGE", nDamageDone);
			if (nDamageDone >= nSpikeDamageCap )
			{
				DestroyObject(OBJECT_SELF);
				object oImpactNode = GetLocalObject(OBJECT_SELF, "X0_L_IMPACT");
				if (GetIsObjectValid(oImpactNode) == TRUE)
				{
						DestroyObject(oImpactNode);
				}
			
			}
		}
		
    }
}


void SCDoTrapSpike(int iDamage)
{
	//Declare major variables
	object oTarget = GetEnteringObject();

	int nRealDamage = HkGetSaveAdjustedDamage(SAVING_THROW_REFLEX,SAVING_THROW_METHOD_FORHALFDAMAGE,iDamage, oTarget, 15, SAVING_THROW_TYPE_TRAP, OBJECT_SELF);
	if (iDamage > 0)
	{
			effect eDam = EffectDamage(nRealDamage, DAMAGE_TYPE_PIERCING);
			effect eVis = EffectVisualEffect(253);
			HkApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oTarget));
			HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
	}
}




//::///////////////////////////////////////////////
//:: SCDoCaltropEffect
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	The area effect will only do a total of
	25 points of damage and then destroy itself.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void SCDoCaltropEffect(object oTarget)
{

	//int nDam = 1;

 //   effect eVis = EffectVisualEffect(VFX_IMP_SPIKE_TRAP);
	//effect eLink = eDam;

	if(CSLSpellsIsTarget(oTarget,SCSPELL_TARGET_STANDARDHOSTILE, GetAreaOfEffectCreator())
		&& CSLGetIsFlying(oTarget) == FALSE)
	{
			//Fire cast spell at event for the target
			SignalEvent(oTarget, EventSpellCastAt(GetAreaOfEffectCreator(), 471, TRUE ));
			{
				effect eDam = EffectDamage(1, DAMAGE_TYPE_PIERCING);
				float fDelay = CSLRandomBetweenFloat(1.0, 2.2);
				//Apply damage and visuals
				//DelayCommand(fDelay, HkApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oTarget)));
				DelayCommand(fDelay, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
				int nDamageDone = GetLocalInt(OBJECT_SELF, "NW_L_TOTAL_DAMAGE");
				nDamageDone++;

				//  * storing variable on area of effect object
				SetLocalInt(OBJECT_SELF, "NW_L_TOTAL_DAMAGE", nDamageDone);
				if (nDamageDone == 25)
				{
					DestroyObject(OBJECT_SELF);
					object oImpactNode = GetLocalObject(OBJECT_SELF, "X0_L_IMPACT");
					if (GetIsObjectValid(oImpactNode) == TRUE)
					{
							DestroyObject(oImpactNode);
					}
				}

			}
	}
}


///////////////////////////////////////////////////////
// TrapDoElectricalDamage
///////////////////////////////////////////////////////
/*
AOE Electrial Trap that does nDamageMaster amount to a target and a number
of targets within a 15 foot range.  The number of secondary targets is determined
by nSecondary value.

Changes:
(1) Improved Evasion effect removed/
(2) Evasion automatically reduces damage to 50%

*/
void DEP_TrapDoElectricalDamage(int nDamageMaster, int nSaveDC, int nSecondary)
{
	//Declare major variables
	object oTarget = GetEnteringObject();
	object o2ndTarget;
	effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, oTarget, BODY_NODE_CHEST); // no longer using NWN1 VFX; does this still work?
	int nDamageMaster;
	int nDamage = nDamageMaster;
	nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF); 
	effect eDam;
	effect eVis = EffectVisualEffect( VFX_IMP_LIGHTNING_S );
	location lTarget = GetLocation(oTarget);
	int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
	if (TrapEffectDC > 0)
	{
		nSaveDC = TrapEffectDC;
	}
	int nCount = 0;
    //Adjust the trap damage based on the feats of the target
    if(!HkSavingThrow(SAVING_THROW_REFLEX, oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP))
    {
		if (GetHasFeat(FEAT_EVASION, oTarget))
		{
            nDamage /= 2;
		}
	}
	else
	{
		nDamage /= 2;
    } 
 /////////////////////////////////////////////////////////////////////
	if (nDamage > 0)
	{
		nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage);  
		eDam = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
		DelayCommand(0.0, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
		HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
	}
	//Reset the damage;
	nDamage = nDamageMaster;
	nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF); 
	o2ndTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget);
	while (GetIsObjectValid(o2ndTarget) && nCount <= nSecondary)
	{
        if(!GetIsReactionTypeFriendly(oTarget))
        {
            //check to see that the original target is not hit again.
            if(o2ndTarget != oTarget)
            {
                //Adjust the trap damage based on the feats of the target
                if(!HkSavingThrow(SAVING_THROW_REFLEX, o2ndTarget, nSaveDC, SAVING_THROW_TYPE_ELECTRICITY))
                {
                    if (GetHasFeat(FEAT_EVASION, o2ndTarget))
                    {
                        nDamage /= 2;
                    }
                }
                else
                {
                    nDamage /= 2;
                }
                if (nDamage > 0)
                {
                    //Set the damage effect
					nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage); 
                    eDam = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
                    //Apply the VFX impact and damage effect
                    DelayCommand(0.0, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, o2ndTarget));
                    HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, o2ndTarget);
                    //Connect the lightning stream from one target to another.
                    HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, o2ndTarget, 0.75);
                    //Set the last target as the new start for the lightning stream
                    eLightning = EffectBeam(VFX_BEAM_LIGHTNING, o2ndTarget, BODY_NODE_CHEST); // no longer using NWN1 VFX; does this still work?
                    //eLightning = EffectVisualEffect( VFX_BEAM_LIGHTNING ); // makes use of NWN2 VFX
                }
            }
            //Reset the damage
            nDamage = nDamageMaster;
            //Increment the count
            nCount++;
        }
        //Get next target in the shape.
        o2ndTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget);
    }
}



void SCTrapDoElectricalDamage(int ngDamageMaster, int iSaveDC, int nSecondary)
{
	//Declare major variables
	object oTarget = GetEnteringObject();
	object o2ndTarget;
	effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, oTarget, BODY_NODE_CHEST);   // no longer using NWN1 VFX; does this still work?
	//effect eLightning = EffectVisualEffect( VFX_BEAM_LIGHTNING );  // makes use of NWN2 VFX
	int nDamageMaster = ngDamageMaster;
	int iDamage = nDamageMaster;
	effect eDam;
	effect eVis = EffectVisualEffect( VFX_IMP_LIGHTNING_S );
	location lTarget = GetLocation(oTarget);
	int nCount = 0;
	//Adjust the trap damage based on the feats of the target
	
	iDamage = HkGetSaveAdjustedDamage( SAVING_THROW_REFLEX, SAVING_THROW_METHOD_FORHALFDAMAGE, iDamage, oTarget, iSaveDC, SAVING_THROW_TYPE_TRAP );
	
	//if(!HkSavingThrow(SAVING_THROW_REFLEX, oTarget, iSaveDC, SAVING_THROW_TYPE_TRAP))
	//{
	//		if (GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
	//		{
	//			iDamage /= 2;
	//		}
	//}
	//else if (GetHasFeat(FEAT_EVASION, oTarget) || GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
	//{
	//		iDamage = 0;
	//}
	//else
	//{
	//		iDamage /= 2;
	//}
	if (iDamage > 0)
	{
			eDam = EffectDamage(iDamage, DAMAGE_TYPE_ELECTRICAL);
			DelayCommand(0.0, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
			HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
	}
	
	 object oCreator = GetTrapCreator(OBJECT_SELF);
    if (oCreator == OBJECT_INVALID)
    {
        oCreator = OBJECT_SELF; //pre-placed traps have no creator
    }
    
	//Reset the damage;
	iDamage = nDamageMaster;
	o2ndTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget);
	while (GetIsObjectValid(o2ndTarget) && nCount <= nSecondary)
	{
			if(!GetIsReactionTypeFriendly(o2ndTarget, oCreator ))
			{
				//check to see that the original target is not hit again.
				if(o2ndTarget != oTarget)
				{
					//Adjust the trap damage based on the feats of the target
					iDamage = HkGetSaveAdjustedDamage( SAVING_THROW_REFLEX, SAVING_THROW_METHOD_FORHALFDAMAGE, iDamage, oTarget, iSaveDC, SAVING_THROW_TYPE_ELECTRICITY, oCreator );
	
					//if(!HkSavingThrow(SAVING_THROW_REFLEX, o2ndTarget, iSaveDC, SAVING_THROW_TYPE_ELECTRICITY))
					//{
					//		if (GetHasFeat(FEAT_IMPROVED_EVASION, o2ndTarget))
					//		{
					//			iDamage /= 2;
					//		}
					//}
					//else if (GetHasFeat(FEAT_EVASION, o2ndTarget) || GetHasFeat(FEAT_IMPROVED_EVASION, o2ndTarget))
					//{
					//		iDamage = 0;
					//}
					//else
					//{
					//		iDamage /= 2;
					//}
					if (iDamage > 0)
					{
							//Set the damage effect
							eDam = EffectDamage(iDamage, DAMAGE_TYPE_ELECTRICAL);
							//Apply the VFX impact and damage effect
							DelayCommand(0.0, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, o2ndTarget));
							HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, o2ndTarget);
							//Connect the lightning stream from one target to another.
							HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, o2ndTarget, 0.75);
							//Set the last target as the new start for the lightning stream
							eLightning = EffectBeam(VFX_BEAM_LIGHTNING, o2ndTarget, BODY_NODE_CHEST);   // no longer using NWN1 VFX; does this still work?
							//eLightning = EffectVisualEffect( VFX_BEAM_LIGHTNING );  // makes use of NWN2 VFX
					}
				}
				//Reset the damage
				iDamage = nDamageMaster;
				//Increment the count
				nCount++;
			}
			//Get next target in the shape.
			o2ndTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget);
	}
}


////////////////////////////////////////////////////
//
////////////////////////////////////////////////////
//::///////////////////////////////////////////////
//::Fire Trap

void DEP_TrapDoFireDamage(int nDamage, int nSaveDC)
{
	//Declare major variables
	int bValid;
	object oTarget = GetEnteringObject();
	location lTarget = GetLocation(oTarget);
	effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
	effect eDam;
	nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF);
	int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
	if (TrapEffectDC > 0) nSaveDC = TrapEffectDC;
	//Get first object in the target area
	oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget);
	//Cycle through the target area until all object have been targeted
	while(GetIsObjectValid(oTarget))
	{
        if (CSLSpellsIsTarget(oTarget, SCSPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        {
   //Adjust the trap damage based on the feats of the target
            if(!HkSavingThrow(SAVING_THROW_REFLEX, oTarget, nSaveDC, SAVING_THROW_TYPE_FIRE))
            {
                if (GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
                {
                    nDamage /= 2;
                }
            }
            else
            {
                nDamage /= 2;
            }
            if (nDamage > 0)
            {
                //Set damage effect
                eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                if (nDamage > 0)
                {
					//Apply effects to the target.
					nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage); 
					eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
					HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
					DelayCommand(0.0, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                }
            }
        }
        //Get next target in shape
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget);
    }
}

//::///////////////////////////////////////////////
//:: Frost Trap
void DEP_TrapDoColdDamage(int nDamage, int nSaveDC, int nDuration)
{
	//Declare major variables
	object oTarget = GetEnteringObject();
	nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF);
	nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage); 
	effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_COLD);
	effect eParal = EffectParalyze(nSaveDC, SAVING_THROW_FORT);
	effect eVis = EffectVisualEffect(VFX_IMP_FROST_S);
	effect eFreeze = EffectVisualEffect(VFX_DUR_PARALYZED);
	effect eLink = EffectLinkEffects(eParal, eFreeze);
	int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
	if (TrapEffectDC > 0) nSaveDC = TrapEffectDC;    
	if(!HkSavingThrow(SAVING_THROW_FORT,oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP))
    {
        HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
    }
	
	HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
	HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
	
}

//::///////////////////////////////////////////////
//:: Holy Trap
//:://////////////////////////////////////////////
void DEP_TrapDoHolyDamage(int nDamage, int UndeadDam)
{
    //Declare major variables
    object oTarget = GetEnteringObject();
 nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF); 
 nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage); 
    effect eDam = EffectDamage(UndeadDam, DAMAGE_TYPE_DIVINE);
    effect eVis = EffectVisualEffect(VFX_IMP_SUNSTRIKE);

        if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
        {
            //Apply Holy Damage and VFX impact
            HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
            HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        }
        else
        {
            eDam = EffectDamage(nDamage, DAMAGE_TYPE_DIVINE);
            //Apply Holy Damage and VFX impact
            HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
            HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        }
}

//::///////////////////////////////////////////////
//:: Tangle Trap
//:: NW_T1_TangStrC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Targets within 10ft of the entering character
    are slowed unless they make a reflex save with
    a DC of 30.  Effect lasts for 4 Rounds
*/
void DEP_TrapDoTangleDamage(int nSaveDC, int nDuration)
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    location lTarget = GetLocation(oTarget);
    effect eSlow = EffectSlow();
    effect eVis = EffectVisualEffect(VFX_IMP_SLOW);
 int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
 if (TrapEffectDC > 0) nSaveDC = TrapEffectDC;
    //Find first target in the size
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget);
    //Cycle through the objects in the radius
    while (GetIsObjectValid(oTarget))
    {
        if(!HkSavingThrow(SAVING_THROW_REFLEX, oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP))
        {
            //Apply slow effect and slow effect
            HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSlow, oTarget, RoundsToSeconds(nDuration));
        }
        //Get next target in the shape.
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget);
    }
}

//::///////////////////////////////////////////////
//:: Acid Blob
//:://////////////////////////////////////////////
/*
    Target is hit with a blob of acid that does
    3d6 Damage and holds the target for 2 rounds.
    Can make a Reflex save to avoid the hold effect.
*/


void DEP_TrapDoAcidDamage(int nDamage, int nSaveDC, int nDuration)
{
    //Declare major variables
    object oTarget = GetEnteringObject();
 nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF); 
 nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage); 
    effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
    effect eHold = EffectParalyze(nSaveDC, SAVING_THROW_FORT);
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
    effect eDur = EffectVisualEffect(VFX_DUR_PARALYZED);
    effect eLink = EffectLinkEffects(eHold, eDur);
 int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
 if (TrapEffectDC > 0) nSaveDC = TrapEffectDC;    
    int nDamage;
    
    //Make Reflex Save
    if(!HkSavingThrow(SAVING_THROW_REFLEX, oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP))
    {
        //Apply Hold and Damage
        HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
    }
    else
    {
        //Apply Damage
        HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    }
    HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}


//::///////////////////////////////////////////////
//:: Minor Acid Splash Trap
void DEP_TrapDoAcidSplash(int nDamage, int nSaveDC)
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
 int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
 if (TrapEffectDC > 0) nSaveDC = TrapEffectDC;
 nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF); 
    nDamage = GetReflexAdjustedDamage(nDamage, oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP);
 nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage);  
    eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
    HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}


//::///////////////////////////////////////////////
//:: Sonic Trap
void DEP_TrapDoSonicDamage(int nDamage, int nSaveDC, int nDuration)
{
	//Declare major variables
	object oTarget;
	effect eStun = EffectStunned();
	effect eFNF = EffectVisualEffect( VFX_HIT_SPELL_SONIC );
	effect eMind = EffectVisualEffect( VFX_DUR_SPELL_DAZE );
	effect eLink = EffectLinkEffects(eStun, eMind);
	nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF); 
	nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage);  
	effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_SONIC);
	object oTarget2 = GetEnteringObject();
	int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
	if (TrapEffectDC > 0) nSaveDC = TrapEffectDC;
	//Apply the FNF to the spell location
	ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eFNF, GetLocation(GetEnteringObject()));
	//Get the first target in the spell area
	oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM,GetLocation(GetEnteringObject()));
	while (GetIsObjectValid(oTarget))
	{
        if (CSLSpellsIsTarget(oTarget, SCSPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF) || GetFactionEqual(oTarget, oTarget2))
        {
			//Roll damage for each target
			eDam = EffectDamage(nDamage, DAMAGE_TYPE_SONIC);
			DelayCommand(0.0, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
			//Make a Will roll to avoid being stunned
			if(!HkSavingThrow(SAVING_THROW_WILL, oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP))
			{
				HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
			}
        }
		oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetLocation(GetEnteringObject()));
    }
}

 

//::///////////////////////////////////////////////
//:: Minor Negative Energy Trap
void DEP_TrapDoNegativeDamage(int nDamage, int nSaveDC, int nStr_Reduction)
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    effect eNeg = EffectAbilityDecrease(ABILITY_STRENGTH, nStr_Reduction);
 nDamage = DEP_CheckForTrapCritical(nDamage, OBJECT_SELF); 
 nDamage = DEP_ApplyTrapKnowHow(oTarget, nDamage);  
    effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
    eNeg = SupernaturalEffect(eNeg);
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
 int TrapEffectDC = GetLocalInt(OBJECT_SELF, "TrapEffectDC");
 if (TrapEffectDC > 0) nSaveDC = TrapEffectDC;    
    //Make a saving throw check
    if(!HkSavingThrow(SAVING_THROW_FORT, oTarget, nSaveDC, SAVING_THROW_TYPE_TRAP))
    {
        HkApplyEffectToObject(DURATION_TYPE_PERMANENT, eNeg, oTarget);
    }
    //Apply the VFX impact and effects
    HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}


// goes through a count until it finds a unique number for this symbol
int GetSymbolUniqueID(string sSymbolType)
{
	int nID = 0;
	string sSymbol = "symbol_of_" + sSymbolType + IntToString(nID);
	object oSymbol = GetObjectByTag(sSymbol);
	
	while(GetIsObjectValid(oSymbol))
	{
		nID++;
		sSymbol = "symbol_of_" + sSymbolType + IntToString(nID);
		oSymbol = GetObjectByTag(sSymbol);
	}
	return nID;
}

// returns the constant of the trap as defined in traps.2da

int GetTrapConstant(string sSymbolType)
{
	int nTrapConstant = 0;
	
	// Symbol of death
	if(sSymbolType == SYMBOL_OF_DEATH)
	{
		nTrapConstant = 58;
	}
	// Symbol of fear
	else if(sSymbolType == SYMBOL_OF_FEAR)
	{
		nTrapConstant = 59;
	}
	// Symbol of pain
	else if(sSymbolType == SYMBOL_OF_PAIN)
	{
		nTrapConstant = 60;
	}
	// Symbol of persuasion
	else if(sSymbolType == SYMBOL_OF_PERSUASION)
	{
		nTrapConstant = 61;
	}
	// Symbol of sleep
	else if(sSymbolType == SYMBOL_OF_SLEEP)
	{
		nTrapConstant = 62;
	}
	// Symbol of stunning
	else if(sSymbolType == SYMBOL_OF_STUNNING)
	{
		nTrapConstant = 63;
	}
	// Symbol of weakness
	else if(sSymbolType == SYMBOL_OF_WEAKNESS)
	{
		nTrapConstant = 64;
	}
	//invalid symbol
	//else
		//PrettyError("Invalid Symbol Type :" + sSymbolType);
	
	return nTrapConstant;
}

// does the leg work of setting up symbol
void SetUpSymbol(string sSymbolType)
{
	// Get spell location
	object oCaster = OBJECT_SELF;
	location lTarget = GetSpellTargetLocation();
	
	int iSpellPower = HkGetSpellPower( oCaster );
	string sAOETag =  HkAOETag( oCaster, GetSpellId(), iSpellPower, -1.0f, FALSE  );
	
	// Spell duration
	float fDuration = TurnsToSeconds(GetCasterLevel(oCaster));
	// Symbol unique ID
	int nID = GetSymbolUniqueID(sSymbolType);
	string sID = IntToString(nID);
	string sTriggered = "nx2_s0_symbol_of_" + sSymbolType + "a";
	string sDescription = GetStringByStrRef(nTRAP_DESCRIPTION);
	// Trap constant
	int nTrapConstant = GetTrapConstant(sSymbolType);
	// Effect with appropriate onEnter script, name it appropriately
	// need to fix this so it uses my AOE logic
	effect eAOE = EffectAreaOfEffect(65, sTriggered, "", "", "symbol_of_" + sSymbolType + sID); // , "", "", "", sAOETag
	object oTrap;

	// Apply AOE to location and create trap
	HkApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration);
	// different trap and aoe faction based on faction
	if(GetStandardFactionReputation(STANDARD_FACTION_HOSTILE) >= 51)
	{
		oTrap = CreateTrapAtLocation(nTrapConstant, lTarget, 2.25f, "", STANDARD_FACTION_HOSTILE);
	}
	else if(GetStandardFactionReputation(STANDARD_FACTION_HOSTILE) <= 50)
	{
		oTrap = CreateTrapAtLocation(nTrapConstant, lTarget, 2.25f, "", STANDARD_FACTION_DEFENDER);
	}
	
	// Setup trap variables and event handlers
	SetLocalString(oTrap, "Symbol_Type", sSymbolType + sID);
	SetLocalString(oTrap, "OnTriggered", sTriggered);
	SetTrapOneShot(oTrap, FALSE);
	SetTrapRecoverable(oTrap, FALSE);
	SetEventHandler(oTrap, SCRIPT_TRIGGER_ON_HEARTBEAT, "nx2_b_symbol_hb");
	SetEventHandler(oTrap, SCRIPT_TRIGGER_ON_DISARMED, "nx2_b_symbol_disarm");
	SetEventHandler(oTrap, SCRIPT_TRIGGER_ON_TRAPTRIGGERED, "nx2_b_symbol_triggered");
	SetDescription(oTrap, sDescription);
	
	// Special case symbols
	if (sSymbolType == SYMBOL_OF_DEATH)
	{
		object oAOE = GetObjectByTag("symbol_of_death" + sID);
		SetLocalInt(oAOE, "Local_Damage", 150);
	}
}


//::///////////////////////////////////////////////
//:: SCDoGrenade
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Does a damage type grenade (direct or splash on miss)
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void SCDoGrenade(int nDirectDamage, int nSplashDamage, int vSmallHit, int vRingHit, int iDamageType, float fExplosionRadius , int nObjectFilter, int nRacialType=RACIAL_TYPE_ALL)
{
	//Declare major variables  ( fDist / (3.0f * log( fDist ) + 2.0f) )
	object oTarget = HkGetSpellTarget();
	int iCasterLevel = GetCasterLevel(OBJECT_SELF);
	int iDamage = 0;
	int nCnt;
	effect eMissile;
	effect eVis = EffectVisualEffect(vSmallHit);
	location lTarget = GetSpellTargetLocation();


	float fDist = GetDistanceBetween(OBJECT_SELF, oTarget);
	int iTouch;


	if (GetIsObjectValid(oTarget) == TRUE)
	{
/*        // * BK September 27 2002
			// * if the object is 'far' from the original impact it
			// * will be an automatic miss too
			location lObject = GetLocation(oTarget);
			float fDistance = GetDistanceBetweenLocations(lTarget, lObject);
//        SpawnScriptDebugger();
			if (fDistance > 1.0)
			{
				iTouch = -1;
			}
			else
			This did not work. The location and object location are the same.
			For now we'll have to live with the possiblity of the 'explosion'
			happening away from where the grenade hits.
			We could convert everything to splash...
			*/
				iTouch = CSLTouchAttackRanged(oTarget);

	}
	else
	{
			iTouch = -1; // * this means that target was the ground, so the user
							// * intended to splash
	}
	if (iTouch >= 1)
	{
			//Roll damage
			int nDam = nDirectDamage;

			if(iTouch == 2)
			{
				nDam *= 2;
			}

			//Set damage effect
			effect eDam = EffectDamage(nDam, iDamageType);
			//Apply the MIRV and damage effect

			// * only damage enemies
			if(CSLSpellsIsTarget(oTarget,SCSPELL_TARGET_STANDARDHOSTILE,OBJECT_SELF) )
			{
			// * must be the correct racial type (only used with Holy Water)
				if ((nRacialType != RACIAL_TYPE_ALL) && (nRacialType == GetRacialType(oTarget)))
				{
					HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
					SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), TRUE ));
					//HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget); VISUALS outrace the grenade, looks bad
				}
				else
				if ((nRacialType == RACIAL_TYPE_ALL) )
				{
					HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
					SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), TRUE ));
					//HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget); VISUALS outrace the grenade, looks bad
				}

			}

	//    HkApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget);
	}

// *
// * Splash damage always happens as well now
// *
	{
			effect eExplode = EffectVisualEffect(vRingHit);
		//Apply the fireball explosion at the location captured above.

/*       float fFace = GetFacingFromLocation(lTarget);
		vector vPos = GetPositionFromLocation(lTarget);
		object oArea = GetAreaFromLocation(lTarget);
		vPos.x = vPos.x - 1.0;
		vPos.y = vPos.y - 1.0;
		lTarget = Location(oArea, vPos, fFace);
		missing code looks bad because it does not jive with visual
*/
		HkApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
	object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fExplosionRadius, lTarget, TRUE, nObjectFilter);
	//Cycle through the targets within the spell shape until an invalid object is captured.
	while (GetIsObjectValid(oTarget))
	{
			if(CSLSpellsIsTarget(oTarget,SCSPELL_TARGET_STANDARDHOSTILE,OBJECT_SELF) )
			{
				float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20;
				//Roll damage for each target
				iDamage = nSplashDamage;

				//Set the damage effect
				effect eDam = EffectDamage(iDamage, iDamageType);
				if(iDamage > 0)
				{
			// * must be the correct racial type (only used with Holy Water)
					if ((nRacialType != RACIAL_TYPE_ALL) && (nRacialType == GetRacialType(oTarget)))
					{
							// Apply effects to the currently selected target.
							SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), TRUE ));
							DelayCommand(fDelay, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
							//This visual effect is applied to the target object not the location as above.  This visual effect
							//represents the flame that erupts on the target not on the ground.
							DelayCommand(fDelay, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
					}
					else
					if ((nRacialType == RACIAL_TYPE_ALL) )
					{
							SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), TRUE ));
							DelayCommand(fDelay, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
							DelayCommand(fDelay, HkApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
					}

				}
			}
		//Select the next target within the spell shape.
		oTarget = GetNextObjectInShape(SHAPE_SPHERE, fExplosionRadius, lTarget, TRUE, nObjectFilter);
		}
	}
}