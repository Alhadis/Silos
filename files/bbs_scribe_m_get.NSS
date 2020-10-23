void main()
{
  int nCount = GetLocalInt(OBJECT_SELF, "nCount");
  string sTalk = GetLocalString(OBJECT_SELF, "Stack");
  if (sTalk != "") {
     
  if(nCount == 0)
	{SetLocalString(OBJECT_SELF, "#M", sTalk);}
	
	else if(nCount == 1)
		{SetLocalString(OBJECT_SELF, "#M2", sTalk);}
	
	else if(nCount == 2)
		{SetLocalString(OBJECT_SELF, "#M3", sTalk);}
	
	else if(nCount == 3)
		{SetLocalString(OBJECT_SELF, "#M4", sTalk);}
	
	
    SetLocalString(OBJECT_SELF, "Stack", "");
	nCount = nCount +1;
	SetLocalInt(OBJECT_SELF, "nCount", nCount);
	}
}