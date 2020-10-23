void SD_NAMECHEST(object oChest, string sChestRange)
{
 SetName(oChest, sChestRange);
}

void main()
{

object oMod = GetModule();
object oPC = GetFirstPC();
object oEnter = GetEnteringObject();

if (oEnter!=oPC)return;

int iLevel = 1;

SetLocalInt(oMod, "range", 1);

string sLevel = IntToString(iLevel);

int iWC = iLevel+0;
int iSC = iLevel+5;
int iAC = iLevel+10;
int iMC = iLevel+15;
int iGC = iLevel+20;
int iGM = iLevel+25;


string sWLev = IntToString(iWC);
string sSLev = IntToString(iSC);
string sALev = IntToString(iAC);
string sMLev = IntToString(iMC);
string sGLev = IntToString(iGC);
string sGMLev = IntToString(iGM);


object oWP1 = GetWaypointByTag("sd_weap");
object oWP2 = GetWaypointByTag("sd_shield");
object oWP3 = GetWaypointByTag("sd_arm");
object oWP4 = GetWaypointByTag("sd_magi");
object oWP5 = GetWaypointByTag("sd_gloves");
object oWP6 = GetWaypointByTag("sd_gems");

object oCH1 = CreateObject(OBJECT_TYPE_PLACEABLE, "sd_lootchest", GetLocation(oWP1), FALSE, sWLev);
DelayCommand(0.2, SD_NAMECHEST(oCH1, "Weapon Chest: Range "+sLevel));
object oCH2 = CreateObject(OBJECT_TYPE_PLACEABLE, "sd_lootchest", GetLocation(oWP2), FALSE, sSLev);
DelayCommand(0.2, SD_NAMECHEST(oCH2, "Shield Chest: Range "+sLevel));
object oCH3 = CreateObject(OBJECT_TYPE_PLACEABLE, "sd_lootchest", GetLocation(oWP3), FALSE, sALev);
DelayCommand(0.2, SD_NAMECHEST(oCH3, "Armor Chest: Range "+sLevel));
object oCH4 = CreateObject(OBJECT_TYPE_PLACEABLE, "sd_lootchest", GetLocation(oWP4), FALSE, sMLev);
DelayCommand(0.2, SD_NAMECHEST(oCH4, "Mag Item Chest: Range "+sLevel));
object oCH5 = CreateObject(OBJECT_TYPE_PLACEABLE, "sd_lootchest", GetLocation(oWP5), FALSE, sGLev);
DelayCommand(0.2, SD_NAMECHEST(oCH5, "Monk Gloves Chest: Range "+sLevel));
object oCH6 = CreateObject(OBJECT_TYPE_PLACEABLE, "sd_lootchest", GetLocation(oWP6), FALSE, sGMLev);
DelayCommand(0.2, SD_NAMECHEST(oCH6, "Gem Chest: Range "+sLevel));
}
