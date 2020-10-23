void HenchPort(object oPC)
{
int iNum = GetLocalInt(oPC, "henchnum");
int iNum1 = 0;
string sID = "hench";
object oHench = GetLocalObject(oPC, sID + IntToString(iNum1));
location lLoc = GetLocation(oPC);

while(iNum1 <= iNum)
	{
		if(GetArea(oHench) != GetArea(oPC) && GetIsObjectValid(oHench))
			AssignCommand(oHench, ActionJumpToLocation(lLoc));
		iNum1++;
		oHench = GetLocalObject(oPC, sID + IntToString(iNum1));
	}
SendMessageToPC(oPC, "Your henchamn follow you through the transition.");
}

void main()
{
object oPC = GetItemActivator();
object oTar = GetItemActivatedTarget();
int iNum = GetLocalInt(oPC, "henchnum");
string sID = "hench";

if(GetIsPC(oTar) && oTar != oPC)
	SendMessageToPC(oPC, "You cannot use this item on other PCs. It is only meant to help you be able to port your NPC henchmen to yourself after area transitions.");
else if(!GetIsPC(oTar) && GetMaster(oTar) != oPC)
	SendMessageToPC(oPC, "You cannot use this item on this particular NPC, because they are not your henchman.");
else if(!GetIsPC(oTar) && GetMaster(oTar) == oPC)
	{
		SetLocalObject(oPC, sID + IntToString(iNum), oTar);
		SendMessageToPC(oPC, "This henchman has been added to your teleport tool for use after area transitions.");
		SetLocalInt(oPC, "hunchnum", iNum + 1);
	}
else if (oPC == oTar)
	HenchPort(oPC);
}