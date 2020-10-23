void main()
{
object oPC = GetPCSpeaker();
object oMe = OBJECT_SELF;
int iNum1 = GetLocalInt(oMe, "number1");
int iNum2 = GetLocalInt(oMe, "number2");
int iNum3 = GetLocalInt(oMe, "number3");
int iChk1 = GetLocalInt(oMe, "correct1");
int iChk2 = GetLocalInt(oMe, "correct2");
int iChk3 = GetLocalInt(oMe, "correct3");
int iRef = GetReflexSavingThrow(oPC);
int iRan = d20();

if(iNum1 == iChk1 && iNum2 == iChk2 && iNum3 == iChk3)
	{
		SendMessageToPC(oPC, "You hear a slight click as the chest unlocks.");
		SetLocked(oMe, 0);
	}
else
	{
		if(iRan + iRef >= 20)
				SendMessageToPC(oPC, "You hear a click and narrowly avoid being pricked by a small needle that retracts almost instantly into the center of the combination dial.");
		else
			{
				SendMessageToPC(oPC, "You hear a small click noise, and feel a small needle prick you in the hand as the dial stops on the last number.");
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectPoison(POISON_GREENBLOOD_OIL), oPC);
			}
	}
}