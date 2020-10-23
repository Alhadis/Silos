#include "dcs_inc_data"

const string DSPT_SPAWNS_STORED     = "dsptSpawnerStored";
const string DSPT_SPAWN_CATEGORY    = "dsptCateg_";
const string DSPT_SPAWN_CATEGORYNUM = "dsptCategNum_";
const string DSPT_SPAWN_CATEGORIES  = "dsptCategories";
const string DSPT_SPAWN_OBJECT      = "dsptOBJ_";
const string DSPT_SPAWN_NAME        = "dsptNAME_";
const string DSPT_SPAWN_LOCATION    = "dspt_location";

string GetSpawnerCategory(string sName)
{
    int iBegin = FindSubString(sName, "(") + 1;
    int iFin = FindSubString(sName, ")");
    int iFin2 = FindSubString(sName, " ", iBegin);

    if(iFin2 < iFin)
    iFin = iFin2;

    return GetSubString(sName, iBegin, iFin - iBegin);
}


void DSPT_StoreSpawnCategory(object oSpawnWP)
{
    string sCategory = GetSpawnerCategory(GetName(oSpawnWP));

    if(GetLocalInt(GetModule(), DSPT_SPAWN_CATEGORY+sCategory) == 0)
    {
        SetLocalInt(GetModule(), DSPT_SPAWN_CATEGORIES, GetLocalInt(GetModule(), DSPT_SPAWN_CATEGORIES)+1);
        SetLocalInt(GetModule(), DSPT_SPAWN_CATEGORY+sCategory, GetLocalInt(GetModule(), DSPT_SPAWN_CATEGORIES));
        SetLocalString(GetModule(), DSPT_SPAWN_CATEGORYNUM+IntToString(GetLocalInt(GetModule(), DSPT_SPAWN_CATEGORIES)), sCategory);
    }
}

void DSPT_StoreSpawnObject(object oSpawnWP)
{
    string sName = GetName(oSpawnWP);
    string sResRef = GetResRef(oSpawnWP);

    string sCategory = GetSpawnerCategory(GetName(oSpawnWP));
    string sSpawnName = GetSubString(sName, FindSubString(sName, "- ")+2, GetStringLength(sName) - (FindSubString(sName, "- ")+2));
    string sSpawnNum  = GetStringRight(sResRef, 3);
    int iSpawnNum = StringToInt(GetSubString(sSpawnNum, FindSubString(sSpawnNum, "0")+1, GetStringLength(sSpawnNum) - (FindSubString(sSpawnNum, "0")+1)));

    SetLocalObject(GetModule(), DSPT_SPAWN_OBJECT+sCategory+IntToString(iSpawnNum), oSpawnWP);
    SetLocalString(GetModule(), DSPT_SPAWN_NAME+sCategory+IntToString(iSpawnNum), sSpawnName);
}

void DSPT_StoreSpawner(object oSpawnWP)
{
    string sName = GetName(oSpawnWP);
    string sResRef = GetResRef(oSpawnWP);

    //Name = Ressourcen (Kategorie [#]) ## - Name
    //RR = dcs_spawn_xx0##

    string sCategory = GetSpawnerCategory(GetName(oSpawnWP));
    string sSpawnName = GetSubString(sName, FindSubString(sName, "- ")+2, GetStringLength(sName) - (FindSubString(sName, "- ")+2));
    string sSpawnNum  = GetStringRight(sResRef, 3);
    int iSpawnNum = StringToInt(GetSubString(sSpawnNum, FindSubString(sSpawnNum, "0"), GetStringLength(sSpawnNum) - (FindSubString(sSpawnNum, "0"))));

    //AdvDebug(GetPCSpeaker(), sName+", "+sResRef+": Kat: "+sCategory+", Spawn: "+sSpawnName+", SpawnNum: "+sSpawnNum+",  Num: "+IntToString(iSpawnNum));

    DSPT_StoreSpawnCategory(oSpawnWP);
    DSPT_StoreSpawnObject(oSpawnWP);
}
