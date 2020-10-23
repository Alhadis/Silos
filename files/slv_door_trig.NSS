#include "silvy_univ_inc"
#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "acr_quest_i"

void main()
{
    object oStudent = GetEnteringObject();
	object oMyDoor = GetLocalObject(OBJECT_SELF, "oMyDoor");
	string sSchool;
    if(oMyDoor == OBJECT_INVALID)
		{oMyDoor = GetObjectByTag(GetName(OBJECT_SELF), 0);
		 SetLocalObject(OBJECT_SELF, "oMyDoor", oMyDoor);
		 }
	if(FindSubString(GetTag(oMyDoor), "Abj") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration, oMyDoor);
   		 sSchool = "Abjuration";
		 }
	if(FindSubString(GetTag(oMyDoor), "Con") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration, oMyDoor);
   		 sSchool = "Conjuration";
		 }
	if(FindSubString(GetTag(oMyDoor), "Div") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination, oMyDoor);
   		 sSchool = "Divination";
		 }
	if(FindSubString(GetTag(oMyDoor), "Enc") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment, oMyDoor);
   		 sSchool = "Enchantment";
		 }
	if(FindSubString(GetTag(oMyDoor), "Evo") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation, oMyDoor);
   		 sSchool = "Evocation";
		 }
	if(FindSubString(GetTag(oMyDoor), "Ill") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, oMyDoor);
   		 sSchool = "Illusion";
		 }
	if(FindSubString(GetTag(oMyDoor), "Nec") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy, oMyDoor);
   		 sSchool = "Necromancy";
		 }
	if(FindSubString(GetTag(oMyDoor), "Tra") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation, oMyDoor);
   		 sSchool = "Transmutation";
		 }
	
	 
		 
	int nSchool = GetSilvyUniversitySchool(oMyDoor);
    string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
    string sDoor = GetStringRight(GetTag(oMyDoor),1);
    int nDoor = StringToInt(sDoor) * 100;
    int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    effect eKnock = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
     effect eStop = EffectVisualEffect(VFX_DUR_LIGHT_RED_10);
   
 
     //Basic instruction for failsafe open/don't open to right students
        if(((GetIsPC(oStudent) == FALSE) && (((nLevel >= nDoor)&& (sCurrentCourse != "")) || (nSchool == SilvyUniversitySchoolUndefined)) && (GetLocalString(oMyDoor, "Unlocked") == "")) || (GetIsDMPossessed(oStudent) == TRUE))

           {ActionUnlockObject(oMyDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMyDoor);
			DelayCommand(10.0, ActionCloseDoor(oMyDoor));
			DelayCommand(12.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(12.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
				
		if((GetIsPC(oStudent) == TRUE) && (nLevel >= nDoor)&& (sCurrentCourse != "") && (GetLocalString(oMyDoor, "Unlocked") == ""))

           {SetLocked(oMyDoor, FALSE);
		    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            DelayCommand(30.0, ActionCloseDoor(oMyDoor));
			DelayCommand(32.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(32.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
	
		if((GetTag(oStudent) == "003_cr_slv_procenc2") && (FindSubString(GetTag(oMyDoor), "Enc") != -1))
			{ActionUnlockObject(oMyDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMyDoor);
			DelayCommand(10.0, ActionCloseDoor(oMyDoor));
			DelayCommand(12.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(12.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
		
		
		if((GetTag(oStudent) == "slv_proc_arizmazul") && (FindSubString(GetTag(oMyDoor), "Div") != -1))
			{ActionUnlockObject(oMyDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMyDoor);
			DelayCommand(10.0, ActionCloseDoor(oMyDoor));
			DelayCommand(12.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(12.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
						
//Deandragon T	Transmutation Door trigger	
		if(((ACR_RetrieveQuestState("slv_deandragon_t", oStudent) == 1) && (FindSubString(GetTag(oMyDoor), "Tra") != -1) && (GetLocalObject(OBJECT_SELF, "oTQuest") != oStudent)))
			{
			SetLocalObject(OBJECT_SELF, "oTQuest", oStudent);
			DelayCommand(1800.0, SetLocalObject(OBJECT_SELF, "oTQuest", OBJECT_INVALID));
			ActionUnlockObject(oMyDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMyDoor);
			object oMirrorWP = GetLocalObject(OBJECT_SELF, "oMirrorWP");
		    if(oMirrorWP == OBJECT_INVALID)
			 	{oMirrorWP = GetWaypointByTag("slv_deandragon_t_mirror");
				 SetLocalObject(OBJECT_SELF, "oMirrorWP", oMirrorWP);
				}
		    object oProfTraWP = GetLocalObject(OBJECT_SELF, "oProfTraWP");
		    if(oProfTraWP == OBJECT_INVALID)
			 	{oProfTraWP = GetWaypointByTag("slv_deandragon_t_proftra");
				 SetLocalObject(OBJECT_SELF, "oProfTraWP", oProfTraWP);
				}
		    object oProfDivWP = GetLocalObject(OBJECT_SELF, "oProfDivWP");
		    if(oProfDivWP == OBJECT_INVALID)
			 	{oProfDivWP = GetWaypointByTag("slv_deandragon_t_profdiv");
				 SetLocalObject(OBJECT_SELF, "oProfDivWP", oProfDivWP);
				}
		    object oProfTraOld = GetObjectByTag("003_cr_slv_proftra");
			DestroyObject(oProfTraOld);
			object oProfTra = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_proftra", GetLocation(oProfTraWP), FALSE, "003_cr_slv_proftra_NoWalk");
			 
			//object oProfEvo = GetObjectByTag("003_cr_slv_profevo");
			//if(oProfEvo == OBJECT_INVALID)
			//	{oProfEvo = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profevo", GetLocation(oProfTraWP));
			//	}
		//	else
			//	{AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oProfTraWP)));
			//	}
			object oProfDivOld = GetObjectByTag("003_cr_slv_profdiv");
			DestroyObject(oProfDivOld);
			object oProfDiv = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profdiv", GetLocation(oProfTraWP), FALSE, "003_cr_slv_profdiv_NoWalk");
		
			object oMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_h_artifice_mirror", GetLocation(oMirrorWP));
			SetUseableFlag(oMirror, TRUE);
			AssignCommand(oMyDoor, ActionSpeakString(GetName(oStudent) + " has arrived, masters. *Auroneous and Clarvue turn from their discussion before a mirror carved of ivory or bone.", TALKVOLUME_TALK));
			SetLocalObject(oProfDiv, "GoTo", oProfDivWP);
			SetLocalObject(oProfTra, "GoTo", oProfTraWP);
			SetLocalInt(oProfDiv, "Walk_Off",1);
			SetLocalInt(oProfTra, "Walk_Off",1);
			DelayCommand(2.0, AssignCommand(oProfDiv, ClearAllActions(TRUE)));
			DelayCommand(2.0, AssignCommand(oProfTra, ClearAllActions(TRUE)));
			DelayCommand(3.0, AssignCommand(oProfDiv, ActionJumpToLocation(GetLocation(oProfDivWP))));
			DelayCommand(3.0, AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oProfTraWP))));
				
			
			DelayCommand(10.0, AssignCommand(oProfTra, ActionSpeakString("Ah, excellent. Do come in, " + GetName(oStudent) + ". Clarvue and I were just discussing the best way to go about this. ", TALKVOLUME_TALK)));
			DelayCommand(20.0, AssignCommand(oProfDiv, ActionSpeakString("All ways end in equally murky results. The choices are too many to see clearly.", TALKVOLUME_TALK)));
			DelayCommand(30.0, AssignCommand(oProfTra, ActionSpeakString("Then it makes no difference, practically speaking, so let us begin.", TALKVOLUME_TALK)));
			DelayCommand(40.0, AssignCommand(oProfTra, ActionSpeakString("First, I should say that I find it a fascinating coincidence that this device so integral to past Dean's Quests should be a facilitation to this one.", TALKVOLUME_TALK)));
			DelayCommand(50.0, AssignCommand(oProfDiv, ActionSpeakString("Coincidence so often reveals itself later as inevitability. *Murmers.", TALKVOLUME_TALK)));
			DelayCommand(60.0, AssignCommand(oProfTra, ActionSpeakString("Some of us must proceed through life in a linear fashion, Clarvue. *Mildly*", TALKVOLUME_TALK)));
			DelayCommand(70.0, AssignCommand(oProfTra, ActionSpeakString("The linear progression for this... *pats mirror* began long ago. We sent in the current proctors to recover this mirror for the very first Dean's Exam field quest, of course.", TALKVOLUME_TALK)));
			DelayCommand(80.0, AssignCommand(oProfDiv, ActionSpeakString("Since then, I have had the use of it. Some months ago, it revealed itself as not only a potent scrying device, but one of apparently a network of interlinked scrying mirrors.", TALKVOLUME_TALK)));
			DelayCommand(90.0, AssignCommand(oProfDiv, ActionSpeakString("Revealed, by suddenly flaring to life in the middle of a class, I might add.", TALKVOLUME_TALK)));
			DelayCommand(100.0, AssignCommand(oProfDiv, ActionSpeakString("It began to show events happening elsewhere. I could not interrupt what it showed, or affect the communication in any way. It was all over before I could summon those of a more mechanical bent than I.", TALKVOLUME_TALK)));
			DelayCommand(110.0, AssignCommand(oProfTra, ActionSpeakString("However, when Arky and I did arrive, we discovered the most interesting things! The mirror did seem able to only receive, which Arky theorized was due to being used as a pure scrying device for so long by us, unknowing of its...brethren mirrors out there.", TALKVOLUME_TALK)));
			DelayCommand(120.0, AssignCommand(oProfTra, ActionSpeakString("*Warming to his topic, striking a lecturing pose.* Even more interesting, after some days of study and magical research, I discovered the secret to the crystal scribery that--", TALKVOLUME_TALK)));
			DelayCommand(130.0, AssignCommand(oProfDiv, ActionSpeakString("Perhaps we should just let the the scholar review the material. *Interrupts* Things are always clearer when seen for oneself.", TALKVOLUME_TALK)));
			DelayCommand(140.0, AssignCommand(oProfTra, ActionSpeakString("That's a polite way of telling me that I do go on about the mechanics of a fascinating object. *Laughs* I have it readied for you scholar.", TALKVOLUME_TALK)));
			DelayCommand(150.0, AssignCommand(oProfDiv, ActionSpeakString("Scholar, use the mirror. Gaze into it. Learn for yourself what may help you choose among the pathways that open before you in your future.", TALKVOLUME_TALK)));
			DelayCommand(1800.0, ActionCloseDoor(oMyDoor));
			DelayCommand(1802.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(1802.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
}