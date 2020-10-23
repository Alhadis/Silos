#include "seed_db_inc"
#include "_SCInclude_Graves"
#include "_CSLCore_Environment"

void CSLEvent_Area_OnEnter()
{
	object oPC = GetEnteringObject();
	object oArea = OBJECT_SELF;
	if( GetIsPC(oPC) || GetIsDMPossessed(oPC) )
	{
		// Code which only runs for PCs goes here.
	}
	else
	{
		// Code which only runs for NPCs goes here.
	}
    
    CSLEnviroAreaEntry( oPC, oArea );
    
    
	/*
	///////////////////////////////////////////////
    //////////// from the HCR events //////////////
    ///////////////////////////////////////////////
	h2_RunObjectEventScripts(H2_AREAEVENT_ON_ENTER, OBJECT_SELF);

	   
    
    */
    
    /*
	///////////////////////////////////////////////
    //////////// from the ALFA events //////////////
    ///////////////////////////////////////////////
    
	object oObject = GetEnteringObject();
	ACR_SpawnOnAreaEnter(oObject);
    if(GetIsPC(oObject) || GetIsDMPossessed(oObject)) {
        // Code which only runs for PCs goes here.
    } else {
        // Code which only runs for NPCs goes here.
    }
    // Code which runs for PCs and NPCs goes here.

    
    */
    
    
    /*
	///////////////////////////////////////////////
    ///////// from the dex module events //////////
    ///////////////////////////////////////////////
    
    //DEBUGGING = GetLocalInt( GetModule(), "DEBUGLEVEL" );
	//
	//object oPC = GetEnteringObject();
	//object oArea = OBJECT_SELF;
	//if(!GetIsPC(oPC))  return;
	//SDB_OnAreaEnter(oArea);
	//DelayCommand( 6.0f, DeleteLocalInt(oPC, "TRANSITION") );
	//CheckAreaSpellsDeactivated(oArea, oPC); // IF AREA HAS THE NO MAGIC FLAG, GIVE PC NO MAGIC EFFECT
	
	///CSLEnviroAreaEntry( oPC, oArea );
	
	DEBUGGING = GetLocalInt( GetModule(), "DEBUGLEVEL" );
   
	object oPC = GetEnteringObject();
	if (GetIsDM(oPC)) return;
	object oArea = OBJECT_SELF;
	if (GetLocalInt(oPC, "TRANSING")) CSLIncrementLocalInt_Timed(oPC, "TRANS", 12.0); //GetPlotFlag(oPC)
	DeleteLocalInt(oPC, "TRANSING"); //   SetPlotFlag(oPC, FALSE);
	
	if (!CSLPCCanEnterArea(oPC, oArea))
	{
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000, DAMAGE_TYPE_MAGICAL), oPC);
		int nMax = GetLocalInt(oArea, "MAXLEVEL");
		PlaySound("vs_favhen4m_no");
		FloatingTextStringOnCreature("You're Too High!", oPC, FALSE);
		SendMessageToPC(oPC, "Bad! " + GetName(oArea) + " is restricted to Levels " + IntToString(nMax) + " and under.");
		AssignCommand(oPC, JumpToObject(GetObjectByTag("dp_return")));
		return;
	}
	
	DoPortInEffect(oPC); // SPECIAL EFFECT ON ENTER WHEN USING PORT STONES
	FloatingTextStringOnCreature(GetFirstName(oPC) + " has loaded " + GetName(OBJECT_SELF), oPC);
	
	string sAreaEnterScript = GetLocalString( oArea, "SCRIPT_AREAONENTER" );
	if ( 1 == 2 && sAreaEnterScript != "" )
	{ // tg_areamod_onenter_underwater
		SendMessageToPC( oPC, "Running on loaded "+sAreaEnterScript );
		DelayCommand( 0.1f, ExecuteScript( sAreaEnterScript, oPC ) );
	}
    
    */
    
}

// Fires after OnEnter, when the client finishes loading the area
void CSLEvent_Area_OnClientEnter()
{
	object oObject = GetEnteringObject();
	    
	/*
	///////////////////////////////////////////////
    //////////// from the HCR events //////////////
    ///////////////////////////////////////////////
    
	int playercount = GetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA);
    SetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA, playercount + 1);    
    h2_RunObjectEventScripts(H2_AREAEVENT_ON_CLIENT_ENTER, OBJECT_SELF);

	
    */
    
    /*
	///////////////////////////////////////////////
    //////////// from the ALFA events //////////////
    ///////////////////////////////////////////////
    
    // Fires after OnEnter, when the client finishes loading the area, it seems.
	object oObject = GetEnteringObject();

	if(GetIsPC(oObject) || GetIsDMPossessed(oObject)) {
        // Code which only runs for PCs goes here.
	    SendMessageToPC(oObject, "Entering area "+GetName(OBJECT_SELF));
		ACR_PCSave(oObject, FALSE);
    } else {
        // Code which only runs for NPCs goes here.
    }
    
    
    */
    
    
    /*
	///////////////////////////////////////////////
    ///////// from the dex module events //////////
    ///////////////////////////////////////////////
    
    
    
    */
	
}

void CSLEvent_Area_OnExit()
{
	object oPC = GetExitingObject();
	object oArea = OBJECT_SELF;
	if( GetIsPC(oPC) || GetIsDMPossessed(oPC) )
	{
		// Code which only runs for PCs goes here.
	}
	else
	{
		// Code which only runs for NPCs goes here.
	}
    
    CSLEnviroAreaExit( oPC, oArea );
    
    
	/*
	///////////////////////////////////////////////
    //////////// from the HCR events //////////////
    ///////////////////////////////////////////////
	if (GetIsPC(GetExitingObject()))
    {
        int playercount = GetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA);
        SetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA, playercount - 1);
    }
    h2_RunObjectEventScripts(H2_AREAEVENT_ON_EXIT, OBJECT_SELF);

	   
    
    */
    
    /*
	///////////////////////////////////////////////
    //////////// from the ALFA events //////////////
    ///////////////////////////////////////////////
    
    object oObject = GetExitingObject();
    if(GetIsPC(oObject) || GetIsDMPossessed(oObject)) {
         ACR_SpawnOnAreaExit(oObject);
        // Code which only runs for PCs goes here.
    } else {
        // Code which only runs for NPCs goes here.
    }
    // Code which runs for PCs and NPCs goes here.
    
    
    */
    
    
    /*
	///////////////////////////////////////////////
    ///////// from the dex module events //////////
    ///////////////////////////////////////////////
    
	DEBUGGING = GetLocalInt( GetModule(), "DEBUGLEVEL" );
	
	object oPC = GetExitingObject();
	object oArea = OBJECT_SELF;
	if (!GetIsPC(oPC)) return;
	
	SetLocalInt( oPC, "TRANSITION", TRUE );
	ClearAreaSpellsDeactivated(oArea, oPC); // IF AREA HAS NO SPELLS FLAG, REMOVE THE EFFECT FROM PC
	
	CSLEnviroAreaExit( oPC, oArea );
    
    */
}

void CSLEvent_Area_OnHeartbeat()
{

    
	/*
	///////////////////////////////////////////////
    //////////// from the HCR events //////////////
    ///////////////////////////////////////////////

    h2_RunObjectEventScripts(H2_AREAEVENT_ON_HEARTBEAT, OBJECT_SELF);    
	   
    
    */
    
    /*
	///////////////////////////////////////////////
    //////////// from the ALFA events //////////////
    ///////////////////////////////////////////////
    
    
    
    */
    
    
    /*
	///////////////////////////////////////////////
    ///////// from the dex module events //////////
    ///////////////////////////////////////////////
    
    
    
    */
}

void CSLEvent_Area_OnUserDefined()
{

    
    /*
	///////////////////////////////////////////////
    //////////// from the HCR events //////////////
    ///////////////////////////////////////////////
    
	h2_RunObjectEventScripts(H2_AREAEVENT_ON_USER_DEFINED, OBJECT_SELF);
    
    */
    
    /*
	///////////////////////////////////////////////
    //////////// from the ALFA events //////////////
    ///////////////////////////////////////////////
    
	    
    */
    
    
    /*
	///////////////////////////////////////////////
    ///////// from the dex module events //////////
    ///////////////////////////////////////////////
    

        
    
    */
}

// alfa inspired, look at how this works, basically a newly created event
void CSLEvent_Area_OnAreaTransitionClick()
{
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);
    object oTargetArea = GetArea(oTarget);

	if (GetIsPC(oClicker))
	{
		// NPCs don't need AT warnings/feedback
		// this function handles transitioning as well.
		/// ACR_CheckAT(oClicker);
		AssignCommand(oClicker,JumpToObject(oTarget));
	}
	else
	{
		AssignCommand(oClicker,JumpToObject(oTarget));
	}
	// Set the AT screen randomly.
	//SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    
    
	/*
	///////////////////////////////////////////////
    //////////// from the HCR events //////////////
    ///////////////////////////////////////////////
    
	   
    
    */
    
    /*
	///////////////////////////////////////////////
    //////////// from the ALFA events //////////////
    ///////////////////////////////////////////////

    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);
    object oTargetArea = GetArea(oTarget);

	if (GetIsPC(oClicker)) {
		// NPCs don't need AT warnings/feedback
		// this function handles transitioning as well.
		ACR_CheckAT(oClicker);
	} else {
		AssignCommand(oClicker,JumpToObject(oTarget));
	}
    // Set the AT screen randomly.
    //SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    
    
    
    
    */
    
    
    /*
	///////////////////////////////////////////////
    ///////// from the dex module events //////////
    ///////////////////////////////////////////////
    
    
    
    */
}