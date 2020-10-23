// _inc_spawn.nss
// spawn related utilities.

#include "x0_i0_spawncond"
#include "_inc_nwnx"

// transfers variables expected on an NPC from oFrom to oTo - [FILE: _inc_util]
void SpawnTransferVariables(object oFrom, object oTo);
// sets up an NPC name on Spawn - [FILE: _inc_util]
void SpawnInitializeName(object npc=OBJECT_SELF);
// Returns the location state of the creature's stored in the database   [File: _inc_util]
int GetCreatureLocationState(string sNPCID,object oCreature=OBJECT_INVALID);
// Sets the location state of the creature's stored in the database   [File: _inc_util]
void SetCreatureLocationState(string sNPCID, int nState,object oCreature=OBJECT_INVALID);
// Returns the time stamp for when location state of the creature was last changed in the database   [File: _inc_util]
//string GetCreatureLocationStateTimeStamp(string sNPCID,object oCreature=OBJECT_INVALID);

void SpawnTransferVariables(object oFrom, object oTo)
{
  // LOOT vars
  int nLoot = GetLocalInt(oFrom, "LOOT");
  if(nLoot)
  {
    SetLocalInt(oTo,"LOOT", nLoot);
    int nPer    = GetLocalInt(oFrom,"LOOT_PERIOD");
    if(nPer){SetLocalInt(oTo,"LOOT_PERIOD", nPer);}
    string loottype = GetLocalString(oFrom,"LOOT_TYPE");
    if(loottype!=""){SetLocalString(oTo,"LOOT_TYPE", loottype);}
    int lootmin     = GetLocalInt(oFrom,"LOOT_VALUE_MIN");
    if(lootmin){SetLocalInt(oTo,"LOOT_VALUE_MIN", lootmin);}
    int lootmax     = GetLocalInt(oFrom,"LOOT_VALUE_MAX");
    if(lootmax){SetLocalInt(oTo,"LOOT_VALUE_MAX", lootmax);}
    int lootremain  = GetLocalInt(oFrom,"LOOT_REMAINDER");
    if(lootremain){SetLocalInt(oTo,"LOOT_REMAINDER", lootremain);}
  }

  int nType = GetObjectType(oTo);
  // begin placeables
  if(nType==OBJECT_TYPE_PLACEABLE)
  {
    {// placeable creatures (gargoyle type)
    string sSpawnRef= GetLocalString(oFrom, "PLCSPAWN");
    if(sSpawnRef!="")
        SetLocalString(oTo, "PLCSPAWN", sSpawnRef);
    SetLocalString(oTo, "PLCSPAWN_PLACE", GetResRef(oTo));
    string sSpawnVFX= GetLocalString(oFrom, "PLCSPAWN_VFX");
    if(sSpawnVFX!="")
        SetLocalString(oTo, "PLCSPAWN_VFX", sSpawnVFX);
    int nSpawnVFX   = GetLocalInt(oFrom, "PLCSPAWN_VFX");
    if(nSpawnVFX)
        SetLocalInt(oTo, "PLCSPAWN_VFX", nSpawnVFX);
    int nAOEVFX     = GetLocalInt(oFrom,"PLCSPAWN_VFXPER");
    if(nAOEVFX)
        SetLocalInt(oTo,"PLCSPAWN_VFXPER", nAOEVFX);
    int nSpawnApp   = GetLocalInt(oFrom, "PLCSPAWN_APPEAR");
    if(nSpawnApp)
        SetLocalInt(oTo, "PLCSPAWN_APPEAR", nSpawnApp);
    float fSpawnDist= GetLocalFloat(oFrom, "PLCSPAWN_DISTANCE");
    if(fSpawnDist!=0.0)
        SetLocalFloat(oTo, "PLCSPAWN_DISTANCE", fSpawnDist);
    float fSpawnDela= GetLocalFloat(oFrom, "PLCSPAWN_DELAY");
    if(fSpawnDela!=0.0)
        SetLocalFloat(oTo, "PLCSPAWN_DELAY", fSpawnDela);
    int nHealRate   = GetLocalInt(oFrom, "PLCSPAWN_SECONDS_PER_1HP_HEALED");
    if(nHealRate)
        SetLocalInt(oTo,"PLCSPAWN_SECONDS_PER_1HP_HEALED",nHealRate);
    }// end placeable creatures (gargoyle type)
  }
  // end placeables
  // begin creatures
  else if(nType==OBJECT_TYPE_CREATURE)
  {
    // unique
    if(GetLocalInt(oFrom,"UNIQUE"))
    {
        SetLocalInt(oTo,"UNIQUE",TRUE);
        // may need to do more here..........
    }
    // Assign Group Membership
    string sGroupName   = GetLocalString(oFrom, "GROUP_NAME");
    if(sGroupName!="")
        SetLocalString(oTo, "GROUP_NAME", sGroupName);

    // special cutscene/ghost flag
    if(GetLocalInt(oFrom, "SPAWN_EFFECT_GHOST"))
        SetLocalInt(oTo, "SPAWN_EFFECT_GHOST",1);

    // Assign AI
    if(GetLocalInt(oFrom, "AI_SENTRY"))
        SetLocalInt(oTo, "AI_SENTRY", 1);
    if(GetLocalInt(oFrom, "AI_PACK"))
        SetLocalInt(oTo, "AI_PACK", 1);
    if(GetLocalInt(oFrom, "AI_CIVILIZED"))
        SetLocalInt(oTo, "AI_CIVILIZED", 1);
    if(GetLocalInt(oFrom, "AI_TELEPATHIC"))
        SetLocalInt(oTo, "AI_TELEPATHIC", 1);
    string sFleeDest    = GetLocalString(oFrom,"AI_FLEE_DESTINATION");
    if(sFleeDest!="")
        SetLocalString(oTo, "AI_FLEE_DESTINATION", sFleeDest);
    if(GetLocalInt(oFrom, "AI_COWARD"))
        SetLocalInt(oTo, "AI_COWARD", 1);
    if(GetLocalInt(oFrom, "AI_SIZE_MODIFIER"))
        SetLocalInt(oTo, "AI_SIZE_MODIFIER", GetLocalInt(oFrom, "AI_SIZE_MODIFIER"));
    if(GetLocalInt(oFrom, "AI_NOT_WALKER"))
        SetLocalInt(oTo, "AI_NOT_WALKER", GetLocalInt(oFrom, "AI_NOT_WALKER"));

    // stealth options..............................
    if(GetLocalInt(oFrom, "X2_L_SPAWN_USE_STEALTH"))
        AssignCommand(oTo, SetSpawnInCondition(NW_FLAG_STEALTH));
    else if(GetLocalInt(oFrom, "AI_STEALTHY"))
        SetLocalInt(oTo, "AI_STEALTHY", 1);
    // special combat AI ...........................
    string sSpecialCombatAI   = GetLocalString(oFrom, "X2_SPECIAL_COMBAT_AI_SCRIPT");
    if(sSpecialCombatAI!="")
        SetLocalString(oTo, "X2_SPECIAL_COMBAT_AI_SCRIPT", sSpecialCombatAI);


    int nAppear = GetLocalInt(oFrom,"SET_APPEARANCE");
    if(nAppear>0)
        SetCreatureAppearanceType(oTo, nAppear);

    // equipment variables
    int nEquipType  = GetLocalInt(oFrom,"EQUIPMENT_TYPE");
    if(nEquipType)
        SetLocalInt(oTo, "EQUIPMENT_TYPE", nEquipType);
    int nWeaponCount    = GetLocalInt(oFrom,"EQUIPMENT_WEAPON_COUNT");
    if(nWeaponCount)
        SetLocalInt(oTo, "EQUIPMENT_WEAPON_COUNT", nWeaponCount);
    string sWeapon1     = GetLocalString(oFrom, "EQUIPMENT_WEAPON_1");
    if(sWeapon1!="")
        SetLocalString(oTo, "EQUIPMENT_WEAPON_1", sWeapon1);
    string sWeapon2     = GetLocalString(oFrom, "EQUIPMENT_WEAPON_2");
    if(sWeapon1!="")
        SetLocalString(oTo, "EQUIPMENT_WEAPON_2", sWeapon2);
    string sWeapon3     = GetLocalString(oFrom, "EQUIPMENT_WEAPON_3");
    if(sWeapon1!="")
        SetLocalString(oTo, "EQUIPMENT_WEAPON_3", sWeapon3);
    string sWeapon4     = GetLocalString(oFrom, "EQUIPMENT_WEAPON_4");
    if(sWeapon1!="")
        SetLocalString(oTo, "EQUIPMENT_WEAPON_4", sWeapon4);
    string sWeapon5     = GetLocalString(oFrom, "EQUIPMENT_WEAPON_5");
    if(sWeapon5!="")
        SetLocalString(oTo, "EQUIPMENT_WEAPON_5", sWeapon5);

    // DIALOG VARIABLES
    string sDlgVar = GetLocalString(oFrom, "DIALOG_SCRIPT");
    if(sDlgVar!="")
    {
      SetLocalString(oTo, "DIALOG_SCRIPT",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_GREETING");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_GREETING",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_INTRODUCTION");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_INTRODUCTION",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_FAREWELL");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_FAREWELL",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_WEAPON");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_WEAPON",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_CONTINUE");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_CONTINUE",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_BORED");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_BORED",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_REJECT");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_REJECT",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_BUSY");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_BUSY",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_INFO_NONE");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_INFO_NONE",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_INTIMIDATE_SUCCESS");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_INTIMIDATE_SUCCESS",sDlgVar);
      sDlgVar = GetLocalString(oFrom, "DIALOG_INTIMIDATE_FAILURE");
      if(sDlgVar!="")
        SetLocalString(oTo, "DIALOG_INTIMIDATE_FAILURE",sDlgVar);


      int nSmallTalk  = GetLocalInt(oFrom,"DIALOG_SMALLTALK_COUNT");
      if(nSmallTalk)
      {
        SetLocalInt(oTo,"DIALOG_SMALLTALK_COUNT",nSmallTalk);
        int nDC = GetLocalInt(oFrom,"DIALOG_SMALLTALK_DC");
        if(nDC)
            SetLocalInt(oTo,"DIALOG_SMALLTALK_DC",nDC);
        string sBored   = GetLocalString(oFrom, "DIALOG_SMALLTALK_BORED");
        if(sBored!="")
            SetLocalString(oTo, "DIALOG_SMALLTALK_BORED",sBored);

        int nIt = 1;
        string sBase    = "DIALOG_SMALLTALK_";
        string sTemp,sVal;
        while(nIt<=nSmallTalk)
        {
            sTemp   = sBase+IntToString(nIt);
            sVal    = GetLocalString(oFrom,sTemp);
            if(sVal!="")
            {
                SetLocalString(oTo,sTemp,sVal);
                SetLocalInt(oTo,sTemp+"_CODE",GetLocalInt(oFrom,sTemp+"_CODE"));
                SetLocalString(oTo,sTemp+"_CODEVAR",GetLocalString(oFrom,sTemp+"_CODEVAR"));
                SetLocalInt(oTo,sTemp+"_ONCE",GetLocalInt(oFrom,sTemp+"_ONCE"));
            }
            ++nIt;
        }
      }
    }
    // MERCHANT VARS
    if(GetLocalInt(oFrom,"MERCH"))
    {
        SetLocalInt(oTo,"MERCH",TRUE);

        if(GetLocalInt(oFrom,"MERCH_STORE1_NOHAGGLE"))
            SetLocalInt(oTo,"MERCH_STORE1_NOHAGGLE",TRUE);

        sDlgVar = GetLocalString(oFrom, "DIALOG_MERCH");
        if(sDlgVar!="")
            SetLocalString(oTo, "DIALOG_MERCH",sDlgVar);
        sDlgVar = GetLocalString(oFrom, "DIALOG_MERCH_DECLINED");
        if(sDlgVar!="")
            SetLocalString(oTo, "DIALOG_MERCH_DECLINED",sDlgVar);
        sDlgVar = GetLocalString(oFrom, "DIALOG_MERCH_SELL");
        if(sDlgVar!="")
            SetLocalString(oTo, "DIALOG_MERCH_SELL",sDlgVar);
        sDlgVar = GetLocalString(oFrom, "DIALOG_MERCH_BUY");
        if(sDlgVar!="")
            SetLocalString(oTo, "DIALOG_MERCH_BUY",sDlgVar);

        string sStore   = GetLocalString(oFrom,"MERCH_STORE1_ID");
        if(sStore!="")
            SetLocalString(oTo,"MERCH_STORE1_ID",sStore);
        else
        {
            string sVarRoot = "MERCH_STORE1_SELL";
            int nIt;
            while(nIt<=1)
            {
                if(nIt)
                    sVarRoot    = "MERCH_STORE1_BUY";

                int nCount      = 1;
                string sCount   = "1";
                string sGood    = GetLocalString(oFrom,sVarRoot+sCount);
                while(sGood!="")
                {
                    SetLocalString(oTo, sVarRoot+sCount, sGood);

                    SetLocalString(oTo, sVarRoot+sCount+"_NAME",
                                    GetLocalString(oFrom, sVarRoot+sCount+"_NAME")
                                  );
                    SetLocalString(oTo, sVarRoot+sCount+"_TAG",
                                    GetLocalString(oFrom, sVarRoot+sCount+"_TAG")
                                  );
                    SetLocalString(oTo, sVarRoot+sCount+"_DESCRIPTION",
                                    GetLocalString(oFrom, sVarRoot+sCount+"_DESCRIPTION")
                                  );
                    SetLocalInt(oTo, sVarRoot+sCount+"_PRICE",
                                    GetLocalInt(oFrom, sVarRoot+sCount+"_PRICE")
                                  );
                    sCount  = IntToString(++nCount);
                    sGood   = GetLocalString(oFrom,sVarRoot+sCount);
                }

                ++nIt;
            }
        }
    }
  } // end creatures
}

void SpawnInitializeName(object npc=OBJECT_SELF)
{
    string name = GetName(npc);

    // a random name or a particular name to set?
    string set_name = GetLocalString(npc,"SET_NAME");
    if(set_name!="")
    {
        if(set_name=="RANDOM")
        {
            ExecuteScript("x3_name_gen",OBJECT_SELF);
            string sName = GetLocalString(OBJECT_SELF,"X3_S_RANDOM_NAME");
            if ( sName == "" )
                sName = RandomName();

            SetName(npc,sName);
        }
        else
        {
            SetName(npc,set_name);
        }

    }
    // strip anything enclosed by parentheses from the name
    else
    {
        int posl    = FindSubString(name,"(");
        int posr    = FindSubString(name,")");
        string temp_name;
        string remainder = name;
        while(posl!=-1)
        {
            if(posr==-1)
            {
                temp_name += GetStringLeft(remainder, posl);
                remainder = "";
                break;
            }
            else if(posr>posl)
            {
                temp_name += GetStringLeft(remainder, posl);
                remainder  = GetStringRight(remainder, GetStringLength(remainder)-(posr+1));
            }
            else
            {
                remainder  = GetStringRight(remainder, GetStringLength(remainder)-(posr+1));
            }


            posl    = FindSubString(remainder,"(");
            posr    = FindSubString(remainder,")",posl);
        }

        if(temp_name!="")
        {
            temp_name += remainder;
            // set the new name
            SetName(npc, temp_name);
        }
    }
}

string GetCharacterIdFromNPC(string sNPCID, object oCreature=OBJECT_INVALID) {
	if(StringToInt(sNPCID))
		return sNPCID;
        // kludgey backup if the NPC is already spawned
        else if(GetIsObjectValid(oCreature))
		return  GetPCID(oCreature);

        // last resort solution.. delete this once we change all code to use character_id for NPCs
	return NWNX_ConvertNPCIDtoCharacterID(sNPCID);
}


int GetCreatureLocationState(string sNPCID, object oCreature=OBJECT_INVALID) {
        string character_id = GetCharacterIdFromNPC(sNPCID, oCreature);
	return GetPersistentInt(GetModule(), "LOCATION_STATE_" + character_id);
        //return StringToInt(NWNX_RetrieveCampaignValue("LOCATION_STATE", NWNX_GetCampaignID(), character_id));
}

void SetCreatureLocationState(string sNPCID, int nState, object oCreature=OBJECT_INVALID) {
	string character_id = GetCharacterIdFromNPC(sNPCID, oCreature);
        //string campaign_id  = NWNX_GetCampaignID();
	SetPersistentInt(GetModule(), "LOCATION_STATE_" + character_id, nState);
	//NWNX_StoreCampaignValue("LOCATION_STATE", IntToString(nState), campaign_id, character_id);

/*  Non-nwnxmode has to set a timestamp too. This is unused. 
    {
        NBDE_SetCampaignInt(CAMPAIGN_NAME,"LOCATION_STATE_"+sNPCID, nState);

        struct DATETIME time;
        time.year   = GetCalendarYear();
        time.month  = GetCalendarMonth();
        time.day    = GetCalendarDay();
        time.hour   = GetTimeHour();
        time.minute = GetTimeMinute();
        time.second = GetTimeSecond();
        string game_time   = ConvertDateTimeToTimeStamp(time);

        NBDE_SetCampaignString(CAMPAIGN_NAME,"LOCATION_STATE_TIMESTAMP_"+sNPCID, game_time);
    }
*/
}

/* UNUSED
string GetCreatureLocationStateTimeStamp(string sNPCID, object oCreature=OBJECT_INVALID)
{
    //if(MODULE_NWNX_MODE)
    {
        object oMod = GetModule();
        string character_id = GetCharacterIdFromNPC(sNPCID, oCreature);
        string sQuery   = "SELECT time_real FROM campaign_data "
                    + "WHERE character_id="+character_id+" AND campaign_id="+NWNX_GetCampaignID()+" AND label='LOCATION_STATE';";
       // NWNX_SqlExecDirect(sQuery);
        if(NWNX_SqlFetch())
            return GetLocalString(oMod, "NWNX_ODBC2_FetchRow");
        else
            return "";
    }
    else
        return NBDE_GetCampaignString(CAMPAIGN_NAME,"LOCATION_STATE_TIMESTAMP_"+sNPCID);
}
*/
