//
//
//   Spawn v7.0
//   Spawn Main
//
//   Do NOT Modify this File
//   See 'spawn__readme' for Instructions
//

// Function Includes
#include "spawn_functions"
//

// Configuration Includes
#include "spawn_cfg_flag"
#include "spawn_cfg_group"
#include "spawn_cfg_global"
#include "spawn_cfg_loot"
#include "spawn_cfg_camp"
#include "spawn_cfg_fxsp"
#include "spawn_cfg_fxae"
#include "spawn_cfg_fxobj"
//

// Check Includes
#include "spawn_chk_pcs"
#include "spawn_chk_custom"
//

// Declare Function Includes
void SetGlobalDefaults();
void InitFlags(object oSpawn, string sSpawnName);
int SetSpawns(location lBase);
string PadIntToString(int nInt, int nDigits);
int CountPCsInArea(object oArea = OBJECT_INVALID, int nDM = FALSE);
int CountPCsInRadius(location lCenter, float fRadius, int nDM = FALSE);
object GetRandomPCInArea(object oArea, object oSpawn);
int ParseFlagValue(string sName, string sFlag, int nDigits, int nDefault);
int ParseSubFlagValue(string sName, string sFlag, int nDigits, string sSubFlag, int nSubDigits, int nDefault);
int IsBetweenDays(int nCheckDay, int nDayStart, int nDayEnd);
int IsBetweenHours(int nCheckHour, int nHourStart, int nHourEnd);
void RandomWalk(object oSpawn, object oSpawned, float fWalkingRadius, int nRun);
void FindSeat(object oSpawn, object oSpawned);
void SetPatrolRoute(int nPatrolRoute);
void DoPatrolRoute(int nPatrolRoute, int nRouteType);
void AddPatrolStop(int nPatrolRoute, int nStopNumber);
int CampState(object oCamp);
void DestroyCamp(object oCamp, float fCampDecay);
//

// Declare Configuration Includes
void LootTable(object oSpawn, object oSpawned, int nLootTable);
string SpawnGroup(object oSpawn, string sTemplate);
int SpawnCheckCustom(object oSpawn);
int SpawnCheckPCs(object oSpawn);
effect SpawnAreaEffect(object oSpawn);
effect ObjectEffect(object oSpawn);
int SpawnEffect(object oSpawn, int nSpawnEffect, int nDespawnEffect);
void SetCampSpawn(object oCamp, string sCamp, location lCamp);
//

//Declare Functions we Define after Main Function
void ProcessSpawn(object oSpawn, int nProcessFrequency);
void DoSpawn(object oSpawn);
object CampSpawn(object oSpawn, string sCamp, location lCamp);
object DoCampSpawn(object oCamp, location lCamp, float fSpawnRadius, string sTemplate, int nPlaceable, int nSpawnNumber, int nCampCenter);
//

// The Spawn Function
void Spawn()
{
    // Check Area State
    if (GetLocalInt(OBJECT_SELF, "AreaSpawnsDeactivated") == TRUE)
    {
        return;
    }

    // Declare Variables
    object oSpawn;
    string sSpawnName, sSpawnNum;
    int nSpawnDeactivated;
    int nProcessSpawn;
    int nCurrentProcessTick;
    int nProcessFrequency;
    int nInitialDelay;
    int nNth = 1;

    location lBase = Location(OBJECT_SELF, Vector(), 0.0);

    // Set Global Defaults
    if (GetLocalInt(GetModule(), "GlobalDefaultsInitialized") == FALSE)
    {
        SetGlobalDefaults();
    }

    // Set Spawns
    int nSpawns = GetLocalInt(OBJECT_SELF, "Spawns");
    if (nSpawns == 0)
    {
        nSpawns = SetSpawns(lBase);
    }

    // Enumerate Waypoints in the Area
    for (nNth = 1; nNth <= nSpawns; nNth++)
    {
        // Retrieve Spawn
        sSpawnNum = "Spawn" + PadIntToString(nNth, 2);
        oSpawn = GetLocalObject(OBJECT_SELF, sSpawnNum);
        sSpawnName = GetName(oSpawn);

        // Only Process every nProcessFrequency Seconds
        nProcessSpawn = FALSE;
        // Check SP00 or SP_
        if (GetSubString(sSpawnName, 2, 1) == "_" || GetStringLength(sSpawnName) == 2)
        {
            nProcessFrequency = 1;
            nProcessSpawn = TRUE;
        }
        else
        {
            nProcessFrequency = ParseFlagValue(sSpawnName, "SP", 2, 1);
            // Must be Greater than 0 Heartbeats
            if (nProcessFrequency == 0)
            {
                nProcessFrequency = 1;
            }

            nCurrentProcessTick = GetLocalInt(oSpawn, "CurrentProcessTick");

            // Check Initial Delay
            nInitialDelay = GetLocalInt(oSpawn, "f_InitialDelay");
            if (nCurrentProcessTick == 0)
            {
                if (nInitialDelay == 0)
                {
                    nProcessSpawn == TRUE;
                    SetLocalInt(oSpawn, "CurrentProcessTick", 1);
                }
            }
            else
            {
                nCurrentProcessTick++;
                if (nCurrentProcessTick >= nProcessFrequency)
                {
                    // Reset Counter Tick
                    SetLocalInt(oSpawn, "CurrentProcessTick", 1);

                    // Set Spawn Process State
                    nProcessSpawn = TRUE;
                }
                else
                {
                    // Increment Counter Tick
                    SetLocalInt(oSpawn, "CurrentProcessTick", nCurrentProcessTick);
                }
            }

        }

        // Check if Deactivated
        nSpawnDeactivated = GetLocalInt(oSpawn, "SpawnDeactivated");
        if (nSpawnDeactivated == TRUE)
        {
            nProcessSpawn = FALSE;
        }

        // Process the Spawn
        if (nProcessSpawn == TRUE)
        {
            DelayCommand(0.0, ProcessSpawn(oSpawn, nProcessFrequency));
        }
    }
}
//

// This Function Processes a Spawn
void ProcessSpawn(object oSpawn, int nProcessFrequency)
{
    // Initialize Miscellaneous
    int iCount;
    int jCount;

    // Initialize Spawn and Spawned
    object oCreature, oChild;
    int nSpawnChild, nSpawnCount, nCurrentChildren;
    int nChildSlot, nEmptyChildSlot, nEmptyChildSlots;
    string sChildSlot, sEmptyChildSlot, sChild;
    int nSpawnBlock, nSpawnDespawn, nDespawning;
    int nCurrentTick, nNextSpawnTick;
    string sSpawnName = GetName(oSpawn);
    string sSpawnTag = GetTag(oSpawn);
    location lSpawn = GetLocation(oSpawn);
    int nChildrenSpawned = GetLocalInt(oSpawn, "ChildrenSpawned");
    int nProcessesPerMinute = 60 / (nProcessFrequency * 6);

    // Initialize Flags
    if (GetLocalInt(oSpawn, "FlagsInitialized") == FALSE)
    {
        InitFlags(oSpawn, sSpawnName);
    }

    // Get New Name and Tag
    sSpawnName = GetLocalString(oSpawn, "f_Flags");
    sSpawnTag = GetLocalString(oSpawn, "f_Template");

    // Initialize InitialState
    int nInitialState = GetLocalInt(oSpawn, "f_InitialState");
    int nInitialDelay = GetLocalInt(oSpawn, "f_InitialDelay");

    // Set Initial Delay
    if (nInitialDelay > 0)
    {
        if (GetLocalInt(oSpawn, "InitialDelaySet") == FALSE)
        {
            nNextSpawnTick = nProcessesPerMinute * nInitialDelay;
            SetLocalInt(oSpawn, "NextSpawnTick", nNextSpawnTick);
            SetLocalInt(oSpawn, "InitialDelaySet", TRUE);
        }
    }

    // Initialize SpawnDelay
    int nSpawnDelay = GetLocalInt(oSpawn, "f_SpawnDelay");
    int nDelayRandom = GetLocalInt(oSpawn, "f_DelayRandom");
    int nDelayMinimum = GetLocalInt(oSpawn, "f_DelayMinimum");

    // Initialize SpawnNumber
    int nRndSpawnNumber;
    int nSpawnNumber = GetLocalInt(oSpawn, "f_SpawnNumber");
    int nSpawnNumberMax = GetLocalInt(oSpawn, "f_SpawnNumberMax");
    int nSpawnNumberMin = GetLocalInt(oSpawn, "f_SpawnNumberMin");
    int nSpawnAllAtOnce = GetLocalInt(oSpawn, "f_SpawnAllAtOnce");
    int nSpawnNumberAtOnce = GetLocalInt(oSpawn, "f_SpawnNumberAtOnce");
    int nSpawnNumberAtOnceMin = GetLocalInt(oSpawn, "f_SpawnNumberAtOnceMin");

    // Initialize Day/Night Only
    int nDayOnly = GetLocalInt(oSpawn, "f_DayOnly");
    int nDayOnlyDespawn = GetLocalInt(oSpawn, "f_DayOnlyDespawn");
    int nNightOnly = GetLocalInt(oSpawn, "f_NightOnly");
    int nNightOnlyDespawn = GetLocalInt(oSpawn, "f_NightOnlyDespawn");

    // Initialize Day/Hour Spawns
    int nDay, nHour;
    int nSpawnDayStart = GetLocalInt(oSpawn, "f_SpawnDayStart");
    int nSpawnDayEnd = GetLocalInt(oSpawn, "f_SpawnDayEnd");
    int nSpawnHourStart = GetLocalInt(oSpawn, "f_SpawnHourStart");
    int nSpawnHourEnd = GetLocalInt(oSpawn, "f_SpawnHourEnd");

    // Initialize RandomWalk
    int nRandomWalk = GetLocalInt(oSpawn, "f_RandomWalk");
    float fWanderRange = GetLocalFloat(oSpawn, "f_WanderRange");

    // Initialize ReturnHome
    int nReturnHome = GetLocalInt(oSpawn, "f_ReturnHome");
    float fReturnHomeRange = GetLocalFloat(oSpawn, "f_ReturnHomeRange");

    // Initialize PCCheck
    int nCurrentPCCheckTick;
    int nPCCheck = GetLocalInt(oSpawn, "f_PCCheck");
    int nPCCheckDelay = GetLocalInt(oSpawn, "f_PCCheckDelay");
    int nPCReset = GetLocalInt(oSpawn, "f_PCReset");

    // Initialize RandomGold
    int nGoldAmount;
    int nRandomGold = GetLocalInt(oSpawn, "f_RandomGold");
    int nRandomGoldMin = GetLocalInt(oSpawn, "f_RandomGoldMin");
    int nGoldChance = GetLocalInt(oSpawn, "f_GoldChance");

    // Initialize Spawn Effects
    effect sSpawn, eDespawn;
    int nSpawnEffect = GetLocalInt(oSpawn, "f_SpawnEffect");
    int nDespawnEffect = GetLocalInt(oSpawn, "f_DespawnEffect");

    // Initialize Patrol Routes
    int nPatrolScriptRunning;
    int nPatrolRoute = GetLocalInt(oSpawn, "f_PatrolRoute");
    int nRouteType = GetLocalInt(oSpawn, "f_RouteType");

    // Initialize Placeables
    int nLootTick, nNextLootTick;
    int nPlaceable = GetLocalInt(oSpawn, "f_Placeable");
    int nPlaceableType = GetLocalInt(oSpawn, "f_PlaceableType");
    int nTrapDisabled = GetLocalInt(oSpawn, "f_TrapDisabled");

    // Initialize SpawnGroups
    int nSpawnGroup = GetLocalInt(oSpawn, "f_SpawnGroup");

    // Initialize LootTable
    int nLootTable = GetLocalInt(oSpawn, "f_LootTable");

    // Initialize Spawn Deactivation
    int nSpawnDeactivated, nRunDeactivateScript, nSpawnAgeTick;
    int nDeactivateSpawn = GetLocalInt(oSpawn, "f_DeactivateSpawn");
    int nDeactivateScript = GetLocalInt(oSpawn, "f_DeactivateScript");
    int nDeactivationInfo = GetLocalInt(oSpawn, "f_DeactivationInfo");
    int nForceDeactivateSpawn = GetLocalInt(oSpawn, "ForceDeactivateSpawn");

    // Initialize Child Lifespan
    int nChildAge, nChildLifespan;
    int nChildLifespanMax = GetLocalInt(oSpawn, "f_ChildLifespanMax");
    int nChildLifespanMin = GetLocalInt(oSpawn, "f_ChildLifespanMin");

    // Initialize SpawnRadius
    float fSpawnRadius = GetLocalFloat(oSpawn, "f_SpawnRadius");
    float fSpawnRadiusMin = GetLocalFloat(oSpawn, "f_SpawnRadiusMin");
    int nSpawnNearPCs = GetLocalInt(oSpawn, "f_SpawnNearPCs");

    // Initialize SpawnUnseen
    float fSpawnUnseen = GetLocalFloat(oSpawn, "f_SpawnUnseen");

    // Initialize CorpseDecay
    float fCorpseDecay = GetLocalFloat(oSpawn, "f_CorpseDecay");
    int nCorpseDecayType = GetLocalInt(oSpawn, "f_CorpseDecayType");

    // Initialize SpawnCamp
    int nSpawnCamp = GetLocalInt(oSpawn, "f_SpawnCamp");
    float fCampDecay = GetLocalFloat(oSpawn, "f_CampDecay");

    // Initialize SpawnScripts
    int nSpawnScript = GetLocalInt(oSpawn, "f_SpawnScript");
    int nDespawnScript = GetLocalInt(oSpawn, "f_DespawnScript");

    // Initialize DeathScripts
    int nDeathScript = GetLocalInt(oSpawn, "f_DeathScript");

    // Initialize SpawnCheckCustom
    int nSpawnCheckCustom = GetLocalInt(oSpawn, "f_SpawnCheckCustom");

    // Initialize SpawnCheckPCs
    int nSpawnCheckPCs = GetLocalInt(oSpawn, "f_SpawnCheckPCs");

    // Intialize SpawnTrigger
    float fSpawnTrigger = GetLocalFloat(oSpawn, "f_SpawnTrigger");
    float fDespawnTrigger = GetLocalFloat(oSpawn, "f_DespawnTrigger");

    // Initialize AreaEffect
    int nSpawnAreaEffect = GetLocalInt(oSpawn, "f_SpawnAreaEffect");
    float fAreaEffectDuration = GetLocalFloat(oSpawn, "f_AreaEffectDuration");

    // Initialize ObjectEffect
    int nObjectEffect = GetLocalInt(oSpawn, "f_ObjectEffect");
    float fObjectEffectDuration = GetLocalFloat(oSpawn, "f_ObjectEffectDuration");

    // Initialize RandomSpawn
    int nRandomSpawn = GetLocalInt(oSpawn, "f_RandomSpawn");

    // Initialize SpawnFaction
    int nSpawnFaction = GetLocalInt(oSpawn, "f_SpawnFaction");

    // Initialize SpawnAlignment
    int nSpawnAlignment = GetLocalInt(oSpawn, "f_SpawnAlignment");
    int nAlignmentShift = GetLocalInt(oSpawn, "f_AlignmentShift");

    // Initialize Heartbeat Script
    int nHeartbeatScript = GetLocalInt(oSpawn, "f_HeartbeatScript");

    // Initialize SpawnLocation
    int nSpawnLocation = GetLocalInt(oSpawn, "f_SpawnLocation");
    int nSpawnLocationMin = GetLocalInt(oSpawn, "f_SpawnLocationMin");

    // Initialize SpawnFacing
    int nFacing = GetLocalInt(oSpawn, "f_Facing");
    float fSpawnFacing = GetLocalFloat(oSpawn, "f_SpawnFacing");

    // Initialize EntranceExit
    float fEntranceExitX, fEntranceExitY;
    vector vEntranceExit;
    string sEntranceExit, sExit;
    location lEntranceExit, lExit;
    int nRndExit;
    object oExit;
    int nEntranceExit = GetLocalInt(oSpawn, "f_EntranceExit");
    int nEntranceExitMin = GetLocalInt(oSpawn, "f_EntranceExitMin");
    int nExit = GetLocalInt(oSpawn, "f_Exit");
    int nExitMin = GetLocalInt(oSpawn, "f_ExitMin");

    // Initialize HealChildren
    int nHealAmount;
    effect eEffect;
    int nHealChildren = GetLocalInt(oSpawn, "f_HealChildren");
    int nHealEffects = GetLocalInt(oSpawn, "f_HealEffects");

    // Initialize SpawnItem
    int nSpawnItem = GetLocalInt(oSpawn, "f_SpawnItem");

    // Initialize SpawnSit
    int nSpawnSit = GetLocalInt(oSpawn, "f_SpawnSit");

    // Initialize SpawnPlot
    int nSpawnPlot = GetLocalInt(oSpawn, "f_SpawnPlot");

    // Initialize SpawnMerchant
    int nSpawnMerchant = GetLocalInt(oSpawn, "f_SpawnMerchant");

    // Enumerate oSpawned Children
    nChildSlot = 1;
    nSpawnCount = 0;
    nEmptyChildSlot = 0;
    nEmptyChildSlots = 0;
    for (nChildSlot = 1; nChildSlot <= nSpawnNumber; nChildSlot++)
    {
        // Starting Conditional
        nSpawnDespawn = FALSE;
        nDespawning = FALSE;

        // Retrieve Child
        sChildSlot = "ChildSlot" + PadIntToString(nChildSlot, 2);
        oCreature = GetLocalObject(oSpawn, sChildSlot);

        // Check if this is Child Slot is Valid
        if (GetIsObjectValid(oCreature) == FALSE)
        {
            // Empty Slot
            nEmptyChildSlots++;
            if (nEmptyChildSlot == 0)
            {
                nEmptyChildSlot = nChildSlot;
                sEmptyChildSlot = sChildSlot;
            }
        }
        else
        {
            if (nPlaceable == FALSE && nSpawnCamp == FALSE && nSpawnItem == FALSE)
            {
                // Check for Corpses
                if (GetIsDead(oCreature) == FALSE)
                {
                    nSpawnChild = TRUE;
                }
                else
                {
                    // Empty Slot
                    nEmptyChildSlots++;
                    if (nEmptyChildSlot == 0)
                    {
                        nEmptyChildSlot = nChildSlot;
                        sEmptyChildSlot = sChildSlot;
                    }

                    // Run Death Script
                    if (nDeathScript > -1 && GetLocalInt(oCreature, "DeathScriptRan") == FALSE)
                    {
                        SetLocalInt(oCreature, "DeathScript", nDeathScript);
                        ExecuteScript("spawn_sc_death", oCreature);
                        if (fCorpseDecay == 0.0)
                        {
                            AssignCommand(oCreature, SetIsDestroyable(TRUE, FALSE, FALSE));
                        }
                    }

                    // Spawn Corpse if Dead and No Corpse
                    if (fCorpseDecay > 0.0 && GetLocalObject(oCreature, "Corpse") == OBJECT_INVALID)
                    {
                        ExecuteScript("spawn_corpse_dth", oCreature);
                    }
                }
            }
            else
            {
                nSpawnChild = TRUE;
            }
        }

        if (nSpawnChild == TRUE)
        {
            // Add to Count Total
            nSpawnCount++;
            nSpawnBlock = FALSE;

            // Check Despawning
            nDespawning = GetLocalInt(oCreature, "Despawning");

            // Check Force Despawn
            if (GetLocalInt(oCreature, "ForceDespawn") == TRUE)
            {
                nDespawning = TRUE;
                nSpawnDespawn = TRUE;
            }

            // Increment Child's Age
            nChildAge = GetLocalInt(oCreature, "ChildAge");
            nChildAge = nChildAge + nProcessFrequency * 6;
            SetLocalInt(oCreature, "ChildAge", nChildAge);

            // Get Creature Home
            float fHomeX = GetLocalFloat(oCreature, "HomeX");
            float fHomeY = GetLocalFloat(oCreature, "HomeY");
            vector vHome = Vector(fHomeX, fHomeY, 0.0);
            location lHome = Location(OBJECT_SELF, vHome, 0.0);

            // Check Facing
            float fChildFacing = GetLocalFloat(oCreature, "SpawnFacing");

            // Check Lifespan
            if (nChildLifespanMax > -1)
            {
                nChildLifespan = GetLocalInt(oCreature, "Lifespan");
                if (nChildAge >= nChildLifespan)
                {
                    nSpawnDespawn = TRUE;
                }
            }

            // Day Only
            if (nDayOnlyDespawn == TRUE && (nDayOnly == TRUE && (GetIsDay() == FALSE && GetIsDawn() == FALSE)))
            {
                nSpawnDespawn = TRUE;
            }

            // Night Only
            if (nNightOnlyDespawn == TRUE && (nNightOnly == TRUE && (GetIsNight() == FALSE && GetIsDusk() == FALSE)))
            {
                nSpawnDespawn = TRUE;
            }

            // Check Against Day
            if (nSpawnDayStart > -1)
            {
                nDay = GetCalendarDay();
                if (IsBetweenDays(nDay, nSpawnDayStart, nSpawnDayEnd) == FALSE)
                {
                    nSpawnDespawn = TRUE;
                }
            }

            // Check Against Hour
            if (nSpawnHourStart > -1)
            {
                nHour = GetTimeHour();
                if (IsBetweenHours(nHour, nSpawnHourStart, nSpawnHourEnd) == FALSE)
                {
                    nSpawnDespawn = TRUE;
                }
            }

            // Random Walk
            if (nRandomWalk == TRUE && nDespawning == FALSE && nSpawnDespawn == FALSE)
            {
                if (GetCurrentAction(oCreature) != 36 && !GetIsInCombat(oCreature) && !IsInConversation(oCreature))
                {
                    if (d2(1) == 2)
                    {
                        if (fWanderRange > 0.0)
                        {
                            AssignCommand(oCreature, ClearAllActions());
                            RandomWalk(oSpawn, oCreature, fWanderRange, FALSE);
                        }
                        else
                        {
                            AssignCommand(oCreature, ClearAllActions());
                            AssignCommand(oCreature, ActionRandomWalk());
                        }
                    }
                }
            }

            // Patrol
            if (nPatrolRoute > -1 && nDespawning == FALSE && nSpawnDespawn == FALSE)
            {
                if (!GetIsInCombat(oCreature) && !IsInConversation(oCreature))
                {
                    nPatrolScriptRunning = GetLocalInt(oCreature, "PatrolScriptRunning");
                    if (GetCurrentAction(oCreature) == ACTION_INVALID && nPatrolScriptRunning == FALSE)
                    {
                        // He's Slacking!  Send him back to work!
                        AssignCommand(oCreature, ClearAllActions());
                        AssignCommand(oCreature, SetPatrolRoute(nPatrolRoute));
                        AssignCommand(oCreature, DoPatrolRoute(nPatrolRoute, nRouteType));
                    }
                }
                else if (IsInConversation(oCreature) == TRUE)
                {
                    // Reset Script State
                    SetLocalInt(oCreature, "PatrolScriptRunning", FALSE);
                }
            }

            // ReturnHome
            if (nReturnHome == TRUE && nDespawning == FALSE && nSpawnDespawn == FALSE)
            {
                if (GetDistanceBetweenLocations(lHome, GetLocation(oCreature)) > fReturnHomeRange)
                {
                    if (!GetIsInCombat(oCreature) && !IsInConversation(oCreature))
                    {
                        // Send them back to Home
                        AssignCommand(oCreature, ClearAllActions());
                        AssignCommand(oCreature, ActionMoveToLocation(lHome));
                        if (nFacing == TRUE)
                        {
                            AssignCommand(oCreature, ActionDoCommand(SetFacing(fChildFacing)));
                        }
                    }
                }
            }

            // PC Check
            if (nPCCheck == TRUE)
            {
                // Check for PCs
                if (CountPCsInArea(OBJECT_SELF, TRUE) == 0)
                {
                    int nPCCheckCurrentTick = GetLocalInt(oSpawn, "PCCheckCurrentTick");
                    nPCCheckCurrentTick++;
                    SetLocalInt(oSpawn, "PCCheckCurrentTick", nPCCheckCurrentTick);
                    if (nPCCheckCurrentTick >= nPCCheckDelay * nProcessesPerMinute)
                    {
                        nSpawnDespawn = TRUE;
                        if (nPCReset == TRUE)
                        {
                            // Reset the Spawn
                            SetLocalInt(oSpawn, "CurrentTick", 0);
                            SetLocalInt(oSpawn, "NextSpawnTick", 0);
                            SetLocalInt(oSpawn, "SpawnDeactivated", FALSE);
                            SetLocalInt(oSpawn, "ChildrenSpawned", 0);
                        }
                    }
                }
                else
                {
                    SetLocalInt(oSpawn, "PCCheckCurrentTick", 0);
                }
            }

            // Check Camp
            if (nSpawnCamp == TRUE)
            {
                if (CampState(oCreature) == 0)
                {
                    nSpawnDespawn = TRUE;
                }
            }

            // Check Trigger
            if (fDespawnTrigger > 0.0)
            {
                if (CountPCsInRadius(lSpawn, fDespawnTrigger, TRUE) == 0)
                {
                    nSpawnDespawn = TRUE;
                }
            }

            // Check Placeable
            if (nPlaceable == TRUE)
            {
                // Despawn if Empty
                if (nPlaceableType == 1)
                {
                    if (GetFirstItemInInventory(oCreature) == OBJECT_INVALID)
                    {
                        nSpawnDespawn = TRUE;
                    }
                }
                // Generate Loot if Empty
                if (nPlaceableType == 2)
                {
                    if (GetFirstItemInInventory(oCreature) == OBJECT_INVALID && GetIsOpen(oCreature) == FALSE)
                    {
                        // Check Delay Counter
                        nLootTick = GetLocalInt(oCreature, "LootTick");
                        nNextLootTick= GetLocalInt(oCreature, "NextLootTick");
                        if (nLootTick >= nProcessesPerMinute * nSpawnDelay)
                        {
                            // Give Random Gold
                            if (nRandomGold > 0)
                            {
                                if (d100(1) <= nGoldChance)
                                {
                                    // Calculate Gold to Drop
                                    nGoldAmount = Random(nRandomGold + 1);
                                    while (nGoldAmount < nRandomGoldMin)
                                    {
                                        nGoldAmount = Random(nRandomGold + 1);
                                    }
                                    // Give Gold
                                    CreateItemOnObject("nw_it_gold001", oCreature, nGoldAmount);
                                }
                            }
                            // Generate New Loot
                            if (nLootTable > -1)
                            {
                                LootTable(oSpawn, oCreature, nLootTable);
                            }
                            // Set up Delay
                            SetLocalInt(oCreature, "LootTick", 0);
                            if (nDelayRandom == TRUE)
                            {
                                nNextLootTick = -1;
                                while (nNextLootTick < nProcessesPerMinute * nDelayMinimum)
                                {
                                    nNextLootTick = Random(nProcessesPerMinute * nSpawnDelay) + 1;
                                }
                            }
                            else
                            {
                                // Setup Next Spawn
                                nNextLootTick = nProcessesPerMinute * nSpawnDelay;
                            }
                            SetLocalInt(oCreature, "NextLootTick", nNextLootTick);
                        }
                        else
                        {
                            // Increment Counter
                            nLootTick++;
                            SetLocalInt(oCreature, "LootTick", nLootTick);
                        }
                    }
                }
            }

            // Run Heartbeat Script
            if (nHeartbeatScript > -1 && nDespawning == FALSE && nSpawnDespawn == FALSE)
            {
                SetLocalInt(oCreature, "HeartbeatScript", nHeartbeatScript);
                ExecuteScript("spawn_sc_hbeat", oCreature);
            }

            // Set Facing
            if (nFacing == TRUE && nDespawning == FALSE)
            {
                if (GetFacing(oCreature) != fChildFacing && IsInConversation(oCreature) == FALSE && GetIsInCombat(oCreature) == FALSE && GetDistanceBetweenLocations(lHome, GetLocation(oCreature)) < 1.0)
                {
                    AssignCommand(oCreature, ActionDoCommand(SetFacing(fChildFacing)));
                }
            }

            // Heal Children
            if (nHealChildren > 0)
            {
                if (GetIsInCombat(oCreature) == FALSE && (GetMaxHitPoints(oCreature) != GetCurrentHitPoints(oCreature)))
                {
                    nHealAmount = FloatToInt(IntToFloat(GetMaxHitPoints(oCreature)) * (IntToFloat(nHealChildren) / 100.0));
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHealAmount), oCreature, 0.0);
                    if (nHealEffects == TRUE)
                    {
                        eEffect = GetFirstEffect(oCreature);
                        while (GetIsEffectValid(eEffect) == TRUE)
                        {
                            RemoveEffect(oCreature, eEffect);
                            eEffect = GetNextEffect(oCreature);
                        }
                    }
                }
            }

            // Spawn Sit
            if (nSpawnSit == TRUE && nDespawning == FALSE)
            {
                if (GetCurrentAction(oCreature) != ACTION_SIT)
                {
                    if (GetIsInCombat(oCreature) == FALSE && IsInConversation(oCreature) == FALSE)
                    {
                        FindSeat(oSpawn, oCreature);
                    }
                }
            }

            // Check if Item is Possessed by Someone
            if (nSpawnItem == TRUE)
            {
                if (GetItemPossessor(oCreature) != OBJECT_INVALID)
                {
                    // Remove Child Status
                    DeleteLocalObject(oSpawn, GetLocalString(oCreature, "ParentChildSlot"));
                }
            }

            // Population Control
            if (nSpawnCount > nSpawnNumber)
            {
                nSpawnDespawn = TRUE;
                nSpawnBlock = TRUE;
            }
        }

        // Despawn Creatures
        if (nSpawnDespawn == TRUE)
        {
            SetLocalInt(oCreature, "Despawning", TRUE);
            if (nSpawnPlot == TRUE)
            {
                SetPlotFlag(oCreature, FALSE);
            }
            if (nPlaceable == TRUE || nSpawnCamp == TRUE || nSpawnItem == TRUE || nSpawnMerchant == TRUE)
            {
                if (nDespawnScript > -1)
                {
                    SetLocalInt(oCreature, "DespawnScript", nDespawnScript);
                    ExecuteScript("spawn_sc_spawn", oCreature);
                }
                if (nSpawnCamp == TRUE)
                {
                    DestroyCamp(oCreature, fCampDecay);
                }
                if (nDespawnEffect > 0)
                {
                    eDespawn = EffectVisualEffect(SpawnEffect(oSpawn, FALSE, TRUE));
                    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eDespawn, GetLocation(oCreature), 5.0);
                }
                DeleteLocalObject(oSpawn, GetLocalString(oCreature, "ParentChildSlot"));
                AssignCommand(oCreature, SetIsDestroyable(TRUE, FALSE, FALSE));
                DestroyObject(oCreature);
                nSpawnCount--;
            }
            else
            {
                if ((!GetIsInCombat(oCreature) && !IsInConversation(oCreature)) || (nPCCheck == TRUE && CountPCsInArea() == 0))
                {
                    if (nEntranceExit > -1)
                    {
                        if (nExit > -1)
                        {
                            if (nExitMin > -1)
                            {
                                nRndExit = Random(nExit + 1);
                                while (nRndExit < nExitMin)
                                {
                                    nRndExit = Random(nExit + 1);
                                }
                                nExit = nRndExit;
                            }
                            sExit = "EX" + PadIntToString(nExit, 2);
                            oExit = GetNearestObjectByTag(sExit, oSpawn);
                            lExit = GetLocation(oExit);
                            AssignCommand(oCreature, ClearAllActions());
                            AssignCommand(oCreature, ActionMoveToLocation(lExit));
                        }
                        else
                        {
                            // Get Creature EntranceExit
                            fEntranceExitX = GetLocalFloat(oCreature, "EntranceExitX");
                            fEntranceExitY = GetLocalFloat(oCreature, "EntranceExitY");
                            vEntranceExit = Vector(fEntranceExitX, fEntranceExitY, 0.0);
                            lEntranceExit = Location(OBJECT_SELF, vEntranceExit, 0.0);
                            AssignCommand(oCreature, ClearAllActions());
                            AssignCommand(oCreature, ActionMoveToLocation(lEntranceExit));
                        }
                        if (nDespawnScript > -1)
                        {
                            SetLocalInt(oCreature, "DespawnScript", nDespawnScript);
                            ExecuteScript("spawn_sc_spawn", oCreature);
                        }
                        if (nDespawnEffect > 0)
                        {
                            eDespawn = EffectVisualEffect(SpawnEffect(oSpawn, FALSE, TRUE));
                            AssignCommand(oCreature, ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eDespawn, GetLocation(oCreature), 5.0)));
                        }
                        AssignCommand(oCreature, ActionDoCommand(DeleteLocalObject(oSpawn, GetLocalString(oCreature, "ParentChildSlot"))));
                        AssignCommand(oCreature, SetIsDestroyable(TRUE, FALSE, FALSE));
                        AssignCommand(oCreature, ActionDoCommand(DestroyObject(oCreature)));
                    }
                    else
                    {
                        if (nDespawnScript > -1)
                        {
                            SetLocalInt(oCreature, "DespawnScript", nDespawnScript);
                            ExecuteScript("spawn_sc_spawn", oCreature);
                        }
                        if (nDespawnEffect > 0)
                        {
                            eDespawn = EffectVisualEffect(SpawnEffect(oSpawn, FALSE, TRUE));
                            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eDespawn, GetLocation(oCreature), 5.0);
                        }
                        DeleteLocalObject(oSpawn, GetLocalString(oCreature, "ParentChildSlot"));
                        AssignCommand(oCreature, SetIsDestroyable(TRUE, FALSE, FALSE));
                        DestroyObject(oCreature);
                    }
                    nSpawnCount--;
                }
            }
        }
    }

    // Record SpawnCount
    SetLocalInt(oSpawn, "SpawnCount", nSpawnCount);
    if (nSpawnCount == 0 && nSpawnNumberMin > -1)
    {
        nRndSpawnNumber = Random(nSpawnNumberMax + 1);
        while (nRndSpawnNumber < nSpawnNumberMin)
        {
            nRndSpawnNumber = Random(nSpawnNumberMax + 1);
        }
        nSpawnNumber = nRndSpawnNumber;
        nEmptyChildSlots = nSpawnNumber;
        SetLocalInt(oSpawn, "f_SpawnNumber", nSpawnNumber);
    }

    // Check InitialState
    if (nInitialState == 0)
    {
        if (GetLocalInt(oSpawn, "InitialStateProcessed") == FALSE)
        {
            nForceDeactivateSpawn = TRUE;
            SetLocalInt(oSpawn, "InitialStateProcessed", TRUE);
        }
    }

    // Check to Deactivate Spawn
    if (nDeactivateSpawn > -1 || nForceDeactivateSpawn == TRUE)
    {
        nSpawnDeactivated = FALSE;
        nRunDeactivateScript = FALSE;
        if (nForceDeactivateSpawn == FALSE)
        {
            switch (nDeactivateSpawn)
            {
                // Deactivate if all Children are Dead
                case 0:
                    if (nSpawnCount == 0 && nChildrenSpawned != 0)
                    {
                        nSpawnDeactivated = TRUE;
                        nRunDeactivateScript = TRUE;
                        nSpawnBlock = TRUE;
                    }
                break;
                // Deactivate if Spawned SpawnNumber Children
                case 1:
                    if (nChildrenSpawned >= nSpawnNumber)
                    {
                        nSpawnDeactivated = TRUE;
                        nRunDeactivateScript = TRUE;
                        nSpawnBlock = TRUE;
                    }
                break;
                // Temporary Pause until all Children are Dead
                case 2:
                    if (nSpawnCount != 0)
                    {
                        nRunDeactivateScript = TRUE;
                        nSpawnBlock = TRUE;
                    }
                break;
                // Deactivate after DI00 Children Spawned
                case 3:
                    if (nChildrenSpawned >= nDeactivationInfo)
                    {
                        nSpawnDeactivated = TRUE;
                        nRunDeactivateScript = TRUE;
                        nSpawnBlock = TRUE;
                    }
                break;
                // Deactivate after DI00 Minutes
                case 4:
                    nSpawnAgeTick = GetLocalInt(oSpawn, "SpawnAgeTick");
                    nSpawnAgeTick++;
                    if (nSpawnAgeTick >= nDeactivationInfo * nProcessesPerMinute)
                    {
                        nSpawnDeactivated = TRUE;
                        nRunDeactivateScript = TRUE;
                        nSpawnBlock = TRUE;
                    }
                    SetLocalInt(oSpawn, "SpawnAgeTick", nSpawnAgeTick);
                break;
                // Deactivate after DI00 Cycles
                case 5:
                    nSpawnAgeTick = GetLocalInt(oSpawn, "SpawnAgeTick");
                    nSpawnAgeTick++;
                    if (nSpawnAgeTick >= nDeactivationInfo)
                    {
                        nSpawnDeactivated = TRUE;
                        nRunDeactivateScript = TRUE;
                        nSpawnBlock = TRUE;
                    }
                    SetLocalInt(oSpawn, "SpawnAgeTick", nSpawnAgeTick);
            }
        }
        else
        {
            // Force Deactivate
            nSpawnDeactivated = TRUE;
            nRunDeactivateScript = TRUE;
            nSpawnBlock = TRUE;
            SetLocalInt(oSpawn, "ForceDeactivateSpawn", FALSE);
        }

        // Record Deactivated State
        SetLocalInt(oSpawn, "SpawnDeactivated", nSpawnDeactivated);

        // Run Deactivation Script
        if (nRunDeactivateScript == TRUE && nDeactivateScript > -1)
        {
            SetLocalInt(oSpawn, "DeactivateScript", nDeactivateScript);
            ExecuteScript("spawn_sc_deactiv", oSpawn);
            SetLocalInt(oSpawn, "DeactivateScript", -1);
        }
    }

    // Check Number of Creatures against nSpawnNumber
    if (nEmptyChildSlots > 0)
    {
        // Increment Spawn Counter
        nCurrentTick = GetLocalInt(oSpawn, "CurrentTick");
        nCurrentTick++;
        SetLocalInt(oSpawn, "CurrentTick", nCurrentTick);

        // Check Against Spawn Unseen
        if (fSpawnUnseen > 0.0)
        {
            if (nEntranceExit > -1)
            {
                fEntranceExitX = GetLocalFloat(oCreature, "EntranceExitX");
                fEntranceExitY = GetLocalFloat(oCreature, "EntranceExitY");
                vEntranceExit = Vector(fEntranceExitX, fEntranceExitY, 0.0);
                lEntranceExit = Location(OBJECT_SELF, vEntranceExit, 0.0);
                oCreature = GetFirstObjectInShape(SHAPE_SPHERE, fSpawnUnseen, lEntranceExit, FALSE, OBJECT_TYPE_CREATURE);
            }
            else
            {
                oCreature = GetFirstObjectInShape(SHAPE_SPHERE, fSpawnUnseen, lSpawn, FALSE, OBJECT_TYPE_CREATURE);
            }
            while (oCreature != OBJECT_INVALID)
            {
                if (GetIsPC(oCreature) == TRUE)
                {
                    nSpawnBlock = TRUE;
                    oCreature = OBJECT_INVALID;
                }
                if (nEntranceExit > -1)
                {
                    oCreature = GetNextObjectInShape(SHAPE_SPHERE, fSpawnUnseen, lEntranceExit, FALSE, OBJECT_TYPE_CREATURE);
                }
                else
                {
                    oCreature = GetNextObjectInShape(SHAPE_SPHERE, fSpawnUnseen, lSpawn, FALSE, OBJECT_TYPE_CREATURE);
                }
            }
        }

        // Check Against Day or Night Only
        if ((nNightOnly == TRUE && (GetIsNight() == FALSE && GetIsDusk() == FALSE)) || (nDayOnly == TRUE && (GetIsDay() == FALSE && GetIsDawn() == FALSE)))
        {
            nSpawnBlock = TRUE;
        }

        // Check Against Day
        if (nSpawnDayStart > -1)
        {
            nDay = GetCalendarDay();
            if (IsBetweenDays(nDay, nSpawnDayStart, nSpawnDayEnd) == FALSE)
            {
                nSpawnBlock = TRUE;
            }
        }

        // Check Against Hour
        if (nSpawnHourStart > -1)
        {
            nHour = GetTimeHour();
            if (IsBetweenHours(nHour, nSpawnHourStart, nSpawnHourEnd) == FALSE)
            {
                nSpawnBlock = TRUE;
            }
        }

        // Check Against PCCheck
        if (nPCCheck == TRUE)
        {
            // Check for PCs
            if (CountPCsInArea(OBJECT_SELF, TRUE) == 0)
            {
                nSpawnBlock = TRUE;
            }
        }

        // Check Trigger
        if (fSpawnTrigger > 0.0)
        {
            if (CountPCsInRadius(lSpawn, fSpawnTrigger, TRUE) == 0)
            {
                nSpawnBlock = TRUE;
            }
        }

        // Check Spawn Check PCs
        if (nSpawnCheckPCs > -1)
        {
            // If Spawn Cannot Proceed, Block
            if (SpawnCheckPCs(oSpawn) == FALSE)
            {
                nSpawnBlock = TRUE;
            }
        }

        // Check Spawn Check Custom
        if (nSpawnCheckCustom > -1)
        {
            // If Spawn Cannot Proceed, Block
            if (SpawnCheckCustom(oSpawn) == FALSE)
            {
                nSpawnBlock = TRUE;
            }
        }

        if (nSpawnBlock == FALSE)
        {
            // Check Next Spawn
            nNextSpawnTick = GetLocalInt(oSpawn, "NextSpawnTick");

            if (nCurrentTick >= nNextSpawnTick)
            {
                // Check RandomSpawn
                if (d100() <= nRandomSpawn)
                {
                    if (nSpawnAllAtOnce == FALSE)
                    {
                        // Spawn another Creature
                        DoSpawn(oSpawn);
                    }
                    else
                    {
                        if (nSpawnNumberAtOnce > 0)
                        {
                            if (nSpawnNumberAtOnceMin == 0 || nEmptyChildSlots >= nSpawnNumberAtOnceMin)
                            {
                                // Spawn Sets of Creatures
                                for (jCount = 1; (jCount <= nEmptyChildSlots) && (jCount <= nSpawnNumberAtOnce); jCount++)
                                {
                                    DelayCommand(0.0, DoSpawn(oSpawn));
                                }
                            }
                        }
                        else
                        {
                            // Spawn All Creatures
                            for (jCount = 1; jCount <= nEmptyChildSlots; jCount++)
                            {
                                DelayCommand(0.0, DoSpawn(oSpawn));
                            }
                        }
                    }
                }

                // Reset the Ticker
                SetLocalInt(oSpawn, "CurrentTick", 0);
                if (nDelayRandom == TRUE)
                {
                    // Setup Next Spawn Randomly
                    nNextSpawnTick = Random(nProcessesPerMinute * nSpawnDelay) + 1;
                    while (nNextSpawnTick < nProcessesPerMinute * nDelayMinimum)
                    {
                        nNextSpawnTick = Random(nProcessesPerMinute * nSpawnDelay) + 1;
                    }
                }
                else
                {
                    // Setup Next Spawn
                    nNextSpawnTick = nProcessesPerMinute * nSpawnDelay;
                }
                SetLocalInt(oSpawn, "NextSpawnTick", nNextSpawnTick);

            }
        }
    }
}
//

// This Function Performs the Spawn
void DoSpawn(object oSpawn)
{
    vector vSpawn, vRadius;
    location lRadius, lEntranceExit, lSpawnLocation;
    float fRadius, fRadiusX, fRadiusY, fSpawnAngle;
    object oSpawned, oFaction, oEntranceExit, oSpawnLocation, oPC;
    effect eSpawn, eArea, eObject;
    int nGoldAmount, nObjectType, nChildLifespan, nRadiusValid;
    int nRndEntranceExit, nChildrenSpawned, nRndSpawnLocation, nSpawnCount;
    string sTemplate, sEntranceExit, sSpawnLocation;
    object oChild;
    int nChildSlot, nEmptyChildSlot;
    string sChildSlot, sEmptyChildSlot;

    // Initialize Variables
    string sSpawnName = GetLocalString(oSpawn, "f_Flags");
    string sSpawnTag = GetLocalString(oSpawn, "f_Template");
    location lSpawn = GetLocation(oSpawn);
    int nSpawnNumber = GetLocalInt(oSpawn, "f_SpawnNumber");
    float fSpawnRadius = GetLocalFloat(oSpawn, "f_SpawnRadius");
    float fSpawnRadiusMin = GetLocalFloat(oSpawn, "f_SpawnRadiusMin");
    int nSpawnNearPCs = GetLocalInt(oSpawn, "f_SpawnNearPCs");
    int nRandomWalk = GetLocalInt(oSpawn, "f_RandomWalk");
    float fWanderRange = GetLocalFloat(oSpawn, "f_WanderRange");
    int nRandomGold = GetLocalInt(oSpawn, "f_RandomGold");
    int nRandomGoldMin = GetLocalInt(oSpawn, "f_RandomGoldMin");
    int nGoldChance = GetLocalInt(oSpawn, "f_GoldChance");
    float fSpawnFacing = GetLocalFloat(oSpawn, "f_SpawnFacing");
    int nFacing = GetLocalInt(oSpawn, "f_Facing");
    int nSpawnEffect = GetLocalInt(oSpawn, "f_SpawnEffect");
    int nPatrolRoute = GetLocalInt(oSpawn, "f_PatrolRoute");
    int nRouteType = GetLocalInt(oSpawn, "f_RouteType");
    int nEntranceExit = GetLocalInt(oSpawn, "f_EntranceExit");
    int nEntranceExitMin = GetLocalInt(oSpawn, "f_EntranceExitMin");
    int nPlaceable = GetLocalInt(oSpawn, "f_Placeable");
    int nTrapDisabled = GetLocalInt(oSpawn, "f_TrapDisabled");
    int nSpawnGroup = GetLocalInt(oSpawn, "f_SpawnGroup");
    float fCorpseDecay = GetLocalFloat(oSpawn, "f_CorpseDecay");
    int nCorpseDecayType = GetLocalInt(oSpawn, "f_CorpseDecayType");
    int nLootTable = GetLocalInt(oSpawn, "f_LootTable");
    int nChildLifespanMax = GetLocalInt(oSpawn, "f_ChildLifespanMax");
    int nChildLifespanMin = GetLocalInt(oSpawn, "f_ChildLifespanMin");
    int nSpawnCamp = GetLocalInt(oSpawn, "f_SpawnCamp");
    int nSpawnScript = GetLocalInt(oSpawn, "f_SpawnScript");
    int nSpawnAreaEffect = GetLocalInt(oSpawn, "f_SpawnAreaEffect");
    float fAreaEffectDuration = GetLocalFloat(oSpawn, "f_AreaEffectDuration");
    int nObjectEffect = GetLocalInt(oSpawn, "f_ObjectEffect");
    float fObjectEffectDuration = GetLocalFloat(oSpawn, "f_ObjectEffectDuration");
    int nSpawnFaction = GetLocalInt(oSpawn, "f_SpawnFaction");
    int nSpawnAlignment = GetLocalInt(oSpawn, "f_SpawnAlignment");
    int nAlignmentShift = GetLocalInt(oSpawn, "f_AlignmentShift");
    int nSpawnLocation = GetLocalInt(oSpawn, "f_SpawnLocation");
    int nSpawnLocationMin = GetLocalInt(oSpawn, "f_SpawnLocationMin");
    int nDeathScript = GetLocalInt(oSpawn, "f_DeathScript");
    int nSpawnItem = GetLocalInt(oSpawn, "f_SpawnItem");
    int nSpawnSit = GetLocalInt(oSpawn, "f_SpawnSit");
    int nSpawnPlot = GetLocalInt(oSpawn, "f_SpawnPlot");
    int nSpawnMerchant = GetLocalInt(oSpawn, "f_SpawnMerchant");
    string sCustomFlag = GetLocalString(oSpawn, "f_CustomFlag");

    // Check Spawn Location
    if (nSpawnLocation > -1)
    {
        // Get SpawnLocation
        if (nSpawnLocationMin > -1)
        {
            nRndSpawnLocation = Random(nSpawnLocation + 1);
            while (nRndSpawnLocation < nSpawnLocationMin)
            {
                nRndSpawnLocation = Random(nSpawnLocation + 1);
            }
            nSpawnLocation = nRndSpawnLocation;
        }
        sSpawnLocation = "SL" + PadIntToString(nSpawnLocation, 2);
        oSpawnLocation = GetNearestObjectByTag(sSpawnLocation, oSpawn);
        if (oSpawnLocation != OBJECT_INVALID)
        {
            lSpawnLocation = GetLocation(oSpawnLocation);
            lSpawn = lSpawnLocation;
        }

        // Adjust for New SpawnFacing
        if (nFacing == TRUE)
        {
            fSpawnFacing = GetFacing(oSpawnLocation);
        }
    }

    // Set up Location
    if (fSpawnRadius > 0.0)
    {
        // Check SpawnNearPCs
        if (nSpawnNearPCs == TRUE)
        {
            oPC =  GetRandomPCInArea(OBJECT_SELF, oSpawn);
            if (oPC != OBJECT_INVALID)
            {
                lSpawn = GetLocation(oPC);
            }
        }

        vSpawn = GetPositionFromLocation(lSpawn);
        fSpawnAngle = IntToFloat(Random(361));
        if (fSpawnRadiusMin == fSpawnRadius)
        {
            fRadiusX = fSpawnRadius * cos(fSpawnAngle);
            fRadiusY = fSpawnRadius * sin(fSpawnAngle);
        }
        else
        {
            fRadius = IntToFloat(Random(FloatToInt(fSpawnRadius) + 1));
            while (fRadius < fSpawnRadiusMin)
            {
                fRadius = IntToFloat(Random(FloatToInt(fSpawnRadius) + 1));
            }
            fRadiusX = fRadius * cos(fSpawnAngle);
            fRadiusY = fRadius * sin(fSpawnAngle);
        }
        vRadius = Vector(fRadiusX, fRadiusY);
        lRadius = Location(OBJECT_SELF, vSpawn + vRadius, 0.0);
    }
    else
    {
        lRadius = lSpawn;
    }

    // Check Spawn Type
    nObjectType = OBJECT_TYPE_CREATURE;
    if (nPlaceable == TRUE || nSpawnCamp == TRUE || sSpawnTag == "AE")
    {
       nObjectType = OBJECT_TYPE_PLACEABLE;
    }
    if (nSpawnItem == TRUE)
    {
        nObjectType = OBJECT_TYPE_ITEM;
    }
    if (nSpawnMerchant == TRUE)
    {
        nObjectType = OBJECT_TYPE_STORE;
    }

    // Check Spawn Group
    if (nSpawnGroup == TRUE)
    {
        // Pull a Creature from the Group
        sTemplate = SpawnGroup(oSpawn, sSpawnTag);
    }
    else
    {
        sTemplate = sSpawnTag;
    }

    // Create Effect
    if (nSpawnEffect > 0)
    {
        eSpawn = EffectVisualEffect(SpawnEffect(oSpawn, TRUE, FALSE));
        if (nEntranceExit > -1)
        {
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSpawn, lEntranceExit, 5.0);
        }
        else
        {
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSpawn, lRadius, 5.0);
        }
    }

    // Check Area Effect
    if (nSpawnAreaEffect > 0)
    {
        eArea = SpawnAreaEffect(oSpawn);
        if (fAreaEffectDuration > 0.0)
        {
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eArea, lRadius, fAreaEffectDuration);
        }
        else
        {
            ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eArea, lRadius, 0.0);
        }

        // Check Template
        if (sSpawnTag == "AE")
        {
            sTemplate = "plc_invisobj";
        }
    }

    // Validate sSpawnTag
    if (sTemplate != "")
    {
        // Spawn
        if (nSpawnCamp == TRUE)
        {
            oSpawned = CampSpawn(oSpawn, sTemplate, lRadius);
        }
        else
        {
            // EntranceExit
            if (nEntranceExit > -1)
            {
                // Get ExitEntrance
                if (nEntranceExitMin > -1)
                {
                    nRndEntranceExit = Random(nEntranceExit + 1);
                    while (nRndEntranceExit < nEntranceExitMin)
                    {
                        nRndEntranceExit = Random(nEntranceExit + 1);
                    }
                    nEntranceExit = nRndEntranceExit;
                }
                sEntranceExit = "EE" + PadIntToString(nEntranceExit, 2);
                oEntranceExit = GetNearestObjectByTag(sEntranceExit, oSpawn);
                lEntranceExit = GetLocation(oEntranceExit);

                // Spawn
                oSpawned = CreateObject(nObjectType, sTemplate, lEntranceExit);
                AssignCommand(oSpawned, ActionMoveToLocation(lRadius));
            }
            else
            {
                // Spawn
                oSpawned = CreateObject(nObjectType, sTemplate, lRadius);
            }
            AssignCommand(oSpawned, ActionDoCommand(SetFacing(fSpawnFacing)));
        }

        // Assign Values to oSpawned
        SetLocalObject(oSpawned, "ParentSpawn", oSpawn);
        SetLocalFloat(oSpawned, "SpawnFacing", fSpawnFacing);
        SetLocalFloat(oSpawned, "HomeX", GetPositionFromLocation(lRadius).x);
        SetLocalFloat(oSpawned, "HomeY", GetPositionFromLocation(lRadius).y);
        SetLocalFloat(oSpawned, "EntranceExitX", GetPositionFromLocation(lEntranceExit).x);
        SetLocalFloat(oSpawned, "EntranceExitY", GetPositionFromLocation(lEntranceExit).y);
        SetLocalString(oSpawned, "CustomFlag", sCustomFlag);

        // Assign Values to oSpawn
        nChildrenSpawned = GetLocalInt(oSpawn, "ChildrenSpawned");
        nChildrenSpawned++;
        SetLocalInt(oSpawn, "ChildrenSpawned", nChildrenSpawned);
        nSpawnCount = GetLocalInt(oSpawn, "SpawnCount");
        nSpawnCount++;
        SetLocalInt(oSpawn, "SpawnCount", nSpawnCount);

        // Find Empty Child Slot
        nChildSlot = 1;
        nEmptyChildSlot = 0;
        for (nChildSlot = 1; nChildSlot <= nSpawnNumber; nChildSlot++)
        {
            // Retrieve Child
            sChildSlot = "ChildSlot" + PadIntToString(nChildSlot, 2);
            oChild = GetLocalObject(oSpawn, sChildSlot);

            // Check if this is Child Slot is Valid
            if (GetIsObjectValid(oChild) == FALSE || GetIsDead(oChild))
            {
                // Empty Slot
                if (nEmptyChildSlot == 0)
                {
                    nEmptyChildSlot = nChildSlot;
                    sEmptyChildSlot = sChildSlot;
                }
            }
        }

        // Assign Child Slot
        SetLocalObject(oSpawn, sEmptyChildSlot, oSpawned);
        SetLocalString(oSpawned, "ParentChildSlot", sEmptyChildSlot);

        // Set up SpawnPlot
        if (nSpawnPlot == TRUE)
        {
            SetPlotFlag(oSpawned, TRUE);
        }

        // Set up Faction
        if (nSpawnFaction > -1)
        {
            switch (nSpawnFaction)
            {
                case 0:
                    ChangeToStandardFaction(oSpawned, STANDARD_FACTION_COMMONER);
                break;
                case 1:
                    ChangeToStandardFaction(oSpawned, STANDARD_FACTION_DEFENDER);
                break;
                case 2:
                    ChangeToStandardFaction(oSpawned, STANDARD_FACTION_MERCHANT);
                break;
                case 3:
                    ChangeToStandardFaction(oSpawned, STANDARD_FACTION_HOSTILE);
                break;
                case 4:
                    oFaction = GetNearestObjectByTag("SpawnFaction");
                    if (oFaction != OBJECT_INVALID)
                    {
                        ChangeFaction(oSpawned, oFaction);
                    }
                break;
            }
        }

        // Set up Alignment
        if (nSpawnAlignment > -1)
        {
            switch (nSpawnAlignment)
            {
                case 0:
                    AdjustAlignment(oSpawned, ALIGNMENT_NEUTRAL, nAlignmentShift);
                break;
                case 1:
                    AdjustAlignment(oSpawned, ALIGNMENT_LAWFUL, nAlignmentShift);
                break;
                case 2:
                    AdjustAlignment(oSpawned, ALIGNMENT_CHAOTIC, nAlignmentShift);
                break;
                case 3:
                    AdjustAlignment(oSpawned, ALIGNMENT_GOOD, nAlignmentShift);
                break;
                case 4:
                    AdjustAlignment(oSpawned, ALIGNMENT_EVIL, nAlignmentShift);
                break;
                case 5:
                    AdjustAlignment(oSpawned, ALIGNMENT_ALL, nAlignmentShift);
                break;
            }
        }

        // Set up Lifespan
        if (nChildLifespanMax > -1)
        {
            if (nChildLifespanMin > -1)
            {
                nChildLifespan = -1;
                while (nChildLifespan < 60 * nChildLifespanMin)
                {
                    nChildLifespan = Random(60 * nChildLifespanMax) + 1;
                }
            }
            else
            {
                nChildLifespan = 60 * nChildLifespanMax;
            }
            SetLocalInt(oSpawned, "Lifespan", nChildLifespan);
        }

        // Give Creature Loot
        if (nLootTable > -1)
        {
            DelayCommand(1.0, LootTable(oSpawn, oSpawned, nLootTable));
        }

        // Give RandomGold
        if (nRandomGold > 0)
        {
            // One in Four Creatures give Gold
            if (d100(1) <= nGoldChance)
            {
                // Calculate Gold to Drop
                nGoldAmount = Random(nRandomGold + 1);
                while (nGoldAmount < nRandomGoldMin)
                {
                    nGoldAmount = Random(nRandomGold + 1);
                }

                // Give Gold
                CreateItemOnObject("nw_it_gold001", oSpawned, nGoldAmount);
            }
        }

        // Set up Trap on Placeable
        if (GetIsTrapped(oSpawned))
        {
            if (d100(1) <=  nTrapDisabled)
            {
                SetTrapDisabled(oSpawned);
            }
        }

        // Set up Corpse Decay
        if (fCorpseDecay > 0.0)
        {
            SetLocalFloat(oSpawned, "CorpseDecay", fCorpseDecay);
            SetLocalInt(oSpawned, "CorpseDecayType", nCorpseDecayType);
            AssignCommand(oSpawned, SetIsDestroyable(FALSE, FALSE, FALSE));
        }

        // Set up Death Script
        if (nDeathScript > -1)
        {
            AssignCommand(oSpawned, SetIsDestroyable(FALSE, FALSE, FALSE));
        }

        // Set up Object Effects
        if (nObjectEffect > 0)
        {
            eObject = ObjectEffect(oSpawn);
            if (fObjectEffectDuration == -1.0)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eObject, oSpawned, 0.0);
            }
            else
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eObject, oSpawned, fObjectEffectDuration);
            }
        }

        // Set up Area Effect
        if (nSpawnAreaEffect > 0 && sSpawnTag == "AE" && fAreaEffectDuration > 0.0)
        {
            DestroyObject(oSpawned, fAreaEffectDuration);
        }

        // Run the Spawn Script
        if (nSpawnScript > -1)
        {
            SetLocalInt(oSpawned, "SpawnScript", nSpawnScript);
            ExecuteScript("spawn_sc_spawn", oSpawned);
        }

        // Set up Random Walking
        if (nRandomWalk == TRUE)
        {
            if (fWanderRange > 0.0)
            {
                RandomWalk(oSpawn, oSpawned, fWanderRange, FALSE);
            }
            else
            {
                AssignCommand(oSpawned, ActionRandomWalk());
            }
        }

        // Set up the Patrol Route
        if (nPatrolRoute > -1)
        {
            AssignCommand(oSpawned, SetPatrolRoute(nPatrolRoute));
            AssignCommand(oSpawned, DoPatrolRoute(nPatrolRoute, nRouteType));
        }

        // Set up Spawn Sit
        if (nSpawnSit == TRUE)
        {
            FindSeat(oSpawn, oSpawned);
        }

        // Clean Up
        oSpawned = OBJECT_INVALID;
    }
}
//

// This Function Spawns a Camp
object CampSpawn(object oSpawn, string sCamp, location lCamp)
{
    // Spawn in Camp Placeholder
    object oCamp = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lCamp, FALSE);
    SetPlotFlag(oCamp, TRUE);
    SetCampSpawn(oCamp, sCamp, lCamp);

    // Initialize
    int nCampNumP = GetLocalInt(oCamp, "CampNumP");
    int nCampNumC = GetLocalInt(oCamp, "CampNumC");
    float fSpawnRadius = GetLocalFloat(oCamp, "CampRadius");
    vector vCamp = GetPositionFromLocation(lCamp);

    object oSpawned;
    int iCount;
    int nRandomWalk, nSpawnFacing;
    int nLootTable, nSpawnGroup, nTrapDisabled, nDeathScript;
    float fCorpseDecay;
    int nCorpseDecayType, nCampCenter;
    string sObject, sTemplate, sFlags, sCampCenter;

    // Get Camp Center
    sCampCenter = GetLocalString(oCamp, "CampCenter");

    // Spawn Placeables
    for (iCount = 1; iCount <= nCampNumP; iCount++)
    {
        // Initialize Values
        sObject = "CampP" + IntToString(iCount - 1);
        sTemplate = GetLocalString(oCamp, sObject);
        nCampCenter = FALSE;

        // Check Flags
        sFlags = GetLocalString(oCamp, sObject + "_Flags");
        nSpawnFacing = ParseFlagValue(sFlags, "SF", 0, 0);
        nLootTable = ParseFlagValue(sFlags, "LT", 2, -1);
        nSpawnGroup = ParseFlagValue(sFlags, "SG", 0, 0);
        nTrapDisabled = ParseSubFlagValue(sFlags, "PL", 1, "T", 2, 100);

        // Spawn Group
        if (nSpawnGroup == TRUE)
        {
            sTemplate = SpawnGroup(oSpawn, sTemplate);
        }

        // Check Camp Center
        if (sCampCenter != "")
        {
            if (sCampCenter == "P" + IntToString(iCount - 1))
            {
                nCampCenter = TRUE;
            }
        }
        // If no CampCenter set, Use first Placeable
        else if (iCount == 1)
        {
            nCampCenter = TRUE;
        }

        oSpawned = DoCampSpawn(oCamp, lCamp, fSpawnRadius, sTemplate, TRUE, iCount, nCampCenter);
        SetLocalObject(oCamp, sObject, oSpawned);

        // Spawn Facing
        if (nSpawnFacing == TRUE)
        {
            AssignCommand(oSpawned, SetFacingPoint(vCamp));
        }
        else
        {
            AssignCommand(oSpawned, SetFacing(IntToFloat(Random(360))));
        }

        // Loot Table
        if (nLootTable > -1)
        {
            LootTable(oSpawn, oSpawned, nLootTable);
        }

        // Trap Disabled
        if (GetIsTrapped(oSpawned))
        {
            if (d100(1) <=  nTrapDisabled)
            {
                SetTrapDisabled(oSpawned);
            }
        }
    }

    // Spawn Creatures
    for (iCount = 1; iCount <= nCampNumC; iCount++)
    {
        // Initialize Values
        sObject = "CampC" + IntToString(iCount - 1);
        sTemplate = GetLocalString(oCamp, sObject);

        // Check Flags
        sFlags = GetLocalString(oCamp, sObject + "_Flags");
        nSpawnFacing = ParseFlagValue(sFlags, "SF", 0, 0);
        nLootTable = ParseFlagValue(sFlags, "LT", 2, -1);
        nSpawnGroup = ParseFlagValue(sFlags, "SG", 0, 0);
        nRandomWalk = ParseFlagValue(sFlags, "RW", 0, 0);
        fCorpseDecay = IntToFloat(ParseFlagValue(sFlags, "CD", 3, 0));
        nCorpseDecayType = ParseSubFlagValue(sFlags, "CD", 3, "T", 1, 0);
        nDeathScript = ParseFlagValue(sFlags, "DT", 3, -1);

        // Spawn Group
        if (nSpawnGroup == TRUE)
        {
            sTemplate = SpawnGroup(oSpawn, sTemplate);
        }

        // Check Camp Center
        if (sCampCenter != "")
        {
            if (sCampCenter == "C" + IntToString(iCount - 1))
            {
                nCampCenter = TRUE;
            }
        }

        oSpawned = DoCampSpawn(oCamp, lCamp, fSpawnRadius, sTemplate, FALSE, iCount, nCampCenter);
        SetLocalObject(oCamp, sObject, oSpawned);

        // Spawn Facing
        if (nSpawnFacing == TRUE)
        {
            AssignCommand(oSpawned, SetFacingPoint(vCamp));
        }
        else
        {
            AssignCommand(oSpawned, SetFacing(IntToFloat(Random(360))));
        }

        // RandomWalk
        if (nRandomWalk == TRUE)
        {
            AssignCommand(oSpawned, ActionRandomWalk());
        }

        // Loot Table
        if (nLootTable > -1)
        {
            LootTable(oSpawn, oSpawned, nLootTable);
        }

        // Corpse Decay
        if (fCorpseDecay > 0.0)
        {
            SetLocalFloat(oSpawned, "CorpseDecay", fCorpseDecay);
            SetLocalInt(oSpawned, "CorpseDecayType", nCorpseDecayType);
            AssignCommand(oSpawned, SetIsDestroyable(FALSE, FALSE, FALSE));
        }

        // Death Script
        if (nDeathScript > -1)
        {
            AssignCommand(oSpawned, SetIsDestroyable(FALSE, FALSE, FALSE));
        }
    }

    // Return Placeholder
    return oCamp;
}
//

// This Function Spawns the Camp Members
object DoCampSpawn(object oCamp, location lCamp, float fSpawnRadius, string sTemplate, int nPlaceable, int nSpawnNumber, int nCampCenter)
{
    object oCampSpawned;
    vector vCamp, vRadius;
    float fRadius, fRadiusX, fRadiusY, fAngle;

    // Set up Location
    if (nCampCenter == FALSE)
    {
        vCamp = GetPositionFromLocation(lCamp);
        fAngle = IntToFloat(Random(361));
        fRadius = IntToFloat(Random(FloatToInt(fSpawnRadius)) + 1);
        fRadiusX = fRadius * cos(fAngle);
        fRadiusY = fRadius * sin(fAngle);
        vRadius = Vector(fRadiusX, fRadiusY);
        lCamp = Location(OBJECT_SELF, vCamp + vRadius, 0.0);
    }

    // Spawn Camp Object
    if (nPlaceable == TRUE)
    {
        oCampSpawned = CreateObject(OBJECT_TYPE_PLACEABLE, sTemplate, lCamp, FALSE);
    }
    else
    {
        oCampSpawned = CreateObject(OBJECT_TYPE_CREATURE, sTemplate, lCamp, FALSE);
    }

    // Return Camp Object
    return oCampSpawned;
}
//
