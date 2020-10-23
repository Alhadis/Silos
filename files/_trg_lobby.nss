// _trg_lobby.nss
// This handles new players entering the lobby. It clears NWN gear and give starting items and gold.
// It also checks for malformed character exploits

#include "_inc_util"
#include "_inc_pw"
#include "nw_i0_tool"

void PCLoginEquipment() {    
        object oPC = OBJECT_SELF;

        pwScrubNewPC(oPC);
        StripInventory(oPC);
        GiveGoldToCreature(oPC, 400);

        // knife and clothes
        string item_ref     = "starting_knife";
        object knife        = CreateItemOnObject(item_ref,oPC,1,"knife_"+GetPCID(oPC));
        SetName(knife, GetName(oPC)+"'s knife");
        SetStolenFlag(knife, TRUE);

        // clothes
        string clothing_ref = "starting_clothes";
        object clothes  = CreateItemOnObject(clothing_ref,oPC,1,"clothes_"+GetPCID(oPC));
        SetName(clothes, GetName(oPC)+"'s clothes");
        SetStolenFlag(clothes, TRUE);

        ClearAllActions();
        ActionEquipItem(clothes,INVENTORY_SLOT_CHEST);
        DelayCommand(0.1, ActionEquipItem(clothes,INVENTORY_SLOT_CHEST));
}

void main()
{
    object enterer  = GetEnteringObject();

    if (!GetIsPC(enterer)) return;

    if(GetXP(enterer) == 1) {
        // set up starting equipment & gold
        AssignCommand(enterer, PCLoginEquipment() );
        DelayCommand(0.19, SendMessageToPC(enterer, " " ) );
        DelayCommand(0.2, SendMessageToPC(enterer, COLOR_OBJECT+GetName(GetArea(enterer))) );
        DelayCommand(0.21, SendMessageToPC(enterer, COLOR_DESCRIPTION+"You are not yet in character. Here you can adjust your character's appearance, and purchase starting equipment.") );
        DelayCommand(0.22, SendMessageToPC(enterer, " " ) );
        //SetCutsceneMode(enterer, FALSE);
        //StopFade(enterer);

        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DECK), enterer) );

        int DoOnce = GetLocalInt(enterer, GetTag(OBJECT_SELF));
        if (DoOnce==TRUE) return;
        SetLocalInt(enterer, GetTag(OBJECT_SELF), TRUE);
        RewardPartyXP(1000, enterer, FALSE);


        //DelayCommand(0.3, XPRewardByType("startingxp", enterer, 1000, XP_TYPE_QUEST, "All characters start play at second level.") );
    }
}








/*

#include "nw_i0_tool"
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int DoOnce = GetLocalInt(oenterer, GetTag(OBJECT_SELF));
if (DoOnce==TRUE) return;
SetLocalInt(oenterer, GetTag(OBJECT_SELF), TRUE);
RewardPartyXP(1000, oPC, FALSE);

}

*/
