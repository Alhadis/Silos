/*
    Make sure the PC speaker has an item in their inventory
    Item tag stored as a variable on the object calling the conversation
*/

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF,"ItemToHave");
    if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),sItem)))
        return TRUE;

    return FALSE;
}
