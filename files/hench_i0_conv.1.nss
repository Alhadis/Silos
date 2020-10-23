/*

    Henchman Inventory And Battle AI

    This file contains scripts used settings in conversations
*/

// void main() {    }


#include "x0_i0_assoc"


const string sHenchAutoRecoverTraps = "AutoRecoverTraps";
const string sHenchAutoOpenLocks = "AutoOpenLocks";
const string sHenchAutoPickup = "AutoPickup";
const string sHenchAutoOpenChest = "AutoOpenChest";
const string sHenchNoDisarmTraps = "NoDisarmTraps";


const string sHenchStealthMode = "X2_HENCH_STEALTH_MODE";
const string sHenchStopCasting = "X2_L_STOPCASTING";
const string sHenchDisableAutoHide = "HenchDisableAutoHide";

const string sHenchDontSummon = "DontSummon";

const string sHenchFamiliarChallenge = "NewFamiliarChallenge";
const string sHenchFamiliarToDeath = "FamiliarToTheDeath";

const string sHenchAniCompChallenge = "NewAniCompChallenge";
const string sHenchAniCompToDeath = "AniCompToTheDeath";


const string sHenchFamiliarPreStr = "Fam";
const string sHenchAniCompPreStr = "Ani";
const string sHenchSummonPreStr = "Sum";
const string sHenchDominatePreStr = "Dom";


const string sHenchDefSettingsSet = "HENCH_DEF_SETTINGS_SET";


string HenchGetAssocString(int iAssocType)
{
    if (iAssocType == ASSOCIATE_TYPE_FAMILIAR)
    {
        return sHenchFamiliarPreStr;
    }
    else if (iAssocType == ASSOCIATE_TYPE_ANIMALCOMPANION)
    {
        return sHenchAniCompPreStr;
    }
    else if (iAssocType == ASSOCIATE_TYPE_SUMMONED)
    {
        return sHenchSummonPreStr;
    }
    else if (iAssocType == ASSOCIATE_TYPE_DOMINATED)
    {
        return sHenchDominatePreStr;
    }
    return "null";
}


void HenchSetAssociateInt(string sName, int iValue)
{    
    SetLocalInt(OBJECT_SELF, sName, iValue);

    int iAssocType = GetAssociateType(OBJECT_SELF);
    if ((iAssocType == ASSOCIATE_TYPE_NONE) ||
        (iAssocType == ASSOCIATE_TYPE_HENCHMAN))
    {
        return;
    }
    
    SetLocalInt(GetPCSpeaker(), HenchGetAssocString(iAssocType) + sName, iValue);
}


void HenchSetDefSettings()
{
    int iAssocType = GetAssociateType(OBJECT_SELF);
    if ((iAssocType == ASSOCIATE_TYPE_NONE) ||
        (iAssocType == ASSOCIATE_TYPE_HENCHMAN))
    {
        return;
    }

    string preDefStr = HenchGetAssocString(iAssocType);
    object oPC = GetPCSpeaker();    
    
    SetLocalInt(oPC, preDefStr + sAssociateMasterConditionVarname, GetLocalInt(OBJECT_SELF, sAssociateMasterConditionVarname));
    SetLocalInt(oPC, preDefStr + sHenchStealthMode, GetLocalInt(OBJECT_SELF, sHenchStealthMode));
    SetLocalInt(oPC, preDefStr + sHenchStopCasting, GetLocalInt(OBJECT_SELF, sHenchStopCasting));
}



void HenchGetDefSettings()
{    
    if (GetLocalInt(OBJECT_SELF, sHenchDefSettingsSet))
    {
        return;    
    }
    
    SetLocalInt(OBJECT_SELF, sHenchDefSettingsSet, TRUE);
    
    int iAssocType = GetAssociateType(OBJECT_SELF);
    if ((iAssocType == ASSOCIATE_TYPE_NONE) ||
        (iAssocType == ASSOCIATE_TYPE_HENCHMAN))
    {
        return;
    }

    string preDefStr = HenchGetAssocString(iAssocType);
    object oPC = GetMaster();
    if (!GetIsObjectValid(oPC) || !GetIsPC(oPC))
    {
        return;
    }    
    
    object oTarget;
    object oSource;
    string preSrcStr;
        // check if the PC has never had settings copied
        // for associate type
    if (!GetLocalInt(oPC, preDefStr + sHenchDefSettingsSet))
    {
        SetLocalInt(oPC, preDefStr + sHenchDefSettingsSet, TRUE);
        oTarget = oPC;
        oSource = OBJECT_SELF;
        preSrcStr = preDefStr;
        preDefStr = "";        
    }
    else
    {
        oTarget = OBJECT_SELF;
        oSource = oPC;
        preSrcStr = "";
    }
    
    SetLocalInt(OBJECT_SELF, preSrcStr + sAssociateMasterConditionVarname,
        GetLocalInt(oPC, preDefStr + sAssociateMasterConditionVarname));
    SetLocalInt(OBJECT_SELF, preSrcStr + sHenchStealthMode,
        GetLocalInt(oPC, preDefStr + sHenchStealthMode));
    SetLocalInt(OBJECT_SELF, preSrcStr + sHenchStopCasting,
        GetLocalInt(oPC, preDefStr + sHenchStopCasting));
    SetLocalInt(OBJECT_SELF, preSrcStr + sHenchDisableAutoHide,
        GetLocalInt(oPC, preDefStr + sHenchDisableAutoHide));
    if (GetHasSkill(SKILL_DISABLE_TRAP))
    {
        SetLocalInt(OBJECT_SELF, preSrcStr + sHenchNoDisarmTraps,
            GetLocalInt(oPC, preDefStr + sHenchNoDisarmTraps));
        SetLocalInt(OBJECT_SELF, preSrcStr + sHenchAutoRecoverTraps,
            GetLocalInt(oPC, preDefStr + sHenchAutoRecoverTraps));
    }
    if (GetHasSkill(SKILL_OPEN_LOCK))
    {
        SetLocalInt(OBJECT_SELF, preSrcStr + sHenchAutoOpenLocks,
            GetLocalInt(oPC, preDefStr + sHenchAutoOpenLocks));
    }
    SetLocalInt(OBJECT_SELF, preSrcStr + sHenchAutoPickup,
        GetLocalInt(oPC, preDefStr + sHenchAutoPickup));
    if (GetSkillRank(SKILL_SEARCH) * 3 / 4 >= GetHitDice(OBJECT_SELF))
    {
        SetLocalInt(OBJECT_SELF, preSrcStr + sHenchAutoOpenChest,
            GetLocalInt(oPC, preDefStr + sHenchAutoOpenChest));
    }
}


void HenchSetAssociateFlee(float fChallenge, int bFightToDeath)
{
    object oPC = GetPCSpeaker();
    int iAssocType = GetAssociateType(OBJECT_SELF);    
    // Set the variables
    if (iAssocType == ASSOCIATE_TYPE_FAMILIAR)
    {
        SetLocalFloat(oPC, sHenchFamiliarChallenge, fChallenge);
        SetLocalInt(oPC, sHenchFamiliarToDeath, bFightToDeath);
    }
    else if (iAssocType == ASSOCIATE_TYPE_ANIMALCOMPANION)
    {
        SetLocalFloat(oPC, sHenchAniCompChallenge, fChallenge);
        SetLocalInt(oPC, sHenchAniCompToDeath, bFightToDeath);
    }
}

