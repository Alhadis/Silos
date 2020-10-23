//sounds are in a nice shade of blue    100,100,200
//feelings and observations are grey    200,200,200
//smells are in green                   100,200,100

#include "prc_alterations"
#include "inc_utility"

const float SOUND_TEST_DELAY = 60.0;
const string MESSAGE_FLOATING = "Description_Message_Floating";//0 is none, 1 is self, 2 is party
const string MESSAGE_PRIVATE = "Description_Message_Private";//0 is no, 1 is yes

int GetAoEForRadius(float fRadius)
{
    int nAoE;
    if(fRadius <= 5.0)
        nAoE = 190;
    else if(fRadius <= 10.0)
        nAoE = 191;
    else if(fRadius <= 15.0)
        nAoE = 192;
    else if(fRadius <= 20.0)
        nAoE = 193;
    else if(fRadius <= 25.0)
        nAoE = 194;
    else if(fRadius <= 30.0)
        nAoE = 195;
    else if(fRadius <= 35.0)
        nAoE = 196;
    else if(fRadius <= 40.0)
        nAoE = 197;
    else if(fRadius <= 450.0)
        nAoE = 198;
    else
        nAoE = 199;
    return nAoE;

}

object CreateDescriptiveSound(string sResRef, string sDesc, location lSpawn, int nDC = 0, int nOneShot = FALSE, float fRadius = 10.0)
{
DoDebug("CreateDescriptiveSound() running");
    //sounds are in a nice shade of blue
    string sMess = GetRGB(100, 100, 200)+"* You hear: "+sDesc+GetRGB(100, 100, 200)+" *";
    //pick a suitable AoE effect based on radius size
    int nAoE = GetAoEForRadius(fRadius);
    effect eAoE = EffectAreaOfEffect(nAoE, "amb_sound_enter", "amb_sound_hb", "amb_sound_exit");
    //make supernatural so cant be dispelled etc
    eAoE = SupernaturalEffect(eAoE);
    //apply it
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAoE, lSpawn);
    //get the AoE Object we just made
    string sTag = Get2DAString("vfx_persistent", "LABEL", nAoE);
    object oAoE = GetFirstObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    while(GetIsObjectValid(oAoE))
    {
        // Test if we found the correct AoE
        if(GetTag(oAoE) == sTag
            && !GetLocalInt(oAoE, "ParanoiaMarker") // Just in case there are two traps in the almost same location
           )
        {
            SetLocalInt(oAoE, "ParanoiaMarker", TRUE);
            break;
        }
        // Didn't find, get next
        oAoE = GetNextObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
    if(GetIsObjectValid(oAoE))
        DoDebug("oAoE is valid");
    else    
        DoDebug("oAoE is *NOT* valid");
    //set information on the AoE object
    SetLocalInt(oAoE, "SoundDC", nDC);
    SetLocalString(oAoE, "SoundDesc", sDesc);
    SetLocalString(oAoE, "SoundMess", sMess);
    SetLocalString(oAoE, "SoundResRef", sResRef);
    SetLocalInt(oAoE, "SoundOneShot", nOneShot);
    return oAoE;
}

object CreateDescriptiveSmell(string sDesc, location lSpawn, int nDC = 0, int nOneShot = FALSE, float fRadius = 10.0)
{
    //smells are in a nice shade of green
    string sMess = GetRGB(100, 200, 100)+"* You smell: "+sDesc+GetRGB(100, 200, 100)+" *";
    //pick a suitable AoE effect based on radius size
    int nAoE = GetAoEForRadius(fRadius);
    effect eAoE = EffectAreaOfEffect(nAoE, "amb_smell_enter", "amb_smell_hb", "amb_smell_exit");
    //make supernatural so cant be dispelled etc
    eAoE = SupernaturalEffect(eAoE);
    //apply it
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAoE, lSpawn);
    //get the AoE Object we just made
    string sTag = Get2DAString("vfx_persistent", "LABEL", nAoE);
    object oAoE = GetFirstObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    while(GetIsObjectValid(oAoE))
    {
        // Test if we found the correct AoE
        if(GetTag(oAoE) == sTag
            && !GetLocalInt(oAoE, "ParanoiaMarker") // Just in case there are two traps in the almost same location
           )
        {
            SetLocalInt(oAoE, "ParanoiaMarker", TRUE);
            break;
        }
        // Didn't find, get next
        oAoE = GetNextObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
    //set information on the AoE object
    SetLocalInt(oAoE, "SmellDC", nDC);
    SetLocalString(oAoE, "SmellDesc", sDesc);
    SetLocalString(oAoE, "SmellMess", sMess);
    SetLocalInt(oAoE, "SmellOneShot", nOneShot);
    return oAoE;
}

object CreateDescriptiveFeeling(string sDesc, location lSpawn, int nDC = 0, int nOneShot = FALSE, float fRadius = 10.0)
{
    //feelings are in a nice shade of grey
    string sMess = GetRGB(200, 200, 200)+"* You feel: "+sDesc+GetRGB(200, 200, 200)+" *";
    //pick a suitable AoE effect based on radius size
    int nAoE = GetAoEForRadius(fRadius);
    effect eAoE = EffectAreaOfEffect(nAoE, "amb_feel_enter", "amb_feel_hb", "amb_feel_exit");
    //make supernatural so cant be dispelled etc
    eAoE = SupernaturalEffect(eAoE);
    //apply it
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAoE, lSpawn);
    //get the AoE Object we just made
    string sTag = Get2DAString("vfx_persistent", "LABEL", nAoE);
    object oAoE = GetFirstObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    while(GetIsObjectValid(oAoE))
    {
        // Test if we found the correct AoE
        if(GetTag(oAoE) == sTag
            && !GetLocalInt(oAoE, "ParanoiaMarker") // Just in case there are two traps in the almost same location
           )
        {
            SetLocalInt(oAoE, "ParanoiaMarker", TRUE);
            break;
        }
        // Didn't find, get next
        oAoE = GetNextObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
    //set information on the AoE object
    SetLocalInt(oAoE, "FeelDC", nDC);
    SetLocalString(oAoE, "FeelDesc", sDesc);
    SetLocalString(oAoE, "FeelMess", sMess);
    SetLocalInt(oAoE, "FeelOneShot", nOneShot);
    return oAoE;
}

void SendAmbientMessage(object oPC, string sMess, string sDesc, string sVerb)
{
    //henchmen say things
    if(GetIsObjectValid(GetMaster(oPC)))
    {
        //animals dont talk
        //nor oozes
        //nor constructs
        //nor stupid things
        if(GetRacialType(oPC) == RACIAL_TYPE_ANIMAL
            || GetRacialType(oPC) == RACIAL_TYPE_MAGICAL_BEAST
            || GetRacialType(oPC) == RACIAL_TYPE_BEAST
            || GetRacialType(oPC) == RACIAL_TYPE_OOZE
            || GetRacialType(oPC) == RACIAL_TYPE_CONSTRUCT
            || GetAbilityScore(oPC, ABILITY_INTELLIGENCE) <= 3)
        {
            object oMaster = GetMaster(oPC);
            object oTest = oMaster;
            while(GetIsObjectValid(oMaster))
            {
                oTest = oMaster;
                oMaster = GetMaster(oTest);
            }
            //light grey color
            sMess = GetRGB(200, 200, 200)+"You notice that "+GetName(oPC)+" looks uncomfortable.";
            //players dont, they can talk to each other
            //DEBUGif(GetLocalInt(oPC, MESSAGE_FLOATING))
                FloatingTextStringOnCreature(sMess, oMaster, FALSE);
            //some people may like a PM instead
            //DEBUGif(GetLocalInt(oPC, MESSAGE_PRIVATE))
                SendMessageToPC(oMaster, sMess);
        }
        SpeakString("Wait, I "+sVerb+" "+sDesc+".");
    }
    else
    {
        //DEBUGif(GetLocalInt(oPC, MESSAGE_FLOATING) == 1)
        //DEBUG    FloatingTextStringOnCreature(sMess, oPC, FALSE);
        //DEBUGelse if(GetLocalInt(oPC, MESSAGE_FLOATING) == 2)
            FloatingTextStringOnCreature(sMess, oPC, TRUE);
        //some people may like a PM instead
        //DEBUGif(GetLocalInt(oPC, MESSAGE_PRIVATE))
            SendMessageToPC(oPC, sMess);
    }
}

void DoSoundCheck(object oPC)
{
    //check if the PC has already tested recently
    if(GetLocalInt(OBJECT_SELF, "TestedSound_"+ObjectToString(oPC)))
        return;
    //mark them as having tried to listen
    SetLocalInt(OBJECT_SELF, "TestedSound_"+ObjectToString(oPC), TRUE);
    DelayCommand(SOUND_TEST_DELAY, DeleteLocalInt(OBJECT_SELF, "TestedSound_"+ObjectToString(oPC)));
    //get stored information
    int nDC = GetLocalInt(OBJECT_SELF, "SoundDC");
    string sMess = GetLocalString(OBJECT_SELF, "SoundMess");
    string sDesc = GetLocalString(OBJECT_SELF, "SoundDesc");
    string sResRef = GetLocalString(OBJECT_SELF, "SoundResRef");
    int nOneShot = GetLocalInt(OBJECT_SELF, "SoundOneShot");
    //make the skill check
    if(GetIsSkillSuccessful(oPC, SKILL_LISTEN, nDC))
    {
        //play the sound
        PlaySound(sResRef);
        //do the message
        SendAmbientMessage(oPC, sMess, sDesc, "hear");
        //if its one-shot, clean up
        if(nOneShot)
            DestroyObject(OBJECT_SELF);
    }
}

void DoSmellCheck(object oPC)
{
    //check if the PC has already tested recently
    if(GetLocalInt(OBJECT_SELF, "TestedSmell_"+ObjectToString(oPC)))
        return;
    //mark them as having tried to listen
    SetLocalInt(OBJECT_SELF, "TestedSmell_"+ObjectToString(oPC), TRUE);
    DelayCommand(SOUND_TEST_DELAY, DeleteLocalInt(OBJECT_SELF, "TestedSmell_"+ObjectToString(oPC)));
    //get stored information
    int nDC = GetLocalInt(OBJECT_SELF, "SmellDC");
    string sMess = GetLocalString(OBJECT_SELF, "SmellMess");
    string sDesc = GetLocalString(OBJECT_SELF, "SmellDesc");
    int nOneShot = GetLocalInt(OBJECT_SELF, "SmellOneShot");
    //make the skill check
    int nRoll = d20()+GetAbilityModifier(ABILITY_WISDOM, oPC);
    if(nRoll > nDC)
    {
        //do the message
        SendAmbientMessage(oPC, sMess, sDesc, "smell");
        //if its one-shot, clean up
        if(nOneShot)
            DestroyObject(OBJECT_SELF);
    }
}

void DoFeelingCheck(object oPC)
{
    //check if the PC has already tested recently
    if(GetLocalInt(OBJECT_SELF, "TestedFeel_"+ObjectToString(oPC)))
        return;
    //mark them as having tried to listen
    SetLocalInt(OBJECT_SELF, "TestedFeel_"+ObjectToString(oPC), TRUE);
    DelayCommand(SOUND_TEST_DELAY, DeleteLocalInt(OBJECT_SELF, "TestedFeel_"+ObjectToString(oPC)));
    //get stored information
    int nDC = GetLocalInt(OBJECT_SELF, "FeelDC");
    string sMess = GetLocalString(OBJECT_SELF, "FeelMess");
    string sDesc = GetLocalString(OBJECT_SELF, "FeelDesc");
    int nOneShot = GetLocalInt(OBJECT_SELF, "FeelOneShot");
    //make the skill check
    int nRoll = d20()+GetAbilityModifier(ABILITY_WISDOM, oPC);
    if(nRoll > nDC)
    {
        //do the message
        SendAmbientMessage(oPC, sMess, sDesc, "feel");
        //if its one-shot, clean up
        if(nOneShot)
            DestroyObject(OBJECT_SELF);
    }
}

object CreateSecretDetection(object oTarget, string sDesc, location lSpawn, int nDC = 0, int nOneShot = FALSE, float fRadius = 10.0)
{
DoDebug("CreateSecretDetection() running");
    //sounds are in a nice shade of blue
    string sMess = GetRGB(100, 100, 200)+"* You find: "+sDesc+GetRGB(100, 100, 200)+" *";
    //pick a suitable AoE effect based on radius size
    int nAoE = GetAoEForRadius(fRadius);
    effect eAoE = EffectAreaOfEffect(nAoE, "amb_search_enter", "amb_search_hb", "amb_search_exit");
    //make supernatural so cant be dispelled etc
    eAoE = SupernaturalEffect(eAoE);
    //apply it
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAoE, lSpawn);
    //get the AoE Object we just made
    string sTag = Get2DAString("vfx_persistent", "LABEL", nAoE);
    object oAoE = GetFirstObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    while(GetIsObjectValid(oAoE))
    {
        // Test if we found the correct AoE
        if(GetTag(oAoE) == sTag
            && !GetLocalInt(oAoE, "ParanoiaMarker") // Just in case there are two traps in the almost same location
           )
        {
            SetLocalInt(oAoE, "ParanoiaMarker", TRUE);
            break;
        }
        // Didn't find, get next
        oAoE = GetNextObjectInShape(SHAPE_SPHERE, 1.0f, lSpawn, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
    if(GetIsObjectValid(oAoE))
        DoDebug("oAoE is valid");
    else    
        DoDebug("oAoE is *NOT* valid");
    //set information on the AoE object
    SetLocalInt(oAoE, "SearchDC", nDC);
    SetLocalString(oAoE, "SearchDesc", sDesc);
    SetLocalString(oAoE, "SearchMess", sMess);
    SetLocalObject(oAoE, "SearchTarget", oTarget);
    SetLocalInt(oAoE, "SearchOneShot", nOneShot);
    return oAoE;
}

void DoSearchCheck(object oPC)
{
    //check if the PC has already tested recently
    if(GetLocalInt(OBJECT_SELF, "TestedSearch_"+ObjectToString(oPC)))
        return;
    //mark them as having tried to listen
    SetLocalInt(OBJECT_SELF, "TestedSearch_"+ObjectToString(oPC), TRUE);
    DelayCommand(SOUND_TEST_DELAY, DeleteLocalInt(OBJECT_SELF, "TestedSearch_"+ObjectToString(oPC)));
    //get stored information
    int nDC = GetLocalInt(OBJECT_SELF, "SearchDC");
    string sMess = GetLocalString(OBJECT_SELF, "SearchMess");
    string sDesc = GetLocalString(OBJECT_SELF, "SearchDesc");
    int nOneShot = GetLocalInt(OBJECT_SELF, "SearchOneShot");
    object oTarget = GetLocalObject(OBJECT_SELF, "SearchTarget"); 
    //make the skill check
    int nRoll = d20()+GetSkillRank(SKILL_SEARCH, oPC);
    //DEBUG
    FloatingTextStringOnCreature(IntToString(nRoll)+" vs "+IntToString(nDC), oPC);
    if(nRoll > nDC)
    {
        //do the message
        SendAmbientMessage(oPC, sMess, sDesc, "find");
        //send the target a UD event
        SignalEvent(oTarget, EventUserDefined(900));
        //if its one-shot, clean up
        if(nOneShot)
            DestroyObject(OBJECT_SELF);
    }
}