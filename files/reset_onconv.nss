void main()
{
 int nVote = GetListenPatternNumber();
 object oVoter;
 object oStone = GetObjectByTag("ResetStone");
 int nVoted;
 int nVotedYes = GetLocalInt(oStone,"VotedYes");
 int nVotedNo = GetLocalInt(oStone,"VotedNo");
 if(nVote == 1200)
 {
  oVoter = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,1);
  if(GetName(GetLastSpeaker()) == GetName(oVoter))
  {
   nVoted = GetLocalInt(oVoter,"Voted");
   if(nVoted != 1)
   {
    nVotedYes++;
    SetLocalInt(oVoter,"Voted",1);
    SetLocalInt(oStone,"VotedYes",nVotedYes);
    SpeakString(GetName(oVoter) + "'s vote has been registered.");
    DelayCommand(2.0f,DestroyObject(OBJECT_SELF));
   }
  }
 }
 else if(nVote == 1201)
 {
  oVoter = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,1);
  if(GetName(GetLastSpeaker()) == GetName(oVoter))
  {
   nVoted = GetLocalInt(oVoter,"Voted");
   if(nVoted != 1)
   {
    nVotedNo++;
    SetLocalInt(oVoter,"Voted",1);
    SetLocalInt(oStone,"VotedNo",nVotedNo);
    SpeakString(GetName(oVoter) + "'s vote has been registered.");
    DelayCommand(2.0f,DestroyObject(OBJECT_SELF));
   }
  }
 }
}

