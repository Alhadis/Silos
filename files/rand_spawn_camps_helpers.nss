#include "rand_spawn_consts" 

// Helpers
// Sets up basics for the random camp
void InitializeCamp(object oCamp, float radius=1.0f);
// Adds a placeable to the camp
void AddPlaceableToCamp(string resRef, object oCamp, string flags="SP_SF");
// Adds a creature to the camp
void AddCreatureToCamp(string resRef, object oCamp, string flags="SP_PC30_CD30_HL20");
// Gets a random trap resref
string GetRandomTrapByLocalLevel();

//Returns RARITY_* denoting how rare of a creature is spawned
int GetCreatueRarity();

// Sets up basics for the random camp
void InitializeCamp(object oCamp, float radius){
    //Set Number of Paceables
    SetLocalInt(oCamp, "CampNumP", 0);
    //Set Number of Creatures
    SetLocalInt(oCamp, "CampNumC", 0);
    // Set Radius of Camp
    SetLocalFloat(oCamp, "CampRadius", radius);
    
    // Set Placeable 0 to be Camp Center
    SetLocalString(oCamp, "CampCenter", "P0");
}

// Adds a placeable to the camp
void AddPlaceableToCamp(string resRef, object oCamp, string flags)
{
  int curPlaceableNum =  GetLocalInt(oCamp, "CampNumP");
  SetLocalInt(oCamp, "CampNumP",  curPlaceableNum + 1);

  // Set Creature ResRef and Spawn Flags
  SetLocalString(oCamp, "CampP" + IntToString(curPlaceableNum), resRef  );
  SetLocalString(oCamp, "CampP" + IntToString(curPlaceableNum) + "_Flags", flags);
}


// Adds a creature to the camp to be spawned
void AddCreatureToCamp(string resRef, object oCamp,string flags)
{
  int curCreatureNum =  GetLocalInt(oCamp, "CampNumC");
  SetLocalInt(oCamp, "CampNumC", curCreatureNum + 1);

  // Set Creature ResRef and Spawn Flags
  SetLocalString(oCamp, "CampC" + IntToString(curCreatureNum), resRef );
  SetLocalString(oCamp, "CampC" + IntToString(curCreatureNum) + "_Flags", flags);
}

// Gets a random trap resref
string GetRandomTrapByLocalLevel()
{
  string trapResRef;
  trapResRef = "nw_mspiketrap001";

  return trapResRef;
  //TODO: More traps
}

//Returns RARITY_* denoting how rare of a creature is spawned
int GetCreatueRarity()
{
  int result = Random(RARITY_COMMON_RATIO + RARITY_UNCOMMON_RATIO + RARITY_RARE_RATIO);

  if (result < RARITY_COMMON_RATIO)
    return RARITY_COMMON;
  else if (result < RARITY_COMMON_RATIO + RARITY_UNCOMMON_RATIO)
    return RARITY_UNCOMMON;
  else
    return RARITY_RARE;
}