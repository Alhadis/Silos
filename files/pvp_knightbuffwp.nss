#include "x2_inc_itemprop"
#include "sr_mny_trade_inc"
void main()
{
    object oPC=GetPCSpeaker();

   if (adjustAndCheck(GetPCSpeaker(), 5000) )
    {
        ActionPauseConversation();
        SpeakString ("You cannot afford this purchase", TALKVOLUME_TALK);
    }
    else if (GetGold(GetPCSpeaker()) >= 5000)
    {
        if (GetLocalInt (oPC, "wpgiven") == TRUE)
        {
            ActionPauseConversation();
            SpeakString ("Spell was already given", TALKVOLUME_TALK);
        }
        else if (GetLocalInt (oPC, "wpgiven") == FALSE)
        {
            TakeGoldFromCreature (5000, oPC, TRUE);
            adjustAllowedMoney ( oPC, GetGold(oPC) - 5000 );
            SetLocalInt (oPC, "wpgiven", TRUE);
            ActionCastFakeSpellAtObject(SPELL_ICE_STORM, oPC);
            object oWeapon=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

            if (!GetIsObjectValid(oWeapon)) return;
            int nDur=DURATION_TYPE_INSTANT;
            effect e1=EffectVisualEffect(VFX_IMP_LIGHTNING_M);
            itemproperty ipAdd = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGEBONUS_2);
            itemproperty ipAddv = ItemPropertyVisualEffect(ITEM_VISUAL_ELECTRICAL);

            ActionDoCommand(ApplyEffectToObject(nDur, e1, oPC));
            DelayCommand(3.0, IPSafeAddItemProperty(oWeapon, ipAdd, RoundsToSeconds(20)));
            DelayCommand(3.0, IPSafeAddItemProperty(oWeapon, ipAddv, RoundsToSeconds(20)));

            DelayCommand(RoundsToSeconds(20), SetLocalInt (oPC, "wpgiven", FALSE));

        }
    }
}

