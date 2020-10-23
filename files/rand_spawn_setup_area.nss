#include "rand_spawn_consts" 

//Sets up the area variables so random creatures will spawn here
void SetupAreaForRSS(object area);
//Deletes area variables so no random creatures will spawn here
void TeardownAreaForRSS(object area);

//Returns a level for the area, based on constraints
int DetermineAreaLevel(object area);
//Returns a string with the creature type for the area
string DetermineAreaCreatureType(object area, int areaLevel);
//Returns "" if camp does not meet Mix or Max requirements provided.  Otherwise returns the camp name
string CreatureTypeMinMax(string creatureType, int min, int max, int areaLevel);

//Returns a string with the tribe name for the creature type in the area
string DetermineCreatureTypeTribe(object area, string creatureType);
//Returns a trait to apply to all creatures in the area
int DetermineAreaTrait(object area, int traitIndex);

void SetupAreaForRSS(object area)
{
  int areaLevel = DetermineAreaLevel(area);
  SetLocalInt(area, "AREA_CREATURE_LEVEL", areaLevel);

  string creatureType = DetermineAreaCreatureType(area, areaLevel);
  SetLocalString(area, "AREA_CREATURE_TYPE", creatureType);

  string creatureTribe = DetermineCreatureTypeTribe(area, creatureType);
  SetLocalString(area, "AREA_CREATURE_TRIBE", creatureTribe);

  int traitIndex;
  int numAreaTraits = GetLocalInt(area, "NUM_AREA_TRAITS");

  if (numAreaTraits = 0)
    numAreaTraits = DEFAULT_NUM_AREA_TRAITS;
  if (numAreaTraits = NO_AREA_TRAITS)
    numAreaTraits = 0;

  for (traitIndex = 1; traitIndex <= numAreaTraits; traitIndex++)
  {
    int areaTrait = DetermineAreaTrait(area, traitIndex);
    SetLocalInt(area, "AREA_TRAIT_" + IntToString(traitIndex), areaTrait);
  }

  SetLocalInt(area, "AREA_SPAWN_READY", TRUE);
}

void TeardownAreaForRSS(object area)
{
  DeleteLocalInt(area, "AREA_CREATURE_LEVEL");
  DeleteLocalString(area, "AREA_CREATURE_TYPE");
  DeleteLocalString(area, "AREA_CREATURE_TRIBE");

  int traitIndex = 1;
  int areaTrait = GetLocalInt(area, "AREA_TRAIT_" + IntToString(traitIndex));

  while (areaTrait != TRAIT_INVALID)
  {
    DeleteLocalInt(area, "AREA_TRAIT_" + IntToString(traitIndex));

    traitIndex++;
    
    areaTrait = GetLocalInt(area, "AREA_TRAIT_" + IntToString(traitIndex));
  }

  SetLocalInt(area, "AREA_SPAWN_READY", FALSE);
}



//Returns a level for the area, based on constraints
int DetermineAreaLevel(object area)
{
  int alwaysLevel = GetLocalInt(area,"AREA_CREATURE_LEVEL_ALWAYS");
  if (alwaysLevel >= 0)
    return alwaysLevel;

  int minCR = GetLocalInt(area, "MIN_LEVEL");
  if (minCR <= 0)
    minCR = 1;

  int maxCR = GetLocalInt(area, "MAX_LEVEL");
  if (maxCR <= 0)
    maxCR = 20;

  if (maxCR < minCR)
    maxCR = minCR;

  return minCR + Random(maxCR - minCR + 1);
}

//Returns a string with the creature type for the area
string DetermineAreaCreatureType(object area, int areaLevel)
{
  string creatureType = GetLocalString(area,"AREA_CREATURE_TYPE_ALWAYS");

  while (creatureType == CAMP_INVALID)
  {
    switch(Random(TOTAL_NUM_CAMPS))
    {
      case 0:
        creatureType = CreatureTypeMinMax(CAMP_KOBOLD, CAMP_KOBOLD_MIN_LEVEL, CAMP_KOBOLD_MAX_LEVEL, areaLevel);
      break;
      case 1:
        creatureType = CreatureTypeMinMax(CAMP_ORC, CAMP_ORC_MIN_LEVEL, CAMP_ORC_MAX_LEVEL, areaLevel);
      break;
      case 2:
        creatureType = CreatureTypeMinMax(CAMP_DROW, CAMP_DROW_MIN_LEVEL, CAMP_DROW_MAX_LEVEL, areaLevel);
      break;
      case 3:
        creatureType = CreatureTypeMinMax(CAMP_WOLF, CAMP_WOLF_MIN_LEVEL, CAMP_WOLF_MAX_LEVEL, areaLevel);
      break;
    }
  }

  return creatureType;
}

//Returns "" if camp does not meet Mix or Max requirements provided.  Otherwise returns the camp name
string CreatureTypeMinMax(string creatureType, int min, int max, int areaLevel)
{
  if ((areaLevel < min) || (areaLevel > max))
    return CAMP_INVALID;

  return creatureType;
}


//Returns a string with the tribe name for the creature type in the area
string DetermineCreatureTypeTribe(object area, string creatureType)
{
  string creatureTribe = GetLocalString(area,"AREA_CREATURE_TRIBE_ALWAYS");
  if (creatureTribe != "")
    return creatureTribe;

  return "Default";
}

//Returns a trait to apply to all creatures
int DetermineAreaTrait(object area, int traitIndex)
{
  int areaTrait = GetLocalInt(area,"AREA_TRAIT_" + IntToString(traitIndex) + "_ALWAYS");
  if (areaTrait != TRAIT_INVALID)
    return areaTrait;

  return Random(TOTAL_NUM_TRAITS) + 1;
}