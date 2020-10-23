//:://////////////////////////////////////////////////
//:: X0_ONITEMACTV
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
Common script to be used as OnActivateItem script for
all modules. Executes the script with a name matching
the tag of the item being activated. Functions like
GetItemActivator() and GetItemActivatedTarget() will
work in these scripts, since they are being executed
from the perspective of the module itself. ???

Credit for this idea belongs to tjm, who posted it to
nwvault.ign.com.

 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 09/27/2002
//:://////////////////////////////////////////////////

// Modified for D20 Modern by Forrestwolf. Be sure to include all lines below if adding to your
// module's script.

#include "inc_d20"
void main()
{
    object oItem = GetItemActivated();
    object oTarget = GetItemActivatedTarget();
    object oUser = GetItemActivator();

    if(GetTag(oItem) == "sly_musicwand")
    {
        AssignCommand(oUser, ActionStartConversation(oUser, "sly_music_conv", TRUE, FALSE));
        return;
    }
    SetLocalObject(oUser, "dmfi_item",oItem);
    SetLocalObject(oUser, "dmfi_target",oTarget);
    SetLocalLocation(oUser, "dmfi_location",GetItemActivatedTargetLocation());
    ExecuteScript("dmfi_activate", GetItemActivator());
    string sLeft = GetStringLeft(GetTag(oItem), 3);
    if (GetTag(oItem)=="_super_power")
        ExecuteScript("_super_power", oItem);
    else
        ExecuteScript(GetTag(GetItemActivated()), oUser);
}
