void PCAct(object oPC, object oTar, object oIt, string sNum)
{
int iNum = 1;
int iNum1 = StringToInt(sNum);
string sNum1 = IntToString(iNum);
object oNPC;
string sName = GetName(oTar);


if(!GetIsObjectValid(oTar))
	{
		AssignCommand(oPC, ActionSpeakString("*Points* All of you, move there!"));
		oNPC = GetLocalObject(oIt, "npc" + sNum1);
		while(iNum <= iNum1)
			{
				AssignCommand(oNPC, ActionForceMoveToObject(oTar, TRUE));
				iNum++;
				sNum1 = IntToString(iNum);
				oNPC = GetLocalObject(oIt, "npc" + sNum1);
			}
	}
	
else if(GetIsReactionTypeHostile(oTar, oPC))
	{
		AssignCommand(oPC, ActionSpeakString("Attack " + sName + "!"));
		oNPC = GetLocalObject(oIt, "npc" + sNum1);
		while(iNum <= iNum1)
			{
				AssignCommand(oNPC, ActionAttack(oTar));
				iNum++;
				sNum1 = IntToString(iNum);
				oNPC = GetLocalObject(oIt, "npc" + sNum1);
			}
	}

else if(GetIsNeutral(oTar, oPC) || GetIsReactionTypeFriendly(oTar, oPC) || oTar == oPC)
	{
		if(sName == GetName(oPC))
			sName == "me";
		AssignCommand(oPC, ActionSpeakString("All of you, to " + sName + "!"));
		oNPC = GetLocalObject(oIt, "npc" + sNum1);
		while(iNum <= iNum1)
			{
				AssignCommand(oNPC, ActionForceMoveToObject(oTar, TRUE));
				iNum++;
				sNum1 = IntToString(iNum);
				oNPC = GetLocalObject(oIt, "npc" + sNum1);
			}
	}
}

void DMAct(object oTar, object oIt, string sNum)
{
SetLocalObject(oIt, "npc" + sNum, oTar);
}

void main()
{
object oIt = GetItemActivated();
object oPC = GetItemActivator();
object oTar = GetItemActivatedTarget();
location lTar;
int iNum1 = GetLocalInt(oIt, "number");
int iNum2 = iNum1++;
int iNum3 = 0;
string sNum1 = IntToString(iNum1);
string sNum2 = IntToString(iNum2);

if(GetIsObjectValid(oTar))
	lTar = GetLocation(oTar);
else
	lTar = GetItemActivatedTargetLocation();
	
if(GetIsDM(oPC))
	{
		DMAct(oTar, oIt, sNum2);
		SetLocalInt(oIt, "number", iNum2);
	}
if(!GetIsDM(oPC))
	{
		PCAct(oPC, oTar, oIt, sNum1);
	}
}