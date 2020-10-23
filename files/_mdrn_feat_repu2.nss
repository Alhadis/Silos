// Reputation check
#include "inc_d20"
void main()
{

            object oPC = GetPCSpeaker();
            object oTarg = GetLocalObject(oPC, "oMdrnTarget");
            int nRep = GetLocalInt(oPC, "nReputation");
            int nRoll = d20();
            int nTot = nRep + nRoll;
            int nDC = 24;
            if (oPC == oTarg || GetIsObjectValid(oTarg)==FALSE)
            {
                  SendMessageToPC(oPC, "Reputation check: "+IntToString(nRoll)+" (on a d20) + "+IntToString(nRep)+" Reputation = "+IntToString(nTot)+"; DC = 25 - Intelligence bonus of target.");
                    SendMessageToAllDMs(GetName(oPC)+" Reputation check: "+IntToString(nRoll)+" (on a d20) + "+IntToString(nRep)+" Reputation = "+IntToString(nTot)+"; DC = 25 - Intelligence bonus of target.");

            }
    else
    {
          if (GetFactionEqual(oPC, oTarg))
          {
                SendMessageToPC(oPC, "You cannot target members of your party with Reputation.");
                return;

          }

          else
          {
              if (GetLocalInt(oTarg, "nRepCheck")==1)
              {
                    SendMessageToPC(oPC, "This NPC has already been targeted with Reputation; they're now immune.");
                    return;
              }
              else
                    SetLocalInt(oTarg, "nRepCheck", 1);
              nTot = nTot + GetAbilityModifier(ABILITY_INTELLIGENCE, oTarg);
              if ( nTot > nDC)
              {
                   FloatingTextStringOnCreature(GetName(oTarg)+" has heard of "+GetName(oPC)+"'s reputation.", oPC);
                   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_PERSUADE, 4), oPC, 120.0);
                   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_BLUFF, 4), oPC, 120.0);
                   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_PERFORM, 4), oPC, 120.0);
                   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_GATHER_INFORMATION, 4), oPC, 120.0);
                   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_INTIMIDATE, 4), oPC, 120.0);
                   SendMessageToAllDMs(GetName(oPC)+" has used Reputation sucessfully with "+GetName(oTarg)+"; this has provided a +4 bonus to interpersonal skills, but could provide a -4 penalty instead if you think it's appropriate.");

              }
              else
              {
                    FloatingTextStringOnCreature(GetName(oTarg)+" has not heard of "+GetName(oPC)+"'s reputation.", oPC);
                    SendMessageToAllDMs(GetName(oPC)+" has failed to use Reputation with "+GetName(oTarg));


              }
          }

    }


}
