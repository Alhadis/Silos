void Store(string sTag, string sNum, object oIt)
{
StoreCampaignObject(sTag, sNum, oIt);
}

void main()
{
object oMe = OBJECT_SELF;
string sTag = GetTag(oMe);
int iLock = GetLocalInt(oMe, "lock");
object oIt = GetFirstItemInInventory(oMe);
int iNum = 0;
string sNum;

if(iLock == 1)
	DelayCommand(3.0, SetLocked(oMe, 1));

while(GetIsObjectValid(oIt))
	{
		iNum++;
		sNum = IntToString(iNum);
		DelayCommand(6.0, Store(sTag, sNum, oIt));
		DelayCommand(6.0, DestroyObject(oIt));
		oIt = GetNextItemInInventory(oMe);
	}
SetCampaignInt("corintrack" + sTag, "number", iNum);
}