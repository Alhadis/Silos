/*******************************************************************************
 * Name: silvy_univ_func
 * Type: Silverymoon Function Definition File
 * ---
 * Author: Cereborn
 * Date: 12/02/03
 * ---
 * Contains functions definitions for use in the Silverymoon University System
 *
 ******************************************************************************/


//- Function Definitions -

#include "acr_xp_i"
#include "acr_db_persist_i"
#include "silvy_univ_inc"

void SetSilvyUniversitySchool(int nSchool, object oProfessor=OBJECT_SELF)
{
    SetLocalInt(oProfessor, SilvyUniversitySchoolVarName, nSchool);
}

void SetSilvyUniversityCourse(string sCourseName, int nCourseLevel, int nFee,
    string sQuestDialog, int nXP,  int nHour, string sScroll, int nDC=0,
    object oProfessor=OBJECT_SELF)
{
    switch (nCourseLevel)
    {
    case 100:
        SetLocalString(oProfessor, SilvyUniversityName100VarName, sCourseName);
        SetLocalInt(oProfessor, SilvyUniversityFee100VarName, nFee);
        SetLocalString(oProfessor, SilvyUniversityDlog100VarName, sQuestDialog);
        SetLocalString(oProfessor, SilvyUniversityScroll100VarName, sScroll);
        SetLocalInt(oProfessor, SilvyUniversityXP100VarName, nXP);
        SetLocalInt(oProfessor, SilvyUniversityDC100VarName, nDC);
        break;

    case 200:
        SetLocalString(oProfessor, SilvyUniversityName200VarName, sCourseName);
        SetLocalInt(oProfessor, SilvyUniversityFee200VarName, nFee);
        SetLocalString(oProfessor, SilvyUniversityDlog200VarName, sQuestDialog);
        SetLocalString(oProfessor, SilvyUniversityScroll200VarName, sScroll);
        SetLocalInt(oProfessor, SilvyUniversityXP200VarName, nXP);
        SetLocalInt(oProfessor, SilvyUniversityDC200VarName, nDC);
        break;

    case 300:
        SetLocalString(oProfessor, SilvyUniversityName300VarName, sCourseName);
        SetLocalInt(oProfessor, SilvyUniversityFee300VarName, nFee);
        SetLocalString(oProfessor, SilvyUniversityDlog300VarName, sQuestDialog);
        SetLocalString(oProfessor, SilvyUniversityScroll300VarName, sScroll);
        SetLocalInt(oProfessor, SilvyUniversityXP300VarName, nXP);
        SetLocalInt(oProfessor, SilvyUniversityDC300VarName, nDC);
        break;

    case 400:
        SetLocalString(oProfessor, SilvyUniversityName400VarName, sCourseName);
        SetLocalInt(oProfessor, SilvyUniversityFee400VarName, nFee);
        SetLocalString(oProfessor, SilvyUniversityDlog400VarName, sQuestDialog);
        SetLocalString(oProfessor, SilvyUniversityScroll400VarName, sScroll);
        SetLocalInt(oProfessor, SilvyUniversityXP400VarName, nXP);
        SetLocalInt(oProfessor, SilvyUniversityDC400VarName, nDC);
        break;
    case 500:
        SetLocalString(oProfessor, SilvyUniversityName500VarName, sCourseName);
        SetLocalInt(oProfessor, SilvyUniversityFee500VarName, nFee);
        SetLocalString(oProfessor, SilvyUniversityDlog500VarName, sQuestDialog);
        SetLocalString(oProfessor, SilvyUniversityScroll500VarName, sScroll);
        SetLocalInt(oProfessor, SilvyUniversityXP500VarName, nXP);
        SetLocalInt(oProfessor, SilvyUniversityDC500VarName, nDC);
        break;
    }
}

void SetSilvyUniversityFinal(int nFee, int nDC, int nXP, int nHour, string sScroll,
   object oProfessor=OBJECT_SELF)
{
    SetSilvyUniversityCourse(SilvyUniversityFinalExam,
        SilvyUniversityGraduateLvl, nFee, "", nXP, nHour, sScroll, nDC, oProfessor);
}

void EnrollSilvyUniversityStudent(object oStudent)
{
    TakeGoldFromCreature(SilvyUniversityTuition, oStudent, TRUE);
    CreateItemOnObject(SilvyUniversityCodeOfConductItem, oStudent);
    CreateItemOnObject(SilvyUniversityStudentIDItem, oStudent);
    ACR_SetPersistentInt(oStudent, SilvyUniversityEnrolledVarName,1, 0);
}

void RegisterSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo)
{
    switch (sInfo.nSchool)
    {
    case SilvyUniversitySchoolAbjuration:
        ACR_SetPersistentInt(oStudent,SilvyUniversityAbjurationLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent,SilvyUniversityAbjurationCourseVarName, sInfo.sCourseName, 0);

        break;

    case SilvyUniversitySchoolConjuration:
        ACR_SetPersistentInt(oStudent,SilvyUniversityConjurationLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent, SilvyUniversityConjurationCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolDivination:
        ACR_SetPersistentInt(oStudent,SilvyUniversityDivinationLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent,SilvyUniversityDivinationCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolEnchantment:
        ACR_SetPersistentInt(oStudent,SilvyUniversityEnchantmentLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent, SilvyUniversityEnchantmentCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolEvocation:
        ACR_SetPersistentInt(oStudent, SilvyUniversityEvocationLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent,SilvyUniversityEvocationCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolIllusion:
        ACR_SetPersistentInt(oStudent, SilvyUniversityIllusionLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent, SilvyUniversityIllusionCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolNecromancy:
        ACR_SetPersistentInt(oStudent, SilvyUniversityNecromancyLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent,SilvyUniversityNecromancyCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolTransmutation:
        ACR_SetPersistentInt(oStudent,SilvyUniversityTransmutationLvlVarName, sInfo.nCourseLevel, 0);
        ACR_SetPersistentString(oStudent, SilvyUniversityTransmutationCourseVarName, sInfo.sCourseName, 0);


        break;
    }
}



void AdvanceSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo)
{
    switch (sInfo.nSchool)
    {
    case SilvyUniversitySchoolAbjuration:
        ACR_SetPersistentString(oStudent,SilvyUniversityAbjurationCourseVarName, SilvyUniversityCourseComplete,0);

        break;

    case SilvyUniversitySchoolConjuration:
        ACR_SetPersistentString(oStudent,SilvyUniversityConjurationCourseVarName, SilvyUniversityCourseComplete,0);
        break;

    case SilvyUniversitySchoolDivination:
        ACR_SetPersistentString(oStudent,SilvyUniversityDivinationCourseVarName, SilvyUniversityCourseComplete,0);
        break;

    case SilvyUniversitySchoolEnchantment:
        ACR_SetPersistentString(oStudent,SilvyUniversityEnchantmentCourseVarName, SilvyUniversityCourseComplete, 0);
        break;

    case SilvyUniversitySchoolEvocation:
        ACR_SetPersistentString(oStudent,SilvyUniversityEvocationCourseVarName, SilvyUniversityCourseComplete,0);
        break;

    case SilvyUniversitySchoolIllusion:
        ACR_SetPersistentString(oStudent,SilvyUniversityIllusionCourseVarName, SilvyUniversityCourseComplete,0);
        break;

    case SilvyUniversitySchoolNecromancy:
        ACR_SetPersistentString(oStudent, SilvyUniversityNecromancyCourseVarName, SilvyUniversityCourseComplete,0);
        break;

    case SilvyUniversitySchoolTransmutation:
        ACR_SetPersistentString(oStudent, SilvyUniversityTransmutationCourseVarName, SilvyUniversityCourseComplete, 0);

        break;
    }



   //  Award XP 
   // ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, sInfo.nXP);
	}


void UnadvanceSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo)
{   switch (sInfo.nSchool)
    {
    case SilvyUniversitySchoolAbjuration:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityAbjurationCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent,SilvyUniversityAbjurationCourseVarName, sInfo.sCourseName,0);
        break;

    case SilvyUniversitySchoolConjuration:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityConjurationCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent,SilvyUniversityConjurationCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolDivination:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityDivinationCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent,SilvyUniversityDivinationCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolEnchantment:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityEnchantmentCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent, SilvyUniversityEnchantmentCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolEvocation:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityEvocationCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent,SilvyUniversityEvocationCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolIllusion:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityIllusionCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent,SilvyUniversityIllusionCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolNecromancy:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityNecromancyCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent, SilvyUniversityNecromancyCourseVarName, sInfo.sCourseName, 0);
        break;

    case SilvyUniversitySchoolTransmutation:
        if(ACR_GetPersistentString(oStudent,
           SilvyUniversityTransmutationCourseVarName) == SilvyUniversityCourseComplete)

        {ACR_AwardStaticQuestXP(oStudent, sInfo.sCourseName, -1 * sInfo.nXP);
	     }
        {}

        ACR_SetPersistentString(oStudent,SilvyUniversityTransmutationCourseVarName, sInfo.sCourseName, 0);

        break;
    }

}


void GraduateSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo)
{

    AdvanceSilvyUniversityStudent(oStudent, sInfo);

    switch (sInfo.nSchool)
    {
    case SilvyUniversitySchoolAbjuration:
        CreateItemOnObject(SilvyUniversityAbjurationDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent,SilvyUniversityAbjurationLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;

    case SilvyUniversitySchoolConjuration:
        CreateItemOnObject(SilvyUniversityConjurationDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent,SilvyUniversityConjurationLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;

    case SilvyUniversitySchoolDivination:
        CreateItemOnObject(SilvyUniversityDivinationDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent, SilvyUniversityDivinationLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;

    case SilvyUniversitySchoolEnchantment:
        CreateItemOnObject(SilvyUniversityEnchantmentDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent,SilvyUniversityEnchantmentLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;

    case SilvyUniversitySchoolEvocation:
        CreateItemOnObject(SilvyUniversityEvocationDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent,SilvyUniversityEvocationLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;

    case SilvyUniversitySchoolIllusion:
        CreateItemOnObject(SilvyUniversityIllusionDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent,SilvyUniversityIllusionLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;

    case SilvyUniversitySchoolNecromancy:
        CreateItemOnObject(SilvyUniversityNecromancyDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent,SilvyUniversityNecromancyLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;

    case SilvyUniversitySchoolTransmutation:
        CreateItemOnObject(SilvyUniversityTransmutationDiplomaItem, oStudent);
        ACR_SetPersistentInt(oStudent,SilvyUniversityTransmutationLvlVarName, SilvyUniversityGraduateLvl, 0);
        break;
    }
}

int GetSilvyUniversitySchoolLevel(object oStudent, int nSchool)
{
    int nRetVal = 0;

    switch (nSchool)
    {
    case SilvyUniversitySchoolAbjuration:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityAbjurationLvlVarName);
        break;

    case SilvyUniversitySchoolConjuration:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityConjurationLvlVarName);
        break;

    case SilvyUniversitySchoolDivination:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityDivinationLvlVarName);
        break;

    case SilvyUniversitySchoolEnchantment:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityEnchantmentLvlVarName);
        break;

    case SilvyUniversitySchoolEvocation:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityEvocationLvlVarName);
        break;

    case SilvyUniversitySchoolIllusion:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityIllusionLvlVarName);
        break;

    case SilvyUniversitySchoolNecromancy:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityNecromancyLvlVarName);
        break;

    case SilvyUniversitySchoolTransmutation:
        nRetVal = ACR_GetPersistentInt(oStudent,
             SilvyUniversityTransmutationLvlVarName);
        break;
    }

    return nRetVal;
}

string GetSilvyUniversityCurrentSchoolRegistration(object oStudent, int nSchool)
{
    string sRetVal = "";

    switch (nSchool)
    {
    case SilvyUniversitySchoolAbjuration:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityAbjurationCourseVarName);
        break;

    case SilvyUniversitySchoolConjuration:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityConjurationCourseVarName);
        break;

    case SilvyUniversitySchoolDivination:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityDivinationCourseVarName);
        break;

    case SilvyUniversitySchoolEnchantment:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityEnchantmentCourseVarName);
        break;

    case SilvyUniversitySchoolEvocation:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityEvocationCourseVarName);
        break;

    case SilvyUniversitySchoolIllusion:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityIllusionCourseVarName);
        break;

    case SilvyUniversitySchoolNecromancy:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityNecromancyCourseVarName);
        break;

    case SilvyUniversitySchoolTransmutation:
        sRetVal = ACR_GetPersistentString(oStudent,
             SilvyUniversityTransmutationCourseVarName);
        break;
    }

    return sRetVal;
}

int GetSilvyUniversitySchool(object oProfessor=OBJECT_SELF)
{
    int nSchool;

    nSchool = GetLocalInt(oProfessor, SilvyUniversitySchoolVarName);
    return nSchool;
}

int IsStudentEnrolledInSilvyUniversity(object oStudent)
{
    int nRetVal = 0;
    nRetVal = ACR_GetPersistentInt(oStudent,
        SilvyUniversityEnrolledVarName);

    return nRetVal;
}

struct SilvyUniversityCourseInfo GetSilvyUniversityCourse(int nCourseLevel,
    object oProfessor=OBJECT_SELF)
{
    struct SilvyUniversityCourseInfo sInfo;
    sInfo.nCourseLevel = nCourseLevel;
    sInfo.nSchool = GetSilvyUniversitySchool(oProfessor);

    switch (nCourseLevel)
    {
    case 100:
        sInfo.sCourseName = GetLocalString(oProfessor,
            SilvyUniversityName100VarName);
        sInfo.sQuestDialog = GetLocalString(oProfessor,
            SilvyUniversityDlog100VarName);
        sInfo.sScroll =GetLocalString(oProfessor,
            SilvyUniversityScroll100VarName);
        sInfo.nFee = GetLocalInt(oProfessor, SilvyUniversityFee100VarName);
        sInfo.nDC = GetLocalInt(oProfessor, SilvyUniversityDC100VarName);
        sInfo.nXP = GetLocalInt(oProfessor, SilvyUniversityXP100VarName);
        break;

    case 200:
        sInfo.sCourseName = GetLocalString(oProfessor,
            SilvyUniversityName200VarName);
        sInfo.sQuestDialog = GetLocalString(oProfessor,
            SilvyUniversityDlog200VarName);
        sInfo.sScroll =GetLocalString(oProfessor,
            SilvyUniversityScroll200VarName);
        sInfo.nFee = GetLocalInt(oProfessor, SilvyUniversityFee200VarName);
        sInfo.nDC = GetLocalInt(oProfessor, SilvyUniversityDC200VarName);
        sInfo.nXP = GetLocalInt(oProfessor, SilvyUniversityXP200VarName);
        break;

    case 300:
        sInfo.sCourseName = GetLocalString(oProfessor,
            SilvyUniversityName300VarName);
        sInfo.sQuestDialog = GetLocalString(oProfessor,
            SilvyUniversityDlog300VarName);
        sInfo.sScroll =GetLocalString(oProfessor,
            SilvyUniversityScroll300VarName);
        sInfo.nFee = GetLocalInt(oProfessor, SilvyUniversityFee300VarName);
        sInfo.nDC = GetLocalInt(oProfessor, SilvyUniversityDC300VarName);
        sInfo.nXP = GetLocalInt(oProfessor, SilvyUniversityXP300VarName);
        break;

    case 400:
        sInfo.sCourseName = GetLocalString(oProfessor,
            SilvyUniversityName400VarName);
        sInfo.sQuestDialog = GetLocalString(oProfessor,
            SilvyUniversityDlog400VarName);
        sInfo.sScroll =GetLocalString(oProfessor,
            SilvyUniversityScroll400VarName);
        sInfo.nFee = GetLocalInt(oProfessor, SilvyUniversityFee400VarName);
        sInfo.nDC = GetLocalInt(oProfessor, SilvyUniversityDC400VarName);
        sInfo.nXP = GetLocalInt(oProfessor, SilvyUniversityXP400VarName);
        break;
    case 500:
        sInfo.sCourseName = GetLocalString(oProfessor,
            SilvyUniversityName500VarName);
        sInfo.sQuestDialog = GetLocalString(oProfessor,
            SilvyUniversityDlog500VarName);
        sInfo.sScroll =GetLocalString(oProfessor,
            SilvyUniversityScroll500VarName);
        sInfo.nFee = GetLocalInt(oProfessor, SilvyUniversityFee500VarName);
        sInfo.nDC = GetLocalInt(oProfessor, SilvyUniversityDC500VarName);
        sInfo.nXP = GetLocalInt(oProfessor, SilvyUniversityXP500VarName);
        break;
    default:
        sInfo.sCourseName = "";
        sInfo.sQuestDialog = "";
        sInfo.sScroll = "";
        sInfo.nFee = 0;
        sInfo.nDC = 0;
        sInfo.nXP = 0;
    }

    return sInfo;
}

struct SilvyUniversityCourseInfo GetSilvyUniversityFinal(
   object oProfessor=OBJECT_SELF)
{
    return GetSilvyUniversityCourse(SilvyUniversityGraduateLvl, oProfessor);
}

string SchoolToString(int nSchool)
{
    switch (nSchool)
    {
    case SilvyUniversitySchoolUndefined:
        return "Undefined";

    case SilvyUniversitySchoolAbjuration:
        return "Abjuration";

    case SilvyUniversitySchoolConjuration:
        return "Conjuration";

    case SilvyUniversitySchoolDivination:
        return "Divination";

    case SilvyUniversitySchoolEnchantment:
        return "Enchantment";

    case SilvyUniversitySchoolEvocation:
        return "Evocation";

    case SilvyUniversitySchoolIllusion:
        return "Illusion";

    case SilvyUniversitySchoolNecromancy:
        return "Necromancy";

    case SilvyUniversitySchoolTransmutation:
        return "Transmutation";
    }

    return "";
}

// Retrieves course info for the course offered by oProfessor at oStudent's
// current level
struct SilvyUniversityCourseInfo GetSilvyUniversityCurrentSchoolCourse(
   object oStudent, object oProfessor)
{
    struct SilvyUniversityCourseInfo sInfo;
    int nSchool = GetSilvyUniversitySchool(oProfessor);
    int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    sInfo = GetSilvyUniversityCourse(nCourseLevel, oProfessor);
    return sInfo;
}

// Retrieves course info for the course offered by oProfessor at oStudent's
// next level
struct SilvyUniversityCourseInfo GetSilvyUniversityNextSchoolCourse(
   object oStudent, object oProfessor)
{
    struct SilvyUniversityCourseInfo sInfo;
    int nSchool = GetSilvyUniversitySchool(oProfessor);
    int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool) + 100;

    sInfo = GetSilvyUniversityCourse(nCourseLevel, oProfessor);

    return sInfo;
}
// Retrieves course info for the course offered by oProfessor at oStudent's
// previous level
struct SilvyUniversityCourseInfo GetSilvyUniversityPreviousSchoolCourse(
   object oStudent, object oProfessor)
{
    struct SilvyUniversityCourseInfo sInfo;
    int nSchool = GetSilvyUniversitySchool(oProfessor);
    int nCourseLevel;

    if(GetLocalInt(oStudent, "HallPass") != 1)
        {nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool) - 100;
        }
        else
        {nCourseLevel = 0;
        }

    sInfo = GetSilvyUniversityCourse(nCourseLevel, oProfessor);

    return sInfo;


}


void SetSilvyUniversityCourseTokens(struct SilvyUniversityCourseInfo sInfo)
{
    SetCustomToken(SilvyUniversityFeeToken, IntToString(sInfo.nFee));
    SetCustomToken(SilvyUniversityCourseNameToken, sInfo.sCourseName);
    SetCustomToken(SilvyUniversitySchoolToken, SchoolToString(sInfo.nSchool));
}

int GetSilvyUniversityMageLevel(object oStudent)
{
    int nMageLevel = GetLevelByClass(CLASS_TYPE_WIZARD, oStudent);
    int nSorcLevel = GetLevelByClass(CLASS_TYPE_SORCERER, oStudent);

    if (nSorcLevel > nMageLevel)
    {
        nMageLevel = nSorcLevel;
    }

    return nMageLevel;
}