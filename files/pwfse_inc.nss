#include "d0_functions_inc"

//void main(){}
//::///////////////////////////////////////////////
//:: PWFSE v0.7
//:: balanced spawn engine - core
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*


  changelog:

  v0.71 update (05/2004)

  - fixed problem w/ debug function

  v0.7 update (04/2004)

  - new spawner parameter: PWFSE_DESPAWN_MODIFIER int

    this activates automatic child despawn.
    despawn time = PFWFSE_DESPAWN_MODIFIER * PWFSE_TIMER_RESPAWN

    e.g.:
    PWFSE_TIMER_RESPAWN     int     300
    PWFSE_DESPAWN_MODIFIER  int     2

    this will set the despawn timer to 10 minutes (two times the respawn timer)

    setting it to 0 or omitting this parameter keeps all childs alive. it will
    only despawn childs from this spawner, nothing else.

  v0.6 update (4/2004)

  - new spawner parameter: PWFSE_OBJTYPEx int
                           (x = incrementing number)

    specifies the object type you want to spawn. defaults to OBJECT_TYPE_CREATURE

    list of valid spawnable object types:
       OBJECT_TYPE_CREATURE         = 1;
       OBJECT_TYPE_ITEM             = 2;
       OBJECT_TYPE_WAYPOINT         = 32;
       OBJECT_TYPE_PLACEABLE        = 64;
       OBJECT_TYPE_STORE            = 128;

    lets say you have specified this resref:
    PWFSE_RESREF3   string      plc_campfr

    which is a placeable, then you would set the object type like this:

    PWFSE_OBJTYPE3  int         64

    this paramater also works together with PWSE_LINK_RESREF just like
    PWFSE_RESREFx and PWFSE_WEIGHTx

  - new spawner parameter: PWFSE_LINK_RESREF string

    specifies the TAG of a linked object holding ONLY a resref list
    spawner will use the object specified to fetch resrefs (blueprints).
    just use a normal waypoint as the object... but you can use whatever
    object you like.

    linked object uses the same resref parameters you normally use on the
    spawner itself:

    PWFSE_RESREF1  .. PWFSE_RESREFx
    PWFSE_WEIGHT1  .. PWFSE_WEIGHTx
    PWFSE_OBJTYPE1 .. PWFSE_OBJTYPEx

    this lets you re-use blueprint groups, minimizing cpu/memory
    impact. you can also change the blueprints of many spawners at once
    that way.

    it let's you manage blueprint groups and associated parameters
    in a very flexible manner.

  - new spawner parameter: PWFSE_TIMER_RESPAWN string

    it's a more powerful replacement of the old PWFSE_TIMER_RESPAWN int parameter.
    don't get confused coz they share the same name...

    you can now input min-max values for the respawn time:

      if you want a respawn time of 60-120 seconds, then just set
      PWFSE_TIMER_RESPAWN     string      60-120

    just use this parameter in the future and forget about the old int parameters.

    old int parameter still works though...

  - new spawner parameter: PWFSE_COUNT string

    dito ! this does the same for PWFSE_COUNT int

    you can now input min-max spawn count values:

      if you want to spawn 5-10 creatures, then just set
      PWFSE_COUNT     string      5-10

  - added basic plugin framework

      it's now possible to add new functionality without touching the core system.
      each plugin only needs a single script-file. this script receives different hook
      events, similar to OnUserDefined scripts.

      you can easily add one or more plugins to a spawner with a new command

      PWFSE_PLUGINx string
      (x = number)

      e.g. you want to add the new time-based spawn plugin and the quest plugin, just add

      PWFSE_PLUGIN1  string  time
      PWFSE_PLUGIN2  string  quest

      all plugin scripts must follow a simple naming convention, they start
      with "pwfse_p_" plus the name as their suffix. the time plugin
      gets called "pwfse_p_time", the quest one "pwfse_p_quest"

      advantage is, that your spawners only use those plugins you want to and
      don't waste time with unneeded functionality. furthermore, it's easy
      for other scripters to share their own creations...

      check the example plugins, they all start with pwfse_p_

      plugin scripts often use their own set of additional parameters, check their
      header files for more info.

  v0.51 update (4/2004)

  - bugfix: sometimes spawner wasn't able to find all linked waypoints

  v0.5 update (4/2004)

  - added SafeCopyObject based spawning.

    this reduced overall cpu use by another 30% (wow!). implementation
    uses a SetLocalObject based caching system with minimal
    memory impact.

  - added comfort-debug functionality
    see PWFSE_DEBUG_MODE

  - added parameter fallbback. if a spawn parameter is missing,
    then it tries to retrieve the parameter from waypoint PWFSE_PO

  - new spawner parameter: PWFSE_PCCOUNT_MODIFIER

    spawner will scale the number of spawned objects to the
    number of PCs in the area.

    example:
    you set
      PWFSE_PCCOUNT_MODIFIER to 2
    and
      PWFSE_COUNT to -10

    this spawns 2-20 objects per player in the area

    if you have, lets say, 3 PCs in the area, then this spawner
    would spawn 6-60 objects.

    its Count * Modifier * NrOfPCs

    you may want to set this modifier to 1 normally. this gives you
    a flat linear scale....

    spawn will not scale to the number of players if you just
    omit this parameter...

  v0.4 initial internal release

*/
//:://////////////////////////////////////////////
//:: Created By: Knat
//:: Created On: 03/2004
//:://////////////////////////////////////////////

// you should be careful upping this value,
// even though the spawner needs only about ~2.5ms to spawn a creature.
//
// reason is that spawning a huge number at once will also
// fire onSpawn and onPerception of those creatures in a rapid manner.
// and the engine needs to render the creature and may do other stuff
// with impact to server & client performance.
// try to stay between 10-20 per second.
//
// so the overall brutto cpu cost is not only the spawning itself, but
// all subsequent firing scripts and engine internal post-spawn processing
const int PWFSE_MAX_SPAWNS_PER_SECOND = 15;

// 0x01 = logfile
// 0x02 = DM
// 0x04 = PC
//
// just add them together to mix
// e.g. 0x01 + 0x04 = 0x05 = debug to logfile and PCs
//
// 0x07 = full debug
// use 0x03 for operative systems (or no debug at all)
//
// this produces a bit cpu overhead, esp. if you
// use PC/DM debug.
const int PWFSE_DEBUG_MODE = 0x03;


const int PWFSE_PLUGIN_HOOK_ACTIVATE   = 1;
const int PWFSE_PLUGIN_HOOK_CHECKSPAWN = 2;

//  -----------------------------------------------------------------------
//  -----------------------------------------------------------------------


// schedule a spawn, adds object to global spawn queue
//  this works basically like CreateObject, but doesn't return the created object
//
//  sResref - resref of the object you want to spawn
//  lLoc - spawn location
//  oSpawner - spawner (parent/master object)
//  nType - object type
//
// queue will recall itself until empty. all spawns
// will run through this queue. only spawns a fixed amount
// of objects per second.
// no cpu spikes because of rapid area/spawn activation
// no cpu spikes even if you spawn TONS of objects in rapid succession
//
// global spawn queue works like a ring buffer...
void PWFSE_AddToSpawnQueue(string sResRef, location lLoc, object oSpawner = OBJECT_SELF, int nType = OBJECT_TYPE_CREATURE);

// get creature from the list set on oSpawner at index position nNth.
// negative nNth value means it gets a random resref from the list
//
// initializes on first spawner use > creates a "weighted" spawnlist
//
// weighted spawns do NOT use additional CPU time
// except during the first spawn of oSpawner.
// it will use more memory, but that's an acceptable
// trade in that case..
string PWFSE_GetCreature(object oSpawner, int nNth);

// get spawn location for oSpawner.
// if spawner is linked:
//   positive nNth = location from nNth linked waypoint
//   negative nNth = location from one of the linked waypoints (random)
// unlinked
//   returns location of oSpawner
location PWFSE_GetLocation(object oSpawner, int nNth = -1);

// TRUE = players in area
// FALSE = what do you think ?
int PWFSE_IsAnyPlayerInArea(object oArea);

// activate single spawner
void PWFSE_ActivateSingleSpawner(object oSpawn);

// activate all spawns in area
void PWFSE_ActivateAllSpawnsInArea(object oArea);

// spawn creatures according to the rules set
// on oSpawner (usually through the toolset
// variable interface)
//
// activates spawncheck pseudo hb
//
// cancels on certain conditions:
//   missing "wait for spawn" flag
//   (optional) no player in area
//
void PWFSE_Respawn(object oSpawner, int nCancelIfEmpty = TRUE);

void PWFSE_Debug(string sDebug, int nMode = PWFSE_DEBUG_MODE);

void PWFSE_DespawnChilds(object oSpawner = OBJECT_SELF);

//  -----------------------------------------------------------------------
//                             IMPLEMENTATION
//  -----------------------------------------------------------------------

//  -----------------------------------------------------------------------
//                           INTERNAL FUNCTIONS
//  -----------------------------------------------------------------------

void PWFSE_PlugIn_Execute(object oSpawner, int nHook)
{
  SetLocalInt(oSpawner, "PWFSE_PLUGIN_HOOK_TYPE", nHook);
  int n = 1;
  string sHook = GetLocalString(oSpawner, "PWFSE_PLUGIN"+IntToString(n));
  while(sHook != "")
  {
    ExecuteScript("pwfse_p_"+GetStringLowerCase(sHook), oSpawner);
    sHook = GetLocalString(oSpawner, "PWFSE_PLUGIN"+IntToString(++n));
  }
}

int PWFSE_PlugIn_GetHookType(object oSpawner = OBJECT_SELF)
{
  return GetLocalInt(oSpawner, "PWFSE_PLUGIN_HOOK_TYPE");
}

int PWFSE_GetIsActive(object oSpawner = OBJECT_SELF)
{
  return GetLocalInt(oSpawner, "PWFSE_ACTIVE?");
}

void PWFSE_SkipNextActivation(object oSpawner = OBJECT_SELF)
{
  SetLocalInt(oSpawner, "PWFSE_SKIP_ACTIVATION", TRUE);
}

// returns TRUE if oSpawner has a pending respawn
int PWFSE_GetPendingRespawn(object oSpawner = OBJECT_SELF)
{
  return GetLocalInt(oSpawner, "PWFSE_WAIT_FOR_RESPAWN?");
}

// return Anchor WP of given area
// create one if needed
// this WP gets used as oTarget in some of the GetNearest* calls
object PWFSE_GetAnchorWaypoint(object oArea)
{
  return ( GetObjectByTag("PWFSE_ANCHOR"+ObjectToString(oArea)) == OBJECT_INVALID ) ?
           CreateObject(OBJECT_TYPE_WAYPOINT, "nw_waypoint001", Location(oArea, Vector(5.0,5.0,0.0), 0.0),
           FALSE, "PWFSE_ANCHOR"+ObjectToString(oArea)) : GetObjectByTag("PWFSE_ANCHOR"+ObjectToString(oArea));
}

// return TRUE if this spawner
// has any childs left
int PWFSE_GetHasChilds(object oSpawner = OBJECT_SELF)
{
  return (GetNearestObjectByTag("PWFSE_SPAWNERID"+ObjectToString(oSpawner), oSpawner) != OBJECT_INVALID );
}

// nMode:
// 0x01 = logfile
// 0x02 = DM
// 0x04 = PC
//
// just add them together to mix
// e.g. 0x01 + 0x04 = 0x05 = debug to logfile and PCs
void PWFSE_Debug(string sDebug, int nMode = PWFSE_DEBUG_MODE)
{
        if((nMode & 2 == 2) || (nMode & 4 == 4))
        {
            object oPC = GetFirstPC();
            while(oPC != OBJECT_INVALID)
            {
                if(AdvDebugStatus(oPC))
                {
                    if(((nMode & 2) == 2) && GetIsDM(oPC))
                        SendMessageToPC(oPC, sDebug);
                    else if((nMode & 4) == 4)
                        SendMessageToPC(oPC, sDebug);
                }

                oPC = GetNextPC();
            }

        if((nMode & 1) == 1)
        WriteTimestampedLogEntry(sDebug);
    }
}


// fallback mechanism
// system tries to fetch parameter from PWFSE_PO waypoint
// in case the parameter is missing on oSpawner
string PWFSE_GetStringParameter(object oSpawner, string sPar)
{
  if(GetLocalString(oSpawner, sPar) == "")
    return GetLocalString(GetObjectByTag("PWFSE_PO"), sPar);
  else
    return GetLocalString(oSpawner, sPar);
}

int PWFSE_GetIntParameter(object oSpawner, string sPar)
{
  if(GetLocalInt(oSpawner, sPar) == 0)
    return GetLocalInt(GetObjectByTag("PWFSE_PO"), sPar);
  else
    return GetLocalInt(oSpawner, sPar);
}

void PWFSE_ParseMMParameter(string sParameter, object oSpawner = OBJECT_SELF, int nDefault = 1)
{
  string p = GetLocalString(oSpawner, sParameter);

  if(p == "")
    p = GetLocalString(GetObjectByTag("PWFSE_PO"), sParameter);

  int nMax, nMin, nPos = FindSubString(p, "-");

  if(nPos == -1)
  {
    nMax = StringToInt(p);
    if(nMax < 0)
    {
      nMax = abs(nMax);
      nMin = 1;
    }
    else if(nMax == 0)
    {
      // default value
      nMax = nDefault;
      nMin = nDefault;
    }
    else
      nMin = nMax; // constant value
  }
  else
  {
    nMin = StringToInt(GetStringLeft(p, nPos));
    nMax = StringToInt(GetStringRight(p, GetStringLength(p) - (nPos+1)));
  }

  // cache min/max values
  SetLocalInt(oSpawner, sParameter, nMax);
  SetLocalInt(oSpawner, sParameter+"_MIN", nMin);

  // only parse 1 time.
  // mark this parameter as parsed...
  SetLocalString(oSpawner, sParameter, "PARSED");
}

int PWFSE_GetRandomMMParameter(string sParameter, object oSpawner = OBJECT_SELF, int nDefault = 1)
{
  string p = PWFSE_GetStringParameter(oSpawner, sParameter);

  if(p != "PARSED") PWFSE_ParseMMParameter(sParameter, oSpawner, nDefault); // one-time parsing

  int nMin = PWFSE_GetIntParameter(oSpawner, sParameter+"_MIN");

  return nMin + Random(PWFSE_GetIntParameter(oSpawner, sParameter) - nMin + 1);
}


string PWFSE_GetResRef(object oSpawner, int nNth)
{
  int nCount = GetLocalInt(oSpawner, "PWFSE_RESREF_COUNT");
  return GetLocalString(oSpawner, "PWFSE_WRESREF"+IntToString( (nNth > nCount) ? nCount : nNth  ));
}

int PWFSE_GetObjectType(object oSpawner, int nNth)
{
  int nCount = GetLocalInt(oSpawner, "PWFSE_RESREF_COUNT");
  return GetLocalInt(oSpawner, "PWFSE_WOBJTYPE"+IntToString( (nNth > nCount) ? nCount : nNth  ));
}

int PWFSE_GetRandomObjectIndex(object oSpawner)
{
  if(GetIsObjectValid(oSpawner))
  {
    if(GetLocalInt(oSpawner, "PWFSE_RESREF_COUNT") > 0)
      return Random(GetLocalInt(oSpawner, "PWFSE_RESREF_COUNT")) + 1;
  }
  PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] get rnd object index: error, no resrefs found");
  return 0;
}

int PWFSE_GetNumPlayersInArea(object oArea)
{
  int nCount;
  object oAnchor = PWFSE_GetAnchorWaypoint(oArea);

  while ( GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,
          oAnchor, ++nCount, CREATURE_TYPE_IS_ALIVE, TRUE) != OBJECT_INVALID) {}

  return nCount -1;
}

// do the real spawning here
// using queue position nPos
void PWFSE_QueueSpawn(object oQueue, int nReadPos)
{
  string sRes;
  object oObj;
  int nType;

  sRes = GetLocalString(oQueue, "PWFSE_QUEUE_RESREF_"+IntToString(nReadPos));

  // object caching:
  //
  // looks for a pointer (set via SetLocalObject) to a creature with the given resref
  // uses SafeCopyObject if it finds a valid pointer. uses createobject if not.
  // that way we don't need to pre-load creatures to use SafeCopyObject (which would
  // otherwise introduce many new problems)
  //
  // SetLocalObject works like a pointer (not a real copy).
  //
  // the pointer is still half-valid if the object set via SetLocalObject gets destroyed
  // it does not return OBJECT_INVALID. need to use GetIsObjectValid to identify if the
  // pointer is still valid. (pointer can easily get invalid because we use
  // one of the earlier spawned creatures). we don't need additional variables
  // except for the SetLocalObject... which has a low memory requirement i think.
  //
  // another big advantage is the global nature of this cache. thanks to
  // the spawn-queue
  //
  // this reduces CPU time ...
/*  ----------ausgeschaltete If-Funktion
    if(!GetIsObjectValid(GetLocalObject(oQueue, "PWFSE_QUEUE_OBJECT_CACHE_"+sRes)))
    {
  */
    //oObj = SafeCopyObject(GetObjectByTag("PWFSE_TPL_"+sRes), lLoc, OBJECT_INVALID, "PWFSE_SPAWNERID"+ObjectToString(oSpawner));
    nType = GetLocalInt(oQueue, "PWFSE_QUEUE_OBJTYPE_"+IntToString(nReadPos));
    if(nType == 0) nType = 1;

    oObj = CreateObject(nType, sRes,
                        GetLocalLocation(oQueue, "PWFSE_QUEUE_LOCATION_"+IntToString(nReadPos)),
// -------------------------------!!! AENDERUNG VON MAPPO !!!-----------------------
                        FALSE, "PWFSE_SPAWNERID"+ObjectToString(GetLocalObject(oQueue, "PWFSE_QUEUE_SPAWNER_"+IntToString(nReadPos))));
// meins                        FALSE,"PWFSE_SPAWNERID"+ObjectToString(GetLocalObject(oQueue, "PWFSE_SPAWNED_CREATURE")));
//-------------------------------- ENDE VON MAPPOS AENDERUNG -----------------------
     // add this resref to global spawn cache
    SetLocalObject(oQueue, "PWFSE_QUEUE_OBJECT_CACHE_"+sRes, oObj);
    PWFSE_Debug("Spawner ["+ObjectToString(GetLocalObject(oQueue, "PWFSE_QUEUE_SPAWNER_"+IntToString(nReadPos)))+ "] spawn (create): "+sRes);
//  }
/* -------------ausgeschaltetes SafeCopyObject-----------------
    else
  {
    oObj = SafeCopyObject(GetLocalObject(oQueue, "PWFSE_QUEUE_OBJECT_CACHE_"+sRes),
                      GetLocalLocation(oQueue, "PWFSE_QUEUE_LOCATION_"+IntToString(nReadPos)), OBJECT_INVALID,
                      "PWFSE_SPAWNERID"+ObjectToString(GetLocalObject(oQueue, "PWFSE_QUEUE_SPAWNER_"+IntToString(nReadPos))));
    PWFSE_Debug("Spawner ["+ObjectToString(GetLocalObject(oQueue, "PWFSE_QUEUE_SPAWNER_"+IntToString(nReadPos)))+ "] spawn (copy): "+sRes);
  }
*/
  DeleteLocalString(oQueue, "PWFSE_QUEUE_RESREF_"+IntToString(nReadPos));
  DeleteLocalLocation(oQueue, "PWFSE_QUEUE_LOCATION_"+IntToString(nReadPos));
  DeleteLocalObject(oQueue, "PWFSE_QUEUE_SPAWNER_"+IntToString(nReadPos));
  DeleteLocalInt(oQueue, "PWFSE_QUEUE_OBJTYPE_"+IntToString(nReadPos));
}

// processes global spawn queue
// does only spawn a max amount of objects per second
// recalls itself until the queue is empty
//
// eliminates cpu spikes related to lots of rapid CreateObject calls
//
// but centralized spawning will open more advantages in the future
// besides load balancing...
void PWFSE_ProcessQueue()
{
  object oQueue = GetObjectByTag("PWFSE_PO");
  int i, nWritePos = GetLocalInt(oQueue, "PWFSE_QUEUE_WRITE");
  int nReadPos = GetLocalInt(oQueue, "PWFSE_QUEUE_READ");

  PWFSE_Debug("Queue Read: "+IntToString(nReadPos)+" Write: "+IntToString(nWritePos));

  // still objects in the queue AND not reached max spawns per second ?
  while(nWritePos != nReadPos && i++ < PWFSE_MAX_SPAWNS_PER_SECOND)
    PWFSE_QueueSpawn(oQueue, ++nReadPos); // do the real thing

  // update read position
  SetLocalInt(oQueue, "PWFSE_QUEUE_READ", nReadPos);

  // still spawns in the queue ?
  if(nWritePos != nReadPos)
    DelayCommand(1.0, PWFSE_ProcessQueue()); // continue processing
  else
    DeleteLocalInt(oQueue, "PWFSE_QUEUE_ACTIVE?"); // shutdown queue processing
}

int PWFSE_CreateWeightedList(object oSpawner)
{
  int i, nWeight, nWeightedCount = 0;
  int nObjType, nCount = GetLocalInt(oSpawner, "PWFSE_RESREF_COUNT");

  // get first resref from list
  string sRes = GetLocalString(oSpawner, "PWFSE_RESREF"+IntToString(++nCount));
  while( sRes != "")
  {
    // get resref weight
    nWeight = PWFSE_GetIntParameter(oSpawner, "PWFSE_WEIGHT"+IntToString(nCount));
    // set default weight if needed
    if(nWeight <= 0) nWeight = 1;
    // get object type
    nObjType = PWFSE_GetIntParameter(oSpawner, "PWFSE_OBJTYPE"+IntToString(nCount));
    // set default object type if needed
    if(nObjType == 0) nObjType = OBJECT_TYPE_CREATURE;
    // add resref to weighted list.
    // resrefs with a weight > 1 just get duplicated.
    // we don't need to do any special computing for weighted
    // random draws out of the table that way.
    // we trade speed for memory here...
    if(nObjType != 1)
    {
      // only set non-default object types to conserve memory
      for(i=0;i < nWeight; i++)
      {
        SetLocalString(oSpawner, "PWFSE_WRESREF"+IntToString(++nWeightedCount), sRes);
        SetLocalInt(oSpawner, "PWFSE_WOBJTYPE"+IntToString(nWeightedCount), nObjType);
      }
    }
    else
    {
      // don't set object type
      for(i=0;i < nWeight; i++)
        SetLocalString(oSpawner, "PWFSE_WRESREF"+IntToString(++nWeightedCount), sRes);
    }
    // don't need those vars any longer > delete
    DeleteLocalInt(oSpawner, "PWFSE_RESREF"+IntToString(nCount));
    DeleteLocalInt(oSpawner, "PWFSE_WEIGHT"+IntToString(nCount));
    DeleteLocalInt(oSpawner, "PWFSE_OBJTYPE"+IntToString(nCount));
    // get next resref on list
    sRes = PWFSE_GetStringParameter(oSpawner, "PWFSE_RESREF"+IntToString(++nCount));
  }
  nCount--;
  SetLocalInt(oSpawner, "PWFSE_RESREF_COUNT", nWeightedCount);
  return nWeightedCount;
}

void PWFSE_Despawn(object oSpawner = OBJECT_SELF)
{
  if(GetLocalInt(oSpawner, "PWFSE_WAIT_FOR_DESPAWN?"))
  {
    DeleteLocalInt(oSpawner, "PWFSE_WAIT_FOR_DESPAWN?");
    if( !PWFSE_IsAnyPlayerInArea(GetArea(oSpawner)) )
    {
      PWFSE_DespawnChilds(oSpawner);
    }
  }
}

// fast, loop-free checkspawn routine
// pseudo heartbeat assigned to each spawner ONLY(!) during PC activity.
// will auto-shutdown if area gets empty.
// looks around for mobs linked to oSpawner:
//  - issues a respawn if it can't find any
//  - issues a delayed recheck otherwise
void PWFSE_CheckSpawn(object oSpawner = OBJECT_SELF)
{

  PWFSE_PlugIn_Execute(oSpawner, PWFSE_PLUGIN_HOOK_CHECKSPAWN);

  if(PWFSE_GetIsActive(oSpawner))
  {
    // active respawn timer ?
    if(!PWFSE_GetPendingRespawn(oSpawner))
    {
      if ( !PWFSE_GetHasChilds(oSpawner))
      {
        float fRespawnTime = IntToFloat(PWFSE_GetRandomMMParameter("PWFSE_TIMER_RESPAWN", oSpawner));
        PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] check: respawn in "+FloatToString(fRespawnTime,4,0)+" seconds");
        SetLocalInt(oSpawner, "PWFSE_WAIT_FOR_RESPAWN?", TRUE);
        DelayCommand(fRespawnTime,PWFSE_Respawn(oSpawner));
        // deactivate spawner while we wait for respawn
        PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] check: waiting for respawn > deactivate");
        DeleteLocalInt(oSpawner, "PWFSE_ACTIVE?");
      }
      else
      {
        // any players in area ?
        if( !PWFSE_IsAnyPlayerInArea(GetArea(oSpawner)) )
        {
          // spawn is active + NO PCs in area + we don't wait for respawn + we still have childs running around
          // deactivate spawner
          PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] check: no players > deactivate");
          DeleteLocalInt(oSpawner, "PWFSE_ACTIVE?");

          // start despawn timer
          float fDespawnTime = IntToFloat(PWFSE_GetRandomMMParameter("PWFSE_TIMER_RESPAWN", oSpawner));
          fDespawnTime *= PWFSE_GetIntParameter(oSpawner, "PWFSE_DESPAWN_MODIFIER");
          if(fDespawnTime > 0.0)
          {
            PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] check: despawn in "+FloatToString(fDespawnTime,4,0)+" seconds");
            DelayCommand(fDespawnTime, PWFSE_Despawn(oSpawner));
            SetLocalInt(oSpawner, "PWFSE_WAIT_FOR_DESPAWN?", TRUE);
          }
          else
            PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] check: despawntime = 0 > no despawn");
        }
        else
        {
          // spawn is active + PCs in area + we don't wait for respawn + we still have childs running around
          // issue re-check
          DelayCommand(IntToFloat(PWFSE_GetIntParameter(oSpawner, "PWFSE_TIMER_TICK")),PWFSE_CheckSpawn(oSpawner));
        }
      }
    }
    else
    {
      // spawn is active but issued a respawn already
      // deactivate spawner
      PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] check: waiting for respawn > deactivate");
      DeleteLocalInt(oSpawner, "PWFSE_ACTIVE?");
    }
  }
}

void PWFSE_PrepareSpawn(object oSpawner)
{
  int nNth, i, nCount = PWFSE_GetRandomMMParameter("PWFSE_COUNT", oSpawner);

  int nPCMod = PWFSE_GetIntParameter(oSpawner, "PWFSE_PCCOUNT_MODIFIER");
  if(nPCMod > 0)
    nCount = PWFSE_GetNumPlayersInArea(GetArea(oSpawner)) * nCount * nPCMod;

  PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] prepare spawn: modifier ["+IntToString(nPCMod)+"] - add "+IntToString(nCount)+" objects to queue");

  // set resref parameter object
  object oPO = oSpawner;

  // check for linked resref parameter object
  // available ? use it
  if(GetStringUpperCase(PWFSE_GetStringParameter(oSpawner, "PWFSE_LINK_RESREF")) != "")
    oPO = GetObjectByTag(PWFSE_GetStringParameter(oSpawner, "PWFSE_LINK_RESREF"));

  if(GetIsObjectValid(oPO))
  {
    if( GetLocalInt(oPO, "PWFSE_RESREF_COUNT") == 0) PWFSE_CreateWeightedList(oPO);
    for(i=0;i<nCount;i++)
    {
      nNth = PWFSE_GetRandomObjectIndex(oPO);
      PWFSE_AddToSpawnQueue(PWFSE_GetResRef(oPO, nNth),
                            PWFSE_GetLocation(oSpawner), oSpawner,
                            PWFSE_GetObjectType(oPO, nNth));
    }
  }
  else
    PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] prepare spawn: can't find parameter object");

}

//  -----------------------------------------------------------------------
//                            EXPOSED FUNCTIONS
//  -----------------------------------------------------------------------

void PWFSE_DespawnChilds(object oSpawner = OBJECT_SELF)
{
  int nNth = 1;
  object oChild = GetNearestObjectByTag("PWFSE_SPAWNERID"+ObjectToString(oSpawner), oSpawner, nNth);
  while(oChild != OBJECT_INVALID)
  {
    PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] despawn child: "+GetName(oChild));
    DestroyObject(oChild);
    oChild = GetNearestObjectByTag("PWFSE_SPAWNERID"+ObjectToString(oSpawner), oSpawner, ++nNth);
  }
}

void PWFSE_AddToSpawnQueue(string sResRef, location lLoc, object oSpawner = OBJECT_SELF, int nType = OBJECT_TYPE_CREATURE)
{
  object oQueue = GetObjectByTag("PWFSE_PO");
  int nWritePos = GetLocalInt(oQueue, "PWFSE_QUEUE_WRITE") + 1;

  // this represents the dataset for a single spawn. we add it to the old
  // write position + 1. of course, this data gets deleted after it
  // got processed/spawned
  //
  // we could compress this, but that would take away CPU time. the amount of
  // memory we need is neglectible coz this data is temporary anyway. an idling server
  // will only have a minimal memory fingerprint (only parametrization data)
  // the whole system cleans itself of unneeded variables...
  SetLocalString(oQueue, "PWFSE_QUEUE_RESREF_"+IntToString(nWritePos), sResRef);
  SetLocalLocation(oQueue, "PWFSE_QUEUE_LOCATION_"+IntToString(nWritePos), lLoc);
  SetLocalObject(oQueue, "PWFSE_QUEUE_SPAWNER_"+IntToString(nWritePos), oSpawner);

  if(nType != 1) // set only non-default object types to conserve memory
    SetLocalInt(oQueue, "PWFSE_QUEUE_OBJTYPE_"+IntToString(nWritePos), nType);

  SetLocalInt(oQueue, "PWFSE_QUEUE_WRITE", nWritePos);

  // spawn queue already activ ?
  if(!GetLocalInt(oQueue, "PWFSE_QUEUE_ACTIVE?"))
  {
    // no > activate spawn queue
    SetLocalInt(oQueue, "PWFSE_QUEUE_ACTIVE?", TRUE);
    DelayCommand(0.1,PWFSE_ProcessQueue());
  }
}

int PWFSE_IsAnyPlayerInArea(object oArea)
{
  // this catches alive and dead PCs
  return (GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,
                             PWFSE_GetAnchorWaypoint(oArea), 1, CREATURE_TYPE_IS_ALIVE, TRUE) != OBJECT_INVALID ||
          GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,
                             PWFSE_GetAnchorWaypoint(oArea), 1, CREATURE_TYPE_IS_ALIVE, FALSE) != OBJECT_INVALID
         ) ? TRUE : FALSE;
}

location PWFSE_GetLocation(object oSpawner, int nNth = -1)
{
  string sLink = GetStringUpperCase(PWFSE_GetStringParameter(oSpawner, "PWFSE_LINK_LOCATION"));
  if(sLink != "")
  {
    object oLink  = GetNearestObjectByTag(sLink+"_1", oSpawner);

    if(oLink != OBJECT_INVALID)
    {
      if(nNth == -1)
      {
        int nCount = GetLocalInt(oSpawner, "PWFSE_LINK_LOCATION_COUNT");
        // spawn locations initialized ?
        if(nCount <= 0)
        {
          // count number of location waypoints
          nCount = 0;
          // one time loop
          while(GetNearestObjectByTag(sLink+"_"+IntToString(++nCount), oSpawner) != OBJECT_INVALID) {}
          nCount--;
          SetLocalInt(oSpawner, "PWFSE_LINK_LOCATION_COUNT", nCount);
          PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] get linked location: "+IntToString(nCount)+" locations initialized");
        }
        if(nCount > 0) // get random location
          return GetLocation(GetNearestObjectByTag(sLink+"_"+IntToString(Random(nCount)+1), oSpawner));
      }
      else // get nNth location
        return GetLocation(GetNearestObjectByTag(sLink+"_"+IntToString(nNth), oSpawner));
    }
  }
  return GetLocation(oSpawner);
}

void PWFSE_Respawn(object oSpawner, int nCancelIfEmpty = TRUE)
{
  // return if we don't have a pending respawn flag
  if(!PWFSE_GetPendingRespawn(oSpawner))
    return;
  else  // delete flag
    DeleteLocalInt(oSpawner, "PWFSE_WAIT_FOR_RESPAWN?");

  // shall we do a cancel check ?
  if(nCancelIfEmpty)
  {
    // any player around ?
    if(!PWFSE_IsAnyPlayerInArea(GetArea(oSpawner)))
    {
      PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] respawn: no user -> cancelled");
      // no user -> cancel spawn
      return;
    }
  }
  // spawn
  PWFSE_PrepareSpawn(oSpawner);
  // spawner not active ?
  if(!PWFSE_GetIsActive(oSpawner))
  {
    // activate spawn
    SetLocalInt(oSpawner, "PWFSE_ACTIVE?", TRUE);
    // activate checkspawn pseudo hb
    int nTick = PWFSE_GetIntParameter(oSpawner, "PWFSE_TIMER_TICK");
    PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] respawn: re-activate, tick:"+IntToString(nTick));
    DelayCommand(IntToFloat(nTick),PWFSE_CheckSpawn(oSpawner));
  }
}

void PWFSE_DeactivateSingleSpawn(object oSpawner = OBJECT_SELF)
{
  DeleteLocalInt(oSpawner, "PWFSE_ACTIVE?");
}

// activate all spawns
void PWFSE_DeactivateAllSpawnsInArea(object oArea)
{
  int nNth = 1;
  object oAnchor = PWFSE_GetAnchorWaypoint(oArea);
  object oWP = GetNearestObjectByTag("PWFSE_SPAWNER", oAnchor, nNth);
  while(oWP != OBJECT_INVALID)
  {
    PWFSE_DeactivateSingleSpawn(oWP);
    oWP = GetNearestObjectByTag("PWFSE_SPAWNER", oAnchor, ++nNth);
  }
}

// activate single spawner
void PWFSE_ActivateSingleSpawner(object oSpawner)
{
  // respawn timer not active ?
  if(!PWFSE_GetPendingRespawn(oSpawner))
  {
    // spawn not active ?
    if( !PWFSE_GetIsActive(oSpawner) )
    {
      // execute activate hook
      // check if customs script set the "skip_activation" toggle
      PWFSE_PlugIn_Execute(oSpawner, PWFSE_PLUGIN_HOOK_ACTIVATE);
      if(!GetLocalInt(oSpawner, "PWFSE_SKIP_ACTIVATION"))
      {
        // any childs around from this spawner ?
        if ( PWFSE_GetHasChilds(oSpawner) )
        {
          PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] activation: re-activate");
          // re-activate spawner
          SetLocalInt(oSpawner, "PWFSE_ACTIVE?", TRUE);
          // activate checkspawn pseudo hb
          PWFSE_CheckSpawn(oSpawner);
        }
        else
        {
          // forced initial spawn
          PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] activation: instant spawn");
          SetLocalInt(oSpawner, "PWFSE_WAIT_FOR_RESPAWN?", TRUE);
          PWFSE_Respawn(oSpawner);
        }
      }
      else
      {
        PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] activation: skip...");
        DeleteLocalInt(oSpawner, "PWFSE_SKIP_ACTIVATION");
      }
    }
    else
    {
      PWFSE_Debug("spawner ["+ObjectToString(oSpawner)+"] activation: already active, no action");
    }
  }
  else
  {
    PWFSE_Debug("Spawner ["+ObjectToString(oSpawner)+"] activation: waiting for respawn, no action");
  }
}

// activate all spawns
void PWFSE_ActivateAllSpawnsInArea(object oArea)
{
  int nNth = 1;
  object oWP, oAnchor = PWFSE_GetAnchorWaypoint(oArea);
  // scan for spawners , activate them
  // use oAnchor as a "safe" target object & cache
  oWP = GetNearestObjectByTag("PWFSE_SPAWNER", oAnchor, nNth);
  while(oWP != OBJECT_INVALID)
  {
    PWFSE_ActivateSingleSpawner(oWP);
    //SetLocalObject(oAnchor, "PWFSE_SPAWNER_CACHE#"+IntToString(nNth), oWP);
    oWP = GetNearestObjectByTag("PWFSE_SPAWNER", oAnchor, ++nNth);
  }
}




