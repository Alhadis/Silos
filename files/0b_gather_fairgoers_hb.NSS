//::///////////////////////////////////////////////////////////////////////////
//::
//::	0b_gather_fairgoers_hb
//::
//::	C'mon everyone! Let's go to the fair!!
//::
//::///////////////////////////////////////////////////////////////////////////
//  DBR 1/5/6

const float fGatherDistance = 12.5f; //tunable value for Georg's gathering abilities	
	
	
	
void main()
{
	object oFriend;
	int i=1, nSpoken=0;
	oFriend=GetNearestCreature(CREATURE_TYPE_IS_ALIVE,TRUE,OBJECT_SELF,i);
	while (GetIsObjectValid(oFriend))
	{
		SetLocalInt(oFriend,"NW_GENERIC_MASTER",0); //remove ambience
	
		if (GetDistanceBetween(OBJECT_SELF,oFriend)<fGatherDistance)
		{
			//gather
			if (GetLocalInt(oFriend,"nCan_Go_To_Fair")==1)  //make sure it's ok (Galen shouldn't until X, etc.)
			{
				if (!nSpoken)
				{
					nSpoken=1;
					SpeakOneLinerConversation("0_georg_gathering");
				}
				ExecuteScript("0a_go_to_fair",oFriend);
			}
			//get next
			oFriend=GetNearestCreature(CREATURE_TYPE_IS_ALIVE,TRUE,OBJECT_SELF,++i);
		}
		else
			oFriend=OBJECT_INVALID;
	}
}