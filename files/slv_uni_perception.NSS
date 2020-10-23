////////////////////////////////////////////////////////////////////////////////
//
//     Filename : slv_uni_perception
//      Version : 1.1
//         Date : 2008-2-4
//       Author : Wynna
//
//  Description
//  This handles NPC recognition patterns in SLV Uni

////////////////////////////////////////////////////////////////////////////////
#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"

void main()
{

	object oWynna = GetLocalObject(OBJECT_SELF, "Wynna");
	object oArea = GetArea(OBJECT_SELF);
	
		
   string sDay;
     if(GetIsDay())
     {sDay = "day.";}
     else
     {sDay = "evening.";}
    string sTeach;
     if(Random(8) < 2)
     {sTeach = "Professor Melindia";}
     else if (Random(8) < 3)
     {sTeach = "Professor Gasen";}
     else if (Random(8) < 4)
     {sTeach = "Professor Clarvue";}
     else if (Random(8) < 5)
     {sTeach = "Professor Elestari";}
     else if (Random(8) < 6)
     {sTeach = "Professor Gertrun";}
     else if (Random(8) < 7)
     {sTeach = "Professor Volebane";}
     else if (Random(8) < 8)
     {sTeach = "Professor Ostelle";}
     else if (Random(8) < 9)
     {sTeach = "Professor Auroneus";}

 string sCandidate;
 int nRandomCandidate = Random(8);
     if(nRandomCandidate < 2)
     {sCandidate = "Bae'ithra";}
     else if (nRandomCandidate < 3)
     {sCandidate = "Syllynn";}
     else if (nRandomCandidate < 4)
     {sCandidate = "Olivus";}
     else if (nRandomCandidate < 5)
     {sCandidate = "Zanfis";}
     else if (nRandomCandidate < 6)
     {sCandidate = "Grimjaw";}
     else if (nRandomCandidate < 7)
     {sCandidate = "Rocko";}
     else if (nRandomCandidate < 8)
     {sCandidate = "Brightbells";}
      

object oPerceived = GetLastPerceived();
if((GetIsPC(oPerceived)) || (GetIsDMPossessed(oPerceived)))
	{return;}
	
object oNearest = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, 1);
 if((Random(4) == 1) && (!GetIsDM(oNearest)) && (!GetIsPC(oNearest)) &&(GetDistanceBetween(OBJECT_SELF, oNearest) < 5.0 ) )
	 {DelayCommand(3.0, AssignCommand(oNearest, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF)))));
	  DelayCommand(3.2, SetFacingPoint(GetPositionFromLocation(GetLocation(oNearest))));
	    
	   if((GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, 1)) != GetTag(OBJECT_SELF) + "_Class")
	   	    && ((GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_class_lvl") || (GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_grd_lvl"))
			&& (GetTag(oPerceived) != "003_cr_slv_bookwyrm") && (GetTag(oPerceived) != "003_cr_slv_deanvoice")
			&& (GetTag(oPerceived) != "003_cr_slv_dean") && (GetTag(oPerceived) != "003_cr_slv_recordsclerk")
			&& (GetTag(oPerceived) != "003_cr_slv_arken") && (GetTag(oPerceived) != "003_cr_slv_miresk")
			&& (GetTag(oPerceived) != "003_cr_slv_librarian") && (GetTag(oPerceived) != "003_cr_slv_Spellguard")
			&& (GetTag(oPerceived) != "003_cr_slv_scribe") && (GetTag(oPerceived) != "003_cr_slv_scribe2")
			&& (GetTag(oPerceived) != "003_cr_slv_mothermay") && (GetTag(oPerceived) != "003_cr_slv_belad")
			&& (GetLocalInt(OBJECT_SELF, "Spoken") != 1)
			)
			
			
			   {int nRandomPerception = Random(250);
			   
			   if(nRandomPerception < 8)
				     {ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 17)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Hello.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 18)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Whatever she saw, it couldn't possibly have been a dragon. Probably just a wyvern." , TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 19)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I know it says it's working for a couple of professors, but, really, do you trust a mephit?" , TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 20)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Funny, every candle in the ritual kept guttering out.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 21)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Are you following the progress of the Dean's Quest candidates?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 22)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Yes, I said Hornblade. He was visiting the Dean, only this morning!", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 23)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I know it wasn't real when I did the class. I'm sure she's imagining that it is real now.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 24)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Good " + sDay, TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((nRandomPerception < 25)  && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Can I borrow your notes?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((nRandomPerception < 26) && (GetGender(OBJECT_SELF) == GENDER_FEMALE))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("He swears they had to run from kobolds, just outside the Baroness's holdings.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((nRandomPerception < 27) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("How did you do on " +sTeach + "'s last test?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			
			      else if((nRandomPerception < 28) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("It was just a gold-colored streak, running along the causeway.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 29)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Have you heard? The elemental tests are back on, but I can't possibly see how they could be teleporting into *that* place.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((nRandomPerception < 30) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Want to go to the circus while it's back in town?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 31)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("The written exams are too hard!  I don't care what he says!", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 32)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you hear? There is a drow hiding here with special dispensation from the High Mage!", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if((nRandomPerception < 33) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you study?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 34)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Those annoying little bookwyrms follow him around like he's something special, but he's just a sorceror.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 35)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Quasits and imps and ravids? That's a triptych of outsiders I wouldn't want to get in the middle of.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 36)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Sorry I'm late. I had trouble with keeping a fire lit this morning and it's too cold without one!", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			
			     else if(nRandomPerception < 37)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Glad to see you have recovered. Did Dr. Augustine heal up those abrasions you got from the xorn?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if((nRandomPerception < 38) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString(sTeach + " wants to see you, you know.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 39)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Auroneous made the sphinx and Clarvue is channeling his divinations into it, so it must be sanctioned.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 40)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I still think it's strange. A whole lot of fey and Turlang's kin, is what I heard.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(nRandomPerception < 41)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Master Gasen looks like one of his summoned tiger's at a very large dish of cream these days, doesn't he?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 42)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_BORED, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 43)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 44)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_GROUP, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 45)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_LAUGH, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 46)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_TALKTOME, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 47)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_REST, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 48)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_MOVEOVER, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 49)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you hear about " + sTeach + "'s class?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(nRandomPerception < 50)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I'm looking for " + sTeach +".", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
					 }
				 else if(nRandomPerception < 51)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString( sCandidate + " is doing quite well, from what I hear.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			 	
			
			SetLocalInt(OBJECT_SELF, "Spoken", 1); 
		    
			if((GetLocalInt(oPerceived, "InClass") != 1) && (Random(10) < 5))
				{DelayCommand(1.0, ActionForceMoveToLocation(GetLocation(oPerceived), FALSE, 30.0));
			     DelayCommand(1.2, AssignCommand(oPerceived, ActionWait(30.0 + IntToFloat(Random(300)))));
				 DelayCommand(5.1, ActionWait(30.0 + IntToFloat(Random(300))));
				 }
			 float fRandReset = IntToFloat(Random(600) + 30);
			 DelayCommand(fRandReset, SetLocalInt(OBJECT_SELF, "Spoken", 0));
			 }	
	}
}