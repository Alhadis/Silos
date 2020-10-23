/*
    Sets up all variable based constants required to adjust skills by class level or from feats
    plus sets armour class dodge bonuses to give the by-level increases
*/

#include "_mdrn_const"
#include "_mdrn_inc_acont"

void main()
{
    object oPC = OBJECT_SELF;

    // Set jump allowances
    if (CRP_ALLOW_JUMPING_BY_DEFAULT==0)
        SetLocalInt(oPC, "JUMP_INVALID", 1);

    // Provide bonuses for Modern feats/skills (set local variables to implement use)
    int nIdx = 0;
    int nS1;
    int nS2;
    int nWealth = 0;
    //reset any existing variables on PC
    while (nIdx < 73)
    {
        SetLocalInt(oPC, "n"+IntToString(nIdx), 0);
        nIdx ++;
    }
    //calculate bonus values adding in new bonus to existing variables and setting new value
    if (GetHasFeat(FEAT_ACROBATIC, oPC))
    {
        nS1 = 47;
        nS2 = 21;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_ANIMALAFFINITY, oPC))
    {
        nS1 = 0;
        nS2 = 71;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_ATHLETIC, oPC))
    {
        nS1 = 27;
        nS2 = 28;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_ATTENTIVE, oPC))
    {
        nS1 = 46;
        nS2 = 66;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_AWARE, oPC))
    {
        nS1 = 6;
        nS2 = 17;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+GetWillSavingThrow(oPC) );
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+GetWillSavingThrow(oPC));
    }
    if (GetHasFeat(FEAT_BONUSCLASSSKILL1, oPC))
    {
        int nCBonus = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)/2;
        nS1 = 24;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
    }
    if (GetHasFeat(FEAT_BONUSCLASSSKILL2, oPC))
    {
        int nCBonus = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)/2;
        nS1 = 45;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
    }
    if (GetHasFeat(FEAT_BUILDER_CHEMICAL, oPC))
    {
        nS1 = 30;
        nS2 = 31;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_BUILDER_MECHANICAL, oPC))
    {
        nS1 = 32;
        nS2 = 34;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_CAUTIOUS, oPC))
    {
        nS1 = 38;
        nS2 = 39;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_CHARM, oPC))
    {
        int nCBonus = GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC)/2;
        nS1 = 11;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);
        nS1 = 23;
        nS2 = 24;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);
        nS1 = 40;
        nS2 = 45;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);
        nS1 = 70;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        if (GetLevelByClass(CLASS_TYPE_OCCULTIST, oPC)>0)
        {
            nS1 = 19;
            SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        }
    }
    if (GetHasFeat(FEAT_CONCEALMOTIVE, oPC))
    {
        int nCBonus = GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC);
        nS1 = 23;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);
        nS2 = 24;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);
    }
    if (GetHasFeat(FEAT_CONFIDENT, oPC))
    {
        nS1 = 44;
        nS2 = 24;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_CREATIVE, oPC))
    {
        nS1 = 11;
        nS2 = 35;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS2 = 36;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_DECEPTIVE, oPC))
    {
        nS1 = 23;
        nS2 = 40;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_DEFENSIVESTRIKE, oPC))
    {
        nS1 = 10;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4 );
    }
    if (GetHasFeat(FEAT_EDUCATED, oPC))
    {
        nS1 = 49;
        nS2 = 50;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 51;
        nS2 = 52;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 54;
        nS2 = 55;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 56;
        nS2 = 59;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 60;
        nS2 = 61;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_FASTTALK, oPC))
    {
        int nFBonus = GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC);
        nS1 = 23;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nFBonus/2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nFBonus/2);
        nS1 = 44;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nFBonus/2);
    }
    if (GetHasFeat(FEAT_FOCUSED, oPC))
    {
        nS1 = 1;
        nS2 = 27;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_GEARHEAD, oPC))
    {
        nS1 = 29;
        nS2 = 64;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_GUIDE, oPC))
    {
        nS1 = 62;
        nS2 = 68;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_HEALINGKNACK , oPC))
    {
        nS1 = 4;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
    }
    if (GetHasFeat(FEAT_JURYRIG, oPC))
    {
        int nJBonus = 2;
        if (GetHasFeat(FEAT_IMPROVEDJURYRIG, oPC)>=7) nJBonus = 4;
        nS1 = 64;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nJBonus);
    }
    if (GetHasFeat(FEAT_MEDICAL_EXPERT, oPC))
    {
        nS1 = 33;
        nS2 = 4;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_MEDICALMASTERY, oPC))
    {
        nS1 = 33;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4);
    }
    if (GetHasFeat(FEAT_MEDICALSPECIALIST1, oPC))
    {
        nS1 = 4;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
    }
    if (GetHasFeat(FEAT_MEDICALSPECIALIST2, oPC))
    {
        nS1 = 4;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
    }
    if (GetHasFeat(FEAT_MEDICALSPECIALIST3, oPC))
    {
        nS1 = 4;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+3);
    }
    if (GetHasFeat(FEAT_METICULOUS, oPC))
    {
        nS1 = 43;
        nS2 = 14;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_NIMBLE, oPC))
    {
        nS1 = 42;
        nS2 = 67;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_NIPUP, oPC))
    {
        nS1 = 3;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4 );
    }
    if (GetHasFeat(FEAT_SAVANT, oPC))
    {
        nS1 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+GetLevelByClass(CLASS_TYPE_SMART, oPC) );
    }
    if (GetHasFeat(FEAT_SKILLEMPHASIS, oPC))
    {
        nS1 = 66;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+3);
    }
    if (GetHasFeat(FEAT_SKILLMASTERY2, oPC))
    {
        nS1 = 29;
        nS2 = 31;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 38;
        nS2 = 46;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 56;
        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
    }
    if (GetHasFeat(FEAT_SKILLMASTERY1, oPC))
    {
        nS1 = 27;
        nS2 = 28;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 39;
        nS2 = 40;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 21;
        nS2 = 47;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
    }
    if (GetHasFeat(FEAT_STUDIOUS, oPC))
    {
        nS1 = 37;
        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_TRUSTWORTHY, oPC))
    {
        nS1 = 12;
        nS2 = 45;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_UNLIMITEDACCESS, oPC))
    {
        int nCBonus = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)/2;
        nS1 = 23;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);
    }
    if (GetHasFeat(FEAT_VEHICLE_EXPERT, oPC))
    {
        nS1 = 41;
        nS2 = 63;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
    }
    if (GetHasFeat(FEAT_WINDFALL, oPC))
    {
        nS1 = 69;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1 );
    }
    if (GetHasFeat(FEAT_WITHOUTTRACE, oPC))
    {
        nS1 = 5;
        nS2 = 8;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+4);
        nS1 = 42;
        nS2 = 67;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+4);
    }
    //occupation feat bonuses
    if (GetHasFeat(OCCU_ACADEMIC, oPC))
    {
        nS1 = 29;
        nS2 = 37;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 3;
    }
    if (GetHasFeat(OCCU_ADVENTURER, oPC))
    {
        nS1 = 47;
        nS2 = 68;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 1;
    }
    if (GetHasFeat(OCCU_ATHLETE, oPC))
    {
        nS1 = 21;
        nS2 = 27;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 28;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 1;
    }
    if (GetHasFeat(OCCU_BLUECOLLAR, oPC))
    {
        nS1 = 34;
        nS2 = 41;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 64;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 2;
    }
    if (GetHasFeat(OCCU_CELEBRITY, oPC))
    {
        nS1 = 23;
        nS2 = 40;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 11;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 4;
    }
    if (GetHasFeat(OCCU_CREATIVE, oPC))
    {
        nS1 = 11;
        nS2 = 35;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 36;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 2;
    }
    if (GetHasFeat(OCCU_CRIMINAL, oPC))
    {
        nS1 = 43;
        nS2 = 58;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 1;
    }
    if (GetHasFeat(OCCU_DILETTANTE, oPC))
    {
        nS1 = 44;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        nWealth = nWealth + 6;
    }
    if (GetHasFeat(OCCU_DOCTOR, oPC))
    {
        nS1 = 4;
        nS2 = 33;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 4;
    }
    if (GetHasFeat(OCCU_EMERGENCYSERVICES, oPC))
    {
        nS1 = 4;
        nS2 = 41;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 2;
    }
    if (GetHasFeat(OCCU_ENTREPRENEUR, oPC))
    {
        nS1 = 23;
        nS2 = 51;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 4;
    }
    if (GetHasFeat(OCCU_INVESTIGATIVE, oPC))
    {
        nS1 = 45;
        nS2 = 46;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 2;
    }
    if (GetHasFeat(OCCU_LAWENFORCEMENT, oPC))
    {
        nS1 = 24;
        nS2 = 45;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 1;
    }
    if (GetHasFeat(OCCU_MILITARY, oPC))
    {
        nS1 = 38;
        nS2 = 62;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 1;
    }
    if (GetHasFeat(OCCU_RELIGIOUS, oPC))
    {
        nS1 = 37;
        nS2 = 61;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 66;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 2;
    }
    if (GetHasFeat(OCCU_RURAL, oPC))
    {
        nS1 = 68;
        nS2 = 70;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 1;
    }
    if (GetHasFeat(OCCU_STUDENT, oPC))
    {
        nS1 = 29;
        nS2 = 55;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 1;
    }
    if (GetHasFeat(OCCU_TECHNICIAN, oPC))
    {
        nS1 = 29;
        nS2 = 64;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 3;
    }
    if (GetHasFeat(OCCU_WHITECOLLAR, oPC))
    {
        nS1 = 29;
        nS2 = 52;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nWealth = nWealth + 3;
    }
    //remove existing effects from this process
    effect eRem = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRem))
    {
        if (GetEffectCreator(eRem)==OBJECT_SELF)
        {
            if (GetEffectType(eRem)==EFFECT_TYPE_SKILL_INCREASE ||
                GetEffectType(eRem)==EFFECT_TYPE_MOVEMENT_SPEED_INCREASE ||
                GetEffectType(eRem)==EFFECT_TYPE_DAMAGE_INCREASE ||
                GetEffectType(eRem)==EFFECT_TYPE_AC_INCREASE ||
                GetEffectType(eRem)==EFFECT_TYPE_SAVING_THROW_INCREASE)
            {
                RemoveEffect(oPC, eRem);
            }
        }
        eRem = GetNextEffect(oPC);
    }

    //apply calculated feat based skill bonuses from variables
    nIdx = 0;
    while (nIdx < 73)
    {
        if (GetLocalInt(oPC, "n"+IntToString(nIdx))>0)
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(nIdx, GetLocalInt(oPC, "n"+IntToString(nIdx))), oPC);
        nIdx ++;
    }

    //apply feat based DR
    if (GetHasFeat(FEAT_DAMAGEREDUCTION1, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageReduction(1, DAMAGE_POWER_PLUS_TWENTY), oPC);
    }
    if (GetHasFeat(FEAT_DAMAGEREDUCTION2, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageReduction(2, DAMAGE_POWER_PLUS_TWENTY), oPC);
    }
    if (GetHasFeat(FEAT_DAMAGEREDUCTION3, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageReduction(3, DAMAGE_POWER_PLUS_TWENTY), oPC);
    }

    //apply damage for unarmed fighting from feats
    if (GetHasFeat(FEAT_LIVINGWEAPON, oPC) || GetHasFeat(FEAT_MELEESMASH, oPC) || GetHasFeat(FEAT_IMPROVEDMELEESMASH, oPC) || GetHasFeat(FEAT_ADVANCEDMELEESMASH, oPC))
    {
        DelayCommand(2.0, ExecuteScript("_mdrn_exe_livwea", oPC));
    }

    //Apply speed increases
    if (GetHasFeat(FEAT_RUN, oPC) || GetHasFeat(FEAT_INCREASEDSPEED, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedIncrease(20), oPC);
    }
    if (GetHasFeat(FEAT_RUN, oPC) && GetHasFeat(FEAT_INCREASEDSPEED, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedIncrease(40), oPC);
    }

    //apply saving throw increases
    if (GetHasFeat(FEAT_ENDURANCE, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSavingThrowIncrease(SAVING_THROW_FORT,2), oPC);
    }

    //perform and apply Wealth calculations
    if (GetHasFeat(FEAT_WINDFALL, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_windfallw")))
    {
        nWealth = nWealth + 3;
        CreateItemOnObject("_mdrn_windfallw", oPC);
    }
    if (GetHasFeat(FEAT_MINORBREAKTHROUGH, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_minw")))
    {
        nWealth = nWealth + 3;
        CreateItemOnObject("_mdrn_ot_minw", oPC);
    }
    if (GetHasFeat(FEAT_MAJORBREAKTHROUGH, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_majw")))
    {
        nWealth = nWealth + 3;
        CreateItemOnObject("_mdrn_ot_majw", oPC);
    }
    if (GetHasFeat(FEAT_ROYALTY1, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_royw1")))
    {
        nWealth = nWealth + 4;
        CreateItemOnObject("_mdrn_ot_royw1", oPC);
    }
    if (GetHasFeat(FEAT_ROYALTY2, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_royw2")))
    {
        nWealth = nWealth + 4;
        CreateItemOnObject("_mdrn_ot_royw2", oPC);
    }
    SetLocalInt(oPC, "nWealth", nWealth);

     //Calculate and apply defense AC bonus
    int nDefense = 0;
    int nAdd = 0;
    int nClass = GetLevelByClass(CLASS_TYPE_DEDICATED, oPC);
    if (nClass > 0)
        nAdd ++;
    if (nClass > 1)
        nAdd ++;
    if (nClass > 3)
        nAdd ++;
    if (nClass > 6)
        nAdd ++;
    if (nClass > 8)
        nAdd ++;
    nClass = GetLevelByClass(CLASS_TYPE_STRONG, oPC);
    if (nClass > 0)
        nAdd ++;
    if (nClass > 1)
        nAdd ++;
    if (nClass > 3)
        nAdd ++;
    if (nClass > 6)
        nAdd ++;
    if (nClass > 8)
        nAdd ++;
    nClass = GetLevelByClass(CLASS_TYPE_TOUGH, oPC);
    if (nClass > 0)
        nAdd ++;
    if (nClass > 1)
        nAdd ++;
    if (nClass > 3)
        nAdd ++;
    if (nClass > 6)
        nAdd ++;
    if (nClass > 8)
        nAdd ++;
    if (GetLevelByClass(CLASS_TYPE_FAST, oPC) > 0)
        nAdd = nAdd + GetLevelByClass(CLASS_TYPE_FAST, oPC)/2+3;
    if (GetLevelByClass(CLASS_TYPE_SMART, oPC) > 1)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_SMART, oPC)-1)/3;
    if (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC) > 1)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC)-1)/3;
    nClass = GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC);
    if (nClass > 0)
        nAdd ++;
    if (nClass > 1)
        nAdd ++;
    if (nClass > 3)
        nAdd ++;
    if (nClass > 4)
        nAdd ++;
    if (nClass > 6)
        nAdd ++;
    if (nClass > 7)
        nAdd ++;
    if (nClass > 9)
        nAdd ++;
    if (GetLevelByClass(CLASS_TYPE_GUNSLINGER, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_GUNSLINGER, oPC)-1)/2+1;
    nClass = GetLevelByClass(CLASS_TYPE_INFILTRATOR, oPC);
    if (nClass > 0)
        nAdd ++;
    if (nClass > 1)
        nAdd ++;
    if (nClass > 3)
        nAdd ++;
    if (nClass > 4)
        nAdd ++;
    if (nClass > 6)
        nAdd ++;
    if (nClass > 7)
        nAdd ++;
    if (nClass > 9)
        nAdd ++;
    nClass = GetLevelByClass(CLASS_TYPE_DAREDEVIL, oPC);
    if (nClass > 0)
        nAdd ++;
    if (nClass > 1)
        nAdd ++;
    if (nClass > 3)
        nAdd ++;
    if (nClass > 4)
        nAdd ++;
    if (nClass > 6)
        nAdd ++;
    if (nClass > 7)
        nAdd ++;
    if (nClass > 9)
        nAdd ++;
    if (GetLevelByClass(CLASS_TYPE_BODYGUARD, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_BODYGUARD, oPC)-1)/2+1;
    if (GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC) > 1)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC)-1)/3;
    if (GetLevelByClass(CLASS_TYPE_TECHIE, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_TECHIE, oPC)-1)/2+1;
    if (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC)-1)/2+1;
    if (GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC) > 1)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)-1)/3;
    if (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC) > 1)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC)-1)/3;
    if (GetLevelByClass(CLASS_TYPE_INVESTIGATOR, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_INVESTIGATOR, oPC)-1)/2+1;
    if (GetLevelByClass(CLASS_TYPE_MAGE, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_MAGE, oPC)-1)/2+1;
    if (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC)-1)/2+1;
    if (GetLevelByClass(CLASS_TYPE_SHADOW_SLAYER, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_SHADOW_SLAYER, oPC)-1)/2+1;
    if (GetLevelByClass(CLASS_TYPE_OCCULTIST, oPC) > 1)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_OCCULTIST, oPC)-1)/3;
    if (GetLevelByClass(CLASS_TYPE_TELEPATH, oPC) > 1)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_TELEPATH, oPC)-1)/3;
    nClass = GetLevelByClass(CLASS_TYPE_BATTLE_MIND, oPC);
    if (nClass > 0)
        nAdd ++;
    if (nClass > 1)
        nAdd ++;
    if (nClass > 3)
        nAdd ++;
    if (nClass > 4)
        nAdd ++;
    if (nClass > 6)
        nAdd ++;
    if (nClass > 7)
        nAdd ++;
    if (nClass > 9)
        nAdd ++;
    nDefense = nDefense + nAdd;
    if (GetHasFeat(FEAT_SMARTDEFENSE, oPC))
    {
        nDefense = nDefense + GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    }
    SendMessageToPC(oPC, "Defense bonus to AC: "+IntToString(nDefense));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectACIncrease(nDefense), oPC);

    //Calculate and apply reputation bonus
    int nReputation = 0;
    nAdd = (GetLevelByClass(CLASS_TYPE_STRONG, oPC)-1)/4;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_FAST, oPC)/3;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_TOUGH, oPC)/3;
    if (GetLevelByClass(CLASS_TYPE_SMART, oPC) > 0)
        nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_SMART, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_DEDICATED, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_DEDICATED, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_SOLDIER, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_SOLDIER, oPC)-1)/4;
    if (GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC)-1)/4;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_GUNSLINGER, oPC)/3;
    if (GetLevelByClass(CLASS_TYPE_INFILTRATOR, oPC) > 0)
        nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_INFILTRATOR, oPC)-1)/3+1;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_DAREDEVIL, oPC)/3;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_BODYGUARD, oPC)/3;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC)/3;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_TECHIE, oPC)/3;
    if (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC) > 0)
        nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_INVESTIGATOR, oPC) > 0)
        nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_INVESTIGATOR, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC) > 0)
        nAdd = nAdd +  2*((GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)-1)/3+1);
    if (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC) > 0)
        nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_MAGE, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_MAGE, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC) > 0)
        nAdd = nAdd +  2*((GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC)-1)/3+1);
    if (GetLevelByClass(CLASS_TYPE_SHADOW_SLAYER, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_SHADOW_SLAYER, oPC)-1)/4;
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_OCCULTIST, oPC)/3;
    if (GetLevelByClass(CLASS_TYPE_TELEPATH, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_TELEPATH, oPC)-1)/3+1;
    if (GetLevelByClass(CLASS_TYPE_BATTLE_MIND, oPC) > 0)
        nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_BATTLE_MIND, oPC)-1)/4;
    if (GetHasFeat(FEAT_LOW_PROFILE, oPC))
        nReputation = nReputation - 3;
    nReputation = nReputation + nAdd;
    if (GetHasFeat(FEAT_RENOWN, oPC))
        nReputation = nReputation + 3;
    if (GetHasFeat(OCCU_CELEBRITY, oPC))
        nReputation = nReputation +1;
    if (GetHasFeat(OCCU_DILETTANTE, oPC))
        nReputation = nReputation +1;
    if (GetHasFeat(OCCU_ENTREPRENEUR, oPC))
        nReputation = nReputation +1;
    if (GetHasFeat(FEAT_MINORBREAKTHROUGH, oPC))
        nReputation = nReputation + 2;
    if (GetHasFeat(FEAT_MAJORBREAKTHROUGH, oPC))
        nReputation = nReputation + 2;
    SetLocalInt(oPC, "nReputation", nReputation);

    //set psionic powerpoints
    nClass = GetLevelByClass(CLASS_TYPE_TELEPATH, oPC);
    if (nClass>9) nAdd = 43;
    else if (nClass=9) nAdd = 34;
    else if (nClass=8) nAdd = 27;
    else if (nClass=7) nAdd = 20;
    else if (nClass=6) nAdd = 15;
    else if (nClass=5) nAdd = 10;
    else if (nClass=4) nAdd = 7;
    else nAdd = nClass + 1;
    int nPoints = nAdd;
    if (nClass > 0)
        nPoints = nPoints + abs((GetAbilityModifier(ABILITY_CHARISMA, oPC)/2 * 2 -11));
    nClass = GetLevelByClass(CLASS_TYPE_BATTLE_MIND, oPC);
    if (nClass>=9) nAdd = 26;
    else if (nClass=8) nAdd = 21;
    else if (nClass=7) nAdd = 16;
    else if (nClass=6) nAdd = 11;
    else if (nClass=5) nAdd = 8;
    else nAdd = nClass + 1;
    nPoints = nPoints + nAdd;
    SetLocalInt(oPC, "nPowerPoints", nPoints);
    //set wildtalent max
    SetLocalInt(oPC, "nWTPoints", 3);

    // Start another supers section
    object oEnhance = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oEnhance))
    {
        if (GetTag(oEnhance)=="_super_power")
            ExecuteScript("_super_enhance", oEnhance);
        oEnhance = GetNextItemInInventory(oPC);
    }
    // End another Supers section
}
