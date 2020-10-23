//::///////////////////////////////////////////////////////////////////////////
//::
//::	3430_cs_enter.nss
//::
//::	Controller for 3430_enter Inner Sanctum entrance cutscene
//::
//::///////////////////////////////////////////////////////////////////////////
//::
//::	Created by: Ben Ma
//::	Created on: 10/20/05
//::
//::///////////////////////////////////////////////////////////////////////////
// BMA-OEI 2/24/06 ScriptHidden update
// ChazM 5/4/06 swapped out ginc_trasport for x0_i0_transport
// CGaw 8/28/06 Several new functions and modifications for cutscene polish.

//#include "ginc_actions"
#include "ginc_companions"
//#include "ginc_object"
#include "ginc_group"
//#include "ginc_debug"
#include "x0_i0_transport"
#include "inc_3430_const"
#include "ginc_ai"

// Helper functions
void AddRosterMemberToTraitors( string sRosterName )
{
	object oTraitor = GetObjectFromRosterName( sRosterName );
	if ( GetIsObjectValid(oTraitor) == FALSE ) return;
	
	object oPC = GetFirstPC();
	RemoveRosterMemberFromParty( sRosterName, oPC, FALSE );
	//SetCreatureScriptsToSet(oTraitor, 9);
	GroupAddMember( GROUP_TRAITORS, oTraitor, TRUE );
}

// Cutscene functions
void PlayCustomLoopingAnimation(object oObject, string sAnimationName)
{
	PlayCustomAnimation(oObject, sAnimationName, 1);
}

void PlayCustomOneShotAnimation(object oObject, string sAnimationName)
{
	PlayCustomAnimation(oObject, sAnimationName, 0);
}

void SetupGroupPCParty()
{
	object oPC = GetPCSpeaker();
	RemoveRosterMemberFromParty( TAG_NEESHKA, oPC, FALSE );
	RemoveRosterMemberFromParty( TAG_BISHOP, oPC, FALSE );

	ResetGroup( GROUP_PC );
	GroupAddFaction( GROUP_PC, oPC, GROUP_LEADER_FIRST, TRUE );
	GroupSetBMAFormation( GROUP_PC );
	GroupSetNoise( GROUP_PC, 0.0f, 10.0f, 0.2f );	
}

void SetupTraitorsGroup()
{	
	ResetGroup( GROUP_TRAITORS );
	SetGlobalInt( BETRAYAL_NEESHKA, 1 );
	SetGlobalInt( BETRAYAL_BISHOP, 1 );
	SetGlobalInt( BETRAYAL_QARA, 0 );
	SetGlobalInt( BETRAYAL_SAND, 1 );
	SetGlobalInt( BETRAYAL_CONSTRUCT, 0 );
}

void JumpGroupPCPartyToEntrance()
{
	//GroupJumpToWP( GROUP_PC, WP_GATHER1 );
//	GroupJumpToWP( GROUP_PC, WP_ENTER_START );
	//AssignCommand( GetPCSpeaker(), JumpToObject(GetWaypointByTag(WP_ENTER_START)) );
//	ClearActionsAndJumpToTag( TAG_NEESHKA, WP_NEESHKA );
	ClearActionsAndJumpToTag( TAG_NEESHKA, "3430_wp_neeshka_start" );
	ClearActionsAndJumpToTag( TAG_BISHOP, WP_BISHOP );	
}

void ShowSGolems()
{
	object oBGolem1 = GetTarget("34_shadow_golem1");
	object oBGolem2 = GetTarget("34_shadow_golem2");
	DelayCommand(0.25f, SetScriptHidden(oBGolem1, FALSE));
	DelayCommand(0.25f, SetScriptHidden(oBGolem2, FALSE));
}

void ShowGarius()
{
	effect eExplosion = EffectNWN2SpecialEffectFile("fx_magical_explosion.sef");
	effect eBolt = EffectNWN2SpecialEffectFile("sp_call_lightning.sef");

	object oGarius = GetObjectByTag(TAG_GARIUS);
	location lGarius = GetLocation(oGarius);
	ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBolt, lGarius);
	DelayCommand(0.25f, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplosion, lGarius));

	DelayCommand(0.25f, SetScriptHidden(oGarius, FALSE));
}

void ShowBishop()
{
	object oBishop = GetObjectByTag(TAG_BISHOP);
	SetScriptHidden(oBishop, FALSE);
}

void NeeshkaSitsOnFloor()
{
	object oNeeshka = GetObjectByTag(TAG_NEESHKA);
	PlayCustomLoopingAnimation(oNeeshka, "kneelclutchloop");
//	PlayCustomAnimation( oNeeshka, ANIM_34_NEESHKA_SIT, 1 );
}

void EntranceDoorsOpen()
{
	object oDoor = GetObjectByTag( TAG_SANCTUM_DOORS );
	AssignCommand( oDoor, ActionOpenDoor( oDoor ) );
}

void CameraPanToNeeshka()
{
	object oCam = GetObjectByTag( CAM_PAN_ENTRANCE );
	object oWP = GetWaypointByTag( WP_CAM_PAN_ENTRANCE );
	AssignCommand( oCam, ActionMoveToObject( oWP, TRUE ) );
}

void EntranceDoorsClose()
{
	object oDoor = GetObjectByTag( TAG_SANCTUM_DOORS );
	AssignCommand( oDoor, ActionCloseDoor( oDoor ) );
}

void PCRunsToNeeshka()
{
	object oPC = GetPCSpeaker();
	object oWP = GetObjectByTag(WP_THELINE);
	object oNeeshka = GetObjectByTag(TAG_NEESHKA);
	vector vNeeshka = GetPosition(oNeeshka);
	
	ActionPauseCutscene(5000);
	AssignCutsceneActionToObject(oPC, ActionWait(1.0f));
	AssignCutsceneActionToObject(oPC, ActionForceMoveToObject(oWP, TRUE));
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(vNeeshka)));
}

void StopSitting( object oNeeshka )
{
	//PlayCustomAnimation( oNeeshka, "%", 1 );
	//AssignCommand( oNeeshka, ClearAllActions() );
}

void NeeshkaFacesPC()
{
	object oNeeshka = GetObjectByTag( TAG_NEESHKA );
	object oPC = GetPCSpeaker();
	//vector vPC = GetPosition( oPC );
	object oWP = GetWaypointByTag( WP_NEESHKA2 );
	vector vPC = GetPosition( oWP );

	ActionPauseCutscene( 5000 );
	AssignCutsceneActionToObject( oNeeshka, ActionWait(1.3f) );
	AssignCutsceneActionToObject( oNeeshka, ActionDoCommand(StopSitting(oNeeshka)) );	
	AssignCutsceneActionToObject( oNeeshka, ActionWait(0.7f) );
	AssignCutsceneActionToObject( oNeeshka, SetFacingPoint(vPC) );
	AssignCutsceneActionToObject( oNeeshka, ActionWait(0.5f) );
	AssignCutsceneActionToObject( oNeeshka, ActionMoveToObject(oWP) );
}

void NeeshkaStands()
{
	object oNeeshka = GetObjectByTag( TAG_NEESHKA );

	DelayCommand(1.5f, PlayCustomOneShotAnimation(oNeeshka, "%"));
}

void NeeshkaMovesToPC()
{
	object oNeeshka = GetObjectByTag( TAG_NEESHKA );
	object oPC = GetPCSpeaker();
	//vector vPC = GetPosition( oPC );
	object oWP = GetWaypointByTag( WP_NEESHKA2 );
	vector vPC = GetPosition( oWP );

	AssignCommand(oNeeshka, ActionMoveToObject(oWP));
}

void GroupPCPartyRunsToNeeshka()
{
	GroupClearAllActions( GROUP_PC );
	GroupJumpToWP( GROUP_PC, WP_THELINE );
	GroupActionOrientToTag(GROUP_PC, TAG_NEESHKA, ORIENT_FACE_TARGET, TRUE);

	object oPC = GetPCSpeaker();
	object oWP = GetWaypointByTag( WP_THELINE );
	AssignCommand( oPC, ClearAllActions() );
	AssignCommand( oPC, JumpToObject(oWP) );
}

void NeeshkaWalksToPC()
{
	// Do nothing. PC Party approaches Neeshka instead.
}

void NeeshkaLimpsToPC()
{
	// Do nothing. PC Party approaches Neeshka instead.
}

void JumpZhjaeveToNeeshka()
{
	object oZhjaeve = GetObjectByTag( TAG_ZHJAEVE );
	object oWP = GetWaypointByTag( WP_ZHJAEVE );

	AssignCommand( oZhjaeve, JumpToObject( oWP ) );
}

void ZhjaeveHealsNeeshka()
{
	object oZhjaeve = GetObjectByTag( TAG_ZHJAEVE );
	object oNeeshka = GetObjectByTag( TAG_NEESHKA );
	
	AssignCommand( oZhjaeve, ActionCastFakeSpellAtObject( SPELL_CURE_CRITICAL_WOUNDS, oNeeshka ) );
}

void NeeshkaJumpsToWP3()
{
	object oNeeshka = GetObjectByTag( TAG_NEESHKA );
	object oWP = GetWaypointByTag( WP_NEESHKA3 );

	AssignCommand( oNeeshka, JumpToObject( oWP ) );	
}


void GariusWalksToPC()
{
	object oGarius = GetObjectByTag(TAG_GARIUS);
//	object oWP = GetObjectByTag(WP_GARIUS);
	object oWP2 = GetObjectByTag(WP_TRAITORS);

	object oNeeshka = GetObjectByTag(TAG_NEESHKA);
	AssignCommand(oNeeshka, ActionOrientToObject(oGarius));
	GroupActionOrientToTag(GROUP_PC, TAG_GARIUS, ORIENT_FACE_TARGET, TRUE);

	AssignCommand(oGarius, ClearAllActions());
	AssignCommand(oGarius, ActionForceMoveToObject(oWP2, FALSE, 4.5f));
}

void QaraAndSandPose()
{
	ClearActionsAndJumpToTag(TAG_QARA, WP_QARA);
	ClearActionsAndJumpToTag(TAG_SAND, WP_SAND);
}

void BishopStandsByGarius()
{
	object oPC = GetPCSpeaker();
	object oBishop = GetObjectByTag(TAG_BISHOP);
	object oWP = GetObjectByTag(WP_TRAITOR1);

	AssignCommand(oBishop, ActionForceMoveToObject(oWP, FALSE, 5.0f));
	AssignCommand(oBishop, ActionOrientToObject(oPC));
}

void BishopLeaves()
{
	object oBishop = GetObjectByTag(TAG_BISHOP);
	object oWP = GetObjectByTag(WP_EXIT);

	AssignCommand(oBishop, ActionForceMoveToObject(oWP, FALSE, 5.0f));
	DelayCommand(6.0f, AssignCommand(oBishop, ActionDoCommand(SetScriptHidden(oBishop, TRUE))));
}

void PCPartyLinesUpForBattle()
{
	GroupSetLineFormation(GROUP_PC);
	GroupJumpToWP(GROUP_PC, WP_THELINE);
}

void NeeshkaStandsByGarius()
{
	object oPC = GetPCSpeaker();
	object oNeeshka = GetObjectByTag( TAG_NEESHKA );
	object oWP = GetObjectByTag( WP_TRAITOR4 );

	AssignCommand( oNeeshka, ClearAllActions() );
//	AssignCommand( oNeeshka, JumpToObject(oWP) );
	AssignCommand( oNeeshka, ActionForceMoveToObject(oWP, FALSE) );
	DelayCommand(2.0f, AssignCommand( oNeeshka, ActionOrientToObject(oPC) ));
}

void NeeshkaStartsTowardGarius()
{
	object oNeeshka = GetObjectByTag( TAG_NEESHKA );
	object oWP = GetObjectByTag( WP_HALFWAY );
	object oPC = GetPCSpeaker();
	vector vPC = GetPosition(oPC);

	AssignCommand( oNeeshka, ActionMoveToObject(oWP) );
	AssignCommand( oNeeshka, ActionWait(1.0f) );
	AssignCommand( oNeeshka, ActionDoCommand(SetFacingPoint(vPC)) );
	AssignCommand( oNeeshka, ActionWait(1.0f) );
}

void NeeshkaRunsToPCSide()
{
	object oPC = GetPCSpeaker();
	object oNeeshka = GetObjectByTag(TAG_NEESHKA);
	object oWP = GetObjectByTag(WP_PCSIDE);
	object oGarius = GetObjectByTag(TAG_GARIUS);

	AssignCommand( oNeeshka, ClearAllActions() );
//	AssignCommand( oNeeshka, JumpToObject(oWP) );
	AssignCommand( oNeeshka, ActionForceMoveToObject(oWP, FALSE) );
	AssignCommand( oNeeshka, ActionOrientToObject(oGarius) );
	AddRosterMemberByCharacter(TAG_NEESHKA, oNeeshka);
	AddRosterMemberToParty(TAG_NEESHKA, oPC);
}

void BishopRunsToPCSide()
{
	object oPC = GetPCSpeaker();
	object oBishop = GetObjectByTag(TAG_BISHOP);
	object oWP = GetObjectByTag(WP_PCSIDE);
	object oGarius = GetObjectByTag(TAG_GARIUS);

	AssignCommand( oBishop, ClearAllActions() );
//	AssignCommand( oBishop, JumpToObject(oWP) );
	AssignCommand( oBishop, ActionForceMoveToObject(oWP, FALSE) );
	AssignCommand( oBishop, ActionOrientToObject(oGarius) );
	AddRosterMemberByCharacter(TAG_BISHOP, oBishop);
	AddRosterMemberToParty(TAG_BISHOP, oPC);
}

void BishopRunsToGarius()
{
	object oBishop = GetObjectByTag(TAG_BISHOP);
	object oGarius = GetObjectByTag(TAG_GARIUS);
	object oWP = GetObjectByTag( WP_HALFWAY );
	object oPC = GetPCSpeaker();
	vector vPC = GetPosition(oPC);
	vector vGa = GetPosition(oGarius);

	AssignCommand( oBishop, ActionEquipMostDamagingMelee());
	AssignCommand( oBishop, ActionMoveToObject(oWP) );
	AssignCommand( oBishop, ActionWait(1.0f) );
	AssignCommand( oBishop, ActionDoCommand(SetFacingPoint(vPC)) );
	AssignCommand( oBishop, ActionWait(1.0f) );
	AssignCommand( oBishop, ActionDoCommand(SetFacingPoint(vGa)) );
}


void SandStandsByGarius()
{	
	object oPC = GetPCSpeaker();
	object oSand = GetObjectByTag(TAG_SAND);
	object oWP = GetObjectByTag(WP_TRAITOR2);

	AssignCommand( oSand, ClearAllActions() );
//	AssignCommand( oSand, JumpToObject(oWP) );
	AssignCommand( oSand, ActionForceMoveToObject(oWP, FALSE) );
	DelayCommand(3.0f, AssignCommand( oSand, ActionOrientToObject(oPC) ));
}

void QaraStandsByGarius()
{
	object oPC = GetPCSpeaker();
	object oQara = GetObjectByTag(TAG_QARA);
	object oWP = GetObjectByTag(WP_TRAITOR2);

	AssignCommand( oQara, ClearAllActions() );
//	AssignCommand( oQara, JumpToObject(oWP) );
	AssignCommand( oQara, ActionForceMoveToObject(oWP, FALSE) );
	DelayCommand(4.0f, AssignCommand( oQara, ActionOrientToObject(oPC) ));
}

void ConstructStartsTowardBishop()
{
	object oConstruct = GetObjectByTag(TAG_CONSTRUCT);
	object oWP = GetObjectByTag(TAG_BISHOP);

	AssignCommand(oConstruct, ActionForceMoveToObject(oWP, FALSE, 1.0f));
}

void ConstructStrikesGrobnar()
{
	//PrettyDebug("TODO: play scary animation");
}

void ConstructStandsByBishop()
{
	object oPC = GetPCSpeaker();
	object oConstruct = GetObjectByTag(TAG_CONSTRUCT);
	object oWP = GetObjectByTag(WP_TRAITOR3);

	AssignCommand( oConstruct, ClearAllActions() );
//	AssignCommand( oConstruct, JumpToObject(oWP) );
	AssignCommand( oConstruct, ActionForceMoveToObject(oWP, FALSE) );
	AssignCommand( oConstruct, ActionOrientToObject(oPC) );
}

void GrobnarStandsByPC()
{
	object oGarius = GetObjectByTag(TAG_GARIUS);
	object oGrobnar = GetObjectByTag(TAG_GROBNAR);
	object oWP = GetObjectByTag(WP_ZHJAEVE);

	AssignCommand( oGrobnar, ClearAllActions() );
	AssignCommand( oGrobnar, JumpToObject(oWP) );
	AssignCommand( oGrobnar, ActionOrientToObject(oGarius) );
}

void ConstructStrikesBishop()
{
	object oGarius = GetObjectByTag(TAG_GARIUS);
	object oConstruct = GetObjectByTag(TAG_CONSTRUCT);
	object oWP = GetObjectByTag(TAG_GROBNAR);

	AssignCommand(oConstruct, ActionForceMoveToObject(oWP, FALSE, 1.5f));
	AssignCommand(oConstruct, ActionOrientToObject(oGarius));
}

void BishopReturnsToGarius()
{
	object oPC = GetPCSpeaker();
	object oBishop = GetObjectByTag(TAG_BISHOP);
	object oWP = GetObjectByTag(WP_TRAITOR1);
	
	AssignCommand( oBishop, ClearAllActions() );
	AssignCommand( oBishop, JumpToObject(oWP) );
	AssignCommand( oBishop, ActionOrientToObject(oPC) );
}

void SetPartyFacing()
{
	object oGarius = GetTarget(TAG_GARIUS);
	vector vGarius = GetPosition(oGarius);
	object oPC = GetPCSpeaker();
	object oPartyMember = GetFirstFactionMember(oPC, FALSE);
	
	while (GetIsObjectValid(oPartyMember) == TRUE)
	{
		SetFacingPoint(vGarius, TRUE);
		oPartyMember = GetNextFactionMember(oPC, FALSE);
	}
}

void GariusMuttersIncantation()
{
	object oGarius = GetObjectByTag(TAG_GARIUS);
		
	ActionPauseCutscene(4000);
	AssignCutsceneActionToObject(oGarius, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
	AssignCutsceneActionToObject(oGarius, ActionWait(2.0f));
}

void PortalBarrierAppears()
{
	object oVFX = GetObjectByTag( PORTAL_VFX_TAG );
	effect eVFX = EffectNWN2SpecialEffectFile( PORTAL_VFX_MEDIUM, oVFX );
	effect eExplosion = EffectNWN2SpecialEffectFile("fx_magical_explosion");
	effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
	location lPC = GetLocation(GetPCSpeaker());
	
	ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, lPC);
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplosion, oVFX);
	ApplyEffectToObject( DURATION_TYPE_PERMANENT, eVFX, oVFX );
	SoundObjectPlay( GetObjectByTag( "snd_portal_hum" ) );
}

void AddTraitorsToTraitorGroup()
{
	object oGarius = GetObjectByTag(TAG_GARIUS);
	GroupAddMember(GROUP_TRAITORS, oGarius, TRUE);
	
	object oBGolem1 = GetTarget("34_shadow_golem1");
	object oBGolem2 = GetTarget("34_shadow_golem2");
	
	GroupAddMember(GROUP_TRAITORS, oBGolem1, FALSE);
	GroupAddMember(GROUP_TRAITORS, oBGolem2, FALSE);
	
	// Calculate average PC XP
	int nAverageXP = 0;
	int nNumPCs = 0;
	object oPC = GetFirstPC();
	while ( GetIsObjectValid( oPC ) == TRUE )
	{
		nNumPCs = nNumPCs + 1;
		nAverageXP = nAverageXP + GetXP( oPC );
		oPC = GetNextPC();
	}
	nAverageXP = nAverageXP / nNumPCs;
	
	if (GetGlobalInt(BETRAYAL_NEESHKA) == 1)
	{
		SetIsRosterMemberCampaignNPC( TAG_NEESHKA, TRUE );
		AddRosterMemberToTraitors( TAG_NEESHKA );
		ResetCreatureLevelForXP( GetObjectByTag( TAG_NEESHKA ), nAverageXP, TRUE );	
		ForceRest(GetTarget(TAG_NEESHKA));
	}

	if (GetGlobalInt(BETRAYAL_BISHOP) == 1)
	{
		SetIsRosterMemberCampaignNPC( TAG_BISHOP, TRUE );
		AddRosterMemberToTraitors( TAG_BISHOP );	
		ResetCreatureLevelForXP( GetObjectByTag( TAG_BISHOP ), nAverageXP, TRUE );	
		ForceRest(GetTarget(TAG_BISHOP));
	}

	if (GetGlobalInt(BETRAYAL_QARA) == 1)
	{
		SetIsRosterMemberCampaignNPC( TAG_QARA, TRUE );
		AddRosterMemberToTraitors( TAG_QARA );	
		ResetCreatureLevelForXP( GetObjectByTag( TAG_QARA ), nAverageXP, TRUE );
		ForceRest(GetTarget(TAG_QARA));	
	}
	else
	{
		SetIsRosterMemberCampaignNPC( TAG_SAND, TRUE );
		AddRosterMemberToTraitors( TAG_SAND );	
		ResetCreatureLevelForXP( GetObjectByTag( TAG_SAND ), nAverageXP, TRUE );
		ForceRest(GetTarget(TAG_SAND));	
	}

	if (GetGlobalInt(BETRAYAL_CONSTRUCT) == 1)
	{
		SetIsRosterMemberCampaignNPC( TAG_CONSTRUCT, TRUE );
		AddRosterMemberToTraitors( TAG_CONSTRUCT );	
		ResetCreatureLevelForXP( GetObjectByTag( TAG_CONSTRUCT ), nAverageXP, TRUE );
		ForceRest(GetTarget(TAG_CONSTRUCT));	
	}
}

void SetupTraitorsDeathScript()
{
	GroupOnDeathBeginConversation( GROUP_TRAITORS, "3430_p_speaker", "3430_traitors_end" );
//	GroupSetIsDestroyable( GROUP_TRAITORS, FALSE, FALSE, TRUE );
}

void SetupTraitorsHostileAI()
{
	// TODO: Swap heartbeat scripts ???
	// TODO: Fix AI of Companions? Add remaining PCs to party?
		
	object oMember = GetFirstInGroup(GROUP_TRAITORS);
	object oGarius = GetTarget(TAG_GARIUS);
	object oSand = GetTarget(TAG_SAND);
	object oQara = GetTarget(TAG_QARA);
	object oNeeshka = GetTarget(TAG_NEESHKA);
	object oConstruct = GetTarget(TAG_CONSTRUCT);
	object oBishop = GetTarget(TAG_BISHOP);
	
	effect eImmobilize = EffectCutsceneImmobilize();

	while (GetIsObjectValid(oMember))
	{
		if (oMember != oGarius)
		{
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, eImmobilize, oMember);
			
			if (oMember == oSand || oMember == oQara)
			{
				AssignCommand(oMember, SetAssociateState(NW_ASC_DISARM_TRAPS, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_PUPPET, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_STAND_GROUND, FALSE));
				//AssignCommand(oMember, SetAssociateState(NW_ASC_POWER_CASTING, FALSE));
				//AssignCommand(oMember, SetAssociateState(NW_ASC_SCALED_CASTING, FALSE));
				//AssignCommand(oMember, SetAssociateState(NW_ASC_OVERKIll_CASTING, TRUE));
				SetLocalInt(oMember, "X2_L_BEH_MAGIC", 100);
			}
			
			if (oMember == oNeeshka || oMember == oBishop)
			{
				AssignCommand(oMember, SetAssociateState(NW_ASC_DISARM_TRAPS, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_PUPPET, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_STAND_GROUND, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_POWER_CASTING, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_SCALED_CASTING, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_USE_RANGED_WEAPON, TRUE));
			}		
			
			if (oMember == oConstruct)
			{
				AssignCommand(oMember, SetAssociateState(NW_ASC_DISARM_TRAPS, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_PUPPET, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_MODE_STAND_GROUND, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_POWER_CASTING, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_SCALED_CASTING, FALSE));
				AssignCommand(oMember, SetAssociateState(NW_ASC_USE_RANGED_WEAPON, FALSE));
			}		
//			AIMakeProtector(oMember, oGarius);
//			AIFinitePursuit(oMember, 6.0f);
		}
		
		oMember = GetNextInGroup(GROUP_TRAITORS);
	}
}	

void TraitorsTurnHostile()
{
	// BMA-OEI 9/26/06: Setup Traitors for combat - not destroyable, lootable, hostile
	object oTraitor = GetFirstInGroup( GROUP_TRAITORS );
	while ( GetIsObjectValid( oTraitor ) == TRUE )
	{
		AssignCommand( oTraitor, SetIsDestroyable( FALSE, FALSE, TRUE ) );
		SetLootable( oTraitor, TRUE );
		SetImmortal( oTraitor, FALSE );
		SetPlotFlag( oTraitor, FALSE );
		ChangeToStandardFaction( oTraitor, STANDARD_FACTION_HOSTILE );
		oTraitor = GetNextInGroup( GROUP_TRAITORS );
	}
	//GroupSetIsDestroyable( GROUP_TRAITORS, FALSE, FALSE, TRUE );
	//GroupChangeToStandardFaction( GROUP_TRAITORS, STANDARD_FACTION_HOSTILE );
	//GroupSetImmortal( GROUP_TRAITORS, FALSE );
	//GroupSetPlotFlag( GROUP_TRAITORS, FALSE );
	
	if (GetGlobalInt(BETRAYAL_BISHOP) == 1)
	{
		object oBishop = GetObjectByTag( "bishop" );
		SetScriptHidden( oBishop, FALSE );
	}
}

/*void CreateDemon( location lLoc )
{
	object oDemon = CreateObject( OBJECT_TYPE_CREATURE, "c_summ_devilhorn", lLoc );
	GroupAddMember( GROUP_TRAITORS, oDemon );
	GroupOnDeathBeginConversation( GROUP_TRAITORS, "3430_p_speaker", "3430_traitors_end" );
}*/

void GateDemons()
{
	location lWP;
    effect eSummon;
    effect eVis = EffectVisualEffect( VFX_INVOCATION_BRIMSTONE_DOOM ); //VFX_DUR_GATE );
	
	int n = 1;
	object oWP = GetNearestObjectByTag( WP_DEMON_SPAWN, OBJECT_SELF, n );	
	//while ( GetIsObjectValid(oWP) == TRUE )
	//{
		lWP = GetLocation( oWP );
        eSummon = EffectSummonCreature( "c_summ_devilhorn", VFX_INVOCATION_BRIMSTONE_DOOM,  1.0f );
        //float fSeconds = RoundsToSeconds(nDuration);
		//DelayCommand( 1.0f, CreateDemon( lWP ) );
        ApplyEffectAtLocation( DURATION_TYPE_PERMANENT, eSummon, lWP );//, fSeconds));
		ApplyEffectAtLocation ( DURATION_TYPE_TEMPORARY, eVis, lWP, 3.0f );
		
	//	n = n + 1;
	//	oWP = GetNearestObjectByTag( WP_DEMON_SPAWN, OBJECT_SELF, n );
	//}
}

void SetupPCPartyForBattle()
{
	object oPC = GetPCSpeaker();

	ResetGroup( GROUP_PC );
	GroupAddFaction( GROUP_PC, oPC, GROUP_LEADER_FIRST, TRUE );
	GroupSetBMAFormation( GROUP_PC );
	GroupSetNoise( GROUP_PC, 0.0f, 10.0f, 0.2f );
	GroupJumpToWP( GROUP_PC, WP_THELINE );
}

void TraitorsAttack()
{
	object oModule = GetModule();
	object oPC = GetPCSpeaker();
	GroupDetermineCombatRound(GROUP_TRAITORS);
	SetLocalInt(oModule, "GariusFightStarted", 1);
//	object oGarius = GetObjectByTag( TAG_GARIUS );
//	effect eSRI = EffectSpellResistanceIncrease( 20 );
//	ApplyEffectToObject( DURATION_TYPE_PERMANENT, eSRI, oGarius );
//	effect eIC = EffectImmunity( IMMUNITY_TYPE_CRITICAL_HIT );
//	ApplyEffectToObject( DURATION_TYPE_PERMANENT, eIC, oGarius );
	
	//AssignCommand( oGarius, ClearAllActions(TRUE) );
	//AssignCommand( oGarius, ActionCastSpellAtObject( SPELL_IRON_BODY, oGarius, METAMAGIC_ANY, TRUE ));
	//AssignCommand( oGarius, ActionCastSpellAtObject( SPELL_MASS_HASTE, oGarius, METAMAGIC_ANY, TRUE ));
	//AssignCommand( oGarius, GateDemons() ); 
}

void CreateForceWall()
{
	object oWP1 = GetTarget("3430_wp_ffield1");
	object oWP2 = GetTarget("3430_wp_ffield2");
	object oWP3 = GetTarget("3430_wp_ffield3");
	location lBarrier1 = GetLocation(oWP1);
	location lBarrier2 = GetLocation(oWP2);
	location lBarrier3 = GetLocation(oWP3);
	string sCBoxRR1 = "3430_cbox_wall1";
	string sCBoxRR2 = "3430_cbox_wall2";
	string sCBoxRR3 = "3430_cbox_wall3";
	string sWallEffectRR = "fx_garius_ffield3";
	effect eWall1 = EffectNWN2SpecialEffectFile("fx_garius_ffield1.sef");
	effect eWall2 = EffectNWN2SpecialEffectFile("fx_garius_ffield2.sef");
	effect eWall3 = EffectNWN2SpecialEffectFile("fx_garius_ffield3.sef");
	object oBarrier1;
	object oBarrier2;
	object oBarrier3;
	effect eExplosion = EffectNWN2SpecialEffectFile("fx_garius_ritual.sef");
	effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
	
	oBarrier1 = CreateObject(OBJECT_TYPE_PLACEABLE, sCBoxRR1, lBarrier1);
	DelayCommand(0.2f, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplosion, lBarrier3));
	DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWall1, oBarrier1));
	oBarrier2 = CreateObject(OBJECT_TYPE_PLACEABLE, sCBoxRR2, lBarrier2);
//	DelayCommand(0.2f, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplosion, lBarrier2));
	DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWall2, oBarrier2));
	oBarrier3 = CreateObject(OBJECT_TYPE_PLACEABLE, sCBoxRR3, lBarrier3);
//	DelayCommand(0.2f, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplosion, lBarrier3));
	DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWall3, oBarrier3));
//	CreateObject(OBJECT_TYPE_PLACED_EFFECT, sWallEffectRR, lBarrier);
}

void CreateBalor()
{
	object oWP = GetTarget("3430_wp_balor");
	location lLocation = GetLocation(oWP);
	
	CreateObject(OBJECT_TYPE_CREATURE, "garius_balor", lLocation);
}	

void SummonBalor()
{
	object oWP = GetTarget("3430_wp_balor");
	location lLocation = GetLocation(oWP);
	
    //Declare major variables
    int nDuration = 23;
    effect eSummon;
	effect eGate = EffectNWN2SpecialEffectFile("sp_gate.sef");
	effect ePortal = EffectNWN2SpecialEffectFile("fx_portal_gen1.sef");
    effect eVis = EffectVisualEffect( VFX_DUR_GATE );
	effect eVis2 = EffectVisualEffect( VFX_INVOCATION_BRIMSTONE_DOOM );
	effect eFinalEffect = EffectNWN2SpecialEffectFile("fx_magical_explosion.sef");

    eSummon = EffectSummonCreature("garius_balor", VFX_INVOCATION_BRIMSTONE_DOOM, 1.0);
    float fSeconds = RoundsToSeconds(nDuration);
  //  DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, lLocation, fSeconds));
	DelayCommand(3.0f, CreateBalor());
	ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, ePortal, lLocation, 4.0);
	ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eGate, lLocation, 4.0);
	DelayCommand(4.0f, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eFinalEffect, lLocation, 1.0f));
}

void StartSummoningBalor()
{
	object oWP = GetTarget("3430_wp_balor");
	location lLocation = GetLocation(oWP);
	effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
	ActionCastFakeSpellAtLocation(SPELL_GATE, lLocation, PROJECTILE_PATH_TYPE_DEFAULT);
	DelayCommand(4.0f, SummonBalor());
	DelayCommand(4.0f, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, lLocation));
}

void MoveCameraTracker1()
{
	object oTracker = GetTarget("3430_camera_tracker1");
	object oWP = GetTarget("3430_wp_garius_safety");
	
	AssignCommand(oTracker, ClearAllActions(TRUE));
	AssignCommand(oTracker, ActionForceMoveToObject(oWP, FALSE));
}

void MoveCameraTracker2()
{
	object oTracker = GetTarget("3430_camera_tracker2");
	object oWP = GetTarget("3430_wp_ctracker2_1");
	
	AssignCommand(oTracker, ClearAllActions(TRUE));
	AssignCommand(oTracker, ActionForceMoveToObject(oWP, TRUE));
}

void SetupPartyEntranceFormation()
{
	object oPC = GetFactionLeader(GetFirstPC());
//	object oMember = GetFirstFactionMember(oPC, TRUE);
	object oWPPC = GetTarget("3430_wp_entrance_party_pc");
//	object oWP;
//	int i = 0;
	
/*	while (GetIsObjectValid(oMember) == TRUE)
	{
		//i = i + 1;
		//oWP = GetTarget("3430_wp_entrance_party" + IntToString(i));
		//AssignCommand(oMember, ClearAllActions(TRUE));
		//AssignCommand(oMember, JumpToObject(oWP));
		SetScriptHidden(oMember, TRUE);
		DelayCommand(5.0f, SetScriptHidden(oMember, FALSE));
		
		oMember = GetNextFactionMember(oPC, TRUE);
	}*/
	
	object oMember = GetFirstInGroup(GROUP_PC);

	while (GetIsObjectValid(oMember))
	{
		SetScriptHidden(oMember, TRUE);
		DelayCommand(6.0f, SetScriptHidden(oMember, FALSE));
		oMember = GetNextInGroup(GROUP_PC);
	}
	
	SetScriptHidden(oPC, FALSE);
	AssignCommand(oPC, ClearAllActions(TRUE));
	AssignCommand(oPC, JumpToObject(oWPPC));
}
	
void main(int nCase)
{
	object oRegulator = GetTarget("3430_ip_regulator");

	switch (nCase)
	{
		case 1:
			ActionPauseCutscene(1000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(1.0f));		
			break;

		case 2:
			ActionPauseCutscene(2000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(2.0f));		
			break;
			
		case 3:
			ActionPauseCutscene(3000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(3.0f));		
			break;	
			
		case 5:
			SetPartyFacing();
			break;
			
		case 10:
			ActionPauseCutscene(2000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(2.0f));	
			SetupGroupPCParty();
			SetupTraitorsGroup();
			JumpGroupPCPartyToEntrance();
			//ShowGarius();
			//ShowBishop();
			NeeshkaSitsOnFloor();
			EntranceDoorsClose();
			SetupPartyEntranceFormation();
			break;

		case 20:
			ActionPauseCutscene(8000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(8.0f));				
			DelayCommand( 1.0f, EntranceDoorsOpen() );
			MoveCameraTracker1();
			//DelayCommand( 1.5f, CameraPanToNeeshka() );
			break;
			
		case 21:
			ActionPauseCutscene(6000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(6.0f));				
			MoveCameraTracker2();
			break;
		
		case 22:
			//PCRunsToNeeshka();
			break;

		case 24:
			ActionPauseCutscene(3000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(3.0f));		
			EntranceDoorsClose();
			GroupPCPartyRunsToNeeshka();
//			NeeshkaFacesPC();
			NeeshkaStands();
			break;
			
		case 25:
			ActionPauseCutscene(4000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(4.0f));	
			NeeshkaMovesToPC();
			break;		

		case 26:
			JumpZhjaeveToNeeshka();
			break;			
			
//		case 30:
//			NeeshkaWalksToPC();
//			break;

//		case 40:
//			NeeshkaLimpsToPC();
//			break;

		case 50:
			ZhjaeveHealsNeeshka();
			break;

		case 60:
			ActionPauseCutscene(1500, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(1.5f));	
			ShowGarius();
			ShowSGolems();
			NeeshkaJumpsToWP3();
			//ShowBishop();
			break;

		case 70:
			//GariusWalksToPC();
			break;

		case 75:
			QaraAndSandPose();
			break;

		case 80:
			ShowBishop();
//			SetupTraitorsGroup();
			break;

		case 90:
			BishopStandsByGarius();
			break;

		case 92:
			//AddRosterMemberToTraitors(ID_BISHOP);
			break;

		case 94:
			BishopLeaves();
			break;

		case 95:
			PCPartyLinesUpForBattle();
			break;
	
		case 100:
			NeeshkaStandsByGarius();
			//AddRosterMemberToTraitors(ID_NEESHKA);
			break;

		case 110:
			NeeshkaStartsTowardGarius();
			break;

		case 115:
			NeeshkaRunsToPCSide();
			break;
			
		case 118:
		    BishopRunsToPCSide();
			break;

		case 119:
		    BishopRunsToGarius();
			break;
			
		case 120:
			NeeshkaStandsByGarius();
			//AddRosterMemberToTraitors(ID_NEESHKA);
			break;

		case 130:
			SandStandsByGarius();
			//AddRosterMemberToTraitors(ID_SAND);
			break;

		case 140:
			QaraStandsByGarius();
			//AddRosterMemberToTraitors(ID_QARA);
			break;

		case 150:
			ActionPauseCutscene(4000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(4.0f));
			ConstructStartsTowardBishop();
			break;

		case 160:
			ConstructStrikesGrobnar();
			break;

		case 170:
			ConstructStandsByBishop();
			break;

		case 180:
			GrobnarStandsByPC();
			//AddRosterMemberToTraitors(ID_CONSTRUCT);
			break;

		case 190:
			ActionPauseCutscene(3000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(3.0f));		
			ConstructStrikesBishop();
			break;

		case 200:
			BishopReturnsToGarius();
			break;

		case 210:
			GariusMuttersIncantation();
			break;

		case 220:
			ActionPauseCutscene(3000, FALSE );
			AssignCutsceneActionToObject(oRegulator, ActionWait(3.0f));	
			PortalBarrierAppears();
			DelayCommand(1.5f, CreateForceWall());
			break;

//		case 230:
//			SetupTraitorsDeathScript();
//			SetupTraitorsHostileAI();
//			break;

		case 240:
			AddTraitorsToTraitorGroup();
			SetupTraitorsDeathScript();
			TraitorsTurnHostile();
			SetupPCPartyForBattle();
			break;

		case 250:
			SetupTraitorsHostileAI();
			TraitorsAttack();
//			SummonBalor();
			break;

		default:
			PrettyError("3430_cs_enter: invalid case " + IntToString(nCase));
	}
}