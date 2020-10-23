void main()
{
 int nEvent = GetUserDefinedEventNumber();
 int nAyes;
 int nNays;
 string sYesVote = "The vote has been tallied and the majority voted YES. The server will be reset in 30 seconds, so if you wish to preserve your character please log off now.";
 string sNoVote = "The vote has been tallied and the majority voted NO. The server will not be reset.";
 object oVoter = GetFirstPC();
 if(nEvent == 1500)
 {
  nAyes = GetLocalInt(OBJECT_SELF,"VotedYes");
  nNays = GetLocalInt(OBJECT_SELF,"VotedNo");
  if(nAyes > nNays)
  {
   while(GetIsObjectValid(oVoter))
   {
    SendMessageToPC(oVoter,sYesVote);
    oVoter = GetNextPC();
   }
   DelayCommand(30.0f,StartNewModule("The Land of Thuul"));
  }
  else
  {
   while(GetIsObjectValid(oVoter))
   {
    SendMessageToPC(oVoter,sNoVote);
    DeleteLocalInt(oVoter,"Voted");
    oVoter = GetNextPC();
   }
   int nNth = 1;
   object oVotingBooth = GetObjectByTag("votingbooth",nNth);
   while(GetIsObjectValid(oVotingBooth))
   {
    DestroyObject(oVotingBooth);
    nNth++;
    oVotingBooth = GetObjectByTag("votingbooth",nNth);
   }
   SetLocalInt(OBJECT_SELF,"VotedYes",0);
   SetLocalInt(OBJECT_SELF,"VotedNo",0);
  }
 }
}
