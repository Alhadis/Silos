//:://///////////////////////////////////////////////
//:: Warlock Lesser Invocation: The Dead Walk(!)
//:: nw_s0_icharm.nss
//:: Copyright (c) 2005 Obsidian Entertainment Inc.
//::////////////////////////////////////////////////
//:: Created By: Brock Heinz
//:: Created On: 08/12/05
//::////////////////////////////////////////////////
/*
        5.7.2.5	Dead Walk, The
        Complete Arcane, pg. 133
        Spell Level:	4
        Class: 		Misc

        This functions identically to the animate dead spell (3rd level wizard).

        [Rules Note] There is a gem component to make the animated creatures 
        last more than 1 minute per level. Special component rules for spells 
        don't exist in NWN2.

*/
#include "x2_inc_spellhook" 

/*
	Oni5115
	I added a lot of various options that may or may not deviate from PnP rules.
	The idea is to allow a very flexible spell with parameters to make it behave as a player/builder wants.
	
	How the spell works:
	You summon an undead with HD randomly chosen between a min/max level (configured below).
	You can recast it to summon more udnead (if the proper options are set).
	Its duration is configurable (1 min/level, permanent, permanent if cast a second time on a summond skeleton).
	Its gold cost is also an option (0 or 25xHD per summon made permanent, non-permanent summons are still free).
	
	Default values:
	Number of Undead: 1 cast, up to 4x HD.
	Level: HD/2 - HD.
	Duration: 1 min (real time) / level, made permanent if you cast on the same target a second time.
	Gold Cost: 25*HD but only if you're making something a permanent pet.
	
	
	I chose to base max/min levels on player HD and not CL; making it useful for multi-class warlocks.
	I did this because I figured you should be raising undead close to your level, regardless of how good a caster you are.
	I left the option to change it to CL in for those that want it CL based.
	
	Possible Ideas for the Future:
	Summonable Area - only allow summoning in particular spots in a module. Such as graveyards etc. up to mod builders to utilize.
	Max Summons in Area - so the graveyard/mauseleum/etc. actually runs out of corpses.
	Curse a living target - so it becomes your undead pet after it dies (a way to require corpses without requiring a location).
	
	I only really want to implement things that do not require massive module changes at this point.
*/


// convert into switches for PRC
const int SUMMON_COUNT_MULTIPLE = 1;		// 0 - summon 1 undead per cast, control up to 4xHD undead
						// 1+- the maximum number of summons allowed total.

const int SUMMON_TYPE = 0;			// 0 - caster level determins creature type
						// 1 - random creature type

const int SUMMON_LEVEL_MIN_CL = 0;		// 0 - 1 is minimum level.
const int SUMMON_LEVEL_MIN_HD = 1;		// 1+- (CL or HD)/value is the minmum level.
						
const int SUMMON_LEVEL_MAX_CL = 0;		// 0 - off
const int SUMMON_LEVEL_MAX_HD = 1;		// 1+- (CL or HD)/value is the max level.
												
const int SUMMON_LEVEL_MAX_VALUE = 0;		// 0 - off
						// 1+-sets max summon level, overrides CL/HD settings.

const int SUMMON_DURATION = 2;			// 0 - PnP or Script Value (1 min/level for Dead Walk)
						// 1 - PnP value first cast, Permanent second cast. 
						// 2 - Permanent

const int SUMMON_GP_COST = 0;			// 0 - No gold cost for summoning a permanent summon.
						// 1 - PnP gold costs for summons (Dead Walk - 25gp per undead HD)


const int DEBUG_MODE_INVOCATIONS = 0;		// set debug mode for displaying debug text for testing.


// Special Control Types for GetTotalControlled / GetControlled
const int CONTROL_TYPE_ALL = 0;			// all HD of race/associate type.
const int CONTROL_TYPE_UNDEAD_ANIMATED = 1;	// only animated undead
const int CONTROL_TYPE_UNDEAD_COMMANDED = 2;	// only undead commanded by Turn Undead
						// (currently is just all undead that are not summoned)
const int CONTROL_COUNT_HD = 0;			// returns amount of creatures controlled in HD.
const int CONTROL_COUNT_VALUE = 1;		// returns number of creatures controlled.

// GetControlled
// returns the number or HD of ASSOCIATE_TYPE_* of RACIAL_TYPE_* controlled by a player.  (e.g. HD of controlled undead)
/*
	nControlType:	special CONTROL_TYPE_* const
	nRacialType: 	RACIAL_TYPE_*
	nAssociateType:	ASSOCIATE_TYPE_*
	
	The default setup without parameters returns the HD of dominated undead.
	There is a wrapper functions as well with the same paramters and booleans for each ASSOCIATE_TYPE_* below.
	
	BUGS:
	ASSOCIATE_TYPE_DOMINATED - seems to only ever return the count for 1 summon/HD. Have not tested all ASSOCIATE_TYPE_* 
	
	In NwN1 we used ASSOCIATE_TYPE_SUMMONED.  
	I tried that but when you summon a new one, the old summon is booted from party and no longer response to commands.
	I am unsure if it causes them to stop being picked up get GetAssociate, as I stopped trying to use it when I discovered the previous issue.
*/
int GetControlled(object oPC = OBJECT_SELF, int nControlType = CONTROL_TYPE_ALL, int nControlCount = CONTROL_COUNT_HD, int nRacialType = RACIAL_TYPE_UNDEAD, int nAssociateType = ASSOCIATE_TYPE_DOMINATED )
{
	int nHD = 0;
	int nVal = 0;
   	int i = 1;
    	object oSummon;
    	object oldSummon = OBJECT_INVALID;
    	
    	int nType;
    	string sTag;
    	
    	oSummon = GetAssociate(nAssociateType, oPC, i);
    	while( GetIsObjectValid(oSummon) && oSummon != oldSummon )
    	{    		
    		if(GetRacialType(oSummon) == nRacialType)
    		{
    			if(nRacialType == RACIAL_TYPE_UNDEAD)
    			{   		
    				if(GetTag(oSummon) == "animated_undead" && nControlType == CONTROL_TYPE_UNDEAD_ANIMATED)
    				{
    						nHD += GetHitDice(oSummon);
    						nVal++;
    				}
       				else if(GetTag(oSummon) != "animated_undead" && nControlType == CONTROL_TYPE_UNDEAD_COMMANDED)
      				{
      						nHD += GetHitDice(oSummon);
      						nVal++;
    				}
  			}
    			if(nControlType == CONTROL_TYPE_ALL)
    			{
     				nHD += GetHitDice(oSummon);
    				nVal++;    			
    			}
    		}
    		
    		i++;
    		oldSummon = oSummon;
    	    	oSummon = GetAssociate(nAssociateType, oPC, i);
    	}
    	    	
    	if(nControlCount == CONTROL_COUNT_HD )	return nHD;
    	else					return nVal;
}

// GetTotalControlled
// Wrapper function to call GetControlledHD based on different ASSOCIATE_TYPE_* const values and add the HD together.
/*
	oPC: 		controller of the objects
	nControlType: 	special CONTROL_TYPE_* const
	nRacialType:	RACIAL_TYPE_*
	
	bDominated, 
	bSummoned, 
	bFamiliar, 
	bCompanion, 
	bHenchmen:	allow checking for a particular ASSOCIATE_TYPE_*
	
	This was primary written as a quick wrapper to check and add all Undead HD that are dominated and summoned.
	In NwN1 we used multiple summons not dominations.  In NwN2, multiple summons do not seem to function properly.
	I wrote this wrapper in case we find a work around for it and go back to using summoned instead.
	
	I also left it very open ended in case we want to add Cohorts, use it for the Orc Warlord, etc.
	Flexible framework will allow us to easily track track HD of any ally type of any race fairly quickly.
*/
int GetTotalControlled(	object oPC = OBJECT_SELF, int nControlType = CONTROL_TYPE_ALL, int nControlCount = CONTROL_COUNT_HD, int nRacialType = RACIAL_TYPE_UNDEAD, int bDominated = TRUE, int bSummoned = TRUE, int bFamiliar = FALSE, int bCompanion = FALSE, int bHenchmen = FALSE)
{
	int nHD = 0;
	if(bDominated)	nHD += GetControlled(oPC, nControlType, nControlCount, nRacialType, ASSOCIATE_TYPE_DOMINATED);
	if(bSummoned) 	nHD += GetControlled(oPC, nControlType, nControlCount, nRacialType, ASSOCIATE_TYPE_SUMMONED);
	if(bFamiliar) 	nHD += GetControlled(oPC, nControlType, nControlCount, nRacialType, ASSOCIATE_TYPE_FAMILIAR);
	if(bCompanion) 	nHD += GetControlled(oPC, nControlType, nControlCount, nRacialType, ASSOCIATE_TYPE_ANIMALCOMPANION);
	if(bHenchmen) 	nHD += GetControlled(oPC, nControlType, nControlCount, nRacialType, ASSOCIATE_TYPE_HENCHMAN);
	return nHD;
}

// Will destroy a summoned critter if its summon time expires.
void UnsummonCheck(object oSummon)
{
	if ( GetLocalInt(oSummon, "PRC_summon_permanent") )
	{
		DeleteLocalInt(oSummon, "PRC_summon_duration");
		DeleteLocalInt(oSummon, "PRC_summon_permanent");
		//if(DEBUG_MODE_INVOCATIONS == 1) FloatingTextStringOnCreature( "Summon made permanent, loop check ending", oSummon);		
		return;	// stop calling this function, undead is now permanent.
	}
	
	int nDuration = GetLocalInt(oSummon, "PRC_summon_duration");
	if( nDuration <= 0 )
	{
		// keep the undead from hitting the player.
		effect eParalyze = EffectCutsceneParalyze();
		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalyze, oSummon );
		
		// remove all effect but paralyze since there is not const for cut scene dominate
		effect eLoop = GetFirstEffect(oSummon);
		while( GetIsEffectValid(eLoop) )
		{
			if (GetEffectType(eLoop) != EFFECT_TYPE_CUTSCENE_PARALYZE)	RemoveEffect(oSummon, eLoop);
			eLoop=GetNextEffect(oSummon);
		}
		
		effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
		ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oSummon) );
		//if(DEBUG_MODE_INVOCATIONS == 1) FloatingTextStringOnCreature( "Summon Destroyed.", oSummon);
		DestroyObject(oSummon, 0.2);	
	}
	else
	{
		nDuration -= 6; // probably change to every 60 seconds after testing
		SetLocalInt(oSummon, "PRC_summon_duration", nDuration);
		DelayCommand(6.0, UnsummonCheck(oSummon) );
		//if(DEBUG_MODE_INVOCATIONS == 1) FloatingTextStringOnCreature( "Summon loop running", oSummon);
	}
}

void DisplayDebugInfo(object oPC)
{
	if (DEBUG_MODE_INVOCATIONS == 1)
	{
		FloatingTextStringOnCreature( GetLocalString(oPC, "debug_animate_undead"), oPC, TRUE);
	}
	DeleteLocalString(oPC, "debug_animate_undead");
}

void main()
{
    DelayCommand (1.0, DisplayDebugInfo(OBJECT_SELF) );
    if (!X2PreSpellCastCode())
    {
	    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

    object oSummon;
    object oCaster = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    
    location lLocation = GetSpellTargetLocation();
    string sDebug = "";
    string sTemplate = "";
    string sTag = "animated_undead";
    
    int nCasterLevel = GetCasterLevel(oCaster);
    int nCasterHD = GetHitDice(oCaster);
    int nDuration = nCasterLevel*60;
    
    int nGold = 0;   
    int nMaxSummonLevel = 1;
    int nMinSummonLevel = 1;
    int nSummonLevel = 1;
    int nControlledSummons = GetTotalControlled(oCaster, CONTROL_TYPE_UNDEAD_ANIMATED, CONTROL_COUNT_VALUE);
    int nControlledHD = GetTotalControlled(oCaster, CONTROL_TYPE_UNDEAD_ANIMATED, CONTROL_COUNT_HD);
    int nMaxControllableHD = 4*nCasterHD; // may need to update for Undead Master feat.

    effect eDom = EffectCutsceneDominated();
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
    
    sDebug = " CL: " + IntToString(nCasterLevel);
    sDebug += " HD: " + IntToString(nCasterHD);
    sDebug += " Controlled: " + IntToString(nControlledSummons);
    sDebug += " Controlled HD: " + IntToString(nControlledHD);
    sDebug += " Max Controllable HD: " + IntToString(nMaxControllableHD);
    SetLocalString(oCaster, "debug_animate_undead", sDebug);
    
    if (GetMetaMagicFeat() == METAMAGIC_EXTEND) nDuration = nDuration * 2;	// Metamagic Extend spell Duration is +100%
    
    // change to permanent dominance if applicable, else continue on to summoning
    if( GetIsObjectValid(oTarget) && SUMMON_DURATION == 1 )
    {
    	if( GetTag(oTarget) == sTag && !GetLocalInt(oSummon, "PRC_summon_permanent") )
    	{
    		if(SUMMON_GP_COST > 0)
    		{
    			nGold = 25 * GetHitDice(oTarget);
    			if( HasGold(nGold, oCaster) )
    			{
    				SetLocalInt(oTarget, "PRC_summon_permanent", 1);
    				TakeGoldFromCreature(nGold, oCaster, TRUE);
    				//sDebug = " target is permanently dominated, costing: " + IntToString(nGold);
    				//SetLocalString(oCaster, "debug_animate_undead", sDebug);
    				return;
    			}
    			else
    			{
    				DelayCommand(0.1, FloatingTextStringOnCreature("You do not have enough gold to make this summon permanent.", oCaster) );
    				//sDebug = " not enough gold to make summon permanent.";
    				//SetLocalString(oCaster, "debug_animate_undead", sDebug);
    				return;
    			}
    		}
    		else
    		{
    			SetLocalInt(oTarget, "PRC_summon_permanent", 1);
    			sDebug = " target is permanently dominated, free of charge.";
    			SetLocalString(oCaster, "debug_animate_undead", sDebug);
    			return;
    		}
    	}
    }

    // check number/HD of undead summoned and exit if there are too many.
    if( SUMMON_COUNT_MULTIPLE > 0 && SUMMON_COUNT_MULTIPLE <=  nControlledSummons)
    {
    	DelayCommand(0.2, FloatingTextStringOnCreature("You cannot control anymore undead.", oCaster) );
    	sDebug = " No more undead, summon count+ + nControlledSummons " + IntToString(nControlledSummons) + " too high";
    	SetLocalString(oCaster, "debug_animate_undead", sDebug);
    	return;
    }
    else if( SUMMON_COUNT_MULTIPLE <= 0 && nControlledHD >= nMaxControllableHD)
    {
     	DelayCommand(0.2, FloatingTextStringOnCreature("You cannot control anymore undead.", oCaster) );
     	sDebug = " No more undead, controlled HD (" + IntToString(nControlledHD) + ") too high";
     	SetLocalString(oCaster, "debug_animate_undead", sDebug);
    	return;
    }  
  
    // set min/max summon level based on CL
    if (SUMMON_LEVEL_MIN_CL > 0) nMinSummonLevel = nCasterLevel/SUMMON_LEVEL_MIN_CL;
    if (SUMMON_LEVEL_MAX_CL > 0) nMaxSummonLevel = nCasterLevel/SUMMON_LEVEL_MAX_CL;    

    // set min/max summon level based on HD
    if (SUMMON_LEVEL_MIN_HD > 0) nMinSummonLevel = nCasterHD/SUMMON_LEVEL_MIN_HD;
    if (SUMMON_LEVEL_MAX_HD > 0) nMaxSummonLevel = nCasterHD/SUMMON_LEVEL_MAX_HD;

    // set max summon based on value
    if(SUMMON_LEVEL_MAX_VALUE > 0 && SUMMON_LEVEL_MAX_VALUE < nMaxSummonLevel) nMaxSummonLevel = SUMMON_LEVEL_MAX_VALUE;

    // make sure the undeads HD is within the max controllable HD limit.
    if( (nMaxSummonLevel+nControlledHD) > nMaxControllableHD) nMaxSummonLevel = nMaxControllableHD-nControlledHD;
    if(nMaxSummonLevel < nMinSummonLevel) nMinSummonLevel = nMaxSummonLevel;
    sDebug += " MinL: " + IntToString(nMinSummonLevel);
    sDebug += " MaxL: " + IntToString(nMaxSummonLevel);  
    SetLocalString(oCaster, "debug_animate_undead", sDebug);
    
    // random level from nMinSummonLevel to nMaxLevelSummon
    do { nSummonLevel = Random(nMaxSummonLevel)+1; }
    while (nSummonLevel < nMinSummonLevel);

    sDebug += " SumL: " + IntToString(nSummonLevel);
    SetLocalString(oCaster, "debug_animate_undead", sDebug);

    // check for gold and exit if the player cannot afford it, or remove the gold and continue summon.
    if(SUMMON_DURATION == 2 && SUMMON_GP_COST == 1)
    {
    	nGold = 25 * nSummonLevel;
    	if (HasGold(nGold, oCaster))
    	{
		TakeGoldFromCreature(nGold, oCaster, TRUE);
    	}
    	else
    	{
    		DelayCommand(0.3, FloatingTextStringOnCreature("You do not have enough gold to summon.", oCaster) );
    		return;
    	}
    }
    sDebug += " Gold Cost: " + IntToString(nGold);	 // debug string information
    SetLocalString(oCaster, "debug_animate_undead", sDebug);

    
    if( SUMMON_TYPE == 1 )	 // random undead type.
    {
    	int nSummonType = Random(3) + 1;
    	if(nSummonType == 1) 		sTemplate = "c_skeleton";		// skeleton
    	else if(nSummonType == 2) 	sTemplate = "c_zombie";  		// zombie
    	else if(nSummonType == 3)  	sTemplate = "c_skeletonwarrior";	// skeleton warrior
    }
    else if(SUMMON_TYPE == 0)	// undead by level
    {
     	if(nCasterLevel <6) 				sTemplate = "c_skeleton";		// skeleton
    	else if(nCasterLevel >=6 && nCasterLevel <= 9) 	sTemplate = "c_zombie";  		// zombie
    	else if(nCasterLevel >= 10)  			sTemplate = "c_skeletonwarrior";	// skeleton warrior   
    }    
    //sDebug += " Template: " + sTemplate;	 // debug string information
    //SetLocalString(oCaster, "debug_animate_undead", sDebug);
    
    // summon the creature
    oSummon = CreateObject(OBJECT_TYPE_CREATURE, sTemplate, lLocation, FALSE, sTag);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetSpellTargetLocation());
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDom, oSummon);
    
    // set local value and call recursive function that will eventually destroy the object.
    if(SUMMON_DURATION < 2)	
    {
    	SetLocalInt(oSummon, "PRC_summon_duration", nDuration);    	
    	DelayCommand(0.4, UnsummonCheck(oSummon) );
    }
    
    //sDebug += " Name: " + GetName(oSummon); // debug string information
    sDebug += " StartL: " + IntToString( GetHitDice(oSummon) );
    SetLocalString(oCaster, "debug_animate_undead", sDebug);
    
    // level up creature
    while ( GetHitDice(oSummon) < nSummonLevel )
    { 
    	LevelUpHenchman(oSummon, GetClassByPosition(1, oSummon) ,TRUE, GetLevelUpPackage(oSummon) ); 
    }
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oSummon)), oSummon);
    		
    sDebug += " EndL: " + IntToString(GetHitDice(oSummon) );
    SetLocalString(oCaster, "debug_animate_undead", sDebug);
}