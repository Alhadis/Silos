void main()
{
  object Notice;

  if(GetTag(OBJECT_SELF) == "003_cr_slv_300_quill")
  	{Notice = CreateItemOnObject("slv_paper", GetPCSpeaker(), 1, "slv_test");
	 int nTestCount = GetCampaignInt("SLV_UNI", "TestCount", GetModule());
	 if (Notice != OBJECT_INVALID) 
		{nTestCount = nTestCount +1;
		 SetCampaignInt("SLV_UNI", "TestCount", nTestCount, GetModule());
		 SetFirstName(Notice, GetLocalString(OBJECT_SELF, "#T") + " - " + GetName(GetPCSpeaker()));
		 SetLastName(Notice, IntToString(nTestCount)); 
		 SetLocalString(GetModule(), GetLastName(Notice), GetLocalString(OBJECT_SELF, "#T") + " - " + GetLocalString(OBJECT_SELF, "#M"));
	     SetLocalString(Notice, "#T", GetLocalString(OBJECT_SELF, "#T"));
	     SetLocalString(Notice, "#M", GetLocalString(OBJECT_SELF, "#M"));
	     SetLocalString(Notice, "#N", GetName(GetPCSpeaker()));
	     DestroyObject(OBJECT_SELF);	
		}
	 }
	
 else if(GetTag(OBJECT_SELF) == "003_cr_slv_bookorder_quill")
   	{int nBOCount = GetCampaignInt("SLV_UNI", "BOCount", GetModule());
	    Notice = CreateItemOnObject("slv_paper3", GetPCSpeaker(), 1);
	 	if (Notice != OBJECT_INVALID) 
		{nBOCount = nBOCount +1;
		 SetCampaignInt("SLV_UNI", "BOCount", nBOCount, GetModule());
		 SetFirstName(Notice, "Book Order " + IntToString(nBOCount) + ": "); 
		 SetLastName(Notice, GetCampaignString("SLV_UNI", "#T", Notice));
		 SetCampaignString("SLV_UNI", GetFirstName(Notice), GetLocalString(OBJECT_SELF, "#T") + " - " + GetLocalString(OBJECT_SELF, "#M"), GetModule());
	     DestroyObject(OBJECT_SELF);	
		}
    }
	
  else if(GetTag(OBJECT_SELF) == "003_cr_slv_scribing_quill")
  	
   	{int nNoteCount = GetCampaignInt("SLV_UNI", "NoteCount", GetModule());
		Notice = CreateItemOnObject("slv_paper2", GetPCSpeaker(), 1, "003_it_note");
	 	if (Notice != OBJECT_INVALID) 
		{nNoteCount = nNoteCount +1;
		 SetCampaignInt("SLV_UNI", "NoteCount", nNoteCount, GetModule());
		 SetFirstName(Notice, "Written Note"); 
		 SetLastName(Notice, IntToString(nNoteCount));
		 SetCampaignString("SLV_UNI", GetLastName(Notice), GetLocalString(OBJECT_SELF, "#M"), GetModule());
	     SetCampaignString("SLV_UNI", GetLastName(Notice) + "2", GetLocalString(OBJECT_SELF, "#M2"), GetModule());
	     SetCampaignString("SLV_UNI", GetLastName(Notice) + "3", GetLocalString(OBJECT_SELF, "#M3"), GetModule());
	     SetCampaignString("SLV_UNI", GetLastName(Notice) + "4", GetLocalString(OBJECT_SELF, "#M4"), GetModule());
	     DestroyObject(OBJECT_SELF);	
		}
   }
	
   else 
  {Notice = CreateItemOnObject("bbs_notice", GetPCSpeaker());
  if (Notice != OBJECT_INVALID) 
	  {SetLocalString(Notice, "#T", GetLocalString(OBJECT_SELF, "#T"));
	    SetLocalString(Notice, "#M", GetLocalString(OBJECT_SELF, "#M"));
	    SetLocalString(Notice, "#DM", GetLocalString(OBJECT_SELF, "#DM"));
	    }
	}
	
 }