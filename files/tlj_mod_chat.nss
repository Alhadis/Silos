////////////////////////////////////////////////////////////////////////////////
// Module's OnPlayerChat event script
////////////////////////////////////////////////////////////////////////////////

#include "tlj_inc_force"
#include "tlj_inc_casino"

// This function returns TRUE if sString contains sPhrase.
// This is just a wrapper around FindSubString() function, made for legibility purposes.
int StringHasPhrase(string sString, string sPhrase);

int StringHasPhrase(string sString, string sPhrase) {
    return (FindSubString(sString, sPhrase) != -1) ? TRUE : FALSE;
}

void main() {
    // Grab the speaker and make sure it's a PC. If not, then exit out now.
    object oPC = GetPCChatSpeaker();
    if (!GetIsPC(oPC)) return;

    // Variable declaration
    object oArea = GetArea(oPC);
    string sAreaTag = GetTag(oArea);
    string sText = GetPCChatMessage();
    string sPCName = GetName(oPC);

    if (GetCasinoVoice(oPC)) {

        // What is our casino game state?
        if (GetHasCasinoState(CASINO_STATE_BLACKJACK, oPC)) {  // Playing Black Jack                                        // Playing Black Jack
            CasinoCommandBlackjack(oPC, sText);
        }
        else if (GetHasCasinoState(CASINO_STATE_HOLDEM, oPC)) { // Playing Hold'em
            CasinoCommandHoldem(oPC, sText);
        }
        else {                                                  // Not playing anything
            CasinoCommandNoGame(oPC, sText);
        }
    }

    // This checks to see if the PC is editing ID data
    if (GetLocalInt(oPC, "ID_EDIT_SPEAK_ON")) {
        SetLocalString(oPC, "ID_EDIT_CHAT", sText);
        SetPCChatMessage();
    }

    else if (GetLocalInt(oPC, "DM_SPEAK")) {
        SetLocalString(oPC, "DM_SPEAK", sText);
        SetPCChatMessage();
    }

    // This section looks to see if the spoken text is a text command for
    // switching fighting styles, performing emotes, or rolling dice.
    else if (GetStringLeft(sText, 1) == "/" && GetStringLeft(sText, 2) != "//") {

        // Splice the token from the actual text command
        string sTC = GetStringLowerCase(GetStringRight(sText, GetStringLength(sText) - 1));
        int bTCFailed;


    // Fighting styles
        if (StringHasPhrase(sTC, "style")) {
            int bSetSpeedPenalty;
            int bClearSpeedPenalty = (GetPhenoType(oPC) == PHENO_CRAWLING) ? TRUE : FALSE;

            if (StringHasPhrase(sTC, "arcane") && (GetIsDM(oPC) || GetIsDMPossessed(oPC) || GetIsDarkSide(oPC) || GetIsLightSide(oPC))) SetPhenoType(PHENO_ARCANE, oPC);
            else if (StringHasPhrase(sTC, "assassin")) SetPhenoType(PHENO_ASSASSIN, oPC);
            else if (StringHasPhrase(sTC, "bearclaw")) SetPhenoType(PHENO_BEARCLAW, oPC);
            else if (StringHasPhrase(sTC, "crawling")) {
                SetPhenoType(PHENO_CRAWLING, oPC);
                bSetSpeedPenalty = TRUE;
                bClearSpeedPenalty = FALSE;
            }
            else if (StringHasPhrase(sTC, "demonblade")) SetPhenoType(PHENO_DEMONBLADE, oPC);
            else if (StringHasPhrase(sTC, "dragonpalm")) SetPhenoType(PHENO_DRAGONPALM, oPC);
            else if (StringHasPhrase(sTC, "fencing")) SetPhenoType(PHENO_FENCING, oPC);
            else if (StringHasPhrase(sTC, "heavy")) SetPhenoType(PHENO_HEAVY, oPC);
            else if (StringHasPhrase(sTC, "kensai")) SetPhenoType(PHENO_KENSAI, oPC);
            else if (StringHasPhrase(sTC, "sunfist")) SetPhenoType(PHENO_SUNFIST, oPC);
            else if (StringHasPhrase(sTC, "tigerfang")) SetPhenoType(PHENO_TIGERFANG, oPC);
            else if (StringHasPhrase(sTC, "warrior")) SetPhenoType(PHENO_WARRIOR, oPC);
            else SetPhenoType(PHENOTYPE_NORMAL, oPC);

            if (bSetSpeedPenalty) {
                effect eSpeedPenalty = EffectMovementSpeedDecrease(75);
                       eSpeedPenalty = SupernaturalEffect(eSpeedPenalty);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpeedPenalty, oPC);
            }
            else if (bClearSpeedPenalty) {
                effect eCycle = GetFirstEffect(oPC);
                while (GetIsEffectValid(eCycle)) {
                    if (GetEffectType(eCycle) == EFFECT_TYPE_MOVEMENT_SPEED_DECREASE) {
                        if (GetEffectSubType(eCycle) == SUBTYPE_SUPERNATURAL) {
                            if (GetEffectDurationType(eCycle) == DURATION_TYPE_PERMANENT) {
                                RemoveEffect(oPC, eCycle);
                                break;
                            }
                        }
                    }
                    eCycle = GetNextEffect(oPC);
                }
            }
        }
    // Emotes
        else if (StringHasPhrase(sTC, "bow") || StringHasPhrase(sTC, "curts")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW));
        else if (StringHasPhrase(sTC, "duck")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK));
        else if (StringHasPhrase(sTC, "dodge")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_SIDE));
        else if (StringHasPhrase(sTC, "drink")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DRINK, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
        }
        else if (StringHasPhrase(sTC, "wave")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING));
        else if (StringHasPhrase(sTC, "look")) {
            if (StringHasPhrase(sTC, "left")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT));
            else if (StringHasPhrase(sTC, "right")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT));
            else if (StringHasPhrase(sTC, "far")) {
                if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 99999.0));
                else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR));
            }
        }
        else if (StringHasPhrase(sTC, "tire")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED));
        }
        else if (StringHasPhrase(sTC, "bored")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED));
        else if (StringHasPhrase(sTC, "cheer") || StringHasPhrase(sTC, "victory")) {
            int nCheerNum;
            if (StringHasPhrase(sTC, "1")) nCheerNum = 1;
            else if (StringHasPhrase(sTC, "2")) nCheerNum = 2;
            else if (StringHasPhrase(sTC, "3")) nCheerNum = 3;
            else nCheerNum = d3();
            if (nCheerNum == 1) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
            else if (nCheerNum == 2) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2));
            else if (nCheerNum == 3) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3));
        }
        else if (StringHasPhrase(sTC, "scratch") && StringHasPhrase(sTC, "head")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD));
        else if (StringHasPhrase(sTC, "read")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_READ));
        else if (StringHasPhrase(sTC, "salute")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE));
        else if (StringHasPhrase(sTC, "spasm")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_SPASM));
        }
        else if (StringHasPhrase(sTC, "steal") || StringHasPhrase(sTC, "snatch")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_STEAL));
        else if (StringHasPhrase(sTC, "taunt")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
        else if (StringHasPhrase(sTC, "laugh")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING));
        }
        else if (StringHasPhrase(sTC, "threaten")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL));
        }
        else if (StringHasPhrase(sTC, "beg") || StringHasPhrase(sTC, "plead")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING));
        }
        else if (StringHasPhrase(sTC, "nod")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN));
        }
        else if (StringHasPhrase(sTC, "talk")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL));
        }
        else if (StringHasPhrase(sTC, "sing")) ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_BARD_SONG), oPC, 6.0);
        else if ((StringHasPhrase(sTC, "fold") || StringHasPhrase(sTC, "cross")) && StringHasPhrase(sTC, "arm")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_FOLD_ARMS, 1.0, 99999.0));
        else if (StringHasPhrase(sTC, "crouch")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CROUCH, 1.0, 99999.0));
        else if (StringHasPhrase(sTC, "smoke")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SMOKE, 1.0, 99999.0));
        else if (StringHasPhrase(sTC, "worship")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 99999.0));
        else if (StringHasPhrase(sTC, "drunk")) {
            if (StringHasPhrase(sTC, "loop")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK));
        }
        else if (StringHasPhrase(sTC, "meditate")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 99999.0));
        else if (StringHasPhrase(sTC, "sit")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 99999.0));
        else if (StringHasPhrase(sTC, "shift")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 99999.0));
        else if (StringHasPhrase(sTC, "fall") || StringHasPhrase(sTC, "flop") || (StringHasPhrase(sTC, "lay") && StringHasPhrase(sTC, "down"))) {
            if (StringHasPhrase(sTC, "back")) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 99999.0));
            else AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 99999.0));
        }
    // Dice rolling, skills
        if (StringHasPhrase(sTC, "roll")) {
            if (StringHasPhrase(sTC, "alteration")) {
                int nSkill = GetSkillRank(SKILL_ALTERATION, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Alteration: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Alteration: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "animal") && StringHasPhrase(sTC, "handl")) {
                int nSkill = GetSkillRank(SKILL_HANDLE_ANIMAL, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Animal Handling: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Animal Handling: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "appraise")) {
                int nSkill = GetSkillRank(SKILL_APPRAISE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Appraise: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Appraise: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "bluff")) {
                int nSkill = GetSkillRank(SKILL_BLUFF, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Bluff: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Bluff: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "computer") && StringHasPhrase(sTC, "use")) {
                int nSkill = GetSkillRank(SKILL_COMPUTER_USE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Computer Use: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Computer Use: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "concentration")) {
                int nSkill = GetSkillRank(SKILL_CONCENTRATION, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Concentration: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Concentration: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "control")) {
                int nSkill = GetSkillRank(SKILL_CONTROL, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Control: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Control: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "demolition")) {
                int nSkill = GetSkillRank(SKILL_DEMOLITIONS, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Demolitions: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Demolitions: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "disable") && StringHasPhrase(sTC, "device")) {
                int nSkill = GetSkillRank(SKILL_DISABLE_DEVICE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Disable Device: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Disable Device: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "discipline")) {
                int nSkill = GetSkillRank(SKILL_DISCIPLINE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Discipline: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Discipline: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "heal")) {
                int nSkill = GetSkillRank(SKILL_HEAL, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Heal: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Heal: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "hide")) {
                int nSkill = GetSkillRank(SKILL_HIDE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Hide: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Hide: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "intimidate")) {
                int nSkill = GetSkillRank(SKILL_INTIMIDATE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Intimidate: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Intimidate: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "listen")) {
                int nSkill = GetSkillRank(SKILL_LISTEN, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Listen: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Listen: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "knowledge")) {
                int nSkill = GetSkillRank(SKILL_LORE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Knowledge: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Knowledge: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "move") && StringHasPhrase(sTC, "silent")) {
                int nSkill = GetSkillRank(SKILL_MOVE_SILENTLY, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Move Silently: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Move Silently: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "security") || (StringHasPhrase(sTC, "open") && StringHasPhrase(sTC, "lock"))) {
                int nSkill = GetSkillRank(SKILL_OPEN_LOCK, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Open Lock: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Open Lock: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "parry")) {
                int nSkill = GetSkillRank(SKILL_PARRY, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Parry: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Parry: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "perform")) {
                int nSkill = GetSkillRank(SKILL_PERFORM, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Perform: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Perform: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "persuade")) {
                int nSkill = GetSkillRank(SKILL_PERSUADE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Persuade: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Persuade: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "sleight") && StringHasPhrase(sTC, "hand")) {
                int nSkill = GetSkillRank(SKILL_SLEIGHT_OF_HAND, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Sleight of Hand: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Sleight of Hand: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "spot")) {
                int nSkill = GetSkillRank(SKILL_SPOT, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Spot: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Spot: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "taunt")) {
                int nSkill = GetSkillRank(SKILL_TAUNT, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Taunt: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Taunt: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "tumble") || StringHasPhrase(sTC, "acrobatic")) {
                int nSkill = GetSkillRank(SKILL_TUMBLE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Acrobatics: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Acrobatics: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "repair")) {
                int nSkill = GetSkillRank(SKILL_REPAIR, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Repair: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Repair: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "sense")) {
                int nSkill = GetSkillRank(SKILL_SENSE, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Sense: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Sense: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "search") || StringHasPhrase(sTC, "investigate")) {
                int nSkill = GetSkillRank(SKILL_SEARCH, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Search/Investigate: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Search/Investigate: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "alchemy")) {
                int nSkill = GetSkillRank(SKILL_ALCHEMY, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Alchemy: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Alchemy: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "pilot")) {
                int nSkill = GetSkillRank(SKILL_PILOT, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Pilot: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Pilot: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "metallurgy")) {
                int nSkill = GetSkillRank(SKILL_METALLURGY, oPC);
                int nRoll = d20();
                int nTotal = nSkill + nRoll;
                string sSkill = IntToString(nSkill);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Metallurgy: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Metallurgy: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "purple")) {// Joke roll... doesn't mean anything
                int nRoll = d20();
                string sRoll = IntToString(nRoll);
                string sSkill;
                string sTotal;
                if (GetPCPlayerName(oPC) == "LoganTenhet") {
                    sSkill = "127";
                    sTotal = "Win";
                }
                else {
                    sSkill = "0";
                    sTotal = "Fail";
                }
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Purple: " + sSkill + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Purple: " + sSkill + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "sexy")) {// Joke roll... doesn't mean anything
                int nRoll = d20();
                int nAbility = GetAbilityModifier(ABILITY_CHARISMA, oPC);
                string sRoll = IntToString(nRoll);
                string sAbility = IntToString(nAbility);
                string sTotal;
                if (GetPCPlayerName(oPC) == "LoganTenhet" || nRoll >= 15) {
                    sAbility = "627";
                    sTotal = "Win";
                }
                else {
                    sTotal = "Fail";
                }
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Sexy: " + sAbility + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Sexy: " + sAbility + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
    // Dice rolling, abilities
            else if (StringHasPhrase(sTC, "strength")) {
                int nAbility = GetAbilityModifier(ABILITY_STRENGTH, oPC);
                int nRoll = d20();
                int nTotal = nAbility + nRoll;
                string sAbility = IntToString(nAbility);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Strength: " + sAbility + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Strength: " + sAbility + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "dexterity")) {
                int nAbility = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
                int nRoll = d20();
                int nTotal = nAbility + nRoll;
                string sAbility = IntToString(nAbility);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Dexterity: " + sAbility + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Dexterity: " + sAbility + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "constitution")) {
                int nAbility = GetAbilityModifier(ABILITY_CONSTITUTION, oPC);
                int nRoll = d20();
                int nTotal = nAbility + nRoll;
                string sAbility = IntToString(nAbility);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Constitution: " + sAbility + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Constitution: " + sAbility + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "intelligence")) {
                int nAbility = GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
                int nRoll = d20();
                int nTotal = nAbility + nRoll;
                string sAbility = IntToString(nAbility);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Intelligence: " + sAbility + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Intelligence: " + sAbility + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "wisdom")) {
                int nAbility = GetAbilityModifier(ABILITY_WISDOM, oPC);
                int nRoll = d20();
                int nTotal = nAbility + nRoll;
                string sAbility = IntToString(nAbility);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Wisdom: " + sAbility + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Wisdom: " + sAbility + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "charisma")) {
                int nAbility = GetAbilityModifier(ABILITY_CHARISMA, oPC);
                int nRoll = d20();
                int nTotal = nAbility + nRoll;
                string sAbility = IntToString(nAbility);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Charisma: " + sAbility + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Charisma: " + sAbility + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
    // Dice rolls, saves
            else if (StringHasPhrase(sTC, "fort")) {
                int nSave = GetFortitudeSavingThrow(oPC);
                int nRoll = d20();
                int nTotal = nSave + nRoll;
                string sSave = IntToString(nSave);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Fortitude: " + sSave + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Fortitude: " + sSave + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "will")) {
                int nSave = GetWillSavingThrow(oPC);
                int nRoll = d20();
                int nTotal = nSave + nRoll;
                string sSave = IntToString(nSave);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Will: " + sSave + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Will: " + sSave + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "reflex")) {
                int nSave = GetReflexSavingThrow(oPC);
                int nRoll = d20();
                int nTotal = nSave + nRoll;
                string sSave = IntToString(nSave);
                string sRoll = IntToString(nRoll);
                string sTotal = IntToString(nTotal);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Reflex: " + sSave + " + " + sRoll + " = " + sTotal));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls Reflex: " + sSave + " + " + sRoll + " = " + sTotal, TALKVOLUME_SILENT_SHOUT));
            }
    // Dice rolls, miscellaneous

            else if (StringHasPhrase(sTC, "d3")) {
                int nRoll = d3();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d3: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d3: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "d4")) {
                int nRoll = d4();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d4: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d4: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "d6")) {
                int nRoll = d6();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d6: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d6: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "d8")) {
                int nRoll = d8();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d8: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d8: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }

            else if (StringHasPhrase(sTC, "d12")) {
                int nRoll = d12();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d12: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d12: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "d20")) {
                int nRoll = d20();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d20: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d20: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "d100")) {
                int nRoll = d100();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d100: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d100: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "d2")) {
                int nRoll = d2();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d2: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d2: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else if (StringHasPhrase(sTC, "d10")) {
                int nRoll = d10();
                string sRoll = IntToString(nRoll);
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d10: " + sRoll));
                AssignCommand(oPC, ActionSpeakString(sPCName + " rolls d10: " + sRoll, TALKVOLUME_SILENT_SHOUT));
            }
            else bTCFailed = TRUE;
        }
        else if (StringHasPhrase(sTC, "check")) {
            if (StringHasPhrase(sTC, "force")) {
                FloatingTextStringOnCreature("Your force is at " + IntToString(GetForce(oPC)), oPC, FALSE);
            }
            else if (StringHasPhrase(sTC, "BBD") || (StringHasPhrase(sTC, "blaster") && StringHasPhrase(sTC, "bolt") && StringHasPhrase(sTC, "deflect"))) {
                FloatingTextStringOnCreature("Your blaster bolt deflection is at " + FloatToString(GetBlasterBoltDeflectRange(oPC)) + "/" + FloatToString(GetBlasterBoltDeflectPercentile(oPC)) + "%", oPC, FALSE);
            }
            else bTCFailed = TRUE;
        }
        else if (StringHasPhrase(sTC, "ooc") && StringHasPhrase(sTC, "area")) {
            // Don't allow those in the idiot room to jump out
            if (sAreaTag != "IDIOT_ROOM") {
                AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_OOCAreaToCoruscant"))));
            }
        }
        else bTCFailed = TRUE;

        if (bTCFailed) FloatingTextStringOnCreature("Invalid text command: " + sTC, oPC, FALSE);

        // Delete the voice command text so it doesn't show up in the logs
        SetPCChatMessage();
    }
}
