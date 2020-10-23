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
     if (GetLocalInt (oPC, "acgiven") == TRUE)
     {
     ActionPauseConversation();
     SpeakString ("Spell was already given", TALKVOLUME_TALK);
     }
     else if (GetLocalInt (oPC, "acgiven") == FALSE)
     {
     TakeGoldFromCreature (5000, oPC, TRUE);
     adjustAllowedMoney ( oPC, GetGold(oPC) - 5000 );
     SetLocalInt (oPC, "acgiven", TRUE);
     ActionCastFakeSpellAtObject(SPELL_EPIC_DRAGON_KNIGHT, oPC);

     int nDur=DURATION_TYPE_INSTANT;
//   effect e1=EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
     effect e2=EffectVisualEffect(VFX_DUR_PROT_EPIC_ARMOR);
     effect e3=EffectACIncrease(1, AC_DODGE_BONUS,AC_VS_DAMAGE_TYPE_ALL);
//   ActionDoCommand(ApplyEffectToObject(nDur, e1, oPC));
     DelayCommand(2.0, ApplyEffectToObject(nDur, e2, oPC));

     ApplyEffectToObject(DURATION_TYPE_INSTANT, e3, oPC, RoundsToSeconds(20));
     DelayCommand(RoundsToSeconds(20), RemoveEffect (oPC, e3));
     DelayCommand(RoundsToSeconds(20), SetLocalInt (oPC, "acgiven", FALSE));
     }
     }

}
