// experimental template for random quests

void Kronn3Bandits(object oContract)
{
    string bandit_name = RandomName();
    SetDescription(oContract,
        "Find and slay the bandit " + bandit_name + " last seen in the Kronn Hills west of Hommlet. Return his head to the Village Elder for a reward.");
    SetEncounterActive(TRUE,GetObjectByTag("KH3_Bandits"));
    SetEncounterActive(TRUE,GetObjectByTag("KH3_BanditLdr"));
    SetLocalInt(GetModule(),"bJobContract",1);
    SetLocalString(GetModule(),"sContractVillain",bandit_name);
    SetLocalString(GetModule(),"sJobContractItem","BanditLdrHead");
}

void MoathouseBrigands(object oContract)
{
    string bandit_name = RandomName();
    SetDescription(oContract,
        "Find and slay the bandit " + bandit_name + " last seen around the moathouse. Return his head to the Village Elder for a reward.");
    SetEncounterActive(TRUE,GetObjectByTag("MH_Bandits"));
    SetEncounterActive(TRUE,GetObjectByTag("MH_BanditLdr"));
    SetLocalInt(GetModule(),"bJobContract",1);
    SetLocalString(GetModule(),"sContractVillain",bandit_name);
    SetLocalString(GetModule(),"sJobContractItem","BanditLdrHead");
}

void SelectContract(object oContract)
{
    switch(d2())
    {
    case 1: Kronn3Bandits(oContract); break;
    case 2: MoathouseBrigands(oContract); break;
    }
}

void main()
{

    object oContract = CreateItemOnObject("jobcontract",GetPCSpeaker());
    SelectContract(oContract);
    AddJournalQuestEntry("hommlet_job_contract",0,GetPCSpeaker());


}
