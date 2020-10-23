#include "silvy_univ_inc" 
#include "acr_spawn_i"
#include "acr_db_persist_i"
#include "acr_xp_i"
#include "acr_quest_i"

void main()
{   object oPC = GetLastSpeaker();
    object oStudent = GetLocalObject(OBJECT_SELF, "oStudent");
   if(GetTag(OBJECT_SELF) == "003_cr_slv_deanvoice_phoenix")
	   {int nMatch = GetListenPatternNumber();
	    object oVoice = OBJECT_SELF;
	    object oPhoenix = GetLocalObject(OBJECT_SELF, "oPhoenix");
	    object oCabinet = GetLocalObject(OBJECT_SELF, "oCabinet");
	    object oCabinetStatic = GetLocalObject(OBJECT_SELF, "oCabinetStatic");
		location lCabinet = GetLocation(GetWaypointByTag("vala_location_wp"));
		object oCollBox = GetLocalObject(OBJECT_SELF, "oCollBox");
		string sCampaignNamedPhoenix = GetLocalString(oStudent, "sCampaignNamedPhoenix");;
		if(sCampaignNamedPhoenix == "")
			{sCampaignNamedPhoenix = GetCampaignString("SLV_UNI", "DeanPhoenixNamed" + GetName(oStudent), oStudent);
			 SetLocalString(oStudent, "sCampaignNamedPhoenix", sCampaignNamedPhoenix);
			 }
	   	string s26QuestsPhoenix = GetLocalString(oStudent, "26QuestsPhoenix");
		if(s26QuestsPhoenix == "")
			{s26QuestsPhoenix = GetCampaignString("SLV_UNI", "s26QuestsPhoenix", oStudent);
			 SetLocalString(oStudent, "s26QuestsPhoenix", s26QuestsPhoenix);
			 }
	    effect eGlimmer = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
	    string sFullName = GetName(oStudent);
	    string sFirstName;
	    string sLastName;
	    string sMiddleName;
	    string sMiddleName2;
	    int nSpace = FindSubString(sFullName, " ");
	    if (nSpace > -1)
	            {
            sFirstName = GetStringLeft(sFullName, nSpace);
            sLastName = GetStringRight(sFullName, GetStringLength(sFullName) - nSpace);
            if(GetStringLeft(sLastName, 1) == " ")
                {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                }
                {}
                int nSpace2 = FindSubString(sLastName, " ");
                if(nSpace2 > -1)
                        {sMiddleName = GetStringLeft(sLastName, nSpace2);
                         sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - nSpace2);
                         if(GetStringLeft(sLastName, 1) == " ")
                            {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                            }
                            {}
                            int nSpace3 = FindSubString(sLastName, " ");
                            if(nSpace3 > -1)
                                {sMiddleName2 = GetStringLeft(sLastName, nSpace3);
                                 sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - nSpace3);
                                if(GetStringRight(sMiddleName2, 1) == ",")
                                   {sMiddleName2 = GetStringLeft(sMiddleName2, GetStringLength(sMiddleName2) - 1);
                                   }
                                   {}
                                if(GetStringLeft(sLastName, 1) == " ")
                                   {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                                    }
                                    {}
                                }
                                {}
                          }
                         {}
             }
            else
            {sFirstName = GetName(oStudent);
             sLastName = GetName(oStudent);
             sFullName = GetName(oStudent);
             sMiddleName = GetName(oStudent);
             sMiddleName2 = GetName(oStudent);
             }
	
	if((nMatch >= 5061) && (nMatch <= 5063) && (ACR_RetrieveQuestState("slv_deandragon_e_air", oPC) == 2))
		{if(GetLocalObject(oPC, "oMyListener") == OBJECT_SELF)
			{object oCollWP = GetLocalObject(OBJECT_SELF, "oCollWP");
			 if(oCollWP == OBJECT_INVALID)
			 	{oCollWP = GetWaypointByTag("slv_deandragon_e_air_collboxWP");
				 SetLocalObject(OBJECT_SELF, "oCollWP", oCollWP);
				}
			 object oMyCollisionBox = GetLocalObject(oCollWP, "oMyCollisionBox");
			 if(oMyCollisionBox == OBJECT_INVALID)
			 	{oMyCollisionBox = GetObjectByTag("slv_deandragon_e_air_collbox");
				 SetLocalObject(oCollWP, "oMyCollisionBox", oMyCollisionBox);
				}
			 object oEndWP = GetLocalObject(OBJECT_SELF, "oEndWP");
			 if(oEndWP == OBJECT_INVALID)
			 	{oEndWP = GetWaypointByTag("slv_deandragon_e_flight_WP");
				 SetLocalObject(OBJECT_SELF, "oEndWP", oEndWP);
				}
			 string sDeity = GetStringUpperCase(GetDeity(oPC)) + ".";
			 string sFollowUp = GetStringUpperCase(GetDeity(oPC)) + " WOULD REWARD YOUR FAITHFULNESS. A MAGE SHOULD BE AWARE OF DIVINE MAGIC, EITHER AS FRIEND OR FOE.";
			 if(nMatch == 5062)
			 	{sDeity = "THE QUEEN OF THE COLD.";
				 sFollowUp = "SHE WOULD REMEMBER YOUR SERVITUDE....AS SHOULD YOU.";
				 }
			 if(nMatch == 5063)
			 	{sDeity = "THE GODDESS OF MAGIC.";
				 sFollowUp = "MYSTRA'S POWER OVER MAGIC IS ABSOLUTE, AND HER MERCY VAST.";
				 }
			 SpeakString("*A powerful voice speaks in your mind, inaudible, although you have no doubt that any nearby can also 'hear' it. It does not shake you as a god's voice would. It does not feel deific, but merely powerful.*");
			 DelayCommand(5.0, SpeakString("YOU HAVE SHOWN WISDOM IN CALLING ON " + sDeity));
			 DestroyObject(oMyCollisionBox);
			 SetLocalObject(oCollWP, "oMyCollisionBox", OBJECT_INVALID);
			 DelayCommand(6.0, AssignCommand(oPC, ActionForceMoveToObject(oCollWP, TRUE, 0.0)));
			 DelayCommand(7.0, ActionJumpToObject(oEndWP, FALSE));
			 DelayCommand(10.0, SendMessageToPC(oPC, "Gravity rights itself and you immediately plunge towards the icy glacier!"));
			 DelayCommand(10.0, AssignCommand(oPC, ActionJumpToLocation(GetLocation(oEndWP))));
			 DelayCommand(12.0, SendMessageToPC(oPC, "At the height of two tall men above the ice, however, your descent abruptly slows. You land upon the glacier with the gentleness of a falling snowflake."));
			 DelayCommand(15.0, SpeakString(sFollowUp, TALKVOLUME_TALK));
			 }
		}
	
			 
   if((nMatch == 5060) || (nMatch == 5065))
       {if(GetTag(OBJECT_SELF) == "003_cr_gt_giantess_sage")
	   		{object oTrigger = GetLocalObject(OBJECT_SELF, "oTrigger");
			 if(oTrigger == OBJECT_INVALID)
			 	{oTrigger = GetObjectByTag("slv_deandragon_x_xorn");
				 SetLocalObject(OBJECT_SELF, "oTrigger", oTrigger);
				}
			 SetLocalInt(oTrigger, "XornGroup", 1);
			 SpeakString("*Lowers finger and points at the hole in the ground.");
			}
		else
	   
	   		{SpeakString("Welcome.  The cabinet will close and lock from this side in two minutes.  Enter before then, please.", TALKVOLUME_TALK);
            SetLocked(oCabinet, FALSE);
            SetLocalInt(oStudent, "QuestAssignmentOpen", 0);
            SetLocalInt(oStudent, "DeanPhoenixConversation", 0);
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlimmer, oPhoenix, 10.0));
            DestroyObject(OBJECT_SELF, 5.5);
            return;
            }
          }


   if((nMatch >= 4999) && (nMatch <= 5003) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix != "Yes"))

       {
        string sNameGiven = GetMatchedSubstring(0);
        SetCampaignString("SLV_UNI", "sNameGivenPhoenix", sNameGiven, oStudent);
        SetLocalInt(oStudent, sFullName, 1);
        ExecuteScript("slv_static_voice_phoenix", oVoice);

       }
    else if((nMatch == 6000) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix != "Yes"))
        {
        if(TestStringAgainstPattern("**" + sFirstName + "**", GetMatchedSubstring(0)))
           {SetLocalString(oStudent, "First", sFirstName);}
           {}
        if(TestStringAgainstPattern("**" + sMiddleName + "**", GetMatchedSubstring(0)))
           {SetLocalString(oStudent, "Middle", sMiddleName);}
           {}
        if(TestStringAgainstPattern("**" + sMiddleName2 + "**", GetMatchedSubstring(0)))
           {SetLocalString(oStudent, "Middle2", sMiddleName2);}
           {}
        if(TestStringAgainstPattern("**" + sLastName + "**", GetMatchedSubstring(0)))
           {SetLocalString(oStudent, "Last", sLastName);}
           {}
        if((GetLocalString(oStudent, "First") != "") || (GetLocalString(oStudent, "Middle") != "") || (GetLocalString(oStudent, "Middle2") != "") || (GetLocalString(oStudent, "Last") != ""))
            {SetLocalString(oStudent, "FullName", GetLocalString(oStudent, "First") + GetLocalString(oStudent, "Middle") + GetLocalString(oStudent, "Middle2") + GetLocalString(oStudent, "Last"));
             if((GetLocalString(oStudent, "FullName") != "the") && (GetLocalString(oStudent, "FullName") != "of") &&(GetLocalString(oStudent, "FullName") != "theof") && (GetLocalString(oStudent, "FullName") != "ofthe"))
                {SetLocalInt(oStudent, sFullName, 1);
                 string sNameGiven = GetLocalString(oStudent, "First") + " " + GetLocalString(oStudent, "Middle") + " " + GetLocalString(oStudent, "Middle2") + " " + GetLocalString(oStudent, "Last");
                 SetCampaignString("SLV_UNI", "sNameGivenPhoenix", sNameGiven, oStudent);
                 ExecuteScript("slv_static_voice_phoenix", oVoice);
                }
              else
                {SetLocalInt(oStudent, sFullName, 0);
                 string sNameGiven = "";
                 SetLocalString(oStudent, "sNameGiven", sNameGiven);
                 ExecuteScript("slv_static_voice_phoenix", oVoice);
                 }

            }
         else
           {SetLocalInt(oStudent, sFullName, 0);
            string sNameGiven = "";
            SetLocalString(oStudent, "sNameGiven", sNameGiven);
            ExecuteScript("slv_static_voice_phoenix", oVoice);
            }
         }

    else if((nMatch == 5004) && (GetIsObjectValid(oPC)) && (oPC == oStudent))
        {AssignCommand(oPhoenix, SpeakString("Very well.  Return when you are prepared to demonstrate your desire to learn.", TALKVOLUME_TALK));
         SetLocalInt(oStudent, "QuestAssignmentOpen", 0);
         SetLocalInt(oStudent, "DeanPhoenixConversation", 0);
         DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlimmer, oPhoenix, 10.0));
         DestroyObject(OBJECT_SELF, 5.5);
        }

   else if((nMatch >= 5005) && (nMatch <= 5007) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") && (GetLocalInt(oStudent, "QuestAssignmentOpen") < 1) && (GetLocalInt(oStudent, "DeanPhoenixConversation") == 1))
        {SetLocalString(OBJECT_SELF, "QuestSubmitAssignString", GetMatchedSubstring(1));
         SetLocalInt(oStudent, "DeanPhoenixConversation", 2);
         DelayCommand(1.0, ExecuteScript("slv_static_voicequests_phoenix", OBJECT_SELF));
        }
		

   else if((nMatch == 5998) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") && (GetLocalInt(oStudent, "QuestAssignmentOpen") < 1) && (GetLocalInt(oStudent, "DeanPhoenixConversation") == 0))
        {SetLocalInt(oStudent, "DeanPhoenixConversation", 1);
         DelayCommand(1.0, ExecuteScript("slv_static_voice_phoenix", OBJECT_SELF));
         }

   else if((nMatch == 5998) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") && (GetLocalInt(oStudent, "QuestAssignmentOpen") < 1) && (GetLocalInt(oStudent, "DeanPhoenixConversation") == 1))
        {SetLocalInt(oStudent, "DeanPhoenixConversation", 1);
         DelayCommand(1.0, ExecuteScript("slv_static_voicequests_phoenix", OBJECT_SELF));
         }

   else if((nMatch == 5999) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") && (GetLocalInt(oStudent, "QuestAssignmentOpen") < 1) && (GetLocalInt(oStudent, "DeanPhoenixConversation") <= 1))
        {AssignCommand(oPhoenix, SpeakString("Very well.  Return when you are prepared to demonstrate your desire to learn.", TALKVOLUME_TALK));
         SetLocalInt(oStudent, "QuestAssignmentOpen", 0);
         SetLocalInt(oStudent, "DeanPhoenixConversation", 0);
         DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlimmer, oPhoenix, 10.0));
         DestroyObject(OBJECT_SELF, 3.5);
        }

   else if((nMatch == 6000) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") && (GetLocalInt(oStudent, "QuestAssignmentOpen") < 1) && (GetLocalInt(oStudent, "DeanPhoenixConversation") == 1))
        {AssignCommand(oPhoenix, SpeakString("While I speak with my Master's voice, I am not my Master, but only a construct.  You must use the words I provided you in your response to me, or reschedule for a later time with the word 'reschedule'.", TALKVOLUME_TALK));
        }


    else if((nMatch >= 5008) && (nMatch <= 5033) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") && (GetLocalInt(oStudent, "DeanPhoenixConversation") == 2))
       {
        SetLocalString(OBJECT_SELF, "Quest", GetStringUpperCase(GetStringLeft(GetMatchedSubstring(1), 1)));
        SetLocalString(OBJECT_SELF, "Title", GetMatchedSubstring(1));
        SetLocalInt(oStudent, "DeanPhoenixConversation", 3);
        DelayCommand(1.0, ExecuteScript("slv_static_voicequests_phoenix", OBJECT_SELF));
       }

     else if((nMatch == 6000) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") &&  (GetLocalInt(oStudent, "DeanPhoenixConversation") == 2))
        {AssignCommand(oPhoenix, SpeakString("That is not a text book in my syllabus.  If you wish to reschedule, please use the word 'reschedule' properly in a sentence.", TALKVOLUME_TALK));
        }

     else if((nMatch >= 5034) && (nMatch <= 5059) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") && (GetLocalInt(oStudent, "DeanPhoenixConversation") == 3) && (GetLocalInt(oStudent, "QuestAssignmentOpen") >= 2))
       {string sQuest = GetLocalString(OBJECT_SELF, "Quest");
        int nKeyword = 5034;
        int iABC = 0;
        string sCapitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string sSmalls = "abcdefghijklmnopqrstuvwxyz";
        string sCapitalLetter = GetSubString(sCapitals, iABC, 1);
        string sSmallLetter = GetSubString(sSmalls, iABC, 1);
        while(iABC < 27)
          {if((nMatch == nKeyword) &&  ((sQuest == sCapitalLetter) || (sQuest == sSmallLetter)))
            {AssignCommand(oPhoenix, SpeakString("Very good.  I shall record you as having collected all the information to discuss with my Master.", TALKVOLUME_TALK));
             if((sQuest == "R") || (sQuest == "r") || (sQuest == "J")|| (sQuest == "j"))
			 	{DelayCommand(5.0, AssignCommand(oPhoenix, SpeakString("Oh and something else for you. Of this answer you'll need two, for a hidden subtext clue, not the big clue that you'll view.", TALKVOLUME_TALK)));
 				if((sQuest == "J") || (sQuest == "j"))
				 	{DelayCommand(10.0, AssignCommand(oPhoenix, SpeakString("Mercy me and on you too! Listen up or else you'll rue...when looking back and on review, need revealed as two TIMES two?", TALKVOLUME_TALK)));
	 				}
				}
			 if((sQuest == "V") || (sQuest == "v"))
			 	{DelayCommand(5.0, AssignCommand(oPhoenix, SpeakString("Very simple, yes? From this you may learn two things. The first: simplicity can be more difficult than complexity when it is a change from procedure. The second: simple and fast are just as effective as learned and detailed when executed properly.", TALKVOLUME_TALK)));
 				}
			 int iQuestState = ACR_RetrieveQuestState("slv_deandragon_" + GetStringLowerCase(sQuest), oStudent);
			 if(GetCampaignString("SLV_UNI", "PhoenixQuest" + sQuest, oStudent) != "Completed")
				 {ACR_AddPersistentJournalQuestEntry("slv_deandragon_" + GetStringLowerCase(sQuest), iQuestState +1, oStudent, FALSE, FALSE, FALSE, 100);
				 SetCampaignString("SLV_UNI", "PhoenixQuest" + sQuest, "Completed", oStudent);
			 	}
			 SetLocalInt(oStudent, "DeanPhoenixConversation", 4);
             DelayCommand(1.0, ExecuteScript("slv_static_voicequests_phoenix", OBJECT_SELF));
             break;
            }
            else
            {nKeyword++;
             iABC++;
             sCapitalLetter = GetSubString(sCapitals, iABC, 1);
             sSmallLetter = GetSubString(sSmalls, iABC, 1);
            }
          }
        if(iABC == 27)
            {AssignCommand(oPhoenix, SpeakString("I'm sorry, that is not the right keyword for the task we are discussing.  Try again or reschedule.", TALKVOLUME_TALK));
            }
            
       }

      else if((nMatch == 6000) && (GetIsObjectValid(oPC)) && (oPC == oStudent) && (sCampaignNamedPhoenix == "Yes") &&  (GetLocalInt(oStudent, "DeanPhoenixConversation") == 3))
        {AssignCommand(oPhoenix, SpeakString("I'm sorry, that is not the right keyword for any current task.  Try again or reschedule.", TALKVOLUME_TALK));
            }

     else if (nMatch == 5007)
       {string sQuest = GetLocalString(OBJECT_SELF, "Quest");
         if((GetLocalString(oStudent, "PhoenixQuest" + sQuest) == "Completed") && (GetLocalInt(oStudent, "Discuss " + sQuest) !=1))
           {AssignCommand(oPhoenix, SpeakString("Certainly.  Enjoy your discussion.  The door will close and lock from this side in two minutes.  I will be gone much sooner.", TALKVOLUME_TALK));
            SetLocalInt(oStudent, "Discuss " + sQuest, 1);
			if(GetIsObjectValid(oCabinet) == FALSE)
				 {object oCabinetNew = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_wardrobe_large", lCabinet, FALSE, "vala_cabinet");
			 	  DelayCommand(3.0, SetLocked(oCabinetNew, FALSE));
	 			  SetLocalObject(oCabinetNew, "oStatic", oCabinetStatic);
                  DestroyObject(oCollBox);           						 
                  SetLocalObject(oCabinetNew, "oStudent", oStudent);
				  SetLocalString(oCabinetNew, "Quest" + GetName(oStudent), sQuest);
				  DelayCommand(120.0, ExecuteScript("slv_plc_onclose", oCabinetNew));
				 }
			SetLocalInt(oStudent, "QuestAssignmentOpen", 0);
			SetLocalInt(oStudent, "DeanPhoenixConversation", 0);
			SetCampaignString("SLV_UNI", "PhoenixQuest" + sQuest, "Graded", oStudent);
			DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlimmer, oPhoenix, 10.0));
			DestroyObject(OBJECT_SELF, 125.5);	  	           						 
            }
        }
     }
    

	




}