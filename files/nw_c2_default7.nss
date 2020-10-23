//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT7
/*
  Default OnDeath event handler for NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "x2_inc_compon"
#include "x0_i0_spawncond"
#include "_mdrn_inc_sound"

void main()
{
    // Sound scheme additions
    object oGun = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, GetLastKiller());
    int iType = GetBaseItemType(oGun);
    if ( iType == BASE_ITEM_SHORTBOW
         || iType == BASE_ITEM_LONGBOW
         || iType == BASE_ITEM_LIGHTCROSSBOW
         || iType == BASE_ITEM_HEAVYCROSSBOW || GetLocalInt(oGun, "nMdrnChainsaw")==1)
    {
      //  object oBully = GetLastKiller();
      //  string sSound = GetProjectileDeadSound(oBully,OBJECT_SELF,GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oBully));
      // object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oBully),FALSE,"GunShot");
       // DelayCommand(0.05, AssignCommand(oSound, PlaySound(sSound)));
       // DelayCommand(1.0, DestroyObject(oSound));
    }

    if (GetLocalInt(OBJECT_SELF,"SOUNDOFF") == 1)
    {
         SetLocalInt(OBJECT_SELF,"SOUNDOFF",0);
         return;
    }
    //end of soundscheme additions
    if (GetLocalInt(OBJECT_SELF, "nMdrnVehicle")==1)
        return;
    SetLocalInt(OBJECT_SELF, "nMdrnNPCDeath", 1);
    DelayCommand(30.0, SetLocalInt(OBJECT_SELF, "nMdrnNPCDeath", 0));
    SetLocalInt(OBJECT_SELF, "nd203RoundsDead", 0);
    SetLocalInt(OBJECT_SELF, "nD203MinutesDead", 0);
    DelayCommand(48.0, SetLocalInt(OBJECT_SELF, "nd203RoundsDead", 1));
    DelayCommand(210.0, SetLocalInt(OBJECT_SELF, "nD203MinutesDead", 1));
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oKiller = GetLastKiller();

    // If we're a good/neutral commoner,
    // adjust the killer's alignment evil
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    // NOTE: the OnDeath user-defined event does not
    // trigger reliably and should probably be removed
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
         SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    craft_drop_items(oKiller);
}
