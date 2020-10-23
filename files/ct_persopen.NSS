void main()
{
object oMe = OBJECT_SELF;
string sTag = GetTag(oMe);
int iLock = GetLocalInt(oMe, "lock");
object oIt = oMe;
int iNum = 0;
int iMax = GetCampaignInt("corintrack" + sTag, "number");
string sNum;

while(iNum <= iMax)
	{
		iNum++;
		sNum = IntToString(iNum);
		RetrieveCampaignObject(sTag, sNum, GetLocation(oMe), oIt, oMe);
	}
DelayCommand(6.0, DestroyCampaignDatabase("corintrack"));
DelayCommand(6.0, DestroyCampaignDatabase(sTag));
}