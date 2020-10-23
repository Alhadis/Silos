void main()
{
  string sTalk = GetLocalString(OBJECT_SELF, "Stack");
  if (sTalk != "") {
    if (GetStringLength(sTalk) > 30) {sTalk = GetStringLeft(sTalk, 30);}
    SetLocalString(OBJECT_SELF, "#DM", sTalk);
    SetLocalString(OBJECT_SELF, "Stack", "");
	SpeakString("#DM + " + GetLocalString(OBJECT_SELF, "#DM"), TALKVOLUME_TALK);
  }
}