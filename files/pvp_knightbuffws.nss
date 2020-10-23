#include "x2_inc_itemprop"
#include "sr_mny_trade_inc"
void main()
{
    object oPC=GetPCSpeaker();

   if (!adjustAndCheck(GetPCSpeaker(), 5000) )
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
            ActionCastFakeSpellAtObject(SPELL_ACID_SPLASH, oPC);
            object oWeapon=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

            if (!GetIsObjectValid(oWeapon)) return;
            int nDur=DURATION_TYPE_INSTANT;
            effect e1=EffectVisualEffect(VFX_IMP_ACID_S);
            itemproperty ipAdd = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGEBONUS_2);
            itemproperty ipAddv = ItemPropertyVisualEffect(ITEM_VISUAL_SONIC);

            ActionDoCommand(ApplyEffectToObject(nDur, e1, oPC));
            DelayCommand(3.5, IPSafeAddItemProperty(oWeapon, ipAdd, RoundsToSeconds(20)));
            DelayCommand(3.5, IPSafeAddItemProperty(oWeapon, ipAddv, RoundsToSeconds(20)));

            DelayCommand(RoundsToSeconds(20), RemoveItemProperty (oWeapon, ipAdd));
            DelayCommand(RoundsToSeconds(20), RemoveItemProperty (oWeapon, ipAddv));
            DelayCommand(RoundsToSeconds(20), SetLocalInt (oPC, "wpgiven", FALSE));

        }
    }
}

