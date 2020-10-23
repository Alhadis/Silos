//
// Spawn v7.0
// Spawn Functions
//
void InitFlags(object oSpawn, string sSpawnName);
int SetSpawns(location lBase);
string PadIntToString(int nInt, int nDigits);
int ParseFlagValue(string sName, string sFlag, int nDigits, int nDefault);
int ParseSubFlagValue(string sName, string sFlag, int nDigits, string sSubFlag, int nSubDigits, int nDefault);
//
// Custom Functions
//
object GetChildByTag(object oSpawn, string sChildTag);
object GetChildByNumber(object oSpawn, int nChildNum);
object GetSpawnByID(int nSpawnID);
void DeactivateSpawn(object oSpawn);
void DeactivateSpawnsByTag(string sSpawnTag);
void DeactivateAllSpawns();
void DespawnChildren(object oSpawn);
void DespawnChildrenByTag(object oSpawn, string sSpawnTag);
void AddChild(object oSpawn, object oSpawned);
//
// PC and NPC Functions
//
int CountPCsInArea(object oArea = OBJECT_INVALID, int nDM = FALSE);
int CountPCsInRadius(location lCenter, float fRadius, int nDM = FALSE);
object GetRandomPCInArea(object oArea, object oSpawn);
void TransferItem(object oCreature, object oTarget, object oItem, int nCreatureItem);
void TransferAllItems(object oCreature, object oTarget, int nCreatureItems, int nEquippedItems);
void RandomWalk(object oSpawn, object oSpawned, float fWalkingRadius, int nRun);
void FindSeat(object oSpawn, object oSpawned);
void CleanInventory(object oSpawned);
//
// Date and Time Functions
//
int IsBetweenDays(int nCheckDay, int nDayStart, int nDayEnd);
int IsBetweenHours(int nCheckHour, int nHourStart, int nHourEnd);
//
// Patrol Route Functions
//
void SetPatrolRoute(int nPatrolRoute);
void DoPatrolRoute(int nPatrolRoute, int nRouteType);
void AddPatrolStop(int nPatrolRoute, int nStopNumber);
//
// Camp Functions
//
int CampState(object oCamp);
void DestroyCamp(object oCamp, float fCampDecay);
//
// Outside Functions
//
void SpawnFlags(object oSpawn, int nFlagTableNumber);
//
//

// This Function Initializes the Flags
void InitFlags(object oSpawn, string sSpawnName)
{
    // Retreive Defaults
    object oModule = GetModule();
    int dfInitialState = GetLocalInt(oModule, "df_InitialState");
    int dfInitialDelay = GetLocalInt(oModule, "df_InitialDelay");
    int dfFlagTable = GetLocalInt(oModule, "df_FlagTable");
    int dfFlagTableNumber = GetLocalInt(oModule, "df_FlagTableNumber");
    int dfSpawnDelay = GetLocalInt(oModule, "df_SpawnDelay");
    int dfDelayRandom = GetLocalInt(oModule, "df_DelayRandom");
    int dfDelayMinimum = GetLocalInt(oModule, "df_DelayMinimum");
    int dfSpawnNumber = GetLocalInt(oModule, "df_SpawnNumber");
    int dfSpawnNumberMin = GetLocalInt(oModule, "df_SpawnNumberMin");
    int dfSpawnAllAtOnce = GetLocalInt(oModule, "df_SpawnAllAtOnce");
    int dfSpawnNumberAtOnce = GetLocalInt(oModule, "df_SpawnNumberAtOnce");
    int dfSpawnNumberAtOnceMin = GetLocalInt(oModule, "df_SpawnNumberAtOnceMin");
    int dfDayOnly = GetLocalInt(oModule, "df_DayOnly");
    int dfDayOnlyDespawn = GetLocalInt(oModule, "df_DayOnlyDespawn");
    int dfNightOnly = GetLocalInt(oModule, "df_NightOnly");
    int dfNightOnlyDespawn = GetLocalInt(oModule, "df_NightOnlyDespawn");
    int dfSpawnDayStart = GetLocalInt(oModule, "df_SpawnDayStart");
    int dfSpawnDayEnd = GetLocalInt(oModule, "df_SpawnDayEnd");
    int dfSpawnHourStart = GetLocalInt(oModule, "df_SpawnHourStart");
    int dfSpawnHourEnd = GetLocalInt(oModule, "df_SpawnHourEnd");
    int dfRandomWalk = GetLocalInt(oModule, "df_RandomWalk");
    int dfWanderRange = GetLocalInt(oModule, "df_WanderRange");
    int dfReturnHome = GetLocalInt(oModule, "df_ReturnHome");
    int dfReturnHomeRange = GetLocalInt(oModule, "df_ReturnHomeRange");
    int dfPCCheck = GetLocalInt(oModule, "df_PCCheck");
    int dfPCCheckDelay = GetLocalInt(oModule, "df_PCCheckDelay");
    int dfPCReset = GetLocalInt(oModule, "df_PCReset");
    int dfRandomGold = GetLocalInt(oModule, "df_RandomGold");
    int dfRandomGoldMin = GetLocalInt(oModule, "df_RandomGoldMin");
    int dfGoldChance = GetLocalInt(oModule, "df_GoldChance");
    int dfSpawnEffect = GetLocalInt(oModule, "df_SpawnEffect");
    int dfDespawnEffect = GetLocalInt(oModule, "df_DespawnEffect");
    int dfPatrolRoute = GetLocalInt(oModule, "df_PatrolRoute");
    int dfRouteType = GetLocalInt(oModule, "df_RouteType");
    int dfPlaceable = GetLocalInt(oModule, "df_Placeable");
    int dfPlaceableType = GetLocalInt(oModule, "df_PlaceableType");
    int dfTrapDisabled = GetLocalInt(oModule, "df_TrapDisabled");
    int dfSpawnGroup = GetLocalInt(oModule, "df_SpawnGroup");
    int dfLootTable = GetLocalInt(oModule, "df_LootTable");
    int dfDeactivateSpawn = GetLocalInt(oModule, "df_DeactivateSpawn");
    int dfDeactivateScript = GetLocalInt(oModule, "df_DeactivateScript");
    int dfDeactivationInfo = GetLocalInt(oModule, "df_DeactivationInfo");
    int dfChildLifespanMax = GetLocalInt(oModule, "df_ChildLifespanMax");
    int dfChildLifespanMin = GetLocalInt(oModule, "df_ChildLifespanMin");
    int dfSpawnRadius = GetLocalInt(oModule, "df_SpawnRadius");
    int dfSpawnRadiusMin = GetLocalInt(oModule, "df_SpawnRadiusMin");
    int dfSpawnNearPCs = GetLocalInt(oModule, "df_SpawnNearPCs");
    int dfSpawnUnseen = GetLocalInt(oModule, "df_SpawnUnseen");
    int dfCorpseDecay = GetLocalInt(oModule, "df_CorpseDecay");
    int dfCorpseDecayType = GetLocalInt(oModule, "df_CorpseDecayType");
    int dfSpawnCamp = GetLocalInt(oModule, "df_SpawnCamp");
    int dfCampDecay = GetLocalInt(oModule, "df_CampDecay");
    int dfSpawnScript = GetLocalInt(oModule, "df_SpawnScript");
    int dfDespawnScript = GetLocalInt(oModule, "df_DespawnScript");
    int dfDeathScript = GetLocalInt(oModule, "df_DeathScript");
    int dfSpawnCheckCustom = GetLocalInt(oModule, "df_SpawnCheckCustom");
    int dfSpawnCheckPCs = GetLocalInt(oModule, "df_SpawnCheckPCs");
    int dfCheckPCsRadius = GetLocalInt(oModule, "f_CheckPCsRadius");
    int dfSpawnTrigger = GetLocalInt(oModule, "df_SpawnTrigger");
    int dfDespawnTrigger = GetLocalInt(oModule, "df_DespawnTrigger");
    int dfSpawnAreaEffect = GetLocalInt(oModule, "df_SpawnAreaEffect");
    int dfAreaEffectDuration = GetLocalInt(oModule, "df_AreaEffectDuration");
    int dfObjectEffect = GetLocalInt(oModule, "df_ObjectEffect");
    int dfObjectEffectDuration = GetLocalInt(oModule, "df_ObjectEffectDuration");
    int dfRandomSpawn = GetLocalInt(oModule, "df_RandomSpawn");
    int dfSpawnFaction = GetLocalInt(oModule, "df_SpawnFaction");
    int dfSpawnAlignment = GetLocalInt(oModule, "df_SpawnAlignment");
    int dfAlignmentShift = GetLocalInt(oModule, "df_AlignmentShift");
    int dfHeartbeatScript = GetLocalInt(oModule, "df_HeartbeatScript");
    int dfSpawnLocation = GetLocalInt(oModule, "df_SpawnLocation");
    int dfSpawnLocationMin = GetLocalInt(oModule, "df_SpawnLocationMin");
    int dfSpawnFacing = GetLocalInt(oModule, "df_SpawnFacing");
    int dfEntranceExit = GetLocalInt(oModule, "df_EntranceExit");
    int dfEntranceExitMin = GetLocalInt(oModule, "df_EntranceExitMin");
    int dfExit = GetLocalInt(oModule, "df_Exit");
    int dfExitMin = GetLocalInt(oModule, "df_ExitMin");
    int dfHealChildren = GetLocalInt(oModule, "df_HealChildren");
    int dfHealEffects = GetLocalInt(oModule, "df_HealEffects");
    int dfSpawnItem = GetLocalInt(oModule, "df_SpawnItem");
    int dfSpawnSit = GetLocalInt(oModule, "df_SpawnSit");
    int dfSpawnMerchant = GetLocalInt(oModule, "df_SpawnMerchant");
    int dfSpawnPlot = GetLocalInt(oModule, "df_SpawnPlot");

    // Initialize FlagTable
    int nFlagTable = ParseFlagValue(sSpawnName, "_FT", 0, dfFlagTable);
    int nFlagTableNumber = ParseFlagValue(sSpawnName, "_FT", 2, dfFlagTableNumber);
    if (nFlagTable >= 0)
    {
        nFlagTable = TRUE;
    }
    if (nFlagTable == -1)
    {
        nFlagTable = FALSE;
    }
    if (nFlagTable == TRUE)
    {
        SpawnFlags(oSpawn, nFlagTableNumber);
        if (GetStringLeft(GetLocalString(oSpawn, "f_Flags"), 2) == "SP")
        {
            sSpawnName = GetLocalString(oSpawn, "f_Flags");
        }
        else if (GetStringLeft(GetLocalString(oSpawn, "f_Flags"), 1) == "_")
        {
            sSpawnName = sSpawnName + GetLocalString(oSpawn, "f_Flags");
        }
        SetLocalString(oSpawn, "f_Flags", sSpawnName);
    }
    else
    {
        SetLocalString(oSpawn, "f_Flags", sSpawnName);
        SetLocalString(oSpawn, "f_Template", GetTag(oSpawn));
    }

    // Initialize CustomFlag
    string sCustomFlag;
    int nCustomFlag = ParseFlagValue(sSpawnName, "CF", 0, -1);
    if (nCustomFlag >= 0)
    {
        nCustomFlag = TRUE;
    }
    if (nCustomFlag == -1)
    {
        nCustomFlag = FALSE;
    }
    if (nCustomFlag == TRUE)
    {
        sCustomFlag = GetStringRight(sSpawnName, GetStringLength(sSpawnName) - (FindSubString(sSpawnName, "CF") + 2));
        sSpawnName = GetStringLeft(sSpawnName, GetStringLength(sSpawnName) - (GetStringLength(sCustomFlag) + 3));
    }

    // Initialize InitialState
    int nInitialState = ParseFlagValue(sSpawnName, "IS", 1, dfInitialState);
    int nInitialDelay = ParseSubFlagValue(sSpawnName, "IS", 0, "D", 0, dfInitialDelay);

    // Record InitialState
    SetLocalInt(oSpawn, "f_InitialState", nInitialState);
    SetLocalInt(oSpawn, "f_InitialDelay", nInitialDelay);

    // Initialize SpawnID
    int nSpawnID = ParseFlagValue(sSpawnName, "ID", 2, 0);

    // Record SpawnID
    if (nSpawnID > 0)
    {
        SetLocalInt(oSpawn, "SpawnID", nSpawnID);
    }

    // Initialize SpawnDelay
    int nSpawnDelay = ParseFlagValue(sSpawnName, "SD", 2, dfSpawnDelay);
    int nDelayRandom = ParseSubFlagValue(sSpawnName, "SD", 2, "M", 0, dfDelayRandom);
    int nDelayMinimum = ParseSubFlagValue(sSpawnName, "SD", 2, "M", 2, dfDelayMinimum);
    if (nDelayRandom >= 0)
    {
        nDelayRandom == TRUE;
    }
    if (nDelayRandom == -1)
    {
        nDelayRandom = FALSE;
    }
    if (nDelayMinimum > nSpawnDelay)
    {
        nDelayRandom = FALSE;
        nDelayMinimum = 0;
    }

    // Record SpawnDelay
    SetLocalInt(oSpawn, "f_SpawnDelay", nSpawnDelay);
    SetLocalInt(oSpawn, "f_DelayRandom", nDelayRandom);
    SetLocalInt(oSpawn, "f_DelayMinimum", nDelayMinimum);

    // Initialize SpawnNumber
    int nSpawnNumber = ParseFlagValue(sSpawnName, "SN", 2, dfSpawnNumber);
    int nSpawnNumberMax = nSpawnNumber;
    int nSpawnNumberMin = ParseSubFlagValue(sSpawnName, "SN", 2, "M", 2, dfSpawnNumberMin);
    int nSpawnAllAtOnce = ParseFlagValue(sSpawnName, "SA", 0, dfSpawnAllAtOnce);
    int nSpawnNumberAtOnce = ParseFlagValue(sSpawnName, "SA", 2, dfSpawnNumberAtOnce);
    int nSpawnNumberAtOnceMin = ParseSubFlagValue(sSpawnName, "SA", 0, "M", 0, dfSpawnNumberAtOnceMin);
    if (nSpawnNumberMin > nSpawnNumber)
    {
        nSpawnNumberMin = -1;
    }
    if (nSpawnNumberMin > -1)
    {
        int nRndSpawnNumber = Random(nSpawnNumberMax + 1);
        while (nRndSpawnNumber < nSpawnNumberMin)
        {
            nRndSpawnNumber = Random(nSpawnNumberMax + 1);
        }
        nSpawnNumber = nRndSpawnNumber;
    }
    if (nSpawnAllAtOnce >= 1)
    {
        nSpawnAllAtOnce = TRUE;
    }
    if (nSpawnNumberAtOnce == 1)
    {
        nSpawnNumberAtOnce = 0;
    }
    if (nSpawnNumberAtOnceMin > nSpawnNumberAtOnce)
    {
        nSpawnNumberAtOnceMin = 0;
    }

    // Record SpawnNumber
    SetLocalInt(oSpawn, "f_SpawnNumber", nSpawnNumber);
    SetLocalInt(oSpawn, "f_SpawnNumberMin", nSpawnNumberMin);
    SetLocalInt(oSpawn, "f_SpawnNumberMax", nSpawnNumberMax);
    SetLocalInt(oSpawn, "f_SpawnAllAtOnce", nSpawnAllAtOnce);
    SetLocalInt(oSpawn, "f_SpawnNumberAtOnce", nSpawnNumberAtOnce);
    SetLocalInt(oSpawn, "f_SpawnNumberAtOnceMin", nSpawnNumberAtOnceMin);

    // Initialize Day/Night Only
    int nDayOnly = ParseFlagValue(sSpawnName, "DO", 0, dfDayOnly);
    int nDayOnlyDespawn = ParseSubFlagValue(sSpawnName, "DO", 0, "D", 0, dfDayOnlyDespawn);
    int nNightOnly = ParseFlagValue(sSpawnName, "NO", 0, dfNightOnly);
    int nNightOnlyDespawn = ParseSubFlagValue(sSpawnName, "NO", 0, "D", 0, dfNightOnlyDespawn);

    // Record Day/Night Only
    SetLocalInt(oSpawn, "f_DayOnly", nDayOnly);
    SetLocalInt(oSpawn, "f_DayOnlyDespawn", nDayOnlyDespawn);
    SetLocalInt(oSpawn, "f_NightOnly", nNightOnly);
    SetLocalInt(oSpawn, "f_NightOnlyDespawn", nNightOnlyDespawn);

    // Initialize Day/Hour Spawns
    int nSpawnDayStart = ParseFlagValue(sSpawnName, "DY", 2, dfSpawnDayStart);
    int nSpawnDayEnd = ParseSubFlagValue(sSpawnName, "DY", 2, "T", 2, dfSpawnDayEnd);
    if (nSpawnDayEnd > nSpawnDayStart)
    {
        nSpawnDayEnd = -1;
    }
    int nSpawnHourStart = ParseFlagValue(sSpawnName, "HR", 2, dfSpawnHourStart);
    int nSpawnHourEnd = ParseSubFlagValue(sSpawnName, "HR", 2, "T", 2, dfSpawnHourEnd);
    if (nSpawnHourStart > nSpawnHourEnd)
    {
        nSpawnHourEnd = -1;
    }

    // Record Day/Hour Spawns
    SetLocalInt(oSpawn, "f_SpawnDayStart", nSpawnDayStart);
    SetLocalInt(oSpawn, "f_SpawnDayEnd", nSpawnDayEnd);
    SetLocalInt(oSpawn, "f_SpawnHourStart", nSpawnHourStart);
    SetLocalInt(oSpawn, "f_SpawnHourEnd", nSpawnHourEnd);

    // Initialize RandomWalk
    int nRandomWalk = ParseFlagValue(sSpawnName, "RW", 0, dfRandomWalk);
    float fWanderRange = IntToFloat(ParseSubFlagValue(sSpawnName, "RW", 0, "R", 2, dfWanderRange));

    // Record RandomWalk
    SetLocalInt(oSpawn, "f_RandomWalk", nRandomWalk);
    SetLocalFloat(oSpawn, "f_WanderRange", fWanderRange);

    // Initialize ReturnHome
    int nReturnHome = ParseFlagValue(sSpawnName, "RH", 0, dfReturnHome);
    float fReturnHomeRange = IntToFloat(ParseFlagValue(sSpawnName, "RH", 2, dfReturnHomeRange));

    // Record ReturnHome
    SetLocalInt(oSpawn, "f_ReturnHome", nReturnHome);
    SetLocalFloat(oSpawn, "f_ReturnHomeRange", fReturnHomeRange);

    // Initialize PCCheck
    int nPCCheck = ParseFlagValue(sSpawnName, "PC", 0, dfPCCheck);
    int nPCCheckDelay = ParseFlagValue(sSpawnName, "PC", 2, dfPCCheckDelay);
    int nPCReset = ParseSubFlagValue(sSpawnName, "PC", 2, "R", 0, dfPCReset);
    if (nPCCheck == 0)
    {
        nPCCheck = TRUE;
    }
    if (nPCCheck > 1)
    {
        nPCCheck = TRUE;
    }
    if (nPCCheck == -1)
    {
        nPCCheck = FALSE;
    }

    // Record PCCheck
    SetLocalInt(oSpawn, "f_PCCheck", nPCCheck);
    SetLocalInt(oSpawn, "f_PCCheckDelay", nPCCheckDelay);
    SetLocalInt(oSpawn, "f_PCReset", nPCReset);

    // Initialize RandomGold
    int nRandomGold = ParseFlagValue(sSpawnName, "RG", 3, dfRandomGold);
    int nRandomGoldMin = ParseSubFlagValue(sSpawnName, "RG", 0, "M", 0, dfRandomGoldMin);
    int nGoldChance = ParseSubFlagValue(sSpawnName, "RG", 3, "C", 2, dfGoldChance);

    // Record RandomGold
    SetLocalInt(oSpawn, "f_RandomGold", nRandomGold);
    SetLocalInt(oSpawn, "f_RandomGoldMin", nRandomGoldMin);
    SetLocalInt(oSpawn, "f_GoldChance", nGoldChance);

    // Initialize SpawnEffects
    int nSpawnEffect = ParseFlagValue(sSpawnName, "FX", 3, dfSpawnEffect);
    int nDespawnEffect = ParseSubFlagValue(sSpawnName, "FX", 3, "D", 3, dfDespawnEffect);

    // Record SpawnEffects
    SetLocalInt(oSpawn, "f_SpawnEffect", nSpawnEffect);
    SetLocalInt(oSpawn, "f_DespawnEffect", nDespawnEffect);

    // Initialize PatrolRoutes
    int nPatrolRoute = ParseFlagValue(sSpawnName, "PR", 2, dfPatrolRoute);
    int nRouteType = ParseSubFlagValue(sSpawnName, "PR", 2, "T", 1, dfRouteType);

    // Record PatrolRoutes
    SetLocalInt(oSpawn, "f_PatrolRoute", nPatrolRoute);
    SetLocalInt(oSpawn, "f_RouteType", nRouteType);

    // Initialize Placeables
    int nPlaceable = ParseFlagValue(sSpawnName, "PL", 0, dfPlaceable);
    int nPlaceableType = ParseFlagValue(sSpawnName, "PL", 1, dfPlaceableType);
    int nTrapDisabled = ParseSubFlagValue(sSpawnName, "PL", 1, "T", 2, dfTrapDisabled);
    if (nPlaceable == 0)
    {
        nPlaceable = TRUE;
    }
    if (nPlaceable > 1)
    {
        nPlaceable = TRUE;
    }
    if (nPlaceable == -1)
    {
        nPlaceable = FALSE;
    }

    // Record Placeables
    SetLocalInt(oSpawn, "f_Placeable", nPlaceable);
    SetLocalInt(oSpawn, "f_PlaceableType", nPlaceableType);
    SetLocalInt(oSpawn, "f_TrapDisabled", nTrapDisabled);

    // Initialize SpawnGroups
    int nSpawnGroup = ParseFlagValue(sSpawnName, "SG", 0, dfSpawnGroup);

    // Record SpawnGroups
    SetLocalInt(oSpawn, "f_SpawnGroup", nSpawnGroup);

    // Initialize LootTable
    int nLootTable = ParseFlagValue(sSpawnName, "LT", 2, dfLootTable);

    // Record LootTable
    SetLocalInt(oSpawn, "f_LootTable", nLootTable);

    // Initialize SpawnDeactivation
    int nDeactivateSpawn = ParseFlagValue(sSpawnName, "DS", 1, dfDeactivateSpawn);
    int nDeactivateScript = ParseSubFlagValue(sSpawnName, "DS", 1, "S", 3, dfDeactivateScript);
    int nDeactivationInfo = ParseFlagValue(sSpawnName, "DI", 2, dfDeactivationInfo);

    // Record SpawnDeactivations
    SetLocalInt(oSpawn, "f_DeactivateSpawn", nDeactivateSpawn);
    SetLocalInt(oSpawn, "f_DeactivateScript", nDeactivateScript);
    SetLocalInt(oSpawn, "f_DeactivationInfo", nDeactivationInfo);

    // Initialize ChildLifespan
    int nChildLifespanMax = ParseFlagValue(sSpawnName, "CL", 2, dfChildLifespanMax);
    int nChildLifespanMin = ParseSubFlagValue(sSpawnName, "CL", 2, "M", 2, dfChildLifespanMin);
    if (nChildLifespanMin > nChildLifespanMax)
    {
        nChildLifespanMin = -1;
    }

    // Record ChildLifespan
    SetLocalInt(oSpawn, "f_ChildLifespanMax", nChildLifespanMax);
    SetLocalInt(oSpawn, "f_ChildLifespanMin", nChildLifespanMin);

    // Initialize SpawnRadius
    float fSpawnRadius = IntToFloat(ParseFlagValue(sSpawnName, "SR", 2, dfSpawnRadius));
    float fSpawnRadiusMin = IntToFloat(ParseSubFlagValue(sSpawnName, "SR", 2, "M", 2, dfSpawnRadiusMin));
    int nSpawnNearPCs = ParseSubFlagValue(sSpawnName, "SR", 0, "P", 0, dfSpawnNearPCs);
    if (fSpawnRadiusMin > fSpawnRadius)
    {
        fSpawnRadiusMin = 0.0;
    }

    // Record SpawnRadius
    SetLocalFloat(oSpawn, "f_SpawnRadius", fSpawnRadius);
    SetLocalFloat(oSpawn, "f_SpawnRadiusMin", fSpawnRadiusMin);
    SetLocalInt(oSpawn, "f_SpawnNearPCs", nSpawnNearPCs);

    // Initialize SpawnUnseen
    float fSpawnUnseen = IntToFloat(ParseFlagValue(sSpawnName, "SU", 2, dfSpawnUnseen));

    // Record SpawnUnseen
    SetLocalFloat(oSpawn, "f_SpawnUnseen", fSpawnUnseen);

    // Initialize CorpseDecay
    float fCorpseDecay = IntToFloat(ParseFlagValue(sSpawnName, "CD", 3, dfCorpseDecay));
    int nCorpseDecayType = ParseSubFlagValue(sSpawnName, "CD", 3, "T", 1, dfCorpseDecayType);

    // Record CorpseDecay
    SetLocalFloat(oSpawn, "f_CorpseDecay", fCorpseDecay);
    SetLocalInt(oSpawn, "f_CorpseDecayType", nCorpseDecayType);

    // Initialize SpawnCamp
    int nSpawnCamp = ParseFlagValue(sSpawnName, "CM", 0, dfSpawnCamp);
    float fCampDecay = IntToFloat(ParseSubFlagValue(sSpawnName, "CM", 0, "D", 3, dfCampDecay));

    // Record SpawnCamp
    SetLocalInt(oSpawn, "f_SpawnCamp", nSpawnCamp);
    SetLocalFloat(oSpawn, "f_CampDecay", fCampDecay);

    // Initialize Spawn Scripts
    int nSpawnScript = ParseFlagValue(sSpawnName, "SS", 3, dfSpawnScript);
    int nDespawnScript = ParseSubFlagValue(sSpawnName, "SS", 3, "D", 3, dfDespawnScript);

    // Record Spawn Scripts
    SetLocalInt(oSpawn, "f_SpawnScript", nSpawnScript);
    SetLocalInt(oSpawn, "f_DespawnScript", nDespawnScript);

    // Initialize Death Scripts
    int nDeathScript = ParseFlagValue(sSpawnName, "DT", 3, dfDeathScript);

    // Record Death Scripts
    SetLocalInt(oSpawn, "f_DeathScript", nDeathScript);

    // Initialize SpawnCheckCustom
    int nSpawnCheckCustom = ParseFlagValue(sSpawnName, "CC", 2, dfSpawnCheckCustom);

    // Record SpawnCheckCustom
    SetLocalInt(oSpawn, "f_SpawnCheckCustom", nSpawnCheckCustom);

    // Initialize SpawnCheckPCs
    int nSpawnCheckPCs = ParseFlagValue(sSpawnName, "CP", 2, dfSpawnCheckPCs);
    float fCheckPCsRadius = IntToFloat(ParseSubFlagValue(sSpawnName, "CP", 2, "R", 2, dfCheckPCsRadius));

    // Record SpawnCheckPCs
    SetLocalInt(oSpawn, "f_SpawnCheckPCs", nSpawnCheckPCs);
    SetLocalFloat(oSpawn, "f_CheckPCsRadius", fCheckPCsRadius);

    // Intialize SpawnTrigger
    float fSpawnTrigger = IntToFloat(ParseFlagValue(sSpawnName, "TR", 2, dfSpawnTrigger));
    float fDespawnTrigger = IntToFloat(ParseSubFlagValue(sSpawnName, "TR", 2, "D", 2, dfDespawnTrigger));

    // Record SpawnTrigger
    SetLocalFloat(oSpawn, "f_SpawnTrigger", fSpawnTrigger);
    SetLocalFloat(oSpawn, "f_DespawnTrigger", fDespawnTrigger);

    // Initialize AreaEffect
    int nSpawnAreaEffect = ParseFlagValue(sSpawnName, "AE", 3, dfSpawnAreaEffect);
    float fAreaEffectDuration = IntToFloat(ParseSubFlagValue(sSpawnName, "AE", 3, "D", 3, dfAreaEffectDuration));

    // Record AreaEffect
    SetLocalInt(oSpawn, "f_SpawnAreaEffect", nSpawnAreaEffect);
    SetLocalFloat(oSpawn, "f_AreaEffectDuration", fAreaEffectDuration);

    // Initialize ObjectEffect
    int nObjectEffect = ParseFlagValue(sSpawnName, "OE", 3, dfObjectEffect);
    float fObjectEffectDuration = IntToFloat(ParseSubFlagValue(sSpawnName, "OE", 3, "D", 3, dfObjectEffectDuration));
    if (fObjectEffectDuration == 0.0)
    {
        fObjectEffectDuration = -1.0;
    }

    // Record ObjectEffect
    SetLocalInt(oSpawn, "f_ObjectEffect", nObjectEffect);
    SetLocalFloat(oSpawn, "f_ObjectEffectDuration", fObjectEffectDuration);

    // Initialize RandomSpawn
    int nRandomSpawn = ParseFlagValue(sSpawnName, "RS", 2, dfRandomSpawn);

    // Record RandomSpawn
    SetLocalInt(oSpawn, "f_RandomSpawn", nRandomSpawn);

    // Initialize SpawnFaction
    int nSpawnFaction = ParseFlagValue(sSpawnName, "FC", 1, dfSpawnFaction);

    // Record SpawnFaction
    SetLocalInt(oSpawn, "f_SpawnFaction", nSpawnFaction);

    // Initialize SpawnAlignment
    int nSpawnAlignment = ParseFlagValue(sSpawnName, "AL", 1, dfSpawnAlignment);
    int nAlignmentShift = ParseSubFlagValue(sSpawnName, "AL", 1, "S", 2, dfAlignmentShift);

    // Record SpawnAlignment
    SetLocalInt(oSpawn, "f_SpawnAlignment", nSpawnAlignment);
    SetLocalInt(oSpawn, "f_AlignmentShift", nAlignmentShift);

    // Initialize Heartbeat
    int nHeartbeatScript = ParseFlagValue(sSpawnName, "HB", 3, dfHeartbeatScript);

    // Record HeartBeat
    SetLocalInt(oSpawn, "f_HeartbeatScript", nHeartbeatScript);

    // Initialize SpawnLocation
    int nSpawnLocation = ParseFlagValue(sSpawnName, "SL", 2, dfSpawnLocation);
    int nSpawnLocationMin = ParseSubFlagValue(sSpawnName, "SL", 2, "R", 2, dfSpawnLocationMin);
    if (nSpawnLocationMin > nSpawnLocation)
    {
        nSpawnLocationMin = -1;
    }

    // Record SpawnLocation
    SetLocalInt(oSpawn, "f_SpawnLocation", nSpawnLocation);
    SetLocalInt(oSpawn, "f_SpawnLocationMin", nSpawnLocationMin);

    // Initialize SpawnFacing
    float fSpawnFacing;
    int nSpawnFacing = ParseFlagValue(sSpawnName, "SF", 0, dfSpawnFacing);
    if (nSpawnFacing == TRUE)
    {
        fSpawnFacing = GetFacingFromLocation(GetLocation(oSpawn));
    }
    else
    {
        fSpawnFacing = IntToFloat(Random(360));
    }

    // Record SpawnFacing
    SetLocalInt(oSpawn, "f_Facing", nSpawnFacing);
    SetLocalFloat(oSpawn, "f_SpawnFacing", fSpawnFacing);

    // Initialize EntranceExit
    int nEntranceExit = ParseFlagValue(sSpawnName, "EE", 2, dfEntranceExit);
    int nEntranceExitMin = ParseSubFlagValue(sSpawnName, "EE", 2, "R", 2, dfEntranceExitMin);
    if (nEntranceExitMin > nEntranceExit)
    {
        nEntranceExitMin = -1;
    }
    int nExit = ParseFlagValue(sSpawnName, "EX", 2, dfExit);
    int nExitMin = ParseSubFlagValue(sSpawnName, "EX", 2, "R", 2, dfExitMin);
    if (nExitMin > nExit)
    {
        nExitMin = -1;
    }

    // Record EntranceExit
    SetLocalInt(oSpawn, "f_EntranceExit", nEntranceExit);
    SetLocalInt(oSpawn, "f_EntranceExitMin", nEntranceExitMin);
    SetLocalInt(oSpawn, "f_Exit", nExit);
    SetLocalInt(oSpawn, "f_ExitMin", nExitMin);

    // Initialize HealChildren
    int nHealChildren = ParseFlagValue(sSpawnName, "HL", 0, dfHealChildren);
    int nHealEffects = ParseSubFlagValue(sSpawnName, "HL", 0, "E", 0, dfHealEffects);
    if (nHealChildren == 1)
    {
        nHealChildren == 100;
    }

    // Record HealChildren
    SetLocalInt(oSpawn, "f_HealChildren", nHealChildren);
    SetLocalInt(oSpawn, "f_HealEffects", nHealEffects);

    // Initialize SpawnItem
    int nSpawnItem = ParseFlagValue(sSpawnName, "IT", 0, dfSpawnItem);

    // Record SpawnItem
    SetLocalInt(oSpawn, "f_SpawnItem", nSpawnItem);

    // Initialize SpawnSit
    int nSpawnSit = ParseFlagValue(sSpawnName, "ST", 0, dfSpawnSit);

    // Record SpawnSit
    SetLocalInt(oSpawn, "f_SpawnSit", nSpawnSit);

    // Initialize SpawnPlot
    int nSpawnPlot = ParseFlagValue(sSpawnName, "PT", 0, dfSpawnPlot);

    // Record SpawnPlot
    SetLocalInt(oSpawn, "f_SpawnPlot", nSpawnPlot);

    // Initialize SpawnMerchant
    int nSpawnMerchant = ParseFlagValue(sSpawnName, "SM", 0 ,dfSpawnMerchant);

    // Record SpawnMerchant
    SetLocalInt(oSpawn, "f_SpawnMerchant", nSpawnMerchant);

    // Record CustomFlag
    SetLocalString(oSpawn, "f_CustomFlag", sCustomFlag);

    // Record Flags Initialized
    SetLocalInt(oSpawn, "FlagsInitialized", TRUE);
}
//

// This Function Sets the Spawns
int SetSpawns(location lBase)
{
    string sSpawnName, sSpawnNum;
    int nNth = 1;
    int nSpawnNum = 0;

    // Enumerate Waypoints in the Area
    object oSpawn = GetFirstObjectInArea(OBJECT_SELF);
    while (oSpawn != OBJECT_INVALID)
    {
        // Retrieve Name
        sSpawnName = GetName(oSpawn);

        // Check if Waypoint is a Spawn Controller
        if (GetStringLeft(sSpawnName, 2) == "SP")
        {
            // Set Spawn
            nSpawnNum++;
            sSpawnNum = "Spawn" + PadIntToString(nSpawnNum, 2);
            SetLocalObject(OBJECT_SELF, sSpawnNum, oSpawn);
        }
        nNth++;
        oSpawn = GetNextObjectInArea(OBJECT_SELF);
    }
    SetLocalInt(OBJECT_SELF, "Spawns", nSpawnNum);
    return nSpawnNum;
}
//

// This Function returns the Number of PCs in an Area
int CountPCsInArea(object oArea = OBJECT_INVALID, int nDM = FALSE)
    {
    int retVal = 0;
    if (oArea == OBJECT_INVALID)
    {
        oArea = GetArea(OBJECT_SELF);
    }
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        if (GetArea(oPC) == oArea)
        {
            if (GetIsDM(oPC) == TRUE)
            {
                if (nDM == TRUE)
                {
                    retVal++;
                }
            }
            else
            {
                retVal++;
            }
        }
        oPC = GetNextPC();
    }
    return retVal;
}
//

// This Function Returns the Number of PCs in a Radius
int CountPCsInRadius(location lCenter, float fRadius, int nDM = FALSE)
{
    int nPCs = 0;
    object oPC = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lCenter);
    while (oPC != OBJECT_INVALID)
    {
        if (GetIsPC(oPC))
        {
            if (GetIsDM(oPC))
            {
                if (nDM == TRUE)
                {
                    nPCs++;
                }
            }
            else
            {
                nPCs++;
            }
        }
        oPC = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lCenter);
    }
    return nPCs;
}
//

// This Function Returns a Random PC from Area
object GetRandomPCInArea(object oArea, object oSpawn)
{
    int nPCsInArea = CountPCsInArea(oArea, TRUE);
    int nNth = Random(nPCsInArea) + 1;
    object oRandomPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oSpawn, nNth);
    return oRandomPC;
}
//

// This Function Removes Item
void TransferItem(object oCreature, object oTarget, object oItem, int nCreatureItem)
{
    if(GetIsObjectValid(oItem))
    {
        if (GetBaseItemType(oItem) == BASE_ITEM_CREATUREITEM ||
            GetBaseItemType(oItem) == BASE_ITEM_CBLUDGWEAPON ||
            GetBaseItemType(oItem) == BASE_ITEM_CPIERCWEAPON ||
            GetBaseItemType(oItem) == BASE_ITEM_CSLASHWEAPON ||
            GetBaseItemType(oItem) == BASE_ITEM_CSLSHPRCWEAP)
        {
            if (nCreatureItem == TRUE)
            {
                AssignCommand(oTarget, ActionTakeItem(oItem, oCreature));
            }
        }
        else
        {
            AssignCommand(oTarget, ActionTakeItem(oItem, oCreature));
        }
    }
}
//

// This Function Removes All Items from a Creature
void TransferAllItems(object oCreature, object oTarget, int nCreatureItems, int nEquippedItems)
{
    if (nEquippedItems == TRUE)
    {
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_ARMS, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_ARROWS, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_BELT, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_BOLTS, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_BOOTS, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_BULLETS, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_CHEST, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_CLOAK, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_HEAD, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_LEFTRING, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_NECK, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCreature), nCreatureItems);
        TransferItem(oCreature, oTarget, GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oCreature), nCreatureItems);
    }

    object oItem = GetFirstItemInInventory(oCreature);
    while (oItem != OBJECT_INVALID)
    {
        TransferItem(oCreature, oTarget, oItem, nCreatureItems);
        oItem = GetNextItemInInventory(oCreature);
    }
}
//

// This Function Checks if the Party is within fDistance Meters of Each Other
int IsPartyTogether(object oPC, float fDistance)
{
    int nTogether = TRUE;
    object oMember = GetFirstFactionMember(oPC, TRUE);
    while (oMember != OBJECT_INVALID)
    {
        if (GetIsDead(oMember) == FALSE)
        {
            if (GetDistanceBetween(oPC, oMember) > fDistance)
            {
                nTogether = FALSE;
                oMember = OBJECT_INVALID;
            }
        }
        oMember = GetNextFactionMember(oPC, TRUE);
    }
    return nTogether;
}
//

// This Function Returns the Number of PCs in a Party
int CountMembersInParty(object oPC, int bPCOnly = TRUE)
{
    int nCount;
    object oMember = GetFirstFactionMember(oPC, bPCOnly);
    while (oMember != OBJECT_INVALID)
    {
        nCount++;
        oMember = GetNextFactionMember(oPC, bPCOnly);
    }
    return nCount;
}
//

// This Function Checks if nCheckDay is Between Days
int IsBetweenDays(int nCheckDay, int nDayStart, int nDayEnd)
{
    if (nDayEnd > -1)
    {
        if (nCheckDay >= nDayStart && nCheckDay <= nDayEnd)
        {
            return TRUE;
        }
    }
    else
    {
        if (nCheckDay == nDayStart)
        {
            return TRUE;
        }
    }

    return FALSE;
}
//

// This Function Checks if nCheckHour is Between Hours
int IsBetweenHours(int nCheckHour, int nHourStart, int nHourEnd)
{
    if (nHourEnd > -1)
    {
        if (nCheckHour >= nHourStart && nCheckHour <= nHourEnd)
        {
            return TRUE;
        }
    }
    else
    {
        if (nCheckHour == nHourStart)
        {
            return TRUE;
        }
    }

    return FALSE;
}
//

// This Function parses a String for Flags
int ParseFlagValue(string sName, string sFlag, int nDigits, int nDefault)
{
    int nRetValue;
    int nPos;

    nPos = FindSubString(sName, sFlag);
    if (nPos >= 0)
    {
        // Trim Flag
        sName = GetStringRight(sName, GetStringLength(sName) - (nPos + GetStringLength(sFlag)));
        nPos = FindSubString(sName, "_");
        if (nPos >= 0)
        {
            sName = GetStringLeft(sName, nPos);
        }

        // Retreive Flag
        if (TestStringAgainstPattern("*n", GetStringLeft(sName, 1)) == FALSE)
        {
            // Retreive Boolean
            nRetValue = TRUE;
        }
        else
        {
            // Retreive Value
            nRetValue = StringToInt(sName);
        }
    }
    else
    {
        nRetValue = nDefault;
    }

    // Return Value
    return nRetValue;
}
//

// This Function parses a String for a Subvalue from Flags
int ParseSubFlagValue(string sName, string sFlag, int nDigits, string sSubFlag, int nSubDigits, int nDefault)
{
    int nRetValue;
    int nPos;

    nPos = FindSubString(sName, sFlag);
    if (nPos >= 0)
    {
        // Trim Flag
        sName = GetStringRight(sName, GetStringLength(sName) - (nPos + GetStringLength(sFlag)));
        nPos = FindSubString(sName, "_");
        if (nPos >= 0)
        {
            sName = GetStringLeft(sName, nPos);
        }

        // Retreive SubFlag
        nPos = FindSubString(sName, sSubFlag);
        if (nPos >= 0)
        {
            sName = GetStringRight(sName, GetStringLength(sName) - (nPos + GetStringLength(sSubFlag)));
            if (TestStringAgainstPattern("*n", GetStringLeft(sName, 1)) == FALSE)
            {
                // Retreive Boolean
                nRetValue = TRUE;
            }
            else
            {
                // Retrieve Value
                nRetValue = StringToInt(sName);
            }
        }
        else
        {
            nRetValue = nDefault;
        }
    }
    else
    {
        nRetValue = nDefault;
    }

    // Return Value
    return nRetValue;
}
//

// This Function Pads an IntToString with 0s
string PadIntToString(int nInt, int nDigits)
{
    string sRetString;
    string sTempInt = IntToString(nInt);
    int iCount;

    sRetString = "";
    for (iCount = 1; iCount <= (nDigits - GetStringLength(sTempInt)); iCount++)
    {
        sRetString = sRetString + "0";
    }
    sRetString = sRetString + sTempInt;
    return sRetString;
}
//

// This Function returns a Child Object by Tag
object GetChildByTag(object oSpawn, string sChildTag)
{
    object oChild;
    object oRetChild = OBJECT_INVALID;
    string sChildSlot;
    int nChildSlot;

    string sSpawnName = GetLocalString(oSpawn, "f_Flags");
    int nSpawnNumber = ParseFlagValue(sSpawnName, "SN", 2, 1);

    // Cycle through Children
    for (nChildSlot = 1; nChildSlot <= nSpawnNumber; nChildSlot++)
    {
        // Retrieve Child

        sChildSlot = "ChildSlot" + PadIntToString(nChildSlot, 2);
        oChild = GetLocalObject(oSpawn, sChildSlot);
        if (GetTag(oChild) == sChildTag)
        {
            oRetChild = oChild;
        }
    }

    return oRetChild;
}
//

// This Function returns a Child Object by Slot Number
object GetChildByNumber(object oSpawn, int nChildNum)
{
    object oRetChild = OBJECT_INVALID;
    string sChildSlot;

    string sSpawnName = GetLocalString(oSpawn, "f_Flags");
    int nSpawnNumber = ParseFlagValue(sSpawnName, "SN", 2, 1);

    // Check if Valid Number
    if (nChildNum > nSpawnNumber)
    {
        return oRetChild;
    }

    // Retrieve Child
    sChildSlot = "ChildSlot" + PadIntToString(nChildNum, 2);
    oRetChild = GetLocalObject(oSpawn, sChildSlot);

    // Return Child
    return oRetChild;
}
//

// This Function returns a Spawn Object by ID
object GetSpawnByID(int nSpawnID)
{
    string sSpawnName;
    object oRetSpawn;

    // Enumerate Waypoints in the Area
    object oSpawn = GetFirstObjectInArea(OBJECT_SELF);
    while (oSpawn != OBJECT_INVALID)
    {
        // Retrieve Name
        sSpawnName = GetName(oSpawn);

        // Check if Waypoint is a Spawn Controller
        if (GetStringLeft(sSpawnName, 2) == "SP")
        {
            if (GetLocalInt(oSpawn, "SpawnID") == nSpawnID)
            {
                oRetSpawn = oSpawn;
            }
        }
        oSpawn = GetNextObjectInArea(OBJECT_SELF);
    }
    return oRetSpawn;
}
//

// This Function Sets Children to Despawn
void DespawnChildren(object oSpawn)
{
    object oChild;
    string sChildSlot;
    int nChildSlot;

    string sSpawnName = GetLocalString(oSpawn, "f_Flags");
    int nSpawnNumber = ParseFlagValue(sSpawnName, "SN", 2, 1);

    // Cycle through Children
    for (nChildSlot = 1; nChildSlot <= nSpawnNumber; nChildSlot++)
    {
        // Retrieve Child

        sChildSlot = "ChildSlot" + PadIntToString(nChildSlot, 2);
        oChild = GetLocalObject(oSpawn, sChildSlot);
        SetLocalInt(oChild, "ForceDespawn", TRUE);
    }
}
//

// This Function Sets Children to Despawn by Tag
void DespawnChildrenByTag(object oSpawn, string sChildTag)
{
    object oChild;
    string sChildSlot;
    int nChildSlot;

    string sSpawnName = GetLocalString(oSpawn, "f_Flags");
    int nSpawnNumber = ParseFlagValue(sSpawnName, "SN", 2, 1);

    // Cycle through Children
    for (nChildSlot = 1; nChildSlot <= nSpawnNumber; nChildSlot++)
    {
        // Retrieve Child

        sChildSlot = "ChildSlot" + PadIntToString(nChildSlot, 2);
        oChild = GetLocalObject(oSpawn, sChildSlot);
        if (GetTag(oChild) == sChildTag)
        {
            SetLocalInt(oChild, "ForceDespawn", TRUE);
        }
    }
}
//

// This Function Adds a Child to a Spawn
void AddChild(object oSpawn, object oSpawned)
{
    // Declare Variables
    int nEmptyChildSlot, nChildSlot;
    int nSpawnNumber, nSpawnCount, nChildrenSpawned;
    string sChildSlot, sEmptyChildSlot;
    object oChild;

    // Retreive Values
    nSpawnNumber = GetLocalInt(oSpawn, "f_SpawnNumber");
    nChildrenSpawned = GetLocalInt(oSpawn, "ChildrenSpawned");
    nSpawnCount = GetLocalInt(oSpawn, "SpawnCount");

    // Find Empty Child Slot
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

    if (nEmptyChildSlot != 0)
    {
        // Assign Values to oSpawned
        SetLocalObject(oSpawned, "ParentSpawn", oSpawn);
        SetLocalFloat(oSpawned, "HomeX", GetPositionFromLocation(GetLocation(oSpawned)).x);
        SetLocalFloat(oSpawned, "HomeY", GetPositionFromLocation(GetLocation(oSpawned)).y);

        // Assign Child Slot
        SetLocalObject(oSpawn, sEmptyChildSlot, oSpawned);
        SetLocalString(oSpawned, "ParentChildSlot", sEmptyChildSlot);

        // Assign Values to oSpawn
        nChildrenSpawned++;
        SetLocalInt(oSpawn, "ChildrenSpawned", nChildrenSpawned);
        nSpawnCount++;
        SetLocalInt(oSpawn, "SpawnCount", nSpawnCount);
    }
}
//

// This Function Sets a Spawn to Deactivate
void DeactivateSpawn(object oSpawn)
{
    SetLocalInt(oSpawn, "ForceDeactivateSpawn", TRUE);
}

// This Function Sets all Spawns by Tag to Deactivate
void DeactivateSpawnsByTag(string sSpawnTag)
{
    int nNth;
    object oSpawn;
    string sSpawnNum;

    int nSpawns = GetLocalInt(GetArea(OBJECT_SELF), "Spawns");

    for (nNth = 1; nNth <= nSpawns; nNth++)
    {
        // Retrieve Spawn
        sSpawnNum = "Spawn" + PadIntToString(nNth, 2);
        oSpawn = GetLocalObject(OBJECT_SELF, sSpawnNum);
        if (GetTag(oSpawn) == sSpawnTag)
        {
            SetLocalInt(oSpawn, "ForceDeactivateSpawn", TRUE);
        }
    }
}
//

// This Function Sets all Spawns to Deactivate
void DeactivateAllSpawns()
{
    int nNth;
    object oSpawn;
    string sSpawnNum;

    int nSpawns = GetLocalInt(GetArea(OBJECT_SELF), "Spawns");

    for (nNth = 1; nNth <= nSpawns; nNth++)
    {
        // Retrieve Spawn
        sSpawnNum = "Spawn" + PadIntToString(nNth, 2);
        oSpawn = GetLocalObject(OBJECT_SELF, sSpawnNum);
        SetLocalInt(oSpawn, "ForceDeactivateSpawn", TRUE);
    }
}
//

// Random Walking with Range
void RandomWalk(object oSpawn, object oSpawned, float fWalkingRadius, int nRun)
{
    vector vCurrentLocation, vTargetLocation;
    float fRadiusX, fRadiusY;
    location lTargetLocation;

    // Create our Random Location
    fRadiusX = IntToFloat(Random(FloatToInt(fWalkingRadius)));
    fRadiusY = IntToFloat(Random(FloatToInt(fWalkingRadius)));
    if (d2() == 2)
    {
        fRadiusX = -fRadiusX;
    }
    if (d2() == 2)
    {
        fRadiusY = -fRadiusY;
    }
    vTargetLocation = Vector(fRadiusX, fRadiusY);
    vCurrentLocation = GetPositionFromLocation(GetLocation(oSpawn));
    lTargetLocation = Location(OBJECT_SELF, vCurrentLocation + vTargetLocation, 0.0);

    // Walk to the New Location
    AssignCommand(oSpawned, ActionMoveToLocation(lTargetLocation, nRun));
}
//

// This Function Finds a Seat and Sits in It
void FindSeat(object oSpawn, object oSpawned)
{
    object oSeat;
    string sSeatTag = GetLocalString(GetModule(), "df_SeatTag");

    int nNth = 1;
    object oSittable = GetNearestObjectByTag(sSeatTag, oSpawn, nNth);
    while (oSittable != OBJECT_INVALID && oSeat == OBJECT_INVALID)
    {
        if (GetSittingCreature(oSittable) == OBJECT_INVALID)
        {
            oSeat = oSittable;
        }
        nNth++;
        oSittable = GetNearestObjectByTag(sSeatTag, oSpawn, nNth);
    }
    AssignCommand(oSpawned, ActionSit(oSeat));
}
//

// This Function Cleans an Object's Inventory
void CleanInventory(object oSpawned)
{
    // Clean out oSpawned's Inventory
    object oItem = GetFirstItemInInventory(oSpawned);
    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oSpawned);
    }
}
//

// This Functions Sets up the Patrol Route
void SetPatrolRoute(int nPatrolRoute)
{
    object oStop;
    int nRouteNumber, nStopNumber, iCount, nNumStops;
    string sStop;

    // Cycle through Available Patrol Route Stops
    iCount = 0;
    nNumStops = 0;
    oStop = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, iCount);
    while (oStop != OBJECT_INVALID)
    {
        sStop = GetTag(oStop);
        // Check Route Number
        nRouteNumber = ParseFlagValue(sStop, "PR", 2, -1);
        if (nRouteNumber == nPatrolRoute)
        {
            // Identical Route Number, Add this Stop to oSpawned
            nNumStops++;
            nStopNumber = ParseFlagValue(sStop, "SN", 2, 0);
            SetLocalObject(OBJECT_SELF, "PR_SN" + PadIntToString(nStopNumber, 2), oStop);
        }
        iCount++;
        oStop = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, iCount);
    }
    SetLocalInt(OBJECT_SELF, "PR_STOPS", nNumStops);
}
//

// This Function Performs the Patrol Route
void DoPatrolRoute(int nPatrolRoute, int nRouteType)
{
    int nNumStops, nDespawn;
    int nNextPatrolStop = -1;
    int nLastPatrolStop = -1;
    int nReturnRoute = FALSE;

    ClearAllActions();

    // Retreive Stop Information
    nNumStops = GetLocalInt(OBJECT_SELF, "PR_STOPS");
    nNextPatrolStop = GetLocalInt(OBJECT_SELF, "PR_NEXTSTOP");
    nLastPatrolStop = GetLocalInt(OBJECT_SELF, "PR_LASTSTOP");
    nReturnRoute = GetLocalInt(OBJECT_SELF, "PR_RETURNROUTE");

    // Add New Stop to Route
    if (nNextPatrolStop == -1)
    {
        // Sequential Route
        if (nRouteType == 0 || nRouteType == 3)
        {
            if (nReturnRoute == TRUE)
            {
                if (nLastPatrolStop == 0)
                {
                    nReturnRoute = FALSE;
                    SetLocalInt(OBJECT_SELF, "PR_RETURNROUTE", nReturnRoute);
                    nNextPatrolStop = nLastPatrolStop + 1;
                }
                else
                {
                    nNextPatrolStop = nLastPatrolStop - 1;
                }
            }
            else
            {
                if (nLastPatrolStop == nNumStops)
                {
                    if (nRouteType == 3)
                    {
                        // End of Line, Despawn
                        nDespawn = TRUE;
                    }
                    else
                    {
                        nReturnRoute = TRUE;
                        SetLocalInt(OBJECT_SELF, "PR_RETURNROUTE", nReturnRoute);
                        nNextPatrolStop = nLastPatrolStop - 2;
                    }
                }
                else
                {
                    nNextPatrolStop = nLastPatrolStop + 1;
                }
            }
        }

        // Circular Route
        if (nRouteType == 1)
        {
            if (nLastPatrolStop == nNumStops)
            {
                nNextPatrolStop = 0;
            }
            else
            {
                nNextPatrolStop = nLastPatrolStop + 1;
            }
        }

        // Random Route
        if (nRouteType == 2)
        {
            nNextPatrolStop = Random(nNumStops);
            while (nNextPatrolStop == nLastPatrolStop)
            {
                nNextPatrolStop = Random(nNumStops);
            }
        }
    }

    if (nDespawn == TRUE)
    {
        ClearAllActions();
        SetLocalInt(OBJECT_SELF, "ForceDespawn", TRUE);
    }
    else
    {
        // Set Next Stop
        SetLocalInt(OBJECT_SELF, "PR_NEXTSTOP", nNextPatrolStop);

        // Add Stop to Patrol
        AddPatrolStop(nPatrolRoute, nNextPatrolStop);

        // Repeat the Process
        ActionDoCommand(DoPatrolRoute(nPatrolRoute, nRouteType));
    }
}
//

// This Function adds a Stop to the Patrol Route
void AddPatrolStop(int nPatrolRoute, int nStopNumber)
{
    object oStop;
    int nRun, nScript, nFacing;
    int nDayOnly, nNightOnly;
    float fPause;
    string sStop;
    int nValid = TRUE;

    // Gather Stop Information
    oStop = GetLocalObject(OBJECT_SELF, "PR_SN" + PadIntToString(nStopNumber, 2));
    sStop = GetTag(oStop);
    nRun = ParseFlagValue(sStop, "RN", 0, 0);
    fPause = IntToFloat(ParseFlagValue(sStop, "PS", 3, 1));
    nScript = ParseFlagValue(sStop, "SC", 3, -1);
    nFacing = ParseFlagValue(sStop, "SF", 0, 0);
    nDayOnly = ParseFlagValue(sStop, "DO", 0, 0);
    nNightOnly = ParseFlagValue(sStop, "NO", 0, 0);

    // Day Only
    if (nDayOnly == TRUE && (GetIsDay() == FALSE && GetIsDawn() == FALSE))
    {
        nValid = FALSE;
    }

    // Night Only
    if (nNightOnly == TRUE && (GetIsNight() == FALSE && GetIsDusk() == FALSE))
    {
        nValid = FALSE;
    }

    // Check if Valid
    if (nValid == TRUE)
    {
        // Move to Stop
        ActionMoveToObject(oStop, nRun);
        if (nFacing == TRUE)
        {
            ActionDoCommand(SetFacing(GetFacingFromLocation(GetLocation(oStop))));
        }

        // Execute Script
        if (nScript > -1)
        {
            SetLocalInt(OBJECT_SELF, "PatrolScript", nScript);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "PatrolScriptRunning", TRUE));
            ExecuteScript("spawn_sc_patrol", OBJECT_SELF);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "PatrolScriptRunning", FALSE));
        }

        // Pause
        ActionWait(fPause);
    }

    // Record this Stop and Clear Next Stop
    ActionDoCommand(SetLocalInt(OBJECT_SELF, "PR_LASTSTOP", nStopNumber));
    ActionDoCommand(SetLocalInt(OBJECT_SELF, "PR_NEXTSTOP", -1));
}
//

// This Function Checks Camp State
int CampState(object oCamp)
{
    int iCount;
    int nIsAlive = FALSE;
    int nCampNumC, nCampNumP, nPlaceableType, nDeathScript;
    float fCorpseDecay;
    object oSpawned, oCampTrigger, oItem;
    string sObject, sFlags, sCampTrigger;

    // Check Creatures
    nCampNumC = GetLocalInt(oCamp, "CampNumC");
    for (iCount = 1; iCount <= nCampNumC; iCount++)
    {
        sObject = "CampC" + IntToString(iCount - 1);
        sFlags = GetLocalString(oCamp, sObject + "_Flags");
        fCorpseDecay = IntToFloat(ParseFlagValue(sFlags, "CD", 3, 0));
        nDeathScript = ParseFlagValue(sFlags, "DT", 3, -1);
        oSpawned = GetLocalObject(oCamp, sObject);
        if (oSpawned != OBJECT_INVALID)
        {
            if (GetIsDead(oSpawned) == FALSE)
            {
                nIsAlive = TRUE;
            }
            // Spawn Corpse if Dead and No Corpse
            else
            {
                if (fCorpseDecay > 0.0 && GetLocalObject(oSpawned, "Corpse") == OBJECT_INVALID)
                {
                    ExecuteScript("spawn_corpse_dth", oSpawned);
                }
                if (nDeathScript > -1 && GetLocalInt(oSpawned, "DeathScript") == 0)
                {
                    SetLocalInt(oSpawned, "DeathScript", nDeathScript);
                    ExecuteScript("spawn_sc_death", oSpawned);
                    if (fCorpseDecay == 0.0)
                    {
                    AssignCommand(oSpawned, SetIsDestroyable(TRUE, FALSE, FALSE));
                    }
                }
            }
        }
    }

    // Check Camp Trigger
    sCampTrigger = GetLocalString(oCamp, "CampTrigger");
    if (sCampTrigger != "")
    {
        oCampTrigger = GetLocalObject(oCamp, "Camp" + sCampTrigger);
        if (oCampTrigger == OBJECT_INVALID || GetIsDead(oCampTrigger) == TRUE)
        {
            // Run Trigger Script
            ExecuteScript("spawn_sc_cmptrig", oCamp);
        }
    }

    // Check Placeable
    nCampNumP = GetLocalInt(oCamp, "CampNumP");
    for (iCount = 1; iCount <= nCampNumP; iCount++)
    {
        sObject = "CampP" + IntToString(iCount - 1);
        sFlags = GetLocalString(oCamp, sObject + "_Flags");
        nPlaceableType = ParseFlagValue(sFlags, "PL", 1, 0);
        if (nPlaceableType == 1)
        {
            // Despawn if Empty
            oSpawned = GetLocalObject(oCamp, sObject);
            if (GetFirstItemInInventory(oSpawned) == OBJECT_INVALID)
            {
                DestroyObject(oSpawned);
            }
        }
    }

    return nIsAlive;
}
//

// This Function will Despawn a Camp
void DestroyCamp(object oCamp, float fCampDecay)
{
    int iCount;
    object oSpawned;
    string sObject;

    int nCampNumP = GetLocalInt(oCamp, "CampNumP");
    int nCampNumC = GetLocalInt(oCamp, "CampNumC");

    // Destroy Placeables
    for (iCount = 1; iCount <= nCampNumP; iCount++)
    {
        sObject = "CampP" + IntToString(iCount - 1);
        oSpawned = GetLocalObject(oCamp, sObject);
        DestroyObject(oSpawned, fCampDecay);
    }

    // Destroy Creatures
    for (iCount = 1; iCount <= nCampNumC; iCount++)
    {
        sObject = "CampC" + IntToString(iCount - 1);
        oSpawned = GetLocalObject(oCamp, sObject);
        if (GetIsDead(oSpawned) == FALSE)
        {
            AssignCommand(oSpawned, SetIsDestroyable(TRUE));
            DestroyObject(oSpawned);
        }
    }
}
//
