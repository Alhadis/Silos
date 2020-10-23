/*
    on_chat script to handle chat box commands
*/

#include "x2_inc_switches"
#include "dmfi_dmw_inc"
#include "_mdrn_const"

//Replace all instances of sSubString with sReplacer in sInput.
string ReplaceSubString(string sInput, string sSubString, string sReplacer)
{
    int nSub=FindSubString(sInput, sSubString);
    while (nSub!=-1)
    {
        sInput=GetStringLeft(sInput,nSub)+sReplacer+GetStringRight(sInput,GetStringLength(sInput)-(nSub+1));
        nSub=FindSubString(sInput, sSubString);
    }
    return sInput;
}

//Returns a list of commands usable by PCs
void ListPCCommands(object oPC)
{
    SendMessageToPC(oPC, "The following commands are available. Note spaces are ignored.");
    SendMessageToPC(oPC, "For various emotes: =<type of emote>, e.g. =sit =bow =salute =getlow =fallback =smoke. For a full list type =emotes");
    SendMessageToPC(oPC, "For various saves/skills/abilities: =<name of save/skill/ability>, e.g. =reflex =strength =spot =merchant =sense =k-mech. For a full list type =checks");
    SendMessageToPC(oPC, "For various dice rolls: =<dice type & number>, e.g. =d20 =d100 =1d6 =2d10 =5d6");
    SendMessageToPC(oPC, "To change between global and local dice rolls: =roll <global/local/private>, e.g. =roll global (default is private)");
    SendMessageToPC(oPC, "To teleport to the OOC area, type =ooc");
}

//Returns a list of commands usable by DMs
void ListDMCommands(object oPC)
{
    SendMessageToPC(oPC, "The following commands are available.");
    SendMessageToPC(oPC, "Enter any spaces in names as underscores.");
    SendMessageToPC(oPC, "Anywhere a name is entered, '#target' can be used to substitute the target of your chat commands widget.");
    SendMessageToPC(oPC, "=renameitem oldname newname: Renames item in your inventory.");
    SendMessageToPC(oPC, "Example: =renameitem Wine Vin_Blanc");
    SendMessageToPC(oPC, "=renameobject oldname newname: Renames object (including NPCs) in your area.");
    SendMessageToPC(oPC, "Example: =renameobject Chest_of_Drawers Dressing_Table");
    SendMessageToPC(oPC, "=setdescription item/object name newdescription: Sets description on item or object -");
    SendMessageToPC(oPC, "Example: =setdescription item 44_Magnum Do you feel lucky, punk?");
    SendMessageToPC(oPC, "=speak <text to say>: Has target NPC or object speak the text, select target with DM wands.");
    SendMessageToPC(oPC, "Example: =speak I'd have got away with it too, if it wasn't for you meddling kids! A target for the speech must be selected with DMFI target wand.");
    SendMessageToPC(oPC, "=copy <object to copy>: Copies an object in the area, or one targetted by the DMFI target wand, at the DM's location if a creature or into their inventory if an item.");
    SendMessageToPC(oPC, "Example: =copy Security_Guard");
    SendMessageToPC(oPC, "=vfx <vfx to use>: Causes a visual effect to occur.");
    SendMessageToPC(oPC, "Example: =vfx shake.");
    SendMessageToPC(oPC, "Effects available:");
    SendMessageToPC(oPC, "  shake - screen shakes for earthquake, crash, etc.");
    SendMessageToPC(oPC, "  lightning - creates a lightning strike at the DMs location.");
    SendMessageToPC(oPC, "  firestorm - creates a firestorm at the DMs location.");
}

//perform and report the result of a ability, saving throw or skill roll
void Do_Roll(int nMod, string sCheck, object oPC)
{
    int nRoll = Random(20) + 1;
    int nTotal = nRoll + nMod;
    string sString = sCheck + " Check, Roll 1d20:" + IntToString(nRoll) + " + (Modifier:" + IntToString(nMod) + ") = Total:" + IntToString(nTotal);
    sString = ColorText(sString, "cyan");
    AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
    string sBroadcast = GetLocalString(oPC,"Broadcast");
    if (sBroadcast=="global")
        AssignCommand(oPC, SpeakString(sString, TALKVOLUME_SHOUT));
    else if (sBroadcast=="local")
        AssignCommand(oPC, SpeakString(sString, TALKVOLUME_TALK));
    else
        SendMessageToPC(oPC, sString);
}

//report the result of a simple dice roll
void Report_Roll(int nRoll, string sDice, object oPC)
{
    string sString = "Dice, Roll " + sDice + " = " + IntToString(nRoll);
    sString = ColorText(sString, "cyan");
    AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
    string sBroadcast = GetLocalString(oPC, "Broadcast");
    if (sBroadcast=="global")
        AssignCommand(oPC, SpeakString(sString, TALKVOLUME_SHOUT));
    else if (sBroadcast=="local")
        AssignCommand(oPC, SpeakString(sString, TALKVOLUME_TALK));
    else
        SendMessageToPC(oPC, sString);
}

//report the result of a multiple dice roll
void Report_MultiRoll(int nDice, string sDice, object oPC)
{
    string sString = "Dice, Roll " + sDice + " = ";
    int n = StringToInt(GetStringLeft(sDice,1));
    int i;
    int nRoll = Random(nDice+1);
    int nTotal = nRoll;
    sString = sString + IntToString(nRoll);
    for (i = 1; i < n; i++)
    {
        nRoll = Random(nDice+1);
        sString = sString + " + " + IntToString(nRoll);
        nTotal = nTotal + nRoll;
    }
    sString = sString + " = " + IntToString(nTotal);
    sString = ColorText(sString, "cyan");
    AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
    string sBroadcast = GetLocalString(oPC, "Broadcast");
    if (sBroadcast=="global")
        AssignCommand(oPC, SpeakString(sString, TALKVOLUME_SHOUT));
    else if (sBroadcast=="local")
        AssignCommand(oPC, SpeakString(sString, TALKVOLUME_TALK));
    else
        SendMessageToPC(oPC, sString);
}

void main()
{
    object oPC=GetPCChatSpeaker();
    object oArea=GetArea(oPC);
    string sText=GetPCChatMessage();
    int nVolume = GetPCChatVolume();
    string sString;

    //Filter DM command element
    if(GetStringLeft(GetStringLowerCase(sText), 2) == "#d")
    {
        sText = GetSubString(sText, 3, GetStringLength(sText) -3) ;
        SetLocalString(oPC, "DMString", sText);
        SetPCChatMessage("");
        return;
    }

    //If not using a text command or language, or not normal chat, exit the script.  Chat will appear as normal.
    if ((GetStringLeft(sText,1)!="=") || (nVolume==TALKVOLUME_SILENT_TALK))
        return;

    //Clear the chat message so commands don't show up in chat.
    SetPCChatMessage("");

    //Find delimiters (spaces) and parse commands/arguments.
    //Only three parameters defined/fetched right now, more can be added if needed.
    int nDel;
    string sCommand, sParam1, sParam2, sParam3;
    string sTest=GetStringRight(sText, GetStringLength(sText)-1);
    int nLength=GetStringLength(sTest);

    nDel=FindSubString(sTest," ");
    if (nDel!=-1)
    {
        sCommand=GetStringLeft(sTest, nDel);
        sTest=GetStringRight(sTest, GetStringLength(sTest)-(nDel+1));
        nDel=FindSubString(sTest, " ");
        if (nDel!=-1){
            sParam1=GetStringLeft(sTest, nDel);

            sTest=GetStringRight(sTest, GetStringLength(sTest)-(nDel+1));
            nDel=FindSubString(sTest, " ");
            if (nDel!=-1){
                sParam2=GetStringLeft(sTest, nDel);

                sTest=GetStringRight(sTest, GetStringLength(sTest)-(nDel+1));
                sParam3=sTest;
            }
            else sParam2=sTest;
        }
        else sParam1=sTest;
    }
    else sCommand=sTest;

    //Commands are not case-sensitive
    sCommand=GetStringLowerCase(sCommand);

    //Replace underscores in parameters with spaces
    sParam1=ReplaceSubString(sParam1, "_", " ");
    sParam2=ReplaceSubString(sParam2, "_", " ");
    sParam3=ReplaceSubString(sParam3, "_", " ");

    //Lists relevant commands for player or DM.
    if (sCommand=="help")
    {
        if (GetIsDM(oPC)) ListDMCommands(oPC);
        else ListPCCommands(oPC);
        return;
    }

    if (sCommand=="ooc")
    {
        sParam1=GetStringLowerCase(sParam1);
        object oTarget;
        location lTarget;
        oTarget = GetWaypointByTag("starter_area");

        lTarget = GetLocation(oTarget);

        AssignCommand(oPC, ClearAllActions());

        DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(lTarget)));
        return;
    }


    //Enact emotes
    if (sCommand=="sit")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 3600.0));
        return;
    }
    if (sCommand=="drink")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_DRINK, 1.0));
        return;
    }
    if (sCommand=="drinkmug")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_CUSTOM9, 1.0, 3600.0));
        return;
    }
    if (sCommand=="drunk")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 3600.0));
        return;
    }
    if (sCommand=="pushups")    //requires crawling to be active
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 3600.0));
        return;
    }
    if (sCommand=="bow")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_BOW, 1.0));
        return;
    }
    if (sCommand=="salute")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_SALUTE, 1.0));
        return;
    }
    if (sCommand=="smoke")
    {
        SmokePipe(oPC);
        return;
    }
    if (sCommand=="smokecig")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_CUSTOM7, 1.0, 3600.0));
        return;
    }
    if (sCommand=="read")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_READ, 1.0));
        return;
    }
    if (sCommand=="sitread")
    {
        AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_SIT_CROSS, 1.0, 3600.0));
        DelayCommand(1.0f, AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_READ, 1.0)));
        DelayCommand(3.0f, AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_SIT_CROSS, 1.0, 3600.0)));
        return;
    }
    if (sCommand=="sitdrink")
    {
        AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_SIT_CROSS, 1.0, 3600.0));
        DelayCommand(1.0f, AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_DRINK, 1.0)));
        DelayCommand(3.0f, AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_SIT_CROSS, 1.0, 3600.0)));
        return;
    }
    if (sCommand=="duck")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_DODGE_DUCK, 1.0));
        return;
    }
    if (sCommand=="dodge")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_DODGE_SIDE, 1.0));
        return;
    }
    if (sCommand=="fallback")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 3600.0));
        return;
    }
    if (sCommand=="fallfront")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 3600.0));
        return;
    }
    if (sCommand=="getmiddle")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3600.0));
        return;
    }
    if (sCommand=="getlow")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3600.0));
        return;
    }
    if (sCommand=="crossarms" || sCommand=="foldarms")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_CUSTOM4, 1.0, 3600.0));
        return;
    }
    if (sCommand=="leap")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_CUSTOM5, 1.0, 1.0));
        return;
    }
    if (sCommand=="crouch")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_CUSTOM2, 1.0, 3600.0));
        return;
    }
    if (sCommand=="point")
    {
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_CUSTOM1, 1.0, 3.0));
        return;
    }
    if (sCommand=="beg")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_TALK_PLEADING, 1.0, 3600.0));
        return;
    }
    if (sCommand=="conjure1")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_TALK_PLEADING, 1.0, 3600.0));
        return;
    }
    if (sCommand=="conjure2")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_TALK_PLEADING, 1.0, 3600.0));
        return;
    }
    if (sCommand=="meditate")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_MEDITATE, 1.0, 3600.0));
        return;
    }
    if (sCommand=="spasm")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_SPASM, 1.0, 3600.0));
        return;
    }
    if (sCommand=="shakehead")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 3600.0));
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 3600.0));
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 3600.0));
        return;
    }
    if (sCommand=="scratchhead")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0, 3600.0));
        return;
    }
    if (sCommand=="holdhead")
    {
        AssignCommand(oPC, PlayAnimation( ANIMATION_LOOPING_CUSTOM3, 1.0, 3600.0));
        return;
    }
    if (sCommand=="crawl")
    {
        ExecuteScript("_mdrn_at_crawl",oPC);
        return;
    }


    // Complete ability roll
    if (sCommand=="str" || sCommand=="strength")
    {
        int iMod = GetAbilityModifier(ABILITY_STRENGTH, oPC)+2*GetHasFeat(FEAT_EXTREMEEFFORT, oPC)+2*GetHasFeat(FEAT_IMPROVEDEXTREMEEFFORT, oPC);
        Do_Roll(iMod,"Strength",oPC);
        return;
    }
    if (sCommand=="con" || sCommand=="constitution")
    {
        int iMod = GetAbilityModifier(ABILITY_CONSTITUTION, oPC)+2*GetHasFeat(FEAT_ENDURANCE, oPC);
        Do_Roll(iMod,"Constitution",oPC);
        return;
    }
    if (sCommand=="dex" || sCommand=="dexterity")
    {
        int iMod = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
        Do_Roll(iMod,"Dexterity",oPC);
        return;
    }
    if (sCommand=="int" || sCommand=="intelligence")
    {
        int iMod = GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
        Do_Roll(iMod,"Intelligence",oPC);
        return;
    }
    if (sCommand=="wis" || sCommand=="wisdom")
    {
        int iMod = GetAbilityModifier(ABILITY_WISDOM, oPC);
        Do_Roll(iMod,"Wisdom",oPC);
        return;
    }
    if (sCommand=="cha" || sCommand=="charisma")
    {
        int iMod = GetAbilityModifier(ABILITY_CHARISMA, oPC);
        Do_Roll(iMod,"Charisma",oPC);
        return;
    }

    // Complete saving throw roll
    if (sCommand=="fort" || sCommand=="fortitude")
    {
        int iMod = GetFortitudeSavingThrow(oPC);
        Do_Roll(iMod,"Fortitude",oPC);
        return;
    }
    if (sCommand=="ref" || sCommand=="reflex")
    {
        int iMod = GetReflexSavingThrow(oPC);
        Do_Roll(iMod,"Reflex",oPC);
        return;
    }
    if (sCommand=="will")
    {
        int iMod = GetWillSavingThrow(oPC);
        Do_Roll(iMod,"Will",oPC);
        return;
    }

    // Complete skill roll
    if (sCommand=="search")
    {
        int iMod = GetSkillRank(SKILL_SEARCH, oPC)+4*GetHasFeat(FEAT_IMPROVEDSWEEP,oPC);
        Do_Roll(iMod,"Search",oPC);
        return;
    }
    if (sCommand=="spot")
    {
        int iMod = GetSkillRank(SKILL_SPOT, oPC)+4*GetHasFeat(FEAT_SWEEP,oPC);
        Do_Roll(iMod,"Spot",oPC);
        return;
    }
    if (sCommand=="listen")
    {
        int iMod = GetSkillRank(SKILL_LISTEN, oPC);
        Do_Roll(iMod,"Listen",oPC);
        return;
     }
    if (sCommand=="repair")
    {
        int iMod = GetSkillRank(SKILL_REPAIR,oPC);
        Do_Roll(iMod,"Repair",oPC);
        return;
    }
    if (sCommand=="persuade")
    {
        int iMod = GetSkillRank(SKILL_PERSUADE, oPC);
        Do_Roll(iMod,"Persuade",oPC);
        return;
    }
    if (sCommand=="disable")
    {
        int iMod =GetSkillRank(SKILL_DISABLE_DEVICE, oPC);
        Do_Roll(iMod,"Disable Device",oPC);
        return;
    }
    if (sCommand=="bluff")
    {
        int iMod = GetSkillRank(SKILL_BLUFF, oPC);
        Do_Roll(iMod,"Bluff",oPC);
        return;
    }
    if (sCommand=="concentrate" || sCommand=="concentration" || sCommand=="conc")
    {
        int iMod = GetSkillRank(SKILL_CONCENTRATION, oPC);
        Do_Roll(iMod,"Concentration",oPC);
        return;
    }
    if (sCommand=="discipline" || sCommand=="disc")
    {
        int iMod = GetSkillRank(SKILL_DISCIPLINE, oPC);
        Do_Roll(iMod,"Discipline",oPC);
        return;
    }
    if (sCommand=="treat")
    {
        int iMod = GetSkillRank(SKILL_HEAL, oPC)-4+4*(GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_medikit"))||GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_firstaid"))||GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_surgkit")));
        Do_Roll(iMod,"Treat Injury",oPC);
        return;
    }
    if (sCommand=="hide")
    {
        int iMod = GetSkillRank(SKILL_HIDE, oPC);
        Do_Roll(iMod,"Hide",oPC);
        return;
    }
    if (sCommand=="move" || sCommand=="movesilently" || sCommand=="movesilent")
    {
        int iMod = GetSkillRank(SKILL_MOVE_SILENTLY, oPC);
        Do_Roll(iMod,"Move Silently",oPC);
        return;
    }
    if (sCommand=="perform")
    {
        int iMod = GetSkillRank(SKILL_PERFORM, oPC);
        Do_Roll(iMod,"Perform",oPC);
        return;
    }
    if (sCommand=="intim" || sCommand=="intimid" || sCommand=="intimidate")
    {
        int iMod = GetSkillRank(SKILL_INTIMIDATE, oPC);
        Do_Roll(iMod,"Intimidate",oPC);
        return;
    }
    if (sCommand=="sleight" || sCommand=="sleightofhand")
    {
        int iMod = GetSkillRank(SKILL_SLEIGHT_OF_HAND, oPC);
        Do_Roll(iMod,"Sleight of Hand",oPC);
        return;
    }
    if (sCommand=="computeruse" || sCommand=="computer" || sCommand=="compuse" || sCommand=="comp")
    {
        int iMod = GetSkillRank(SKILL_COMPUTER_USE, oPC);
        Do_Roll(iMod,"Computer Use",oPC);
        return;
    }
    if (sCommand=="demo" || sCommand=="demolitions" || sCommand=="demolition")
    {
        int iMod = GetSkillRank(SKILL_DEMOLITIONS, oPC) -4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_demo"));
        Do_Roll(iMod,"Demolitions",oPC);
        return;
    }
    if (sCommand=="research")
    {
        int iMod = GetSkillRank(SKILL_RESEARCH, oPC);
        Do_Roll(iMod,"Research",oPC);
        return;
    }
    if (sCommand=="climb")
    {
        int iMod = GetSkillRank(SKILL_CLIMB, oPC) -4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_climb"));
        Do_Roll(iMod,"Climb",oPC);
        return;
    }
    if (sCommand=="jump")
    {
        int iMod = GetSkillRank(SKILL_JUMP, oPC);
        Do_Roll(iMod,"Jump",oPC);
        return;
    }
   if (sCommand=="escapeartist" || sCommand=="escape")
    {
        int iMod = GetSkillRank(SKILL_ESCAPE_ARTIST, oPC);
        Do_Roll(iMod,"Escape Artist",oPC);
        return;
    }
    if (sCommand=="balance" || sCommand=="bal")
    {
        int iMod = GetSkillRank(SKILL_BALANCE, oPC);
        Do_Roll(iMod,"Balance",oPC);
        return;
    }
    if (sCommand=="navigate" || sCommand=="nav")
    {
        int iMod = GetSkillRank(SKILL_NAVIGATE, oPC);
        Do_Roll(iMod,"Navigate",oPC);
        return;
    }
    if (sCommand=="pilot")
    {
        int iMod = GetSkillRank(SKILL_PILOT, oPC);
        Do_Roll(iMod,"Pilot",oPC);
        return;
    }
    if (sCommand=="drive")
    {
        int iMod = GetSkillRank(SKILL_DRIVE, oPC);
        Do_Roll(iMod,"Drive",oPC);
        return;
    }
    if (sCommand=="ride")
    {
        int iMod = GetSkillRank(SKILL_RIDE, oPC);
        Do_Roll(iMod,"Ride",oPC);
        return;
    }
    if (sCommand=="sensemotive" || sCommand=="sense")
    {
        int iMod = GetSkillRank(SKILL_SENSE_MOTIVE, oPC);
        Do_Roll(iMod,"Sense Motive",oPC);
        return;
    }
    if (sCommand=="gatherinformation" || sCommand=="gatherinf" || sCommand=="gather")
    {
        int iMod = GetSkillRank(SKILL_GATHER_INFORMATION, oPC);
        Do_Roll(iMod,"Gather Information",oPC);
        return;
    }
    if (sCommand=="investigate" || sCommand=="inv" || sCommand=="invest")
    {
        int iMod = GetSkillRank(SKILL_INVESTIGATE, oPC)-4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_it_investigatekit"));
        Do_Roll(iMod,"Investigate",oPC);
        return;
    }
     if (sCommand=="decipher" || sCommand=="decipherscript" || sCommand=="script")
    {
        int iMod = GetSkillRank(SKILL_DECIPHER_SCRIPT, oPC);
        Do_Roll(iMod,"Decipher Script",oPC);
        return;
    }
    if (sCommand=="gamble")
    {
        int iMod = GetSkillRank(SKILL_GAMBLE, oPC);
        Do_Roll(iMod,"Gamble",oPC);
        return;
    }
    if (sCommand=="disguise" || sCommand=="disg")
    {
        int iMod = GetSkillRank(SKILL_DISGUISE, oPC) -4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_it_disguisekit"));
        Do_Roll(iMod,"Disguise",oPC);
        return;
    }
    if (sCommand=="profession" || sCommand=="prof")
    {
        int iMod = GetSkillRank(SKILL_PROFESSION, oPC);
        Do_Roll(iMod,"Profession",oPC);
        return;
    }
    if (sCommand=="survival" || sCommand=="survive")
    {
        int iMod = GetSkillRank(SKILL_SURVIVAL, oPC);
        Do_Roll(iMod,"Survival",oPC);
        return;
    }
    if (sCommand=="handleanimal" || sCommand=="handle")
    {
        int iMod = GetSkillRank(SKILL_HANDLE_ANIMAL, oPC);
        Do_Roll(iMod,"Handle Animal",oPC);
        return;
    }
    if (sCommand=="forge" || sCommand=="forgery")
    {
        int iMod = GetSkillRank(SKILL_FORGERY, oPC)-4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_it_forgerykit"));
        Do_Roll(iMod,"Forgery",oPC);
        return;
    }
    if (sCommand=="tumble")
    {
        int iMod = GetSkillRank(SKILL_TUMBLE, oPC);
        Do_Roll(iMod,"Tumble",oPC);
        return;
    }
    if (sCommand=="technology" || sCommand=="tech")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_TECHNOLOGY, oPC);
        Do_Roll(iMod,"Knowledge (Technology)",oPC);
        return;
    }
    if (sCommand=="currentevents" || sCommand=="current")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_CURRENT_EVENTS, oPC);
        Do_Roll(iMod,"Knowledge (Current Events)",oPC);
        return;
    }
    if (sCommand=="streetwise" || sCommand=="street")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_STREETWISE, oPC);
        Do_Roll(iMod,"Knowledge (Streetwise)",oPC);
        return;
    }
    if (sCommand=="physical sciences" || sCommand=="physicalsciences" || sCommand=="physical")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_PHYSICAL_SCIENCES, oPC);
        Do_Roll(iMod,"Knowledge (Physical Sciences)",oPC);
        return;
    }
    if (sCommand=="earthsciences" || sCommand=="earth")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_EARTH_SCIENCES, oPC);
        Do_Roll(iMod,"Knowledge (Earth Sciences)",oPC);
        return;
    }
    if (sCommand=="business")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_BUSINESS, oPC);
        Do_Roll(iMod,"Knowledge (Business)",oPC);
        return;
    }
    if (sCommand=="civics")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_CIVICS, oPC);
        Do_Roll(iMod,"Knowledge (Civics)",oPC);
        return;
    }
    if (sCommand=="theology" || sCommand=="theo")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_THEOLOGY_AND_PHILOSOPHY, oPC);
        Do_Roll(iMod,"Knowledge (Theology)",oPC);
        return;
    }
    if (sCommand=="tactics")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_TACTICS, oPC);
        Do_Roll(iMod,"Knowledge (Tactics)",oPC);
        return;
    }
    if (sCommand=="behavioral" || sCommand=="behav" || sCommand=="behave")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_BEHAVIORAL_SCIENCES, oPC);
        Do_Roll(iMod,"Knowledge (Behavioral)",oPC);
        return;
    }
    if (sCommand=="history")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_HISTORY, oPC);
        Do_Roll(iMod,"Knowledge (History)",oPC);
        return;
    }
    if (sCommand=="popularculture" || sCommand=="popculture" || sCommand=="popular" || sCommand=="culture" || sCommand=="pop")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_POPULAR_CULTURE, oPC);
        Do_Roll(iMod,"Knowledge (Popular Culture)",oPC);
        return;
    }
    if (sCommand=="art")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_ART, oPC);
        Do_Roll(iMod,"Knowledge (Art)",oPC);
        return;
    }
    if (sCommand=="arcanelore" || sCommand=="arcane" || sCommand=="lore")
    {
        int iMod = GetSkillRank(SKILL_KNOWLEDGE_ARCANE_LORE, oPC);
        Do_Roll(iMod,"Knowledge (Arcane Lore)",oPC);
        return;
    }
    if (sCommand=="chemical" || sCommand=="chem")
    {
        int iMod = GetSkillRank(SKILL_CRAFT_CHEMICAL, oPC) -4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_chemkit"));
        Do_Roll(iMod,"Craft (Chemical)",oPC);
        return;
    }
    if (sCommand=="electronic" || sCommand=="elec" || sCommand=="elect")
    {
        int iMod = GetSkillRank(SKILL_CRAFT_ELECTRONIC, oPC) -4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_disable")) ;
        Do_Roll(iMod,"Craft (Electronic)",oPC);
        return;
    }
    if (sCommand=="mechanical" || sCommand=="mechanic" || sCommand=="mech")
    {
        int iMod = GetSkillRank(SKILL_CRAFT_MECHANICAL, oPC) -4+4*GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_mechkit"));
        Do_Roll(iMod,"Craft (Mechanical)",oPC);
        return;
    }
    if (sCommand=="pharmaceutical" || sCommand=="pharmacy" || sCommand=="pharm")
    {
        int iMod = GetSkillRank(SKILL_CRAFT_PHARMACEUTICAL, oPC);
        Do_Roll(iMod,"Craft (Pharmaceutical)",oPC);
        return;
    }
    if (sCommand=="structural" || sCommand=="struct" || sCommand=="structure")
    {
        int iMod = GetSkillRank(SKILL_CRAFT_STRUCTURAL, oPC);
        Do_Roll(iMod,"Craft (Structural)",oPC);
        return;
    }
    if (sCommand=="visualarts" || sCommand=="visual")
    {
        int iMod = GetSkillRank(SKILL_CRAFT_VISUAL_ART, oPC);
        Do_Roll(iMod,"Craft (Visual Arts)",oPC);
        return;
    }
    if (sCommand=="writing" || sCommand=="write")
    {
        int iMod =GetSkillRank(SKILL_CRAFT_WRITING, oPC);
        Do_Roll(iMod,"Craft (Writing)",oPC);
        return;
    }
    if (sCommand=="autohypnosis" || sCommand=="auto" || sCommand=="hypno")
    {
        int iMod = GetSkillRank(SKILL_AUTOHYPNOSIS, oPC);
        Do_Roll(iMod,"Autohypnosis",oPC);
        return;
    }
    if (sCommand=="psicraft" || sCommand=="psi")
    {
        int iMod = GetSkillRank(SKILL_PSICRAFT, oPC);
        Do_Roll(iMod,"Psicraft",oPC);
        return;
    }

    // Dice Rolls
    if (sCommand=="d20" || sCommand=="1d20")
    {
        int iRoll = d20(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d6" || sCommand=="1d6")
    {
        int iRoll = d6(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d100" || sCommand=="1d100")
    {
        int iRoll = d100(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d2" || sCommand=="1d2")
    {
        int iRoll = d2(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d10" || sCommand=="1d10")
    {
        int iRoll = d10(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d12" || sCommand=="1d12")
    {
        int iRoll = d12(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d8" || sCommand=="1d8")
    {
        int iRoll = d8(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d4" || sCommand=="1d4")
    {
        int iRoll = d4(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="d3" || sCommand=="1d3")
    {
        int iRoll = d3(1);
        Report_Roll(iRoll, sCommand, oPC);
        return;
    }
    if (sCommand=="2d6")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="3d6")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="4d6")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="5d6")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="6d6")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="7d6")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="2d8")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="2d4")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="2d2")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="2d3")
    {
        int nDice = StringToInt(GetStringRight(sCommand,1));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="2d10")
    {
        int nDice = StringToInt(GetStringRight(sCommand,2));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="2d20")
    {
        int nDice = StringToInt(GetStringRight(sCommand,2));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }
    if (sCommand=="2d12")
    {
        int nDice = StringToInt(GetStringRight(sCommand,2));
        Report_MultiRoll(nDice, sCommand, oPC);
        return;
    }

    // SendMessageToPC(oPC, "To change between global and local dice rolls - =roll <global/local/private>, e.g. =roll global (default is private)");
    if (sCommand=="roll")
    {
        if ((sParam1!="global")&&(sParam1!="local")&&(sParam1!="private"))
        {
            SendMessageToPC(oPC, "Syntax is =roll <global/local/private>, e.g. =roll global");
        }
        else
        {
            SendMessageToPC(oPC, "Dice rolls are now: "+sParam1);
            SetLocalString(oPC, "Broadcast",sParam1);
        }
        return;
    }

    //Emote list
    if (sCommand=="emotes")
    {
        SendMessageToPC(oPC, "Emote commands are:");
        SendMessageToPC(oPC, "=beg");
        SendMessageToPC(oPC, "=bow");
        SendMessageToPC(oPC, "=conjure1");
        SendMessageToPC(oPC, "=conjure2");
        SendMessageToPC(oPC, "=crawl (start/stop crawling animation)");
        SendMessageToPC(oPC, "=crossarms or =foldarms");
        SendMessageToPC(oPC, "=crouch");
        SendMessageToPC(oPC, "=dodge");
        SendMessageToPC(oPC, "=drink");
        SendMessageToPC(oPC, "=drinkmug (requires item)");
        SendMessageToPC(oPC, "=drunk");
        SendMessageToPC(oPC, "=duck");
        SendMessageToPC(oPC, "=fallback");
        SendMessageToPC(oPC, "=fallfront");
        SendMessageToPC(oPC, "=getlow");
        SendMessageToPC(oPC, "=getmiddle");
        SendMessageToPC(oPC, "=holdhead");
        SendMessageToPC(oPC, "=leap");
        SendMessageToPC(oPC, "=meditate");
        SendMessageToPC(oPC, "=point");
        SendMessageToPC(oPC, "=pushups (requires crawling)");
        SendMessageToPC(oPC, "=read");
        SendMessageToPC(oPC, "=salute");
        SendMessageToPC(oPC, "=scratchhead");
        SendMessageToPC(oPC, "=shakehead");
        SendMessageToPC(oPC, "=sit");
        SendMessageToPC(oPC, "=sitdrink");
        SendMessageToPC(oPC, "=sitread");
        SendMessageToPC(oPC, "=smoke");
        SendMessageToPC(oPC, "=smokecig (requires item)");
        SendMessageToPC(oPC, "=spasm");
    }

    //skill & ability list
    if (sCommand=="checks")
    {
        SendMessageToPC(oPC, "Save rolls are:");
        SendMessageToPC(oPC, "=fort or =fortitude");
        SendMessageToPC(oPC, "=ref or =reflex");
        SendMessageToPC(oPC, "=will");
        SendMessageToPC(oPC, "Ability rolls are:");
        SendMessageToPC(oPC, "=cha or =charisma");
        SendMessageToPC(oPC, "=con or =constitution");
        SendMessageToPC(oPC, "=dex or =dexterity");
        SendMessageToPC(oPC, "=int or =intelligence");
        SendMessageToPC(oPC, "=wis or =wisdom");
        SendMessageToPC(oPC, "Skill rolls are:");
        SendMessageToPC(oPC, "=arcanelore or =arcane or =lore");
        SendMessageToPC(oPC, "=art");
        SendMessageToPC(oPC, "=balance or =bal");
        SendMessageToPC(oPC, "=bluff");
        SendMessageToPC(oPC, "=behavioral or =behav or =behave");
        SendMessageToPC(oPC, "=business");
        SendMessageToPC(oPC, "=civics");
        SendMessageToPC(oPC, "=chemical or =chem");
        SendMessageToPC(oPC, "=climb");
        SendMessageToPC(oPC, "=computeruse or =computer or =compuse or =comp");
        SendMessageToPC(oPC, "=concentrate or =concentration or =conc");
        SendMessageToPC(oPC, "=currentevents or =current");
        SendMessageToPC(oPC, "=demo or =demolitions or =demolition");
        SendMessageToPC(oPC, "=decipher or =decipherscript or =script");
        SendMessageToPC(oPC, "=disable");
        SendMessageToPC(oPC, "=discipline or =disc");
        SendMessageToPC(oPC, "=disguise or =disg");
        SendMessageToPC(oPC, "=drive");
        SendMessageToPC(oPC, "=earthsciences or =earth");
        SendMessageToPC(oPC, "=electronic or =elec or =elect");
        SendMessageToPC(oPC, "=escapeartist or =escape");
        SendMessageToPC(oPC, "=forge or =forgery");
        SendMessageToPC(oPC, "=gamble");
        SendMessageToPC(oPC, "=gatherinformation or =gatherinf or =gather");
        SendMessageToPC(oPC, "=handleanimal or =handle");
        SendMessageToPC(oPC, "=hide");
        SendMessageToPC(oPC, "=history");
        SendMessageToPC(oPC, "=intim or =intimid or =intimidate");
        SendMessageToPC(oPC, "=investigate or =inv or =invest");
        SendMessageToPC(oPC, "=jump");
        SendMessageToPC(oPC, "=listen");
        SendMessageToPC(oPC, "=mechanical or =mechanic or =mech");
        SendMessageToPC(oPC, "=move or =movesilently or =movesilent");
        SendMessageToPC(oPC, "=navigate or =nav");
        SendMessageToPC(oPC, "=perform");
        SendMessageToPC(oPC, "=persuade");
        SendMessageToPC(oPC, "=physical sciences or =physicalsciences or =physical");
        SendMessageToPC(oPC, "=pharmaceutical or =pharmacy or =pharm");
        SendMessageToPC(oPC, "=pilot");
        SendMessageToPC(oPC, "=popularculture or =popculture or =popular or =culture or =pop");
        SendMessageToPC(oPC, "=profession or =prof");
        SendMessageToPC(oPC, "=repair");
        SendMessageToPC(oPC, "=research");
        SendMessageToPC(oPC, "=ride");
        SendMessageToPC(oPC, "=search");
        SendMessageToPC(oPC, "=sensemotive or =sense");
        SendMessageToPC(oPC, "=sleight or =sleightofhand");
        SendMessageToPC(oPC, "=spot");
        SendMessageToPC(oPC, "=streetwise or =street");
        SendMessageToPC(oPC, "=structural or =struct or =structure");
        SendMessageToPC(oPC, "=survival or =survive");
        SendMessageToPC(oPC, "=tactics");
        SendMessageToPC(oPC, "=technology or =tech");
        SendMessageToPC(oPC, "=theology or =theo");
        SendMessageToPC(oPC, "=treat");
        SendMessageToPC(oPC, "=tumble");
        SendMessageToPC(oPC, "=visualarts or =visual");
        SendMessageToPC(oPC, "=writing or =write");
    }

    //If you get this far and you're not a DM then report mistake, unless debug mode is on
    if (!GetIsDM(oPC))
    {
        SendMessageToPC(oPC, "Invalid command.  Type =help for the list of available commands.");
        return;
    }

    //DM COMMANDS
    //These commands are only available to DMs (Or possibly later DMPCs), or in testing mode

    //Send a chat string to an NPC. Requires use of the Target wand.  Syntax is Speak <text to say>
    if (sCommand=="speak")
    {
        object oTarget = GetLocalObject(oPC, "dmfi_univ_target");
        if (!(GetIsObjectValid(oTarget)) || (sParam1==""))
        {
            SendMessageToPC(oPC, "Syntax is Speak <text to say> For example,"+
                " =Speak I'd have got away with it too, if it wasn't for you meddling kids! A target for the speech must be selected with DMFI target wand.");
        }
        else
        {
            string sDescription = sParam1 + " " + sParam2 + " " + sParam3;
            AssignCommand(oTarget,SpeakString(sDescription));
        }
        return;
    }

    //Call up a vfx from a provided list. Syntax is vfx <text to say>
    if (sCommand=="vfx")
    {
        if (sParam1=="")
        {
            SendMessageToPC(oPC,"Syntax is vfx <effect to use> For example, =vfx shake");
            return;
        }
        object oTarget = GetLocalObject(oPC, "dmfi_univ_target");
        if (GetIsObjectValid(oTarget))
        {
            oPC=oTarget;
        }
        string sEffect = sParam1;
        location lLoc = GetLocation(oPC);

        if (sParam1=="shake")
        {
            // tell the player object to play an earthquake sound
            AssignCommand(oPC,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE),lLoc));
            AssignCommand(oPC,DelayCommand(2.8,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SCREEN_BUMP),lLoc)));
            AssignCommand(oPC,DelayCommand(3.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SCREEN_SHAKE),lLoc)));
            AssignCommand(oPC,DelayCommand(4.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SCREEN_BUMP),lLoc)));
            AssignCommand(oPC,DelayCommand(5.8,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SCREEN_BUMP),lLoc)));
            // tell the player object to play an earthquake sound
            AssignCommand(oPC,PlaySound("as_cv_boomdist1"));
            AssignCommand(oPC,DelayCommand(2.0,PlaySound("as_wt_thunderds3")));
            AssignCommand(oPC,DelayCommand(4.0,PlaySound("as_cv_boomdist1")));
            // create a dust plume at the player and clicking location
            object oTargetArea = GetArea(oPC);
            int nXPos, nYPos, nCount;
            for (nCount = 0; nCount < 15; nCount++)
            {
                nXPos = Random(30) - 15;
                nYPos = Random(30) - 15;
                vector vNewVector = GetPosition(oPC);
                vNewVector.x += nXPos;
                vNewVector.y += nYPos;
                location lDustLoc = Location(oTargetArea,vNewVector,0.0);
                object oDust = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_dustplume",lDustLoc,FALSE);
                DelayCommand(4.0,DestroyObject(oDust));
            }
        }
        else if (sParam1=="lightning")
        {
            // tell the player object to create a Lightning visual effect at targetted location
            AssignCommand(oPC,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),lLoc));
            // tell the player object to play a thunderclap
            AssignCommand(oPC,PlaySound("as_wt_thundercl3"));
            // create a scorch mark where the lightning hit
            object oScorch = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_weathmark",lLoc,FALSE);
            object oTargetArea = GetArea(oPC);
            int nXPos, nYPos, nCount;
            for(nCount = 0; nCount < 5; nCount++)
            {
                nXPos = Random(10) - 5;
                nYPos = Random(10) - 5;
                vector vNewVector = GetPositionFromLocation(lLoc);
                vNewVector.x += nXPos;
                vNewVector.y += nYPos;
                location lNewLoc = Location(oTargetArea, vNewVector, 0.0);
                AssignCommand(oPC,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_S),lNewLoc));
            }
            DelayCommand(20.0,DestroyObject(oScorch));
        }
        else if (sParam1=="firestorm")
        {
            // tell the DM object to rain fire and destruction
            AssignCommand(oPC,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_METEOR_SWARM),lLoc));
            AssignCommand(oPC,DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SCREEN_SHAKE),lLoc)));
            // create some fires
            object oTargetArea = GetArea(oPC);
            int nXPos, nYPos, nCount;
            for (nCount = 0; nCount < 15; nCount++)
            {
                nXPos = Random(30) - 15;
                nYPos = Random(30) - 15;
                vector vNewVector = GetPosition(oPC);
                vNewVector.x += nXPos;
                vNewVector.y += nYPos;
                location lFireLoc = Location(oTargetArea, vNewVector, 0.0);
                object oFire = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_flamelarge",lFireLoc,FALSE);
                object oDust = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_dustplume",lFireLoc,FALSE);
                DelayCommand(10.0,DestroyObject(oFire));
                DelayCommand(14.0,DestroyObject(oDust));
            }
        }
        else if (sParam1=="icestorm")
        {
            // tell the DM object to rain ice and destruction
            AssignCommand(oPC,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_ICESTORM),lLoc));
            AssignCommand(oPC,DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SCREEN_SHAKE),lLoc)));
            // create some floor ice
            object oTargetArea = GetArea(oPC);
            int nXPos, nYPos, nCount;
            for (nCount = 0; nCount < 15; nCount++)
            {
                nXPos = Random(30) - 15;
                nYPos = Random(30) - 15;
                vector vNewVector = GetPosition(oPC);
                vNewVector.x += nXPos;
                vNewVector.y += nYPos;
                location lIceLoc = Location(oTargetArea,vNewVector,0.0);
                object oIce = CreateObject(OBJECT_TYPE_PLACEABLE,"x0_snowdrift",lIceLoc,FALSE);
                DelayCommand(10.0,DestroyObject(oIce));
            }
        }
        else
        {
            SendMessageToPC(oPC,"Effect name not recognised.");
        }
        return;
    }

    //Copies an object in the area or one targetted by the DMFI target wand at the DM's location or into their inventory
    if (sCommand=="copy")
    {
        object oTarget = GetLocalObject(oPC, "dmfi_univ_target");
        if (!(GetIsObjectValid(oTarget)) && (sParam1==""))
        {
            SendMessageToPC(oPC, "Syntax is Copy <object to copy> For example,"+
                " =Copy Security_Guard  A target to copy may be selected with DMFI target wand instead.");
        }
        else
        {
            if (sParam1!="")
            {
                object oTest=GetFirstObjectInArea(GetArea(oPC));
                int nFound=0;
                while ((GetIsObjectValid(oTest))&&(nFound==0))
                {
                    if (GetStringLowerCase(GetName(oTest))==sParam1)
                    {
                        oTarget=oTest;
                        nFound=1;
                    }
                    oTest=GetNextObjectInArea(GetArea(oPC));
                }
            }
            if (GetIsObjectValid(oTarget))
                CopyObject(oTarget,GetLocation(oPC),oPC);
            else
                SendMessageToPC(oPC, "Object not found.");
        }
        return;
    }

    //Rename item in user's inventory.  Syntax is RenameObject <oldname> <newname>
    if (sCommand=="renameitem")
    {
        if (sParam1=="" || sParam2=="")
        {
            SendMessageToPC(oPC, "Syntax is RenameItem <oldname> <newname>.");
            return;
        }
        sParam1=GetStringLowerCase(sParam1);
        object oTarget;
        object oTest=GetFirstItemInInventory(oPC);
        while (GetIsObjectValid(oTest))
        {
            if (GetStringLowerCase(GetName(oTest))==sParam1)
            {
                oTarget=oTest;
                break;
            }
            oTest=GetNextItemInInventory(oPC);
        }
        if (!GetIsObjectValid(oTarget))
            SendMessageToPC(oPC, "Item "+sParam1+" not found in your inventory.");
        else
        {
            SetName(oTarget, sParam2);
            SendMessageToPC(oPC, "Item renamed to "+sParam2+".");
        }
        return;
    }

    //Change descriptions.  Syntax is SetDescription <item/object> <name> <description> or SetDescription #target <description>.
    if (sCommand=="setdescription")
    {
        if (sParam1!="#target" && (sParam1=="" || sParam2=="" || sParam3==""))
        {
            SendMessageToPC(oPC, "Syntax is SetDescription <item/object> <name> <description> "+
                " OR SetDescription #target <description>."+
                " item looks for item in inventory, object for an object in area.  For example,"+
                " =SetDescription item Magnum Do you feel lucky, punk?.");
            return;
        }
        sParam1=GetStringLowerCase(sParam1);
        sParam2=GetStringLowerCase(sParam2);
        object oTarget, oTest;
        string sDescription = "";
        if (sParam1=="#target")
        {
            oTarget = GetLocalObject(oPC, "dmfi_univ_target");
            sDescription = sParam2 + " " + sParam3;
        }
        else if (sParam1=="item")
        {
            sDescription = sParam3;
            oTest=GetFirstItemInInventory(oPC);
            while (GetIsObjectValid(oTest))
            {
                if (GetStringLowerCase(GetName(oTest))==sParam2)
                {
                    oTarget=oTest;
                    break;
                }
                oTest=GetNextItemInInventory(oPC);
            }
        }
        else if (sParam1=="object")
        {
            sDescription = sParam3;
            oTest=GetFirstObjectInArea(GetArea(oPC));
            while (GetIsObjectValid(oTest))
            {
                if (GetStringLowerCase(GetName(oTest))==sParam2)
                {
                    oTarget=oTest;
                    break;
                }
                oTest=GetNextObjectInArea(GetArea(oPC));
            }
        }
        if (!GetIsObjectValid(oTarget))
            SendMessageToPC(oPC, "Object/Item "+sParam2+" not found or target invalid.");
        else
        {
            SetDescription(oTarget, sDescription);
            SendMessageToPC(oPC, "Description set.");
        }
        return;
    }

    //Rename Object (placeables, NPCs).  Syntax is RenameObject <oldname> <newname> OR Rename #target <newname>
    if (sCommand=="renameobject" || sCommand=="rename")
    {
        if (sParam1=="" || sParam2=="")
        {
            SendMessageToPC(oPC, "Syntax is =RenameObject <oldname> <newname> OR rename #target <newname>.");
            return;
        }
        sParam1=GetStringLowerCase(sParam1);
        object oTarget;
        object oTest=GetFirstObjectInArea(GetArea(oPC));
        if (sParam1 == "#target")
            oTarget = GetLocalObject(oPC, "dmfi_univ_target");
        while (GetIsObjectValid(oTest) && !GetIsObjectValid(oTarget))
        {
            if (GetStringLowerCase(GetName(oTest))==sParam1)
            {
                oTarget=oTest;
                break;
            }
            oTest=GetNextObjectInArea(GetArea(oPC));
        }
        if (!GetIsObjectValid(oTarget))
            SendMessageToPC(oPC, "Object "+sParam1+" not found in area.");
        else
        {
            SetName(oTarget, sParam2);
            SendMessageToPC(oPC, "Object renamed to "+sParam2+".");
        }
        return;
    }


    //If none of these, then command is invalid.
    SendMessageToPC(oPC, "Invalid command.  Type =help for a list of available commands.");
    return;
}
