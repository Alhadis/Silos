// Reputation check made by DM
#include "inc_d20"
void main()
{

            object oPC = GetPCSpeaker();
            object oTarg = GetLocalObject(oPC, "oMdrnTarget");
            int nRep = GetLocalInt(oTarg, "nReputation");
            int nRoll = d20();
            int nTot = nRep + nRoll;
            int nDC = 24;

              SendMessageToPC(oPC, "Reputation check: "+IntToString(nRoll)+" (on a d20) + "+IntToString(nRep)+" Reputation = "+IntToString(nTot)+"; DC = 25 - Intelligence bonus of target.");





}
