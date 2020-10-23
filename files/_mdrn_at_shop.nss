void main()
{
    object oPC = GetPCSpeaker();
    object oHench = GetNearestObjectByTag("_mdrn_store", oPC);
    int nFound = 1;

    if (GetIsObjectValid(oHench)==FALSE || GetDistanceBetween(oHench, oPC) > 30.0)
    {
        oHench =GetNearestObjectByTag("_mdrn_pawnshop", oPC);
        if (GetIsObjectValid(oHench)==FALSE || GetDistanceBetween(oHench, oPC) > 30.0)
            nFound = 0;
    }
    if (nFound == 1)
    {
        SetUseableFlag(oHench, TRUE);
        AssignCommand(oPC, ActionInteractObject(oHench));
        DelayCommand(12.0, SetUseableFlag(oHench, FALSE));
    }
    else
    {
        object oStore = GetNearestObject(OBJECT_TYPE_STORE);
        if (GetIsObjectValid(oStore) == TRUE)
        {
            OpenStore(oStore, GetPCSpeaker());
        }
        else
        {
            ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
        }
    }
}
