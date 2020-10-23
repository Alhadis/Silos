//::///////////////////////////////////////////////
//:: Name default.nss
//:: Copyright (c) 2004 OldMansBeard.
//:://////////////////////////////////////////////
/*
   PC's and their clones are created with "default" hard-coded as
   the script name in each and every event handler slot except
   OnConversation, which goes to nw_g0_conversat. In the normal game
   there is no script called "default" and, although these objects
   receive event signals, the signals evoke no scripted response.

   In the OHS system, however, there is an actual script called
   "default" to respond to the event signals received by PC's
   and clones and thereby give them behaviour. This is that script.

   Because the same script is called by many different event signals
   and there is no inbuilt function resembling GetLastEventSignalled()
   it attempts to distinguish them according to context. It then
   simply passes the call on to an appropriate event-handling script.

   In most cases it still does nothing if the calling object is a PC
   but calls the appropriate OHS_HEN_* script if it is a henchman.
*/
//:://////////////////////////////////////////////
//:: Created By:    OldMansBeard
//:: Created On:    2004-10-14
//:: Last Modified: 2006-04-06
//:://////////////////////////////////////////////

#include "ohs_i0_commands"
// #include "ohs_i0_messages"  included in ohs_i0_commands
#include "prc_alterations"
#include "prc_inc_leadersh"
#include "x0_i0_henchman"
#include "inc_debug_dac" // @DUG

const int LOCAL_DEBUG = FALSE;

/**************************/
/* Declarations for Tests */
/**************************/

int IsBlocked();                // test GetBlockingDoor()
int IsCombatRoundEnd();         // Need to fake this
int IsConversation();           // test a local variable
int IsDamaged();                // test GetLastDamager()
int IsDeath();                  // test GetIsDead(OBJECT_SELF)
int IsDisturbed();              // test GetLastDisturbed()
int IsHeartbeat(object oClock); // test counter (incremented by Linkboy)
int IsPerception();             // test GetLastPerceived()
int IsPhysicalAttacked();       // test GetLastAttacker()
int IsRested();                 // test GetIsResting(GetMaster())
int IsSpawn();                  // run once, never again
int IsSpellCastAt();            // test GetLastSpellCaster()
int IsUserDefined();            // test GetUserDefinedEventNumber()

/*********************************/
/* Utility Function declarations */
/*********************************/

void ForceAddHenchman(object oHenchman);
int IsLinkboyAttached();
void GetLinkboy();
int IsObjectChanged(object oTest, string sVarname);
int IsIntChanged(int iTest, string sVarname);
int IsStringChanged(string sTest, string sVarname);
void OHSExecute(string sScriptName);
void RunScript(string sEvent);
void SpawnRecallLocals(object oPC);
void ChooseFavouriteWeapons();
void FixHenchmanLocals();
void StartGroupDiscussion();
void shareLoot(object oPC); // @DUG

/*****************************/
/* Implementation of Actions */
/*****************************/

void OnSpawn()            { OHSExecute("ohs_hen_spawn");  }
void OnDeath()            { OHSExecute("ohs_hen_death");  }
void OnRested()           { OHSExecute("ohs_hen_rest");   }
void OnHeartbeat()        { OHSExecute("ohs_hen_heart");  }
void OnPerception()       { OHSExecute("ohs_hen_percep"); }
void OnBlocked()          { OHSExecute("ohs_hen_block");  }
void OnCombatRoundEnd()   { OHSExecute("ohs_hen_combat"); }
void OnDisturbed()        { OHSExecute("ohs_hen_distrb"); }
void OnPhysicalAttacked() { OHSExecute("ohs_hen_attack"); }
void OnSpellCastAt()      { OHSExecute("ohs_hen_spell");  }
void OnDamaged()          { OHSExecute("ohs_hen_damage"); }
void OnUserDefined()      { OHSExecute("ohs_hen_usrdef"); }
void OnConversation()     { RunScript("conv");      }

/******************/
/* Main Procedure */
/******************/

void main()
{
   // CEP 2.2+ version of default.nss
   ExecuteScript("zep_default", OBJECT_SELF);

    // OnConversation is exclusive of everything else, since it is just routed through this script
    if(IsConversation())             OnConversation();
  else if (FindSubString(GetTag(OBJECT_SELF),"OHS_HEN")==0)
  {
    if (GetCutsceneMode(GetMaster()))
    {
      ClearAllActions();
    }
    else
    {
      if (IsBlocked())              OnBlocked();
      if (IsCombatRoundEnd())       OnCombatRoundEnd();
      if (IsDamaged())              OnDamaged();
      if (IsDeath())                OnDeath();
      if (IsDisturbed())            OnDisturbed();
      if (IsHeartbeat(GetMaster())) OnHeartbeat();
      if (IsPerception())           OnPerception();
      if (IsPhysicalAttacked())     OnPhysicalAttacked();
      if (IsRested())               OnRested();
      if (IsSpawn())                OnSpawn();
      if (IsSpellCastAt())          OnSpellCastAt();
      if (IsUserDefined())          OnUserDefined();
    }
  }
  else if (GetIsPC(OBJECT_SELF))
  {
    if (IsHeartbeat(OBJECT_SELF))
    {
      SpawnRecallLocals(OBJECT_SELF);
      shareLoot(OBJECT_SELF);
    }

    if (GetLocalInt(OBJECT_SELF,"OHS_ALL_DROPPED")==TRUE) return;

    if(IsLinkboyAttached())
    {
      // Code removed
    }

    if (NeedToForceMaxHenchmen())
    {
      ForceMaxHenchmen(OBJECT_SELF);
    }
    if (IsIntChanged(GetIsResting(),"IsResting"))
    {
      if (GetIsResting())
      {
/* @DUG Now handled by a summoner item
        // Make sure you have a linkboy but not until first rest.
        // Many modules do special things at the start. Linkboy might break them.
        if (!IsLinkboyAttached())
        {
          float fDelay = 0.0;
          if (GetLocalInt(OBJECT_SELF,"OHS_RESPAWN_LOCALS")!=4)
          {
            fDelay = 10.0;
            string sSoon = OHS_GetStringByLanguage(100,OBJECT_SELF);
            SendMessageToPC(OBJECT_SELF,sSoon);
          }
          DelayCommand(fDelay,GetLinkboy());
        }
*/
         if (GetItemPossessedBy(OBJECT_SELF, "dac_ohs_lbsummon") == OBJECT_INVALID)
         {
            object oSummoner = CreateItemOnObject("dac_ohs_lbsummon");
            if (oSummoner != OBJECT_INVALID)
            {
               SendMessageToPC(OBJECT_SELF, "Use the linkboy summoner to handle henchmen.");
            }
            else
            {
               logError("ERROR: could not instantiate dac_ohs_lbsummon in default.nss");
            }
         }
      }
      else
      {
        // End of rest period
        if (GetLastRestEventType()==REST_EVENTTYPE_REST_FINISHED)
        {
          // V1.4.4: Check for alternate linkboy with end-of-rest script
          object oLinkboy = GetLocalObject(OBJECT_SELF,"OHS_O_MY_LINKBOY");
          string sScriptName = GetLocalString(oLinkboy,"OHS_S_END_REST_SCRIPT");
          if (GetStringLength(sScriptName)>0)
          {
            ExecuteScript(sScriptName,oLinkboy);
          }
          else
          {
            // StartGroupDiscussion();
          }
        }
      }
    }
    if (IsLinkboyAttached() && GetCommandable() && IsStringChanged(GetName(GetModule()),"CurrentModuleName"))
    {
      // Just entered a new module. Schedule fixes in case this
      // was a henchmen-carrying transition like the one in HotU
      ActionDoCommand(FixFactions(OBJECT_SELF));
      ActionDoCommand(FixHenchmanLocals());
    }
  }
}

/************************/
/* Tests for conditions */
/************************/

int IsBlocked()
{
  return IsObjectChanged(GetBlockingDoor(),"BlockingDoor");
}

int IsCombatRoundEnd()
{
  // Need to fake this.
  // Return TRUE if you are in combat and not doing anything useful
  if ( GetIsInCombat() || (GetIsObjectValid(GetMaster()) && GetIsInCombat(GetMaster())))
  {
    int nGCA = GetCurrentAction();
    if (nGCA == ACTION_ATTACKOBJECT  ||
        nGCA == ACTION_CASTSPELL     ||
        nGCA == ACTION_COUNTERSPELL  ||
        nGCA == ACTION_HEAL          ||
        nGCA == ACTION_FOLLOW        ||
        nGCA == ACTION_ITEMCASTSPELL ||
        nGCA == ACTION_KIDAMAGE      ||
        nGCA == ACTION_OPENDOOR      ||
        nGCA == ACTION_SMITEGOOD )
    {
      return FALSE;
    }
    else
    {
      return TRUE;
    }
  }
  else
  {
    return FALSE;
  }
}

int IsConversation()
{
    object oCreature = OBJECT_SELF;
    if(GetLocalInt(oCreature, "default_conversation_event"))
    {
        DeleteLocalInt(oCreature, "default_conversation_event");
        return TRUE;
    }

    return FALSE;
}

int IsDamaged()
{
    object oCreature = OBJECT_SELF;
    object oDamager  = GetLastDamager(oCreature);

    // The damage source must be valid
    if(GetIsObjectValid(oDamager))
    {
        // Get previous damage data
        string sOldDamage = GetLocalString(oCreature, "PRC_Event_OnDamaged_Data");

        // Create string based on current damage values
        // Start with the damaging object
        string sNewDamage = ObjectToString(oDamager);
        // Catenate amount of damage of each damage type
        int i;
        for(i = DAMAGE_TYPE_BLUDGEONING; i <= DAMAGE_TYPE_BASE_WEAPON; i = i << 1)
            sNewDamage += IntToString(GetDamageDealtByType(i));

        // Determine if the damage dealt has changed
        if(sOldDamage != sNewDamage)
        {
            if(LOCAL_DEBUG) DoDebug("default: Damage has changed:\n" + sNewDamage);
            SetLocalString(oCreature, "PRC_Event_OnDamaged_Data", sNewDamage);

            // Update damage counter
            SetLocalInt(oCreature, "PRC_LastDamageTaken", GetTotalDamageDealt());

            return TRUE;
        }
    }

   return IsObjectChanged(GetLastDamager(),"LastDamager");
}

int IsDeath()
{
  if (GetIsDead(OBJECT_SELF))
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

int IsDisturbed()
{
    object oCreature  = OBJECT_SELF;
    object oDisturber = GetLastDisturbed();

    if(GetIsObjectValid(oDisturber)) // The creature has been disturbed at least once during the game
    {
        // Get previous disturb data
        string sOldDisturb = GetLocalString(oCreature, "PRC_Event_OnDisturbed_Data");

        // Create string based on current disturb values
        string sNewDisturb  = ObjectToString(oDisturber);
               sNewDisturb += IntToString(GetInventoryDisturbType());
               sNewDisturb += ObjectToString(GetInventoryDisturbItem());

        // Determine if the data has changed
        if(sOldDisturb != sNewDisturb)
        {
            if(LOCAL_DEBUG) DoDebug("default: Disturbed has changed:\n" + sNewDisturb);
            SetLocalString(oCreature, "PRC_Event_OnDisturbed_Data", sNewDisturb);
            return TRUE;
        }
    }

   return IsObjectChanged(GetLastDisturbed(),"LastDisturbed");
}

int IsHeartbeat(object oClock)
{
   object oCreature = OBJECT_SELF;
   // PCs use the module HB
   if(!GetIsPC(oCreature))
   {
      // Check how long since last recorded heartbeat
      int nSecsChange  = (GetTimeSecond() - GetLocalInt(oCreature, "PRC_LastHeartbeatSeconds") + 60) % 60;

      // See if the master clock has ticked or 9 seconds have elapsed anyway
      if (IsIntChanged(GetLocalInt(oClock, "OHS_HEARTBEAT_COUNT"),"HeartbeatCount") || nSecsChange >= 6)
      {
         SetLocalInt(OBJECT_SELF,"OHS_LastHeartbeatSeconds",GetTimeSecond());
         SetLocalInt(oCreature, "PRC_LastHeartbeatSeconds", GetTimeSecond());
         return TRUE;
      }
      else return FALSE;
   }

   return FALSE;
}

int IsPerception()
{
   object oCreature  = OBJECT_SELF;
   object oPerceived = GetLastPerceived();
   int bIsPerception = FALSE;
  // Tricky. This gets called an extra time with no change
  if (IsObjectChanged(GetLastPerceived(),"LastPerceived"))
  {
    SetLocalInt(OBJECT_SELF,"OHS_ChangedPerception",TRUE);
    bIsPerception = TRUE;
  }
  else if (GetLocalInt(OBJECT_SELF,"OHS_ChangedPerception"))
  {
    SetLocalInt(OBJECT_SELF,"OHS_ChangedPerception",FALSE);
    bIsPerception = TRUE;
  }

    if(GetIsObjectValid(oPerceived)) // The creature has perceived something at least once during the game
    {
        // Get previous perception data
        string sOldPerception = GetLocalString(oCreature, "PRC_Event_OnPerception_Data");

        // Create string based on current perception values
        string sNewPerception  = ObjectToString(oPerceived);
               sNewPerception += IntToString(GetLastPerceptionHeard());
               sNewPerception += IntToString(GetLastPerceptionInaudible());
               sNewPerception += IntToString(GetLastPerceptionSeen());
               sNewPerception += IntToString(GetLastPerceptionVanished());;

        // Determine if the data has changed
        if(sOldPerception != sNewPerception)
        {
            if(LOCAL_DEBUG) DoDebug("default: Perception has changed:\n" + sNewPerception);
            SetLocalString(oCreature, "PRC_Event_OnPerception_Data", sNewPerception);
            bIsPerception = TRUE;
        }
    }

    return bIsPerception;
}

int IsPhysicalAttacked()
{
    object oCreature = OBJECT_SELF;
    object oAttacker = GetLastAttacker();

    // Recent enough event that the attacker is at least still valid
    if(GetIsObjectValid(oAttacker))
    {
        // Get previous attack data
        string sOldAttack = GetLocalString(oCreature, "PRC_Event_OnPhysicalAttacked_Data");

        // Create string for the current attack data
        string sNewAttack  = ObjectToString(oAttacker);
               sNewAttack += ObjectToString(GetLastWeaponUsed(oAttacker));
               sNewAttack += IntToString(GetLastAttackMode(oAttacker));
               sNewAttack += IntToString(GetLastAttackType(oAttacker));

        // Determine if the data has changed
        if(sOldAttack != sNewAttack)
        {
            if(LOCAL_DEBUG) DoDebug("default: Attack has changed:\n" + sNewAttack);
            SetLocalString(oCreature, "PRC_Event_OnPhysicalAttacked_Data", sNewAttack);
            return TRUE;
        }
    }

   return IsObjectChanged(GetLastAttacker(),"LastAttacker");
}

int IsRested()
{
    // PCs use the module OnRest events
    if(!GetIsPC(OBJECT_SELF))
    {
        // Goes TRUE when Master starts resting
        int bMasterIsResting = GetIsResting(GetMaster());
        return IsIntChanged(bMasterIsResting,"MasterIsResting") && bMasterIsResting;
   }
   return FALSE;
}

int IsSpawn()
{
   int bIsSpawn = FALSE;
   if (!GetLocalInt(OBJECT_SELF,"OHS_OnSpawn"))
   {
      SetLocalInt(OBJECT_SELF,"OHS_OnSpawn",TRUE);
      bIsSpawn = TRUE;
   }

   object oCreature = OBJECT_SELF;
   if(!GetLocalInt(oCreature, "PRC_OnSpawn_Marker"))
   {
       SetLocalInt(oCreature, "PRC_OnSpawn_Marker", TRUE);
       bIsSpawn = TRUE;
   }

   return bIsSpawn;
}

int IsSpellCastAt()
{
  // Problem: does not trigger if the same caster casts another spell

    object oCreature = OBJECT_SELF;
    if(LOCAL_DEBUG) DoDebug("default: IsSpellCastAt():\n"
                    + "GetLastSpellCaster() = " + DebugObject2Str(GetLastSpellCaster()) + "\n"
                    + "GetLastSpell() = " + IntToString(GetLastSpell()) + "\n"
                    + "GetLastSpellHarmful() = " + IntToString(GetLastSpellHarmful()) + "\n"
                      );
    // If the event data does not contain the fake value, a spell has been cast
    if(GetLastSpell() != -1)
    {
        // Reset the event data to the fake value
        DelayCommand(0.0f, SignalEvent(oCreature, EventSpellCastAt(oCreature, -1, FALSE)));

        return TRUE;
    }

  return IsObjectChanged(GetLastSpellCaster(),"LastSpellCaster");
}

int IsUserDefined()
{
    object oCreature = OBJECT_SELF;
    if(LOCAL_DEBUG) DoDebug("default: IsUserDefined():\n"
                          + "GetUserDefinedEventNumber() = " + IntToString(GetUserDefinedEventNumber()) + "\n"
                            );

    if(GetUserDefinedEventNumber() != -1)
    {
        // Reset the event data to the fake value
        DelayCommand(0.0f, SignalEvent(oCreature, EventUserDefined(-1)));

        return TRUE;
    }

  return IsIntChanged(GetUserDefinedEventNumber(),"UserDefinedEventNumber");
}

/*********************/
/* Utility Functions */
/*********************/

int IsObjectChanged(object oTest, string sName)
{
   int bReturn = FALSE;
  if (oTest != GetLocalObject(OBJECT_SELF,"OHS_"+sName))
  {
    SetLocalObject(OBJECT_SELF,"OHS_"+sName,oTest);
    bReturn = TRUE;
  }

    if(oTest != GetLocalObject(OBJECT_SELF, "PRC_Event_" + sName))
    {
        SetLocalObject(OBJECT_SELF, "PRC_Event_" + sName, oTest);
        bReturn = TRUE;
    }
   return bReturn;
}

int IsIntChanged(int iTest, string sName)
{
   int bReturn = FALSE;
  if (iTest != GetLocalInt(OBJECT_SELF,"OHS_"+sName))
  {
    SetLocalInt(OBJECT_SELF,"OHS_"+sName,iTest);
    bReturn = TRUE;
  }

    if(iTest != GetLocalInt(OBJECT_SELF, "PRC_Event_" + sName))
    {
        SetLocalInt(OBJECT_SELF, "PRC_Event_" + sName, iTest);
        bReturn = TRUE;
    }
   return bReturn;
}

int IsStringChanged(string sTest, string sName)
{
   int bReturn = FALSE;
  if (sTest != GetLocalString(OBJECT_SELF,"OHS_"+sName))
  {
    SetLocalString(OBJECT_SELF,"OHS_"+sName,sTest);
    bReturn = TRUE;
  }

    if(sTest != GetLocalString(OBJECT_SELF, "PRC_Event_" + sName))
    {
        SetLocalString(OBJECT_SELF, "PRC_Event_" + sName, sTest);
        bReturn = TRUE;
    }
   return bReturn;
}

void ForceAddHenchman(object oLinkboy)
{
  ForceMaxHenchmen(OBJECT_SELF);
  AddHenchman(OBJECT_SELF,oLinkboy);
}

// Test to see if you have a linkboy.
// If so, all the attachment pointers will get set correctly.
int IsLinkboyAttached()
{
  // Quickest check first - normally true
  object oLinkboy = GetLocalObject(OBJECT_SELF,"OHS_O_MY_LINKBOY");
  if (GetIsObjectValid(oLinkboy) && GetMaster(oLinkboy)==OBJECT_SELF && GetLocalString(oLinkboy,"OHS_S_MY_MASTER")==GetName(OBJECT_SELF))
  {
    return TRUE;
  }

  // No, something needs fixing
  if (GetIsObjectValid(oLinkboy))
  {
    // He exists, just needs claiming
    if(GetMaster(oLinkboy)!=OBJECT_SELF)
    {
      ForceAddHenchman(oLinkboy);
    }
    SetLocalString(oLinkboy,"OHS_S_MY_MASTER",GetName(OBJECT_SELF));
    return TRUE;
  }

  // Check all linkboys to see if any of them is really yours
  oLinkboy = OBJECT_INVALID;
  int nNth = 0;
  object oCandidate = GetObjectByTag("OHS_LINKBOY",nNth);
  while (GetIsObjectValid(oCandidate) && !GetIsObjectValid(oLinkboy))
  {
    if (GetMaster(oCandidate)==OBJECT_SELF)
    {
      oLinkboy = oCandidate;
      SetLocalObject(OBJECT_SELF,"OHS_O_MY_LINKBOY",oLinkboy);
      SetLocalString(oLinkboy,"OHS_S_MY_MASTER",GetName(OBJECT_SELF));
    }
    else if (GetLocalString(oCandidate,"OHS_S_MY_MASTER")==GetName(OBJECT_SELF))
    {
      oLinkboy = oCandidate;
      ForceAddHenchman(oLinkboy);
      SetLocalObject(OBJECT_SELF,"OHS_O_MY_LINKBOY",oLinkboy);
    }
    else
    {
      nNth++;
      oCandidate = GetObjectByTag("OHS_LINKBOY",nNth);
    }
  }
  return GetIsObjectValid(oLinkboy);
}

// Create a Linkboy Henchman for the calling PC
void GetLinkboy()
{
  // See if there is a convenient doorway for a linkboy to appear from
  // Otherwise make him appear 1.0m in front of you
  int nNth = 1;
  object oDoor = GetNearestObject(OBJECT_TYPE_DOOR,OBJECT_SELF,nNth);
  while (GetIsObjectValid(oDoor) && GetLocked(oDoor))
  {
    nNth++;
    oDoor = GetNearestObject(OBJECT_TYPE_DOOR,OBJECT_SELF,nNth);
  }
  float fFacing, fOpposite;
  vector vSpot;
  location lSpot;
  if (GetIsObjectValid(oDoor))
  {
    fFacing = VectorToAngle(GetPosition(oDoor)-GetPosition(OBJECT_SELF));
    fOpposite = (fFacing>=180.0)?fFacing-180.0:fFacing+180.0;
    vSpot = GetPosition(oDoor)+1.0*AngleToVector(fFacing);
    lSpot = Location(GetArea(OBJECT_SELF),vSpot,fOpposite);
  }
  else
  {
    fFacing = GetFacing(OBJECT_SELF);
    fOpposite = (fFacing>=180.0)?fFacing-180.0:fFacing+180.0;
    vSpot = GetPosition(OBJECT_SELF)+1.0f*AngleToVector(fFacing);
    lSpot = Location(GetArea(OBJECT_SELF),vSpot,fOpposite);
  }
  string sResRef = GetLocalString(OBJECT_SELF,"OHS_S_LINKBOY_RESREF");
  if (sResRef=="") sResRef = "ohs_linkboy";
  object oLinkboy = CreateObject(OBJECT_TYPE_CREATURE,sResRef,lSpot,FALSE);
  ForceAddHenchman(oLinkboy);
  SetLocalObject(OBJECT_SELF,"OHS_O_MY_LINKBOY",oLinkboy);
  SetLocalString(oLinkboy,"OHS_S_MY_MASTER",GetName(OBJECT_SELF));
  if (GetIsObjectValid(oDoor)) AssignCommand(oLinkboy,ActionOpenDoor(oDoor));
  string sArrived = OHS_GetStringByLanguage(101,OBJECT_SELF);
  SendMessageToPC(OBJECT_SELF,GetName(oLinkboy)+sArrived);
}

void OHSExecute(string sScriptName)
{
  // WriteTimestampedLogEntry("OHSExecute "+sScriptName);
  ExecuteScript(sScriptName,OBJECT_SELF);
}

void RunScript(string sEvent)
{
    object oSelf = OBJECT_SELF;

    if(LOCAL_DEBUG) DoDebug("default, event = " + sEvent);

    // Determine NPC script name and run generic eventhook
    if(sEvent == "attacked")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONPHYSICALATTACKED);
    }
    else if(sEvent == "blocked")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONBLOCKED);
    }
    else if(sEvent == "combat")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONCOMBATROUNDEND);
    }
    else if(sEvent == "conv")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONCONVERSATION);
    }
    else if(sEvent == "damaged")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONDAMAGED);
    }
    else if(sEvent == "death")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONDEATH);
        /*
        if(!GetIsPC(oSelf))
            ExecuteScript("prc_ondeath", oSelf);
        */
    }
    else if(sEvent == "disturbed")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONDISTURBED);
    }
    else if(sEvent == "heartbeat")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONHEARTBEAT);
    }
    else if(sEvent == "perception")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONPERCEPTION);
    }
    else if(sEvent == "rested")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONRESTED);
    }
    else if(sEvent == "spawned")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONSPAWNED);
    }
    else if(sEvent == "spellcast")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONSPELLCASTAT);
    }
    else if(sEvent == "user")
    {
        ExecuteAllScriptsHookedToEvent(oSelf, EVENT_VIRTUAL_ONUSERDEFINED);
    }
}

void SpawnRecallLocals(object oPC)
{
  //debugVarObject("SpawnRecallLocals", oPC);
  //debugVarInt("OHS_RESPAWN_LOCALS", GetLocalInt(oPC,"OHS_RESPAWN_LOCALS"));

  // Modified V1.4.4 to make it more robust
  // Debug using PC's local variable OHS_RESPAWN_LOCALS
  // 0 = Not yet called
  // 1 = This routine has been called
  // 2 = Called but failed to create the buffer object
  // 3 = Created buffer and assigned commands to it
  // 4 = Buffer has completed commands
  // Retry every heartbeat until result 4

  if (GetLocalInt(oPC,"OHS_RESPAWN_LOCALS")==4) return; // Only do this once
  SetLocalInt(oPC,"OHS_RESPAWN_LOCALS",1);
  string sDatabaseName = "OHS_PLAYER_"+GetPCPlayerName(oPC);
  // V1.5.1: Support for other languages
  OHS_SetPlayerLanguage(oPC,GetCampaignInt(sDatabaseName,"ohs_language"),FALSE);
  object oBuffer = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_invisobj",GetLocation(oPC),FALSE,"OHS_HEN_"+GetName(oPC));
  if (GetIsObjectValid(oBuffer))
  {
    SetCommandable(TRUE,oBuffer);
    AssignCommand(oBuffer,RecallLocals(sDatabaseName,oBuffer,oPC,TRUE));
    string sRestored = OHS_GetStringByLanguage(102,oPC);
    AssignCommand(oBuffer, SetLocalInt(oPC, "OHS_GOLD", GetGold(oPC)));
    AssignCommand(oBuffer,SendMessageToPC(oPC,sRestored));
    AssignCommand(oBuffer,SetLocalInt(oPC,"OHS_RESPAWN_LOCALS",4));
    AssignCommand(oBuffer,DestroyObject(OBJECT_SELF,5.0f));
    SetLocalInt(oPC,"OHS_RESPAWN_LOCALS",3);
  }
  else
  {
    SetLocalInt(oPC,"OHS_RESPAWN_LOCALS",2);
  }
}

void ChooseFavouriteWeapons()
{
  object oBestMainWeapon = GetBestMeleeWeapon();
  SetLocalObject(OBJECT_SELF,"OHS_FAVOURITE_MELEE_WEAPON",oBestMainWeapon);
  SetLocalObject(OBJECT_SELF,"OHS_FAVOURITE_RANGED_WEAPON",GetBestRangedWeapon());
  SetLocalObject(OBJECT_SELF,"OHS_FAVOURITE_SHIELD",GetBestShield());
  SetLocalObject(OBJECT_SELF,"OHS_FAVOURITE_MELEE_OFFHAND",GetBestOffHandWeapon(oBestMainWeapon));
}

void FixHenchmanLocals()
{
  object oHenchman;
  int nNth = 1;
  oHenchman = GetHenchman(OBJECT_SELF,nNth);
  while (GetIsObjectValid(oHenchman))
  {
    if (FindSubString(GetTag(oHenchman),"OHS_HEN")==0)
    {
      SetIsFollower(oHenchman,TRUE);
      HireHenchman(OBJECT_SELF,oHenchman,FALSE);
      OHS_SetCompanion(oHenchman);
      SetLocalString(oHenchman,"OHS_S_MY_MASTER",GetName(OBJECT_SELF));
      AssignCommand(oHenchman,ActionDoCommand(ChooseFavouriteWeapons()));
    }
    nNth++;
    oHenchman = GetHenchman(OBJECT_SELF,nNth);
  }
}

void StartGroupDiscussion()
{
  object oSpeaker, oStarter;
  int nSpeakers = 0;
  int nNth = 1;
  object oHenchman = GetHenchman(OBJECT_SELF,nNth);
  while (GetIsObjectValid(oHenchman) && nSpeakers<6)
  {
    if (FindSubString(GetTag(oHenchman),"OHS_HEN")==0 && GetLocalString(oHenchman,"OHS_S_ENAMOUR")=="")
    {
      nSpeakers++;
      oSpeaker = CreateDummySpeaker(oHenchman, "OHS_SPEAKER_"+IntToString(nSpeakers));
      if (nSpeakers==1 || Random(nSpeakers)==nSpeakers-1) oStarter=oSpeaker;
    }
    nNth++;
    oHenchman = GetHenchman(OBJECT_SELF,nNth);
  }
  if (nSpeakers>1)
  {
    BeginConversation("ohs_group",oStarter);
  }
  else
  {
    AssignCommand(oStarter,SetIsDestroyable(TRUE,FALSE,FALSE));
    AssignCommand(oStarter,DestroyObject(oStarter));
  }
}

void shareLoot(object oPC)
{
   //debugVarObject("shareLoot()", oPC);

   // Only PCs have to share gold
   if (! GetIsPC(oPC)) return;

   int nPrevGP = GetLocalInt(oPC, "OHS_GOLD");
   //debugVarInt("nPrevGP", nPrevGP);
   int nCurrGP = GetGold(oPC);
   //debugVarInt("nCurrGP", nCurrGP);
   SetLocalInt(oPC, "OHS_GOLD", nCurrGP);

   int nGP = nCurrGP - nPrevGP;
   //debugVarInt("nGP", nGP);
   if (nGP <= 0) return;

   int nOHSHenchmenCount = 0;
   int nNth = 1;
   object oHenchman = GetHenchman(oPC, nNth);
   while (GetIsObjectValid(oHenchman))
   {
      if (OHS_GetIsCompanion(oHenchman) &&
          ! GetIsDead(oHenchman) &&
          GetLocalInt(oHenchman, "OHS_SHARE_LOOT"))
      {
         nOHSHenchmenCount++;
      }
      oHenchman = GetHenchman(oPC, ++nNth);
   }
   //debugVarInt("nOHSHenchmenCount", nOHSHenchmenCount);

   if (nOHSHenchmenCount == 0) return;

   int nGPShare = nGP / (nOHSHenchmenCount + 1); // the PC gets a share!
   // Henchmen get at least 1 GP if available
   nGPShare = (nGPShare <= 1 ? 1 : nGPShare);
   //debugVarInt("nGPShare", nGPShare);

   // Distribute the loot
   nNth = 1;
   oHenchman = GetHenchman(oPC, nNth);
   while (GetIsObjectValid(oHenchman))
   {
      if (OHS_GetIsCompanion(oHenchman) &&
          ! GetIsDead(oHenchman) &&
          GetLocalInt(oHenchman, "OHS_SHARE_LOOT"))
      {
         if (nGP < nGPShare) nGPShare = nGP;
         TakeGoldFromCreature(nGPShare, oPC, TRUE);
         GiveGoldToCreature(oHenchman, nGPShare);
         AssignCommand(oHenchman, ActionSpeakString("Thanks, boss."));
         nGP -= nGPShare;
      }
      oHenchman = GetHenchman(oPC, ++nNth);
   }
}

////////////////////////////////////////////////////////////////////////////////
//                                                                                    //
// (C) 2004, 2005, 2006 by bob@minors-ranton.fsnet.co.uk (aka "OldMansBeard")         //
//                                                                                    //
// The NWScript source code file to which this notice is attached is copyright.       //
// It may not be published or passed to a third party in part or in whole
// modified or unmodified without the express consent of the copyright holder.                 //
//                                                                                    //
// NWN byte code generated by compiling it or variations of it may be published       //
// or otherwise distributed notwithstanding under the terms of the Bioware EULA.      //
//                                                                                    //
////////////////////////////////////////////////////////////////////////////////

