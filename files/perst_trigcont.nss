/*
    Used on a trigger surrounding a container to retrieve or place a
    persistant container creature for the container at a given waypoint.
    Waypoint tag must be WP_cc_<tag of container>
    Trigger and container must have the same tag.
*/
void main()
{
    // if triggered once then don't do again
    if (GetLocalInt(OBJECT_SELF,"Done") == 1)
        return;

    SetLocalInt(OBJECT_SELF,"Done",1);

    string sDBase  = GetTag(GetModule());
    string sCreature  = "cc_"+GetTag(OBJECT_SELF);
    location oCreatureLoc = GetLocation(GetObjectByTag("WP_"+sCreature));
    object oCreature = GetObjectByTag(sCreature);

    // retrieve database store object or place new one
    if (oCreature == OBJECT_INVALID)
    {
        // try fetching and check if it was successful
        if (RetrieveCampaignObject(sDBase,sCreature,oCreatureLoc) == OBJECT_INVALID)
        {
            //and if it wasn't found place a new creature
            CreateObject(OBJECT_TYPE_CREATURE,"cc_basiccreature",oCreatureLoc,FALSE,sCreature);
        }
        SetName(GetObjectByTag(sCreature),sCreature);
        SendMessageToAllDMs("Persistant container "+GetTag(OBJECT_SELF)+" initiated.");
    }
    oCreature = GetObjectByTag(sCreature);
    if (oCreature == OBJECT_INVALID)
    {
        SendMessageToAllDMs("Container "+sCreature+" has a problem.");
    }
}
