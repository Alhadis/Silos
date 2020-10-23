//::///////////////////////////////////////////////////////////////////////////
//::
//::	0b_bevil_castat
//::
//::	Override for the magic trial.
//::
//::///////////////////////////////////////////////////////////////////////////
//  DBR 1/3/6
// DBR 4/26/6 - Disabled! Al but the dance.
#include "0_inc_popups"	

void AdvanceQuest(string sQuest, int nLevel, object oPCMember)
{
	if (GetGlobalInt(sQuest)<nLevel)
		SetGlobalInt(sQuest,nLevel);
	object oPCF = GetFirstFactionMember(oPCMember,FALSE);
	while (GetIsObjectValid(oPCF))
	{
		AddJournalQuestEntry(sQuest, nLevel, oPCF,FALSE);
		oPCF = GetNextFactionMember(oPCMember,FALSE);
	}
}	

void RettaBark(int nQuestState, object oChecker, float fDelay)
{
	//if (GetLocalInt(oChecker, "NW_JOURNAL_ENTRY" + "0_magic")==nQuestState)
	if (GetGlobalInt("0_magic")==nQuestState)
	{
		SpeakOneLinerConversation();
		DelayCommand(fDelay,RettaBark(nQuestState,oChecker,fDelay));
	}
}
	
void main()
{
	
	
	int nSpell = GetLastSpell();
	object oPC = GetLastSpellCaster();	
	if (nSpell==SPELL_ENLARGE_PERSON)
	{
		//if (GetLocalInt(GetFactionLeader(GetFirstPC()), "NW_JOURNAL_ENTRY" + "0_magic") == 30)
		if (GetGlobalInt("0_magic")==30)
		{
			PlayAnimation(ANIMATION_LOOPING_DANCE01,1.0f,5.0f);
		}
	}
	

	ExecuteScript("gb_comp_spell",OBJECT_SELF);
}