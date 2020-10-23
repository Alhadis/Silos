void main()
{
  object riddledoor = GetObjectByTag("puertasur");
  object oPC = GetEnteringObject();
  if (!GetIsOpen(riddledoor) && GetCampaignInt("PVP", "Assasin", oPC) == 0)
  {
     location loc = GetLocation(OBJECT_SELF);
     vector temp = GetPositionFromLocation(loc);
     vector zIndexCorrection = Vector(temp.x,temp.y,GetPositionFromLocation(GetLocation(riddledoor)).z);
     location correctedloc = Location(GetAreaFromLocation(loc),zIndexCorrection,90.0);

     object listener = CreateObject(OBJECT_TYPE_PLACEABLE,"listener",correctedloc); // remember, blueprint not tag.

     SetListenPattern(listener,"ABRAN LA PUERTA",1000); // whatever you want for a password,
     SetListening(listener,TRUE);
     int seconds;
     for (seconds = 1; seconds < 7; seconds++)
        DelayCommand(IntToFloat(seconds),SignalEvent(listener,EventUserDefined(1300)));
  }
}
