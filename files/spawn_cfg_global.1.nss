//
// Spawn v6.8
// Spawn Global Defaults
//

void SetGlobalDefaults()
{
//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // ISnDn
    // InitialState
    int nInitialState = 1;
    int nInitialDelay = -1;

    // FTn
    // FlagTable
    int nFlagTable = -1;
    int nFlagTableNumber = 0;

    // SDn|Mn
    // SpawnDelay
    int nSpawnDelay = 0;
    int nDelayRandom = -1;
    int nDelayMinimum = 0;

    // SNn|Mn SA|n|Mn
    // SpawnNumber
    int nSpawnNumber = 1;
    int nSpawnNumberMin = -1;
    int nSpawnAllAtOnce = FALSE;
    int nSpawnNumberAtOnce = 0;
    int nSpawnNumberAtOnceMin = 0;

    // DO|D
    // DayOnly
    int nDayOnly = FALSE;
    int nDayOnlyDespawn = FALSE;

    // NO|D
    // NightOnly
    int nNightOnly = FALSE;
    int nNightOnlyDespawn = FALSE;

    // DYn|Tn
    // SpawnDay
    int nSpawnDayStart = -1;
    int nSpawnDayEnd = -1;

    // HRn|Tn
    // SpawnHour
    int nSpawnHourStart = -1;
    int nSpawnHourEnd = -1;

    // RW|Rn
    // RandomWalk
    int nRandomWalk = FALSE;
    int nWanderRange = 0;

    // RH|Dn
    // ReturnHome
    int nReturnHome = FALSE;
    int nReturnHomeRange = 1;

    // PC|n|R
    // PCCheck
    int nPCCheck = -1;
    int nPCCheckDelay = 0;
    int nPCReset = FALSE;

    // RGn|Mn|Cn
    // RandomGold
    int nRandomGold = 0;
    int nRandomGoldMin = 0;
    int nGoldChance = 100;

    // FXn|Dn
    // SpawnEffects
    int nSpawnEffect = 0;
    int nDespawnEffect = 0;

    // PRn|Tn
    // PatrolRoutes
    int nPatrolRoute = -1;
    int nRouteType = 0;

    // PLn|Tn
    // Placeables
    int nPlaceable = -1;
    int nPlaceableType = 0;
    int nTrapDisabled = 100;

    // SG
    // SpawnGroup
    int nSpawnGroup = FALSE;

    // LTn
    // LootTable
    int nLootTable = -1;

    // DSn|Sn
    // SpawnDeactivation
    int nDeactivateSpawn = -1;
    int nDeactivateScript = -1;

    // DIn
    // DeactivationInfo
    int nDeactivationInfo = -1;

    // CLn|Mn
    // ChildLifespan
    int nChildLifespanMax = -1;
    int nChildLifespanMin = -1;

    // SRn|Mn|P
    // SpawnRadius
    int nSpawnRadius = 0;
    int nSpawnRadiusMin = 0;
    int nSpawnNearPCs = 0;

    // SUn
    // SpawnUnseen
    int nSpawnUnseen = 0;

    // CDn|Tn
    // CorpseDecay
    int nCorpseDecay = 0;
    int nCorpseDecayType = 0;

    // CM|Dn
    // SpawnCamp
    int nSpawnCamp = FALSE;
    int nCampDecay = 0;

    // SSn|Dn
    // SpawnScript
    int nSpawnScript = -1;
    int nDespawnScript = -1;

    // DTn
    // DeathScript
    int nDeathScript = -1;

    // CCn
    // SpawnCheckCustom
    int nSpawnCheckCustom = -1;

    // CPn|Rn
    // SpawnCheckPCs
    int nSpawnCheckPCs = -1;
    int nCheckPCsRadius = -1;

    // TRn|Dn
    // SpawnTrigger
    int nSpawnTrigger = 0;
    int nDespawnTrigger = 0;

    // AEn|Dn
    // AreaEffect
    int nSpawnAreaEffect = 0;
    int nAreaEffectDuration = 5;

    // OEn|Dn
    // ObjectEffect
    int nObjectEffect = 0;
    int nObjectEffectDuration = -1;

    // RSn
    // RandomSpawn
    int nRandomSpawn = 100;

    // FCn
    // SpawnFaction
    int nSpawnFaction = -1;

    // ALn|Sn
    int nSpawnAlignment = -1;
    int nAlignmentShift = 10;

    // HBn
    // HeartbeatScript
    int nHeartbeatScript = -1;

    // SLn|Rn
    // SpawnLocation
    int nSpawnLocation = -1;
    int nSpawnLocationMin = -1;

    // SF
    // SpawnFacing
    int nSpawnFacing = FALSE;

    // EEn|Rn
    // EntranceExit
    int nEntranceExit = -1;
    int nEntranceExitMin = -1;
    int nExit = -1;
    int nExitMin = -1;

    // HL|n|E
    // HealChildren
    int nHealChildren = 0;
    int nHealEffects = FALSE;

    // IT
    // SpawnItem
    int nSpawnItem = FALSE;

    // ST
    // SpawnSit
    int nSpawnSit = FALSE;

    // PT
    // SpawnPlot
    int nSpawnPlot = FALSE;

    // SM
    // SpawnMerchant
    int nSpawnMerchant = FALSE;

    // Sittable Tag
    string sSeatTag = "Seat";


// -------------------------------------------
// Only Make Modifications Between These Lines
//

    // Record Values
    object oModule = GetModule();
    SetLocalInt(oModule, "df_InitialState", nInitialState);
    SetLocalInt(oModule, "df_InitialDelay", nInitialDelay);
    SetLocalInt(oModule, "df_FlagTable", nFlagTable);
    SetLocalInt(oModule, "df_FlagTableNumber", nFlagTableNumber);
    SetLocalInt(oModule, "df_SpawnDelay", nSpawnDelay);
    SetLocalInt(oModule, "df_DelayRandom", nDelayRandom);
    SetLocalInt(oModule, "df_DelayMinimum", nDelayMinimum);
    SetLocalInt(oModule, "df_SpawnNumber", nSpawnNumber);
    SetLocalInt(oModule, "df_SpawnNumberMin", nSpawnNumberMin);
    SetLocalInt(oModule, "df_SpawnAllAtOnce", nSpawnAllAtOnce);
    SetLocalInt(oModule, "df_SpawnNumberAtOnce", nSpawnNumberAtOnce);
    SetLocalInt(oModule, "df_SpawnNumberAtOnceMin", nSpawnNumberAtOnceMin);
    SetLocalInt(oModule, "df_DayOnly", nDayOnly);
    SetLocalInt(oModule, "df_DayOnlyDespawn", nDayOnlyDespawn);
    SetLocalInt(oModule, "df_NightOnly", nNightOnly);
    SetLocalInt(oModule, "df_NightOnlyDespawn", nNightOnlyDespawn);
    SetLocalInt(oModule, "df_SpawnDayStart", nSpawnDayStart);
    SetLocalInt(oModule, "df_SpawnDayEnd", nSpawnDayEnd);
    SetLocalInt(oModule, "df_SpawnHourStart", nSpawnHourStart);
    SetLocalInt(oModule, "df_SpawnHourEnd", nSpawnHourEnd);
    SetLocalInt(oModule, "df_RandomWalk", nRandomWalk);
    SetLocalInt(oModule, "df_WanderRange", nWanderRange);
    SetLocalInt(oModule, "df_ReturnHome", nReturnHome);
    SetLocalInt(oModule, "df_ReturnHomeRange", nReturnHomeRange);
    SetLocalInt(oModule, "df_PCCheck", nPCCheck);
    SetLocalInt(oModule, "df_PCCheckDelay", nPCCheckDelay);
    SetLocalInt(oModule, "df_PCReset", nPCReset);
    SetLocalInt(oModule, "df_RandomGold", nRandomGold);
    SetLocalInt(oModule, "df_RandomGoldMin", nRandomGoldMin);
    SetLocalInt(oModule, "df_GoldChance", nGoldChance);
    SetLocalInt(oModule, "df_SpawnEffect", nSpawnEffect);
    SetLocalInt(oModule, "df_DespawnEffect", nDespawnEffect);
    SetLocalInt(oModule, "df_PatrolRoute", nPatrolRoute);
    SetLocalInt(oModule, "df_RouteType", nRouteType);
    SetLocalInt(oModule, "df_Placeable", nPlaceable);
    SetLocalInt(oModule, "df_PlaceableType", nPlaceableType);
    SetLocalInt(oModule, "df_TrapDisabled", nTrapDisabled);
    SetLocalInt(oModule, "df_SpawnGroup", nSpawnGroup);
    SetLocalInt(oModule, "df_LootTable", nLootTable);
    SetLocalInt(oModule, "df_DeactivateSpawn", nDeactivateSpawn);
    SetLocalInt(oModule, "df_DeactivateScript", nDeactivateScript);
    SetLocalInt(oModule, "df_DeactivationInfo", nDeactivationInfo);
    SetLocalInt(oModule, "df_ChildLifespanMax", nChildLifespanMax);
    SetLocalInt(oModule, "df_ChildLifespanMin", nChildLifespanMin);
    SetLocalInt(oModule, "df_SpawnRadius", nSpawnRadius);
    SetLocalInt(oModule, "df_SpawnRadiusMin", nSpawnRadiusMin);
    SetLocalInt(oModule, "df_SpawnNearPCs", nSpawnNearPCs);
    SetLocalInt(oModule, "df_SpawnUnseen", nSpawnUnseen);
    SetLocalInt(oModule, "df_CorpseDecay", nCorpseDecay);
    SetLocalInt(oModule, "df_CorpseDecayType", nCorpseDecayType);
    SetLocalInt(oModule, "df_SpawnCamp", nSpawnCamp);
    SetLocalInt(oModule, "df_CampDecay", nCampDecay);
    SetLocalInt(oModule, "df_SpawnScript", nSpawnScript);
    SetLocalInt(oModule, "df_DespawnScript", nDespawnScript);
    SetLocalInt(oModule, "df_DeathScript", nDeathScript);
    SetLocalInt(oModule, "df_SpawnCheckCustom", nSpawnCheckCustom);
    SetLocalInt(oModule, "df_SpawnCheckPCs", nSpawnCheckPCs);
    SetLocalInt(oModule, "f_CheckPCsRadius", nCheckPCsRadius);
    SetLocalInt(oModule, "df_SpawnTrigger", nSpawnTrigger);
    SetLocalInt(oModule, "df_DespawnTrigger", nDespawnTrigger);
    SetLocalInt(oModule, "df_SpawnAreaEffect", nSpawnAreaEffect);
    SetLocalInt(oModule, "df_AreaEffectDuration", nAreaEffectDuration);
    SetLocalInt(oModule, "df_ObjectEffect", nObjectEffect);
    SetLocalInt(oModule, "df_ObjectEffectDuration", nObjectEffectDuration);
    SetLocalInt(oModule, "df_RandomSpawn", nRandomSpawn);
    SetLocalInt(oModule, "df_SpawnFaction", nSpawnFaction);
    SetLocalInt(oModule, "df_SpawnAlignment", nSpawnAlignment);
    SetLocalInt(oModule, "df_AlignmentShift", nAlignmentShift);
    SetLocalInt(oModule, "df_HeartbeatScript", nHeartbeatScript);
    SetLocalInt(oModule, "df_SpawnLocation", nSpawnLocation);
    SetLocalInt(oModule, "df_SpawnLocationMin", nSpawnLocationMin);
    SetLocalInt(oModule, "df_SpawnFacing", nSpawnFacing);
    SetLocalInt(oModule, "df_EntranceExit", nEntranceExit);
    SetLocalInt(oModule, "df_EntranceExitMin", nEntranceExitMin);
    SetLocalInt(oModule, "df_Exit", nExit);
    SetLocalInt(oModule, "df_ExitMin", nExitMin);
    SetLocalInt(oModule, "df_HealChildren", nHealChildren);
    SetLocalInt(oModule, "df_HealEffects", nHealEffects);
    SetLocalInt(oModule, "df_SpawnItem", nSpawnItem);
    SetLocalInt(oModule, "df_SpawnSit", nSpawnSit);
    SetLocalInt(oModule, "df_SpawnPlot", nSpawnPlot);
    SetLocalInt(oModule, "df_SpawnMerchant", nSpawnMerchant);
    SetLocalString(oModule, "df_SeatTag", sSeatTag);

    // Record Initialization
    SetLocalInt(oModule, "GlobalDefaultsInitialized", TRUE);
}
