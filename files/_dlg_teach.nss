//::///////////////////////////////////////////////
//:: _dlg_teach
//:://////////////////////////////////////////////
/*
    Z-Dialog Script for the Teach Feat

*/
//:://////////////////////////////////////////////
//:: Created:   Henesua (2013 sept 19)
//:: Modified:
//:://////////////////////////////////////////////

#include "zdlg_include_i"

#include "x3_inc_skin"

#include "_inc_constants"
#include "_inc_class"
#include "_inc_util"
#include "_inc_languages"
//#include "aa_inc_master"

// LEARNING SYSTEM [file: aa_s0_teach]
// constants for local variable "LEARNING_SUBJECT"
const int LEARNING_READY    = 0;
const int LEARNING_CLASS    = 1;
const int LEARNING_LANGUAGE = 2;

// Constants
const string PAGE_TEACHER_START = "teacher_start";
const string PAGE_TEACHER_LESSON= "teacher_lesson";
const string PAGE_TEACHER_CLASS = "teacher_class";
const string PAGE_TEACHER_LANG  = "teacher_lang";
const string PAGE_STUDENT_START = "student_start";
const string PAGE_STUDENT_ACCEPT= "student_accept";


// DECLARATIONS
// custom
// Learn New Class - [FILE: v2_dlg_teach]
void GiveClassPrerequisites(object oPC, int nClass);

// Zdlg
void Init();
void PageInit();
void CleanUp();
void HandleSelection();

// IMPLEMENTATION
// custom ----------------------------------------------------------------------
void GiveClassPrerequisites(object oPC, int nClassTraining)
{
    switch(nClassTraining)
    {
        case CLASS_TYPE_BARBARIAN:
            SetSkinInt(oPC, "restrict_class_barbarian", FALSE);
            SetLocalInt(oPC, "restrict_class_barbarian", FALSE);
        break;
        case CLASS_TYPE_BARD:
            SetSkinInt(oPC, "restrict_class_bard", FALSE);
            SetLocalInt(oPC, "restrict_class_bard", FALSE);
        break;
        case CLASS_TYPE_CLERIC:
            SetSkinInt(oPC, "restrict_class_cleric", FALSE);
            SetLocalInt(oPC, "restrict_class_cleric", FALSE);
        break;
        case CLASS_TYPE_DRUID:
            SetSkinInt(oPC, "restrict_class_druid", FALSE);
            SetLocalInt(oPC, "restrict_class_druid", FALSE);
        break;
        case CLASS_TYPE_FIGHTER:
            SetSkinInt(oPC, "restrict_class_fighter", FALSE);
            SetLocalInt(oPC, "restrict_class_fighter", FALSE);
        break;
        case CLASS_TYPE_MONK:
            SetSkinInt(oPC, "restrict_class_monk", FALSE);
            SetLocalInt(oPC, "restrict_class_monk", FALSE);
        break;
        case CLASS_TYPE_PALADIN:
            SetSkinInt(oPC, "restrict_class_paladin", FALSE);
            SetLocalInt(oPC, "restrict_class_paladin", FALSE);
        break;
        case CLASS_TYPE_RANGER:
            SetSkinInt(oPC, "restrict_class_ranger", FALSE);
            SetLocalInt(oPC, "restrict_class_ranger", FALSE);
        break;
        case CLASS_TYPE_ROGUE:
            SetSkinInt(oPC, "restrict_class_rogue", FALSE);
            SetLocalInt(oPC, "restrict_class_rogue", FALSE);
        break;
        case CLASS_TYPE_SORCERER:
            SetSkinInt(oPC, "restrict_class_sorcerer", FALSE);
            SetLocalInt(oPC, "restrict_class_sorcerer", FALSE);
        break;
        case CLASS_TYPE_WIZARD:
            SetSkinInt(oPC, "restrict_class_wizard", FALSE);
            SetLocalInt(oPC, "restrict_class_wizard", FALSE);
        break;
        default:
        break;
    }
}


// ZDLG ------------------------------------------------------------------------
void Init()
{
    object oPC          = GetPcDlgSpeaker();

    SetLocalString(oPC, "ZDLG_END", "[End Dialog.]");
    SetShowEndSelection( TRUE );

    // General List
    if(!GetLocalInt(oPC, "IN_CONV"))
    {
        if( GetIsObjectValid(GetLocalObject(oPC,"TEACHING_STUDENT")) )
            SetDlgPageString(PAGE_TEACHER_START);
        else if( GetIsObjectValid(GetLocalObject(oPC,"TEACHER")) )
            SetDlgPageString(PAGE_STUDENT_START);

        SetLocalInt(oPC, "IN_CONV", TRUE);
    }
}

void PageInit()
{
    string sPage    = GetDlgPageString();

    object oPC      = GetPcDlgSpeaker();
    object oHolder  = oPC;

    string sPrompt;

    // Generate fresh response list
    DeleteList( sPage, oHolder );


    object oStudent, oTeacher;
    oTeacher = GetLocalObject(oPC, "TEACHER");
    oStudent = GetLocalObject(oPC, "TEACHING_STUDENT");

    // Initialize prompt and responses
    // TEACHER CONVERSATION ----------------------------------------------------
    if( sPage==PAGE_TEACHER_START )
    {
        sPrompt =
             "You are about to teach something that you know to "+GetName(oStudent)+"."
            +" What will it be?"
            ;

        AddStringElement( "[Knowledge prerequisites for a character class.]", sPage, oHolder );
        AddStringElement( "[Language.]", sPage, oHolder );
    }
    else if( sPage==PAGE_TEACHER_LESSON )
    {
        sPrompt = GetLocalString(oPC, "TEACHER_LESSON_MESSAGE");
    }
    else if( sPage==PAGE_TEACHER_CLASS )
    {
        oTeacher = oPC;
        string sClass1  = GetClassName(GetClassByPosition(1, oTeacher));
        string sClass2  = GetClassName(GetClassByPosition(2, oTeacher));
        string sClass3  = GetClassName(GetClassByPosition(3, oTeacher));
        int bClass1, bClass2, bClass3, bNoClass;

        if(sClass1!=CLASS_NAME_BARBARIAN && sClass1!=CLASS_NAME_SORCERER)
            bClass1=TRUE;
        if(sClass2!=CLASS_NAME_BARBARIAN && sClass2!=CLASS_NAME_SORCERER && sClass2!="")
            bClass2=TRUE;
        if(sClass3!=CLASS_NAME_BARBARIAN && sClass3!=CLASS_NAME_SORCERER && sClass3!="")
            bClass3=TRUE;
        if(!bClass1&&!bClass2&&!bClass3)
            bNoClass=TRUE;

        if(bNoClass)
            sPrompt =   "You may train "+GetName(oStudent)+" in a character class which requires certain knowledge."
                       +" The Barbarian and Sorcerer classes however are not trainable because they are innate classes."
                       +" One can not learn how to be a Barbarian and Sorcerer."
                       +" Select another subject or end the lesson."
                ;
        else
            sPrompt =   "You may mentor "+GetName(oStudent)+" in one of your character classes."
                       +" A student may only train in one class at a time.";

        if(bClass1)
            AddStringElement( "["+sClass1+".]", sPage, oHolder );
        if(bClass2)
            AddStringElement( "["+sClass2+".]", sPage, oHolder );
        if(bClass3)
            AddStringElement( "["+sClass3+".]", sPage, oHolder );

        AddStringElement("[Select a different subject for this lesson.]", sPage, oHolder );

    }
    else if( sPage==PAGE_TEACHER_LANG )
    {
        oTeacher= oPC;
        sPrompt =   "You may teach a language that you know to "+GetName(oStudent)+"."
                   +" A student may only learn one language at a time."
                    ;

        int i; string sLangName;
        for (i = LANG_FIRST; i <= LANG_LAST; i++)
        {
            if(     GetSpeaksLanguage(oTeacher, i,FALSE)
                &&  (i!=LANG_COMMON || i!=LANG_SILENCE || i!=LANG_ANIMAL || i!=LANG_UNDERWATER)
              )
            {
                sLangName   = GetLanguageName(i);
                if(sLangName!="Default"&&sLangName!="")
                    AddStringElement("["+sLangName+".]", sPage, oHolder );
            }
        }

        AddStringElement("[Select a different subject for this lesson.]", sPage, oHolder );
    }
    // STUDENT CONVERSATION ----------------------------------------------------
    else if( sPage==PAGE_STUDENT_START )
    {
        oStudent = oPC;

        int nClass, nLanguage, nTraining, nTime;
        int nSubject = GetLocalInt(oStudent, "TEACHING_SUBJECT");
        string sLang, sClass;

        switch (nSubject)
        {
            // teaching prerequisites for a character class
            case LEARNING_CLASS:
                nTraining = GetSkinInt(oStudent, "LEARNING_CLASS");
                nTime   = GetSkinInt(oStudent, "LEARNING_CLASS_TIME");
                nClass  = GetLocalInt(oStudent, "TEACHING_CLASS");
                sClass  = GetClassName(nClass);
                if(nTraining==-1)
                {
                    SetLocalInt(oStudent,"TEACHING_NEW",TRUE);
                    sPrompt += GetName(oTeacher)+" offers to train you as a "+sClass+".";
                    SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You begin training as a "+sClass+".");
                }
                else if(nTraining==nClass)
                {
                    if(nTime+30 > GetTimeCumulative(TIME_DAYS)) // less than 30 game days since start of training
                    {
                        sPrompt += GetName(oTeacher)+" offers to continue your training as a "+sClass+".";
                        SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You continue your training as a "+sClass+".");
                    }
                    else
                    {
                        SetLocalInt(oStudent,"TEACHING_COMPLETED",TRUE);
                        sPrompt += GetName(oTeacher)+" offers to complete your training as a "+sClass+".";
                        SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "The "+sClass+" class will be available to you the next time you level up.");
                    }
                }
                else
                {
                    SetLocalInt(oStudent,"TEACHING_NEW",TRUE);
                    sPrompt += GetName(oTeacher)+" offers to train you as a "+sClass
                            + ", but you are currently training to be a "+GetClassName(nTraining)+"."
                            + " You will have to abandon your prior studies to pursue this new regimen.";
                    SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You begin training as a "+sClass+".");
                }
            break;
            // teaching how to speak a language
            case LEARNING_LANGUAGE:
                nTraining   = GetSkinInt(oStudent, "LEARNING_LANGUAGE");
                nLanguage   = GetLocalInt(oStudent, "TEACHING_LANGUAGE");
                sLang       = IntToString(nLanguage);

                if(nTraining==-1)
                {
                    SetLocalInt(oStudent,"TEACHING_NEW",TRUE);
                    sPrompt     += GetName(oTeacher)+" offers to teach you how to speak "+sLang+".";
                    SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You begin language lessons in "+sLang+".");
                }
                else if(nTraining==nLanguage)
                {
                    if(nTime+30 > GetTimeCumulative(TIME_DAYS)) // less than 30 game days since start of learning language
                    {
                        sPrompt += GetName(oTeacher)+" offers to help you with your "+sLang+" lessons.";
                        SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You continue your lessons in the "+sLang+" language.");
                    }
                    else if(    GetCountLanguagesKnown(oStudent)
                                    <
                                ( GetSkillRank(SKILL_LORE,oStudent,TRUE) )
                           )
                    {
                        SetLocalInt(oStudent,"TEACHING_COMPLETED",TRUE);
                        sPrompt += GetName(oTeacher)+" offers to complete your lessons with the "+sLang+" language.";
                        SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You have learned to speak "+sLang+".");
                    }
                    else
                    {
                        sPrompt += GetName(oTeacher)+" offers to help you with your "+sLang+" lessons"
                                + ", but until you sufficiently invest in the language skill or increase your intelligence"
                                + " you will not be able to master another language.";
                        SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You continue your lessons in the "+sLang+" language, but are having difficulty making headway.");
                    }
                }
                else
                {
                    SetLocalInt(oStudent,"TEACHING_NEW",TRUE);
                    sPrompt += GetName(oTeacher)+" offers to teach you how to speak "+sLang
                            + ", but you are currently learning "+GetLanguageName(nTraining)+"."
                            + " You will have to abandon your prior studies to begin learning "+sLang+".";
                    SetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE", "You begin language lessons in "+sLang+".");
                }


            break;

            default:
            break;
        }

        AddStringElement( "[Accept.]", sPage, oHolder );
        AddStringElement( "[Decline.]", sPage, oHolder );
    }
    else if( sPage==PAGE_STUDENT_ACCEPT )
    {
        oStudent    = oPC;
        sPrompt     = GetLocalString(oStudent, "TEACHING_ACCEPTED_MESSAGE");
    }
    // Set Prompt and Response List ............................................
    SetDlgPrompt( sPrompt );
    SetDlgResponseList( sPage, oHolder );
}

void CleanUp()
{
    object oPC = GetPcDlgSpeaker();
    DeleteLocalInt(oPC, "IN_CONV");

    DeleteLocalObject(oPC, "TEACHER");
    DeleteLocalString(oPC, "TEACHER_LESSON_MESSAGE");
    DeleteLocalObject(oPC, "TEACHING_STUDENT");
    DeleteLocalString(oPC, "TEACHING_ACCEPTED_MESSAGE");
    DeleteLocalInt(oPC, "TEACHING_NEW");
    DeleteLocalInt(oPC, "TEACHING_COMPLETED");
    DeleteLocalInt(oPC, "TEACHING_SUBJECT");
    DeleteLocalInt(oPC, "TEACHING_CLASS");
    DeleteLocalInt(oPC, "TEACHING_LANGUAGE");
}

void HandleSelection()
{
  object oPC    = GetPcDlgSpeaker();
  object oHolder= oPC;
  string sPage  = GetDlgPageString();
  int nSelect   = GetDlgSelection();
  string sSelect= GetStringElement( nSelect, sPage, oPC);

  object oTeacher   = GetLocalObject(oPC, "TEACHER");
  object oStudent   = GetLocalObject(oPC, "TEACHING_STUDENT");

    if(sPage==PAGE_TEACHER_START)
    {
        if(sSelect=="[Knowledge prerequisites for a character class.]")
            SetDlgPageString(PAGE_TEACHER_CLASS);
        else if(sSelect=="[Language.]")
            SetDlgPageString(PAGE_TEACHER_LANG);
    }
    else if(sPage==PAGE_TEACHER_LESSON)
    {
        EndDlg();
    }
    else if(sPage==PAGE_TEACHER_CLASS)
    {
        if(sSelect=="[Select a different subject for this lesson.]")
            SetDlgPageString(PAGE_TEACHER_START);
        else
        {
            // Initialize Student
            SetLocalInt(oStudent, "TEACHING_SUBJECT", LEARNING_CLASS);

            sSelect = GetStringLeft(sSelect,GetStringLength(sSelect)-2);
            sSelect = GetStringRight(sSelect,GetStringLength(sSelect)-1);

            if(sSelect==CLASS_NAME_ARCANE_ARCHER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_ARCANE_ARCHER);
            else if(sSelect==CLASS_NAME_ASSASSIN)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_ASSASSIN);
            else if(sSelect==CLASS_NAME_BARD)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_BARD);
            else if(sSelect==CLASS_NAME_BLACKGUARD)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_BLACKGUARD);
            else if(sSelect==CLASS_NAME_CLERIC)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_CLERIC);
            else if(sSelect==CLASS_NAME_DIVINECHAMPION)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_DIVINECHAMPION);
            else if(sSelect==CLASS_NAME_DRAGONDISCIPLE)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_DRAGONDISCIPLE);
            else if(sSelect==CLASS_NAME_DRUID)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_DRUID);
            else if(sSelect==CLASS_NAME_DWARVENDEFENDER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_DWARVENDEFENDER);
            else if(sSelect==CLASS_NAME_FIGHTER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_FIGHTER);
            else if(sSelect==CLASS_NAME_HARPER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_HARPER);
            else if(sSelect==CLASS_NAME_MONK)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_MONK);
            else if(sSelect==CLASS_NAME_PALADIN)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_PALADIN);
            else if(sSelect==CLASS_NAME_PALEMASTER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_PALEMASTER);
            else if(sSelect==CLASS_NAME_RANGER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_RANGER);
            else if(sSelect==CLASS_NAME_ROGUE)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_ROGUE);
            else if(sSelect==CLASS_NAME_SHADOWDANCER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_SHADOWDANCER);
            else if(sSelect==CLASS_NAME_SHIFTER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_SHIFTER);
            else if(sSelect==CLASS_NAME_WEAPON_MASTER)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_WEAPON_MASTER);
            else if(sSelect==CLASS_NAME_WIZARD)
                SetLocalInt(oStudent, "TEACHING_CLASS", CLASS_TYPE_WIZARD);

            // Start Student conversation
            int nGreet      = FALSE;
            int nPrivate    = FALSE;
            int nZoom       = FALSE;
            AssignCommand(oStudent, StartDlg( oStudent, oStudent, "aa_dlg_teach", nPrivate, nGreet, nZoom) );

            // Setup end of teacher's conversation
            AssignCommand(oPC, SpeakString("*Begins a lesson for "+GetName(oStudent)+".*"));
            SetLocalString(oPC, "TEACHER_LESSON_MESSAGE", "You attempt to mentor "+GetName(oStudent)+" in the ways of the "+sSelect+".");
            SetDlgPageString(PAGE_TEACHER_LESSON);
        }
    }
    else if(sPage==PAGE_TEACHER_LANG)
    {
        if(sSelect=="[Select a different subject for this lesson.]")
            SetDlgPageString(PAGE_TEACHER_START);
        else
        {
            //initialize student
            SetLocalInt(oStudent, "TEACHING_SUBJECT", LEARNING_LANGUAGE);

            string sLang    = GetStringRight(sSelect, GetStringLength(sSelect)-1);
            int nLang       = GetLanguageID(GetStringLowerCase(GetStringLeft(sLang,3)));
            SetLocalInt(oStudent, "TEACHING_LANGUAGE", nLang);

            // begin student conversation
            int nGreet      = FALSE;
            int nPrivate    = TRUE;
            int nZoom       = FALSE;
            AssignCommand(oStudent, StartDlg( oStudent, oStudent, "aa_dlg_teach", nPrivate, nGreet, nZoom) );


            // Setup end of teacher's conversation
            sLang           = GetStringLeft(sSelect, GetStringLength(sLang)-2);
            AssignCommand(oPC, SpeakString("*Begins a lesson for "+GetName(oStudent)+".*"));
            SetLocalString(oPC, "TEACHER_LESSON_MESSAGE", "You attempt to teach "+GetName(oStudent)+" how to speak "+sLang+".");
            SetDlgPageString(PAGE_TEACHER_LESSON);
        }
    }
    else if(sPage==PAGE_STUDENT_START)
    {
        if(sSelect=="[Accept.]")
        {
            oStudent = oPC;
            AssignCommand(oStudent, SpeakString("*Accepts the lesson.*"));
            int nSubject = GetLocalInt(oStudent, "TEACHING_SUBJECT");
            int nClass, nLanguage;
            string sMentorship, sMentors;
            switch (nSubject)
            {
                case LEARNING_CLASS:
                    nClass  = GetLocalInt(oStudent, "TEACHING_CLASS");

                    // tracking class mentors
                    sMentorship  = "MENTOR_"+IntToString(nClass);
                    sMentors     = GetSkinString(oStudent, sMentorship);
                    if(sMentors=="")
                        sMentors="*";
                    SetSkinString(oStudent, sMentorship, sMentors+"."+"NAME"+GetName(oTeacher)+".PC"+IntToString(GetIsPC(oTeacher))+".DAY"+IntToString(GetTimeCumulative(TIME_DAYS))+".*");

                    if(GetLocalInt(oStudent,"TEACHING_NEW"))
                    {
                        // begin your training
                        SetSkinInt(oStudent, "LEARNING_CLASS", nClass);
                        SetSkinInt(oStudent, "LEARNING_CLASS_TIME",GetTimeCumulative(TIME_DAYS));
                    }
                    else if(GetLocalInt(oStudent,"TEACHING_COMPLETED"))
                    {
                        // complete your training
                        DeleteSkinInt(oStudent, "LEARNING_CLASS");
                        DeleteSkinInt(oStudent, "LEARNING_CLASS_TIME");
                        GiveClassPrerequisites(oStudent, nClass);

                    }
                    else
                    {
                        // on-going training
                    }
                break;
                case LEARNING_LANGUAGE:
                    nLanguage  = GetLocalInt(oStudent, "TEACHING_LANGUAGE");

                    if(GetLocalInt(oStudent,"TEACHING_NEW"))
                    {
                        // begin your training
                        SetSkinInt(oStudent, "LEARNING_LANGUAGE", nLanguage);
                        SetSkinInt(oStudent, "LEARNING_LANGUAGE_TIME",GetTimeCumulative(TIME_DAYS));
                    }
                    else if(GetLocalInt(oStudent,"TEACHING_COMPLETED"))
                    {
                        // complete your training
                        DeleteSkinInt(oStudent, "LEARNING_LANGUAGE");
                        DeleteSkinInt(oStudent, "LEARNING_LANGUAGE_TIME");
                        SetSpeaksLanguage(oStudent, nLanguage, TRUE);
                        ListKnownLanguages(oStudent);
                        ListKnownLanguagestoDMs(oStudent);
                    }
                    else
                    {
                        // on-going training
                    }

                break;
                default:
                break;
            }

            SetDlgPageString(PAGE_STUDENT_ACCEPT);
        }
        else if(sSelect=="[Decline.]")
        {
            // potential to do more than just end the conversation
            AssignCommand(oStudent, SpeakString("*Declines the lesson.*"));
            EndDlg();
        }
    }
    else if(sPage==PAGE_STUDENT_ACCEPT)
    {
        EndDlg();
    }
}

// MAIN ------------------------------------------------------------------------
void main()
{
    object oSelf    = OBJECT_SELF;

    int iEvent = GetDlgEventType();
    switch( iEvent )
    {
        case DLG_INIT:
            Init();
        break;
        case DLG_PAGE_INIT:
            PageInit();
        break;
        case DLG_SELECTION:
            HandleSelection();
        break;
        case DLG_ABORT:
        case DLG_END:
            // We do the same thing on abort or end
            CleanUp();
        break;
    }
}
