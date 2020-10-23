// Note by Forrestwolf:  This system has been bypassed by the more active feat-based Reputation system I've built.
// This system might be better for a non-DM'd module; if you'd prefer to use it, just change _mdrn_feat_repu to
// notify the PC that the 'active' system is not used in your module, and use this system instead.

#include "_mdrn_include"
// Coded by Yare, Janurary 2004

//The following two functions are all a builder needs to implement D20 Modern
//Reputation into their modules. Read all of the comments for instructions and
//explainations.

//int GetIsMdrnRecognized(object oTarget, object oObserver)
/*********************************************************************************\
* Returns REPUTATION_RECOGNIZED (1) if successful, else REPUTATION_IGNORED (0).   *
* Run this function at the beginning of NPC interactions and store the result.    *
* - oObserver: Generally the NPC checking the reputation                          *
* - oTarget:  Generally the PC who's reputation is being checked                  *
\*********************************************************************************/

//int GetIsMdrnSkillSuccessful(object oTarget, object oObserver, int nSkill, int nDifficulty, int nRecognized)
/***************************************************************************************************\
* Returns the result of a skill check modified by a PC's reputation                                 *
* - oTarget: The target of the charisma-based skill                                                 *
* - oObserver: The person using the charisma-based skill.                                           *
* - nSkill: skill to use (Bluff, Diplomacy, Gather Information, Intimidate, Perform)                *
* - nDifficulty: The score to beat and make a successful skillcheck                                 *
* - nRecognized: Has this NPC recognized the PC? Usually pipe your var for D20ReputationCheck here  *
\***************************************************************************************************/


//     "Every hero gains reputation of one sort or another as his or her career
// progresses, expressed as a Reputation bonus. Reputation is used to determine
// whether an NPC recognizes you. While a hero might try to take advantage of
// his reputation from time to time ('Hey! Don't you know who I am?!'), usually
// the hero's reputation preceeds him-whether he wants it to or not.
//     Those who recognize the hero are more likely to help him or do what he
// asks, provided the reputation has a positive connotation to the NPC who
// recognizes him. A high Reputation bonus also makes it difficult for a hero
// to mask his identity, which can be a problem if he's trying not to be
// noticed.
//     Most of the time, a hero doesn't decide to use his reputation. The GM
// decides when a hero's reputation can be relevant to a scene or encounter.
// At the moment it becomes relevant, the GM makes a reputation check for a
// NPC who might be influenced in some fashion due to the hero's fame or
// notoriety, as detailed below."
//
//     When a NPC has a positive view of a PC's reputation, then the PC is
// considered "Famous" to that NPC. Fame, when recognized, provides a bonus to
// certain Charisma-based skill checks.
//     When an NPC has a negative view of a PC's reputation, the PC is
// considered "Infamous" by the NPC. Infamy, when recognized, provides a penalty
// to certain Charisma-based skill checks.
//
// A Reputation check to see whether an NPC recognizes the character is made as
// follows:     (DC 25 to Recognize) vs. (1d20 + PC Reputation + NPC Int Mod)
// If the NPC successfully recognizes the PC, this provides a +/- 4 bonus or
// penalty on the following checks: Bluff, Diplomacy, Gather Information,
// Intimidate, and Perform.



// Here's a 3-step guide on using reputation in your conversations:
//
// 1: Run a GetIsMdrnRecognized and store the result in a var named "Rec" or
// something to see if the NPC recognized the player based on their reputation.
//
// 2: Use GetIsMdrnSkillSuccessful and put your "Rec" variable in the nRecognized parameter.
//
// 3: Enjoy the results. GetIsMdrnSkillSuccessful will give a +4 bonus to skills if
// faction with the NPC was >= INFAMOUS_THRESHOLD and PC was recognized, -4 to skills if faction
// was <= INFAMOUS_THRESHOLD and PC was recognized, and no bonus or penalty if the PC was not
// recognized



//*******************************************************************************//
// This function returns the class- and level-based reputation score of oTarget. //
//*******************************************************************************//
int GetMdrnReputationScore(object oTarget)
{
    int Reputation = 0;
    int ClassLevel = 0;


       ClassLevel = GetLevelByClass(CLASS_TYPE_TOUGH, oTarget);
       if (ClassLevel >= 3)
       {
            Reputation = Reputation + 1 ;
            if (ClassLevel >= 6)
            {
                Reputation = Reputation + 1;
                if (ClassLevel >= 9)
                {
                    Reputation = Reputation + 1;
                }
            }
       }

       ClassLevel = GetLevelByClass(CLASS_TYPE_CHARISMATIC, oTarget);
       if (ClassLevel >= 1)
       {
            Reputation = Reputation + 2 ;
            if (ClassLevel >= 4)
            {
                Reputation = Reputation + 1;
                if (ClassLevel >= 7)
                {
                    Reputation = Reputation + 1;
                    if (ClassLevel >= 10)
                    {
                        Reputation = Reputation + 1;
                    }
                }
            }
       }

       ClassLevel = GetLevelByClass(CLASS_TYPE_DEDICATED, oTarget);
       if (ClassLevel >= 1)
       {
            Reputation = Reputation + 1 ;
            if (ClassLevel >= 4)
            {
                Reputation = Reputation + 1;
                if (ClassLevel >= 7)
                {
                    Reputation = Reputation + 1;
                    if (ClassLevel >= 10)
                    {
                        Reputation = Reputation + 1;
                    }
                }
            }
       }

       ClassLevel = GetLevelByClass(CLASS_TYPE_STRONG, oTarget);
       if (ClassLevel >= 5)
       {
            Reputation = Reputation + 1 ;
            if (ClassLevel >= 9)
            {
                Reputation = Reputation + 1;
            }
       }

       ClassLevel = GetLevelByClass(CLASS_TYPE_SMART, oTarget);
       if (ClassLevel >= 1)
       {
            Reputation = Reputation + 1 ;
            if (ClassLevel >= 4)
            {
                Reputation = Reputation + 1;
                if (ClassLevel >= 7)
                {
                    Reputation = Reputation + 1;
                    if (ClassLevel >= 10)
                    {
                        Reputation = Reputation + 1;
                    }
                }
            }
       }

       ClassLevel = GetLevelByClass(CLASS_TYPE_FAST, oTarget);
       if (ClassLevel >= 3)
       {
            Reputation = Reputation + 1 ;
            if (ClassLevel >= 6)
            {
                Reputation = Reputation + 1;
                if (ClassLevel >= 9)
                {
                    Reputation = Reputation + 1;
                }
            }
       }

    //Adjust for feats that influence reputation bonuses. +3 for each renown, -3 for each low profile
    Reputation = Reputation + ( 3 * GetHasFeat(FEAT_RENOWN,oTarget));
    Reputation = Reputation - ( 3 * GetHasFeat(FEAT_LOW_PROFILE,oTarget));

    SendDebugMessage("REPUTATION-GetMdrnReputationScore: " + GetName(oTarget) + "'s Reputation was calculated to be " + IntToString(Reputation));

    return Reputation;

}


//****************************************************************************//
// Makes a reputation check returning 1 if PC is recognized by the NPC Caller //
//****************************************************************************//

int GetIsMdrnRecognized(object oTarget, object oObserver)
{
    //Reputation Check Succeeds
    if (d20(1) + GetMdrnReputationScore(oTarget) + GetAbilityModifier(ABILITY_INTELLIGENCE, oObserver) >= 25)
    {
        SendDebugMessage("REPUTATION-GetIsMdrnRecognized: Reputation check by " + GetName(oObserver) + " on " + GetName(oTarget) + " was successful.");
        return REPUTATION_RECOGNIZED;
    }

    //Reputation Check Fails
    SendDebugMessage("REPUTATION-GetIsMdrnRecognized: Reputation check by " + GetName(oObserver) + " on " + GetName(oTarget) + " was unsuccessful.");
    return REPUTATION_IGNORED;
}


//****************************************************************************//
// Makes a best guess if an NPC would find a PC famous or infamous by faction //
//****************************************************************************//

int GetAttitude(object oTarget, object oObserver)
{
    //Faction with this NPC is 40 or more. We're famous!
    if (GetReputation(oObserver, oTarget) >= INFAMOUS_THRESHOLD)
    {
        SendDebugMessage("REPUTATION-GetAttitude: " + GetName(oObserver) + " finds " + GetName(oTarget) + " famous!");
        return ATTITUDE_FAMOUS;
    }

    //Faction with NPC is 39 or less. We are infamous. Thats like famous only it sucks.
    SendDebugMessage("REPUTATION-GetAttitude: " + GetName(oObserver) + " finds " + GetName(oTarget) + " infamous!");
    return ATTITUDE_INFAMOUS;
}

//****************************************************************************//
// D20MM Wrapper for the skills. Function will apply reputation when necessary//
//****************************************************************************//

// Returns the result of a skill check modified by a PC's reputation
// - oTarget: The target of the charisma-based skill. Null if you aren't making a reputation skill check.
// - oObserver: The person using the charisma-based skill.
// - nSkill: skill to use (Bluff, Diplomacy, Gather Information, Intimidate, Perform, etc...)
// - nDifficulty: The score to beat and make a successful skillcheck
// - nRecognized: Has this NPC recognized the PC? Usually pipe your var for D20ReputationCheck here. Null if you don't care about reputation.

int GetIsMdrnSkillSuccessful(object oTarget, object oObserver, int nSkill, int nDifficulty, int nRecognized)
{
    if (Get2DAString("skills", "KeyAbility", nSkill) == "CHA")
    {
        if (nRecognized == REPUTATION_RECOGNIZED)
        {
            if (GetAttitude(oTarget, oObserver) == ATTITUDE_FAMOUS)
            {
                //good reputation makes check easier by 4
                SendDebugMessage("REPUTATION-GetIsMdrnSkillSuccessful: " + GetName(oTarget) + " is granted a +4 Bonus to Charisma-based skills for being famous to " + GetName(oObserver) + "!");
                return GetIsSkillSuccessful(oObserver, nSkill, nDifficulty - 4);
            }
            else
            {
                //bad reputation makes check more difficult by 4
                SendDebugMessage("REPUTATION-GetIsMdrnSkillSuccessful: " +GetName(oTarget) + " is levied a -4 Penalty to Charisma-based skills for being infamous to " + GetName(oObserver) + ".");
                return GetIsSkillSuccessful(oObserver, nSkill, nDifficulty + 4);
            }
        }
    }
    SendDebugMessage("REPUTATION-GetIsMdrnSkillSuccessful: Non-charisma-based skill, or " +GetName(oTarget)+ "'s reputation was not recognized by " + GetName(oObserver) + ".");
    return GetIsSkillSuccessful(oObserver, nSkill, nDifficulty);

}
