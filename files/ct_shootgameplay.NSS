void totaledup(object oMal, object oPC)
{
int iNum = GetLocalInt(oPC, "shootgamehits");
string sTot = IntToString(iNum);

if(iNum == 0)
	AssignCommand(oMal, ActionSpeakString("You didn't actually hit any of the targets. Better luck next time."));
if(iNum >= 1)
	AssignCommand(oMal, ActionSpeakString("Well, you hit " + sTot + " targets. Here's your prize."));
	
if (iNum == 0) {}
else if(iNum == 1)
	CreateItemOnObject("ct_carnivalart", oPC);
else if(iNum == 2)
	CreateItemOnObject("ct_fgactionfig", oPC);
else if(iNum == 3)
	CreateItemOnObject("ct_mysteryrock", oPC);
}

void missedorno(object oMal, object oPC)
{
int iNum = GetLocalInt(oPC, "shootgamehits");
string sTag = "ct_dragonstatuette_";

object oTarget = GetNearestObjectByTag(sTag + IntToString(iNum));
if(GetLocalInt(oMal, "hit") == 0)
	AssignCommand(oMal, ActionSpeakString("Oh, too bad! You missed."));
else
	SetLocalInt(oMal, "hit", 0);
SetLocalObject(oPC, "shootgametarget", oTarget);
}

void main()
{
object oPC = GetPCSpeaker();
int iNum; 
string sTag = "ct_dragonstatuette";
location lLoc1 = GetLocation(GetWaypointByTag("ct_circusshoottarget"));
location lLoc2 = GetLocation(GetWaypointByTag("ct_circusshoottarget2"));
location lLoc3 = GetLocation(GetWaypointByTag("ct_circusshoottarget3"));
object oMal = GetObjectByTag("ct_malazar");

SetLocalInt(oPC, "shootgamehits", 0);

object oTarget1 = CreateObject(OBJECT_TYPE_CREATURE, "ct_shootgametarget", lLoc1, FALSE, sTag + "_0");
object oTarget2 = CreateObject(OBJECT_TYPE_CREATURE, "ct_shootgametarget", lLoc2, FALSE, sTag + "_1");
object oTarget3 = CreateObject(OBJECT_TYPE_CREATURE, "ct_shootgametarget", lLoc3, FALSE, sTag + "_2");


object oTarget = oTarget1;

object oBow = CreateItemOnObject("nw_wbwxl001", oPC);
object oBolts = CreateItemOnObject("nw_wambo001", oPC, 3);

AssignCommand(oPC, ActionEquipItem(oBow, INVENTORY_SLOT_RIGHTHAND));
AssignCommand(oPC, ActionEquipItem(oBolts, INVENTORY_SLOT_BOLTS));
SetLocalObject(oPC, "shootgametarget", oTarget);

DelayCommand(0.5, AssignCommand(oPC, ActionAttack(GetLocalObject(oPC, "shootgametarget"))));
DelayCommand(1.5, AssignCommand(oPC, ClearAllActions()));
DelayCommand(1.6, SetCommandable(0, oPC));
DelayCommand(2.0, missedorno(oMal, oPC));
DelayCommand(6.4, SetCommandable(1, oPC));
DelayCommand(6.5, AssignCommand(oPC, ActionAttack(GetLocalObject(oPC, "shootgametarget"))));
DelayCommand(7.5, AssignCommand(oPC, ClearAllActions()));
DelayCommand(7.6, SetCommandable(0, oPC));
DelayCommand(8.0, missedorno(oMal, oPC));
DelayCommand(12.4, SetCommandable(1, oPC));
DelayCommand(12.5, AssignCommand(oPC, ActionAttack(GetLocalObject(oPC, "shootgametarget"))));
DelayCommand(13.5, AssignCommand(oPC, ClearAllActions()));
DelayCommand(14.0, missedorno(oMal, oPC));

DelayCommand(14.5, totaledup(oMal, oPC));
DelayCommand(14.5, DestroyObject(oBow));
DelayCommand(14.5, DestroyObject(oBolts));
DelayCommand(14.5, DestroyObject(oTarget1));
DelayCommand(14.5, DestroyObject(oTarget2));
DelayCommand(14.5, DestroyObject(oTarget3));


}